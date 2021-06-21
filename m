Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D53AE977
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFB789FF6;
	Mon, 21 Jun 2021 12:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F103189FEA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:55:55 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5F2B557E;
 Mon, 21 Jun 2021 14:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280154;
 bh=xtjVmdO6FjW4FT4gJajmsNgsxs+jmqOKWMFF7L7Qe7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E73PMvm05X6HWH/+PfJjg8b84oas5f2tHEqzd82ySOLOQnffF0E2UKAFrOpE4YHLm
 qT/M7cZPJYQhXUMC0CvboVphRl5OSHG76AR4ulhpOC7f0ERFBIWpN6yXITNAbizHiv
 6G/KTt/Vlis4o4ZMcnnHns0y83hUumuBUu9EASSg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm: bridge: ti-sn65dsi83: Retrieve the display mode from
 the state
Date: Mon, 21 Jun 2021 15:55:18 +0300
Message-Id: <20210621125518.13715-6-laurent.pinchart@ideasonboard.com>
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

Instead of storing a copy of the display mode in the sn65dsi83
structure, retrieve it from the atomic state in
sn65dsi83_atomic_enable(). This allows the removal of the .mode_set()
operation, and completes the transition to the atomic API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 49 ++++++++++++++-------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 8cfa96977832..9072342566f3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -137,7 +137,6 @@ enum sn65dsi83_model {
 
 struct sn65dsi83 {
 	struct drm_bridge		bridge;
-	struct drm_display_mode		mode;
 	struct device			*dev;
 	struct regmap			*regmap;
 	struct device_node		*host_node;
@@ -371,6 +370,10 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_bridge_state *bridge_state;
+	const struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 	bool lvds_format_24bpp;
 	bool lvds_format_jeida;
 	unsigned int pval;
@@ -408,16 +411,26 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 		break;
 	}
 
+	/*
+	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
+	 * from the bridge to the encoder, to the connector and to the CRTC.
+	 */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	mode = &crtc_state->adjusted_mode;
+
 	/* Clear reset, disable PLL */
 	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
 
 	/* Reference clock derived from DSI link clock. */
 	regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
-		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, &ctx->mode)) |
+		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, mode)) |
 		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
 	regmap_write(ctx->regmap, REG_DSI_CLK,
-		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, &ctx->mode)));
+		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, mode)));
 	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
 		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
 
@@ -431,9 +444,9 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
 
 	/* Set up sync signal polarity. */
-	val = (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
+	val = (mode->flags & DRM_MODE_FLAG_NHSYNC ?
 	       REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
-	      (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
+	      (mode->flags & DRM_MODE_FLAG_NVSYNC ?
 	       REG_LVDS_FMT_VS_NEG_POLARITY : 0);
 
 	/* Set up bits-per-pixel, 18bpp or 24bpp. */
@@ -463,29 +476,29 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 		     REG_LVDS_LANE_CHB_LVDS_TERM);
 	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
 
-	le16val = cpu_to_le16(ctx->mode.hdisplay);
+	le16val = cpu_to_le16(mode->hdisplay);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
 			  &le16val, 2);
-	le16val = cpu_to_le16(ctx->mode.vdisplay);
+	le16val = cpu_to_le16(mode->vdisplay);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
 			  &le16val, 2);
 	/* 32 + 1 pixel clock to ensure proper operation */
 	le16val = cpu_to_le16(32 + 1);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &le16val, 2);
-	le16val = cpu_to_le16(ctx->mode.hsync_end - ctx->mode.hsync_start);
+	le16val = cpu_to_le16(mode->hsync_end - mode->hsync_start);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
 			  &le16val, 2);
-	le16val = cpu_to_le16(ctx->mode.vsync_end - ctx->mode.vsync_start);
+	le16val = cpu_to_le16(mode->vsync_end - mode->vsync_start);
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
 			  &le16val, 2);
 	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
-		     ctx->mode.htotal - ctx->mode.hsync_end);
+		     mode->htotal - mode->hsync_end);
 	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
-		     ctx->mode.vtotal - ctx->mode.vsync_end);
+		     mode->vtotal - mode->vsync_end);
 	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
-		     ctx->mode.hsync_start - ctx->mode.hdisplay);
+		     mode->hsync_start - mode->hdisplay);
 	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
-		     ctx->mode.vsync_start - ctx->mode.vdisplay);
+		     mode->vsync_start - mode->vdisplay);
 	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
 
 	/* Enable PLL */
@@ -542,15 +555,6 @@ sn65dsi83_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void sn65dsi83_mode_set(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       const struct drm_display_mode *adj)
-{
-	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-
-	ctx->mode = *adj;
-}
-
 #define MAX_INPUT_SEL_FORMATS	1
 
 static u32 *
@@ -584,7 +588,6 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.atomic_disable		= sn65dsi83_atomic_disable,
 	.atomic_post_disable	= sn65dsi83_atomic_post_disable,
 	.mode_valid		= sn65dsi83_mode_valid,
-	.mode_set		= sn65dsi83_mode_set,
 
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-- 
Regards,

Laurent Pinchart

