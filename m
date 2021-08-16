Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F993EDDDE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531F86E048;
	Mon, 16 Aug 2021 19:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B03389819
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:25:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k4so12219016wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUblRPdvdgQ5kCSSZOYtbSz6srqmTxBHF+lOa2X1xjk=;
 b=IYDZRY5f9976oA4GDzm/5T8HjJfCVRHNwtmxXH+19qe1ka5gIyVufNWIvNkfapzpUl
 VClRY4SZwiHwoqZ9UY2wcIi6vsGJFrmhM1ifUbIFYe2efJeoda0zX8vOvD5SqTdzaQkl
 tQ+0wVGehcd839mqNCjdvEcqHCmybfYPa8yLpf8iGBJ1odW48P3dQ0O1cjp5iEg14wUE
 vRWcgWiEVZgql6OgiqZUHjvYxtKKl1FSmvTRSK/UCPYPqBzg9V7GCP7IaeG+LwP8oD0q
 WlHwRiMrRDELnwO0HemMLZRZy+Z2EY93lcrk4D1lE/RQHvawNe1HpZhr3qAQYLFkpS2b
 4tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUblRPdvdgQ5kCSSZOYtbSz6srqmTxBHF+lOa2X1xjk=;
 b=FgQzgKrZm/fdKVgTzUSszhB6wBiiEhELAbw3becGGeIDaJhylaRJP/GBK8wqWDW3uR
 sdpi5VnKVt8Hk6s2r6tmVDcUJA3GIG0U8+bXgW5FEd/1P0JN/l2n2sDvmQvjFiZXD6vU
 LyFpo3brBkBfzjTVMYe0Ot8oMan5jRn3mT7RBEmKBkEZnFh2r1try7GhDJOS/sPLIoUs
 6Edt6/tT+RbZOhXv0FWAEbuvZRAhUkeRWEhf6dFlHZ3MP5Jx1CTuOGo8gBLy/y4kjkqF
 KTko/wrzl1csuLapaagQDv6xJdhUGeYZKEe4/V2q7SxFLApQ3YWIPDvDkiaHHQc/NOup
 Z0tQ==
X-Gm-Message-State: AOAM533MmlHbQh3mAYW7/HRWBhwfDWk42670Kw8WM75D/eMuHY3y/RPa
 /hjirdMXczQYnFGukZ5OxTZ73g==
X-Google-Smtp-Source: ABdhPJwgPFdPhcEAKj8F/XGjLPqfccpko0kf/pXxDpSont9AoxU2WADKI9PQH2Jkj/S5GItTwXQh4w==
X-Received: by 2002:a05:600c:3793:: with SMTP id
 o19mr593926wmr.53.1629141947963; 
 Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 2/5] drm/mediatek: dpi: Add dpintf support
Date: Mon, 16 Aug 2021 21:25:20 +0200
Message-Id: <20210816192523.1739365-3-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
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
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 282 ++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  12 +
 2 files changed, 247 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bced555648b0..4ad6d1fc6bde 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
 	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
 };
 
+enum mtk_dpi_tvdpll_clk {
+	MTK_DPI_TVDPLL_D2 = 0,
+	MTK_DPI_TVDPLL_D4 = 1,
+	MTK_DPI_TVDPLL_D8 = 2,
+	MTK_DPI_TVDPLL_D16 = 3,
+	MTK_DPI_TVDPLL_NUM_CLKS = 4
+};
+
 struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
