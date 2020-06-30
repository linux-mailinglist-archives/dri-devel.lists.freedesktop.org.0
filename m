Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74620FF35
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2CB6E517;
	Tue, 30 Jun 2020 21:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E4C6E33C;
 Tue, 30 Jun 2020 21:28:50 +0000 (UTC)
IronPort-SDR: UuCh9RHUk99NThRlFo/BliLYFjMDJXqBnWnE9BeLDLXcNzcoBo4Vzj5KiZwTa67tdcUP8ObxLP
 ptTmdk/qmKLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846900"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846900"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:50 -0700
IronPort-SDR: AIetkrnqjog/Jy5TERysMtEV7IKpVUHioLqyiNFQyq1JHDVhw19Llus8cmtye4O1U5YV+N+/uW
 hDJJqQn+7bgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066766"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:49 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 37/59] drm/kmb: Set MSS_CAM_RSTN_CTRL along with enable
Date: Tue, 30 Jun 2020 14:27:49 -0700
Message-Id: <1593552491-23698-38-git-send-email-anitha.chrisanthus@intel.com>
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

Also moved num_planes init before load, time out for dsi
fixed kmb regs read/write to only pass dev_p and few other minor
changes.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c   | 32 ++++++++++++++------------------
 drivers/gpu/drm/kmb/kmb_drv.h   | 34 +++++++++++++++++-----------------
 drivers/gpu/drm/kmb/kmb_dsi.c   | 37 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/kmb/kmb_plane.c | 27 +++++++++++++++++----------
 drivers/gpu/drm/kmb/kmb_regs.h  |  1 +
 5 files changed, 77 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 1aedcf8..1fc0b2e 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -78,11 +78,12 @@ static int kmb_display_clk_enable(void)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(clk_msscam);
+/*	ret = clk_prepare_enable(clk_msscam);
 	if (ret) {
 		DRM_ERROR("Failed to enable MSSCAM clock: %d\n", ret);
 		return ret;
 	}
+	*/
 
 	ret = clk_prepare_enable(clk_mipi_ecfg);
 	if (ret) {
@@ -136,6 +137,8 @@ static void __iomem *kmb_map_mmio(struct platform_device *pdev, char *name)
 		release_mem_region(res->start, size);
 		return ERR_PTR(-ENOMEM);
 	}
+	DRM_INFO("%s : %d mapped %s mmio size = %d\n", __func__, __LINE__,
+			name, size);
 	return mem;
 }
 
@@ -150,13 +153,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	int ret = 0;
 	unsigned long clk;
 
-	/* Map LCD MMIO registers */
-	dev_p->lcd_mmio = kmb_map_mmio(pdev, "lcd_regs");
-	if (IS_ERR(dev_p->lcd_mmio)) {
-		DRM_ERROR("failed to map LCD registers\n");
-		return -ENOMEM;
-	}
-
 	/* Map MIPI MMIO registers */
 	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
 	if (IS_ERR(dev_p->mipi_mmio)) {
@@ -165,6 +161,13 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		return -ENOMEM;
 	}
 
+	/* Map LCD MMIO registers */
+	dev_p->lcd_mmio = kmb_map_mmio(pdev, "lcd_regs");
+	if (IS_ERR(dev_p->lcd_mmio)) {
+		DRM_ERROR("failed to map LCD registers\n");
+		return -ENOMEM;
+	}
+
 	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and MSS_CAM_CLK_CTRL
 	 * register
 	 */
@@ -189,12 +192,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
-	clk_msscam = clk_get(&pdev->dev, "clk_msscam");
-	if (IS_ERR(clk_msscam)) {
-		DRM_ERROR("clk_get() failed clk_msscam\n");
-		goto setup_fail;
-	}
-
 	clk_mipi_ecfg = clk_get(&pdev->dev, "clk_mipi_ecfg");
 	if (IS_ERR(clk_mipi_ecfg)) {
 		DRM_ERROR("clk_get() failed clk_mipi_ecfg\n");
@@ -215,7 +212,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	if (clk_get_rate(clk_lcd) != KMB_LCD_DEFAULT_CLK) {
 		DRM_ERROR("failed to set to clk_lcd to %d\n",
 				KMB_LCD_DEFAULT_CLK);
-		goto setup_fail;
 	}
 	DRM_INFO("Setting LCD clock to %d Mhz ret = %d\n",
 			KMB_LCD_DEFAULT_CLK/1000000, ret);
@@ -265,8 +261,8 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	}
 
 	/* enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
-	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, LCD | MIPI_COMMON |
-			MIPI_TX0);
+	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, 0xfff);
+	kmb_set_bitmask_msscam(dev_p, MSS_CAM_RSTN_CTRL, 0xfff);
 #ifdef WIP
 	/* Register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
@@ -528,6 +524,7 @@ static int kmb_probe(struct platform_device *pdev)
 		dev_set_drvdata(dev, drm);
 
 	/* Load driver */
