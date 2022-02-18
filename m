Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA144BBB43
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081DD10EB63;
	Fri, 18 Feb 2022 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB510E640
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id p9so14997145wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+CyanyxNzfsttxUn3F/dqOxuTwcblHV88TsdjsGQ8g=;
 b=qYqwJvoujRk2EBe65c5EsTZc86HUCGX77wz9ae8JBytiSO9rxBHEWWvOLIf4xbKBce
 Lv84f4LQMARD/Wd6ezyrmcTabTrOtmTPI1XszBJ25DGK9LSIlyTe5FuRF1+zxNSZNo7D
 5TcSKtu1alA1mU1908wUFHYgNTLcSi6jiqjXRkEykj2iflAhw5RGDYtPR6uG8E5C0gJv
 PPenJRh2LPqR1f6vVXg+U+mODeYLELWCQavh8JRwJQ3W+Bwj8yrXew7wzzhywCMzCBPr
 bH1PiCOOaxGqSpnJYuZFLvnWVg0leiqsDqy/TUBefT0ElfA7Qu6/sjy3N6Hvf0gNhAkX
 QumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+CyanyxNzfsttxUn3F/dqOxuTwcblHV88TsdjsGQ8g=;
 b=tDgM18MukOAK+IfVBqNvw+IadoSQCqY00SSd2UN5cCwVm2Y3zJX1DSGyFGkuxOZ8UC
 pLGz71PfIJDzPKBTqS3kMMYdLM3tCNYMSlPswV6Fq5L6GzfpYlAOfExt/hs6M96ynA5T
 ang/CFcbUx5UIdx2B4Rz0vtXHKewmK4r7eGA+DJexXQvAxvjeMp4BUVKxvwHVwRXT0vP
 oLoB67JyCSwmvG57ay8G/KxgPrKUkW8z/mksmZUOpF0eTaZgBZjxWEvfeYrfhCR2qXEN
 SSNL+yCcux4EDqkS/5bhiXjDCCf6KvauIYPYvEX88tEBr3rnU3DUyE9MlSp+WySFXn1g
 ayRw==
X-Gm-Message-State: AOAM530QXQkgDZ/k+cy4FeVhPahUl7JiB1ilZLgnyJ5/CxuL4sBltwRC
 hLN+ok7BMQfG8ilpjA3X0sYHlw==
X-Google-Smtp-Source: ABdhPJxs7nxM6cFPO7E+zSl70tOgivGEwYl0sfgsEyIcTHcHpVoPO6BFogpwFT5VPMN/W3eVTuOrnQ==
X-Received: by 2002:adf:c409:0:b0:1e7:be44:8dfa with SMTP id
 v9-20020adfc409000000b001e7be448dfamr6598796wrf.617.1645196185665; 
 Fri, 18 Feb 2022 06:56:25 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:25 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 13/19] drm/mediatek: dpi: Add dpintf support
Date: Fri, 18 Feb 2022 15:54:31 +0100
Message-Id: <20220218145437.18563-14-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpintf is the displayport interface hardware unit. This unit is similar
to dpi and can reuse most of the code.

This patch adds support for mt8195-dpintf to this dpi driver. Main
differences are:
 - Some features/functional components are not available for dpintf
   which are now excluded from code execution once is_dpintf is set
 - dpintf can and needs to choose between different clockdividers based
   on the clockspeed. This is done by choosing a different clock parent.
 - There are two additional clocks that need to be managed. These are
   only set for dpintf and will be set to NULL if not supplied. The
   clk_* calls handle these as normal clocks then.
 - Some register contents differ slightly between the two components. To
   work around this I added register bits/masks with a DPINTF_ prefix
   and use them where different.

Based on a separate driver for dpintf created by
Jason-JH.Lin <jason-jh.lin@mediatek.com>.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c          | 164 +++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  38 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   8 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
 include/linux/soc/mediatek/mtk-mmsys.h      |   2 +
 6 files changed, 198 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index be99399faf1bb..c5639ada868f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
 	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
 };
 
+enum TVDPLL_CLK {
+	TVDPLL_PLL = 0,
+	TVDPLL_D2 = 2,
+	TVDPLL_D4 = 4,
+	TVDPLL_D8 = 8,
+	TVDPLL_D16 = 16,
+};
+
 struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
