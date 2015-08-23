if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
syntax on
set nocompatible                " be iMproved
filetype off                    " required!

" bufExplorer
" 打开多个文件时，左边的文件状态栏
"let g:bufExplorerSplitBelow=1
"let g:bufExplorerSortBy='name'
"let g:bufExplorerSplitHorzSize=12
"let g:bufExplorerUseCurrentWindow=1
"let g:bufExplorerSplitOutPathName=0

" add for minibufexploer
" 如果打开多个文件，最上面会有一个显示多个文件的状态栏
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" editor format
set autoindent
set tabstop=4
set shiftwidth=4
set backspace=2
set incsearch
set ruler
"for tab repeace with space 
set expandtab

" nmap taglist
nmap <silent> <F8> <ESC>:Tlist<RETURN>
nmap <silent> <F5> <ESC>:TlistUpdate<RETURN>

"把F7映射成插入时间的快捷键
imap <F7> <c-r>=strftime("%Y-%m-%d %H:%M:%S yangkun")<cr>
" ctags & cscope options
set tags=./tags,tags
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
" key mappings for cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :cw<CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :cw<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :cw<CR>

" nmap taglist
nmap <silent> <F8> <ESC>:Tlist<RETURN>
nmap <silent> <F5> <ESC>:TlistUpdate<RETURN>
" taglist options
let Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window=0
let Tlist_File_Fold_Auto_Close=1

"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
"
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'
"20150824 add taglist and minibufexpl左边和上边显示状态
Bundle 'vim-scripts/taglist.vim'
Bundle 'fholgado/minibufexpl.vim'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on

"let g:ycm_global_ycm_extra_conf = 'your path to .ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '/home/xy/works/svfs/src'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" for ycm
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
