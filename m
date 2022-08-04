Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AC58A28E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 22:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D7FA71AE;
	Thu,  4 Aug 2022 20:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB63A700C;
 Thu,  4 Aug 2022 20:43:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D70426178F;
 Thu,  4 Aug 2022 20:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF40C433D6;
 Thu,  4 Aug 2022 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659645825;
 bh=/dBnGEelz0eNZ7ash2KCkOnK42Kq3O9zA1e57MIkXCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=juU3p2LUjcxjMlM6vTTY1lLZWVXb/mcsQMqGkZ/WHOsek7V0hDFsZrX6Fy+36KdAL
 yn6BDe8wUhOCTy+9ZmfJBWS+mP62dLFKmdwlOlB9vlElBwclJg+RepYpdf+Rh/Cr1R
 u1r3hEtJJAPuVVjBIr5FfU5oSiL0TI8wqQ8BHsU7AMGN+99rp1KPkm9Dpm3bncEXmC
 lYPlURhbpMy9WqPtn0SPIKyz/PKWa3k6Nr+SvcKaVd542jSA8LDJaEgGIFbA2AG+zj
 aP9g14qRKxapm+F0brNeG0LRJa69nTT/49cOFbDE96HEXU1PPAUMgBawRt2tazl2La
 ZP/6K+bDSkX/w==
Date: Thu, 4 Aug 2022 13:43:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
Message-ID: <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
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
Cc: clang-built-linux <llvm@lists.linux.dev>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 04, 2022 at 09:24:41PM +0200, Arnd Bergmann wrote:
> On Thu, Aug 4, 2022 at 8:52 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, Aug 4, 2022 at 11:37 AM Sudip Mukherjee (Codethink)
> > <sudipm.mukherjee@gmail.com> wrote:cov_trace_cmp
> > >
> > > git bisect points to 3876a8b5e241 ("drm/amd/display: Enable building new display engine with KCOV enabled").
> >
> > Ahh. So that was presumably why it was disabled before - because it
> > presumably does disgusting things that make KCOV generate even bigger
> > stack frames than it already has.
> >
> > Those functions do seem to have fairly big stack footprints already (I
> > didn't try to look into why, I assume it's partly due to aggressive
> > inlining, and probably some automatic structures on stack). But gcc
> > doesn't seem to make it all that much worse with KCOV (and my clang
> > build doesn't enable KCOV).
> >
> > So it's presumably some KCOV-vs-clang thing. Nathan?

Looks like Arnd beat me to it :)

> The dependency was originally added to avoid a link failure in 9d1d02ff3678
>  ("drm/amd/display: Don't build DCN1 when kcov is enabled") after I reported the
> problem in https://lists.freedesktop.org/archives/dri-devel/2018-August/186131.html
> 
> The commit from the bisection just turns off KCOV for the entire directory
> to avoid the link failure, so it's not actually a problem with KCOV vs clang,
> but I think a problem with clang vs badly written code that was obscured
> in allmodconfig builds prior to this.

Right, I do think the sanitizers make things worse here too, as those get
enabled with allmodconfig. I ran some really quick tests with allmodconfig and
a few instrumentation options flipped on/off:

allmodconfig (CONFIG_KASAN=y, CONFIG_KCSAN=n, CONFIG_KCOV=y, and CONFIG_UBSAN=y):

warning: stack frame size (2216) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2184) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2176) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]

allmodconfig + CONFIG_KASAN=n:

warning: stack frame size (2112) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]

allmodconfig + CONFIG_KCOV=n:

warning: stack frame size (2216) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2184) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2176) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]

allmodconfig + CONFIG_UBSAN=n:

warning: stack frame size (2584) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2680) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2352) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]

allmodconfig + CONFIG_KASAN=n + CONFIG_KCSAN=y + CONFIG_UBSAN=n:

warning: stack frame size (2504) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2600) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
warning: stack frame size (2264) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]

allmodconfig + CONFIG_KASAN=n + CONFIG_KCSAN=n + CONFIG_UBSAN=n:

warning: stack frame size (2072) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]

There might be other debugging configurations that make this worse too,
as I don't see those warnings on my distribution configuration.

> The dml30_ModeSupportAndSystemConfigurationFull() function exercises
> a few paths in the compiler that are otherwise rare. On thing it does is to
> pass up to 60 arguments to other functions, and it heavily uses float and
> double variables. Both of these make it rather fragile when it comes to
> unusual compiler options, so the files keep coming up whenever a new
> instrumentation feature gets added. There is probably some other flag
> in allmodconfig that we can disable to improve this again, but I have not
> checked this time.

I do notice that these files build with a non-configurable
-Wframe-large-than value:

$ rg frame_warn_flag drivers/gpu/drm/amd/display/dc/dml/Makefile
54:frame_warn_flag := -Wframe-larger-than=2048
70:CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(frame_warn_flag)
72:CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
76:CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_32.o := $(dml_ccflags) $(frame_warn_flag)

I suppose that could just be bumped as a quick workaround? Two of those
files have a comment that implies modifying them in non-trivial ways is
not recommended.

/*
 * NOTE:
 *   This file is gcc-parsable HW gospel, coming straight from HW engineers.
 *
 * It doesn't adhere to Linux kernel style and sometimes will do things in odd
 * ways. Unless there is something clearly wrong with it the code should
 * remain as-is as it provides us with a guarantee from HW that it is correct.
 */

I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
in the mode support function") did have a workaround for GCC. It appears
clang will still inline mode_support_configuration(). If I mark it as
'noinline', the warning disappears in that file.

Cheers,
Nathan
