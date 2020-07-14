Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22521FF53
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A006E9E7;
	Tue, 14 Jul 2020 20:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958886E974;
 Tue, 14 Jul 2020 20:58:40 +0000 (UTC)
IronPort-SDR: p1Vimg/23U1u1DrcqbXmVnAPE+1BDwiy6pvlkke166J3WXPQbGwTgQwvLnwnqCMwT/X8Y5fse7
 bRaURM28C7cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444600"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444600"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:40 -0700
IronPort-SDR: dpN0pYTohEoFtBwBFwiA5fUrt5lDWBq8bO7X5syN0jCEvF3O7c2z3ltDSAMBiaGehaipz5UDKW
 kbPwJiIJi0uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504231"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:39 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 40/59] drm/kmb: Added LCD_TEST config
Date: Tue, 14 Jul 2020 13:57:26 -0700
Message-Id: <1594760265-11618-41-git-send-email-anitha.chrisanthus@intel.com>
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

To run modetest without ADV driver, enable LCD_TEST and FCC_TEST.
Also made front porches 0, and some changes in the plane init.

v2: upclassed dev_private

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  | 13 +++----
 drivers/gpu/drm/kmb/kmb_drv.c   |  6 +--
 drivers/gpu/drm/kmb/kmb_drv.h   |  3 +-
 drivers/gpu/drm/kmb/kmb_dsi.c   | 85 +++++++++++++++++++++++++++--------------
 drivers/gpu/drm/kmb/kmb_plane.c | 15 ++++++--
 5 files changed, 78 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 21b2d7f..f77e6f5 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -81,14 +81,15 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct videomode vm;
 	int vsync_start_offset;
 	int vsync_end_offset;
-	unsigned int ctrl = 0;
 	struct kmb_drm_private *dev_p = to_kmb(dev);
 #endif
 	/* initialize mipi */
 	kmb_dsi_hw_init(dev);
 #ifdef LCD_TEST
-	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
-	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
+//	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
+	vm.vfront_porch = 0;
+//	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
+	vm.vback_porch = 0;
 	vm.vsync_len = m->crtc_vsync_end - m->crtc_vsync_start;
 	//vm.hfront_porch = m->crtc_hsync_start - m->crtc_hdisplay;
 	vm.hfront_porch = 0;
@@ -131,12 +132,8 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN, 10);
 	}
 	/* enable VL1 layer as default */
-	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE;
-	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-		| LCD_CTRL_OUTPUT_ENABLED;
-	kmb_write_lcd(dev_p, LCD_CONTROL, ctrl);
-
 	kmb_write_lcd(dev_p, LCD_TIMING_GEN_TRIG, ENABLE);
+	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, LCD_CTRL_ENABLE);
 #endif
 	/* TBD */
 	/* set clocks here */
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 3542de7..8bd3011 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -216,6 +216,8 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 #endif
 	/* Set MIPI clock to 24 Mhz*/
 	DRM_INFO("Get clk_mipi before set = %ld\n", clk_get_rate(clk_mipi));
+//#define MIPI_CLK
+#ifdef MIPI_CLK
 	ret = clk_set_rate(clk_mipi, KMB_MIPI_DEFAULT_CLK);
 	DRM_INFO("Get clk_mipi after set = %ld\n", clk_get_rate(clk_mipi));
 	if (clk_get_rate(clk_mipi) != KMB_MIPI_DEFAULT_CLK) {
@@ -223,6 +225,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 				KMB_MIPI_DEFAULT_CLK);
 		goto setup_fail;
 	}
+#endif
 	DRM_INFO("Setting MIPI clock to %d Mhz ret = %d\n",
 			KMB_MIPI_DEFAULT_CLK/1000000, ret);
 	DRM_INFO("Get clk_mipi after set = %ld\n", clk_get_rate(clk_mipi));
@@ -319,8 +322,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_ERROR("failed to initialize DSI\n");
 		goto setup_fail;
 	}
