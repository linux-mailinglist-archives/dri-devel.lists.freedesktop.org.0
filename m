Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111120FF14
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902726E47A;
	Tue, 30 Jun 2020 21:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0D66E33F;
 Tue, 30 Jun 2020 21:28:53 +0000 (UTC)
IronPort-SDR: wr3Pj2crJBG8nEXTrBiPqh24nVCOgJHN3gl1DKvdP+dfCQsuIhE6qjFTxtDueO3BUhaYuZ8z5j
 aeuLqeXAcTRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846932"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846932"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:53 -0700
IronPort-SDR: a9lYp27CSx4RfhHGF44xziTadVlGeB3ERO13vjmovCdaeNSXPpQkeN35CU0ld92vgR2aw/muIJ
 6jWQsVTeelNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066813"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:52 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 46/59] drm/kmb: Enable LCD interrupts during modeset
Date: Tue, 30 Jun 2020 14:27:58 -0700
Message-Id: <1593552491-23698-47-git-send-email-anitha.chrisanthus@intel.com>
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

The issue was that spurious interrupts were happening before the LCD
controller was enabled and system hangs. Fix is to
clear LCD interrupts and disable them before modeset
and re enable them after enabling LCD controller.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c |  6 +++++-
 drivers/gpu/drm/kmb/kmb_drv.c  | 21 +++------------------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index b617507..16f6c7f 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -97,6 +97,7 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct videomode vm;
 	int vsync_start_offset;
 	int vsync_end_offset;
+	unsigned int val = 0;
 
 	/* initialize mipi */
 	kmb_dsi_hw_init(dev, m);
@@ -107,6 +108,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 			m->crtc_hsync_start - m->crtc_hdisplay,
 			m->crtc_htotal - m->crtc_hsync_end,
 			m->crtc_hsync_end - m->crtc_hsync_start);
+	val = kmb_read_lcd(dev->dev_private, LCD_INT_ENABLE);
+	kmb_clr_bitmask_lcd(dev->dev_private, LCD_INT_ENABLE, val);
+	kmb_set_bitmask_lcd(dev->dev_private, LCD_INT_CLEAR, ~0x0);
 //	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
 	vm.vfront_porch = 2;
 //	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
@@ -155,9 +159,9 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		kmb_write_lcd(dev->dev_private, LCD_VSYNC_START_EVEN, 10);
 		kmb_write_lcd(dev->dev_private, LCD_VSYNC_END_EVEN, 10);
 	}
-	/* enable VL1 layer as default */
 	kmb_write_lcd(dev->dev_private, LCD_TIMING_GEN_TRIG, ENABLE);
 	kmb_set_bitmask_lcd(dev->dev_private, LCD_CONTROL, LCD_CTRL_ENABLE);
+	kmb_set_bitmask_lcd(dev->dev_private, LCD_INT_ENABLE, val);
 #endif
 	/* TBD */
 	/* set clocks here */
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index d987529..26d004c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -57,8 +57,6 @@ static irqreturn_t kmb_isr(int irq, void *arg);
 
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
-static struct clk *clk_msscam;
-static struct clk *clk_pll0out0;
 static struct clk *clk_mipi_ecfg;
 static struct clk *clk_mipi_cfg;
 
@@ -79,12 +77,6 @@ int kmb_display_clk_enable(void)
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
@@ -107,8 +99,6 @@ static int kmb_display_clk_disable(void)
 		clk_disable_unprepare(clk_lcd);
 	if (clk_mipi)
 		clk_disable_unprepare(clk_mipi);
-	if (clk_msscam)
-		clk_disable_unprepare(clk_msscam);
 	if (clk_mipi_ecfg)
 		clk_disable_unprepare(clk_mipi_ecfg);
 	if (clk_mipi_cfg)
@@ -200,14 +190,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
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
@@ -413,6 +395,9 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
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
