Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A899E21FF34
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293D36E9CB;
	Tue, 14 Jul 2020 20:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E136E974;
 Tue, 14 Jul 2020 20:58:38 +0000 (UTC)
IronPort-SDR: yFCn+s+ebnyFRQsqIMwpkx6Ej7Tg22smnqkgXzz2X1eCITyG6Im+LwRhrmYff312WdLKs6ub6/
 LwgFRlc/svNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444594"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444594"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:38 -0700
IronPort-SDR: pW6vVHmyGewDw4WkN8KHWsuohDlVyTn6he0rk4tME7ruWK+Q92wkZ17y4jJAXdjFhzSmxSDA7Y
 kJP5Qs1NQzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504217"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:37 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 37/59] drm/kmb: Set MSS_CAM_RSTN_CTRL along with enable
Date: Tue, 14 Jul 2020 13:57:23 -0700
Message-Id: <1594760265-11618-38-git-send-email-anitha.chrisanthus@intel.com>
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
index 861aa97..64db9a1 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -58,11 +58,12 @@ static int kmb_display_clk_enable(void)
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
@@ -116,6 +117,8 @@ static void __iomem *kmb_map_mmio(struct platform_device *pdev, char *name)
 		release_mem_region(res->start, size);
 		return ERR_PTR(-ENOMEM);
 	}
+	DRM_INFO("%s : %d mapped %s mmio size = %d\n", __func__, __LINE__,
+			name, size);
 	return mem;
 }
 
@@ -130,13 +133,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
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
@@ -145,6 +141,13 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
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
@@ -169,12 +172,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
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
@@ -195,7 +192,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	if (clk_get_rate(clk_lcd) != KMB_LCD_DEFAULT_CLK) {
 		DRM_ERROR("failed to set to clk_lcd to %d\n",
 				KMB_LCD_DEFAULT_CLK);
-		goto setup_fail;
 	}
 	DRM_INFO("Setting LCD clock to %d Mhz ret = %d\n",
 			KMB_LCD_DEFAULT_CLK/1000000, ret);
@@ -245,8 +241,8 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	}
 
 	/* enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
-	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, LCD | MIPI_COMMON |
-			MIPI_TX0);
+	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, 0xfff);
+	kmb_set_bitmask_msscam(dev_p, MSS_CAM_RSTN_CTRL, 0xfff);
 #ifdef WIP
 	/* Register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
@@ -514,6 +510,7 @@ static int kmb_probe(struct platform_device *pdev)
 		dev_set_drvdata(dev, drm);
 
 	/* Load driver */
+	lcd->n_layers = KMB_MAX_PLANES;
 	ret = kmb_load(drm, 0);
 	if (ret == -EPROBE_DEFER) {
 		DRM_INFO("wait for external bridge driver DT\n");
@@ -536,7 +533,6 @@ static int kmb_probe(struct platform_device *pdev)
 	/* Register graphics device with the kernel */
 	ret = drm_dev_register(drm, 0);
 
-	lcd->n_layers = KMB_MAX_PLANES;
 	if (ret)
 		goto err_register;
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 71dc883..f3f2c34 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -8,9 +8,9 @@
 
 #include "kmb_regs.h"
 
-#define KMB_MAX_WIDTH			16384	/*max width in pixels */
-#define KMB_MAX_HEIGHT			16384	/*max height in pixels */
-#define KMB_LCD_DEFAULT_CLK		200000000
+#define KMB_MAX_WIDTH			1920 /*max width in pixels */
+#define KMB_MAX_HEIGHT			1080 /*max height in pixels */
+#define KMB_LCD_DEFAULT_CLK		24000000
 #define KMB_MIPI_DEFAULT_CLK		24000000
 
 struct kmb_drm_private {
@@ -110,17 +110,17 @@ static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned int reg)
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
@@ -131,46 +131,46 @@ static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigned int reg)
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
index 960ecfa..7b42a2fd 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -207,12 +207,12 @@ kmb_dsi_mode_valid(struct drm_connector *connector,
 
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
@@ -482,6 +482,8 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
 	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
 		<< MIPI_TX_SECT_DM_SHIFT);	/* bits [24:25] */
 	cfg |= MIPI_TX_SECT_DMA_PACKED;
+	DRM_INFO("%s : %d ctrl=%d frame_id=%d section=%d cfg=%x\n",
+			__func__, __LINE__, ctrl_no, frame_id, section, cfg);
 	kmb_write_mipi(dev_p, (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
 					section)), cfg);
 	/*unpacked bytes */
@@ -554,7 +556,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	u32 ppl_llp_ratio;
 	u32 ctrl_no = MIPI_CTRL6, reg_adr, val, offset;
 
-	/*Get system clock for blanking period cnfigurations */
+	/*Get system clock for blanking period cnfigurations*/
 	/*TODO need to get system clock from clock driver */
 	/* Assume 700 Mhz system clock for now */
 	sysclk = 700;
@@ -573,6 +575,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr, fg_cfg->v_active);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/*vsync width */
 	/*
 	 *there are 2 registers for vsync width -VSA in lines for channels 0-3
@@ -626,6 +629,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/* llp h frontporch */
 	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
 	kmb_write_mipi(dev_p, reg_adr,
@@ -787,13 +791,11 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
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
@@ -1211,13 +1213,18 @@ static void dphy_wait_fsm(struct kmb_drm_private *dev_p, u32 dphy_no,
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
@@ -1225,10 +1232,16 @@ static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
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
@@ -1236,9 +1249,15 @@ static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
 
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
index 2980764..37371e5 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -478,7 +478,7 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 	struct kmb_plane *plane = NULL;
 	struct kmb_plane *primary = NULL;
 	int i = 0;
-	int ret;
+	int ret = 0;
 	enum drm_plane_type plane_type;
 	const uint32_t *plane_formats;
 	int num_plane_formats;
@@ -487,11 +487,13 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 
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
@@ -500,13 +502,16 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
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
@@ -517,6 +522,8 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 		plane->id = i;
 	}
 
-cleanup:
 	return primary;
+cleanup:
+	kfree(plane);
+	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 207a161..0c0b146 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -693,6 +693,7 @@
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
