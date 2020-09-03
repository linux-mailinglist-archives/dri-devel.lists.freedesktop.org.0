Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA85F25C7A8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17436EA19;
	Thu,  3 Sep 2020 16:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F706EA16
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY5-0003Y3-GD; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L37-Hv; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:03 +0200
Message-Id: <20200903165717.1272492-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=AWL,RDNS_NONE,SPF_HELO_NONE,
 SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH 02/16] drm/exynos: extract helper functions for probe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Michael Tretter <m.tretter@pengutronix.de>, krzk@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the driver shall be usable with drivers that use the component
framework and drivers that don't, split the common probing code into a
separate function that can be called from different locations.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 54 ++++++++++++++-----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b38e9b592b8a..32f999dfd8c1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1734,7 +1734,7 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
-static int exynos_dsi_probe(struct platform_device *pdev)
+static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
@@ -1743,7 +1743,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* To be checked as invalid one */
 	dsi->te_gpio = -ENOENT;
@@ -1766,14 +1766,14 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_info(dev, "failed to get regulators: %d\n", ret);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	dsi->clks = devm_kcalloc(dev,
 			dsi->driver_data->num_clks, sizeof(*dsi->clks),
 			GFP_KERNEL);
 	if (!dsi->clks)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < dsi->driver_data->num_clks; i++) {
 		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
@@ -1787,7 +1787,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 			dev_info(dev, "failed to get the clock: %s\n",
 					clk_names[i]);
-			return PTR_ERR(dsi->clks[i]);
+			return ERR_PTR(PTR_ERR(dsi->clks[i]));
 		}
 	}
 
@@ -1795,18 +1795,18 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->reg_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(dsi->reg_base)) {
 		dev_err(dev, "failed to remap io region\n");
-		return PTR_ERR(dsi->reg_base);
+		return dsi->reg_base;
 	}
 
 	dsi->phy = devm_phy_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
-		return PTR_ERR(dsi->phy);
+		return ERR_PTR(PTR_ERR(dsi->phy));
 	}
 
 	dsi->irq = platform_get_irq(pdev, 0);
 	if (dsi->irq < 0)
-		return dsi->irq;
+		return ERR_PTR(dsi->irq);
 
 	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
@@ -1814,37 +1814,43 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 					dev_name(dev), dsi);
 	if (ret) {
 		dev_err(dev, "failed to request dsi irq\n");
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
-		return ret;
-
-	platform_set_drvdata(pdev, &dsi->encoder);
+		return ERR_PTR(ret);
 
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
-	if (ret)
-		goto err_disable_runtime;
-
-	return 0;
+	return dsi;
+}
 
-err_disable_runtime:
-	pm_runtime_disable(dev);
+static void __exynos_dsi_remove(struct exynos_dsi *dsi)
+{
 	of_node_put(dsi->in_bridge_node);
 
-	return ret;
+	pm_runtime_disable(dsi->dev);
 }
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+static int exynos_dsi_probe(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+	struct exynos_dsi *dsi;
 
-	of_node_put(dsi->in_bridge_node);
+	dsi = __exynos_dsi_probe(pdev);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
+	platform_set_drvdata(pdev, &dsi->encoder);
+
+	return component_add(&pdev->dev, &exynos_dsi_component_ops);
+}
+
+static int exynos_dsi_remove(struct platform_device *pdev)
+{
+	struct drm_encoder *encoder = platform_get_drvdata(pdev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
-	pm_runtime_disable(&pdev->dev);
+	__exynos_dsi_remove(dsi);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
