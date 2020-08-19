Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73545249A6A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 12:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A0A89295;
	Wed, 19 Aug 2020 10:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816A389295
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:31:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07JAVOPh020940;
 Wed, 19 Aug 2020 05:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597833084;
 bh=1ileKBQlCD86SCsvKLgEXbnRapYDozHuzrHtk0yUBqs=;
 h=From:To:CC:Subject:Date;
 b=xKI/bKRI/zn7hfJ1dnHNE+KhU8CCnQmGT5w25Q/UUB/rQaJDvv5qZhsbkor8OkGPs
 U723RbdCkteDBG/1AvgAQGbwp0QoWweBM66rt8GOgQKG89t4i1DV6C4Ei4TpTE1N5J
 Oi/r8HTbYJ7GAr3YBsQmy6Ave1n4TTJXfg308DYU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07JAVOxg011436
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Aug 2020 05:31:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 05:30:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 05:30:31 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JAUTTF089812;
 Wed, 19 Aug 2020 05:30:30 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/omap: fix incorrect lock state
Date: Wed, 19 Aug 2020 13:30:21 +0300
Message-ID: <20200819103021.440288-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 92cc68e35863c1c61c449efa2b2daef6e9926048 ("drm/vblank: Use
spin_(un)lock_irq() in drm_crtc_vblank_on()") omapdrm locking is broken:

WARNING: inconsistent lock state
5.8.0-rc2-00483-g92cc68e35863 #13 Tainted: G        W
--------------------------------
inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
swapper/0/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
ea98222c (&dev->event_lock#2){?.+.}-{2:2}, at: drm_handle_vblank+0x4c/0x520 [drm]
{HARDIRQ-ON-W} state was registered at:
  trace_hardirqs_on+0x9c/0x1ec
  _raw_spin_unlock_irq+0x20/0x58
  omap_crtc_atomic_enable+0x54/0xa0 [omapdrm]
  drm_atomic_helper_commit_modeset_enables+0x218/0x270 [drm_kms_helper]
  omap_atomic_commit_tail+0x48/0xc4 [omapdrm]
  commit_tail+0x9c/0x190 [drm_kms_helper]
  drm_atomic_helper_commit+0x154/0x188 [drm_kms_helper]
  drm_client_modeset_commit_atomic+0x228/0x268 [drm]
  drm_client_modeset_commit_locked+0x60/0x1d0 [drm]
  drm_client_modeset_commit+0x24/0x40 [drm]
  drm_fb_helper_restore_fbdev_mode_unlocked+0x54/0xa8 [drm_kms_helper]
  drm_fb_helper_set_par+0x2c/0x5c [drm_kms_helper]
  drm_fb_helper_hotplug_event.part.0+0xa0/0xbc [drm_kms_helper]
  drm_kms_helper_hotplug_event+0x24/0x30 [drm_kms_helper]
  output_poll_execute+0x1a8/0x1c0 [drm_kms_helper]
  process_one_work+0x268/0x800
  worker_thread+0x30/0x4e0
  kthread+0x164/0x190
  ret_from_fork+0x14/0x20

The reason for this is that omapdrm calls drm_crtc_vblank_on() while
holding event_lock taken with spin_lock_irq().

It is not clear why drm_crtc_vblank_on() and drm_crtc_vblank_get() are
called while holding event_lock. I don't see any problem with moving
those calls outside the lock, which is what this patch does.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 6d40914675da..328a4a74f534 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -451,11 +451,12 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (omap_state->manually_updated)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
 	drm_crtc_vblank_on(crtc);
+
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
+	spin_lock_irq(&crtc->dev->event_lock);
 	omap_crtc_arm_event(crtc);
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
