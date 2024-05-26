Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39048CF5E9
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E0E10F606;
	Sun, 26 May 2024 20:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Kaipai+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560D210F609
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:22:04 +0000 (UTC)
X-Envelope-To: rfoss@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716754921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbVQH6UjLIjvKCoLX7bXmeNWCrvCRHfR0kUXIzVDjRE=;
 b=Kaipai+SutibUDr4EsmJ1eYyck6yOz9Qet87vyspLMoaPjpb6fOz9eF/0RObBYmFAFEWT1
 FH0xNfYVzyxeufSWffv8k61lrB5qoRVFcqiL8FA9UAAgdPvrCsHqUWGNtQrvyPtCDz+ck9
 QbP8lBxB+opjB/pyzv+kydXo4tDbEyY=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v6 06/10] drm/bridge: sii902x: Switch to use fwnode APIs to
 acquire device properties
Date: Mon, 27 May 2024 04:21:11 +0800
Message-Id: <20240526202115.129049-7-sui.jingfeng@linux.dev>
In-Reply-To: <20240526202115.129049-1-sui.jingfeng@linux.dev>
References: <20240526202115.129049-1-sui.jingfeng@linux.dev>
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
 drivers/gpu/drm/bridge/sii902x.c | 43 +++++++++++---------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index f4808838717a..975511d623a4 100644
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
@@ -1117,7 +1118,6 @@ static int sii902x_init(struct sii902x *sii902x)
 static int sii902x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *endpoint;
 	struct sii902x *sii902x;
 	static const char * const supplies[] = {"iovcc", "cvcc12"};
 	int ret;
@@ -1146,27 +1146,14 @@ static int sii902x_probe(struct i2c_client *client)
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