+	lcd->n_layers = KMB_MAX_PLANES;
 	ret = kmb_load(drm, 0);
 	if (ret == -EPROBE_DEFER) {
 		DRM_INFO("wait for external bridge driver DT\n");
@@ -550,7 +547,6 @@ static int kmb_probe(struct platform_device *pdev)
 	/* Register graphics device with the kernel */
 	ret = drm_dev_register(drm, 0);
 
-	lcd->n_layers = KMB_MAX_PLANES;
 	if (ret)
 		goto err_register;
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 596f4fe..1511cd1 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -28,9 +28,9 @@
 
 #include "kmb_regs.h"
 
-#define KMB_MAX_WIDTH			16384	/*max width in pixels */
-#define KMB_MAX_HEIGHT			16384	/*max height in pixels */
-#define KMB_LCD_DEFAULT_CLK		200000000
+#define KMB_MAX_WIDTH			1920 /*max width in pixels */
+#define KMB_MAX_HEIGHT			1080 /*max height in pixels */
+#define KMB_LCD_DEFAULT_CLK		24000000
 #define KMB_MIPI_DEFAULT_CLK		24000000
 
 struct kmb_drm_private {
@@ -130,17 +130,17 @@ static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned int reg)
 static inline void kmb_set_bitmask_lcd(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 mask)
 {
-	u32 reg_val = kmb_read_lcd(dev_p->lcd_mmio, reg);
+	u32 reg_val = kmb_read_lcd(dev_p, reg);
 
-	kmb_write_lcd(dev_p->lcd_mmio, reg, (reg_val | mask));
+	kmb_write_lcd(dev_p, reg, (reg_val | mask));
 }
 
 static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 mask)
 {
-	u32 reg_val = kmb_read_lcd(dev_p->lcd_mmio, reg);
+	u32 reg_val = kmb_read_lcd(dev_p, reg);
 
-	kmb_write_lcd(dev_p->lcd_mmio, reg, (reg_val & (~mask)));
+	kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
 }
 
 static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigned int reg)
@@ -151,46 +151,46 @@ static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigned int reg)
 static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 offset, u32 num_bits, u32 value)
 {
-	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
+	u32 reg_val = kmb_read_mipi(dev_p, reg);
 	u32 mask = (1 << num_bits) - 1;
 
 	value &= mask;
 	mask <<= offset;
 	reg_val &= (~mask);
 	reg_val |= (value << offset);
-	kmb_write_mipi(dev_p->mipi_mmio, reg, reg_val);
+	kmb_write_mipi(dev_p, reg, reg_val);
 }
 
 static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 offset)
 {
-	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
+	u32 reg_val = kmb_read_mipi(dev_p, reg);
 
-	kmb_write_mipi(dev_p->mipi_mmio, reg, reg_val | (1 << offset));
+	kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
 }
 
 static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 offset)
 {
-	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
+	u32 reg_val = kmb_read_mipi(dev_p, reg);
 
-	kmb_write_mipi(dev_p->mipi_mmio, reg, reg_val & (~(1 << offset)));
+	kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
 }
 
 static inline void kmb_set_bitmask_mipi(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 mask)
 {
-	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
+	u32 reg_val = kmb_read_mipi(dev_p, reg);
 
-	kmb_write_mipi(dev_p->mipi_mmio, reg, (reg_val | mask));
+	kmb_write_mipi(dev_p, reg, (reg_val | mask));
 }
 
 static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private *dev_p,
 		unsigned int reg, u32 mask)
 {
-	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
+	u32 reg_val = kmb_read_mipi(dev_p, reg);
 
-	kmb_write_mipi(dev_p->mipi_mmio, reg, (reg_val & (~mask)));
+	kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
 }
 int kmb_setup_crtc(struct drm_device *dev);
 void kmb_set_scanout(struct kmb_drm_private *lcd);
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 47ec2ab..40fe552 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -227,12 +227,12 @@ kmb_dsi_mode_valid(struct drm_connector *connector,
 
 static int kmb_dsi_get_modes(struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
-	struct kmb_connector *kmb_connector = to_kmb_connector(connector);
+	int num_modes = 0;
 
-	mode = drm_mode_duplicate(connector->dev, kmb_connector->fixed_mode);
-	drm_mode_probed_add(connector, mode);
-	return 1;
+	num_modes = drm_add_modes_noedid(connector,
+			connector->dev->mode_config.max_width,
+			connector->dev->mode_config.max_height);
+	return num_modes;
 }
 
 static void kmb_dsi_connector_destroy(struct drm_connector *connector)
@@ -502,6 +502,8 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
 	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
 		<< MIPI_TX_SECT_DM_SHIFT);	/* bits [24:25] */
 	cfg |= MIPI_TX_SECT_DMA_PACKED;
+	DRM_INFO("%s : %d ctrl=%d frame_id=%d section=%d cfg=%x\n",
+			__func__, __LINE__, ctrl_no, frame_id, section, cfg);
 	kmb_write_mipi(dev_p, (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
 					section)), cfg);
 	/*unpacked bytes */
@@ -574,7 +576,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	u32 ppl_llp_ratio;
 	u32 ctrl_no = MIPI_CTRL6, reg_adr, val, offset;
 
