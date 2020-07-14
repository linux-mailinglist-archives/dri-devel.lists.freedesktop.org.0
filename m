Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1141421FF5E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECA96E9E9;
	Tue, 14 Jul 2020 20:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50526E9AC;
 Tue, 14 Jul 2020 20:58:43 +0000 (UTC)
IronPort-SDR: u7gxgSeNEn4g3iF19CSc3LB1sLaFefLVANd/HIi0Ag+LjlkiE7E4S4MUepDAoBxZA6xjodQYmB
 6NmmU0PlmWNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444611"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444611"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:43 -0700
IronPort-SDR: LXnUDVJH6HivYOAbEDtXhRu4OY19e4bDWtU/Gm7H/LDyo1XQDJ4Ecc/4lw63SruUkQSNXGKU4p
 BtE5Ng0MVbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504264"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:42 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 46/59] drm/kmb: Enable LCD interrupts during modeset
Date: Tue, 14 Jul 2020 13:57:32 -0700
Message-Id: <1594760265-11618-47-git-send-email-anitha.chrisanthus@intel.com>
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

The issue was that spurious interrupts were happening before the LCD
controller was enabled and system hangs. Fix is to
clear LCD interrupts and disable them before modeset
and re enable them after enabling LCD controller.

v2: upclassed dev_private

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 12 +++++++++---
 drivers/gpu/drm/kmb/kmb_drv.c  | 21 +++------------------
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 589a841..c390bbe 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -78,6 +78,7 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int vsync_start_offset;
 	int vsync_end_offset;
 	struct kmb_drm_private *dev_p = to_kmb(dev);
+	unsigned int val = 0;
 
 	/* initialize mipi */
 	kmb_dsi_hw_init(dev, m);
@@ -88,6 +89,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 			m->crtc_hsync_start - m->crtc_hdisplay,
 			m->crtc_htotal - m->crtc_hsync_end,
 			m->crtc_hsync_end - m->crtc_hsync_start);
+	val = kmb_read_lcd(dev_p, LCD_INT_ENABLE);
+	kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE, val);
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, ~0x0);
 //	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
 	vm.vfront_porch = 2;
 //	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
@@ -136,9 +140,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		kmb_write_lcd(dev_p, LCD_VSYNC_START_EVEN, 10);
 		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN, 10);
 	}
-	/* enable VL1 layer as default */
 	kmb_write_lcd(dev_p, LCD_TIMING_GEN_TRIG, ENABLE);
 	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, LCD_CTRL_ENABLE);
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE, val);
 #endif
 	/* TBD */
 	/* set clocks here */
@@ -170,8 +174,9 @@ static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
 				  struct drm_crtc_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct kmb_drm_private *dev_p = to_kmb(dev);
 
-	kmb_clr_bitmask_lcd(dev->dev_private, LCD_INT_ENABLE,
+	kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
 			LCD_INT_VERT_COMP);
 }
 
@@ -179,8 +184,9 @@ static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_crtc_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct kmb_drm_private *dev_p = to_kmb(dev);
 
-	kmb_set_bitmask_lcd(dev->dev_private, LCD_INT_ENABLE,
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE,
 			LCD_INT_VERT_COMP);
 
 	spin_lock_irq(&crtc->dev->event_lock);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index e6aa32c..308036e 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -37,8 +37,6 @@ static irqreturn_t kmb_isr(int irq, void *arg);
 
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
-static struct clk *clk_msscam;
-static struct clk *clk_pll0out0;
 static struct clk *clk_mipi_ecfg;
 static struct clk *clk_mipi_cfg;
 
@@ -59,12 +57,6 @@ int kmb_display_clk_enable(void)
 		DRM_ERROR("Failed to enable MIPI clock: %d\n", ret);
 		return ret;
 	}
-/*	ret = clk_prepare_enable(clk_msscam);
-	if (ret) {
-		DRM_ERROR("Failed to enable MSSCAM clock: %d\n", ret);
-		return ret;
-	}
-	*/
 
 	ret = clk_prepare_enable(clk_mipi_ecfg);
 	if (ret) {
@@ -87,8 +79,6 @@ static int kmb_display_clk_disable(void)
 		clk_disable_unprepare(clk_lcd);
 	if (clk_mipi)
 		clk_disable_unprepare(clk_mipi);
-	if (clk_msscam)
-		clk_disable_unprepare(clk_msscam);
 	if (clk_mipi_ecfg)
 		clk_disable_unprepare(clk_mipi_ecfg);
 	if (clk_mipi_cfg)
@@ -180,14 +170,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_ERROR("clk_get() failed clk_mipi\n");
 		goto setup_fail;
 	}
-	clk_pll0out0 = clk_get(&pdev->dev, "clk_pll0_out0");
-	if (IS_ERR(clk_pll0out0))
-		DRM_ERROR("clk_get() failed clk_pll0_out0\n");
-
-	if (clk_pll0out0)
-		DRM_INFO("Get clk_pll0out0 = %ld\n",
-				clk_get_rate(clk_pll0out0));
-
 	clk_mipi_ecfg = clk_get(&pdev->dev, "clk_mipi_ecfg");
 	if (IS_ERR(clk_mipi_ecfg)) {
 		DRM_ERROR("clk_get() failed clk_mipi_ecfg\n");
@@ -394,6 +376,9 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 			break;
 		}
 	}
+
+	/* clear all interrupts */
+	kmb_set_bitmask_lcd(dev->dev_private, LCD_INT_CLEAR, ~0x0);
 	return IRQ_HANDLED;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
