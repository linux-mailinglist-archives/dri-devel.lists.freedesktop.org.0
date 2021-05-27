Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC63393932
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7431B6F511;
	Thu, 27 May 2021 23:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5226F511
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:22:33 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 11/11] drm/ingenic: Attach bridge chain to encoders
Date: Fri, 28 May 2021 00:22:06 +0100
Message-Id: <20210527232206.152771-2-paul@crapouillou.net>
In-Reply-To: <20210527232206.152771-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
 <20210527232206.152771-1-paul@crapouillou.net>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Attach a top-level bridge to each encoder, which will be used for
negociating the bus format and flags.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 98 ++++++++++++++++++-----
 1 file changed, 77 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 01d8490393d1..f0242e917d6e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -21,6 +21,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
@@ -132,6 +133,26 @@ struct ingenic_drm {
 	struct drm_private_obj private_obj;
 };
 
+struct ingenic_drm_bridge {
+	struct drm_encoder encoder;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+
+	/*
+	 * FIXME: this should really be in ingenic_drm_private_state, but there
+	 * doesn't seem to be a way to retrieve a pointer to it from within
+	 * ingenic_drm_encoder_atomic_mode_set (no drm_atomic_state
+	 * back-pointers).
+	 */
+	struct drm_bus_cfg bus_cfg;
+};
+
+static inline struct ingenic_drm_bridge *
+to_ingenic_drm_bridge(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct ingenic_drm_bridge, encoder);
+}
+
 static inline struct ingenic_drm_private_state *
 to_ingenic_drm_priv_state(struct drm_private_state *state)
 {
@@ -749,11 +770,10 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 {
 	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct drm_connector *conn = conn_state->connector;
-	struct drm_display_info *info = &conn->display_info;
+	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
 	unsigned int cfg, rgbcfg = 0;
 
-	priv->panel_is_sharp = info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
+	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
 
 	if (priv->panel_is_sharp) {
 		cfg = JZ_LCD_CFG_MODE_SPECIAL_TFT_1 | JZ_LCD_CFG_REV_POLARITY;
@@ -766,19 +786,19 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
-	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
+	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
 		cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
-	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+	if (bridge->bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
 
 	if (!priv->panel_is_sharp) {
-		if (conn->connector_type == DRM_MODE_CONNECTOR_TV) {
+		if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV) {
 			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 				cfg |= JZ_LCD_CFG_MODE_TV_OUT_I;
 			else
 				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
 		} else {
-			switch (*info->bus_formats) {
+			switch (bridge->bus_cfg.format) {
 			case MEDIA_BUS_FMT_RGB565_1X16:
 				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
 				break;
@@ -804,20 +824,31 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
 }
 
-static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
-					    struct drm_crtc_state *crtc_state,
-					    struct drm_connector_state *conn_state)
+static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
+				     enum drm_bridge_attach_flags flags)
+{
+	struct drm_encoder *encoder = bridge->encoder;
+	struct ingenic_drm_bridge *ingenic_bridge = to_ingenic_drm_bridge(encoder);
+
+	return drm_bridge_attach(encoder, ingenic_bridge->next_bridge,
+				 &ingenic_bridge->bridge, flags);
+}
+
+static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
 {
-	struct drm_display_info *info = &conn_state->connector->display_info;
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct ingenic_drm_bridge *ingenic_bridge = to_ingenic_drm_bridge(encoder);
 
-	if (info->num_bus_formats != 1)
-		return -EINVAL;
+	ingenic_bridge->bus_cfg = bridge_state->output_bus_cfg;
 
 	if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV)
 		return 0;
 
-	switch (*info->bus_formats) {
+	switch (bridge_state->output_bus_cfg.format) {
 	case MEDIA_BUS_FMT_RGB888_3X8:
 	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
 		/*
@@ -1056,8 +1087,16 @@ static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs = {
-	.atomic_mode_set	= ingenic_drm_encoder_atomic_mode_set,
-	.atomic_check		= ingenic_drm_encoder_atomic_check,
+	.atomic_mode_set        = ingenic_drm_encoder_atomic_mode_set,
+};
+
+static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
+	.attach			= ingenic_drm_bridge_attach,
+	.atomic_check		= ingenic_drm_bridge_atomic_check,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
 };
 
 static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
@@ -1097,12 +1136,14 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ingenic_drm_private_state *private_state;
+	struct ingenic_drm_bridge *ingenic_bridge;
 	const struct jz_soc_info *soc_info;
 	struct ingenic_drm *priv;
 	struct clk *parent_clk;
 	struct drm_plane *primary;
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_device *drm;
 	void __iomem *base;
@@ -1291,22 +1332,37 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 								 DRM_MODE_CONNECTOR_DPI);
 
-		encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_DPI, NULL);
-		if (IS_ERR(encoder)) {
-			ret = PTR_ERR(encoder);
+		ingenic_bridge = drmm_encoder_alloc(drm, struct ingenic_drm_bridge,
+						    encoder, NULL,
+						    DRM_MODE_ENCODER_DPI, NULL);
+		if (IS_ERR(ingenic_bridge)) {
+			ret = PTR_ERR(ingenic_bridge);
 			dev_err(dev, "Failed to init encoder: %d\n", ret);
 			return ret;
 		}
 
-		encoder->possible_crtcs = 1;
+		encoder = &ingenic_bridge->encoder;
+		encoder->possible_crtcs = drm_crtc_mask(&priv->crtc);
 
 		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
 
-		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		ingenic_bridge->bridge.funcs = &ingenic_drm_bridge_funcs;
+		ingenic_bridge->next_bridge = bridge;
+
+		ret = drm_bridge_attach(encoder, &ingenic_bridge->bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
 			dev_err(dev, "Unable to attach bridge\n");
 			return ret;
 		}
+
+		connector = drm_bridge_connector_init(drm, encoder);
+		if (IS_ERR(connector)) {
+			dev_err(dev, "Unable to init connector\n");
+			return PTR_ERR(connector);
+		}
+
+		drm_connector_attach_encoder(connector, encoder);
 	}
 
 	drm_for_each_encoder(encoder, drm) {
-- 
2.30.2

