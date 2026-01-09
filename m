Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6CD07942
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3710E7FF;
	Fri,  9 Jan 2026 07:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XRC/D36U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0758A10E7FC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 07:32:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ED8511A273A;
 Fri,  9 Jan 2026 07:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C18C260734;
 Fri,  9 Jan 2026 07:32:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C144103C87F9; Fri,  9 Jan 2026 08:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767943930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mRT58lzEzd+gLCQT0DaHvPwQU+Zbax+UmuJHfDra6JM=;
 b=XRC/D36UGx21h9ZgVCVfwREKXJPrX7XxTKk0lpFMtj8GPfDjB8N+YAtS5MxP/Em+bsvFdb
 6+EIa7mzQ2QgdHHL/P3aRzbeT+Nxh8JWcN1Iq9Dr7Zl1wSovDssC4GjE+uyONBtJEpSaEI
 sXvsQVvuTvp0+B+kOoBUI9CgM9ICtcCTfRDybNsqVtj09FrpPYnYZHVdSWQSSAoOl3pH3I
 qlHUp96T9k4SP8Pw3AnBpPqlAm1NBHKxg074dLyUPx7sFXITMCW8IKHc3qic3JXYzvgEsj
 u/gvOVrM4OqVf+di3o2h7rQcGxN4aZ2GiZkdkOLnX2ElBJOzN/6hLeqCPPKN+Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:38 +0100
Subject: [PATCH v2 07/12] drm/bridge: lt8912b: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-7-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 342374cb8fc6..8a0b48efca58 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -35,7 +35,6 @@ struct lt8912 {
 	struct regmap *regmap[I2C_MAX_IDX];
 
 	struct device_node *host_node;
-	struct drm_bridge *hdmi_port;
 
 	struct mipi_dsi_device *dsi;
 
@@ -407,8 +406,8 @@ lt8912_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct lt8912 *lt = connector_to_lt8912(connector);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->bridge.next_bridge, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -429,7 +428,7 @@ static int lt8912_connector_get_modes(struct drm_connector *connector)
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	int ret, num;
 
-	drm_edid = drm_bridge_edid_read(lt->hdmi_port, connector);
+	drm_edid = drm_bridge_edid_read(lt->bridge.next_bridge, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	if (!drm_edid)
 		return 0;
@@ -519,8 +518,8 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	struct drm_connector *connector = &lt->connector;
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_enable(lt->hdmi_port, lt8912_bridge_hpd_cb, lt);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_enable(lt->bridge.next_bridge, lt8912_bridge_hpd_cb, lt);
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	} else {
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
@@ -529,7 +528,7 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 
 	ret = drm_connector_init(bridge->dev, connector,
 				 &lt8912_connector_funcs,
-				 lt->hdmi_port->type);
+				 lt->bridge.next_bridge->type);
 	if (ret)
 		goto exit;
 
@@ -549,7 +548,7 @@ static int lt8912_bridge_attach(struct drm_bridge *bridge,
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, lt->hdmi_port, bridge,
+	ret = drm_bridge_attach(encoder, lt->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0) {
 		dev_err(lt->dev, "Failed to attach next bridge (%d)\n", ret);
@@ -585,8 +584,8 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 
 	lt8912_hard_power_off(lt);
 
-	if (lt->connector.dev && lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
-		drm_bridge_hpd_disable(lt->hdmi_port);
+	if (lt->connector.dev && lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_bridge_hpd_disable(lt->bridge.next_bridge);
 }
 
 static enum drm_mode_status
@@ -611,8 +610,8 @@ lt8912_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->bridge.next_bridge, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -626,8 +625,8 @@ static const struct drm_edid *lt8912_bridge_edid_read(struct drm_bridge *bridge,
 	 * edid must be read through the ddc bus but it must be
 	 * given to the hdmi connector node.
 	 */
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_EDID)
-		return drm_bridge_edid_read(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID)
+		return drm_bridge_edid_read(lt->bridge.next_bridge, connector);
 
 	dev_warn(lt->dev, "The connected bridge does not supports DRM_BRIDGE_OP_EDID\n");
 	return NULL;
@@ -723,8 +722,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 		goto err_free_host_node;
 	}
 
-	lt->hdmi_port = of_drm_find_bridge(port_node);
-	if (!lt->hdmi_port) {
+	lt->bridge.next_bridge = of_drm_find_and_get_bridge(port_node);
+	if (!lt->bridge.next_bridge) {
 		ret = -EPROBE_DEFER;
 		dev_err_probe(lt->dev, ret, "%s: Failed to get hdmi port\n", __func__);
 		goto err_free_host_node;

-- 
2.52.0

