Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F5A9EF4F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 13:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B337F10E447;
	Mon, 28 Apr 2025 11:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jaAHkhM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58FF10E427
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 11:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A4B36115B;
 Mon, 28 Apr 2025 11:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9657BC4CEE9;
 Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745840246;
 bh=IofKI39NDhxf7HuzObpShh2CpeUa6PSNIa4EbF6DU0k=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=jaAHkhM3iBA0KrRnHURhWtkPOCFgPDI3Up05rHTG4t8xHT0gX8Owngh+911TAtrGK
 0xc42qaM3JrY9luQxcsevc52f7r0G3j+ZpYx+p4BKWAM96uv7gWFDyBarBgHd51PhL
 tft0Romq20XGzU3cgs2R0zOGx20aai7d8I7k4LIolU9YhcQtZQd0AvPtTNRk6+KKFL
 /NsHeJhheNeDhI3T3yA32m6mXNvqw6r+dinL7BVLmz6zEoLD20VL05GOAhvamp078n
 37WcLBq5cfCjD1o2j9y8vL32SJEzQd4YyIr9embqtf540GGuDKnumIRc+6JNkNHa3E
 hWgNr51TaQsgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 83EAAC369DC;
 Mon, 28 Apr 2025 11:37:26 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v2 0/4] Apple Display Pipe driver fixes
Date: Mon, 28 Apr 2025 13:37:12 +0200
Message-Id: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhoD2gC/3WMQQ6CMBBFr0JmbU2nIKSuvIchpNKpjImFtNhoS
 O9uZe/y/Z/3NogUmCKcqw0CJY48+wLqUME4GX8nwbYwKKlOssFW2PAcjF0Gx2+KAs3N2YYsjY6
 gOEug/SjKtS88cVzn8NnzCX/rv1JCIUXXqVZrh7XS9eVhvDevo6cV+pzzF3M2QnGrAAAA
X-Change-ID: 20250416-drm_adp_fixes-1abfd4edecfe
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=IofKI39NDhxf7HuzObpShh2CpeUa6PSNIa4EbF6DU0k=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgz+jBIWNvGnBccrWwtka58+dPjuZF92OrRciMvxkpCNj
 8w9Ib2OUhYGMS4GWTFFliTtlx0Mq2sUY2ofhMHMYWUCGcLAxSkAE5H/wvA//++ajKIDJu/Nn/DX
 fz50NFdl07512y+12hew3vtlk3b7CsN/t6se4TZdAmdEXibK8Up0X1y4N/aZ0HbjbYwBDcK/1q7
 nAgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
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
Reply-To: j@jannau.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While looking at a suspend issue in the Asahi downstream kernel I
noticed several issues in the the ADP driver. This series fixes those
issue.

The root cause of the issue was that the device is unexpectedly powered
down on suspend. The driver relies on initialization done by the boot
loader and can not bring the device up from reset. The change in [1]
annotates the power-domain used by ADP as always-on. This ensure the
touchbar is useable when the adpdrm module is loaded after boot.

The device comes out of reset firing interrupts with a rate of 60Hz even
if vblank interrupts are disabled. This itself is not an issue.
The event_lock outside of the irq handler is locked with spin_lock()
resulting in a deadlock if the irq fires while the lock is held and
processed on the same CPU core. This happens eventually and results in a
soft-locked CPU. [Patch 1/4] "drm: adp: Use spin_lock_irqsave for drm
device event_lock" addresses this.

In addition I noticed that the driver does not use drm_crtc_vblank_on()
and instead enables HW vblank interrupts in probe(). This may have been
done to avoid errors from drm_crtc_vblank_get() after crtc reset. 
drm_crtc_vblank_reset() intentionally leaves struct drm_vblank_crtc in
state where drm_crtc_vblank_get() cannot enable vblank interrupts.
Handle this case explictly in [Patch 2/4] "drm: adp: Handle
drm_crtc_vblank_get() errors".

[Patch 3/4] "drm: adp: Enable vblank interrupts in crtc's
.atomic_enable" then uses the expected drm_crtc_vblank_on() call to
enable vblank interrupts.

[Patch 4/4] "drm: adp: Remove pointless irq_lock spinlock" removes an
unnecessary spinlock protecting the irq handler from itself.

[1] https://lore.kernel.org/asahi/20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net/

---
Changes in v2:
- Clarified cover letter
- updated [Patch 2/4] "drm: adp: Handle drm_crtc_vblank_get() errors"
  based on the comments
- clarify `crtc->state->event` locking reqirements as change annotation
- import R-b: tags
- Link to v1: https://lore.kernel.org/r/20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net

---
Janne Grunau (4):
      drm: adp: Use spin_lock_irqsave for drm device event_lock
      drm: adp: Handle drm_crtc_vblank_get() errors
      drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      drm: adp: Remove pointless irq_lock spin lock

 drivers/gpu/drm/adp/adp_drv.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250416-drm_adp_fixes-1abfd4edecfe

Best regards,
-- 
Janne Grunau <j@jannau.net>


