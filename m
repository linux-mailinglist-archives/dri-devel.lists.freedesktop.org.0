Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C923AE975
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517089FED;
	Mon, 21 Jun 2021 12:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92C89AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:55:54 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DAC04C2C;
 Mon, 21 Jun 2021 14:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280153;
 bh=kkfz5b7/19PErkkJpSif6OHnj/n11gz4Gc5kAgIhlAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YSc8jRilOI2pgIaHqtql+E+zTrizO3EdiccCDiHWsGDWCWiqfwnVQo+72KHXAp/33
 KhHBUZ6yVi58ayr5BwbSDV5+NK11pPnpu+AF+xBviWxguqeRwB0J14Y4lUDq1ddrD0
 BjssQeAZDJ3JclvMoDVbnIO0vGt/+/wR4Oi44deo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm: bridge: ti-sn65dsi83: Retrieve output format from
 bridge state
Date: Mon, 21 Jun 2021 15:55:17 +0300
Message-Id: <20210621125518.13715-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
References: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Adam Ford <aford173@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver currently iterates over all connectors to get the bus format,
used to configure the LVDS output format. This causes several issues:

- If other connectors than the LVDS output are present, the format used
  by the driver may end up belonging to an entirely different output.

- The code can crash if some connectors are not connected, as bus_format
  may then be NULL.

- There's no guarantee that the bus format on the connector at the
  output of the pipeline matches the output of the sn65dsi83, as there
  may be other bridges in the pipeline.

Solve this by retrieving the format from the bridge state instead, which
provides the format corresponding to the output of the bridge.

The struct sn65dsi83 lvds_format_24bpp and lvds_format_jeida fields are
moved to local variables in sn65dsi83_atomic_enable() as they're now
used in that function only.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 73 +++++++++++++--------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 8c1189a8bb4d..8cfa96977832 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -147,8 +147,6 @@ struct sn65dsi83 {
 	int				dsi_lanes;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
-	bool				lvds_format_24bpp;
-	bool				lvds_format_jeida;
 };
 
 static const struct regmap_range sn65dsi83_readable_ranges[] = {
@@ -371,11 +369,45 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 				    struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_bridge_state *bridge_state;
+	bool lvds_format_24bpp;
+	bool lvds_format_jeida;
 	unsigned int pval;
 	__le16 le16val;
 	u16 val;
 	int ret;
 
+	/* Get the LVDS format from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		lvds_format_24bpp = false;
+		lvds_format_jeida = true;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		lvds_format_24bpp = true;
+		lvds_format_jeida = true;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		lvds_format_24bpp = true;
+		lvds_format_jeida = false;
+		break;
+	default:
+		/*
+		 * Some bridges still don't set the correct
+		 * LVDS bus pixel format, use SPWG24 default
+		 * format until those are fixed.
+		 */
+		lvds_format_24bpp = true;
+		lvds_format_jeida = false;
+		dev_warn(ctx->dev,
+			 "Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
+			 bridge_state->output_bus_cfg.format);
+		break;
+	}
+
 	/* Clear reset, disable PLL */
 	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
@@ -405,14 +437,14 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	       REG_LVDS_FMT_VS_NEG_POLARITY : 0);
 
 	/* Set up bits-per-pixel, 18bpp or 24bpp. */
-	if (ctx->lvds_format_24bpp) {
+	if (lvds_format_24bpp) {
 		val |= REG_LVDS_FMT_CHA_24BPP_MODE;
 		if (ctx->lvds_dual_link)
 			val |= REG_LVDS_FMT_CHB_24BPP_MODE;
 	}
 
 	/* Set up LVDS format, JEIDA/Format 1 or SPWG/Format 2 */
-	if (ctx->lvds_format_jeida) {
+	if (lvds_format_jeida) {
 		val |= REG_LVDS_FMT_CHA_24BPP_FORMAT1;
 		if (ctx->lvds_dual_link)
 			val |= REG_LVDS_FMT_CHB_24BPP_FORMAT1;
@@ -515,41 +547,8 @@ static void sn65dsi83_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *adj)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	struct drm_encoder *encoder = bridge->encoder;
-	struct drm_device *ddev = encoder->dev;
-	struct drm_connector *connector;
 
 	ctx->mode = *adj;
-
-	/* The DSI format is always RGB888_1X24 */
-	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
-		switch (connector->display_info.bus_formats[0]) {
-		case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
-			ctx->lvds_format_24bpp = false;
-			ctx->lvds_format_jeida = true;
-			break;
-		case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
-			ctx->lvds_format_24bpp = true;
-			ctx->lvds_format_jeida = true;
-			break;
-		case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
-			ctx->lvds_format_24bpp = true;
-			ctx->lvds_format_jeida = false;
-			break;
-		default:
-			/*
-			 * Some bridges still don't set the correct
-			 * LVDS bus pixel format, use SPWG24 default
-			 * format until those are fixed.
-			 */
-			ctx->lvds_format_24bpp = true;
-			ctx->lvds_format_jeida = false;
-			dev_warn(ctx->dev,
-				 "Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
-				 connector->display_info.bus_formats[0]);
-			break;
-		}
-	}
 }
 
 #define MAX_INPUT_SEL_FORMATS	1
-- 
Regards,

Laurent Pinchart

