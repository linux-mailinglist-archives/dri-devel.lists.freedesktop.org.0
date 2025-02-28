Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F7A49F92
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6610E05A;
	Fri, 28 Feb 2025 16:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="HQEh5p1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9310ED0B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0i2sTYLPGHibBms0uchTwR68AShtJdYq//ouv+fA2Lg=; b=HQEh5p1HbF2PwWVwJ9HBhI7+bg
 vDrDF2JdFSysvP1uUGq/yE7IX9BOPjpxrOc5Zw01Q4Cox+vWuGtSh/DWpBo3Xlfp6HnsBHhOCYerW
 A1vq4RDpVH/wsuHg72QdqZGYKx74xqASH9/zBaOsTN71D47MGgXj7V+2cxWMdc2b/6owIittUQtdR
 tHQ/4bPWK/PgKkqIUKd19KQx7IJf/C2A3O7/3pZSCoJCRPKh+cLtQQ/cEzZQsLLrRw639Z972yPF+
 QEPJueAVXZxC84lJRMOl0WUK7IK0qC6r4if/vbALod0yhwz7W7Ciq96KdlNGndsZQCpiAVNi2ysz9
 i4RmKawQ==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1to3gh-00029i-NH; Fri, 28 Feb 2025 17:58:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] drm/rockchip: lvds: Hide scary error messages on probe
 deferral
Date: Fri, 28 Feb 2025 17:57:55 +0100
Message-ID: <20250228165755.405138-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228165755.405138-1-heiko@sntech.de>
References: <20250228165755.405138-1-heiko@sntech.de>
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

Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
probing defer") already started hiding scary messages that are not relevant
if the requested supply just returned EPROBE_DEFER, but there are more
possible sources - like the phy.

So modernize the whole logging in the probe path by replacing the
remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
and drm_err calls.

The distinction here is that all messages talking about mishaps of the
lvds element use dev_err(_probe) while messages caused by interaction
with the main Rockchip drm-device use drm_err.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 59 +++++++++++-------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index c19b7b1f6cb5..2b5101a764c8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -453,10 +453,9 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 		return PTR_ERR(lvds->regs);
 
 	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
-	if (IS_ERR(lvds->pclk)) {
-		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
-		return PTR_ERR(lvds->pclk);
-	}
+	if (IS_ERR(lvds->pclk))
+		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
+				     "could not get pclk_lvds\n");
 
 	lvds->pins = devm_kzalloc(lvds->dev, sizeof(*lvds->pins),
 				  GFP_KERNEL);
@@ -465,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 
 	lvds->pins->p = devm_pinctrl_get(lvds->dev);
 	if (IS_ERR(lvds->pins->p)) {
-		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
+		dev_err(lvds->dev, "no pinctrl handle\n");
 		devm_kfree(lvds->dev, lvds->pins);
 		lvds->pins = NULL;
 	} else {
 		lvds->pins->default_state =
 			pinctrl_lookup_state(lvds->pins->p, "lcdc");
 		if (IS_ERR(lvds->pins->default_state)) {
-			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
+			dev_err(lvds->dev, "no default pinctrl state\n");
 			devm_kfree(lvds->dev, lvds->pins);
 			lvds->pins = NULL;
 		}
@@ -547,11 +546,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	lvds->drm_dev = drm_dev;
 	port = of_graph_get_port_by_id(dev->of_node, 1);
-	if (!port) {
-		DRM_DEV_ERROR(dev,
-			      "can't found port point, please init lvds panel port!\n");
-		return -EINVAL;
-	}
+	if (!port)
+		return dev_err_probe(dev, -EINVAL,
+				     "can't found port point, please init lvds panel port!\n");
+
 	for_each_child_of_node(port, endpoint) {
 		child_count++;
 		of_property_read_u32(endpoint, "reg", &endpoint_id);
@@ -563,7 +561,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		}
 	}
 	if (!child_count) {
-		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
+		dev_err(dev, "lvds port does not have any children\n");
 		ret = -EINVAL;
 		goto err_put_port;
 	} else if (ret) {
@@ -581,7 +579,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		lvds->output = rockchip_lvds_name_to_output(name);
 
 	if (lvds->output < 0) {
-		DRM_DEV_ERROR(dev, "invalid output type [%s]\n", name);
+		dev_err(dev, "invalid output type [%s]\n", name);
 		ret = lvds->output;
 		goto err_put_remote;
 	}
@@ -593,7 +591,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		lvds->format = rockchip_lvds_name_to_format(name);
 
 	if (lvds->format < 0) {
-		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
+		dev_err(dev, "invalid data-mapping format [%s]\n", name);
 		ret = lvds->format;
 		goto err_put_remote;
 	}
@@ -604,8 +602,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
 	if (ret < 0) {
-		DRM_DEV_ERROR(drm_dev->dev,
-			      "failed to initialize encoder: %d\n", ret);
+		drm_err(drm_dev,
+			"failed to initialize encoder: %d\n", ret);
 		goto err_put_remote;
 	}
 
@@ -618,8 +616,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 					 &rockchip_lvds_connector_funcs,
 					 DRM_MODE_CONNECTOR_LVDS);
 		if (ret < 0) {
-			DRM_DEV_ERROR(drm_dev->dev,
-				      "failed to initialize connector: %d\n", ret);
+			drm_err(drm_dev,
+				"failed to initialize connector: %d\n", ret);
 			goto err_free_encoder;
 		}
 
@@ -633,9 +631,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
 		if (IS_ERR(connector)) {
-			DRM_DEV_ERROR(drm_dev->dev,
-				      "failed to initialize bridge connector: %pe\n",
-				      connector);
+			drm_err(drm_dev,
+				"failed to initialize bridge connector: %pe\n",
+				connector);
 			ret = PTR_ERR(connector);
 			goto err_free_encoder;
 		}
@@ -643,8 +641,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
-		DRM_DEV_ERROR(drm_dev->dev,
-			      "failed to attach encoder: %d\n", ret);
+		drm_err(drm_dev, "failed to attach encoder: %d\n", ret);
 		goto err_free_connector;
 	}
 
@@ -706,24 +703,20 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 
 	lvds->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
 						    "rockchip,grf");
-	if (IS_ERR(lvds->grf)) {
-		DRM_DEV_ERROR(dev, "missing rockchip,grf property\n");
-		return PTR_ERR(lvds->grf);
-	}
+	if (IS_ERR(lvds->grf))
+		return dev_err_probe(dev, PTR_ERR(lvds->grf), "missing rockchip,grf property\n");
 
 	ret = lvds->soc_data->probe(pdev, lvds);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "Platform initialization failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Platform initialization failed\n");
 
 	dev_set_drvdata(dev, lvds);
 
 	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
 	if (ret < 0)
-		DRM_DEV_ERROR(dev, "failed to add component\n");
+		return dev_err_probe(dev, ret, "failed to add component\n");
 
-	return ret;
+	return 0;
 }
 
 static void rockchip_lvds_remove(struct platform_device *pdev)
-- 
2.47.2

