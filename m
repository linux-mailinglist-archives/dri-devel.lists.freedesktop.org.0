Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3A125FA1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F756EB10;
	Thu, 19 Dec 2019 10:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CFE6EB0A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:45 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E30D10D6;
 Thu, 19 Dec 2019 11:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752342;
 bh=01ns59neZoAlppSjI2f6dsb1P5UqTcnjY2KmyQSltww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sCETnxpkw3pCfUDL7eS6UzYJkq44Lp+514GlfxXse+j0Bh0yGRxGiHWG5ehe7ILYP
 d/d11wMqEf2P9eL9fvuy0ceYhPI/Ez4Z9ckEu5dqOH54vXBVKjCnVoqUGfyN1On7Jq
 yYK9/6bhCM7Bj0YzkgWiyI1DkgQ7qGUp0gFVeWV4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/51] drm/bridge: dumb-vga-dac: Rename internal symbols to
 simple-bridge
Date: Thu, 19 Dec 2019 12:44:37 +0200
Message-Id: <20191219104522.9379-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dumb-vga-dac driver is a simple DRM bridge driver for simple VGA
DACs that don't require configuration. Other non-VGA bridges fall in a
similar category, and would benefit from a common driver. Prepare for
this by renaming the internal symbols from dumb-vga-dac to
simple-bridge.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/dumb-vga-dac.c | 154 +++++++++++++-------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index ad5b5a849e43..7287be2d3220 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -17,7 +17,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-struct dumb_vga {
+struct simple_bridge {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
 
@@ -25,28 +25,28 @@ struct dumb_vga {
 	struct regulator	*vdd;
 };
 
-static inline struct dumb_vga *
-drm_bridge_to_dumb_vga(struct drm_bridge *bridge)
+static inline struct simple_bridge *
+drm_bridge_to_simple_bridge(struct drm_bridge *bridge)
 {
-	return container_of(bridge, struct dumb_vga, bridge);
+	return container_of(bridge, struct simple_bridge, bridge);
 }
 
-static inline struct dumb_vga *
-drm_connector_to_dumb_vga(struct drm_connector *connector)
+static inline struct simple_bridge *
+drm_connector_to_simple_bridge(struct drm_connector *connector)
 {
-	return container_of(connector, struct dumb_vga, connector);
+	return container_of(connector, struct simple_bridge, connector);
 }
 
-static int dumb_vga_get_modes(struct drm_connector *connector)
+static int simple_bridge_get_modes(struct drm_connector *connector)
 {
-	struct dumb_vga *vga = drm_connector_to_dumb_vga(connector);
+	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
 	struct edid *edid;
 	int ret;
 
-	if (!vga->ddc)
+	if (!sbridge->ddc)
 		goto fallback;
 
-	edid = drm_get_edid(connector, vga->ddc);
+	edid = drm_get_edid(connector, sbridge->ddc);
 	if (!edid) {
 		DRM_INFO("EDID readout failed, falling back to standard modes\n");
 		goto fallback;
@@ -70,14 +70,14 @@ static int dumb_vga_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static const struct drm_connector_helper_funcs dumb_vga_con_helper_funcs = {
-	.get_modes	= dumb_vga_get_modes,
+static const struct drm_connector_helper_funcs simple_bridge_con_helper_funcs = {
+	.get_modes	= simple_bridge_get_modes,
 };
 
 static enum drm_connector_status
-dumb_vga_connector_detect(struct drm_connector *connector, bool force)
+simple_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct dumb_vga *vga = drm_connector_to_dumb_vga(connector);
+	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
 
 	/*
 	 * Even if we have an I2C bus, we can't assume that the cable
@@ -85,14 +85,14 @@ dumb_vga_connector_detect(struct drm_connector *connector, bool force)
 	 * wire the DDC pins, or the I2C bus might not be working at
 	 * all.
 	 */
-	if (vga->ddc && drm_probe_ddc(vga->ddc))
+	if (sbridge->ddc && drm_probe_ddc(sbridge->ddc))
 		return connector_status_connected;
 
 	return connector_status_unknown;
 }
 
-static const struct drm_connector_funcs dumb_vga_con_funcs = {
-	.detect			= dumb_vga_connector_detect,
+static const struct drm_connector_funcs simple_bridge_con_funcs = {
+	.detect			= simple_bridge_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
 	.reset			= drm_atomic_helper_connector_reset,
@@ -100,10 +100,10 @@ static const struct drm_connector_funcs dumb_vga_con_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static int dumb_vga_attach(struct drm_bridge *bridge,
-			   enum drm_bridge_attach_flags flags)
+static int simple_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
 {
-	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
+	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
@@ -116,50 +116,50 @@ static int dumb_vga_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	drm_connector_helper_add(&vga->connector,
-				 &dumb_vga_con_helper_funcs);
-	ret = drm_connector_init_with_ddc(bridge->dev, &vga->connector,
-					  &dumb_vga_con_funcs,
+	drm_connector_helper_add(&sbridge->connector,
+				 &simple_bridge_con_helper_funcs);
+	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
+					  &simple_bridge_con_funcs,
 					  DRM_MODE_CONNECTOR_VGA,
-					  vga->ddc);
+					  sbridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
 	}
 
-	drm_connector_attach_encoder(&vga->connector,
+	drm_connector_attach_encoder(&sbridge->connector,
 					  bridge->encoder);
 
 	return 0;
 }
 
-static void dumb_vga_enable(struct drm_bridge *bridge)
+static void simple_bridge_enable(struct drm_bridge *bridge)
 {
-	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
+	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret = 0;
 
-	if (vga->vdd)
-		ret = regulator_enable(vga->vdd);
+	if (sbridge->vdd)
+		ret = regulator_enable(sbridge->vdd);
 
 	if (ret)
 		DRM_ERROR("Failed to enable vdd regulator: %d\n", ret);
 }
 
-static void dumb_vga_disable(struct drm_bridge *bridge)
+static void simple_bridge_disable(struct drm_bridge *bridge)
 {
-	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
+	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 
-	if (vga->vdd)
-		regulator_disable(vga->vdd);
+	if (sbridge->vdd)
+		regulator_disable(sbridge->vdd);
 }
 
-static const struct drm_bridge_funcs dumb_vga_bridge_funcs = {
-	.attach		= dumb_vga_attach,
-	.enable		= dumb_vga_enable,
-	.disable	= dumb_vga_disable,
+static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
+	.attach		= simple_bridge_attach,
+	.enable		= simple_bridge_enable,
+	.disable	= simple_bridge_disable,
 };
 
-static struct i2c_adapter *dumb_vga_retrieve_ddc(struct device *dev)
+static struct i2c_adapter *simple_bridge_retrieve_ddc(struct device *dev)
 {
 	struct device_node *phandle, *remote;
 	struct i2c_adapter *ddc;
@@ -181,53 +181,53 @@ static struct i2c_adapter *dumb_vga_retrieve_ddc(struct device *dev)
 	return ddc;
 }
 
-static int dumb_vga_probe(struct platform_device *pdev)
+static int simple_bridge_probe(struct platform_device *pdev)
 {
-	struct dumb_vga *vga;
+	struct simple_bridge *sbridge;
 
-	vga = devm_kzalloc(&pdev->dev, sizeof(*vga), GFP_KERNEL);
-	if (!vga)
+	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
+	if (!sbridge)
 		return -ENOMEM;
-	platform_set_drvdata(pdev, vga);
+	platform_set_drvdata(pdev, sbridge);
 
-	vga->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
-	if (IS_ERR(vga->vdd)) {
-		int ret = PTR_ERR(vga->vdd);
+	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
+	if (IS_ERR(sbridge->vdd)) {
+		int ret = PTR_ERR(sbridge->vdd);
 		if (ret == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
-		vga->vdd = NULL;
+		sbridge->vdd = NULL;
 		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
 	}
 
-	vga->ddc = dumb_vga_retrieve_ddc(&pdev->dev);
-	if (IS_ERR(vga->ddc)) {
-		if (PTR_ERR(vga->ddc) == -ENODEV) {
+	sbridge->ddc = simple_bridge_retrieve_ddc(&pdev->dev);
+	if (IS_ERR(sbridge->ddc)) {
+		if (PTR_ERR(sbridge->ddc) == -ENODEV) {
 			dev_dbg(&pdev->dev,
 				"No i2c bus specified. Disabling EDID readout\n");
-			vga->ddc = NULL;
+			sbridge->ddc = NULL;
 		} else {
 			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
-			return PTR_ERR(vga->ddc);
+			return PTR_ERR(sbridge->ddc);
 		}
 	}
 
-	vga->bridge.funcs = &dumb_vga_bridge_funcs;
-	vga->bridge.of_node = pdev->dev.of_node;
-	vga->bridge.timings = of_device_get_match_data(&pdev->dev);
+	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
+	sbridge->bridge.of_node = pdev->dev.of_node;
+	sbridge->bridge.timings = of_device_get_match_data(&pdev->dev);
 
-	drm_bridge_add(&vga->bridge);
+	drm_bridge_add(&sbridge->bridge);
 
 	return 0;
 }
 
-static int dumb_vga_remove(struct platform_device *pdev)
+static int simple_bridge_remove(struct platform_device *pdev)
 {
-	struct dumb_vga *vga = platform_get_drvdata(pdev);
+	struct simple_bridge *sbridge = platform_get_drvdata(pdev);
 
-	drm_bridge_remove(&vga->bridge);
+	drm_bridge_remove(&sbridge->bridge);
 
-	if (vga->ddc)
-		i2c_put_adapter(vga->ddc);
+	if (sbridge->ddc)
+		i2c_put_adapter(sbridge->ddc);
 
 	return 0;
 }
@@ -238,7 +238,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
  * NOTE: the ADV7123EP seems to have other timings and need a new timings
  * set if used.
  */
-static const struct drm_bridge_timings default_dac_timings = {
+static const struct drm_bridge_timings default_bridge_timings = {
 	/* Timing specifications, datasheet page 7 */
 	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	.setup_time_ps = 500,
@@ -249,7 +249,7 @@ static const struct drm_bridge_timings default_dac_timings = {
  * Information taken from the THS8134, THS8134A, THS8134B datasheet named
  * "SLVS205D", dated May 1990, revised March 2000.
  */
-static const struct drm_bridge_timings ti_ths8134_dac_timings = {
+static const struct drm_bridge_timings ti_ths8134_bridge_timings = {
 	/* From timing diagram, datasheet page 9 */
 	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	/* From datasheet, page 12 */
@@ -262,7 +262,7 @@ static const struct drm_bridge_timings ti_ths8134_dac_timings = {
  * Information taken from the THS8135 datasheet named "SLAS343B", dated
  * May 2001, revised April 2013.
  */
-static const struct drm_bridge_timings ti_ths8135_dac_timings = {
+static const struct drm_bridge_timings ti_ths8135_bridge_timings = {
 	/* From timing diagram, datasheet page 14 */
 	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	/* From datasheet, page 16 */
@@ -270,37 +270,37 @@ static const struct drm_bridge_timings ti_ths8135_dac_timings = {
 	.hold_time_ps = 500,
 };
 
-static const struct of_device_id dumb_vga_match[] = {
+static const struct of_device_id simple_bridge_match[] = {
 	{
 		.compatible = "dumb-vga-dac",
 		.data = NULL,
 	},
 	{
 		.compatible = "adi,adv7123",
-		.data = &default_dac_timings,
+		.data = &default_bridge_timings,
 	},
 	{
 		.compatible = "ti,ths8135",
-		.data = &ti_ths8135_dac_timings,
+		.data = &ti_ths8135_bridge_timings,
 	},
 	{
 		.compatible = "ti,ths8134",
-		.data = &ti_ths8134_dac_timings,
+		.data = &ti_ths8134_bridge_timings,
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(of, dumb_vga_match);
+MODULE_DEVICE_TABLE(of, simple_bridge_match);
 
-static struct platform_driver dumb_vga_driver = {
-	.probe	= dumb_vga_probe,
-	.remove	= dumb_vga_remove,
+static struct platform_driver simple_bridge_driver = {
+	.probe	= simple_bridge_probe,
+	.remove	= simple_bridge_remove,
 	.driver		= {
 		.name		= "dumb-vga-dac",
-		.of_match_table	= dumb_vga_match,
+		.of_match_table	= simple_bridge_match,
 	},
 };
-module_platform_driver(dumb_vga_driver);
+module_platform_driver(simple_bridge_driver);
 
 MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
-MODULE_DESCRIPTION("Dumb VGA DAC bridge driver");
+MODULE_DESCRIPTION("Simple DRM bridge driver");
 MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