@@ -71,8 +79,11 @@ struct mtk_dpi {
 	void __iomem *regs;
 	struct device *dev;
 	struct clk *engine_clk;
+	struct clk *hf_fmm_clk;
+	struct clk *hf_fdp_clk;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
+	struct clk_bulk_data tvd_clks[MTK_DPI_TVDPLL_NUM_CLKS];
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -125,6 +136,7 @@ struct mtk_dpi_conf {
 	bool edge_sel_en;
 	const u32 *output_fmts;
 	u32 num_output_fmts;
+	bool is_dpintf;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -153,30 +165,52 @@ static void mtk_dpi_disable(struct mtk_dpi *dpi)
 static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
 				 struct mtk_dpi_sync_param *sync)
 {
-	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
-		     sync->sync_width << HPW, HPW_MASK);
-	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
-		     sync->back_porch << HBP, HBP_MASK);
-	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
-		     HFP_MASK);
+	if (dpi->conf->is_dpintf) {
+		mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
+			     sync->sync_width << HPW, DPINTF_HPW_MASK);
+		mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
+			     sync->back_porch << HBP, DPINTF_HBP_MASK);
+		mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
+			     DPINTF_HFP_MASK);
+	} else {
+		mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
+			     sync->sync_width << HPW, HPW_MASK);
+		mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
+			     sync->back_porch << HBP, HBP_MASK);
+		mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
+			     HFP_MASK);
+	}
 }
 
 static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
 				 struct mtk_dpi_sync_param *sync,
 				 u32 width_addr, u32 porch_addr)
 {
-	mtk_dpi_mask(dpi, width_addr,
-		     sync->sync_width << VSYNC_WIDTH_SHIFT,
-		     VSYNC_WIDTH_MASK);
 	mtk_dpi_mask(dpi, width_addr,
 		     sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
 		     VSYNC_HALF_LINE_MASK);
-	mtk_dpi_mask(dpi, porch_addr,
-		     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
-		     VSYNC_BACK_PORCH_MASK);
-	mtk_dpi_mask(dpi, porch_addr,
-		     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
-		     VSYNC_FRONT_PORCH_MASK);
+
+	if (dpi->conf->is_dpintf) {
+		mtk_dpi_mask(dpi, width_addr,
+			     sync->sync_width << VSYNC_WIDTH_SHIFT,
+			     DPINTF_VSYNC_WIDTH_MASK);
+		mtk_dpi_mask(dpi, porch_addr,
+			     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
+			     DPINTF_VSYNC_BACK_PORCH_MASK);
+		mtk_dpi_mask(dpi, porch_addr,
+			     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
+			     DPINTF_VSYNC_FRONT_PORCH_MASK);
+	} else {
+		mtk_dpi_mask(dpi, width_addr,
+			     sync->sync_width << VSYNC_WIDTH_SHIFT,
+			     VSYNC_WIDTH_MASK);
+		mtk_dpi_mask(dpi, porch_addr,
+			     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
+			     VSYNC_BACK_PORCH_MASK);
+		mtk_dpi_mask(dpi, porch_addr,
+			     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
+			     VSYNC_FRONT_PORCH_MASK);
+	}
 }
 
 static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
@@ -210,13 +244,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi *dpi,
 			       struct mtk_dpi_polarities *dpi_pol)
 {
 	unsigned int pol;
+	unsigned int mask;
 
-	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL) |
-	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL) |
-	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
+	mask = HSYNC_POL | VSYNC_POL;
+	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
 	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 : VSYNC_POL);
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
-		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
+	if (!dpi->conf->is_dpintf) {
+		mask |= CK_POL | DE_POL;
+		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
+			0 : CK_POL) |
+		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
+			0 : DE_POL);
+	}
+
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
 }
 
 static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
@@ -270,8 +311,12 @@ static void mtk_dpi_config_bit_num(struct mtk_dpi *dpi,
 		val = OUT_BIT_8;
 		break;
 	}
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << OUT_BIT,
-		     OUT_BIT_MASK);
+	if (dpi->conf->is_dpintf)
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << DPINTF_OUT_BIT,
+			     DPINTF_OUT_BIT_MASK);
+	else
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << OUT_BIT,
+			     OUT_BIT_MASK);
 }
 
 static void mtk_dpi_config_yc_map(struct mtk_dpi *dpi,
@@ -332,12 +377,21 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 		break;
 	}
 
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
+	if (dpi->conf->is_dpintf)
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << DPINTF_CH_SWAP,
+			     DPINTF_CH_SWAP_MASK);
+	else
+		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
+			     CH_SWAP_MASK);
 }
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
+	if (dpi->conf->is_dpintf)
+		mtk_dpi_mask(dpi, DPI_CON, enable ? DPINTF_YUV422_EN : 0,
+			     DPINTF_YUV422_EN);
+	else
+		mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
 }
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
@@ -367,19 +421,25 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
-		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (!dpi->conf->is_dpintf) {
+			mtk_dpi_config_csc_enable(dpi, true);
+			mtk_dpi_config_swap_input(dpi, false);
+		}
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
 	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
-		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, true);
+		if (!dpi->conf->is_dpintf) {
+			mtk_dpi_config_csc_enable(dpi, true);
+			mtk_dpi_config_swap_input(dpi, true);
+		}
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	} else {
 		mtk_dpi_config_yuv422_enable(dpi, false);
-		mtk_dpi_config_csc_enable(dpi, false);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (!dpi->conf->is_dpintf) {
+			mtk_dpi_config_csc_enable(dpi, false);
+			mtk_dpi_config_swap_input(dpi, false);
+		}
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	}
 }
