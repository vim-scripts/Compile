" Compile: Vim global plugin for easyly compile a program
" Last Change:  2011 Fev 21
" Maintainer:   Maycon Sambinelli <msambinelli@gmail.org>
" License:      This file is placed in the public domain.

function! Defaults()
    let s:dic = {}

    let s:dic['c'] = "gcc -ggdb -Wall " .  expand("%") . " -o " . expand("%<") 
    let s:dic['cpp'] = "g++ -ggdb -Wall " .  expand("%") . " -o " . expand("%<")
    let s:dic['vim'] =  "souce %"

    return s:dic
endfunction

function! Compile()
    let s:defaults = Defaults()

    let s:extension = expand("%:e")

    if !exists('b:ccommand')
        if has_key(s:defaults, s:extension)
            let b:ccommand = s:defaults[s:extension]
        else
            let b:ccommand = "make"
        endif
    endif

    echohl Question
    let b:ccommand = input("compile: ", b:ccommand)
    echohl None
    exec "!" . b:ccommand 
endfunction

command! -nargs=0 Compile :call Compile()

map <C-c>c <esc>:Compile<cr>
