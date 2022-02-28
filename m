Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A003D4C67E2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650D410E3A5;
	Mon, 28 Feb 2022 10:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C083F10E39A;
 Mon, 28 Feb 2022 10:50:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 257A460A21;
 Mon, 28 Feb 2022 10:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EF1C340E7;
 Mon, 28 Feb 2022 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646045447;
 bh=RGxEAwdzbR9egvtFInpa3m0a3G+1maC22+8uUJecp+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2mr4o0ihvx67u6tNw0ZQeK8ySDxIIZCnqC4Ex4voBp9cJOAwzLtVgodPoUWwqQh6K
 Pq2Eo6lAjCsN1L0eP39op+X0xNeqTqIOQPRIGAml0Xcl7auXm21Ibxjj/AduI8S862
 87O8cic3X/60Za8DC5rd0XOSXhsp77pYqumwDpDM=
Date: Mon, 28 Feb 2022 11:50:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
Message-ID: <YhypAxDfWpDhPUbc@kroah.com>
References: <20220228103142.3301082-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
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

On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
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
> gnu89 and gnu11, but this was taken care of by defining 'inline' to
> include __attribute__((gnu_inline)) in order to allow building with
> clang a while ago.
> 
> One minor issue that remains is an added gcc warning for shifts of
> negative integers when building with -Werror, which happens with the
> 'make W=1' option, as well as for three drivers in the kernel that always
> enable -Werror, but it was only observed with the i915 driver so far.
> To be on the safe side, add -Wno-shift-negative-value to any -Wextra
> in a Makefile.
> 
> Nathan Chancellor reported an additional -Wdeclaration-after-statement
> warning that appears in a system header on arm, this still needs a
> workaround.
> 
> The differences between gnu99, gnu11, gnu1x and gnu17 are fairly
> minimal and mainly impact warnings at the -Wpedantic level that the
> kernel never enables. Between these, gnu11 is the newest version
> that is supported by all supported compiler versions, though it is
> only the default on gcc-5, while all other supported versions of
> gcc or clang default to gnu1x/gnu17.
> 
> Link: https://lore.kernel.org/lkml/CAHk-=wiyCH7xeHcmiFJ-YgXUy2Jaj7pnkdKpcovt8fYbVFW3TA@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1603
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> [v2]
>  - added -std=gnu11 back, rather than just relying on the default
>  - minor changes to changelog text
> ---
>  Documentation/process/programming-language.rst              | 4 ++--
>  .../translations/it_IT/process/programming-language.rst     | 4 ++--
>  .../translations/zh_CN/process/programming-language.rst     | 4 ++--
>  .../translations/zh_TW/process/programming-language.rst     | 4 ++--
>  Makefile                                                    | 6 +++---
>  arch/arm64/kernel/vdso32/Makefile                           | 2 +-
>  drivers/gpu/drm/i915/Makefile                               | 1 +
>  drivers/staging/greybus/tools/Makefile                      | 3 ++-
>  fs/btrfs/Makefile                                           | 1 +
>  scripts/Makefile.extrawarn                                  | 1 +
>  10 files changed, 17 insertions(+), 13 deletions(-)

For the greybus tools section:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
