Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891852DB7EE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 01:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CA789AA2;
	Wed, 16 Dec 2020 00:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE95898ED
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 00:50:32 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 070C2AD5;
 Wed, 16 Dec 2020 01:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608079831;
 bh=yfrNeAaTAl5Ct87jPEQybJiYrEXqrB4rmLUQSP7bs3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RzVyKsJtiOLKX6vTyw1AVoibUTIM15+TjhUrxYbXsJ3KcdikMZbyiOPOdKzpgjw4t
 wy6AteoJUeTYXnmfT0xd9PjE/DHPLDXAyY1NH0mFnk1cIaeaWhv20f/3oHCGNv62JQ
 8SsbNevvJyU752jzZ8CKt4Iho8cpcBxrLkxOv08U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm: rcar-du: lvds: Convert to DRM panel bridge helper
Date: Wed, 16 Dec 2020 02:50:18 +0200
Message-Id: <20201216005021.19518-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the manual panel handling with usage of the DRM panel bridge
helper. This simplifies the driver, and brings support for
DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 120 +++-------------------------
 1 file changed, 12 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 70dbbe44bb23..1b360e06658c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -63,7 +63,6 @@ struct rcar_lvds {
 	struct drm_bridge bridge;
 
 	struct drm_bridge *next_bridge;
-	struct drm_connector connector;
 	struct drm_panel *panel;
 
 	void __iomem *mmio;
@@ -80,73 +79,11 @@ struct rcar_lvds {
 #define bridge_to_rcar_lvds(b) \
 	container_of(b, struct rcar_lvds, bridge)
 
-#define connector_to_rcar_lvds(c) \
-	container_of(c, struct rcar_lvds, connector)
-
 static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
 {
 	iowrite32(data, lvds->mmio + reg);
 }
 
-/* -----------------------------------------------------------------------------
- * Connector & Panel
- */
-
-static int rcar_lvds_connector_get_modes(struct drm_connector *connector)
-{
-	struct rcar_lvds *lvds = connector_to_rcar_lvds(connector);
-
-	return drm_panel_get_modes(lvds->panel, connector);
-}
-
-static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
-					    struct drm_atomic_state *state)
-{
-	struct rcar_lvds *lvds = connector_to_rcar_lvds(connector);
-	const struct drm_display_mode *panel_mode;
-	struct drm_connector_state *conn_state;
-	struct drm_crtc_state *crtc_state;
-
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
-	if (!conn_state->crtc)
-		return 0;
-
-	if (list_empty(&connector->modes)) {
-		dev_dbg(lvds->dev, "connector: empty modes list\n");
-		return -EINVAL;
-	}
-
-	panel_mode = list_first_entry(&connector->modes,
-				      struct drm_display_mode, head);
-
-	/* We're not allowed to modify the resolution. */
-	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
-	if (IS_ERR(crtc_state))
-		return PTR_ERR(crtc_state);
-
-	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
-	    crtc_state->mode.vdisplay != panel_mode->vdisplay)
-		return -EINVAL;
-
-	/* The flat panel mode is fixed, just copy it to the adjusted mode. */
-	drm_mode_copy(&crtc_state->adjusted_mode, panel_mode);
-
-	return 0;
-}
-
-static const struct drm_connector_helper_funcs rcar_lvds_conn_helper_funcs = {
-	.get_modes = rcar_lvds_connector_get_modes,
-	.atomic_check = rcar_lvds_connector_atomic_check,
-};
-
-static const struct drm_connector_funcs rcar_lvds_conn_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 /* -----------------------------------------------------------------------------
  * PLL Setup
  */
@@ -583,11 +520,6 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 	/* Turn the output on. */
 	lvdcr0 |= LVDCR0_LVRES;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	if (lvds->panel) {
-		drm_panel_prepare(lvds->panel);
-		drm_panel_enable(lvds->panel);
-	}
 }
 
 static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
@@ -609,11 +541,6 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
-	if (lvds->panel) {
-		drm_panel_disable(lvds->panel);
-		drm_panel_unprepare(lvds->panel);
-	}
-
 	rcar_lvds_write(lvds, LVDCR0, 0);
 	rcar_lvds_write(lvds, LVDCR1, 0);
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
@@ -648,45 +575,13 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
-	struct drm_connector *connector = &lvds->connector;
-	struct drm_encoder *encoder = bridge->encoder;
-	int ret;
 
-	/* If we have a next bridge just attach it. */
-	if (lvds->next_bridge)
-		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
-					 bridge, flags);
-
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
-	/* Otherwise if we have a panel, create a connector. */
-	if (!lvds->panel)
-		return 0;
-
-	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
-				 DRM_MODE_CONNECTOR_LVDS);
-	if (ret < 0)
-		return ret;
-
-	drm_connector_helper_add(connector, &rcar_lvds_conn_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static void rcar_lvds_detach(struct drm_bridge *bridge)
-{
+	return drm_bridge_attach(bridge->encoder, lvds->next_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
-	.detach = rcar_lvds_detach,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
@@ -759,7 +654,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		 * that we are expected to generate even pixels from the primary
 		 * encoder, and odd pixels from the companion encoder.
 		 */
-		if (lvds->next_bridge && lvds->next_bridge->timings &&
+		if (lvds->next_bridge->timings &&
 		    lvds->next_bridge->timings->dual_link)
 			lvds->link_type = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
 		else
@@ -811,6 +706,15 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	if (ret)
 		goto done;
 
+	if (lvds->panel) {
+		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
+							      lvds->panel);
+		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
+			ret = -EINVAL;
+			goto done;
+		}
+	}
+
 	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
 		ret = rcar_lvds_parse_dt_companion(lvds);
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
