Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5BA9DD03
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 22:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E96510E070;
	Sat, 26 Apr 2025 20:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nAsAEkA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528C10E070
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 20:05:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4C4A4A2AE;
 Sat, 26 Apr 2025 20:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86224C4CEE2;
 Sat, 26 Apr 2025 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745697919;
 bh=anucA2fhUpmZ6Yai/LMGEEPEFJm0oLNwTHqcBdoDPig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nAsAEkA6mO4DURrDH/gME/mLaHU5WC6a71M7C42Q89LgHhxb08l3/e1BfVmPD1gZ8
 vt2dTj4SYMx7XQnCNn17tWJnbxdqOhuMlYP+pfmdxalSdx4NqTBbz3gPYgMYBhaAq0
 h819pLS5+CQwWErAfBDfyyzTvzrSeZgVf5q/I1ha8jns/r3p2PxiCAL7IAYZdAdFBH
 bdIMvbHEIqFP9l2WmLVdpFIFFQAEi+2Nig4z1uB+Sk8EPK8k8v8VvnsywaKN0msXvj
 usaypPu9quOYgfeeh2GKhgmX8ReSf/Pu1Gsm31tYhi2MCeIQ2LT9y0zN/EMFJP29uQ
 saCsTaYkFi5Qg==
Date: Sat, 26 Apr 2025 16:05:13 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
Subject: Re: clang and drm issue: objtool warnings from clang build
Message-ID: <20250426200513.GA427956@ax162>
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Sat, Apr 26, 2025 at 10:42:40AM -0700, Linus Torvalds wrote:
> But I *really* think that clang silently just generating known bad
> code for invalida operations like this is very very dangerous, and is
> a bug in clang.
> 
> Can we *please* get a flag for clang that it doesn't just stop
> generating code because it has decided some path is unreachable or
> undefined? Add a TRAP instruction, for Chrissake! PLEASE!
> 
>  Maybe such a flag already exists, and the kernel just doesn't know
> about it. This whole "do random things for undefined behavior" is a
> bug, dammit.

I think there is an internal LLVM flag, '-trap-unreachable', that does
what we would want here. Within the last year, I tested adding something
like

    KBUILD_CFLAGS += -mllvm -trap-unreachable

to Makefile under an 'ifdef CONFIG_CC_IS_CLANG' and it eliminated most
objtool warnings but I seem to recall it introducing some new ones, I
think around __noreturn functions? I know Josh has done a lot of work on
objtool recently so I should retest. GCC has this behavior exposed under
-funreachable-traps, I could see about trying to expose that in clang.

This specific case started with clang-20 and your analysis is spot on:

https://lore.kernel.org/20241220223403.GA2605890@ax162/

On Sat, Apr 26, 2025 at 10:52:10AM -0700, Linus Torvalds wrote:
> Please people: "ASSERT()" like behavior is simply not acceptable in
> the kernel. WARN_ON() and friends need to either be otherwise benign
> (ie "warn but then continue to do valid things") or they need to be
> *handled* (ie "warn and then refuse to do things that aren't valid").
> 
> Just warning and then doing random crap is not sane. If you aren't
> capable of dealing with the situation, don't do the bogus test. Just
> warning about it isn't fixing the code, and can make things actively
> worse as in these two examples.

This was the most recent series to clear up those objtool warnings in
the AMD driver:

https://lore.kernel.org/20250114132856.19463-1-yangtiezhu@loongson.cn/

Not sure if other ASSERT() uses should be audited or eliminated too but
that would at least make the build cleaner.

> Not this silent "now I generate random code by falling through to
> something else entirely" that clang does now. Not good.

Aside from what I mention above, I suppose getting OBJTOOL_WERROR in
useful shape would help with this a little bit because it will be easier
for me and others testing tip of tree LLVM to notice when optimizations
introduce new warnings.

Cheers,
Nathan
