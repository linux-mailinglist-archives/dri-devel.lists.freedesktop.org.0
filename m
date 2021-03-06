Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB632FC1A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 17:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04BB6E05F;
	Sat,  6 Mar 2021 16:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD3F6E05F
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 16:56:41 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id l7so4382231pfd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 08:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWTQVKJ7MLuFjzDm8HZtp17M5CbLCLwXZnm29fINaOE=;
 b=M2oeBFgwI2gTJzwhA5kgbXN2e/dioqWIiYPjzmzCcsFFnaxtQzqW+WSKtsrTeDNJ5W
 +TT7DOUKTQOSH4S+D+de2SSWRiuj9FH5U+9taKepkBZRk63hwZUk+A5FzYjnLnVs1K+L
 G57/Y+ztskPkjRkSbwDMqTfdmNk8/SMFf9V2/loLPv6b+U7N3d6LfqIQLgfjvn6P3Fcx
 0+NEVxJLrQrlj/xcU5i+dEv7eFQitrCBhCk6ascYwBD8P/DCrd06sBTgNxvctjMcuEAw
 DtChil61PipNhPoKmN1sSo+JRigvmP2oHUp+PvYhTyEt7yLG+nMMpe4PSWbUFNDtIbS9
 gj6Q==
X-Gm-Message-State: AOAM532o+62Z/HdRtHwuqMP3F+Iq0eOOaQjhAs9OPHHCaDPqpjuWEnQv
 E6I+U26AEt1cSM4LkYGJoPFtwobTUZbavwTfJtymZ5N/pqmXgw==
X-Google-Smtp-Source: ABdhPJz1hMxaehUSy/RIRVXdxsT98GOgatSKcyf3Z7i3vI/T9eIev+77G4Z5k+gvyU58kvGZuAIiy1UOJzKi8efgT0A=
X-Received: by 2002:a65:524b:: with SMTP id q11mr13281838pgp.207.1615049800980; 
 Sat, 06 Mar 2021 08:56:40 -0800 (PST)
MIME-Version: 1.0
References: <f9700ce86b6d893a162c099fb680cc0f@nuetzel-hh.de>
In-Reply-To: <f9700ce86b6d893a162c099fb680cc0f@nuetzel-hh.de>
From: Jan Vesely <jan.vesely@rutgers.edu>
Date: Sat, 6 Mar 2021 11:56:30 -0500
Message-ID: <CABE_ZV3KwwOdsF40K8CuMNtg=1RYvst3iEp=rxQWPbOD1sXnJg@mail.gmail.com>
Subject: Re: Is LLVM 13 (git) really ready for testing/development? libclc
 didn't compile
To: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, DRI Devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0998630001=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0998630001==
Content-Type: multipart/alternative; boundary="000000000000aee30b05bce115eb"

--000000000000aee30b05bce115eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not Marek, but hope this answer will help.
libclc uses clang CLC preprocessor on .ll files, llvm/clang-13 started
including clc declarations by default (clang
cf3ef15a6ec5e5b45c6c54e8fbe3769255e815ce),
thus corrupting any .ll assembly files that are used by libclc.
Inclusion of the default declarations can be turned off using a cmdline
switch but that remains to be implemented in the libclc build system.
manually adding '-cl-no-stdinc' should work as a workaround.

Jan


On Thu, Mar 4, 2021 at 10:27 PM Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> w=
rote:

