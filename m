Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507C21FF73
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489CF6EA15;
	Tue, 14 Jul 2020 20:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6806E9C3;
 Tue, 14 Jul 2020 20:58:49 +0000 (UTC)
IronPort-SDR: HkiEt39Q9FxT+l0qXdCe7uxlnlmCW0EhGX/nndLw3LabS8c9jzZoUgfPMLYqA9oMzZlvjQU63n
 6KaW3jE+oKOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444628"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:48 -0700
IronPort-SDR: Yb46LgvRHmGqipJYEPJ1BG7b6oDENoCHN9Ha+VZ9PxWwq8s28VwinkYq/OUHxVIFqoFLIHvbu/
 HUJ18qxKIrAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504315"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:48 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 55/59] drm/kmb: Added useful messages in LCD ISR
Date: Tue, 14 Jul 2020 13:57:41 -0700
Message-Id: <1594760265-11618-56-git-send-email-anitha.chrisanthus@intel.com>
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

Print messages for LCD DMA FIFO errors.

v2: corrected spelling

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   | 68 +++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/kmb/kmb_plane.h |  2 ++
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 55574c1..7fcab4b 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -361,15 +361,15 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 		 * disabled but actually disable the plane when EOF irq is
 		 * being handled.
 		 */
-		for (plane_id = LAYER_0; plane_id < KMB_MAX_PLANES;
-				plane_id++) {
+		for (plane_id = LAYER_0; plane_id < KMB_MAX_PLANES; plane_id++) {
 			if (plane_status[plane_id].disable) {
 				kmb_clr_bitmask_lcd(dev_p,
-					LCD_LAYERn_DMA_CFG(plane_id),
-					LCD_DMA_LAYER_ENABLE);
+						    LCD_LAYERn_DMA_CFG
+						    (plane_id),
+						    LCD_DMA_LAYER_ENABLE);
 
 				kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL,
-					plane_status[plane_id].ctrl);
+					    plane_status[plane_id].ctrl);
 
 				plane_status[plane_id].disable = false;
 			}
@@ -381,11 +381,6 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
 	}
 
-	if (status & LCD_INT_LAYER) {
-		/* Clear layer interrupts */
-		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LAYER);
-	}
-
 	if (status & LCD_INT_VERT_COMP) {
 		/* Read VSTATUS */
 		val = kmb_read_lcd(dev_p, LCD_VSTATUS);
@@ -403,6 +398,59 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 		}
 	}
 
+	if (status & LCD_INT_DMA_ERR) {
+		val = (status & LCD_INT_DMA_ERR);
+		/* LAYER0 - VL0 */
+		if (val & LAYER0_DMA_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER0:VL0 DMA UNDERFLOW val = 0x%lx", val);
+		if (val & LAYER0_DMA_FIFO_OVERFLOW)
+			DRM_INFO("LAYER0:VL0 DMA OVERFLOW val = 0x%lx", val);
+		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
+			DRM_INFO("LAYER0:VL0 DMA CB OVERFLOW val = 0x%lx", val);
+		if (val & LAYER0_DMA_CB_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER0:VL0 DMA CB UNDERFLOW val = 0x%lx",
+				 val);
+		if (val & LAYER0_DMA_CR_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER0:VL0 DMA CR UNDERFLOW val = 0x%lx",
+				 val);
+		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
+			DRM_INFO("LAYER0:VL0 DMA CR OVERFLOW val = 0x%lx", val);
+
+		/* LAYER1 - VL1 */
+		if (val & LAYER1_DMA_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER1:VL1 DMA UNDERFLOW val = 0x%lx", val);
+		if (val & LAYER1_DMA_FIFO_OVERFLOW)
+			DRM_INFO("LAYER1:VL1 DMA OVERFLOW val = 0x%lx", val);
+		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
+			DRM_INFO("LAYER1:VL1 DMA CB OVERFLOW val = 0x%lx", val);
+		if (val & LAYER1_DMA_CB_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER1:VL1 DMA CB UNDERFLOW val = 0x%lx",
+				 val);
+		if (val & LAYER1_DMA_CR_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER1:VL1 DMA CR UNDERFLOW val = 0x%lx",
+				 val);
+		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
+			DRM_INFO("LAYER1:VL1 DMA CR OVERFLOW val = 0x%lx", val);
+
+		/* LAYER2 - GL0 */
+		if (val & LAYER2_DMA_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER2:GL0 DMA UNDERFLOW val = 0x%lx", val);
+		if (val & LAYER2_DMA_FIFO_OVERFLOW)
+			DRM_INFO("LAYER2:GL0 DMA OVERFLOW val = 0x%lx", val);
+
+		/* LAYER3 - GL1 */
+		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER3:GL1 DMA UNDERFLOW val = 0x%lx", val);
+		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
+			DRM_INFO("LAYER3:GL1 DMA OVERFLOW val = 0x%lx", val);
+
+	}
+
+	if (status & LCD_INT_LAYER) {
+		/* Clear layer interrupts */
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_LAYER);
+	}
+
 	/* Clear all interrupts */
 	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, 1);
 	return IRQ_HANDLED;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index 98c48a9..d8e1ece 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -28,6 +28,8 @@
 #define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE | LCD_INT_VL1_ERR)
 #define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE | LCD_INT_GL0_ERR)
 #define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_ERR)
+#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
+		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
 
 #define POSSIBLE_CRTCS 1
 #define INITIALIZED 1
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
