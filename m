Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC9A93294
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 08:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCFD10E410;
	Fri, 18 Apr 2025 06:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HPm63S7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1329910E414
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 06:53:31 +0000 (UTC)
X-UUID: d1fa7c821c2111f08eb9c36241bbb6fb-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0kRc9HnVrI7LEoY76FPHw3pyLR0p0iDW2wjxGdQrlbE=; 
 b=HPm63S7IZcu0Ljx04oT/aArQ4WrN6dUvPMF7fZCfpN6FNDGXRKw5nvfc1jY9A1qdsE/ikF5cCzycWrk7BGofYv2xPDyGDs45q9zNiAlC84YnPwXduVgf2cn7yhEYJ9ypuKnsdBswzP6W2ZTDCjgzlP+xZHUgFdLc2tL2/bWzM20=;
X-CID-CACHE: Type:Local,Time:202504181451+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:519b2ad4-c089-444b-bce7-438696761d9b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:3593b9c7-16da-468a-87f7-8ca8d6b3b9f7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d1fa7c821c2111f08eb9c36241bbb6fb-20250418
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <bincai.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1305190930; Fri, 18 Apr 2025 14:53:23 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 14:53:21 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 14:53:20 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, CK Hu
 <ck.hu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 3/5] drm/mediatek: Add dvo driver for mt8196
Date: Fri, 18 Apr 2025 14:52:30 +0800
Message-ID: <20250418065313.8972-4-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418065313.8972-1-bincai.liu@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add code to support dvo for mt8196.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   5 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 240 ++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  66 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
 6 files changed, 284 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e6..7fbb9509fb0e 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -445,6 +445,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DP_INTF] = "dp-intf",
 	[MTK_DPI] = "dpi",
 	[MTK_DSI] = "dsi",