@@ -71,8 +79,10 @@ struct mtk_dpi {
 	void __iomem *regs;
 	struct device *dev;
 	struct clk *engine_clk;
+	struct clk *dpi_ck_cg;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
+	struct clk *pclk_src[5];
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -126,6 +136,7 @@ struct mtk_dpi_conf {
 	const u32 *output_fmts;
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
+	bool is_dpintf;
 	bool swap_input_support;
 	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)
 	u32 dimension_mask;
@@ -384,6 +395,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
+static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
+{
+	u32 matrix_sel = 0;
+
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
+	case MTK_DPI_COLOR_FORMAT_XV_YCC:
+		if (dpi->mode.hdisplay <= 720)
+			matrix_sel = 0x2;
+		break;
+	default:
+		break;
+	}
+	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
@@ -391,6 +421,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
@@ -398,6 +429,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
@@ -438,6 +470,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_ck_cg);
+	clk_disable_unprepare(dpi->tvd_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -447,12 +481,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (++dpi->refcount != 1)
 		return 0;
 
+	ret = clk_prepare_enable(dpi->tvd_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
+		goto err_pixel;
+	}
+
 	ret = clk_prepare_enable(dpi->engine_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
 		goto err_refcount;
 	}
 
+	ret = clk_prepare_enable(dpi->dpi_ck_cg);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
+		goto err_ck_cg;
+	}
+
 	ret = clk_prepare_enable(dpi->pixel_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
@@ -462,10 +508,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
-	mtk_dpi_enable(dpi);
 	return 0;
 
 err_pixel:
+	clk_disable_unprepare(dpi->dpi_ck_cg);
+err_ck_cg:
 	clk_disable_unprepare(dpi->engine_clk);
 err_refcount:
 	dpi->refcount--;
@@ -497,12 +544,21 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	pll_rate = clk_get_rate(dpi->tvd_clk);
 
 	vm.pixelclock = pll_rate / factor;
-	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
-	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
+	if (dpi->conf->is_dpintf) {
+		if (factor == 1)
+			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
+		else if (factor == 2)
+			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]);
+		else if (factor == 4)
+			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]);
+		else
+			clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
+	} else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
+		 (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
 		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
-	else
+	} else {
 		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
-
+	}
 
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
@@ -515,9 +571,15 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
 	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
-	hsync.sync_width = vm.hsync_len;
-	hsync.back_porch = vm.hback_porch;
-	hsync.front_porch = vm.hfront_porch;
+	if (dpi->conf->is_dpintf) {
+		hsync.sync_width = vm.hsync_len / 4;
+		hsync.back_porch = vm.hback_porch / 4;
+		hsync.front_porch = vm.hfront_porch / 4;
+	} else {
+		hsync.sync_width = vm.hsync_len;
+		hsync.back_porch = vm.hback_porch;
+		hsync.front_porch = vm.hfront_porch;
+	}
 	hsync.shift_half_line = false;
 	vsync_lodd.sync_width = vm.vsync_len;
 	vsync_lodd.back_porch = vm.vback_porch;
@@ -559,13 +621,20 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_channel_limit(dpi);
 	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
 	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
-	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
-	mtk_dpi_config_2n_h_fre(dpi);
-	mtk_dpi_dual_edge(dpi);
-	mtk_dpi_config_disable_edge(dpi);
+	if (dpi->conf->is_dpintf) {
+		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
+			     DPINTF_INPUT_2P_EN);
+	} else {
+		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
+		mtk_dpi_config_2n_h_fre(dpi);
+		mtk_dpi_dual_edge(dpi);
+		mtk_dpi_config_disable_edge(dpi);
+	}
 	mtk_dpi_sw_reset(dpi, false);
 
+	mtk_dpi_enable(dpi);
+
 	return 0;
 }
 
@@ -608,7 +677,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	u32 *input_fmts;
 
 	*num_input_fmts = 0;
-
 	input_fmts = kcalloc(1, sizeof(*input_fmts),
 			     GFP_KERNEL);
 	if (!input_fmts)
@@ -634,15 +702,18 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 		if (dpi->conf->num_output_fmts)
 			out_bus_format = dpi->conf->output_fmts[0];
 
-	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
-		bridge_state->input_bus_cfg.format,
-		bridge_state->output_bus_cfg.format);
+	dev_info(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
+		 bridge_state->input_bus_cfg.format,
+		 bridge_state->output_bus_cfg.format);
 
 	dpi->output_fmt = out_bus_format;
 	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
 	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
+		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
+	else
+		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
 
 	return 0;
 }
@@ -687,7 +758,7 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
-	if (mode->clock > dpi->conf->max_clock_khz)
+	if (dpi->conf->max_clock_khz && mode->clock > dpi->conf->max_clock_khz)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -801,6 +872,16 @@ static unsigned int mt8183_calculate_factor(int clock)
 		return 2;
 }
 
