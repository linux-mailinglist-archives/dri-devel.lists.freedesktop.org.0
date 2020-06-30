Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BACDB20FF33
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D4A6E4CD;
	Tue, 30 Jun 2020 21:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1F36E34D;
 Tue, 30 Jun 2020 21:28:56 +0000 (UTC)
IronPort-SDR: DHWAAVi+S02eNRBjRz5DV/xr+h4t88HNRMGNLUuYnR+Tj1IuFQKS58djDRh3hYh+kIc+riTZue
 Ic1rXU/yEaaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="143867595"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="143867595"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:56 -0700
IronPort-SDR: cQGw12HiFpHjFPMX60EB+mTfY7vGBXZdHQBcT1PvqSR39mou4owsxreHjiEaKeWidMeGYKXwXy
 vH9zgFBoTGgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066860"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:56 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 55/59] drm/kmb: Added useful messages in LCD ISR
Date: Tue, 30 Jun 2020 14:28:07 -0700
Message-Id: <1593552491-23698-56-git-send-email-anitha.chrisanthus@intel.com>
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

Print messages for LCD DMA FIFO errors.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   | 68 +++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/kmb/kmb_plane.h |  2 ++
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 79ab0bc..f8894d3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -383,15 +383,15 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
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
@@ -403,11 +403,6 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
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
@@ -425,6 +420,59 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 		}
 	}
 
+	if (status & LCD_INT_DMA_ERR) {
+		val = (status & LCD_INT_DMA_ERR);
+		/* LAYER0 - VL0 */
+		if (val & LAYER0_DMA_FIFO_UNDEFLOW)
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
index ae8e308..af0d091 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -48,6 +48,8 @@
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
