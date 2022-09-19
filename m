Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B05BD307
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A7010E0D2;
	Mon, 19 Sep 2022 17:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3EF10E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:22 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z13so76024edb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=cYnF9EMqvJwBXtKjwPxOYE0j1VtRuRBIfSm4h3GFMsc=;
 b=iZVbPY0gqBmoseFBcJkhJVbnPFAd49GmKzFxcRN5at5rxS298sNWWPHdlzwC9/At6C
 LlV7ZcQvHh7D7XKdzRzap7wgB2dNYOOd+Qz9TpRZcs6iQk4W6zJ9nxdwLwsBnlNs0DgM
 pxDTp9y49XawsYSC+t8cgCEoEvLPPlnps4MHxKYFZaBGzzpSdSsw3zT3gDGNY7h4FicX
 uSwtJL55l5PwXnYdUR60+DLQZ/p5ro7hxKmZSTZp7h7SDAtFTs80k54ibWZIVgnaqSf0
 XcdM2GeXVrM4I/6IQjW/KmmZeF4v9jQgwD3eY3ESEHfGWw+H3OhZfn5AyFci85myIYBV
 pu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cYnF9EMqvJwBXtKjwPxOYE0j1VtRuRBIfSm4h3GFMsc=;
 b=iQNeUuO1l7BB1q0NELWQysin4JvdhXV/mlfj72pQn3oaiTuh3boNtuszrM4HHLtcS5
 rWN0/avhLpcw3loG6E2U2MRla7nDwfj+2jiV/ZOos8Jvro5GFeeGtZ8TFZaq2pMrr7kW
 oMlUk16uVi9FGSrqsVdWHGfQm9X377wNA9ujprp8Gpuw/pHcH9Df8A9yRw7dsm8xGOlN
 MpxQr16cXJx4vTfiPvY+/AAbIbWE4jH/z9Fz2K+uFMjkLtUjmWLxbV4b+RiQREMsnnTl
 4Coykmp0gHBWgJUONuR8cngdub3u7sKtc1Z5c2d0DWJDbZzb2nVeIAH0n97VNfKlO5xd
 btzA==
X-Gm-Message-State: ACrzQf2ZUJqHnsQ8CraK0TJWiRQ1PipYvYK7oyMCxlTvdosfpozMaa0I
 U68bTjSvtxQkkrfULDL7dfDHVQ==
X-Google-Smtp-Source: AMsMyM5y+2yvqezi2pwFyAIQOiGMfwwTVtHA+6PsM+rfZFMVmMKrf8594wP/QtB9y2Qn19/mpgA5kQ==
X-Received: by 2002:a05:6402:2894:b0:453:b17b:d540 with SMTP id
 eg20-20020a056402289400b00453b17bd540mr9603339edb.178.1663606821705; 
 Mon, 19 Sep 2022 10:00:21 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:00:21 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:14 +0200
Subject: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-16-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DPI1 hdmi path support in mtk dpi driver

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 630a4e301ef6..91212b7610e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -15,7 +15,10 @@
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/types.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #include <video/videomode.h>
 
@@ -66,10 +69,14 @@ struct mtk_dpi {
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	void __iomem *regs;
+	struct reset_control *reset_ctl;
 	struct device *dev;
 	struct clk *engine_clk;
+	struct clk *dpi_ck_cg;
 	struct clk *pixel_clk;
+	struct clk *dpi_sel_clk;
 	struct clk *tvd_clk;
+	struct clk *hdmi_cg;
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -135,6 +142,7 @@ struct mtk_dpi_yc_limit {
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
+ * @is_internal_hdmi: True if this DPI block is directly connected to SoC internal HDMI block
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -153,6 +161,7 @@ struct mtk_dpi_conf {
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
 	u32 pixels_per_iter;
+	bool is_internal_hdmi;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -466,8 +475,15 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
 
 	mtk_dpi_disable(dpi);
+
+	reset_control_rearm(dpi->reset_ctl);
+
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_sel_clk);
+	clk_disable_unprepare(dpi->dpi_ck_cg);
+	clk_disable_unprepare(dpi->hdmi_cg);
+	clk_disable_unprepare(dpi->tvd_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -483,12 +499,44 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_refcount;
 	}
 
+	ret = clk_prepare_enable(dpi->dpi_sel_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi_sel clock: %d\n", ret);
+		goto err_refcount;
+	}
+
+	ret = clk_prepare_enable(dpi->tvd_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
+		goto err_tvd;
+	}
+
+	ret = clk_prepare_enable(dpi->engine_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
+		goto err_engine;
+	}
+
+	ret = clk_prepare_enable(dpi->hdmi_cg);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable hdmi_cg clock: %d\n", ret);
+		goto err_hdmi_cg;
+	}
+
+	ret = clk_prepare_enable(dpi->dpi_ck_cg);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
+		goto err_ck_cg;
+	}
+
 	ret = clk_prepare_enable(dpi->pixel_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
 		goto err_pixel;
 	}
 
