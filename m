Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C844ECD21CF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E6510EF38;
	Fri, 19 Dec 2025 22:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xo4lqaWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50EA10EF38
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 22:40:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FE7B441B7;
 Fri, 19 Dec 2025 22:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F42C4CEF1;
 Fri, 19 Dec 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766184018;
 bh=4Re12oNt7Opk8DXSEZclIhGKvxuDxBrD78pnkLRJMgk=;
 h=From:Subject:Date:To:Cc:From;
 b=Xo4lqaWBOwwhuluvZVJO0Gb6rL6gadU/QhpglW6tG4R5ToQAgnkeWImbPTVM1vnkW
 EmuyRcsNhPs1N1KRlcRWM7dWfZ0hUYOY+QRMGxkKJa3HJWLd55Qzs2X/3iaA1aH3qm
 6l8gyQEylD4+7V8nAUnzVmh1ud+kKDkKmna7onusQMHSjoaPEPpy5UcGDpcyKOAdwc
 GPGGlNFDZHXCiank9tDu6g5VNW81I1ZI1zQLwGjN2MyuklT6RdA7j5TzVPsbrU36M1
 EJKmnOq63F0SOXlFsQxLmXk1YA9FumIFzmzVH4O+FEsQAsTMe0k8X/OEUukM8XBG+K
 qXKpH7ljAZZGw==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v2 0/4] kbuild: remove gcc's -Wtype-limits
Date: Fri, 19 Dec 2025 23:39:44 +0100
Message-Id: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHURWkC/22Oyw6CMBBFf4XM2hJaHgVW/ochBsoIjUJxilVC+
 HcrbF2em/tawSJptFAGKxA6bbUZPYhTAKqvxw6Zbj2DiETKRZQywsE4vL7nZUL20IOeLVNSYpN
 kbVQoAT45Ed70Z2+9VAcTPl++fD5EaGqLTJnBx8vAZSEvGCkOP3Ov7Wxo2R85vruPcZ7/HXecR
 UzGacJlGmcyl+c70oiP0FAH1bZtX+EvN2zkAAAA
X-Change-ID: 20251205-remove_wtype-limits-c77eb46d09c2
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=4Re12oNt7Opk8DXSEZclIhGKvxuDxBrD78pnkLRJMgk=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJmuV6xntgqcULtlUvtJ/IuM4vJAT/F/Dzc89ZpzrFM1M
 fv4DgvpjoksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWATAYuTgGYamEpRoaDny68fZ19vSNw1ufyWGGVA98SFsn4Z2WwuCetb226/zqTkeGJ3vydZsf
 rC85U2u1KaRBLc74erhj6z6FdNSIyrENgFhsA
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
want. Those who, like me, use it for time to time will get an improved
experience from the reduced spam.

Patch #1 deactivates -Wtype-limits.  Extra details on statistics, past
attempts and alternatives are given in the description.

Patch #2 clean-ups the local kbuild -Wno-type-limits exceptions,
patches #3 and #4 undo some of the local workarounds which silenced
that warning by uglifying the code.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v2:

  - Add two more patches to clean up some -Wtype-limits workarounds
  - Collect the Reviewed-by tags.

Link to v1: https://lore.kernel.org/r/20251218-remove_wtype-limits-v1-0-735417536787@kernel.org

---
Vincent Mailhol (4):
      kbuild: remove gcc's -Wtype-limits
      kbuild: cleanup local -Wno-type-limits exceptions
      overflow: Remove is_non_negative() and is_negative()
      minmax: remove useless cast in __is_nonneg()

 drivers/gpu/drm/Makefile |  1 -
 fs/btrfs/Makefile        |  1 -
 include/linux/minmax.h   |  5 +----
 include/linux/overflow.h | 10 ++--------
 scripts/Makefile.warn    |  4 +++-
 5 files changed, 6 insertions(+), 15 deletions(-)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251205-remove_wtype-limits-c77eb46d09c2

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

