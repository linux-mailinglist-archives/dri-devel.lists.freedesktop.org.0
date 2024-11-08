Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A89C1F8C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337F810E0BE;
	Fri,  8 Nov 2024 14:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="MvMdEwof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F5710E0BE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sq1qOtFF69mFoOsytrqshcI4Hj0x/QP2wi6DnImQLW0=; b=MvMdEwofqR70BiYpz8W5OuxiTU
 IZl4ZZvbUwoKHNlHHa01BLTEi6HQuNVZwVPgq38ZoafCnWhP5u8tTLPH0EQHhf2+TRH6UmL/rqjRr
 lvUR+tCJOMb509mHndLjI248FXt1NJkbWR73JLHcQPz1EhKogwCHbShLoqp+1YFQRI6yd351rbVyA
 hjLeTGgLuEjxHPP4GbC46MQVD6x+zW6sL17Ez9NVOo0K/27bKgu4v5QbV6P4hBrWVhjmu9MBWh2qa
 +yoypA7Fi65U1Ph7jvNG+G4t1AReyjTxozhbT00vhuw6UFIbGA5ejm5fqQgn3VkKig3/OEurwKnCy
 DxRJOdHw==;
Received: from i53875b28.versanet.de ([83.135.91.40]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9QE1-0006ov-Mk; Fri, 08 Nov 2024 15:44:37 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: dsimic@manjaro.org, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH] drm/rockchip: dsi: convert to dev_err_probe in probe function
Date: Fri,  8 Nov 2024 15:44:24 +0100
Message-ID: <20241108144425.1009916-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

DRM_DEV_ERROR is deprecated and using dev_err_probe saves quite a number
of lines too, so convert the error prints for the dsi-driver.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 80 ++++++-------------
 1 file changed, 26 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 58a44af0e9ad..3224ab749352 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1356,17 +1356,15 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	struct resource *res;
 	const struct rockchip_dw_dsi_chip_data *cdata =
 				of_device_get_match_data(dev);
-	int ret, i;
+	int i;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
 		return -ENOMEM;
 
 	dsi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(dsi->base)) {
-		DRM_DEV_ERROR(dev, "Unable to get dsi registers\n");
-		return PTR_ERR(dsi->base);
-	}
+	if (IS_ERR(dsi->base))
+		return dev_err_probe(dev, PTR_ERR(dsi->base), "Unable to get dsi registers\n");
 
 	i = 0;
 	while (cdata[i].reg) {
@@ -1378,67 +1376,47 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 		i++;
 	}
 
-	if (!dsi->cdata) {
-		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
-		return -EINVAL;
-	}
+	if (!dsi->cdata)
+		return dev_err_probe(dev, -EINVAL, "No dsi-config for %s node\n", np->name);
 
 	/* try to get a possible external dphy */
 	dsi->phy = devm_phy_optional_get(dev, "dphy");
-	if (IS_ERR(dsi->phy)) {
-		ret = PTR_ERR(dsi->phy);
-		DRM_DEV_ERROR(dev, "failed to get mipi dphy: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->phy))
+		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get mipi dphy\n");
 
 	dsi->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dsi->pclk)) {
-		ret = PTR_ERR(dsi->pclk);
-		DRM_DEV_ERROR(dev, "Unable to get pclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->pclk))
+		return dev_err_probe(dev, PTR_ERR(dsi->pclk), "Unable to get pclk\n");
 
 	dsi->pllref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(dsi->pllref_clk)) {
-		if (dsi->phy) {
+		if (dsi->phy)
 			/*
 			 * if external phy is present, pll will be
 			 * generated there.
 			 */
 			dsi->pllref_clk = NULL;
-		} else {
-			ret = PTR_ERR(dsi->pllref_clk);
-			DRM_DEV_ERROR(dev,
-				      "Unable to get pll reference clock: %d\n",
-				      ret);
-			return ret;
-		}
+		else
+			return dev_err_probe(dev, PTR_ERR(dsi->pllref_clk),
+					     "Unable to get pll reference clock\n");
 	}
 
 	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
 		dsi->phy_cfg_clk = devm_clk_get(dev, "phy_cfg");
-		if (IS_ERR(dsi->phy_cfg_clk)) {
-			ret = PTR_ERR(dsi->phy_cfg_clk);
-			DRM_DEV_ERROR(dev,
-				      "Unable to get phy_cfg_clk: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(dsi->phy_cfg_clk))
+			return dev_err_probe(dev, PTR_ERR(dsi->phy_cfg_clk),
+					     "Unable to get phy_cfg_clk\n");
 	}
 
 	if (dsi->cdata->flags & DW_MIPI_NEEDS_GRF_CLK) {
 		dsi->grf_clk = devm_clk_get(dev, "grf");
-		if (IS_ERR(dsi->grf_clk)) {
-			ret = PTR_ERR(dsi->grf_clk);
-			DRM_DEV_ERROR(dev, "Unable to get grf_clk: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(dsi->grf_clk))
+			return dev_err_probe(dev, PTR_ERR(dsi->grf_clk), "Unable to get grf_clk\n");
 	}
 
 	dsi->grf_regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-	if (IS_ERR(dsi->grf_regmap)) {
-		DRM_DEV_ERROR(dev, "Unable to get rockchip,grf\n");
-		return PTR_ERR(dsi->grf_regmap);
-	}
+	if (IS_ERR(dsi->grf_regmap))
+		return dev_err_probe(dev, PTR_ERR(dsi->grf_regmap), "Unable to get rockchip,grf\n");
 
 	dsi->dev = dev;
 	dsi->pdata.base = dsi->base;
@@ -1451,24 +1429,18 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	mutex_init(&dsi->usage_mutex);
 
 	dsi->dphy = devm_phy_create(dev, NULL, &dw_mipi_dsi_dphy_ops);
-	if (IS_ERR(dsi->dphy)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to create PHY\n");
-		return PTR_ERR(dsi->dphy);
-	}
+	if (IS_ERR(dsi->dphy))
+		return dev_err_probe(dev, PTR_ERR(dsi->dphy), "Failed to create PHY\n");
 
 	phy_set_drvdata(dsi->dphy, dsi);
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(phy_provider))
-		return PTR_ERR(phy_provider);
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "Failed to register phy-provider\n");
 
 	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
-	if (IS_ERR(dsi->dmd)) {
-		ret = PTR_ERR(dsi->dmd);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "Failed to probe dw_mipi_dsi: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->dmd))
+		return dev_err_probe(dev, PTR_ERR(dsi->dmd), "Failed to probe dw_mipi_dsi\n");
 
 	return 0;
 }
-- 
2.45.2

