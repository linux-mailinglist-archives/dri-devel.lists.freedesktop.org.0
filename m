Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991C46FFA9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6B10E326;
	Fri, 10 Dec 2021 11:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882010E354
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:40 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id z6so6061911plk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1kZgbgJmrlxw0BX7jCIeMycv2sDZ8RydaNArchhpYlI=;
 b=o9ENum0+0nYFVvazyNpkRTvWJqXSudt2olQi+Jm61008bSiUt71CWuBzmWmmn/VRL8
 uDNG9cQrQjrHHNop1TxGJAcCQngkYZ63z9ORYyyu9jMByXZbnAgVBtZFod2+A0Ug5E/7
 L6e+UoKQ5pe+zEjSptOwevvgyfBEOO8PUSbSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1kZgbgJmrlxw0BX7jCIeMycv2sDZ8RydaNArchhpYlI=;
 b=nKUu9RbDiMe+ApPm8wRoYknIXSBu+qk1sC9oqEJwo+r6iZnipSs+dyQrM2wUsJVBdP
 uWtP4gZG830gqc+kBJmPzjdxXBhvl47zh1fw9XC0s97PNAacWb5a89YVlDQ8I4XOBJck
 dhXHbaCFXC7Mri6qoijjL8haE7jGPmIzulyunyBLIradK5SNqUegfY6yawrp4a1vy0vV
 yavjtrwOcvAKLeSI2oXFwhrJVpD7f3CAIt8MUkZ9Dm3DC3A7sRGUFfOZddmuM9APMhyM
 PClSOxDoiwHURp0Va47odo3WMkK+qcF3itD5xh5oaD0zmyy6MnKwbZ6zElU9+oNz/s3g
 5xZw==
X-Gm-Message-State: AOAM5324ewNFvZy00WRtwa8aK56IzqQ4ztDnxhy6z3VSmUM0Wtqdzw4X
 UyM8eH1H2TWu14phb6a5Zqk1OA==
X-Google-Smtp-Source: ABdhPJw0GPmVtgtiW+5CYOjNVmVg0QY5ubqdArqlwjM0e7MzzI8YBXCb60Yd72H2HKLMGyRk6Be8ng==
X-Received: by 2002:a17:90a:ab17:: with SMTP id
 m23mr22947589pjq.194.1639135060298; 
 Fri, 10 Dec 2021 03:17:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:39 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v6 3/6] drm: sun4i: dsi: Add bridge support
Date: Fri, 10 Dec 2021 16:47:08 +0530
Message-Id: <20211210111711.2072660-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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

This DSI to non-DSI interface bridge converter would require
DSI Host to handle drm bridge functionalities in order to
communicate interface bridge.

This patch adds support for bridge functionalities in Allwinner
DSI controller.

Supporting down-stream bridge makes few changes in the driver.

- It drops drm_connector and related operations as drm_bridge_attach
  creates connector during attachment.

- It drop panel pointer and iterate the bridge, so-that it can operate
  the normal bridge and panel_bridge in constitutive callbacks.

- It uses devm_drm_of_get_bridge for panel or bridge lookup. It uses
  port 0 and endpoint 0 to support I2C-based bridges eventhough the
  usual Allwinner DSI OF graph doesn't require this for panel and
  non-I2C based downstream bridges.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- support donwstream bridge
- drop bridge conversion
- devm_drm_of_get_bridge() require child lookup
https://patchwork.kernel.org/project/dri-devel/cover/20211207054747.461029-1-jagan@amarulasolutions.com/
Changes for v5:
- add atomic APIs
- find host and device variant DSI devices.
Changes for v4, v3:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 83 ++++++++++----------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  9 +--
 2 files changed, 33 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 9cf91dcac3f2..f1d612bf1a0b 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -21,6 +21,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -720,6 +721,7 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	struct mipi_dsi_device *device = dsi->device;
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+	struct drm_bridge *iter;
 	u16 delay;
 	int err;
 