+	[MTK_DVO] = "dvo",
 };
 
 struct mtk_ddp_comp_match {
@@ -472,6 +473,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_DSI1]		= { MTK_DSI,			1, &ddp_dsi },
 	[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
 	[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
+	[DDP_COMPONENT_DVO0]            = { MTK_DVO,                    0, &ddp_dpi },
 	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
 	[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
 	[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
@@ -662,7 +664,8 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
 	    type == MTK_DP_INTF ||
-	    type == MTK_DSI)
+	    type == MTK_DSI ||
+	    type == MTK_DVO)
 		return 0;
 
 	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 39720b27f4e9..daa98a594acb 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -43,6 +43,7 @@ enum mtk_ddp_comp_type {
 	MTK_DPI,
 	MTK_DP_INTF,
 	MTK_DSI,
+	MTK_DVO,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0f3b1ef8e497..98d385905a0e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -62,6 +62,29 @@ enum mtk_dpi_out_color_format {
 	MTK_DPI_COLOR_FORMAT_YCBCR_422
 };
 
+enum mtk_dpi_golden_setting_level {
+	MTK_DPI_FHD_60FPS_1920 = 0,
+	MTK_DPI_FHD_60FPS_2180,
+	MTK_DPI_FHD_60FPS_2400,
+	MTK_DPI_FHD_60FPS_2520,
+	MTK_DPI_FHD_90FPS,
+	MTK_DPI_FHD_120FPS,
+	MTK_DPI_WQHD_60FPS,
+	MTK_DPI_WQHD_120FPS,
+	MTK_DPI_8K_30FPS,
+	MTK_DPI_GSL_MAX,
+};
+
+enum mtk_dpi_type {
+	MTK_DISP_DPI = 0,
+	MTK_DSIP_DVO,
+};
+
+struct mtk_dpi_gs_info {
+	u32 dpi_buf_sodi_high;
+	u32 dpi_buf_sodi_low;
+};
+
 struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
@@ -73,6 +96,7 @@ struct mtk_dpi {
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
+	struct clk *hf_fdpi_clk;
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -85,6 +109,7 @@ struct mtk_dpi {
 	struct pinctrl_state *pins_dpi;
 	u32 output_fmt;
 	int refcount;
+	enum mtk_dpi_golden_setting_level gs_level;
 };
 
 static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
@@ -171,6 +196,13 @@ struct mtk_dpi_conf {
 	bool edge_cfg_in_mmsys;
 	bool clocked_by_hdmi;
 	bool output_1pixel;
+	u32 out_np_sel;
+	u8 dpi_ver;
+};
+
+static struct mtk_dpi_gs_info mtk_dpi_gs[MTK_DPI_GSL_MAX] = {
+	[MTK_DPI_FHD_60FPS_1920] = {6880, 511},
+	[MTK_DPI_8K_30FPS] = {5255, 3899},
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -208,6 +240,86 @@ static void mtk_dpi_disable(struct mtk_dpi *dpi)
 	mtk_dpi_mask(dpi, DPI_EN, 0, EN);
 }
 
+static void mtk_dpi_irq_enable(struct mtk_dpi *dpi)
+{
+	mtk_dpi_mask(dpi, DPI_INTEN, INT_VDE_END_EN, INT_VDE_END_EN);
+}
+
+static void mtk_dpi_info_queue_start(struct mtk_dpi *dpi)
+{
+	mtk_dpi_mask(dpi, DPI_TGEN_INFOQ_LATENCY, 0,
+		     INFOQ_START_LATENCY_MASK | INFOQ_END_LATENCY_MASK);
+}
+
+static void mtk_dpi_buffer_ctrl(struct mtk_dpi *dpi)
+{
+	mtk_dpi_mask(dpi, DPI_BUF_CON0, DISP_BUF_EN, DISP_BUF_EN);
+	mtk_dpi_mask(dpi, DPI_BUF_CON0, FIFO_UNDERFLOW_DONE_BLOCK, FIFO_UNDERFLOW_DONE_BLOCK);
+}
+
+static void mtk_dpi_trailing_blank_setting(struct mtk_dpi *dpi)
+{
+	mtk_dpi_mask(dpi, DPI_TGEN_V_LAST_TRAILING_BLANK, 0x20, V_LAST_TRAILING_BLANK_MASK);
+	mtk_dpi_mask(dpi, DPI_TGEN_OUTPUT_DELAY_LINE, 0x20, EXT_TG_DLY_LINE_MASK);
+}
+
+static void mtk_dpi_get_gs_level(struct mtk_dpi *dpi)
+{
+	struct drm_display_mode *mode = &dpi->mode;
+	enum mtk_dpi_golden_setting_level *gsl = &dpi->gs_level;
+
+	if (mode->hdisplay == 1920 && mode->vdisplay == 1080)
+		*gsl = MTK_DPI_FHD_60FPS_1920;
+	else
+		*gsl = MTK_DPI_8K_30FPS;
+}
+
+static void mtk_dpi_golden_setting(struct mtk_dpi *dpi)
+{
+	struct mtk_dpi_gs_info *gs_info = NULL;
+
+	if (dpi->gs_level >= MTK_DPI_GSL_MAX) {
+		dev_info(dpi->dev, "%s invalid gs_level %d\n",
+			 __func__, dpi->gs_level);
+		return;
+	}
+
+	gs_info = &mtk_dpi_gs[dpi->gs_level];
+
+	mtk_dpi_mask(dpi, DPI_BUF_SODI_HIGHT, gs_info->dpi_buf_sodi_high, GENMASK(31, 0));
+	mtk_dpi_mask(dpi, DPI_BUF_SODI_LOW, gs_info->dpi_buf_sodi_low, GENMASK(31, 0));
+}
+
+static void mtk_dpi_shadow_ctrl(struct mtk_dpi *dpi)
+{
+	mtk_dpi_mask(dpi, DPI_SHADOW_CTRL, 0, BYPASS_SHADOW);
+	mtk_dpi_mask(dpi, DPI_SHADOW_CTRL, FORCE_COMMIT, FORCE_COMMIT);
+}
+
+static void mtk_dpi_config_timing(struct mtk_dpi *dpi,
+				 struct mtk_dpi_sync_param *hsync,
+				 struct mtk_dpi_sync_param *vsync)
+{
+	mtk_dpi_mask(dpi, DPI_TGEN_H0,
+		     hsync->sync_width << HSYNC,
+		     dpi->conf->dimension_mask << HSYNC);
+	mtk_dpi_mask(dpi, DPI_TGEN_H0,
+		     hsync->front_porch << DPI_HFP,
+		     dpi->conf->dimension_mask << DPI_HFP);
+	mtk_dpi_mask(dpi, DPI_TGEN_H1,
+		     (hsync->back_porch + hsync->sync_width) << HSYNC2ACT,
+		     dpi->conf->dimension_mask << HSYNC2ACT);
+	mtk_dpi_mask(dpi, DPI_TGEN_V0,
+		     vsync->sync_width << VSYNC,
+		     dpi->conf->dimension_mask << VSYNC);
+	mtk_dpi_mask(dpi, DPI_TGEN_V0,
+		     vsync->front_porch << VFP,
+		     dpi->conf->dimension_mask << VFP);
+	mtk_dpi_mask(dpi, DPI_TGEN_V1,
+		     (vsync->back_porch + vsync->sync_width) << VSYNC2ACT,
+		     dpi->conf->dimension_mask << VSYNC2ACT);
+}
+
 static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
 				 struct mtk_dpi_sync_param *sync)
 {
@@ -296,10 +408,27 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
 
 static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 {
-	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
-		     dpi->conf->hvsize_mask << HSIZE);
-	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
-		     dpi->conf->hvsize_mask << VSIZE);
+	if (dpi->conf->dpi_ver == MTK_DSIP_DVO) {
+		mtk_dpi_mask(dpi, DPI_SRC_SIZE, width << SRC_HSIZE,
+			dpi->conf->hvsize_mask << SRC_HSIZE);
+		mtk_dpi_mask(dpi, DPI_SRC_SIZE, height << SRC_VSIZE,
+			dpi->conf->hvsize_mask << SRC_VSIZE);
+
+		mtk_dpi_mask(dpi, DPI_PIC_SIZE, width << PIC_HSIZE,
+			dpi->conf->hvsize_mask << PIC_HSIZE);
+		mtk_dpi_mask(dpi, DPI_PIC_SIZE, height << PIC_VSIZE,
+			dpi->conf->hvsize_mask << PIC_VSIZE);
+
+		mtk_dpi_mask(dpi, DPI_TGEN_H1, (width / dpi->conf->pixels_per_iter) << HACT,
+			dpi->conf->hvsize_mask << HACT);
+		mtk_dpi_mask(dpi, DPI_TGEN_V1, height << VACT,
+			dpi->conf->hvsize_mask << VACT);
+	} else {
+		mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
+			dpi->conf->hvsize_mask << HSIZE);
+		mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
+			dpi->conf->hvsize_mask << VSIZE);
+	}
 }
 
 static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
