Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B211EA47
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 19:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D976EBCC;
	Fri, 13 Dec 2019 18:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71106EBCC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:28:01 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66E417529;
 Fri, 13 Dec 2019 19:27:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576261679;
 bh=JHIF8Ay7cwpZwEjeC8uAb7SBJoe8gDQLcu6I7ECYSxI=;
 h=From:To:Cc:Subject:Date:From;
 b=ONsd+4UOqcIHv8EZsAeoicYGVBNArOzlX4v/KhfSGN5olFkDQbWyRs4dmSOeXhNw/
 Jo8BfD7TL1FpxHG7GDjqyjDvNSlK3vzmqJ74PDs2e1SXh9jwHaHGMqOhBCmkB6Jaed
 WS2a/llQDk5vlOqKgDDXJ6jhkg3cV7BoMW+iQy5k=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: rcar-du: lvds: Get mode from state
Date: Fri, 13 Dec 2019 20:27:42 +0200
Message-Id: <20191213182742.24348-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The R-Car LVDS encoder driver implements the bridge .mode_set()
operation for the sole purpose of storing the mode in the LVDS private
data, to be used later when enabling the encoder.

Switch to the bridge .atomic_enable() and .atomic_disable() operations
in order to access the global atomic state, and get the mode from the
state instead. Remove both the unneeded .mode_set() operation and the
display_mode and mode fields storing state data from the rcar_lvds
private structure.

As a side effect we get the CRTC from the state, replace the CRTC
pointer retrieved through the bridge's encoder that shouldn't be used by
atomic drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Call .atomic_enable() on the companion
- Set companion->encoder in .attach()

The patch has been tested on the Draak board with the HDMI output in
LVDS dual-link mode, and on the Salvator-XS board with the HDMI, VGA and
LVDS outputs in single-link mode.

---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 158 +++++++++++++++-------------
 1 file changed, 85 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8c6c172bbf2e..c550bfd59e71 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -65,9 +65,6 @@ struct rcar_lvds {
 		struct clk *dotclkin[2];	/* External DU clocks */
 	} clocks;
 
-	struct drm_display_mode display_mode;
-	enum rcar_lvds_mode mode;
-
 	struct drm_bridge *companion;
 	bool dual_link;
 };
@@ -402,10 +399,51 @@ EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
  * Bridge
  */
 
-static void rcar_lvds_enable(struct drm_bridge *bridge)
+static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds,
+					const struct drm_connector *connector)
+{
+	const struct drm_display_info *info;
+	enum rcar_lvds_mode mode;
+
+	/*
+	 * There is no API yet to retrieve LVDS mode from a bridge, only panels
+	 * are supported.
+	 */
+	if (!lvds->panel)
+		return RCAR_LVDS_MODE_JEIDA;
+
+	info = &connector->display_info;
+	if (!info->num_bus_formats || !info->bus_formats) {
+		dev_err(lvds->dev, "no LVDS bus format reported\n");
+		return RCAR_LVDS_MODE_JEIDA;
+	}
+
+	switch (info->bus_formats[0]) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		mode = RCAR_LVDS_MODE_JEIDA;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		mode = RCAR_LVDS_MODE_VESA;
+		break;
+	default:
+		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
+			info->bus_formats[0]);
+		return RCAR_LVDS_MODE_JEIDA;
+	}
+
+	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		mode |= RCAR_LVDS_MODE_MIRROR;
+
+	return mode;
+}
+
+static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
-	const struct drm_display_mode *mode = &lvds->display_mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 	u32 lvdhcr;
 	u32 lvdcr0;
 	int ret;
@@ -414,9 +452,14 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		return;
 
+	/* Retrieve the connector and CRTC through the atomic state. */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+
 	/* Enable the companion LVDS encoder in dual-link mode. */
 	if (lvds->dual_link && lvds->companion)
-		lvds->companion->funcs->enable(lvds->companion);
+		lvds->companion->funcs->atomic_enable(lvds->companion, state);
 
 	/*
 	 * Hardcode the channels and control signals routing for now.
@@ -452,18 +495,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	 * PLL clock configuration on all instances but the companion in
 	 * dual-link mode.
 	 */
