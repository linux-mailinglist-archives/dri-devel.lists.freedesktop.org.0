Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CEECF4CDC
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4FE10E419;
	Mon,  5 Jan 2026 16:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SAFTU5gc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4993410E419
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:48:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0443E43768;
 Mon,  5 Jan 2026 16:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61723C116D0;
 Mon,  5 Jan 2026 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767631709;
 bh=lgBmFWS+eHzup5griXBJ5iLWt12w0pIwjjUwlCOm7g0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SAFTU5gcAiQg7vMGozUVUYCTRsEYNiZ3wG5wWEcjG4Wyc8CAUmCW26cdyPm06fmRl
 wUcnCBNzAyWUCHnOE+bhRTFKktre3jQ3Rx45plVujMGnUkjEKPQycongC7a6cOpPMY
 sNSWOVHPCqETgqkZKd8HB6mVr+NZr2th3IgIN2lUrx/NWFO8+kJbl0RVTmfRvp7gcB
 b9DyTQmR7vFDsboDOEU5g4X7Zz7R5LKWqu+23P4VIZHZa5MJgora8v42WNPs2MTT0y
 8LJDwXu5f85x70Wtfo5hlGB+xdiNPArBz6kPOeVGTguZTk2Wr0REa218Jiz7yYxdoB
 kinjeKInNoE/Q==
Date: Mon, 5 Jan 2026 13:24:29 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aVutfSk4PWbGac_Q@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
 Vincent Mailhol <mailhol@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260101-remove_wtype-limits-v4-0-225b75c29086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-remove_wtype-limits-v4-0-225b75c29086@kernel.org>
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

On Thu, Jan 01, 2026 at 04:21:38PM +0100, Vincent Mailhol wrote:
> I often read on the mailing list people saying "who cares about W=2
> builds anyway?". At least I do. Not that I want to fix all of them,
> but on some occasions, such as new driver submissions, I have often
> found a couple valid diagnostics in the W=2 output.
> 
> That said, the annoying thing is that W=2 is heavily polluted by one
> warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
> results for yourself. I suspect this to be the reason why so few
> people are using W=2.
> 
> This series removes gcc's -Wtype-limits in an attempt to make W=2 more
> useful. Those who do not use W=2 can continue to not use it if they
> want. Those who, like me, use it for time to time will get an improved
> experience from the reduced spam.
> 
> Patch #1 deactivates -Wtype-limits. Extra details on statistics, past
> attempts and alternatives are given in the description.
> 
> Patch #2 clean-ups the local Kbuild -Wno-type-limits exceptions.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changes in v4:
> 
>   - Remove patch #3.
>   - Aside from minor changes in the patch descriptions, this is
>     basially a revert to v1.
> 
> Link to v3: https://lore.kernel.org/r/20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org

just to prevent confusions:  As Dan silenced the Smatch warning caused
by patch #3 [1] (thanks!), the additional comment patch [2] is obsolete
and v3 of the series is a more complete version than v4.

Kind regards,
Nicolas


[1]: https://github.com/error27/smatch/commit/a7b509b8171b4982b5a2a355f64d083dd76e03f9
[2]: https://lore.kernel.org/linux-kbuild/b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org/
