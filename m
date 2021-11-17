Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2945558A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944556E9C6;
	Thu, 18 Nov 2021 07:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45589B49
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:34:34 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0e-0005tc-FA; Wed, 17 Nov 2021 15:34:00 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0b-001P6E-1b; Wed, 17 Nov 2021 15:33:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] drm/rockchip: dw_hdmi: add rk3568 support
Date: Wed, 17 Nov 2021 15:33:38 +0100
Message-Id: <20211117143347.314294-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Add a new dw_hdmi_plat_data struct and new compatible for rk3568.
This version of the HDMI hardware block needs a new clock to provide
the phy reference clock: hclk. As this is the third clock the driver
uses it is switched to devm_clk_bulk_get_optional() to simplify the
clock handling.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 74 +++++++++++++++------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 8677c82716784..29608c25e2d0e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -50,6 +50,10 @@
 #define RK3399_GRF_SOC_CON20		0x6250
 #define RK3399_HDMI_LCDC_SEL		BIT(6)
 
+#define RK3568_GRF_VO_CON1		0x0364
+#define RK3568_HDMI_SDAIN_MSK		BIT(15)
+#define RK3568_HDMI_SCLIN_MSK		BIT(14)
+
 #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
 
 /**
@@ -64,11 +68,18 @@ struct rockchip_hdmi_chip_data {
 	u32	lcdsel_lit;
 };
 
+#define RK_HDMI_CLK_VPLL	0
+#define RK_HDMI_CLK_HCLK	1
+#define RK_HDMI_CLK_GRF		2
+#define RK_HDMI_NCLOCKS		3
+#define RK_HDMI_NCLOCKS_HDMI	2
+
 struct rockchip_hdmi {
 	struct device *dev;
 	struct regmap *regmap;
 	struct drm_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
+	struct clk_bulk_data clks[RK_HDMI_NCLOCKS];
 	struct clk *vpll_clk;
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
@@ -189,6 +200,7 @@ static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
 static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 {
 	struct device_node *np = hdmi->dev->of_node;
+	int ret;
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
@@ -196,25 +208,19 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 		return PTR_ERR(hdmi->regmap);
 	}
 
-	hdmi->vpll_clk = devm_clk_get(hdmi->dev, "vpll");
-	if (PTR_ERR(hdmi->vpll_clk) == -ENOENT) {
-		hdmi->vpll_clk = NULL;
-	} else if (PTR_ERR(hdmi->vpll_clk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(hdmi->vpll_clk)) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to get vpll clock\n");
-		return PTR_ERR(hdmi->vpll_clk);
-	}
+	hdmi->clks[RK_HDMI_CLK_VPLL].id = "vpll";
+	hdmi->clks[RK_HDMI_CLK_HCLK].id = "hclk";
+	hdmi->clks[RK_HDMI_CLK_GRF].id = "grf";
+	ret = devm_clk_bulk_get_optional(hdmi->dev, RK_HDMI_NCLOCKS, hdmi->clks);
+	printk("%s: %d 0x%08lx 0x%08lx 0x%08lx\n", __func__, ret,
+	       (unsigned long)hdmi->clks[0].clk,
+	       (unsigned long)hdmi->clks[1].clk,
+	       (unsigned long)hdmi->clks[2].clk);
+	if (ret)
+		return ret;
 
-	hdmi->grf_clk = devm_clk_get(hdmi->dev, "grf");
-	if (PTR_ERR(hdmi->grf_clk) == -ENOENT) {
-		hdmi->grf_clk = NULL;
-	} else if (PTR_ERR(hdmi->grf_clk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(hdmi->grf_clk)) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to get grf clock\n");
-		return PTR_ERR(hdmi->grf_clk);
-	}
+	hdmi->vpll_clk = hdmi->clks[RK_HDMI_CLK_VPLL].clk;
+	hdmi->grf_clk = hdmi->clks[RK_HDMI_CLK_GRF].clk;
 
 	return 0;
 }
@@ -257,7 +263,7 @@ static void dw_hdmi_rockchip_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
 
-	clk_set_rate(hdmi->vpll_clk, adj_mode->clock * 1000);
+	clk_set_rate(hdmi->clks[RK_HDMI_CLK_VPLL].clk, adj_mode->clock * 1000);
 }
 
 static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
@@ -467,6 +473,19 @@ static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
 	.use_drm_infoframe = true,
 };
 
+static struct rockchip_hdmi_chip_data rk3568_chip_data = {
+	.lcdsel_grf_reg = -1,
+};
+
+static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
+	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mpll_cfg   = rockchip_mpll_cfg,
+	.cur_ctr    = rockchip_cur_ctr,
+	.phy_config = rockchip_phy_config,
+	.phy_data = &rk3568_chip_data,
+	.use_drm_infoframe = true,
+};
+
 static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
 	{ .compatible = "rockchip,rk3228-dw-hdmi",
 	  .data = &rk3228_hdmi_drv_data
@@ -480,6 +499,9 @@ static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
 	{ .compatible = "rockchip,rk3399-dw-hdmi",
 	  .data = &rk3399_hdmi_drv_data
 	},
+	{ .compatible = "rockchip,rk3568-dw-hdmi",
+	  .data = &rk3568_hdmi_drv_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_rockchip_dt_ids);
@@ -537,13 +559,21 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	ret = clk_prepare_enable(hdmi->vpll_clk);
+	ret = clk_bulk_prepare_enable(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
 	if (ret) {
 		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI vpll: %d\n",
 			      ret);
 		return ret;
 	}
 
+	if (hdmi->chip_data == &rk3568_chip_data) {
+		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
+			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
+					   RK3568_HDMI_SCLIN_MSK,
+					   RK3568_HDMI_SDAIN_MSK |
+					   RK3568_HDMI_SCLIN_MSK));
+	}
+
 	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
@@ -558,7 +588,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
 		drm_encoder_cleanup(encoder);
-		clk_disable_unprepare(hdmi->vpll_clk);
+		clk_bulk_disable_unprepare(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
 	}
 
 	return ret;
@@ -570,7 +600,7 @@ static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
 
 	dw_hdmi_unbind(hdmi->hdmi);
-	clk_disable_unprepare(hdmi->vpll_clk);
+	clk_bulk_disable_unprepare(RK_HDMI_NCLOCKS_HDMI, hdmi->clks);
 }
 
 static const struct component_ops dw_hdmi_rockchip_ops = {
-- 
2.30.2

