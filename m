Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F856B73C6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 11:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF6410E4CC;
	Mon, 13 Mar 2023 10:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F332F10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 10:22:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 101E44B3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 03:23:02 -0700 (PDT)
Received: from e123756.cambridge.arm.com (e123756.cambridge.arm.com
 [10.1.199.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19FC03F71A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 03:22:17 -0700 (PDT)
From: patrik.berglund@arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Take over EFI framebuffer properly
Date: Mon, 13 Mar 2023 10:22:09 +0000
Message-Id: <20230313102209.53966-1-patrik.berglund@arm.com>
X-Mailer: git-send-email 2.17.1
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

From: Patrik Berglund <patrik.berglund@arm.com>

The Arm Morello board EDK2 port already provides an EFI GOP display for
Ceti/Cetus (Komeda) with more boards incoming.
However, once the Komeda driver probes and takes over the hardware,
it should take over the logical framebuffer as well, otherwise,
the now-defunct GOP device hangs around and virtual console output
inevitably disappears into the wrong place most of the time.

We'll do this right before doing the SRST because that is the point
when the GOP will stop working.
The GOP might also fail because the encoder driver do things but this
is better than nothing.

Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 12 ++++++++++++
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c  |  6 ++++++
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h  |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 6c56f5662bc7..72035af9bc5f 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -8,6 +8,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_print.h>
 #include "d71_dev.h"
+#include "komeda_kms.h"
 #include "malidp_io.h"
 
 static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
@@ -310,6 +311,17 @@ static int d71_reset(struct d71_dev *d71)
 	u32 __iomem *gcu = d71->gcu_addr;
 	int ret;
 
+	/*
+	 * If we are already running, the most likely reason is that the EFI left
+	 * us running (GOP), so make sure to take over from simple framebuffer
+	 * drivers.
+	 */
+	if (malidp_read32(gcu, BLK_STATUS) & GCU_STATUS_ACTIVE) {
+		ret = komeda_kms_remove_framebuffers();
+		if (ret)
+			return ret;
+	}
+
 	malidp_write32(gcu, BLK_CONTROL, GCU_CONTROL_SRST);
 
 	ret = dp_wait_cond(!(malidp_read32(gcu, BLK_CONTROL) & GCU_CONTROL_SRST),
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 62dc64550793..12af409aeabb 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -7,6 +7,7 @@
 #include <linux/component.h>
 #include <linux/interrupt.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
@@ -349,3 +350,8 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
 	komeda_kms_cleanup_private_objs(kms);
 	drm->dev_private = NULL;
 }
+
+int komeda_kms_remove_framebuffers(void)
+{
+	return drm_aperture_remove_framebuffers(false, &komeda_kms_driver);
+}
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 3a872c292091..1a43707ed68f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -187,5 +187,6 @@ void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 
 struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
 void komeda_kms_detach(struct komeda_kms_dev *kms);
+int komeda_kms_remove_framebuffers(void);
 
 #endif /*_KOMEDA_KMS_H_*/
-- 
2.17.1

