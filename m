Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EF877C06
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1154112282;
	Mon, 11 Mar 2024 08:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Q1a9WOJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D46112282
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:58:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710147516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpFxJ3SaUbuEjaQuODo+eOlkZ4g0ImTCeEIwDGa1hhA=;
 b=Q1a9WOJMkc6IbEnTNssVw0C/c+fyjJxbDseLI6wW8C0ScFVC3LHPQL2pRsybyFCO6kZuG3
 mUGJoDd7l3sI18d1hohdqwH/upk833TzmPftgrcXzlvbljTiJu3tledqhM1kfpd9bVQ4pZ
 4Zw9aruiMISUP9qQVBd/TUtAGUtFeXw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 4/5] drm-bridge: it66121: Use fwnode API to acquire device
 properties
Date: Mon, 11 Mar 2024 16:56:58 +0800
Message-Id: <20240311085659.244043-5-sui.jingfeng@linux.dev>
In-Reply-To: <20240311085659.244043-1-sui.jingfeng@linux.dev>
References: <20240311085659.244043-1-sui.jingfeng@linux.dev>
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

Make this driver less DT-dependent by calling the freshly created helpers,
should be no functional changes for DT based systems. But open the door for
otherwise use cases. Even though there is no user emerged yet, this still
do no harms. In fact, we reduce boilerplate across drm bridge drivers.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 63 +++++++++++++++-------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 1c3433b5e366..a04d755fed4c 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -15,7 +15,6 @@
 #include <linux/bitfield.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
-#include <linux/of_graph.h>
 #include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/regulator/consumer.h>
@@ -1480,7 +1479,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+	if (!fwnode_property_present(dev_fwnode(dev), "#sound-dai-cells")) {
 		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
 		return 0;
 	}
@@ -1503,13 +1502,36 @@ static const char * const it66121_supplies[] = {
 	"vcn33", "vcn18", "vrf12"
 };
 
+static int it66121_read_bus_width(struct fwnode_handle *fwnode, u32 *bus_width)
+{
+	struct fwnode_handle *endpoint;
+	u32 val;
+	int ret;
+
+	endpoint = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
+	if (!endpoint)
+		return -EINVAL;
+
+	ret = fwnode_property_read_u32(endpoint, "bus-width", &val);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return ret;
+
+	if (val != 12 && val != 24)
+		return -EINVAL;
+
+	*bus_width = val;
+
+	return 0;
+}
+
 static int it66121_probe(struct i2c_client *client)
 {
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
-	struct device_node *ep;
 	int ret;
 	struct it66121_ctx *ctx;
 	struct device *dev = &client->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "I2C check functionality failed.\n");
@@ -1520,35 +1542,20 @@ static int it66121_probe(struct i2c_client *client)
 	if (!ctx)
 		return -ENOMEM;
 
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	if (!ep)
-		return -EINVAL;
-
 	ctx->dev = dev;
 	ctx->client = client;
 	ctx->info = i2c_get_match_data(client);
 
-	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
-	of_node_put(ep);
-
-	if (ctx->bus_width != 12 && ctx->bus_width != 24)
-		return -EINVAL;
-
-	ep = of_graph_get_remote_node(dev->of_node, 1, -1);
-	if (!ep) {
-		dev_err(ctx->dev, "The endpoint is unconnected\n");
-		return -EINVAL;
-	}
-
-	if (!of_device_is_available(ep)) {
-		of_node_put(ep);
-		dev_err(ctx->dev, "The remote device is disabled\n");
-		return -ENODEV;
-	}
+	ret = it66121_read_bus_width(fwnode, &ctx->bus_width);
+	if (ret)
+		return ret;
 
-	ctx->next_bridge = of_drm_find_bridge(ep);
-	of_node_put(ep);
-	if (!ctx->next_bridge) {
+	ctx->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);
+	if (IS_ERR(ctx->next_bridge)) {
+		ret = PTR_ERR(ctx->next_bridge);
+		dev_err(dev, "Error in founding the next bridge: %d\n", ret);
+		return ret;
+	} else if (!ctx->next_bridge) {
 		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}
@@ -1584,9 +1591,9 @@ static int it66121_probe(struct i2c_client *client)
 	}
 
 	ctx->bridge.funcs = &it66121_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+	drm_bridge_set_node(&ctx->bridge, fwnode);
 
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,	it66121_irq_threaded_handler,
 					IRQF_ONESHOT, dev_name(dev), ctx);
-- 
2.34.1