+	reset_control_reset(dpi->reset_ctl);
+
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
@@ -496,6 +544,15 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_ck_cg);
+err_ck_cg:
+	clk_disable_unprepare(dpi->hdmi_cg);
+err_hdmi_cg:
+	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->tvd_clk);
+err_tvd:
+	clk_disable_unprepare(dpi->dpi_sel_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -539,7 +596,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	else
 		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
 
-
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
@@ -606,7 +662,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	if (dpi->conf->support_direct_pin) {
 		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 		mtk_dpi_config_2n_h_fre(dpi);
-		mtk_dpi_dual_edge(dpi);
+		// DPI could be connecting to external bridge
+		// or internal HDMI encoder.
+		if (dpi->conf->is_internal_hdmi) {
+			mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN,
+				     DPI_OUTPUT_1T1P_EN);
+			mtk_dpi_mask(dpi, DPI_CON, DPI_INPUT_2P_EN,
+				     DPI_INPUT_2P_EN);
+		} else {
+			mtk_dpi_dual_edge(dpi);
+		}
 		mtk_dpi_config_disable_edge(dpi);
 	}
 	if (dpi->conf->input_2pixel) {
@@ -721,7 +786,10 @@ static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
-	mtk_dpi_power_off(dpi);
+	if (dpi->conf->is_internal_hdmi)
+		mtk_dpi_power_off(dpi);
+	else
+		mtk_dpi_disable(dpi);
 }
 
 static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
@@ -764,14 +832,16 @@ void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_on(dpi);
+	if (!dpi->conf->is_internal_hdmi)
+		mtk_dpi_power_on(dpi);
 }
 
 void mtk_dpi_stop(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_off(dpi);
+	if (!dpi->conf->is_internal_hdmi)
+		mtk_dpi_power_off(dpi);
 }
 
 static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
@@ -854,6 +924,11 @@ static unsigned int mt8183_calculate_factor(int clock)
 		return 2;
 }
 
+static unsigned int mt8195_calculate_factor(int clock)
+{
+	return 1;
+}
+
 static unsigned int mt8195_dpintf_calculate_factor(int clock)
 {
 	if (clock < 70000)
@@ -947,6 +1022,24 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8195_conf = {
+	.cal_factor = mt8195_calculate_factor,
+	.max_clock_khz = 594000,
+	.reg_h_fre_con = 0xe0,
+	.output_fmts = mt8183_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+	.is_internal_hdmi = true,
+	.support_direct_pin = true,
+};
+
 static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.cal_factor = mt8195_dpintf_calculate_factor,
 	.max_clock_khz = 600000,
@@ -1004,6 +1097,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->reset_ctl = devm_reset_control_get_optional_exclusive(dev, "dpi_on");
+	if (IS_ERR(dpi->reset_ctl)) {
+		dev_err(dev, "Failed to get reset_ctl: %ld\n", PTR_ERR(dpi->reset_ctl));
+		return PTR_ERR(dpi->reset_ctl);
+	}
+
 	dpi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dpi->engine_clk)) {
 		ret = PTR_ERR(dpi->engine_clk);
@@ -1013,7 +1112,26 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dpi->pixel_clk = devm_clk_get(dev, "pixel");
+	dpi->hdmi_cg = devm_clk_get_optional(dev, "hdmi_cg");
+	if (IS_ERR(dpi->hdmi_cg)) {
+		ret = PTR_ERR(dpi->hdmi_cg);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get hdmi_cg clock: %d\n", ret);
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
+
+		return ret;
+	}
+
+	dpi->pixel_clk = devm_clk_get_optional(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clk)) {
 		ret = PTR_ERR(dpi->pixel_clk);
 		if (ret != -EPROBE_DEFER)
@@ -1022,7 +1140,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dpi->tvd_clk = devm_clk_get(dev, "pll");
+	dpi->tvd_clk = devm_clk_get_optional(dev, "pll");
 	if (IS_ERR(dpi->tvd_clk)) {
 		ret = PTR_ERR(dpi->tvd_clk);
 		if (ret != -EPROBE_DEFER)
@@ -1031,6 +1149,14 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->dpi_sel_clk = devm_clk_get_optional(dev, "dpi_sel");
+	if (IS_ERR(dpi->dpi_sel_clk)) {
+		ret = PTR_ERR(dpi->dpi_sel_clk);
+		dev_err_probe(dev, ret, "Failed to get dpi_Sel_clk clock: %d\n", ret);
+
+		return ret;
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
@@ -1086,6 +1212,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8195-dp-intf",
 	  .data = &mt8195_dpintf_conf,
 	},
+	{ .compatible = "mediatek,mt8195-dpi",
+	  .data = &mt8195_conf,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 62bd4931b344..653ef4b93a97 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -43,6 +43,11 @@
 #define DPINTF_YUV422_EN		BIT(24)
 #define DPINTF_CSC_ENABLE		BIT(26)
 #define DPINTF_INPUT_2P_EN		BIT(29)
+#define DPI_OUTPUT_1T1P_EN		BIT(24)
+#define DPI_INPUT_2P_EN			BIT(25)
+#define DPI_EXT_VSYNC_EN		BIT(26)
+#define DPI_RGB565_EN			BIT(27)
+#define DPI_RGB880_EN			BIT(28)
 
 #define DPI_OUTPUT_SETTING	0x14
 #define CH_SWAP				0

-- 
b4 0.10.0-dev
