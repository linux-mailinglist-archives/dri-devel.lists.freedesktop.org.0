Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF171E18DA
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F8289DD2;
	Tue, 26 May 2020 01:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E6A89CC4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:31 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2A7EE3D;
 Tue, 26 May 2020 03:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455729;
 bh=Lpx+9kQwsBgbaYaCrTJajlYvBr6mwCicwhOL/UIuGcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nEpvyLThcN2HBZe3zvrjdCjHQjYnG3CZKa9KR43oxbJ05JjznljtKYInOeQt1sF2V
 Khkw5S8X7GZ2p1pTJW/Wfv1nPr0rKXImqx6YU+lTQi7T6oScChti/j+lSotbLklUix
 ipI+3/2oURVmm0ivNEDSQ5lYA2FUn1fcgOYW7Sew=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/27] drm: bridge: simple-bridge: Delegate operations to next
 bridge
Date: Tue, 26 May 2020 04:14:44 +0300
Message-Id: <20200526011505.31884-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of poking into the DT node of the next bridge for its DDC bus
and implementing the .get_modes() and .detect() connector operations
manually, retrieve the next bridge in the chain and delegate these
operations to it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v1:

- Adapt to drm_bridge_get_edid() returning NULL on error
- Acquire next bridge earlier in probe()
---
 drivers/gpu/drm/bridge/simple-bridge.c | 104 ++++++++++---------------
 1 file changed, 39 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index a2dca7a3ef03..a1be269d833a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -29,7 +29,7 @@ struct simple_bridge {
 
 	const struct simple_bridge_info *info;
 
-	struct i2c_adapter	*ddc;
+	struct drm_bridge	*next_bridge;
 	struct regulator	*vdd;
 	struct gpio_desc	*enable;
 };
@@ -52,29 +52,28 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (!sbridge->ddc)
-		goto fallback;
+	if (sbridge->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		edid = drm_bridge_get_edid(sbridge->next_bridge, connector);
+		if (!edid)
+			DRM_INFO("EDID read failed. Fallback to standard modes\n");
+	} else {
+		edid = NULL;
+	}
 
-	edid = drm_get_edid(connector, sbridge->ddc);
 	if (!edid) {
-		DRM_INFO("EDID readout failed, falling back to standard modes\n");
-		goto fallback;
+		/*
+		 * In case we cannot retrieve the EDIDs (missing or broken DDC
+		 * bus from the next bridge), fallback on the XGA standards and
+		 * prefer a mode pretty much anyone can handle.
+		 */
+		ret = drm_add_modes_noedid(connector, 1920, 1200);
+		drm_set_preferred_mode(connector, 1024, 768);
+		return ret;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
-	return ret;
-
-fallback:
-	/*
-	 * In case we cannot retrieve the EDIDs (broken or missing i2c
-	 * bus), fallback on the XGA standards
-	 */
-	ret = drm_add_modes_noedid(connector, 1920, 1200);
-
-	/* And prefer a mode pretty much anyone can handle */
-	drm_set_preferred_mode(connector, 1024, 768);
 
 	return ret;
 }
@@ -88,16 +87,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
 
-	/*
-	 * Even if we have an I2C bus, we can't assume that the cable
-	 * is disconnected if drm_probe_ddc fails. Some cables don't
-	 * wire the DDC pins, or the I2C bus might not be working at
-	 * all.
-	 */
-	if (sbridge->ddc && drm_probe_ddc(sbridge->ddc))
-		return connector_status_connected;
-
-	return connector_status_unknown;
+	return drm_bridge_detect(sbridge->next_bridge);
 }
 
 static const struct drm_connector_funcs simple_bridge_con_funcs = {
@@ -120,6 +110,11 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
+	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0)
+		return ret;
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
 		return -ENODEV;
@@ -130,7 +125,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
 					  &simple_bridge_con_funcs,
 					  sbridge->info->connector_type,
-					  sbridge->ddc);
+					  sbridge->next_bridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -172,31 +167,10 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
 	.disable	= simple_bridge_disable,
 };
 
-static struct i2c_adapter *simple_bridge_retrieve_ddc(struct device *dev)
-{
-	struct device_node *phandle, *remote;
-	struct i2c_adapter *ddc;
-
-	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
-	if (!remote)
-		return ERR_PTR(-EINVAL);
-
-	phandle = of_parse_phandle(remote, "ddc-i2c-bus", 0);
-	of_node_put(remote);
-	if (!phandle)
-		return ERR_PTR(-ENODEV);
-
-	ddc = of_get_i2c_adapter_by_node(phandle);
-	of_node_put(phandle);
-	if (!ddc)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	return ddc;
-}
-
 static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
+	struct device_node *remote;
 
 	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
 	if (!sbridge)
@@ -205,6 +179,20 @@ static int simple_bridge_probe(struct platform_device *pdev)
 
 	sbridge->info = of_device_get_match_data(&pdev->dev);
 
+	/* Get the next bridge in the pipeline. */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
+	if (!remote)
+		return -EINVAL;
+
+	sbridge->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
+
+	if (!sbridge->next_bridge) {
+		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
+		return -EPROBE_DEFER;
+	}
+
+	/* Get the regulator and GPIO resources. */
 	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
 	if (IS_ERR(sbridge->vdd)) {
 		int ret = PTR_ERR(sbridge->vdd);
@@ -222,18 +210,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return PTR_ERR(sbridge->enable);
 	}
 
-	sbridge->ddc = simple_bridge_retrieve_ddc(&pdev->dev);
-	if (IS_ERR(sbridge->ddc)) {
-		if (PTR_ERR(sbridge->ddc) == -ENODEV) {
-			dev_dbg(&pdev->dev,
-				"No i2c bus specified. Disabling EDID readout\n");
-			sbridge->ddc = NULL;
-		} else {
-			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
-			return PTR_ERR(sbridge->ddc);
-		}
-	}
-
+	/* Register the bridge. */
 	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
@@ -249,9 +226,6 @@ static int simple_bridge_remove(struct platform_device *pdev)
 
 	drm_bridge_remove(&sbridge->bridge);
 
-	if (sbridge->ddc)
-		i2c_put_adapter(sbridge->ddc);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