@@ -501,6 +630,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->tvd_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->hf_fdpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -528,8 +658,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_pixel;
 	}
 
+	ret = clk_prepare_enable(dpi->hf_fdpi_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable hf_fdpi_clk clock: %d\n", ret);
+		goto err_hf_fdpi_clk;
+	}
+
 	return 0;
 
+err_hf_fdpi_clk:
+	clk_disable_unprepare(dpi->hf_fdpi_clk);
 err_pixel:
 	clk_disable_unprepare(dpi->tvd_clk);
 err_engine:
@@ -610,7 +748,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
 	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
-
 	/*
 	 * Depending on the IP version, we may output a different amount of
 	 * pixels for each iteration: divide the clock by this number and
@@ -643,14 +780,18 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	}
 	mtk_dpi_sw_reset(dpi, true);
 	mtk_dpi_config_pol(dpi, &dpi_pol);
+	if (dpi->conf->dpi_ver == MTK_DSIP_DVO) {
+		mtk_dpi_irq_enable(dpi);
+		mtk_dpi_config_timing(dpi, &hsync, &vsync_lodd);
+	} else {
+		mtk_dpi_config_hsync(dpi, &hsync);
+		mtk_dpi_config_vsync_lodd(dpi, &vsync_lodd);
+		mtk_dpi_config_vsync_rodd(dpi, &vsync_rodd);
+		mtk_dpi_config_vsync_leven(dpi, &vsync_leven);
+		mtk_dpi_config_vsync_reven(dpi, &vsync_reven);
+		mtk_dpi_config_3d(dpi, !!(mode->flags & DRM_MODE_FLAG_3D_MASK));
+	}
 
-	mtk_dpi_config_hsync(dpi, &hsync);
-	mtk_dpi_config_vsync_lodd(dpi, &vsync_lodd);
-	mtk_dpi_config_vsync_rodd(dpi, &vsync_rodd);
-	mtk_dpi_config_vsync_leven(dpi, &vsync_leven);
-	mtk_dpi_config_vsync_reven(dpi, &vsync_reven);
-
-	mtk_dpi_config_3d(dpi, !!(mode->flags & DRM_MODE_FLAG_3D_MASK));
 	mtk_dpi_config_interface(dpi, !!(vm.flags &
 					 DISPLAY_FLAGS_INTERLACED));
 	if (vm.flags & DISPLAY_FLAGS_INTERLACED)
@@ -658,26 +799,41 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	else
 		mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
 
-	mtk_dpi_config_channel_limit(dpi);
-	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
-	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
-	mtk_dpi_config_color_format(dpi, dpi->color_format);
-	if (dpi->conf->support_direct_pin) {
-		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
-		mtk_dpi_config_2n_h_fre(dpi);
-
-		/* DPI can connect to either an external bridge or the internal HDMI encoder */
-		if (dpi->conf->output_1pixel)
-			mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
-		else
-			mtk_dpi_dual_edge(dpi);
-
-		mtk_dpi_config_disable_edge(dpi);
-	}
-	if (dpi->conf->input_2p_en_bit) {
-		mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
-			     dpi->conf->input_2p_en_bit);
+	if (dpi->conf->dpi_ver == MTK_DSIP_DVO) {
+		mtk_dpi_info_queue_start(dpi);
+		mtk_dpi_buffer_ctrl(dpi);
+		mtk_dpi_trailing_blank_setting(dpi);
+		mtk_dpi_get_gs_level(dpi);
+		mtk_dpi_golden_setting(dpi);
+		mtk_dpi_shadow_ctrl(dpi);
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SET, dpi->conf->out_np_sel, OUT_NP_SEL);
+	} else {
+		mtk_dpi_config_channel_limit(dpi);
+		mtk_dpi_config_bit_num(dpi, dpi->bit_num);
+		mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
+		mtk_dpi_config_color_format(dpi, dpi->color_format);
+		if (dpi->conf->support_direct_pin) {
+			mtk_dpi_config_yc_map(dpi, dpi->yc_map);
+			mtk_dpi_config_2n_h_fre(dpi);
+
+			/*
+			 * DPI can connect to either an external bridge
+			 * or the internal HDMI encoder
+			 */
+			if (dpi->conf->output_1pixel)
+				mtk_dpi_mask(dpi, DPI_CON,
+						  DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
+			else
+				mtk_dpi_dual_edge(dpi);
+
+			mtk_dpi_config_disable_edge(dpi);
+		}
+		if (dpi->conf->input_2p_en_bit) {
+			mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
+				dpi->conf->input_2p_en_bit);
+		}
 	}
