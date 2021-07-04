Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAFE3BAC3B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2234289D30;
	Sun,  4 Jul 2021 09:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B974789D30
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:28 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id a14so8224620pls.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYvjehx8GEd3VqeKDnJWcND/IGzW5rqaRSV1TBb6rec=;
 b=FpsLt0e/gEh/TsvI+PQqq8HHbShAeGPxizZN1+ZrblR37mi0TM659pulHef70Ns14S
 8X6vyrvesg7AHKh9ZkUfZQLV+XDG+dM/yFMJEMsjOLyxGmNfyi0qiWcJgiLXNfkY89It
 8TjMAPrpk1Rhy9wwxEHf5x5z/iXdENX7zmQXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYvjehx8GEd3VqeKDnJWcND/IGzW5rqaRSV1TBb6rec=;
 b=IcoSs/ZM8RT/y5hzuNuMGgJsU8Ef3prCiKkZcaAa+oeEaKJL59dH9Fcmc+AlrTxFAK
 Y/qeEaxBefBXNXI8oAqOXdny5BQWKy8L3KagdkBFSfjyzk/Ze21/NK2Q5BjZ2oUqzpl7
 UcEUwGKumtbc84jQAn6BOrg2bDxiNCCF/jYSuxwjSJ5VFmdZhMWdyYrtrN1+RrmYxBSo
 jI66S8kLuSlFXsPKKyOSRHjhUnRQO3FC0lWZjhn7HYli8rg8jz9KkmXFfQvTrdtGdc5k
 OOqmMHOCj4NNZTTtyMBqTPMxLyVtVnmSl49qhyLlbDWn13Bk32a1vKigzKf5bo1zPNIW
 8d6w==
X-Gm-Message-State: AOAM531FyV9MVdHB5YJQlPmzeUYvIrJxI09ZLD7DBiHOiP2i/TUP8qTo
 16yNdIJSl/BgN3CeBryzrj96RA==
X-Google-Smtp-Source: ABdhPJyNCzxsA9x9Vp0nNEO5H/xrDOauiajqjc3ZOIcheU67qLC4rDoFfVlAWPvVqLulg93qjiTGfg==
X-Received: by 2002:a17:90a:7843:: with SMTP id
 y3mr8584990pjl.190.1625389468533; 
 Sun, 04 Jul 2021 02:04:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:28 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 03/17] drm/exynos: dsi: Use the drm_panel_bridge API
Date: Sun,  4 Jul 2021 14:32:16 +0530
Message-Id: <20210704090230.26489-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_panel_bridge to replace manual panel and
bridge_chain handling code.

This makes the driver simpler to allow all components
in the display pipeline to be treated as bridges by
cleaning the way to generic connector handling.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 167 ++++--------------------
 1 file changed, 23 insertions(+), 144 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d7d60aee465b..24f0b082ac6d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,9 +254,6 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct drm_connector connector;
-	struct drm_panel *panel;
-	struct list_head bridge_chain;
 	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct drm_device *drm;
@@ -287,7 +284,6 @@ struct exynos_dsi {
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
-#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
 static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
@@ -1379,7 +1375,6 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-	struct drm_bridge *iter;
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1393,134 +1388,51 @@ static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
 
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
-	}
-
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
-	}
-
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
 
 static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-	struct drm_bridge *iter;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
-	drm_panel_disable(dsi->panel);
-
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-	}
-
 	exynos_dsi_set_display_enable(dsi, false);
-	drm_panel_unprepare(dsi->panel);
-
-	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->post_disable)
-			iter->funcs->post_disable(iter);
-	}
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
 
-static enum drm_connector_status
-exynos_dsi_detect(struct drm_connector *connector, bool force)
-{
-	return connector->status;
-}
-
-static void exynos_dsi_connector_destroy(struct drm_connector *connector)
+static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
+				      struct device_node *node)
 {
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
+	struct drm_bridge *panel_bridge;
+	struct drm_panel *panel;
 
-static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
-	.get_modes = exynos_dsi_get_modes,
-};
+	panel_bridge = of_drm_find_bridge(node);
+	if (!panel_bridge) {
+		panel = of_drm_find_panel(node);
+		if (!IS_ERR(panel)) {
+			panel_bridge = drm_panel_bridge_add(panel);
+			if (IS_ERR(panel_bridge))
+				return PTR_ERR(panel_bridge);
+		}
+	}
 
-static int exynos_dsi_create_connector(struct exynos_dsi *dsi,
-				       struct drm_device *drm)
-{
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_connector *connector = &dsi->connector;
-	int ret;
+	of_node_put(node);
 
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
+	dsi->out_bridge = panel_bridge;
 
-	ret = drm_connector_init(drm, connector, &exynos_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
-	if (ret) {
-		DRM_DEV_ERROR(dsi->dev,
-			      "Failed to initialize connector with drm\n");
-		return ret;
-	}
+	if (!dsi->out_bridge)
+		return -EPROBE_DEFER;
 
-	connector->status = connector_status_disconnected;
-	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
-	drm_connector_attach_encoder(connector, encoder);
-	if (!drm->registered)
-		return 0;
-
-	connector->funcs->reset(connector);
-	drm_connector_register(connector);
 	return 0;
 }
 
@@ -1531,7 +1443,8 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 
 	dsi->drm = bridge->dev;
 
-	return 0;
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
@@ -1546,32 +1459,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = dsi->drm;
-	struct drm_bridge *out_bridge;
-
-	out_bridge  = of_drm_find_bridge(device->dev.of_node);
-	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL, 0);
-		dsi->out_bridge = out_bridge;
-		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
-	} else {
-		int ret = exynos_dsi_create_connector(dsi, drm);
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
-	}
+	ret = exynos_dsi_panel_or_bridge(dsi, device->dev.of_node);
+	if (ret)
+		return ret;
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1607,19 +1500,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->drm;
 
-	if (dsi->panel) {
-		mutex_lock(&drm->mode_config.mutex);
-		exynos_dsi_bridge_disable(&dsi->bridge);
-		dsi->panel = NULL;
-		dsi->connector.status = connector_status_disconnected;
-		mutex_unlock(&drm->mode_config.mutex);
-	} else {
-		if (dsi->out_bridge->funcs->detach)
-			dsi->out_bridge->funcs->detach(dsi->out_bridge);
-		dsi->out_bridge = NULL;
-		INIT_LIST_HEAD(&dsi->bridge_chain);
-	}
-
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
@@ -1770,7 +1650,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	dsi->dsi_host.ops = &exynos_dsi_ops;
 	dsi->dsi_host.dev = dev;
-- 
2.25.1

