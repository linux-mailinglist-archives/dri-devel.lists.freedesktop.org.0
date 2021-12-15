Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1F475604
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5510E465;
	Wed, 15 Dec 2021 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1CC10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:15:51 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id o4so20246569pfp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tASggvKbD+8kubIbPYJcEas91o6vPtNnVuuBr/gmYOg=;
 b=h2E5KmgPdVxeRbnvgAx0dgoENyx6uSab3HRnnWedF10Vud4T3Jyv1+2kP86f7NSi1R
 tlfIzNo2IyvitZArK9i7IX+Kn3as2rMF5qMN03Z32I/+eGbDswI5UxLryOdCnY4vnhaM
 +T6cmcrOGNo9CKkgPVWqme4MY8Vruy4aPtBQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tASggvKbD+8kubIbPYJcEas91o6vPtNnVuuBr/gmYOg=;
 b=TvTPsXf2yAG7PgSEc2A9eqtWSSsVz1KIOvb1ZGeAe9Q21h0Vg0UqCvqCYSX6Saxonl
 cMdVWjt4anbzQ2r7Jvz3SNpg2Q1IoaHnTtE6I46A4u/uWl29/8fAFjHPgwsvOXOyT79P
 7qmyXmjCCa3aTbnkE0bDEtvDMEOSANAW7DE0sPQ4PNUoeTR8x0tbHQscguUauUkJGUEg
 T0VajWSpHZlFesXkd2awmqODG1YLXHFiRyRAi3G+QUZp+Hiu84w0PcAfS6Tx1/qTIgq3
 d44/Id85bqyVQnNVcgJ1mZvH9osSFustFn1i1Y8So4jPb2J4kc/fl9lGKWXrIcs4AF51
 JT8A==
X-Gm-Message-State: AOAM531chB37KPCGDwIpm3hcDZTdLtqV2tyeiJDuKXO+DK2c9++imD7M
 Yxw26NHjJrHk3htGjogAlg/ADQ==
X-Google-Smtp-Source: ABdhPJx4PaSquSFCMPx941GzhNWZlcUWI4mFKXJjXoEcp/AkVx8yYusNwcsNgRqD7DgZnFpa3gDf6Q==
X-Received: by 2002:a63:6b81:: with SMTP id g123mr7548179pgc.140.1639563350772; 
 Wed, 15 Dec 2021 02:15:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a7:8328:d9c4:5bc9])
 by smtp.gmail.com with ESMTPSA id
 v11sm2408149pfu.184.2021.12.15.02.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:15:50 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 2/6] drm: exynos: dsi: Use drm panel_bridge API
Date: Wed, 15 Dec 2021 15:45:30 +0530
Message-Id: <20211215101534.45003-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215101534.45003-1-jagan@amarulasolutions.com>
References: <20211215101534.45003-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the manual panel handling code by a drm panel_bridge via
devm_drm_of_get_bridge().

Adding panel_bridge handling,

- Drops drm_connector and related operations as drm_bridge_attach
  creates connector during attachment.

- Drops panel pointer and iterate the bridge, so-that it can operate
  the normal bridge and panel_bridge in constitutive callbacks.

This simplifies the driver and allows all components in the display
pipeline to be treated as bridges.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- drop unneeded headers
Changes for v3:
- fix port number
- add print for attached device
Changes for v2:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 167 ++++--------------------
 1 file changed, 28 insertions(+), 139 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 8d137857818c..14e16f2d594b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -25,9 +25,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -221,6 +219,11 @@ enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_RX,
 };
 
+enum {
+	DSI_PORT_IN,
+	DSI_PORT_OUT
+};
+
 struct exynos_dsi_transfer {
 	struct list_head list;
 	struct completion completed;
@@ -254,8 +257,6 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct drm_connector connector;
-	struct drm_panel *panel;
 	struct list_head bridge_chain;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
@@ -285,7 +286,6 @@ struct exynos_dsi {
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
-#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
 static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
 {
@@ -1391,42 +1391,21 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
-	if (dsi->panel) {
-		ret = drm_panel_prepare(dsi->panel);
-		if (ret < 0)
-			goto err_put_sync;
-	} else {
-		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
-					    chain_node) {
-			if (iter->funcs->pre_enable)
-				iter->funcs->pre_enable(iter);
-		}
+	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->pre_enable)
+			iter->funcs->pre_enable(iter);
 	}
 
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
-	if (dsi->panel) {
-		ret = drm_panel_enable(dsi->panel);
-		if (ret < 0)
-			goto err_display_disable;
-	} else {
-		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-			if (iter->funcs->enable)
-				iter->funcs->enable(iter);
-		}
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->enable)
+			iter->funcs->enable(iter);
 	}
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 	return;
-
-err_display_disable:
-	exynos_dsi_set_display_enable(dsi, false);
-	drm_panel_unprepare(dsi->panel);
-
-err_put_sync:
-	dsi->state &= ~DSIM_STATE_ENABLED;
-	pm_runtime_put(dsi->dev);
 }
 
 static void exynos_dsi_disable(struct drm_encoder *encoder)