-
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 #ifdef WIP
 	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
 	if (ret < 0) {
@@ -335,7 +336,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	drm_crtc_cleanup(&dev_p->crtc);
 #endif
 setup_fail:
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	of_reserved_mem_device_release(drm->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 7e44446..89d7845 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -8,7 +8,8 @@
 
 #include "kmb_regs.h"
 
-/*#define FCCTEST*/
+#define FCCTEST
+#define LCD_TEST
 #define KMB_MAX_WIDTH			1920 /*max width in pixels */
 #define KMB_MAX_HEIGHT			1080 /*max height in pixels */
 #define KMB_LCD_DEFAULT_CLK		250000000
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 9da9d9f..c23719c 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -24,18 +24,19 @@
 
 static int hw_initialized;
 #define IMAGE_PATH "/home/root/1280x720.pnm"
-#define MIPI_TX_TEST_PATTERN_GENERATION
+//#define MIPI_TX_TEST_PATTERN_GENERATION
+//#define RTL_TEST
+//#define IMG_WIDTH_PX      640
+//#define IMG_HEIGHT_LINES  10
 
-#define IMG_HEIGHT_LINES  720
-#define IMG_WIDTH_PX      1280
 #define LCD_BYTESPP       1
 
 /*MIPI TX CFG*/
-#define MIPI_TX_ACTIVE_LANES  2
 //#define MIPI_TX_LANE_DATA_RATE_MBPS 1782
 #define MIPI_TX_LANE_DATA_RATE_MBPS 891
 //#define MIPI_TX_LANE_DATA_RATE_MBPS 80
 #define MIPI_TX_REF_CLK_KHZ         24000
+//#define MIPI_TX_REF_CLK_KHZ         23809
 #define MIPI_TX_CFG_CLK_KHZ         24000
 
 /*DPHY Tx test codes*/
@@ -79,6 +80,18 @@ static struct mipi_dsi_device *dsi_device;
  * these will eventually go to the device tree sections,
  * and can be used as a refernce later for device tree additions
  */
+#ifdef RES_1920x1080
+#define IMG_HEIGHT_LINES  1080
+#define IMG_WIDTH_PX      1920
+#define MIPI_TX_ACTIVE_LANES 4
+#endif
+
+#define RES_1280x720
+#ifdef RES_1280x720
+#define IMG_HEIGHT_LINES  720
+#define IMG_WIDTH_PX      1280
+#define MIPI_TX_ACTIVE_LANES 2
+#endif
 struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
 	.width_pixels = IMG_WIDTH_PX,
 	.height_lines = IMG_HEIGHT_LINES,
@@ -88,6 +101,22 @@ struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
 	.dma_packed = 1
 };
 
+#ifdef RES_1920x1080
+struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
+	.sections[0] = &mipi_tx_frame0_sect_cfg,
+	.sections[1] = NULL,
+	.sections[2] = NULL,
+	.sections[3] = NULL,
+	.vsync_width = 5,
+	.v_backporch = 36,
+	.v_frontporch = 4,
+	.hsync_width = 44,
+	.h_backporch = 148,
+	.h_frontporch = 88
+};
+#endif
+
+#ifdef RES_1280x720
 struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
 	.sections[0] = &mipi_tx_frame0_sect_cfg,
 	.sections[1] = NULL,
@@ -100,6 +129,7 @@ struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
 	.h_backporch = 220,
 	.h_frontporch = 110,
 };
