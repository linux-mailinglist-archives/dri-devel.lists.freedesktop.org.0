Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FBD6C57C4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20310E102;
	Wed, 22 Mar 2023 20:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79DA10E102
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:36:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97EF2B81DDA;
 Wed, 22 Mar 2023 20:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F4DC433D2;
 Wed, 22 Mar 2023 20:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679517362;
 bh=hE2w4AlCqCQiTuP+k7QtxIGexqc4E4HzGht5f7pSXto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fDOSKjSIElrDPJuw6V2b2pglkrc/0ueVTVDsGM6sjNnd/PEuyhyJb1T6RtmV1aHqw
 SIMoOiO6x65Ses4hsJQZF94mB6hA7ICejIHxunue3Z85uEVWnrhGzOxUThl2h/doRC
 5oheGbKWN+MG3tF6qkvUdB50x9TLnvfL0nZGwVHRKP2bkaxMHkNP3C9EZaMLyiXs7R
 gp417KrBcHyxqrIzwCWjHRTbVTnHWbai2lB29mDvmZgyIbrbygElvVJUDTShIvS53c
 vHMb8rlRuy2Ln1AVBPCfxuFK8iEG3e0+0gMFUrxdvrOXc6UDSTuTp6TUE5tub1nwJj
 88QkxWs2wLYAQ==
Date: Wed, 22 Mar 2023 13:36:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <20230322203600.GA2837284@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <20230322163637.GA918620@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322163637.GA918620@dev-arch.thelio-3990X>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 09:36:37AM -0700, Nathan Chancellor wrote:
> On Wed, Mar 22, 2023 at 02:44:47PM +0200, Kalle Valo wrote:
> > Nathan Chancellor <nathan@kernel.org> writes:
> > 
> > > On Mon, Mar 20, 2023 at 11:26:17AM -0700, Linus Torvalds wrote:
> > >> On Mon, Mar 20, 2023 at 11:05 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >> >
> > >> > On the clang front, I am still seeing the following warning turned error
> > >> > for arm64 allmodconfig at least:
> > >> >
> > >> >   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> > >> >           if (syncpt_irq < 0)
> > >> >               ^~~~~~~~~~
> > >> 
> > >> Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> > >> that gcc doesn't warn about this.
> > >
> > > Perhaps these would make doing allmodconfig builds with clang more
> > > frequently less painful for you?
> > >
> > > https://lore.kernel.org/llvm/20230319235619.GA18547@dev-arch.thelio-3990X/
> > 
> > Thank you, at least for me this is really helpful.
> 
> Really glad to hear! I hope this helps make testing and verifying
> changes with clang and LLVM easier for developers and maintainers.
> 
> > I tried now clang for the first time but seeing a strange problem.
> > 
> > I prefer to define the compiler in GNUmakefile so it's easy to change
> > compilers and I don't need to remember the exact command line. So I have
> > this in the top level GNUmakefile (all the rest commented out):
> > 
> > LLVM=/opt/clang/llvm-16.0.0/bin/
> > 
> > If I run 'make oldconfig' it seems to use clang but after I run just
> > 'make' it seems to switch back to the host GCC compiler and ask for GCC
> > specific config questions again. Workaround for this seems to be adding
> > 'export LLVM' to GNUmakefile, after that also 'make' uses clang as
> > expected.
> 
> Interesting... I just tested with a basic GNUmakefile and everything
> seems to work fine without an export. At the same time, the export
> should not hurt anything, so as long as it works, that is what matters.

Ah, the export is needed so that mixed-build works properly (see lines
324 to 361 in Makefile), as 'make' will be called to process each target
individually; without the export, LLVM is not set for the subsequent
'make' calls, so gcc is called. I just saw the same behavior as you did
while testing with

  $ make -j(nproc) clean defconfig all

without the export (GCC was used instead of LLVM).

>     $ gcc --version
>     fish: Unknown command: gcc
> 
> 
>     $ fd -t x . $CBL_TC_LLVM_STORE/16.0.0/bin -x basename
>     clang-16
>     llvm-nm
>     llvm-objdump
>     llvm-objcopy
>     llvm-symbolizer
>     llvm-strings
>     llvm-readobj
>     llvm-dwarfdump
>     lld
>     llvm-ar
> 
> 
>     $ cat GNUmakefile
>     LLVM := $(CBL_TC_LLVM_STORE)/16.0.0/bin/
> 
>     include Makefile
> 
> 
>     $ make -sj(nproc) defconfig
> 
> 
>     $ head -13 .config
>     #
>     # Automatically generated file; DO NOT EDIT.
>     # Linux/x86 6.3.0-rc3 Kernel Configuration
>     #
>     CONFIG_CC_VERSION_TEXT="ClangBuiltLinux clang version 16.0.0"
>     CONFIG_GCC_VERSION=0
>     CONFIG_CC_IS_CLANG=y
>     CONFIG_CLANG_VERSION=160000
>     CONFIG_AS_IS_LLVM=y
>     CONFIG_AS_VERSION=160000
>     CONFIG_LD_VERSION=0
>     CONFIG_LD_IS_LLD=y
>     CONFIG_LLD_VERSION=160000
> 
> 
>     $ make -sj(nproc) init/main.o
> 
> 
>     $ $CBL_TC_LLVM_STORE/16.0.0/bin/llvm-readelf -p .comment init/main.o
>     String dump of section '.comment':
>     [     1] ClangBuiltLinux clang version 16.0.0
> 
> 
> I added an informational print and I always saw the correct value:
> 
> diff --git a/Makefile b/Makefile
> index a2c310df2145..070394c4cb8c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -431,6 +431,7 @@ HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>  
>  ifneq ($(LLVM),)
> +$(info LLVM: $(LLVM))
>  ifneq ($(filter %/,$(LLVM)),)
>  LLVM_PREFIX := $(LLVM)
>  else ifneq ($(filter -%,$(LLVM)),)
> 
> If you have any further issues, please do not hesitate to reach out!
> 
> Cheers,
> Nathan
> 