+static unsigned int mt8195_dpintf_calculate_factor(int clock)
+{
+	if (clock < 70000)
+		return 4;
+	else if (clock < 200000)
+		return 2;
+	else
+		return 1;
+}
+
 static const u32 mt8173_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 };
@@ -810,6 +891,12 @@ static const u32 mt8183_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
 };
 
+static const u32 mt8195_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+};
+
 static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
 	.c_bottom = 0x0010,
 	.c_top = 0x0FE0,
@@ -817,6 +904,13 @@ static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
 	.y_top = 0x0FE0,
 };
 
+static const struct mtk_dpi_yc_limit mtk_dpintf_limit = {
+	.c_bottom = 0x0000,
+	.c_top = 0xFFF,
+	.y_bottom = 0x0000,
+	.y_top = 0xFFF,
+};
+
 static const struct mtk_dpi_conf mt8173_conf = {
 	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
@@ -882,6 +976,19 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.limit = &mtk_dpi_limit,
 };
 
+static const struct mtk_dpi_conf mt8195_dpintf_conf = {
+	.cal_factor = mt8195_dpintf_calculate_factor,
+	.output_fmts = mt8195_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
+	.is_dpintf = true,
+	.dimension_mask = DPINTF_HPW_MASK,
+	.hvsize_mask = DPINTF_HSIZE_MASK,
+	.channel_swap_shift = DPINTF_CH_SWAP,
+	.yuv422_en_bit = DPINTF_YUV422_EN,
+	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.limit = &mtk_dpintf_limit,
+};
+
 static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -929,7 +1036,18 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (IS_ERR(dpi->engine_clk)) {
 		ret = PTR_ERR(dpi->engine_clk);
 		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
+			dev_err(dev, "Failed to get engine clock: %d\n",
+				ret);
+
+		return ret;
+	}
+
+	dpi->dpi_ck_cg = devm_clk_get_optional(dev, "ck_cg");
+	if (IS_ERR(dpi->dpi_ck_cg)) {
+		ret = PTR_ERR(dpi->dpi_ck_cg);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get dpi ck cg clock: %d\n",
+				ret);
 
 		return ret;
 	}
@@ -952,6 +1070,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->pclk_src[1] = devm_clk_get(dev, "TVDPLL_D2");
+	dpi->pclk_src[2] = devm_clk_get(dev, "TVDPLL_D4");
+	dpi->pclk_src[3] = devm_clk_get(dev, "TVDPLL_D8");
+	dpi->pclk_src[4] = devm_clk_get(dev, "TVDPLL_D16");
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
@@ -1004,6 +1127,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8192-dpi",
 	  .data = &mt8192_conf,
 	},
