Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DB8BB10E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C14D11314C;
	Fri,  3 May 2024 16:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ehicEv4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3B611314C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:41:53 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yyy5fyLjc4szJD74rdcFLjNsUfkjdPQxKNTJGttYiLo=;
 b=ehicEv4VgCJtYTUgspFM2K9Z8IDFnv0D5QxMm9wF4EjE0TRLFqtYwNp3WRHDX046eKyDlu
 kMHLSl9qfPFfuH4xgOB2cksvJXSOKlWGKuUXhAoky/ZJ2DYym4+znRfKFWOuNmN8H8aLlA
 1m+2uJBB5l1M0RDyHlQt41ZUJQxj6Qo=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 07/10] drm/bridge: tfp410: Use fwnode APIs to acquire
 device properties
Date: Sat,  4 May 2024 00:41:03 +0800
Message-Id: <20240503164106.1172650-8-sui.jingfeng@linux.dev>
In-Reply-To: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
References: <20240503164106.1172650-1-sui.jingfeng@linux.dev>
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

Make this driver less DT-dependent by calling the newly created helpers,
also switch to use fwnode APIs to acquire additional device properties.
No functional changes for DT-based systems.

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