> Hello Marek,
>
> can't compile anything, here.
> Poor Intel Nehalem X3470.
>
> Trying LLVM 12-rc2 later.
>
> Greetings,
> Dieter
>
> llvm-project/libclc> cd build && cmake ../
> -- The CXX compiler identification is GNU 10.2.1
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Check for working CXX compiler: /usr/bin/c++ - skipped
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> LLVM version: 13.0.0git
> LLVM system libs:
> LLVM libs: -lLLVM-13git
> LLVM libdir: /usr/local/lib
> LLVM bindir: /usr/local/bin
> LLVM ld flags: -L/usr/local/lib
> LLVM cxx flags:
>
> -I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__STD=
C_CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti;-f=
no-exceptions
>
> clang: /usr/local/bin/clang
> llvm-as: /usr/local/bin/llvm-as
> llvm-link: /usr/local/bin/llvm-link
> opt: /usr/local/bin/opt
> llvm-spirv: /usr/local/bin/llvm-spirv
>
> -- Check for working CLC compiler: /usr/local/bin/clang
> -- Check for working CLC compiler: /usr/local/bin/clang -- works
> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as
> -- Check for working LLAsm compiler: /usr/local/bin/llvm-as -- broken
> CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):
>    The LLAsm compiler "/usr/local/bin/llvm-as" is not able to compile a
> simple
>    test program.
>
>    It fails with the following output:
>
>     Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
>
>
>
>    Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast && /usr/bin/gmake
> -f
>    CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir/build
>
>    gmake[1]: Verzeichnis
>    =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird betreten
>
>    Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>
>    /usr/local/bin/clang -E -P -x cl
>
> /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll
> -o
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>
>    /usr/local/bin/llvm-as -o
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
>
>    /usr/local/bin/llvm-as:
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error:
> expected
>    top-level entity
>
>    typedef unsigned char uchar;
>
>    ^
>
>    gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
>    CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
>
>    gmake[1]: Verzeichnis
>    =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C w=
ird verlassen
>
>    gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
>
>
>
>
>
>
>
>    CMake will not be able to correctly generate this project.
> Call Stack (most recent call first):
>    CMakeLists.txt:127 (enable_language)
>
>
> -- Configuring incomplete, errors occurred!
> See also "/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log".
> See also "/opt/llvm-project/libclc/build/CMakeFiles/CMakeError.log".
>
>
> CMakeError.log
> Determining if the LLAsm compiler works failed with the following
> output:
> Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp
>
> Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast && /usr/bin/gmake
> -f CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir/build
> gmake[1]: Verzeichnis
> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird=
 betreten
> Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> /usr/local/bin/clang -E -P     -x cl
> /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll
> -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> /usr/local/bin/llvm-as -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp
> /usr/local/bin/llvm-as:
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error: expected
> top-level entity
> typedef unsigned char uchar;
> ^
> gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:
> CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1
> gmake[1]: Verzeichnis
> =E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird=
 verlassen
> gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000aee30b05bce115eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not Marek, but hope this answer will help.<br>libclc =
uses clang CLC preprocessor on .ll files, llvm/clang-13 started including c=
lc declarations by default (clang cf3ef15a6ec5e5b45c6c54e8fbe3769255e815ce)=
,</div><div>thus corrupting any .ll assembly files that are used by libclc.=
</div><div>Inclusion of the default declarations can be turned off using a =
cmdline switch but that remains to be implemented=C2=A0in the libclc build =
system.<br>manually adding &#39;-cl-no-stdinc&#39; should work as a workaro=
und.</div><div><br></div><div>Jan<br><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 4, 2021 at 10:27 PM Di=
eter N=C3=BCtzel &lt;<a href=3D"mailto:Dieter@nuetzel-hh.de" target=3D"_bla=
nk">Dieter@nuetzel-hh.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hello Marek,<br>
<br>
can&#39;t compile anything, here.<br>
Poor Intel Nehalem X3470.<br>
<br>
Trying LLVM 12-rc2 later.<br>
<br>
Greetings,<br>
Dieter<br>
<br>
llvm-project/libclc&gt; cd build &amp;&amp; cmake ../<br>
-- The CXX compiler identification is GNU 10.2.1<br>
-- Detecting CXX compiler ABI info<br>
-- Detecting CXX compiler ABI info - done<br>
-- Check for working CXX compiler: /usr/bin/c++ - skipped<br>
-- Detecting CXX compile features<br>
-- Detecting CXX compile features - done<br>
LLVM version: 13.0.0git<br>
LLVM system libs:<br>
LLVM libs: -lLLVM-13git<br>
LLVM libdir: /usr/local/lib<br>
LLVM bindir: /usr/local/bin<br>
LLVM ld flags: -L/usr/local/lib<br>
LLVM cxx flags: <br>
-I/usr/local/include;-std=3Dc++14;;;-fno-exceptions;-D_GNU_SOURCE;-D__STDC_=
CONSTANT_MACROS;-D__STDC_FORMAT_MACROS;-D__STDC_LIMIT_MACROS;-fno-rtti;-fno=
-exceptions<br>
<br>
clang: /usr/local/bin/clang<br>
llvm-as: /usr/local/bin/llvm-as<br>
llvm-link: /usr/local/bin/llvm-link<br>
opt: /usr/local/bin/opt<br>
llvm-spirv: /usr/local/bin/llvm-spirv<br>
<br>
-- Check for working CLC compiler: /usr/local/bin/clang<br>
-- Check for working CLC compiler: /usr/local/bin/clang -- works<br>
-- Check for working LLAsm compiler: /usr/local/bin/llvm-as<br>
-- Check for working LLAsm compiler: /usr/local/bin/llvm-as -- broken<br>
CMake Error at cmake/CMakeTestLLAsmCompiler.cmake:40 (message):<br>
=C2=A0 =C2=A0The LLAsm compiler &quot;/usr/local/bin/llvm-as&quot; is not a=
ble to compile a <br>
simple<br>
=C2=A0 =C2=A0test program.<br>
<br>
=C2=A0 =C2=A0It fails with the following output:<br>
<br>
=C2=A0 =C2=A0 Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTm=
p<br>
<br>
<br>
<br>
=C2=A0 =C2=A0Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &amp;&amp;=
 /usr/bin/gmake <br>
