Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B398AD4BE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4105112D0A;
	Mon, 22 Apr 2024 19:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="WNQpfCw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6F9112D09
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:19:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713813595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DZUEgRYcSmSCNpMFRJJvZshOZpL7UP9Hp7JpDo8EBk=;
 b=WNQpfCw0v1uvB9h2ZJSD+dj+lnnhqUm+1gVbOkZzc2oW2Fkw/rdZBScxAR1DOusgGtnPFm
 dVZu5KNFE4x6mlu8to6KL6BOeVgK9f0mtO7I431jdViOfu9sYTL8CLfddgRsHXPTPJQM33
 Iy2ayO65CrR2X7OmdHhfo8CV+qkNnkQ=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v4 8/9] drm/bridge: tfp410: Use fwnode API to acquire device
 properties
Date: Tue, 23 Apr 2024 03:19:02 +0800
Message-Id: <20240422191903.255642-9-sui.jingfeng@linux.dev>
In-Reply-To: <20240422191903.255642-1-sui.jingfeng@linux.dev>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Make this driver DT-independent by calling the freshly created helpers,
which reduce boilerplate and open the door for otherwise use cases. No
functional changes for DT based systems.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 41 +++++++++++++++---------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index c7bef5c23927..58dc7492844f 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -266,8 +266,9 @@ static const struct drm_bridge_timings tfp410_default_timings = {
 
 static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(dvi->dev);
 	struct drm_bridge_timings *timings = &dvi->timings;
-	struct device_node *ep;
+	struct fwnode_handle *ep;
 	u32 pclk_sample = 0;
 	u32 bus_width = 24;
 	u32 deskew = 0;
@@ -288,14 +289,14 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	 * and EDGE pins. They are specified in DT through endpoint properties
 	 * and vendor-specific properties.
 	 */
-	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
 	if (!ep)
 		return -EINVAL;
 
 	/* Get the sampling edge from the endpoint. */
-	of_property_read_u32(ep, "pclk-sample", &pclk_sample);
-	of_property_read_u32(ep, "bus-width", &bus_width);
-	of_node_put(ep);
+	fwnode_property_read_u32(ep, "pclk-sample", &pclk_sample);
+	fwnode_property_read_u32(ep, "bus-width", &bus_width);
+	fwnode_handle_put(ep);
 
 	timings->input_bus_flags = DRM_BUS_FLAG_DE_HIGH;
 
@@ -324,7 +325,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	}
 
 	/* Get the setup and hold time from vendor-specific properties. */
-	of_property_read_u32(dvi->dev->of_node, "ti,deskew", &deskew);
+	fwnode_property_read_u32(fwnode, "ti,deskew", &deskew);
 	if (deskew > 7)
 		return -EINVAL;
 
@@ -336,12 +337,12 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 
 static int tfp410_init(struct device *dev, bool i2c)
 {
-	struct device_node *node;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct tfp410 *dvi;
 	int ret;
 
-	if (!dev->of_node) {
-		dev_err(dev, "device-tree data is missing\n");
+	if (!fwnode) {
+		dev_err(dev, "firmware data is missing\n");
 		return -ENXIO;
 	}
 
@@ -352,8 +353,8 @@ static int tfp410_init(struct device *dev, bool i2c)
 	dvi->dev = dev;
 	dev_set_drvdata(dev, dvi);
 
+	drm_bridge_set_node(&dvi->bridge, fwnode);
 	dvi->bridge.funcs = &tfp410_bridge_funcs;
-	dvi->bridge.of_node = dev->of_node;
 	dvi->bridge.timings = &dvi->timings;
 	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
 
@@ -362,15 +363,15 @@ static int tfp410_init(struct device *dev, bool i2c)
 		return ret;
 
 	/* Get the next bridge, connected to port@1. */
-	node = of_graph_get_remote_node(dev->of_node, 1, -1);
-	if (!node)
-		return -ENODEV;
-
-	dvi->next_bridge = of_drm_find_bridge(node);
-	of_node_put(node);
-
-	if (!dvi->next_bridge)
+	dvi->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
+	if (IS_ERR(dvi->next_bridge)) {
+		ret = PTR_ERR(dvi->next_bridge);
+		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
+		return ret;
+	} else if (!dvi->next_bridge) {
+		dev_dbg(dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
+	}
 
 	/* Get the powerdown GPIO. */
 	dvi->powerdown = devm_gpiod_get_optional(dev, "powerdown",
@@ -422,10 +423,10 @@ static struct platform_driver tfp410_platform_driver = {
 /* There is currently no i2c functionality. */
 static int tfp410_i2c_probe(struct i2c_client *client)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
 	int reg;
 
-	if (!client->dev.of_node ||
-	    of_property_read_u32(client->dev.of_node, "reg", &reg)) {
+	if (!fwnode || fwnode_property_read_u32(fwnode, "reg", &reg)) {
 		dev_err(&client->dev,
 			"Can't get i2c reg property from device-tree\n");
 		return -ENXIO;
-- 
2.34.1