@@ -769,8 +771,10 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	phy_configure(dsi->dphy, &opts);
 	phy_power_on(dsi->dphy);
 
-	if (dsi->panel)
-		drm_panel_prepare(dsi->panel);
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->pre_enable)
+			iter->funcs->pre_enable(iter);
+	}
 
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
@@ -784,8 +788,10 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	 * ordering on the panels I've tested it with, so I guess this
 	 * will do for now, until that IP is better understood.
 	 */
-	if (dsi->panel)
-		drm_panel_enable(dsi->panel);
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->enable)
+			iter->funcs->enable(iter);
+	}
 
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
@@ -797,12 +803,16 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
 {
 	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct drm_bridge *iter;
 
 	DRM_DEBUG_DRIVER("Disabling DSI output\n");
 
-	if (dsi->panel) {
-		drm_panel_disable(dsi->panel);
-		drm_panel_unprepare(dsi->panel);
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->disable)
+			iter->funcs->disable(iter);
+
+		if (iter->funcs->post_disable)
+			iter->funcs->post_disable(iter);
 	}
 
 	phy_power_off(dsi->dphy);
@@ -813,35 +823,6 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
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
 static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
 	.disable	= sun6i_dsi_encoder_disable,
 	.enable		= sun6i_dsi_encoder_enable,
@@ -976,22 +957,17 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	}
 	dsi->encoder.possible_crtcs = BIT(0);
 
-	drm_connector_helper_add(&dsi->connector,
-				 &sun6i_dsi_connector_helper_funcs);
-	ret = drm_connector_init(drm, &dsi->connector,
-				 &sun6i_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
+	ret = drm_bridge_attach(&dsi->encoder, dsi->next_bridge, NULL, 0);
 	if (ret) {
-		dev_err(dsi->dev,
-			"Couldn't initialise the DSI connector\n");
-		goto err_cleanup_connector;
+		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
+		goto err_cleanup_encoder;
 	}
 
-	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
+	list_splice_init(&dsi->encoder.bridge_chain, &dsi->bridge_chain);
 
 	return 0;
 
-err_cleanup_connector:
+err_cleanup_encoder:
 	drm_encoder_cleanup(&dsi->encoder);
 	return ret;
 }
@@ -1013,17 +989,18 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
-	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
 	struct device *dev = dsi->dev;
 	int ret;
 
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->next_bridge)) {
+		dev_err(dsi->dev, "Couldn't find the bridge\n");
+		return PTR_ERR(dsi->next_bridge);
+	}
 
-	dsi->panel = panel;
 	dsi->device = device;
 
-	dev_info(host->dev, "Attached device %s\n", device->name);
+	dev_info(host->dev, "Attached %s\n", device->name);
 
 	ret = component_add(dev, &sun6i_dsi_ops);
 	if (ret) {
@@ -1040,7 +1017,7 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
-	dsi->panel = NULL;
+	dsi->next_bridge = NULL;
 	dsi->device = NULL;
 
 	component_del(dsi->dev, &sun6i_dsi_ops);
@@ -1118,6 +1095,8 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &sun6i_dsi_host_ops;
 	dsi->host.dev = dev;
 
+	INIT_LIST_HEAD(&dsi->bridge_chain);
+
 	if (of_device_is_compatible(dev->of_node,
 				    "allwinner,sun6i-a31-mipi-dsi"))
 		bus_clk_name = "bus";
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 61e88ea6044d..96a219b9c275 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -16,7 +16,6 @@
 #define SUN6I_DSI_TCON_DIV	4
 
 struct sun6i_dsi {
-	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 	struct mipi_dsi_host	host;
 
@@ -29,7 +28,8 @@ struct sun6i_dsi {
 
 	struct device		*dev;
 	struct mipi_dsi_device	*device;
-	struct drm_panel	*panel;
+	struct drm_bridge	*next_bridge;
+	struct list_head	bridge_chain;
 };
 
 static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
@@ -37,11 +37,6 @@ static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
 	return container_of(host, struct sun6i_dsi, host);
 };
 
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

