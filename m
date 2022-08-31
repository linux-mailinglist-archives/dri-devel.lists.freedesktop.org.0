Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC95A873F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 22:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831F410E1C7;
	Wed, 31 Aug 2022 20:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B97310E082;
 Wed, 31 Aug 2022 20:08:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74BA061957;
 Wed, 31 Aug 2022 20:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5457C433D6;
 Wed, 31 Aug 2022 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661976492;
 bh=zKMHNZ+XLBme4WkFy77n13v6pA/KXZ5Eql5mbdiwYIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLb7sXLuNwOZot0OZeBWG/0+l7IPTuYWZ3wBEg+BzhOwAA/0ZICj41rSVegYddNjv
 n42Mn2JRIyMPbLKqj3N4uO8pOqZJbV3ChRs+/dqGgs4KxenXScsNYhypbcVFj+rGE8
 AoBGY878hEQZwCF8o7USVP1MpLA5PI2UicNRTNbu3LsFwv2FozWXsRIyR1DhDuFPgW
 Hfwrl1TCvoWA68ZwccdQzWkXWv5l2dTksjFtdzHiWCDTmnN6Jd/M94lkIpbtbNxorI
 x6xXurY5CWW64KBR/AzYLLFgpPDUR7fMESwNCWjqTlmJwlVDfQpgllHJRWlXF/Veup
 BzsPHoHJjhXPQ==
Date: Wed, 31 Aug 2022 13:08:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 3/5] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
Message-ID: <Yw+/qjgveoN0q89t@dev-arch.thelio-3990X>
References: <20220831184408.2778264-1-ndesaulniers@google.com>
 <20220831184408.2778264-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831184408.2778264-4-ndesaulniers@google.com>
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
Cc: x86@kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Fangrui Song <maskray@google.com>,
 linux-kbuild@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Bill Wendling <morbo@google.com>,
 Greg Thelen <gthelen@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
 Alexey Alexandrov <aalexand@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 11:44:06AM -0700, Nick Desaulniers wrote:
> cc-ifversion is GCC specific. Replace it with compiler specific
> variants. Update the users of cc-ifversion to use these new macros.
> Provide a helper for checking compiler versions for GCC and Clang
> simultaneously, that will be used in a follow up patch.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/350
> Link: https://lore.kernel.org/llvm/CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com/
> Suggested-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

These are so much nicer. I find the name kind of awkward but the only
thing I could come up with that sounded better was 'gcc-is-at-least' or
'clang-is-at-least' and I don't really feel like painting sheds today,
it's hot outside :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Some comments below.

> ---
> Changes v1 -> v2:
> * New patch.
> 
>  Documentation/kbuild/makefiles.rst          | 44 +++++++++++++++------
>  Makefile                                    |  4 +-
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 12 ++----
>  scripts/Makefile.compiler                   | 15 +++++--
>  4 files changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 11a296e52d68..e46f5b45c422 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -682,22 +682,42 @@ more details, with real examples.
>  	In the above example, -Wno-unused-but-set-variable will be added to
>  	KBUILD_CFLAGS only if gcc really accepts it.
>  
> -    cc-ifversion
> -	cc-ifversion tests the version of $(CC) and equals the fourth parameter
> -	if version expression is true, or the fifth (if given) if the version
> -	expression is false.
> +    gcc-min-version
> +	gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater than
> +	or equal to the provided value and evaluates to y if so.
>  
>  	Example::
>  
> -		#fs/reiserfs/Makefile
> -		ccflags-y := $(call cc-ifversion, -lt, 0402, -O1)
> +		cflags-$(call gcc-min-version, 70100) := -foo
>  
> -	In this example, ccflags-y will be assigned the value -O1 if the
> -	$(CC) version is less than 4.2.
> -	cc-ifversion takes all the shell operators:
> -	-eq, -ne, -lt, -le, -gt, and -ge
> -	The third parameter may be a text as in this example, but it may also
> -	be an expanded variable or a macro.
> +	In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
> +	$(CONFIG_GCC_VERSION) is >= 7.1.
> +
> +    clang-min-version
> +	clang-min-version tests if the value of $(CONFIG_CLANG_VERSION) is greater
> +	than or equal to the provided value and evaluates to y if so.
> +
> +	Example::
> +
> +		cflags-$(call clang-min-version, 110000) := -foo
> +
> +	In this example, cflags-y will be assigned the value -foo if $(CC) is clang
> +	and $(CONFIG_CLANG_VERSION) is >= 11.0.0.
> +
> +    cc-min-version
> +	cc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater
> +	than or equal to the first value provided, or if the value of
> +	$(CONFIG_CLANG_VERSION) is greater than or equal to the second value
> +	provided, and evaluates
> +	to y if so.
> +
> +	Example::
> +
> +		cflags-$(call cc-min-version, 70100, 110000) := -foo
> +
> +	In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
> +	$(CONFIG_GCC_VERSION) is >= 7.1, or if $(CC) is clang and
> +	$(CONFIG_CLANG_VERSION) is >= 11.0.0.
>  
>      cc-cross-prefix
>  	cc-cross-prefix is used to check if there exists a $(CC) in path with
> diff --git a/Makefile b/Makefile
> index 952d354069a4..caa39ecb1136 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -972,7 +972,7 @@ ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS += -Wno-maybe-uninitialized
>  endif
>  
> -ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call gcc-min-version, 90100),y)
>  # The allocators already balk at large sizes, so silence the compiler
>  # warnings for bounds checks involving those possible values. While
>  # -Wno-alloc-size-larger-than would normally be used here, earlier versions
> @@ -984,7 +984,7 @@ ifdef CONFIG_CC_IS_GCC
>  # ignored, continuing to default to PTRDIFF_MAX. So, left with no other
>  # choice, we must perform a versioned check to disable this warning.
>  # https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
> -KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
> +KBUILD_CFLAGS += -Wno-alloc-size-larger-than
>  endif

