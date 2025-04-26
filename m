Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19904A9DDC2
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 01:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F77510E008;
	Sat, 26 Apr 2025 23:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzlmzQaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFFE10E008
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 23:23:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 576B644EF0;
 Sat, 26 Apr 2025 23:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D811C4CEE2;
 Sat, 26 Apr 2025 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745709830;
 bh=0EzI2PsxZX+NCSTOzZTgOkGoOnmSI6hi1Q7oSC2m2BQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gzlmzQaDWmCVVuyKJBFhgxPi/QyNZdzcHOnM46pg2w02j6agoQMEnDNw3Ya0pJwmw
 Pl1Pa+4rqDzYTc5FgsmIX2EvVdz+N2eIEVF1HjwMU4mVG0uFV88ZQ5SmMZmfQaVlj3
 g63YgGX2D6DHZRwcxbCrAeGV2zFgcRX91jLYQCskCVaF3pETvU1smL51mHIInrOU2T
 B3KlsL78r0+gAcziSyL1C2TVkfCY9oMshyTk/W0evOD72s0ZyvMJspIHHxzOgICLA0
 3l8bVkPivxNLmNmaX++FLv8b+oMAqLKbYNTAV4EkdjX4oVnbD8dZiLZUe1PhurQRq8
 asV0DSpMgJkrg==
Date: Sat, 26 Apr 2025 19:23:44 -0400
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
Message-ID: <20250426232344.GA1395819@ax162>
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
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

On Sat, Apr 26, 2025 at 01:56:59PM -0700, Linus Torvalds wrote:
> IOW, there's a *big* difference between "the programmer told me this
> is unreachable, so I won't generate code past this point" and "I have
> decided this is undefined behavior, so now I won't generate code past
> this point".
> 
> So what I'm asking for is absolutely not "trap on unreachable". That's
> wrong and just plain stupid.
> 
> I'm asking for "trap on UD instead of *assuming* it's unreachable".
> 
> Because clearly that code *can* be reached, it's just doing something undefined.
> 
> See? Big big difference.

Ah yes, that is a big yet subtle difference that I had not considered,
my bad for missing that. I was only thinking about the implicitly
inserted __builtin_unreachable() from potential UB, not the explicitly
added ones from the developers.

I suspect that it would not be easy to split that distinction in LLVM
but since I am not a compiler person, I will see if this has come up
before and talk to people otherwise. I know there has been work in LLVM
to try and stop undefined behavior from destroying control flow with
things like the freeze instruction but I am not sure that would help us
in this situation. Pardon my ignorance though, isn't something like this
basically just '-fsanitize=undefined -fsanitize-trap=all'?

Cheers,
Nathan