+
 	mtk_dpi_sw_reset(dpi, false);
 
 	return 0;
@@ -700,7 +856,7 @@ static u32 *mtk_dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	}
 
 	output_fmts = kcalloc(dpi->conf->num_output_fmts, sizeof(*output_fmts),
-			     GFP_KERNEL);
+			      GFP_KERNEL);
 	if (!output_fmts)
 		return NULL;
 
@@ -1173,6 +1329,20 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.input_2p_en_bit = DPINTF_INPUT_2P_EN,
 };
 
+static const struct mtk_dpi_conf mt8196_conf = {
+	.dpi_factor = dpi_factor_mt8195_dp_intf,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
+	.out_np_sel = 0x2,
+	.reg_h_fre_con = 0xb0,
+	.max_clock_khz = 1330000,
+	.output_fmts = mt8195_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
+	.pixels_per_iter = 4,
+	.dimension_mask = DPINTF_HPW_MASK,
+	.hvsize_mask = PIC_HSIZE_MASK,
+	.dpi_ver = MTK_DSIP_DVO,
+};
+
 static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1227,6 +1397,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(dpi->tvd_clk),
 				     "Failed to get tvdpll clock\n");
 
+	dpi->hf_fdpi_clk = devm_clk_get_optional(dev, "hf_fdvo_clk");
+	if (IS_ERR(dpi->hf_fdpi_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->hf_fdpi_clk),
+				     "Failed to get hf_fdpi_clk clock\n");
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq < 0)
 		return dpi->irq;
@@ -1262,6 +1437,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
 	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
 	{ .compatible = "mediatek,mt8195-dpi", .data = &mt8195_conf },