@@ -410,8 +470,10 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
 
 	mtk_dpi_disable(dpi);
-	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->hf_fdp_clk);
+	clk_disable_unprepare(dpi->hf_fmm_clk);
+	clk_disable_unprepare(dpi->pixel_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -433,12 +495,28 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_pixel;
 	}
 
+	ret = clk_prepare_enable(dpi->hf_fmm_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable hf_fmm clock: %d\n", ret);
+		goto err_hf_fmm;
+	}
+
+	ret = clk_prepare_enable(dpi->hf_fdp_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable hf_fdp clock: %d\n", ret);
+		goto err_hf_fdp;
+	}
+
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
 	mtk_dpi_enable(dpi);
 	return 0;
 
+err_hf_fdp:
+	clk_disable_unprepare(dpi->hf_fmm_clk);
+err_hf_fmm:
+	clk_disable_unprepare(dpi->pixel_clk);
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
 err_refcount:
@@ -446,6 +524,31 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	return ret;
 }
 
+static void mtk_dpi_set_pixel_clk_parent(struct mtk_dpi *dpi,
+					 unsigned int factor)
+{
+	struct clk *new_parent;
+
+	switch (factor) {
+	case 16:
+		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D16].clk;
+		break;
+	case 8:
+		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D8].clk;
+		break;
+	case 4:
+		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D4].clk;
+		break;
+	case 2:
+		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D2].clk;
+		break;
+	default:
+		new_parent = NULL;
+	}
+	if (new_parent)
+		clk_set_parent(dpi->pixel_clk, new_parent);
+}
+
 static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 				    struct drm_display_mode *mode)
 {
@@ -465,6 +568,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	drm_display_mode_to_videomode(mode, &vm);
 	pll_rate = vm.pixelclock * factor;
 
+	mtk_dpi_set_pixel_clk_parent(dpi, factor);
+
 	dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
 		pll_rate, vm.pixelclock);
 
@@ -484,10 +589,17 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
 		pll_rate, vm.pixelclock);
 
-	limit.c_bottom = 0x0010;
-	limit.c_top = 0x0FE0;
-	limit.y_bottom = 0x0010;
-	limit.y_top = 0x0FE0;
+	if (dpi->conf->is_dpintf) {
+		limit.c_bottom = 0x0000;
+		limit.c_top = 0xFFF;
+		limit.y_bottom = 0x0000;
+		limit.y_top = 0xFFF;
+	} else {
+		limit.c_bottom = 0x0010;
+		limit.c_top = 0x0FE0;
+		limit.y_bottom = 0x0010;
+		limit.y_top = 0x0FE0;
+	}
 
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
@@ -495,6 +607,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
 	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
 			    MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
+	// TODO(scosu): dpintf divides these 3 values by 4
 	hsync.sync_width = vm.hsync_len;
 	hsync.back_porch = vm.hback_porch;
 	hsync.front_porch = vm.hfront_porch;
@@ -539,12 +652,17 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_channel_limit(dpi, &limit);
 	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
 	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
-	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
-	mtk_dpi_config_2n_h_fre(dpi);
-	mtk_dpi_dual_edge(dpi);
-	mtk_dpi_config_disable_edge(dpi);
-	mtk_dpi_sw_reset(dpi, false);
+	if (dpi->conf->is_dpintf) {
+		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
+			     DPINTF_INPUT_2P_EN);
+	} else {
+		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
+		mtk_dpi_config_2n_h_fre(dpi);
+		mtk_dpi_dual_edge(dpi);
+		mtk_dpi_config_disable_edge(dpi);
+		mtk_dpi_sw_reset(dpi, false);
+	}
 
 	return 0;
 }
@@ -683,6 +801,14 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_bridge_funcs mtk_dpintf_bridge_funcs = {
+	.attach = mtk_dpi_bridge_attach,
+	.mode_set = mtk_dpi_bridge_mode_set,
+	.disable = mtk_dpi_bridge_disable,
+	.enable = mtk_dpi_bridge_enable,
+	.atomic_check = mtk_dpi_bridge_atomic_check,
+};
+
 void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
@@ -779,6 +905,16 @@ static unsigned int mt8183_calculate_factor(int clock)
 		return 2;
 }
 