-f<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir=
/build<br>
<br>
=C2=A0 =C2=A0gmake[1]: Verzeichnis<br>
=C2=A0 =C2=A0=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=
=80=9C wird betreten<br>
<br>
=C2=A0 =C2=A0Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompi=
ler.bc<br>
<br>
=C2=A0 =C2=A0/usr/local/bin/clang -E -P -x cl<br>
<br>
/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll <br=
>
-o<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
<br>
=C2=A0 =C2=A0/usr/local/bin/llvm-as -o <br>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
<br>
=C2=A0 =C2=A0/usr/local/bin/llvm-as:<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error=
: <br>
expected<br>
=C2=A0 =C2=A0top-level entity<br>
<br>
=C2=A0 =C2=A0typedef unsigned char uchar;<br>
<br>
=C2=A0 =C2=A0^<br>
<br>
=C2=A0 =C2=A0gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86:<br>
=C2=A0 =C2=A0CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1<br>
<br>
=C2=A0 =C2=A0gmake[1]: Verzeichnis<br>
=C2=A0 =C2=A0=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=
=80=9C wird verlassen<br>
<br>
=C2=A0 =C2=A0gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0CMake will not be able to correctly generate this project.<br>
Call Stack (most recent call first):<br>
=C2=A0 =C2=A0CMakeLists.txt:127 (enable_language)<br>
<br>
<br>
-- Configuring incomplete, errors occurred!<br>
See also &quot;/opt/llvm-project/libclc/build/CMakeFiles/CMakeOutput.log&qu=
ot;.<br>
See also &quot;/opt/llvm-project/libclc/build/CMakeFiles/CMakeError.log&quo=
t;.<br>
<br>
<br>
CMakeError.log<br>
Determining if the LLAsm compiler works failed with the following <br>
output:<br>
Change Dir: /opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp<br>
<br>
Run Build Command(s):/usr/bin/gmake cmTC_87af9/fast &amp;&amp; /usr/bin/gma=
ke=C2=A0 <br>
-f CMakeFiles/cmTC_87af9.dir/build.make CMakeFiles/cmTC_87af9.dir/build<br>
gmake[1]: Verzeichnis <br>
=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird b=
etreten<br>
Building LLAsm object CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc<br>
/usr/local/bin/clang -E -P=C2=A0 =C2=A0 =C2=A0-x cl <br>
/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp/testLLAsmCompiler.ll <br=
>
-o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
/usr/local/bin/llvm-as -o CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc <b=
r>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp<br>
/usr/local/bin/llvm-as: <br>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc.temp:1:1: error: expected <b=
r>
top-level entity<br>
typedef unsigned char uchar;<br>
^<br>
gmake[1]: *** [CMakeFiles/cmTC_87af9.dir/build.make:86: <br>
CMakeFiles/cmTC_87af9.dir/testLLAsmCompiler.bc] Fehler 1<br>
gmake[1]: Verzeichnis <br>
=E2=80=9E/opt/llvm-project/libclc/build/CMakeFiles/CMakeTmp=E2=80=9C wird v=
erlassen<br>
gmake: *** [Makefile:140: cmTC_87af9/fast] Fehler 2<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div></div>

--000000000000aee30b05bce115eb--

--===============0998630001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0998630001==--
