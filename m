Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53DCCD445
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA3510E152;
	Thu, 18 Dec 2025 18:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CMdvg261";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC95510E152
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:51:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FBD942E24;
 Thu, 18 Dec 2025 18:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ECDC4CEFB;
 Thu, 18 Dec 2025 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766083872;
 bh=0rxFLgGIt2S6KKe6SUfsBxmMpBR2C+L3eo9hxGKmc0s=;
 h=From:Subject:Date:To:Cc:From;
 b=CMdvg261ETD/OA/6SdS+WUpTZqVd9abcT/nC0QI5giG5MX55zFYJ6Z9eqgRMq2rjT
 Kc5bv7pYVr7Bkaz8FoFU6Rkudz0RCxZQKsNgLUzwWQZf7Dy+/88yrKCID6hjy+dRez
 RwibmcUufeNgladI0iWBZertqlDzRFOA0iKRuxSSrTwHf0T2wa6Xc/qsLfTtN73XhS
 j6teq17L8KtBvw83ar8U9uoPcmIgtjGJP7usDShqQ8b0ow/SvaaMXHAQDb3kGFmncr
 vO/i0xcfz5bGWaVCL4d7E32qwSoVNAoJZCeGvDu/znh7A2mDkLkBxETgBuJSD3PrDY
 CUxgerRJIBfhw==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Date: Thu, 18 Dec 2025 19:50:00 +0100
Message-Id: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhMRGkC/yWMQQ6CMBAAv9Ls2TVtIxD4iiEGyqqbWIrbWjWEv
 9vIcSaZWSGSMEXo1ApCmSOHuYA5KHD3Yb4R8lQYrLaVsbpCIR8yXd7puxA+2HOK6JqGxlM96dZ
 ZKOUidOXP/3rudxZ6vso87RLGIRK64EveqVwfTYviDPTb9gPNuQNRkgAAAA==
X-Change-ID: 20251205-remove_wtype-limits-c77eb46d09c2
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=0rxFLgGIt2S6KKe6SUfsBxmMpBR2C+L3eo9hxGKmc0s=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkuvgKqSdsVlJSctu36qd7wuiSw9va8iy9mmTSzXTzXx
 nvXT3Vqx0QWBjEuBksxRZZl5ZzcCh2F3mGH/lrCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjpAJgMXpwBMtflCRob92X/0uBN3TDx29O2FlognkltmSAmZbv705k+6lMeZaF4rht/sVx3WOO0
 6Fjd38zr3TzM3dFazpi9KfON0Im1T8o6wDYzcAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

I often read on the mailing list people saying "who cares about W=2
builds anyway?". At least I do. Not that I want to fix all of them,
but on some occasions, such as new driver submissions, I have often
found a couple valid diagnostics in the W=2 output.

That said, the annoying thing is that W=2 is heavily polluted by one
warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
results for yourself. I suspect this to be the reason why so few
people are using W=2.

This series removes gcc's -Wtype-limits in an attempt to make W=2 more
useful. Those who do not use W=2 can continue to not use it if they
want. Those who, like me, use it form time to time will get an
improved experience from the reduced spam.

Extra details on statistics, past attempts and -Wtype-limits
alternatives are given in the first patch description.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (2):
      kbuild: remove gcc's -Wtype-limits
      kbuild: cleanup local -Wno-type-limits exceptions

 drivers/gpu/drm/Makefile | 1 -
 fs/btrfs/Makefile        | 1 -
 scripts/Makefile.warn    | 4 +++-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251205-remove_wtype-limits-c77eb46d09c2

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