@@ -1439,15 +1418,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
-	drm_panel_disable(dsi->panel);
-
 	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->disable)
 			iter->funcs->disable(iter);
 	}
 
 	exynos_dsi_set_display_enable(dsi, false);
-	drm_panel_unprepare(dsi->panel);
 
 	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->post_disable)
@@ -1458,70 +1434,6 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 	pm_runtime_put_sync(dsi->dev);
 }
 
-static enum drm_connector_status
-exynos_dsi_detect(struct drm_connector *connector, bool force)
-{
-	return connector->status;
-}
-
-static void exynos_dsi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-	connector->dev = NULL;
-}
-
-static const struct drm_connector_funcs exynos_dsi_connector_funcs = {
-	.detect = exynos_dsi_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = exynos_dsi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int exynos_dsi_get_modes(struct drm_connector *connector)
-{
-	struct exynos_dsi *dsi = connector_to_dsi(connector);
-
-	if (dsi->panel)
-		return drm_panel_get_modes(dsi->panel, connector);
-
-	return 0;
-}
-
-static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
-	.get_modes = exynos_dsi_get_modes,
-};
-
-static int exynos_dsi_create_connector(struct drm_encoder *encoder)
-{
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct drm_connector *connector = &dsi->connector;
-	struct drm_device *drm = encoder->dev;
-	int ret;
-
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	ret = drm_connector_init(drm, connector, &exynos_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
-	if (ret) {
-		DRM_DEV_ERROR(dsi->dev,
-			      "Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	connector->status = connector_status_disconnected;
-	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
-	drm_connector_attach_encoder(connector, encoder);
-	if (!drm->registered)
-		return 0;
-
-	connector->funcs->reset(connector);
-	drm_connector_register(connector);
-	return 0;
-}
-
 static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
 	.enable = exynos_dsi_enable,
 	.disable = exynos_dsi_disable,
@@ -1533,33 +1445,23 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
-	struct drm_bridge *out_bridge;
-
-	out_bridge  = of_drm_find_bridge(device->dev.of_node);
-	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL, 0);
-		dsi->out_bridge = out_bridge;
-		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
-	} else {
-		int ret = exynos_dsi_create_connector(encoder);
-
-		if (ret) {
-			DRM_DEV_ERROR(dsi->dev,
-				      "failed to create connector ret = %d\n",
-				      ret);
-			drm_encoder_cleanup(encoder);
-			return ret;
-		}
+	int ret;
 
-		dsi->panel = of_drm_find_panel(device->dev.of_node);
-		if (IS_ERR(dsi->panel))
-			dsi->panel = NULL;
-		else
-			dsi->connector.status = connector_status_connected;
+	dsi->out_bridge = devm_drm_of_get_bridge(dev, dev->of_node, DSI_PORT_OUT, 0);
+	if (IS_ERR(dsi->out_bridge)) {
+		ret = PTR_ERR(dsi->out_bridge);
+		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
+		return ret;
 	}
 
+	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
+
+	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
+	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
+
 	/*
 	 * This is a temporary solution and should be made by more generic way.
 	 *
@@ -1567,7 +1469,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	 * TE interrupt handler.
 	 */
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
-		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
+		ret = exynos_dsi_register_te_irq(dsi, &device->dev);
 		if (ret)
 			return ret;
 	}
@@ -1594,18 +1496,10 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->panel) {
-		mutex_lock(&drm->mode_config.mutex);
-		exynos_dsi_disable(&dsi->encoder);
-		dsi->panel = NULL;
-		dsi->connector.status = connector_status_disconnected;
-		mutex_unlock(&drm->mode_config.mutex);
-	} else {
-		if (dsi->out_bridge->funcs->detach)
-			dsi->out_bridge->funcs->detach(dsi->out_bridge);
-		dsi->out_bridge = NULL;
-		INIT_LIST_HEAD(&dsi->bridge_chain);
-	}
+	if (dsi->out_bridge->funcs->detach)
+		dsi->out_bridge->funcs->detach(dsi->out_bridge);
+	dsi->out_bridge = NULL;
+	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
@@ -1661,11 +1555,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
 	return ret;
 }
 
-enum {
-	DSI_PORT_IN,
-	DSI_PORT_OUT
-};
-
 static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 {
 	struct device *dev = dsi->dev;
-- 
2.25.1

