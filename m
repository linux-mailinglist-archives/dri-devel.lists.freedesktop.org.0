Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C214A31B247
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C626E0B7;
	Sun, 14 Feb 2021 19:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4B16E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:44 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id l18so2620781pji.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vc5KRcpkrSfSP9D4LPgPMNcSqRtFMop54GG77rWCzXY=;
 b=Mccj3Wh+PlMfxtLcbH65pM7vuw5oxEhSkUkF1c4iAgwrY8lMBA+q8L8yHw6o3YXkZO
 YOHirmcbcWec/Os7NUQ2G/cyC21MnhsltrHWeZf9ehv8Es8rKeJqsHdumkFNGvT+EAjV
 7QdZIazWfU0UljBjoz6zKdMv9Bjb2/P+oeD0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vc5KRcpkrSfSP9D4LPgPMNcSqRtFMop54GG77rWCzXY=;
 b=ANXpOsf971afbQy3+V6kP96dOGfsF1tR++gIaU8CWfWjiDeEikI3e85dYc/BskLvpT
 z6dTLHlQx7b74gx0v8VF4WLdKeqNveLHH5/eC4eA5I+ZiXY7X39oA7swjjqNc1adwkm/
 u2Qq/71jZWTUdEhGDcASck5x7CqCQxYT3NTL8aAbFGqaFee5yPnrd7XOEij67PtmTBBp
 zaAe1N3oV3d+ZbXY3LQ8Wme1pcAtKIhISZQADjTff4nE1t+wsAqCJyWM2zX6TI9SoN4F
 4XVJ9rJ4WzqsJkcoupKFEdi5vxuy9NvKWxBVxKQWtkBpWcDXDsufQJs3zccantW/evjk
 zVkQ==
X-Gm-Message-State: AOAM530flcQN241+9wv6+x5KUi58gr5pMOsCrjl2EL8qp14sFQp6Z0ow
 z6v2PR/quzVkcabbuhHmbj04eA==
X-Google-Smtp-Source: ABdhPJyOz3Qj5yfB0wNBVt9gfgPrFtOAWwP3Tn8Brw3R+wn/ER5CaxyvhJz9wIhmPdAoC/+eZ7BYGw==
X-Received: by 2002:a17:902:860a:b029:e3:5d18:29af with SMTP id
 f10-20020a170902860ab02900e35d1829afmr188248plo.64.1613331704576; 
 Sun, 14 Feb 2021 11:41:44 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 6/7] drm: sun4i: dsi: Use drm_panel_bridge, connector API
Date: Mon, 15 Feb 2021 01:11:01 +0530
Message-Id: <20210214194102.126146-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_panel_bridge to replace manual panel handling code.

This simplifies the driver to allows all components in the
display pipeline to be treated as bridges, paving the way
to generic connector handling.

Use drm_bridge_connector_init to create a connector for display
pipelines that use drm_bridge.

This allows splitting connector operations across multiple bridges
when necessary, instead of having the last bridge in the chain
creating the connector and handling all connector operations
internally.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 108 +++++++------------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 --
 2 files changed, 27 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 3cdc14daf25c..5e5d3789b3df 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -769,12 +770,6 @@ static void sun6i_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 	phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
 	phy_configure(dsi->dphy, &opts);
 	phy_power_on(dsi->dphy);
-
-	if (dsi->panel)
-		drm_panel_prepare(dsi->panel);
-
-	if (dsi->panel_bridge)
-		dsi->panel_bridge->funcs->pre_enable(dsi->panel_bridge);
 }
 
 static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
@@ -793,12 +788,6 @@ static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
 	 * ordering on the panels I've tested it with, so I guess this
 	 * will do for now, until that IP is better understood.
 	 */
-	if (dsi->panel)
-		drm_panel_enable(dsi->panel);
-
-	if (dsi->panel_bridge)
-		dsi->panel_bridge->funcs->enable(dsi->panel_bridge);
-
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
 	udelay(1000);
@@ -812,14 +801,6 @@ static void sun6i_dsi_bridge_disable(struct drm_bridge *bridge)
 
 	DRM_DEBUG_DRIVER("Disabling DSI output\n");
 
-	if (dsi->panel) {
-		drm_panel_disable(dsi->panel);
-		drm_panel_unprepare(dsi->panel);
-	} else if (dsi->panel_bridge) {
-		dsi->panel_bridge->funcs->disable(dsi->panel_bridge);
-		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
-	}
-
 	phy_power_off(dsi->dphy);
 	phy_exit(dsi->dphy);
 
