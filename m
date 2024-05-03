Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983628BB10A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B03113148;
	Fri,  3 May 2024 16:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kR4prRwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11F7113148
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:41:43 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714754502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PB1TUtuAuL++SWCo4tYuatJMpIlybQp31QpILaCl8YA=;
 b=kR4prRwMmpHQXCSr8gv/7Yz6tg6VXOJNY1k/nESj4xHi/P/SX6BWWQ3C2zKcmEAZOl4fjA
 3ZPaVhGJHRIV8RRyuxYLqXxV1pT1IbOtU5k0w5MAcuqPQ4Wl+7WKCTQSt6clsStAcFPxb+
 3C5HxHqBOs0Omx4kf1Lx8YU9RWgLilA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v5 05/10] drm/bridge: sii902x: Switch to use fwnode APIs to
 acquire device properties
Date: Sat,  4 May 2024 00:41:01 +0800
Message-Id: <20240503164106.1172650-6-sui.jingfeng@linux.dev>
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

Make this driver less DT-dependent by calling the freshly created helpers,
also switch to use fwnode APIs to acquire additional device properties.
One side benifit is that boilerplates get reduced, no functional changes
for DT-based systems.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/sii902x.c | 45 ++++++++++++--------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 8f84e98249c7..bc906b71c793 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -827,20 +827,17 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		.spdif = 0,
 		.max_i2s_channels = 0,
 	};
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u8 lanes[4];
 	int num_lanes, i;
 
-	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+	if (!fwnode_property_present(fwnode, "#sound-dai-cells")) {
 		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
 			__func__);
 		return 0;
 	}
 
-	num_lanes = of_property_read_variable_u8_array(dev->of_node,
-						       "sil,i2s-data-lanes",
-						       lanes, 1,
-						       ARRAY_SIZE(lanes));
-
+	num_lanes = fwnode_property_count_u8(fwnode, "sil,i2s-data-lanes");
 	if (num_lanes == -EINVAL) {
 		dev_dbg(dev,
 			"%s: No \"sil,i2s-data-lanes\", use default <0>\n",
@@ -852,7 +849,11 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 			"%s: Error gettin \"sil,i2s-data-lanes\": %d\n",
 			__func__, num_lanes);
 		return num_lanes;
+	} else {
+		fwnode_property_read_u8_array(fwnode, "sil,i2s-data-lanes",
+					      lanes, num_lanes);
 	}
+
 	codec_data.max_i2s_channels = 2 * num_lanes;
 
 	for (i = 0; i < num_lanes; i++)
@@ -1096,8 +1097,8 @@ static int sii902x_init(struct sii902x *sii902x)
 	if (ret)
 		goto err_unreg_audio;
 
+	drm_bridge_set_node(&sii902x->bridge, dev_fwnode(dev));
 	sii902x->bridge.funcs = &sii902x_bridge_funcs;
-	sii902x->bridge.of_node = dev->of_node;
 	sii902x->bridge.timings = &default_sii902x_timings;
 	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 
@@ -1118,7 +1119,6 @@ static int sii902x_init(struct sii902x *sii902x)
 static int sii902x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *endpoint;
 	struct sii902x *sii902x;
 	static const char * const supplies[] = {"iovcc", "cvcc12"};
 	int ret;
@@ -1147,27 +1147,14 @@ static int sii902x_probe(struct i2c_client *client)
 		return PTR_ERR(sii902x->reset_gpio);
 	}
 
-	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
-	if (endpoint) {
-		struct device_node *remote = of_graph_get_remote_port_parent(endpoint);
-
-		of_node_put(endpoint);
-		if (!remote) {
-			dev_err(dev, "Endpoint in port@1 unconnected\n");
-			return -ENODEV;
-		}
-
-		if (!of_device_is_available(remote)) {
-			dev_err(dev, "port@1 remote device is disabled\n");
-			of_node_put(remote);
-			return -ENODEV;
-		}
-
-		sii902x->next_bridge = of_drm_find_bridge(remote);
-		of_node_put(remote);
-		if (!sii902x->next_bridge)
-			return dev_err_probe(dev, -EPROBE_DEFER,
-					     "Failed to find remote bridge\n");
+	sii902x->next_bridge = drm_bridge_find_next_bridge_by_fwnode(dev_fwnode(dev), 1);
+	if (!sii902x->next_bridge) {
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "Failed to find the next bridge\n");
+	} else if (IS_ERR(sii902x->next_bridge)) {
+		ret = PTR_ERR(sii902x->next_bridge);
+		dev_err(dev, "Error on find the next bridge: %d\n", ret);
+		return ret;
 	}
 
 	mutex_init(&sii902x->mutex);
-- 
2.34.1