+	{ .compatible = "mediatek,mt8195-dpintf",
+	  .data = &mt8195_dpintf_conf,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 3a02fabe16627..91b32dfffced2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -40,10 +40,15 @@
 #define FAKE_DE_LEVEN			BIT(21)
 #define FAKE_DE_RODD			BIT(22)
 #define FAKE_DE_REVEN			BIT(23)
+#define DPINTF_YUV422_EN		BIT(24)
+#define DPINTF_CSC_ENABLE		BIT(26)
+#define DPINTF_INPUT_2P_EN		BIT(29)
 
 #define DPI_OUTPUT_SETTING	0x14
 #define CH_SWAP				0
+#define DPINTF_CH_SWAP			BIT(1)
 #define CH_SWAP_MASK			(0x7 << 0)
+#define DPINTF_CH_SWAP_MASK		(0x7 << 1)
 #define SWAP_RGB			0x00
 #define SWAP_GBR			0x01
 #define SWAP_BRG			0x02
@@ -80,8 +85,10 @@
 #define DPI_SIZE		0x18
 #define HSIZE				0
 #define HSIZE_MASK			(0x1FFF << 0)
+#define DPINTF_HSIZE_MASK		(0xFFFF << 0)
 #define VSIZE				16
 #define VSIZE_MASK			(0x1FFF << 16)
+#define DPINTF_VSIZE_MASK		(0xFFFF << 16)
 
 #define DPI_DDR_SETTING		0x1C
 #define DDR_EN				BIT(0)
@@ -93,24 +100,30 @@
 #define DPI_TGEN_HWIDTH		0x20
 #define HPW				0
 #define HPW_MASK			(0xFFF << 0)
+#define DPINTF_HPW_MASK			(0xFFFF << 0)
 
 #define DPI_TGEN_HPORCH		0x24
 #define HBP				0
 #define HBP_MASK			(0xFFF << 0)
+#define DPINTF_HBP_MASK			(0xFFFF << 0)
 #define HFP				16
 #define HFP_MASK			(0xFFF << 16)
+#define DPINTF_HFP_MASK			(0xFFFF << 16)
 
 #define DPI_TGEN_VWIDTH		0x28
 #define DPI_TGEN_VPORCH		0x2C
 
 #define VSYNC_WIDTH_SHIFT		0
 #define VSYNC_WIDTH_MASK		(0xFFF << 0)
+#define DPINTF_VSYNC_WIDTH_MASK		(0xFFFF << 0)
 #define VSYNC_HALF_LINE_SHIFT		16
 #define VSYNC_HALF_LINE_MASK		BIT(16)
 #define VSYNC_BACK_PORCH_SHIFT		0
 #define VSYNC_BACK_PORCH_MASK		(0xFFF << 0)
+#define DPINTF_VSYNC_BACK_PORCH_MASK	(0xFFFF << 0)
 #define VSYNC_FRONT_PORCH_SHIFT		16
 #define VSYNC_FRONT_PORCH_MASK		(0xFFF << 16)
+#define DPINTF_VSYNC_FRONT_PORCH_MASK	(0xFFFF << 16)
 
 #define DPI_BG_HCNTL		0x30
 #define BG_RIGHT			(0x1FFF << 0)
@@ -217,4 +230,29 @@
 
 #define EDGE_SEL_EN			BIT(5)
 #define H_FRE_2N			BIT(25)
+
+#define DPI_MATRIX_SET	0xB4
+#define INT_MATRIX_SEL			BIT(0)
+#define INT_MATRIX_SEL_MASK		(0x1F << 0)
+#define RGB_TO_JPEG			0x00
+#define RGB_TO_FULL709			0x01
+#define RGB_TO_BT601			0x02
+#define RGB_TO_BT709			0x03
+#define JPEG_TO_RGB			0x04
+#define FULL709_TO_RGB			0x05
+#define BT601_TO_RGB			0x06
+#define BT709_TO_RGB			0x07
+#define JPEG_TO_BT601			0x08
+#define JPEG_TO_BT709			0x09
+#define BT601_TO_JPEG			0xA
+#define BT709_TO_JPEG			0xB
+#define BT709_TO_BT601			0xC
+#define BT601_TO_BT709			0xD
+#define JPEG_TO_CERGB			0x14
+#define FULL709_TO_CERGB		0x15
+#define BT601_TO_CERGB			0x16
+#define BT709_TO_CERGB			0x17
+#define RGB_TO_CERGB			0x1C
+#define MATRIX_BIT			BIT(8)
+#define EXT_MATRIX_EN			BIT(12)
 #endif /* __MTK_DPI_REGS_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b4b682bc19913..e8bd6fd4a63d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -351,6 +351,11 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_WDMA] = "wdma",
 	[MTK_DPI] = "dpi",
 	[MTK_DSI] = "dsi",
+	[MTK_DP_INTF] = "dp-intf",
+	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_MUTEX] = "mutex",
+	[MTK_DISP_OD] = "od",
+	[MTK_DISP_BLS] = "bls",
 };
 
 struct mtk_ddp_comp_match {
@@ -369,6 +374,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
 	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
 	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,	0, &ddp_dpi },
+	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,	1, &ddp_dpi },
 	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
 	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
 	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
@@ -513,6 +520,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
+	    type == MTK_DP_INTF ||
 	    type == MTK_DSI)
 		return 0;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 4c6a986623051..deda70df1d6d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -34,6 +34,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_UFOE,
 	MTK_DISP_WDMA,
 	MTK_DPI,
+	MTK_DP_INTF,
 	MTK_DSI,
 	MTK_DDP_COMP_TYPE_MAX,
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 56ff8c57ef8fd..e00ab6410db74 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -511,6 +511,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8195-dpintf",
+	  .data = (void *)MTK_DP_INTF },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
@@ -611,7 +613,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DPI ||
-		    comp_type == MTK_DSI) {
+		    comp_type == MTK_DPI ||
+		    comp_type == MTK_DP_INTF) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, compare_of,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4bba275e235ac..56ed2fa5f59e8 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -19,6 +19,8 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DITHER,
 	DDP_COMPONENT_DPI0,
 	DDP_COMPONENT_DPI1,
+	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
 	DDP_COMPONENT_DSI0,
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_DSI2,
-- 
2.34.1

