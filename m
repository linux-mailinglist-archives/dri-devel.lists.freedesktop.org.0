Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74D458973
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBD989D79;
	Mon, 22 Nov 2021 06:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E30E89D79
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:53:34 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id z6so12057306plk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 22:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bn7OMxc+0lRaKOfEDxXP5eAln8VQKH/m4PmaTGfkaqk=;
 b=h7ZUfJH9QcZu6YBVtU08V7SoBc3BG0NG/AuSC+Oz9k54sbNgD7IhUtPPH0DjflByij
 XgdDmmIUMZTOU9DZc/Q8ufJsdl5Er9UHjDFuX5WTvlnA6o1H10UtdwGx8JPlBBGKZjPi
 Koe/w9IzZE9iASScariRw4wagsbx52TtTYYzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bn7OMxc+0lRaKOfEDxXP5eAln8VQKH/m4PmaTGfkaqk=;
 b=5EvrF0GbmuXIAmKKudfRC/mGqthXFEvz/W36+3h+Tk+fkL4dzmUNj0RQAPvFLTzaO0
 4sEQ5Prez7I8Ezj6M132fiI+66Ue5/AuvwzvGOMdCko38Tsq+q00Wd5mZSVyGp5GgJ2H
 i5OWG3w9cwn6/LhLIkkQknqMZEg7dAylkh4Sq1rm1Qch2NDmfpYp3iew86QGEAGS1A7p
 ElBiwGYmxf2x6C+zFqZfn93CSOV7J9bLjcLyVpEw5Y7u998HL6sks5/tOAaU5bFdqzM4
 Qvb1S/NifzLhRqK5keI9/wzv3OYSXHlOe0bF1Z5+/0Pg/+4owqWuG70VBKRj+/RuzPdx
 4K+A==
X-Gm-Message-State: AOAM530BxXfMxmbSj25TbuJk4x2NBbeiBOpNTWyg7geywbxIxwSuqt7G
 Uf1LLbq7oYMYmlorzlqmugxgcQ==
X-Google-Smtp-Source: ABdhPJwlxAdQFaIayQb58d7c2hV7+X3Ztxqsq+wNxCyJhqGAcQhAMz6nq2YDzb3X7sL6+1/v6trP8A==
X-Received: by 2002:a17:90b:350c:: with SMTP id
 ls12mr28224649pjb.197.1637564013943; 
 Sun, 21 Nov 2021 22:53:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id a8sm7935904pfv.176.2021.11.21.22.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 22:53:33 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Date: Mon, 22 Nov 2021 12:22:19 +0530
Message-Id: <20211122065223.88059-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122065223.88059-1-jagan@amarulasolutions.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some display panels would come up with a non-DSI output, those
can have an option to connect the DSI host by means of interface
bridge converter.

This DSI to non-DSI interface bridge converter would requires
DSI Host to handle drm bridge functionalities in order to DSI
Host to Interface bridge.

This patch convert the existing to a drm bridge driver with a
built-in encoder support for compatibility with existing
component drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- add atomic APIs
- find host and device variant DSI devices.
Changes for v4, v3:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
 2 files changed, 96 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 43d9c9e5198d..a6a272b55f77 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -21,6 +21,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
 	return 0;
 }
 
-static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
+static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
+	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
 	struct mipi_dsi_device *device = dsi->device;
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
@@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (dsi->panel)
 		drm_panel_prepare(dsi->panel);
 
+	if (dsi->next_bridge)
+		dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
+
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
 	 *
@@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (dsi->panel)
 		drm_panel_enable(dsi->panel);
 
+	if (dsi->next_bridge)
+		dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
+
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
 	udelay(1000);
@@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	sun6i_dsi_start(dsi, DSI_START_HSD);
 }
 
-static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
+static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *old_bridge_state)
 {
-	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 
 	DRM_DEBUG_DRIVER("Disabling DSI output\n");
 
 	if (dsi->panel) {
 		drm_panel_disable(dsi->panel);
 		drm_panel_unprepare(dsi->panel);
+	} else if (dsi->next_bridge) {
+		dsi->next_bridge->funcs->atomic_disable(dsi->next_bridge, old_bridge_state);
+		dsi->next_bridge->funcs->atomic_post_disable(dsi->next_bridge, old_bridge_state);
 	}
 
 	phy_power_off(dsi->dphy);
@@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
-	.disable	= sun6i_dsi_encoder_disable,
-	.enable		= sun6i_dsi_encoder_enable,
+static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
+				   enum drm_bridge_attach_flags flags)
+{
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
+
+	if (dsi->next_bridge)
+		return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
+					 NULL, 0);
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_enable		= sun6i_dsi_bridge_atomic_enable,
+	.atomic_disable		= sun6i_dsi_bridge_atomic_disable,
+	.attach			= sun6i_dsi_bridge_attach,
 };
 
 static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
