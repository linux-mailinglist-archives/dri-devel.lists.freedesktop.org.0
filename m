Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506DC4C6B0E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1010E495;
	Mon, 28 Feb 2022 11:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Mon, 28 Feb 2022 00:19:35 UTC
Received: from mail.stoffel.org (li1843-175.members.linode.com
 [172.104.24.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819E310E1F1;
 Mon, 28 Feb 2022 00:19:35 +0000 (UTC)
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
 [68.116.170.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id 989E32708E;
 Sun, 27 Feb 2022 19:14:17 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id DBCDDA7992; Sun, 27 Feb 2022 19:14:16 -0500 (EST)
Date: Sun, 27 Feb 2022 19:14:16 -0500
From: John Stoffel <john@quad.stoffel.home>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
Message-ID: <YhwT2Gw8vsQHPxAB@quad.stoffel.home>
References: <20220227215408.3180023-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220227215408.3180023-1-arnd@kernel.org>
X-Mailman-Approved-At: Mon, 28 Feb 2022 11:45:00 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, Alex Shi <alexs@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 intel-gfx@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, linux-kbuild@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 27, 2022 at 10:52:43PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.
> 
> An earlier attempt to do this when gcc-5 started defaulting to
> -std=gnu11 failed because at the time that caused warnings about
> designated initializers with older compilers. Now that gcc-5.1 is the
> minimum compiler version used for building kernels, that is no longer a
> concern. Similarly, the behavior of 'inline' functions changes between
> gnu89 and gnu89, but this was taken care of by defining 'inline' to

Typo here?  Second one should be gnu99 right?
     
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
> 
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the
> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.
> 
> Nathan Chancellor reported an additional -Wdeclaration-after-statement
> warning that appears in a system header on arm, this still needs a
> workaround.
> 
> Since the differences between gnu99, gnu11 and gnu17 are fairly minimal
> and mainly impact warnings at the -Wpedantic level that the kernel
> never enables, the easiest way is to just leave out the -std=gnu89
> argument entirely, and rely on the compiler default language setting,
> which is gnu11 for gcc-5, and gnu1x/gnu17 for all other supported
> versions of gcc or clang.
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I put the suggestion into patch form, based on what we discussed
> in the thread.  I only gave it minimal testing, but it would
> be good to have it in linux-next if we want to do this in the
> merge window.
> ---
>  Documentation/process/programming-language.rst             | 4 ++--
>  .../translations/it_IT/process/programming-language.rst    | 4 ++--
>  .../translations/zh_CN/process/programming-language.rst    | 4 ++--
>  .../translations/zh_TW/process/programming-language.rst    | 4 ++--
>  Makefile                                                   | 7 +++----
>  arch/arm64/kernel/vdso32/Makefile                          | 3 +--
>  drivers/gpu/drm/i915/Makefile                              | 1 +
>  drivers/staging/greybus/tools/Makefile                     | 3 ++-
>  fs/btrfs/Makefile                                          | 1 +
>  scripts/Makefile.extrawarn                                 | 1 +
>  10 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
> index ec474a70a02f..894f2a6eb9db 100644
> --- a/Documentation/process/programming-language.rst
> +++ b/Documentation/process/programming-language.rst
> @@ -5,8 +5,8 @@ Programming Language
>  
>  The kernel is written in the C programming language [c-language]_.
>  More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
> -under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
> -(including some C99 features). ``clang`` [clang]_ is also supported, see
> +under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11
> +(including some C17 features). ``clang`` [clang]_ is also supported, see
>  docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
>  
>  This dialect contains many extensions to the language [gnu-extensions]_,
> diff --git a/Documentation/translations/it_IT/process/programming-language.rst b/Documentation/translations/it_IT/process/programming-language.rst
> index 41db2598ce11..aa21097737ae 100644
> --- a/Documentation/translations/it_IT/process/programming-language.rst
> +++ b/Documentation/translations/it_IT/process/programming-language.rst
> @@ -10,8 +10,8 @@ Linguaggio di programmazione
>  
>  Il kernel è scritto nel linguaggio di programmazione C [it-c-language]_.
>  Più precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ usando
> -l'opzione ``-std=gnu89`` [it-gcc-c-dialect-options]_: il dialetto GNU
> -dello standard ISO C90 (con l'aggiunta di alcune funzionalità da C99).
> +l'opzione ``-std=gnu11`` [it-gcc-c-dialect-options]_: il dialetto GNU
> +dello standard ISO C11 (con l'aggiunta di alcune funzionalità da C17).
>  Linux supporta anche ``clang`` [it-clang]_, leggete la documentazione
>  :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
>  
> diff --git a/Documentation/translations/zh_CN/process/programming-language.rst b/Documentation/translations/zh_CN/process/programming-language.rst
> index 2a47a1d2ec20..58d2b3bd2d85 100644
> --- a/Documentation/translations/zh_CN/process/programming-language.rst
> +++ b/Documentation/translations/zh_CN/process/programming-language.rst
> @@ -9,8 +9,8 @@
>  ============
>  
>  内核是用C语言 :ref:`c-language <cn_c-language>` 编写的。更准确地说，内核通常是用 :ref:`gcc <cn_gcc>`
> -在 ``-std=gnu89`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect-options>` 下编译的：ISO C90的 GNU 方言（
> -包括一些C99特性）
> +在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect-options>` 下编译的：ISO C11的 GNU 方言（
> +包括一些C17特性）
>  
>  这种方言包含对语言 :ref:`gnu-extensions <cn_gnu-extensions>` 的许多扩展，当然，它们许多都在内核中使用。
>  
> diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
> index 54e3699eadf8..235de05f7e2c 100644
> --- a/Documentation/translations/zh_TW/process/programming-language.rst
> +++ b/Documentation/translations/zh_TW/process/programming-language.rst
> @@ -12,8 +12,8 @@
>  ============
>  
>  內核是用C語言 :ref:`c-language <tw_c-language>` 編寫的。更準確地說，內核通常是用 :ref:`gcc <tw_gcc>`
> -在 ``-std=gnu89`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect-options>` 下編譯的：ISO C90的 GNU 方言（
> -包括一些C99特性）
> +在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <tw_gcc-c-dialect-options>` 下編譯的：ISO C11的 GNU 方言（
> +包括一些C17特性）
>  
>  這種方言包含對語言 :ref:`gnu-extensions <tw_gnu-extensions>` 的許多擴展，當然，它們許多都在內核中使用。
>  
> diff --git a/Makefile b/Makefile
> index 289ce2be8032..3ff6ba766f02 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,7 @@ HOSTCXX	= g++
>  endif
>  
>  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> -			      -O2 -fomit-frame-pointer -std=gnu89
> +			      -O2 -fomit-frame-pointer
>  export KBUILD_USERLDFLAGS :=
>  
>  KBUILD_HOSTCFLAGS   := $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
> @@ -514,8 +514,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
>  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>  		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
>  		   -Werror=implicit-function-declaration -Werror=implicit-int \
> -		   -Werror=return-type -Wno-format-security \
> -		   -std=gnu89
> +		   -Werror=return-type -Wno-format-security
>  KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_AFLAGS_KERNEL :=
>  KBUILD_CFLAGS_KERNEL :=
> @@ -782,7 +781,7 @@ KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
>  
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CPPFLAGS += -Qunused-arguments
> -# The kernel builds with '-std=gnu89' so use of GNU extensions is acceptable.
> +# The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
>  KBUILD_CFLAGS += -Wno-gnu
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 6c01b63ff56d..3250d0e25782 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -67,8 +67,7 @@ VDSO_CFLAGS += -DENABLE_COMPAT_VDSO=1
>  VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                 -fno-strict-aliasing -fno-common \
>                 -Werror-implicit-function-declaration \
> -               -Wno-format-security \
> -               -std=gnu89
> +               -Wno-format-security
>  VDSO_CFLAGS  += -O2
>  # Some useful compiler-dependent flags from top-level Makefile
>  VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 1b62b9f65196..1618a6e0af4e 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -17,6 +17,7 @@ subdir-ccflags-y += -Wno-unused-parameter
>  subdir-ccflags-y += -Wno-type-limits
>  subdir-ccflags-y += -Wno-missing-field-initializers
>  subdir-ccflags-y += -Wno-sign-compare
> +subdir-ccflags-y += -Wno-shift-negative-value
>  subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
>  subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
> diff --git a/drivers/staging/greybus/tools/Makefile b/drivers/staging/greybus/tools/Makefile
> index ad0ae8053b79..a3bbd73171f2 100644
> --- a/drivers/staging/greybus/tools/Makefile
> +++ b/drivers/staging/greybus/tools/Makefile
> @@ -12,7 +12,8 @@ CFLAGS	+= -std=gnu99 -Wall -Wextra -g \
>  	    -Wredundant-decls \
>  	    -Wcast-align \
>  	    -Wsign-compare \
> -	    -Wno-missing-field-initializers
> +	    -Wno-missing-field-initializers \
> +	    -Wno-shift-negative-value
>  
>  CC	:= $(CROSS_COMPILE)gcc
>  
> diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
> index 4188ba3fd8c3..99f9995670ea 100644
> --- a/fs/btrfs/Makefile
> +++ b/fs/btrfs/Makefile
> @@ -17,6 +17,7 @@ subdir-ccflags-y += $(condflags)
>  subdir-ccflags-y += -Wno-missing-field-initializers
>  subdir-ccflags-y += -Wno-sign-compare
>  subdir-ccflags-y += -Wno-type-limits
> +subdir-ccflags-y += -Wno-shift-negative-value
>  
>  obj-$(CONFIG_BTRFS_FS) := btrfs.o
>  
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 8be892887d71..650d0b8ceec3 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -36,6 +36,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
>  KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-type-limits
> +KBUILD_CFLAGS += -Wno-shift-negative-value
>  
>  KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
>  
> -- 
> 2.29.2
> 

-- 
