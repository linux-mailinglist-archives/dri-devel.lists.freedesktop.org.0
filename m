Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257751A2CFD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 02:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED60F6EB1C;
	Thu,  9 Apr 2020 00:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFFD6EB1C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 00:43:14 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA3C59E;
 Thu,  9 Apr 2020 02:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586392610;
 bh=89Lf0M6KJBDtmCiRuqLn0HcyIfH9UIp5vL078x5TnH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GjgO9ocs3Q9vFq17sj3MGzbPXk3un31dup77Li5GIIU+qcQNeEPAzC/YpXMcu5PKj
 UgdYLBfOoYSscEytjXllAhJKtznhqkbsNpOM0n/LipFjJed1/IY+3NsW9v8bkrazxg
 hcbSwSoL5Yg8T57179MiYCP9lAHFeuwQbXBxsGsM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: bridge: simple-bridge: Delegate operations to next
 bridge
Date: Thu,  9 Apr 2020 03:36:35 +0300
Message-Id: <20200409003636.11792-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of poking into the DT node of the next bridge for its DDC bus
and implementing the .get_modes() and .detect() connector operations
manually, retrieve the next bridge in the chain and delegate these
operations to it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 98 +++++++++-----------------
 1 file changed, 33 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index a2dca7a3ef03..bac223d0430d 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -29,7 +29,7 @@ struct simple_bridge {
 
 	const struct simple_bridge_info *info;
 
-	struct i2c_adapter	*ddc;
+	struct drm_bridge	*next_bridge;
 	struct regulator	*vdd;
 	struct gpio_desc	*enable;
 };
@@ -52,29 +52,24 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (!sbridge->ddc)
-		goto fallback;
-
-	edid = drm_get_edid(connector, sbridge->ddc);
-	if (!edid) {
-		DRM_INFO("EDID readout failed, falling back to standard modes\n");
-		goto fallback;
+	edid = drm_bridge_get_edid(sbridge->next_bridge, connector);
+	if (IS_ERR_OR_NULL(edid)) {
+		if (!edid)
+			DRM_INFO("EDID readout failed, falling back to standard modes\n");
+
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
@@ -88,16 +83,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
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
@@ -120,6 +106,11 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
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
@@ -130,7 +121,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
 					  &simple_bridge_con_funcs,
 					  sbridge->info->connector_type,
-					  sbridge->ddc);
+					  sbridge->next_bridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -172,31 +163,10 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
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
@@ -222,16 +192,17 @@ static int simple_bridge_probe(struct platform_device *pdev)
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
 	}
 
 	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
@@ -249,9 +220,6 @@ static int simple_bridge_remove(struct platform_device *pdev)
 
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
