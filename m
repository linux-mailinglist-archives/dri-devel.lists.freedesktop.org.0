Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D413875514
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB4E10E625;
	Thu,  7 Mar 2024 17:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MjrdmZM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447210E625
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:24:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1709832256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aep+0Bx5dDl+omojFo37hiW07MeWApSc10wBdc6QHoM=;
 b=MjrdmZM97DGXf8NUgnv3kQSFenL756NRBX0a4Eq1+HUwHoKn6W6QjgZQ96aX4pIZwBP2A/
 6K+QnMIvFW0gfAhnUvtLD/28VexBFk2ynaqz0K6pIMBQNLaYoZksAeNPK9szWCnRtFWZ8Q
 8D1znj6H8xMX2ctIvDQtx36GGbAz/34=
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
Subject: [PATCH v2 3/4] drm-bridge: display-connector: Use fwnode API to
 acquire device properties
Date: Fri,  8 Mar 2024 01:23:33 +0800
Message-Id: <20240307172334.1753343-4-sui.jingfeng@linux.dev>
In-Reply-To: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
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

Make this driver less DT-dependent by using the fwnode helper function,
should be no functional changes for DT based systems. Do the necessary
works before it can be truely subsystem independent, even though there
is no user yet, this still do no harms.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/display-connector.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index ab8e00baf3f1..d80cb7bc59e6 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -204,6 +204,7 @@ static int display_connector_get_supply(struct platform_device *pdev,
 
 static int display_connector_probe(struct platform_device *pdev)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct display_connector *conn;
 	unsigned int type;
 	const char *label = NULL;
@@ -215,15 +216,15 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, conn);
 
-	type = (uintptr_t)of_device_get_match_data(&pdev->dev);
+	type = (uintptr_t)device_get_match_data(&pdev->dev);
 
 	/* Get the exact connector type. */
 	switch (type) {
 	case DRM_MODE_CONNECTOR_DVII: {
 		bool analog, digital;
 
-		analog = of_property_read_bool(pdev->dev.of_node, "analog");
-		digital = of_property_read_bool(pdev->dev.of_node, "digital");
+		analog = fwnode_property_present(fwnode, "analog");
+		digital = fwnode_property_present(fwnode, "digital");
 		if (analog && !digital) {
 			conn->bridge.type = DRM_MODE_CONNECTOR_DVIA;
 		} else if (!analog && digital) {
@@ -240,8 +241,7 @@ static int display_connector_probe(struct platform_device *pdev)
 	case DRM_MODE_CONNECTOR_HDMIA: {
 		const char *hdmi_type;
 
-		ret = of_property_read_string(pdev->dev.of_node, "type",
-					      &hdmi_type);
+		ret = fwnode_property_read_string(fwnode, "type", &hdmi_type);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "HDMI connector with no type\n");
 			return -EINVAL;
@@ -271,7 +271,7 @@ static int display_connector_probe(struct platform_device *pdev)
 	conn->bridge.interlace_allowed = true;
 
 	/* Get the optional connector label. */
-	of_property_read_string(pdev->dev.of_node, "label", &label);
+	fwnode_property_read_string(fwnode, "label", &label);
 
 	/*
 	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
@@ -309,12 +309,12 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DVII ||
 	    type == DRM_MODE_CONNECTOR_HDMIA ||
 	    type == DRM_MODE_CONNECTOR_VGA) {
-		struct device_node *phandle;
+		struct fwnode_handle *phandle;
 
-		phandle = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
-		if (phandle) {
-			conn->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
-			of_node_put(phandle);
+		phandle = fwnode_find_reference(fwnode, "ddc-i2c-bus", 0);
+		if (!IS_ERR_OR_NULL(phandle)) {
+			conn->bridge.ddc = i2c_get_adapter_by_fwnode(phandle);
+			fwnode_handle_put(phandle);
 			if (!conn->bridge.ddc)
 				return -EPROBE_DEFER;
 		} else {
@@ -358,7 +358,7 @@ static int display_connector_probe(struct platform_device *pdev)
 	}
 
 	conn->bridge.funcs = &display_connector_bridge_funcs;
-	conn->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_set_node(&conn->bridge, fwnode);
 
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
-- 
2.34.1