+#endif
 
 struct mipi_tx_dsi_cfg mipitx_dsi_cfg = {
 	.hfp_blank_en = 0,
@@ -121,8 +151,7 @@ struct mipi_ctrl_cfg mipi_tx_init_cfg = {
 	.lane_rate_mbps = MIPI_TX_LANE_DATA_RATE_MBPS,
 	.ref_clk_khz = MIPI_TX_REF_CLK_KHZ,
 	.cfg_clk_khz = MIPI_TX_CFG_CLK_KHZ,
-//      .data_if = MIPI_IF_PARALLEL,
-	.data_if = MIPI_IF_DMA,
+	.data_if = MIPI_IF_PARALLEL,
 	.tx_ctrl_cfg = {
 			.frames[0] = &mipitx_frame0_cfg,
 			.frames[1] = NULL,
@@ -314,7 +343,6 @@ static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
 
 struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 {
-	struct device_node *encoder_node;
 	struct drm_bridge *bridge;
 
 	/* Create and register MIPI DSI host */
@@ -593,7 +621,13 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	ppl_llp_ratio = ((fg_cfg->bpp / 8) * sysclk * 1000) /
 	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
 
-	/*frame generator number of lines */
+	DRM_INFO("%s : %d bpp=%d sysclk=%d lane-rate=%d activ-lanes=%d\n",
+			__func__, __LINE__, fg_cfg->bpp, sysclk,
+			fg_cfg->lane_rate_mbps, fg_cfg->active_lanes);
+
+	DRM_INFO("%s : %d ppl_llp_ratio=%d\n", __func__, __LINE__,
+			ppl_llp_ratio);
+	/*frame generator number of lines*/
 	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr, fg_cfg->v_active);
 
@@ -754,8 +788,8 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	if (ctrl_cfg->tx_ctrl_cfg.tx_hact_wait_stop)
 		sync_cfg |= HACT_WAIT_STOP(fg_en);
 
-	/* MIPI_TX_HS_CTRL */
-	ctrl = HS_CTRL_EN;	/* type:DSI,source:LCD */
+	/* MIPI_TX_HS_CTRL*/
+	ctrl = HS_CTRL_EN | TX_SOURCE; /* type:DSI,source:LCD */
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->eotp_en)
 		ctrl |= DSI_EOTP_EN;
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blank_en)
@@ -842,6 +876,7 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 		active_vchannels++;
 
 		/*connect lcd to mipi */
+		kmb_write_msscam(dev_p, MSS_LCD_MIPI_CFG, 1);
 
 		/*stop iterating as only one virtual channel shall be used for
 		 * LCD connection
@@ -1508,7 +1543,7 @@ static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
 				 kmb_read_mipi(dev_p, MIPI_DPHY_ERR_STAT6_7));
 			break;
 		}
-		udelay(1);
+//		udelay(1);
 	} while (stopstatedata != data_lanes);
 
 	DRM_INFO("********** DPHY %d INIT - %s **********\n",
@@ -1523,10 +1558,9 @@ static u32 wait_pll_lock(struct kmb_drm_private *dev_p, u32 dphy_no)
 	int status = 1;
 
 	do {
-		;
 		/*TODO-need to add a time out and return failure */
 		i++;
-		udelay(1);
+	//	udelay(1);
 		if (i > TIMEOUT) {
 			status = 0;
 			DRM_INFO("%s: timing out", __func__);
@@ -1583,7 +1617,7 @@ static u32 mipi_tx_init_dphy(struct kmb_drm_private *dev_p,
 			       cfg->active_lanes - MIPI_DPHY_D_LANES);
 		wait_pll_lock(dev_p, dphy_no);
 		wait_pll_lock(dev_p, dphy_no + 1);
-		udelay(1000);
+//		udelay(1000);
 		dphy_wait_fsm(dev_p, dphy_no, DPHY_TX_IDLE);
 	} else {		/* Single DPHY */
 		dphy_init_sequence(dev_p, cfg, dphy_no, cfg->active_lanes,
@@ -1707,11 +1741,9 @@ int kmb_kernel_read(struct file *file, loff_t offset,
 int kmb_dsi_hw_init(struct drm_device *dev)
 {
 	struct kmb_drm_private *dev_p = to_kmb(dev);
-	int i;
 
 	if (hw_initialized)
 		return 0;
-	udelay(1000);
 	kmb_write_mipi(dev_p, DPHY_ENABLE, 0);
 	kmb_write_mipi(dev_p, DPHY_INIT_CTRL0, 0);
 	kmb_write_mipi(dev_p, DPHY_INIT_CTRL1, 0);
@@ -1719,19 +1751,15 @@ int kmb_dsi_hw_init(struct drm_device *dev)
 
 	/* initialize mipi controller */
 	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
-	/* irq initialization */
-	//mipi_tx_init_irqs(dev_p, &int_cfg, &mipi_tx_init_cfg.tx_ctrl_cfg);
 	/*d-phy initialization */
 	mipi_tx_init_dphy(dev_p, &mipi_tx_init_cfg);
 #ifdef MIPI_TX_TEST_PATTERN_GENERATION
-	for (i = MIPI_CTRL6; i < MIPI_CTRL6 + 1; i++) {
-		mipi_tx_hs_tp_gen(dev_p, 0, MIPI_TX_HS_TP_V_STRIPES,
-				  0x05, 0xffffff, 0xff00, i);
-	}
-	DRM_INFO("%s : %d MIPI_TXm_HS_CTRL = 0x%x\n", __func__,
-		 __LINE__, kmb_read_mipi(dev_p, MIPI_TXm_HS_CTRL(6)));
-#else
-	dma_data_length = image_height * image_width * unpacked_bytes;
+	mipi_tx_hs_tp_gen(dev_p, 0, MIPI_TX_HS_TP_V_STRIPES, 0x15, 0xff,
+			0xff00, MIPI_CTRL6);
+	DRM_INFO("%s : %d IRQ_STATUS = 0x%x\n", __func__, __LINE__,
+			GET_MIPI_TX_HS_IRQ_STATUS(dev_p, MIPI_CTRL6));
+#elseif MIPI_DMA
+	  dma_data_length = image_height * image_width * unpacked_bytes;
 	file = filp_open(IMAGE_PATH, O_RDWR, 0);
 	if (IS_ERR(file)) {
 		DRM_ERROR("filp_open failed\n");
@@ -1765,7 +1793,6 @@ int kmb_dsi_hw_init(struct drm_device *dev)
 	DRM_INFO("count = %d\n", count);
 	kfree(file_buf);
 	filp_close(file, NULL);
-
 #endif //MIPI_TX_TEST_PATTERN_GENERATION
 
 	hw_initialized = true;
@@ -1834,13 +1861,15 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 		return ret;
 	}
 #endif
+
 #ifndef FCCTEST
 	DRM_INFO("%s : %d Bridge attached : SUCCESS\n", __func__, __LINE__);
 #endif
 
 #ifdef FCCTEST
+#ifndef LCD_TEST
 	kmb_dsi_hw_init(dev);
 #endif
-
+#endif
 	return 0;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 1a40ef0..c57f06f 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -345,10 +345,14 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE, layer_irqs[plane_id]);
 
 	/*TBD check visible? */
-
+/*
 	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_AUTO_UPDATE
 		  | LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_1
 		  | LCD_DMA_LAYER_VSTRIDE_EN;
+*/
+	dma_cfg = LCD_DMA_LAYER_ENABLE
+		  | LCD_DMA_LAYER_AXI_BURST_1
+		  | LCD_DMA_LAYER_VSTRIDE_EN;
 
 	/* disable DMA first */
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
@@ -425,10 +429,12 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		break;
 	}
 
-	ctrl |= LCD_CTRL_ENABLE;
-	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-		| LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
+//	ctrl |= LCD_CTRL_ENABLE;
+//	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
+//		| LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
 
+	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
+		| LCD_CTRL_ONE_SHOT | LCD_CTRL_OUTPUT_ENABLED;
 	/*LCD is connected to MIPI on kmb
 	 * Therefore this bit is required for DSI Tx
 	 */
@@ -452,6 +458,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	/* do not interleave RGB channels for mipi Tx compatibility */
 	out_format |= LCD_OUTF_MIPI_RGB_MODE;
 	kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
+//	kmb_write_lcd(dev_p, LCD_CONTROL, LCD_CTRL_ENABLE);
 #endif
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
