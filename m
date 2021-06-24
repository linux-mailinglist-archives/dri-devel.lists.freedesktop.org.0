Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5023B242E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 02:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608266E993;
	Thu, 24 Jun 2021 00:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBD56E997
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:03:43 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E96CB1853;
 Thu, 24 Jun 2021 02:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624493022;
 bh=b+AvpS7RyXCHpEwuj0ydN3qHzSyKx0kvvdQVOtB8amo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rvoF9MKybmVSXeuTzAFJzNA5AAIAP57BIbbIFYmVH8yzVRbaMCFrPiysxPmxOzi4H
 oHOVEVmgDMtD+Fwa9MV5xjClYKx0qCnjAi3iMOB+3grwkO3qyET0gvJmYSJ2AOYfa3
 oR2hxF4yu0wtoXoLJWu61PtWTdFtgDmVIpqrqQBM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
Date: Thu, 24 Jun 2021 03:03:02 +0300
Message-Id: <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To simplify interfacing with the panel, wrap it in a panel-bridge and
let the DRM bridge helpers handle chaining of operations.

This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
requires all components in the display pipeline to be represented by
bridges.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes since v1:

- Drop error message when drm_bridge_attach() fails (now printed by the
  function)
- Return ERR_PTR() directly
- Clarify which bridge is the next bridge
- Drop ti_sn65dsi86.panel field
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 28c1ea370ae4..18b4420cc6b3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -127,7 +127,7 @@
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
  * @refclk:       Our reference clock.
- * @panel:        Our panel.
+ * @next_bridge:  The bridge on the eDP side.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
@@ -159,7 +159,7 @@ struct ti_sn65dsi86 {
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
-	struct drm_panel		*panel;
+	struct drm_bridge		*next_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
@@ -404,7 +404,8 @@ connector_to_ti_sn65dsi86(struct drm_connector *connector)
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
-	return drm_panel_get_modes(pdata->panel, connector);
+
+	return drm_bridge_get_modes(pdata->next_bridge, connector);
 }
 
 static enum drm_mode_status
@@ -530,8 +531,16 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	}
 	pdata->dsi = dsi;
 
+	/* Attach the next bridge */
+	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
+				&pdata->bridge, flags);
+	if (ret < 0)
+		goto err_dsi_detach;
+
 	return 0;
 
+err_dsi_detach:
+	mipi_dsi_detach(dsi);
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
@@ -550,8 +559,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
-	drm_panel_disable(pdata->panel);
-
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
 	/* semi auto link training mode OFF */
@@ -878,8 +885,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
-
-	drm_panel_enable(pdata->panel);
 }
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
@@ -890,16 +895,12 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 
 	if (!pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata);
-
-	drm_panel_prepare(pdata->panel);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
-	drm_panel_unprepare(pdata->panel);
-
 	if (!pdata->refclk)
 		ti_sn65dsi86_disable_comms(pdata);
 
@@ -1304,13 +1305,20 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 	struct device_node *np = pdata->dev->of_node;
+	struct drm_panel *panel;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &pdata->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret)
 		return dev_err_probe(&adev->dev, ret,
 				     "could not find any panel node\n");
 
+	pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
+	if (IS_ERR(pdata->next_bridge)) {
+		DRM_ERROR("failed to create panel bridge\n");
+		return PTR_ERR(pdata->next_bridge);
+	}
+
 	ti_sn_bridge_parse_lanes(pdata, np);
 
 	ret = ti_sn_bridge_parse_dsi_host(pdata);
-- 
Regards,

Laurent Pinchart

