Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F6836ABB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16410F5EA;
	Mon, 22 Jan 2024 16:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD9B10F5ED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:32:45 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705941163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaW0Gpay7iBfH7QtKRfcxFikX4DDF/x/sLLBI1Dwvao=;
 b=IfhvQlpGNlQH5yBLfh+N0DpfnsOJwHsPBE+HPFPkGI36lhsRVKljNc2gz732ufGYS1a8N/
 Cp1np5uq5zTMjfcXhxUR5Q8HOnYcgFSem8OOOG6jd0ad3tj35dzAL+Lrj1rEARoUqnLRPB
 dcCzHGrWbN+29ww2QrD4poINOgtdrAI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 5/5] drm-bridge: display-connector: Switch to use fwnode API
Date: Tue, 23 Jan 2024 00:32:20 +0800
Message-Id: <20240122163220.110788-6-sui.jingfeng@linux.dev>
In-Reply-To: <20240122163220.110788-1-sui.jingfeng@linux.dev>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because API has wider coverage, it can be used on non-DT systems as well.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/bridge/display-connector.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index eb7e194e7735..2c3e54a458e8 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -243,8 +243,8 @@ static int display_connector_probe(struct platform_device *pdev)
 	case DRM_MODE_CONNECTOR_DVII: {
 		bool analog, digital;
 
-		analog = of_property_read_bool(pdev->dev.of_node, "analog");
-		digital = of_property_read_bool(pdev->dev.of_node, "digital");
+		analog = fwnode_property_present(pdev->dev.fwnode, "analog");
+		digital = fwnode_property_present(pdev->dev.fwnode, "digital");
 		if (analog && !digital) {
 			conn->bridge.type = DRM_MODE_CONNECTOR_DVIA;
 		} else if (!analog && digital) {
@@ -261,8 +261,8 @@ static int display_connector_probe(struct platform_device *pdev)
 	case DRM_MODE_CONNECTOR_HDMIA: {
 		const char *hdmi_type;
 
-		ret = of_property_read_string(pdev->dev.of_node, "type",
-					      &hdmi_type);
+		ret = fwnode_property_read_string(pdev->dev.fwnode, "type",
+						  &hdmi_type);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "HDMI connector with no type\n");
 			return -EINVAL;
@@ -292,7 +292,7 @@ static int display_connector_probe(struct platform_device *pdev)
 	conn->bridge.interlace_allowed = true;
 
 	/* Get the optional connector label. */
-	of_property_read_string(pdev->dev.of_node, "label", &label);
+	fwnode_property_read_string(pdev->dev.fwnode, "label", &label);
 
 	/*
 	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
@@ -330,12 +330,13 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DVII ||
 	    type == DRM_MODE_CONNECTOR_HDMIA ||
 	    type == DRM_MODE_CONNECTOR_VGA) {
-		struct device_node *phandle;
+		struct fwnode_handle *fwnode;
 
-		phandle = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
-		if (phandle) {
-			conn->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
-			of_node_put(phandle);
+		fwnode = fwnode_find_reference(pdev->dev.fwnode, "ddc-i2c-bus", 0);
+		if (!IS_ERR_OR_NULL(fwnode)) {
+			dev_info(&pdev->dev, "has I2C bus property\n");
+			conn->bridge.ddc = i2c_get_adapter_by_fwnode(fwnode);
+			fwnode_handle_put(fwnode);
 			if (!conn->bridge.ddc)
 				return -EPROBE_DEFER;
 		} else {
@@ -380,6 +381,7 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	conn->bridge.funcs = &display_connector_bridge_funcs;
 	conn->bridge.of_node = pdev->dev.of_node;
+	conn->bridge.fwnode = pdev->dev.fwnode;
 
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
-- 
2.25.1

