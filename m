Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4512A739
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DB89FA7;
	Wed, 25 Dec 2019 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC81D89CA8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:39:23 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D704AE0005;
 Tue, 24 Dec 2019 14:39:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH v2 06/11] drm/rockchip: lvds: Create an RK3288 specific probe
 function
Date: Tue, 24 Dec 2019 15:38:55 +0100
Message-Id: <20191224143900.23567-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224143900.23567-1-miquel.raynal@bootlin.com>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The probe function is highly tighten to the RK3288 specificities, move
all specific bits into an "rk3288_probe" function, also part of the
platform data.

The goal is to ease the addition of new flavors of Rockchip LVDS IPs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 94 ++++++++++++++----------
 1 file changed, 57 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 271e126476e1..731aba25bec5 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -30,6 +30,8 @@
 #define DISPLAY_OUTPUT_LVDS		1
 #define DISPLAY_OUTPUT_DUAL_LVDS	2
 
+struct rockchip_lvds;
+
 #define connector_to_lvds(c) \
 		container_of(c, struct rockchip_lvds, connector)
 
@@ -38,9 +40,11 @@
 
 /**
  * rockchip_lvds_soc_data - rockchip lvds Soc private data
+ * @probe: LVDS platform probe function
  * @helper_funcs: LVDS connector helper functions
  */
 struct rockchip_lvds_soc_data {
+	int (*probe)(struct platform_device *pdev, struct rockchip_lvds *lvds);
 	const struct drm_encoder_helper_funcs *helper_funcs;
 };
 
@@ -302,6 +306,52 @@ static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
 	drm_panel_unprepare(lvds->panel);
 }
 
+static int rk3288_lvds_probe(struct platform_device *pdev,
+			     struct rockchip_lvds *lvds)
+{
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	lvds->regs = devm_ioremap_resource(lvds->dev, res);
+	if (IS_ERR(lvds->regs))
+		return PTR_ERR(lvds->regs);
+
+	lvds->pclk = devm_clk_get(lvds->dev, "pclk_lvds");
+	if (IS_ERR(lvds->pclk)) {
+		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
+		return PTR_ERR(lvds->pclk);
+	}
+
+	lvds->pins = devm_kzalloc(lvds->dev, sizeof(*lvds->pins),
+				  GFP_KERNEL);
+	if (!lvds->pins)
+		return -ENOMEM;
+
+	lvds->pins->p = devm_pinctrl_get(lvds->dev);
+	if (IS_ERR(lvds->pins->p)) {
+		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
+		devm_kfree(lvds->dev, lvds->pins);
+		lvds->pins = NULL;
+	} else {
+		lvds->pins->default_state =
+			pinctrl_lookup_state(lvds->pins->p, "lcdc");
+		if (IS_ERR(lvds->pins->default_state)) {
+			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
+			devm_kfree(lvds->dev, lvds->pins);
+			lvds->pins = NULL;
+		}
+	}
+
+	ret = clk_prepare(lvds->pclk);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to prepare pclk_lvds\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static const
 struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
 	.enable = rk3288_lvds_encoder_enable,
@@ -314,6 +364,7 @@ static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
 };
 
 static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
+	.probe = rk3288_lvds_probe,
 	.helper_funcs = &rk3288_lvds_encoder_helper_funcs,
 };
 
@@ -487,7 +538,6 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_lvds *lvds;
 	const struct of_device_id *match;
-	struct resource *res;
 	int ret;
 
 	if (!dev->of_node)
@@ -503,37 +553,6 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 		return -ENODEV;
 	lvds->soc_data = match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lvds->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(lvds->regs))
-		return PTR_ERR(lvds->regs);
-
-	lvds->pclk = devm_clk_get(&pdev->dev, "pclk_lvds");
-	if (IS_ERR(lvds->pclk)) {
-		DRM_DEV_ERROR(dev, "could not get pclk_lvds\n");
-		return PTR_ERR(lvds->pclk);
-	}
-
-	lvds->pins = devm_kzalloc(lvds->dev, sizeof(*lvds->pins),
-				  GFP_KERNEL);
-	if (!lvds->pins)
-		return -ENOMEM;
-
-	lvds->pins->p = devm_pinctrl_get(lvds->dev);
-	if (IS_ERR(lvds->pins->p)) {
-		DRM_DEV_ERROR(dev, "no pinctrl handle\n");
-		devm_kfree(lvds->dev, lvds->pins);
-		lvds->pins = NULL;
-	} else {
-		lvds->pins->default_state =
-			pinctrl_lookup_state(lvds->pins->p, "lcdc");
-		if (IS_ERR(lvds->pins->default_state)) {
-			DRM_DEV_ERROR(dev, "no default pinctrl state\n");
-			devm_kfree(lvds->dev, lvds->pins);
-			lvds->pins = NULL;
-		}
-	}
-
 	lvds->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
 						    "rockchip,grf");
 	if (IS_ERR(lvds->grf)) {
@@ -541,13 +560,14 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 		return PTR_ERR(lvds->grf);
 	}
 
+	ret = lvds->soc_data->probe(pdev, lvds);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Platform initialization failed\n");
+		return ret;
+	}
+
 	dev_set_drvdata(dev, lvds);
 
-	ret = clk_prepare(lvds->pclk);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "failed to prepare pclk_lvds\n");
-		return ret;
-	}
 	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to add component\n");
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
