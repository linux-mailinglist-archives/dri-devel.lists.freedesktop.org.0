Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854548343E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B2389D40;
	Mon,  3 Jan 2022 15:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0D899E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:31:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 54E5B1F42558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641223863;
 bh=iVgZxVqC2T4q/YntLy6VYveQGVZXE87ejYYsVcnDTVo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fir+ujfJNM05YaXg9OVuXrjYsLYFWjcKntoB2ehQIIVsZVcVvTixYQhHYdMcCPd3o
 pGtSFthvJDCddnv1LQHqYQuMx3UoOC1XxDunBT58INR3fxfvsdZ+UsSwY2wGhcqKpk
 hcFEomrqtwycnN2JZ8UQcyvOVTg/f6+JUQJgWF2yXGXyQGjnEIZKo7taa9zvyuR0dg
 9Tnkbq+KjiTxIZcCBHY7BUoj2utD4tUWbMSu1l15B1kagsMnOqAX5SWXYn2QmIGquD
 JwYDjJq/guagELnXkvTJ7Es1Ke7mDHVN62es6uF+O1UXpfkD6le76NKZFpuWw4MQzO
 FGi3fvaxMrcNw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 4/4] phy: mediatek: phy-mtk-hdmi: Simplify with dev_err_probe()
Date: Mon,  3 Jan 2022 16:30:55 +0100
Message-Id: <20220103153055.50473-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 50 +++++++++++------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index e037fa89696c..4f40a6eea004 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -104,20 +104,16 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(hdmi_phy->regmap);
 
 	ref_clk = devm_clk_get(dev, "pll_ref");
-	if (IS_ERR(ref_clk)) {
-		ret = PTR_ERR(ref_clk);
-		dev_err(&pdev->dev, "Failed to get PLL reference clock: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(dev, PTR_ERR(ref_clk),
+				     "Failed to get PLL reference clock\n");
+
 	ref_clk_name = __clk_get_name(ref_clk);
 
 	ret = of_property_read_string(dev->of_node, "clock-output-names",
 				      &clk_init.name);
-	if (ret < 0) {
-		dev_err(dev, "Failed to read clock-output-names: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read clock-output-names\n");
 
 	hdmi_phy->dev = dev;
 	hdmi_phy->conf =
@@ -125,25 +121,19 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	mtk_hdmi_phy_clk_get_data(hdmi_phy, &clk_init);
 	hdmi_phy->pll_hw.init = &clk_init;
 	hdmi_phy->pll = devm_clk_register(dev, &hdmi_phy->pll_hw);
-	if (IS_ERR(hdmi_phy->pll)) {
-		ret = PTR_ERR(hdmi_phy->pll);
-		dev_err(dev, "Failed to register PLL: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hdmi_phy->pll))
+		return dev_err_probe(dev, PTR_ERR(hdmi_phy->pll),
+				    "Failed to register PLL\n");
 
 	ret = of_property_read_u32(dev->of_node, "mediatek,ibias",
 				   &hdmi_phy->ibias);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get ibias: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get ibias\n");
 
 	ret = of_property_read_u32(dev->of_node, "mediatek,ibias_up",
 				   &hdmi_phy->ibias_up);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get ibias up: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get ibias_up\n");
 
 	dev_info(dev, "Using default TX DRV impedance: 4.2k/36\n");
 	hdmi_phy->drv_imp_clk = 0x30;
@@ -152,17 +142,15 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	hdmi_phy->drv_imp_d0 = 0x30;
 
 	phy = devm_phy_create(dev, NULL, mtk_hdmi_phy_dev_get_ops(hdmi_phy));
-	if (IS_ERR(phy)) {
-		dev_err(dev, "Failed to create HDMI PHY\n");
-		return PTR_ERR(phy);
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Cannot create HDMI PHY\n");
+
 	phy_set_drvdata(phy, hdmi_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider)) {
-		dev_err(dev, "Failed to register HDMI PHY\n");
-		return PTR_ERR(phy_provider);
-	}
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "Failed to register HDMI PHY\n");
 
 	if (hdmi_phy->conf->pll_default_off)
 		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
-- 
2.33.1