@@ -828,63 +809,13 @@ static void sun6i_dsi_bridge_disable(struct drm_bridge *bridge)
 	regulator_disable(dsi->regulator);
 }
 
-static int sun6i_dsi_get_modes(struct drm_connector *connector)
-{
-	struct sun6i_dsi *dsi = connector_to_sun6i_dsi(connector);
-
-	return drm_panel_get_modes(dsi->panel, connector);
-}
-
-static const struct drm_connector_helper_funcs sun6i_dsi_connector_helper_funcs = {
-	.get_modes	= sun6i_dsi_get_modes,
-};
-
-static enum drm_connector_status
-sun6i_dsi_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct sun6i_dsi *dsi = connector_to_sun6i_dsi(connector);
-
-	return dsi->panel ? connector_status_connected :
-			    connector_status_disconnected;
-}
-
-static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
-	.detect			= sun6i_dsi_connector_detect,
-	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= drm_connector_cleanup,
-	.reset			= drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
-};
-
 static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
-	int ret;
-
-	if (dsi->panel_bridge)
-		return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, NULL, 0);
-
-	if (dsi->panel) {
-		drm_connector_helper_add(&dsi->connector,
-					 &sun6i_dsi_connector_helper_funcs);
-		ret = drm_connector_init(bridge->dev, &dsi->connector,
-					 &sun6i_dsi_connector_funcs,
-					 DRM_MODE_CONNECTOR_DSI);
-		if (ret) {
-			dev_err(dsi->dev, "Couldn't initialise the DSI connector\n");
-			goto err_cleanup_connector;
-		}
-
-		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
-	}
-
-	return 0;
 
-err_cleanup_connector:
-	drm_encoder_cleanup(&dsi->encoder);
-	return ret;
+	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge,
+				 &dsi->bridge, flags);
 }
 
 static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
@@ -1010,17 +941,24 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
+	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
-					  &dsi->panel, &dsi->panel_bridge);
+					  &panel, &dsi->panel_bridge);
 	if (ret)
 		return ret;
 
+	if (panel) {
+		dsi->panel_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
+		if (IS_ERR(dsi->panel_bridge))
+			return PTR_ERR(dsi->panel_bridge);
+	}
+
 	dsi->device = device;
 
-	dev_info(host->dev, "Attached %s %s\n",
-		 device->name, dsi->panel ? "panel" : "bridge");
+	dev_info(host->dev,
+		 "Attached %s %s\n", device->name, panel ? "panel" : "bridge");
 
 	return 0;
 }
@@ -1030,7 +968,6 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
-	dsi->panel = NULL;
 	dsi->panel_bridge = NULL;
 	dsi->device = NULL;
 
@@ -1098,6 +1035,7 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 {
 	struct drm_device *drm = data;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_connector *connector;
 	int ret;
 
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
@@ -1108,15 +1046,23 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	}
 	dsi->encoder.possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
-	if (ret) {
-		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
-		goto err_cleanup_connector;
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		goto err_cleanup_encoder;
+
+	connector = drm_bridge_connector_init(drm, &dsi->encoder);
+	if (IS_ERR(connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		ret = PTR_ERR(connector);
+		goto err_cleanup_encoder;
 	}
 
+	drm_connector_attach_encoder(connector, &dsi->encoder);
+
 	return 0;
 
-err_cleanup_connector:
+err_cleanup_encoder:
 	drm_encoder_cleanup(&dsi->encoder);
 	return ret;
 }
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 5e70666089ad..91ea95326ed4 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -17,7 +17,6 @@
 
 struct sun6i_dsi {
 	struct drm_bridge	bridge;
-	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 	struct mipi_dsi_host	host;
 
@@ -30,7 +29,6 @@ struct sun6i_dsi {
 
 	struct device		*dev;
 	struct mipi_dsi_device	*device;
-	struct drm_panel	*panel;
 	struct drm_bridge	*panel_bridge;
 };
 
@@ -44,11 +42,6 @@ static inline struct sun6i_dsi *bridge_to_sun6i_dsi(struct drm_bridge *bridge)
 	return container_of(bridge, struct sun6i_dsi, bridge);
 }
 
-static inline struct sun6i_dsi *connector_to_sun6i_dsi(struct drm_connector *connector)
-{
-	return container_of(connector, struct sun6i_dsi, connector);
-};
-
 static inline struct sun6i_dsi *encoder_to_sun6i_dsi(const struct drm_encoder *encoder)
 {
 	return container_of(encoder, struct sun6i_dsi, encoder);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