It might be interesting to move this up to where KBUILD_CFLAGS-y is used
to make it:

  KBUILD_CFLAGS-$(call gcc-min-version, 90100) += -Wno-alloc-size-larger-than

But the comment would have to come with so it probably isn't worth
doing. Just throwing it out as an observation.

>  
>  # disable invalid "can't wrap" optimizations for signed / pointers
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 86a3b5bfd699..d8ee4743b2e3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -33,20 +33,14 @@ ifdef CONFIG_PPC64
>  dml_ccflags := -mhard-float -maltivec
>  endif
>  
> -ifdef CONFIG_CC_IS_GCC
> -ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> -IS_OLD_GCC = 1
> -endif
> -endif
> -
>  ifdef CONFIG_X86
> -ifdef IS_OLD_GCC
> +ifeq ($(call gcc-min-version, 70100),y)
> +dml_ccflags += -msse2

I think you just dropped '-msse2' for clang.

I guess this wants to be:

  ifeq ($(call cc-min-version, 70100, 110000),y)

but it kind of feels bad to hardcode the kernel's minimum supported
version of clang somewhere that is not super easy to grep for when we
upgrade it (I guess I'll add cc-min-version to my list of things to look
for, in addition to the Kconfig variables). Perhaps we should codify it
in a place that can be used within make (using
'scripts/min-tool-version.sh' even) so that we could do something like:

  ifeq ($(call cc-min-version, 70100, $(MIN_CLANG_VERSION)),y)

Up to you though.

> +else
>  # Stack alignment mismatch, proceed with caution.
>  # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
>  # (8B stack alignment).
>  dml_ccflags += -mpreferred-stack-boundary=4
> -else
> -dml_ccflags += -msse2
>  endif
>  endif
>  
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index d1739f0d3ce3..13dade724fa3 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -61,9 +61,18 @@ cc-option-yn = $(call try-run,\
>  cc-disable-warning = $(call try-run,\
>  	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>  
> -# cc-ifversion
> -# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
> -cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
> +# gcc-min-version
> +# Usage: cflags-$(call gcc-min-version, 70100) += -foo
> +gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo y)
> +
> +# clang-min-version
> +# Usage: cflags-$(call clang-min-version, 110000) += -foo
> +clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && echo y)
> +
> +# cc-min-version
> +# Usage: cflags-$(call cc-min-version, 701000, 110000)
> +#                                      ^ GCC   ^ Clang
> +cc-min-version = $(filter y, $(call gcc-min-version, $(1)), $(call clang-min-version, $(2)))
>  
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
> -- 
> 2.37.2.672.g94769d06f0-goog
> 