+static unsigned int mt8195_dpintf_calculate_factor(int clock)
+{
+	if (clock < 70000)
+		return 16;
+	else if (clock < 200000)
+		return 8;
+	else
+		return 4;
+}
+
 static const u32 mt8173_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 };
@@ -794,6 +930,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_dpintf = false,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
@@ -803,6 +940,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_dpintf = false,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
@@ -811,6 +949,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.is_dpintf = false,
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
@@ -819,6 +958,12 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_dpintf = false,
+};
+
+static const struct mtk_dpi_conf mt8195_dpintf_conf = {
+	.cal_factor = mt8195_dpintf_calculate_factor,
+	.is_dpintf = true,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
@@ -864,13 +1009,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dpi->engine_clk = devm_clk_get(dev, "engine");
-	if (IS_ERR(dpi->engine_clk)) {
-		ret = PTR_ERR(dpi->engine_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
+	if (!dpi->conf->is_dpintf) {
+		dpi->engine_clk = devm_clk_get(dev, "engine");
+		if (IS_ERR(dpi->engine_clk)) {
+			ret = PTR_ERR(dpi->engine_clk);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get engine clock: %d\n",
+					ret);
 
-		return ret;
+			return ret;
+		}
 	}
 
 	dpi->pixel_clk = devm_clk_get(dev, "pixel");
@@ -891,6 +1039,40 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->hf_fmm_clk = devm_clk_get_optional(dev, "hf_fmm");
+	if (IS_ERR(dpi->hf_fmm_clk)) {
+		ret = PTR_ERR(dpi->hf_fmm_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get hf_fmm clock: %d\n", ret);
+
+		return ret;
+	}
+
+	dpi->hf_fdp_clk = devm_clk_get_optional(dev, "hf_fdp");
+	if (IS_ERR(dpi->hf_fdp_clk)) {
+		ret = PTR_ERR(dpi->hf_fdp_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get hf_fdp clock: %d\n", ret);
+
+		return ret;
+	}
+
+	if (dpi->conf->is_dpintf) {
+		dpi->tvd_clks[MTK_DPI_TVDPLL_D2].id = "pll_d2";
+		dpi->tvd_clks[MTK_DPI_TVDPLL_D4].id = "pll_d4";
+		dpi->tvd_clks[MTK_DPI_TVDPLL_D8].id = "pll_d8";
+		dpi->tvd_clks[MTK_DPI_TVDPLL_D16].id = "pll_d16";
+		ret = devm_clk_bulk_get_optional(dev, MTK_DPI_TVDPLL_NUM_CLKS,
+						 dpi->tvd_clks);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev,
+					"Failed to get optional tvdpll divider clock: %d\n",
+					ret);
+			return ret;
+		}
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
@@ -904,7 +1086,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dpi);
 
-	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
+	if (dpi->conf->is_dpintf)
+		dpi->bridge.funcs = &mtk_dpintf_bridge_funcs;
+	else
+		dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
 	dpi->bridge.of_node = dev->of_node;
 	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
@@ -943,6 +1128,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
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
index 3a02fabe1662..c7489be5c713 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -40,10 +40,14 @@
 #define FAKE_DE_LEVEN			BIT(21)
 #define FAKE_DE_RODD			BIT(22)
 #define FAKE_DE_REVEN			BIT(23)
+#define DPINTF_YUV422_EN		BIT(24)
+#define DPINTF_INPUT_2P_EN		BIT(29)
 
 #define DPI_OUTPUT_SETTING	0x14
 #define CH_SWAP				0
+#define DPINTF_CH_SWAP			BIT(1)
 #define CH_SWAP_MASK			(0x7 << 0)
+#define DPINTF_CH_SWAP_MASK		(0x7 << 1)
 #define SWAP_RGB			0x00
 #define SWAP_GBR			0x01
 #define SWAP_BRG			0x02
@@ -64,7 +68,9 @@
 #define OEN_OFF				BIT(16)
 #define EDGE_SEL			BIT(17)
 #define OUT_BIT				18
+#define DPINTF_OUT_BIT			16
 #define OUT_BIT_MASK			(0x3 << 18)
+#define DPINTF_OUT_BIT_MASK		(0x3 << 16)
 #define OUT_BIT_8			0x00
 #define OUT_BIT_10			0x01
 #define OUT_BIT_12			0x02
@@ -93,24 +99,30 @@
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
-- 
2.32.0

