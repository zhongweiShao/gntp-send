bin/gntp-send : objs/gntp-send.o lib/libgrowl.a
	gcc $^ -o $@

lib/libgrowl.a  : objs/growl.o objs/tcp.o  objs/md5.o
	ar rc $@ $^
	ranlib $@	

objs/growl.o : source/growl.c
	gcc -I headers -Wall -Wno-format-zero-length -c $< -o $@

objs/tcp.o : source/tcp.c
	gcc -I headers -Wall -c $< -o $@

objs/md5.o : source/md5.c
	gcc -I headers -Wall -c $< -o $@

objs/gntp-send.o : source/gntp-send.c
	gcc -I headers -Wall -c $< -o $@

clean : 
	rm -f bin/* objs/* lib/*