-	if (!lvds->dual_link || lvds->companion)
+	if (!lvds->dual_link || lvds->companion) {
+		const struct drm_crtc_state *crtc_state =
+			drm_atomic_get_new_crtc_state(state, crtc);
+		const struct drm_display_mode *mode =
+			&crtc_state->adjusted_mode;
+
 		lvds->info->pll_setup(lvds, mode->clock * 1000);
+	}
 
 	/* Set the LVDS mode and select the input. */
-	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	lvdcr0 = rcar_lvds_get_lvds_mode(lvds, connector) << LVDCR0_LVMD_SHIFT;
 
 	if (lvds->bridge.encoder) {
-		/*
-		 * FIXME: We should really retrieve the CRTC through the state,
-		 * but how do we get a state pointer?
-		 */
-		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
+		if (drm_crtc_index(crtc) == 2)
 			lvdcr0 |= LVDCR0_DUSEL;
 	}
 
@@ -520,7 +565,8 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void rcar_lvds_disable(struct drm_bridge *bridge)
+static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
@@ -558,54 +604,6 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds)
-{
-	struct drm_display_info *info = &lvds->connector.display_info;
-	enum rcar_lvds_mode mode;
-
-	/*
-	 * There is no API yet to retrieve LVDS mode from a bridge, only panels
-	 * are supported.
-	 */
-	if (!lvds->panel)
-		return;
-
-	if (!info->num_bus_formats || !info->bus_formats) {
-		dev_err(lvds->dev, "no LVDS bus format reported\n");
-		return;
-	}
-
-	switch (info->bus_formats[0]) {
-	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
-	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
-		mode = RCAR_LVDS_MODE_JEIDA;
-		break;
-	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
-		mode = RCAR_LVDS_MODE_VESA;
-		break;
-	default:
-		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
-			info->bus_formats[0]);
-		return;
-	}
-
-	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
-		mode |= RCAR_LVDS_MODE_MIRROR;
-
-	lvds->mode = mode;
-}
-
-static void rcar_lvds_mode_set(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       const struct drm_display_mode *adjusted_mode)
-{
-	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
-
-	lvds->display_mode = *adjusted_mode;
-
-	rcar_lvds_get_lvds_mode(lvds);
-}
-
 static int rcar_lvds_attach(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
@@ -614,32 +612,47 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
 	int ret;
 
 	/* If we have a next bridge just attach it. */
-	if (lvds->next_bridge)
-		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
-					 bridge);
+	if (lvds->next_bridge) {
+		ret = drm_bridge_attach(bridge->encoder, lvds->next_bridge,
+					bridge);
+		goto done;
+	}
 
 	/* Otherwise if we have a panel, create a connector. */
-	if (!lvds->panel)
-		return 0;
+	if (!lvds->panel) {
+		ret = 0;
+		goto done;
+	}
 
 	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	drm_connector_helper_add(connector, &rcar_lvds_conn_helper_funcs);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0)
-		return ret;
+		goto done;
+
+	ret = drm_panel_attach(lvds->panel, connector);
 
-	return drm_panel_attach(lvds->panel, connector);
+done:
+	if (!ret) {
+		if (lvds->companion)
+			lvds->companion->encoder = encoder;
+	}
+
+	return 0;
 }
 
 static void rcar_lvds_detach(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
+	if (lvds->companion)
+		lvds->companion->encoder = NULL;
+
 	if (lvds->panel)
 		drm_panel_detach(lvds->panel);
 }
@@ -647,10 +660,9 @@ static void rcar_lvds_detach(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
 	.detach = rcar_lvds_detach,
-	.enable = rcar_lvds_enable,
-	.disable = rcar_lvds_disable,
+	.atomic_enable = rcar_lvds_atomic_enable,
+	.atomic_disable = rcar_lvds_atomic_disable,
 	.mode_fixup = rcar_lvds_mode_fixup,
-	.mode_set = rcar_lvds_mode_set,
 };
 
 bool rcar_lvds_dual_link(struct drm_bridge *bridge)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