@@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
-	drm_encoder_helper_add(&dsi->encoder,
-			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
 	if (ret) {
@@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	}
 	dsi->encoder.possible_crtcs = BIT(0);
 
-	drm_connector_helper_add(&dsi->connector,
-				 &sun6i_dsi_connector_helper_funcs);
-	ret = drm_connector_init(drm, &dsi->connector,
-				 &sun6i_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
 	if (ret) {
-		dev_err(dsi->dev,
-			"Couldn't initialise the DSI connector\n");
+		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
 		goto err_cleanup_connector;
 	}
 
-	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
+	if (dsi->panel) {
+		drm_connector_helper_add(&dsi->connector,
+					 &sun6i_dsi_connector_helper_funcs);
+		ret = drm_connector_init(drm, &dsi->connector,
+					 &sun6i_dsi_connector_funcs,
+					 DRM_MODE_CONNECTOR_DSI);
+		if (ret) {
+			dev_err(dsi->dev,
+				"Couldn't initialise the DSI connector\n");
+			goto err_cleanup_connector;
+		}
+
+		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
+	}
 
 	return 0;
 
@@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
-	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
+	struct device_node *remote = device->dev.of_node;
 	int ret;
 
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+	if (!of_device_is_available(remote)) {
+		/**
+		 * I2C interfaced DSI bridges will register DSI host on the
+		 * bridge drivers instead of conventional device.
+		 *
+		 * Those are probed via host of_node instead of device of_node.
+		 */
+		remote = of_graph_get_remote_node(host->dev->of_node, 0, 0);
+		if (!remote)
+			return -ENODEV;
+	}
+
+	dsi->panel = of_drm_find_panel(remote);
+	if (IS_ERR(dsi->panel)) {
+		dsi->panel = NULL;
+
+		dsi->next_bridge = of_drm_find_bridge(remote);
+		if (IS_ERR(dsi->next_bridge)) {
+			dev_err(dsi->dev, "failed to find bridge\n");
+			return PTR_ERR(dsi->next_bridge);
+		}
+	} else {
+		dsi->next_bridge = NULL;
+	}
+
+	of_node_put(remote);
 
-	dsi->panel = panel;
 	dsi->device = device;
 
-	dev_info(host->dev, "Attached device %s\n", device->name);
+	dev_info(host->dev, "Attached %s %s\n",
+		 device->name, dsi->panel ? "panel" : "bridge");
+
+	dsi->bridge.funcs = &sun6i_dsi_bridge_funcs;
+	dsi->bridge.of_node = dsi->dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&dsi->bridge);
 
 	ret = component_add(dsi->dev, &sun6i_dsi_ops);
 	if (ret) {
@@ -1040,9 +1104,11 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
 	dsi->panel = NULL;
+	dsi->next_bridge = NULL;
 	dsi->device = NULL;
 
 	component_del(dsi->dev, &sun6i_dsi_ops);
+	drm_bridge_remove(&dsi->bridge);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 61e88ea6044d..d269304691c9 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -16,6 +16,7 @@
 #define SUN6I_DSI_TCON_DIV	4
 
 struct sun6i_dsi {
+	struct drm_bridge	bridge;
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 	struct mipi_dsi_host	host;
@@ -30,6 +31,7 @@ struct sun6i_dsi {
 	struct device		*dev;
 	struct mipi_dsi_device	*device;
 	struct drm_panel	*panel;
+	struct drm_bridge	*next_bridge;
 };
 
 static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
@@ -37,6 +39,11 @@ static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
 	return container_of(host, struct sun6i_dsi, host);
 };
 
+static inline struct sun6i_dsi *bridge_to_sun6i_dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sun6i_dsi, bridge);
+}
+
 static inline struct sun6i_dsi *connector_to_sun6i_dsi(struct drm_connector *connector)
 {
 	return container_of(connector, struct sun6i_dsi, connector);
-- 
2.25.1

