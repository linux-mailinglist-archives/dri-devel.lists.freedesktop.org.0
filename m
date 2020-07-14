Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17221FF60
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056566E9FD;
	Tue, 14 Jul 2020 20:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501D96E9C3;
 Tue, 14 Jul 2020 20:58:48 +0000 (UTC)
IronPort-SDR: adTDieRgKJNa3SSBW9RCmq/4pr+XcOxJa8eyX4H5LSBK2deGqJ6VzGXkNVcwZTqNH08VvbyFmu
 3Y+ALS0scbOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444625"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444625"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:47 -0700
IronPort-SDR: QjGOPf9RFTN1yybbJd3uJuKZ7FBUUU2XlYwD/9rbL4OmUrlCryQZOgKmaXOkOpYjxMDb4UsLgt
 QygpHescnYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504306"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:47 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 53/59] drm/kmb: disable the LCD layer in EOF irq handler
Date: Tue, 14 Jul 2020 13:57:39 -0700
Message-Id: <1594760265-11618-54-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When disabling/enabling LCD layers, the change takes effect
immediately and does not wait for EOF (end of frame). If we
disable an LCD layer in kmb_plane_atomic_disable, then the frame
reappears with incorrect display offsets.

The solution is to mark the plane as disabled when
kmb_plane_atomic_disable is called but actually disable the LCD
layer when EOF irq is being handled.

Also only enable one plane (video plane0) as there is no use case for
multiple planes.

v2: Moved extern to .h, removed license text, upclassed dev_private.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   | 36 +++++++++++++++++++++++++++++-------
 drivers/gpu/drm/kmb/kmb_drv.h   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 24 ++++++++----------------
 drivers/gpu/drm/kmb/kmb_plane.h | 11 ++++++++++-
 4 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index f5e1def..55574c1 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -347,25 +347,47 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 {
 	unsigned long status, val;
+	int plane_id;
 	struct kmb_drm_private *dev_p = to_kmb(dev);
 
 	status = kmb_read_lcd(dev_p, LCD_INT_STATUS);
 	if (status & LCD_INT_EOF) {
-	/*To DO - handle EOF interrupt? */
-	kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF);
+		/* TODO - handle EOF interrupt? */
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF);
+
+		/* When disabling/enabling LCD layers, the change takes effect
+		 * immediately and does not wait for EOF (end of frame).
+		 * When kmb_plane_atomic_disable is called, mark the plane as
+		 * disabled but actually disable the plane when EOF irq is
+		 * being handled.
+		 */
+		for (plane_id = LAYER_0; plane_id < KMB_MAX_PLANES;
+				plane_id++) {
+			if (plane_status[plane_id].disable) {
+				kmb_clr_bitmask_lcd(dev_p,
+					LCD_LAYERn_DMA_CFG(plane_id),
+					LCD_DMA_LAYER_ENABLE);
+
+				kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL,
+					plane_status[plane_id].ctrl);
+
+				plane_status[plane_id].disable = false;
+			}
+		}
 	}
+
 	if (status & LCD_INT_LINE_CMP) {
 		/* clear line compare interrupt */
-		kmb_write_lcd(dev_p, LCD_INT_CLEAR,
-				LCD_INT_LINE_CMP);
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
 	}
+
 	if (status & LCD_INT_LAYER) {
 		/* Clear layer interrupts */
-		kmb_write_lcd(dev->dev_private, LCD_INT_CLEAR, LCD_INT_LAYER);
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LAYER);
 	}
 
 	if (status & LCD_INT_VERT_COMP) {
-		/* read VSTATUS */
+		/* Read VSTATUS */
 		val = kmb_read_lcd(dev_p, LCD_VSTATUS);
 		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
 		switch (val) {
@@ -382,7 +404,7 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 	}
 
 	/* Clear all interrupts */
-	kmb_set_bitmask_lcd(dev->dev_private, LCD_INT_CLEAR, ~0x0);
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, 1);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 4b97a3d..94b62b9 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -19,6 +19,7 @@
 
 #define crtc_to_kmb_priv(x)	container_of(x, struct kmb_drm_private, crtc)
 
+
 struct kmb_drm_private {
 	struct drm_device drm;
 	void __iomem *lcd_mmio;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index f92e191..8b2b202 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -21,6 +21,8 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
+struct layer_status plane_status[KMB_MAX_PLANES];
+
 const uint32_t layer_irqs[] = {
 	LCD_INT_VL0,
 	LCD_INT_VL1,
@@ -62,34 +64,24 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
-	int ctrl = 0;
-	struct kmb_drm_private *dev_p;
-	int plane_id;
-
-	dev_p = to_kmb(plane->dev);
-	plane_id = kmb_plane->id;
+	int plane_id = kmb_plane->id;
 
 	switch (plane_id) {
 	case LAYER_0:
-		ctrl = LCD_CTRL_VL1_ENABLE;
+		plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
 		break;
 	case LAYER_1:
-		ctrl = LCD_CTRL_VL2_ENABLE;
+		plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
 		break;
 	case LAYER_2:
-		ctrl = LCD_CTRL_GL1_ENABLE;
+		plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
 		break;
 	case LAYER_3:
-		ctrl = LCD_CTRL_GL2_ENABLE;
+		plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
 		break;
 	}
 
-	kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
-			    LCD_DMA_LAYER_ENABLE);
-	kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
-	DRM_DEBUG("%s : %d lcd_ctrl = 0x%x lcd_int_enable=0x%x\n",
-		  __func__, __LINE__, kmb_read_lcd(dev_p, LCD_CONTROL),
-		  kmb_read_lcd(dev_p, LCD_INT_ENABLE));
+	plane_status[plane_id].disable = true;
 }
 
 unsigned int set_pixel_format(u32 format)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index 6e4da47..98c48a9 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -41,9 +41,11 @@ enum layer_id {
 	LAYER_1,
 	LAYER_2,
 	LAYER_3,
-	KMB_MAX_PLANES,
+//	KMB_MAX_PLANES,
 };
 
+#define KMB_MAX_PLANES 1
+
 enum sub_plane_id {
 	Y_PLANE,
 	U_PLANE,
@@ -105,6 +107,13 @@ static const u32 csc_coef_lcd[] = {
 	-179, 125, -226
 };
 
+struct layer_status {
+	bool disable;
+	u32 ctrl;
+};
+
+extern struct layer_status plane_status[KMB_MAX_PLANES];
+
 struct kmb_plane *kmb_plane_init(struct drm_device *drm);
 void kmb_plane_destroy(struct drm_plane *plane);
 #endif /* __KMB_PLANE_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