+	{ .compatible = "mediatek,mt8196-edp-dvo", .data = &mt8196_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 23eeefce8fd2..3e2a64c2bca0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -16,6 +16,7 @@
 #define INT_VSYNC_EN			BIT(0)
 #define INT_VDE_EN			BIT(1)
 #define INT_UNDERFLOW_EN		BIT(2)
+#define INT_VDE_END_EN			BIT(4)
 
 #define DPI_INTSTA		0x0C
 #define INT_VSYNC_STA			BIT(0)
@@ -240,6 +241,71 @@
 #define MATRIX_SEL_RGB_TO_JPEG		0
 #define MATRIX_SEL_RGB_TO_BT601		2
 
+#define DPI_TGEN_INFOQ_LATENCY	0x80
+#define INFOQ_START_LATENCY		0
+#define INFOQ_START_LATENCY_MASK	(0xffff << 0)
+#define INFOQ_END_LATENCY		16
+#define INFOQ_END_LATENCY_MASK		(0xffff << 16)
+
+#define DPI_BUF_CON0		0x220
+#define DISP_BUF_EN			BIT(0)
+#define FIFO_UNDERFLOW_DONE_BLOCK	BIT(4)
+
+#define DPI_TGEN_V_LAST_TRAILING_BLANK	0x6c
+#define V_LAST_TRAILING_BLANK			0
+#define V_LAST_TRAILING_BLANK_MASK		(0xffff << 0)
+
+#define DPI_TGEN_OUTPUT_DELAY_LINE	0x7c
+#define EXT_TG_DLY_LINE				0
+#define EXT_TG_DLY_LINE_MASK			(0xffff << 0)
+
+#define DPI_SHADOW_CTRL			0x190
+#define FORCE_COMMIT				BIT(0)
+#define BYPASS_SHADOW				BIT(1)
+#define READ_WRK_REG				BIT(2)
+
+#define DPI_BUF_SODI_HIGHT		0x230
+#define DPI_BUF_SODI_LOW		0x234
+
+#define DPI_OUTPUT_SET		0x18
+#define OUT_NP_SEL			(0x3 << 0)
+
+#define DPI_SRC_SIZE		0x20
+#define SRC_HSIZE			0
+#define SRC_HSIZE_MASK			(0xffff << 0)
+#define SRC_VSIZE			16
+#define SRC_VSIZE_MASK			(0xffff << 16)
+
+#define DPI_PIC_SIZE		0x24
+#define PIC_HSIZE			0
+#define PIC_HSIZE_MASK			(0xffff << 0)
+#define PIC_VSIZE			16
+#define PIC_VSIZE_MASK			(0xffff << 16)
+
+#define DPI_TGEN_H0		0x50
+#define DPI_HFP				0
+#define DPI_HFP_MASK			(0xffff << 0)
+#define HSYNC				16
+#define HSYNC_MASK			(0xffff << 16)
+
+#define DPI_TGEN_H1		0x54
+#define HSYNC2ACT			0
+#define HSYNC2ACT_MASK			(0xffff << 0)
+#define HACT				16
+#define HACT_MASK			(0xffff << 16)
+
+#define DPI_TGEN_V0		0x58
+#define VFP				0
+#define VFP_MASK			(0xffff << 0)
+#define VSYNC				16
+#define VSYNC_MASK			(0xffff << 16)
+
+#define DPI_TGEN_V1		0x5c
+#define VSYNC2ACT			0
+#define VSYNC2ACT_MASK			(0xffff << 0)
+#define VACT				16
+#define VACT_MASK			(0xffff << 16)
+
 #define DPI_PATTERN0		0xf00
 #define DPI_PAT_EN			BIT(0)
 #define DPI_PAT_SEL			GENMASK(6, 4)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74158b9d6503..870d97c023ed 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -830,6 +830,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8196-edp-dvo",
+	  .data = (void *)MTK_DVO },
 	{ }
 };
 
@@ -1176,7 +1178,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DP_INTF ||
 		    comp_type == MTK_DPI ||
-		    comp_type == MTK_DSI) {
+		    comp_type == MTK_DSI ||
+		    comp_type == MTK_DVO) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, component_compare_of,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 675cdc90a440..6d2796148813 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -79,6 +79,7 @@ extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
+extern struct platform_driver mtk_dvo_driver;
 extern struct platform_driver mtk_ethdr_driver;
 extern struct platform_driver mtk_mdp_rdma_driver;
 extern struct platform_driver mtk_padding_driver;
-- 
2.45.2

