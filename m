Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5338CF60B1
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 00:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45BA10E265;
	Mon,  5 Jan 2026 23:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nDg/o9QI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A7C10E265
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 23:56:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC02F40BF8;
 Mon,  5 Jan 2026 23:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CAFC16AAE;
 Mon,  5 Jan 2026 23:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767657411;
 bh=HBefWBHNf4ymkXE1PWUOS9//5AiwqnDSrYphgTjisOw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nDg/o9QIX94RGxQ8o4uWO4940lF6rBh8EFCk3iRRe/0G/kimpAVyxBjGu72E209mZ
 Y5ZOLi28OSOum6l7U3P09kVpW9Q2LnDDcyqt2OhvRjROl0Bsj0UVcBzi6NDmpBKrsB
 wf4GUjw9MHOHelPU40BYYO+3r9YrNQurpm2lKJojrcAOM+sEOw0Q/9F5DhoFZCzoo9
 fWxBGf1doRNqR/a1PAaLfulyfPTtPLgYKbwz4s8i0O3VXiS5pQElQ7gweku3dkN4Tg
 GSi+yG3RZnvRpG6OOh+KtL4zREbWF6dmCW/spLJ7som9azTud0QYzBXHd/gIFvWwez
 +2YeHHtpWUTjw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Vincent Mailhol <mailhol@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
Subject: Re: [PATCH v3 0/3] kbuild: remove gcc's -Wtype-limits
Message-Id: <176765740692.3236304.10853846154010651497.b4-ty@kernel.org>
Date: Mon, 05 Jan 2026 16:56:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
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

On Sat, 20 Dec 2025 12:02:18 +0100, Vincent Mailhol wrote:
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
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/3] kbuild: remove gcc's -Wtype-limits
      https://git.kernel.org/kbuild/c/660e899103e29
[2/3] kbuild: cleanup local -Wno-type-limits exceptions
      https://git.kernel.org/kbuild/c/34a1bd0b6b2c0
[3/3] overflow: Remove is_non_negative() and is_negative()
      https://git.kernel.org/kbuild/c/5ce3218d4f102

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

