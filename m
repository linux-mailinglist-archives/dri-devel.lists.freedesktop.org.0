Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF4AA06D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9B510E2EF;
	Tue, 29 Apr 2025 09:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="m1QpzLod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1009410E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TCtK+S9Vehc+o11YARkarBRhwpFbmIA+JQ/OcMBsm3E=; b=m1QpzLodCTtsLIwwq0uhS07fm6
 8UKf/JifEW2ri1/VOtitCC4fVBHZ3vc0MK2QrwqNDlww5kh8cXEbhRmR1NEVEGXaqIbmm4rmgbQ//
 NC40D/Dkx5Zp826vpyizKK3lPHJBK3bNZ/OHeN62Y4izVPtf4SmHunk8U7gKxMp73D9CQRCiBp2OJ
 0P1m6PVkXFrxNUNzDoKA5dKdnXN8xv+ppu9ufak/LWufAj3+ts1MEngStqVnWA1hhUnU2Mu2Ch2gu
 304l1x8HSl/q0gOMm9eLjAJsvnBaqOfEb0xZWzc6/gciupws9O3oys8VPN9v/WBbfuRBbg6eA5acA
 fHQ8MK+w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1u9h5z-0000000FdS4-0AUO; Tue, 29 Apr 2025 09:17:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 689D9300777; Tue, 29 Apr 2025 11:17:42 +0200 (CEST)
Date: Tue, 29 Apr 2025 11:17:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Justin Stitt <justinstitt@google.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
Subject: Re: clang and drm issue: objtool warnings from clang build
Message-ID: <20250429091742.GF4198@noisy.programming.kicks-ass.net>
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
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

On Mon, Apr 28, 2025 at 12:34:27PM -0700, Linus Torvalds wrote:

> And yes, this really is a very potential and real security issue. In
> the kernel I don't think we have this ever happening, partly because a
> lot of configurations use gcc which afaik doesn't have this particular
> horrendous model of UD.

I see more and more people use clang, in a large part because of Rust.

Anyway, I've seen clang pull this stop-codegen-on-UB trick before (link
was upstream in the thread) and yes, it is horrific crap. At the time I
proposed emitting at the very least a UD2 instruction rather than just
straight up stopping code gen, but I think your proposal for a code-gen
knob to just not do this 'optimisation' at all is much better.