-	/*Get system clock for blanking period cnfigurations */
+	/*Get system clock for blanking period cnfigurations*/
 	/*TODO need to get system clock from clock driver */
 	/* Assume 700 Mhz system clock for now */
 	sysclk = 700;
@@ -593,6 +595,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr, fg_cfg->v_active);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/*vsync width */
 	/*
 	 *there are 2 registers for vsync width -VSA in lines for channels 0-3
@@ -646,6 +649,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/* llp h frontporch */
 	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr,
@@ -807,13 +811,11 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 	 * set mipitxcctrlcfg
 	 */
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	for (frame_id = 0; frame_id < 4; frame_id++) {
 		/* find valid frame, assume only one valid frame */
 		if (ctrl_cfg->tx_ctrl_cfg.frames[frame_id] == NULL)
 			continue;
 
-		DRM_INFO("%s : %d\n", __func__, __LINE__);
 		/* Frame Section configuration */
 		/*TODO - assume there is only one valid section in a frame, so
 		 * bits_per_pclk and word_count are only set once
@@ -1231,13 +1233,18 @@ static void dphy_wait_fsm(struct kmb_drm_private *dev_p, u32 dphy_no,
 		enum dphy_tx_fsm fsm_state)
 {
 	enum dphy_tx_fsm val = DPHY_TX_POWERDWN;
+	int i = 0;
 
 	do {
 		test_mode_send(dev_p, dphy_no, TEST_CODE_FSM_CONTROL, 0x80);
 		/*TODO-need to add a time out and return failure */
 		val = GET_TEST_DOUT0_3(dev_p, dphy_no);
+		i++;
+		if (i > 50000) {
+			DRM_INFO("%s: timing out\n", __func__);
+			break;
+		}
 	} while (val != fsm_state);
-
 }
 
 static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
@@ -1245,10 +1252,16 @@ static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
 {
 	u32 stopstatedata = 0;
 	u32 data_lanes = (1 << active_lanes) - 1;
+	int i = 0;
 
 	do {
 		stopstatedata = GET_STOPSTATE_DATA(dev_p, dphy_no);
 		/*TODO-need to add a time out and return failure */
+		i++;
+		if (i > 50000) {
+			DRM_INFO("%s: timing out", __func__);
+			break;
+		}
 	} while (stopstatedata != data_lanes);
 
 	return 0;
@@ -1256,9 +1269,15 @@ static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
 
 static u32 wait_pll_lock(struct kmb_drm_private *dev_p, u32 dphy_no)
 {
+	int i = 0;
 	do {
 		;
 		/*TODO-need to add a time out and return failure */
+		i++;
+		if (i > 50000) {
+			DRM_INFO("wait_pll_lock: timing out\n");
+			break;
+		}
 	} while (!GET_PLL_LOCK(dev_p, dphy_no));
 
 	return 0;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 026df49..de5ca88 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -498,7 +498,7 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 	struct kmb_plane *plane = NULL;
 	struct kmb_plane *primary = NULL;
 	int i = 0;
-	int ret;
+	int ret = 0;
 	enum drm_plane_type plane_type;
 	const uint32_t *plane_formats;
 	int num_plane_formats;
@@ -507,11 +507,13 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 
 		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
 
-		if (!plane)
+		if (!plane) {
+			DRM_ERROR("Failed to allocate plane\n");
 			return ERR_PTR(-ENOMEM);
+		}
 
 		plane_type = (i == 0) ? DRM_PLANE_TYPE_PRIMARY :
-		    DRM_PLANE_TYPE_OVERLAY;
+			DRM_PLANE_TYPE_OVERLAY;
 		if (i < 2) {
 			plane_formats = kmb_formats_v;
 			num_plane_formats = ARRAY_SIZE(kmb_formats_v);
@@ -520,13 +522,16 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 			num_plane_formats = ARRAY_SIZE(kmb_formats_g);
 		}
 
-		ret =
-		    drm_universal_plane_init(drm, &plane->base_plane,
-					     POSSIBLE_CRTCS, &kmb_plane_funcs,
-					     plane_formats, num_plane_formats,
-					     NULL, plane_type, "plane %d", i);
-		if (ret < 0)
+		ret = drm_universal_plane_init(drm, &plane->base_plane,
+				POSSIBLE_CRTCS,
+				&kmb_plane_funcs, plane_formats,
+					num_plane_formats,
+					NULL, plane_type, "plane %d", i);
+		if (ret < 0) {
+			DRM_ERROR("drm_universal_plane_init -failed with ret=%d"
+					, ret);
 			goto cleanup;
+		}
 
 		drm_plane_helper_add(&plane->base_plane,
 				     &kmb_plane_helper_funcs);
@@ -537,6 +542,8 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 		plane->id = i;
 	}
 
-cleanup:
 	return primary;
+cleanup:
+	kfree(plane);
+	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 2377439..9ca7851 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -713,6 +713,7 @@
 #define   LCD				(1<<1)
 #define   MIPI_COMMON			(1<<2)
 #define   MIPI_TX0			(1<<9)
+#define MSS_CAM_RSTN_CTRL		(0x14)
 
 #define BIT_MASK_16				(0xffff)
 #endif /* __KMB_REGS_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
