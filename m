Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30F20FF37
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A726E4CB;
	Tue, 30 Jun 2020 21:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7889C6E33C;
 Tue, 30 Jun 2020 21:28:56 +0000 (UTC)
IronPort-SDR: 5J412wgFwgKPb5CqQ5z1M4H7PcQS8fEnjBYzwKQ9BDoA143rfRi0lEQMN7xHtHSqJd1sAPaMgr
 0B6U28TedZ6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="126485033"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="126485033"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:55 -0700
IronPort-SDR: jNYZfBuODuRkMGpDex5vsLH3asCCwvFJUEMF73EXsLYpnIYPC8XAkCzfWqS+eQ5qay+lQlB5Jp
 KwMnzfYLfsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066852"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:55 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 53/59] drm/kmb: disable the LCD layer in EOF irq handler
Date: Tue, 30 Jun 2020 14:28:05 -0700
Message-Id: <1593552491-23698-54-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   | 37 +++++++++++++++++++++++++++++++------
 drivers/gpu/drm/kmb/kmb_drv.h   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 24 ++++++++----------------
 drivers/gpu/drm/kmb/kmb_plane.h |  9 ++++++++-
 4 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index c699f01..79ab0bc 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -62,6 +62,8 @@ static struct clk *clk_mipi_cfg;
 
 struct drm_bridge *adv_bridge;
 
+extern struct layer_status plane_status[KMB_MAX_PLANES];
+
 int kmb_display_clk_enable(void)
 {
 	int ret = 0;
@@ -367,25 +369,48 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 {
 	unsigned long status, val;
+	int plane_id;
+	struct kmb_drm_private *dev_p = dev->dev_private;
 
 	status = kmb_read_lcd(dev->dev_private, LCD_INT_STATUS);
 	if (status & LCD_INT_EOF) {
 		/* TODO - handle EOF interrupt? */
-		kmb_write_lcd(dev->dev_private, LCD_INT_CLEAR, LCD_INT_EOF);
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
-		kmb_write_lcd(dev->dev_private, LCD_INT_CLEAR,
-			      LCD_INT_LINE_CMP);
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
 	}
+
 	if (status & LCD_INT_LAYER) {
 		/* Clear layer interrupts */
-		kmb_write_lcd(dev->dev_private, LCD_INT_CLEAR, LCD_INT_LAYER);
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LAYER);
 	}
 
 	if (status & LCD_INT_VERT_COMP) {
 		/* Read VSTATUS */
-		val = kmb_read_lcd(dev->dev_private, LCD_VSTATUS);
+		val = kmb_read_lcd(dev_p, LCD_VSTATUS);
 		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
 		switch (val) {
 		case LCD_VSTATUS_COMPARE_VSYNC:
@@ -401,7 +426,7 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 	}
 
 	/* Clear all interrupts */
-	kmb_set_bitmask_lcd(dev->dev_private, LCD_INT_CLEAR, ~0x0);
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, 1);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 4916b217..83824f7 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -39,6 +39,7 @@
 
 #define crtc_to_kmb_priv(x)	container_of(x, struct kmb_drm_private, crtc)
 
+
 struct kmb_drm_private {
 	struct drm_device drm;
 	void __iomem *lcd_mmio;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 8d83238..81250e1 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -41,6 +41,8 @@
 #include "kmb_regs.h"
 #include "kmb_drv.h"
 
+struct layer_status plane_status[KMB_MAX_PLANES];
+
 const uint32_t layer_irqs[] = {
 	LCD_INT_VL0,
 	LCD_INT_VL1,
@@ -82,34 +84,24 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
-	int ctrl = 0;
-	struct kmb_drm_private *dev_p;
-	int plane_id;
-
-	dev_p = plane->dev->dev_private;
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
index 1872ed0..ae8e308 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -61,9 +61,11 @@ enum layer_id {
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
@@ -125,6 +127,11 @@ static const u32 csc_coef_lcd[] = {
 	-179, 125, -226
 };
 
+struct layer_status {
+	bool disable;
+	u32 ctrl;
+};
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
