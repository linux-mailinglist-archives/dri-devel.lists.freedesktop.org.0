Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE449041D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27410E401;
	Mon, 17 Jan 2022 08:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDA310E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:42 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t18so20502992plg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zfiuuS6N+V6QtdVoRyeHCOQ8xFFFvWB1WtlwywfESc=;
 b=OCWX3MH7FX+9xRUxIiSPJ44Rd+dZYn6n3AmmqSirxV5TcKLcKdYJeQLTzKrLob5rvN
 NwtaIQbTanY78PeNURU4NBRR9u7VXLIevbfI6/xEr0Byr7HNgx6uVTimjimBVkme+x2t
 gELT/rJdBy8BtAbykrL5qEj090AeWYs98eksQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zfiuuS6N+V6QtdVoRyeHCOQ8xFFFvWB1WtlwywfESc=;
 b=eUxjGe/A5XZC5+ixF/wG67jnWZHTkwcTXCEBNgxds1ZEHYggxUknbTKneoBAb5jm0V
 fbHDulp1F+NbVT4++ZUHO+2gdfNRqDQKNIXKsP2muidcwPalS2BT/bLTZHKHW4D4OAhK
 dKPDVfVEm6DjU02mQLCFo3WYEPIgkdwB+kIt5Kp223E7GcH1ELR9XfcseLk4E48IwSM4
 FsFB+3aW6Yw8VpkhvORAdcEC78UwkWJwsaCBiAhK+ChtuiIacPbeMONDsiEmj3+zm4A9
 ZRc8L8PmYbrVGqEWn7E9ekBy4Oyr7bqP+eIT/yvhtWc004YpHCQWIHtGw2VBHiYdrMOM
 1KCQ==
X-Gm-Message-State: AOAM533zfMARUCqPWPdgdXVm/p3TJaflGponKp2PTorQxncp5FcsZmJ8
 3ckvQJZsUnyEGZN7qfedXqWRmQ==
X-Google-Smtp-Source: ABdhPJzFEY+g/yXjbXkCFEFW3B2LkiDhFdzGvk0vVY1rWF0RCVsR/pUfFAn9CbUVChKX5QFky4qrYg==
X-Received: by 2002:a17:90b:33d0:: with SMTP id
 lk16mr22492164pjb.45.1642408962469; 
 Mon, 17 Jan 2022 00:42:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:955a:760d:bbf3:5d4b])
 by smtp.gmail.com with ESMTPSA id z3sm11763423pjq.32.2022.01.17.00.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:42:42 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 2/5] drm: exynos: dsi: Use drm panel_bridge API
Date: Mon, 17 Jan 2022 14:12:22 +0530
Message-Id: <20220117084225.125868-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117084225.125868-1-jagan@amarulasolutions.com>
References: <20220117084225.125868-1-jagan@amarulasolutions.com>
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
Changes for v5:
- none
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
index bce5331ed1e6..ebb19194bb86 100644
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
@@ -286,7 +287,6 @@ struct exynos_dsi {
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
-#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
 static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
 {
@@ -1392,42 +1392,21 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 
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
@@ -1440,15 +1419,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 
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
@@ -1468,70 +1444,6 @@ static void exynos_dsi_mode_set(struct drm_encoder *encoder,
 	drm_mode_copy(&dsi->mode, adjusted_mode);
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
@@ -1544,33 +1456,23 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
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
@@ -1578,7 +1480,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	 * TE interrupt handler.
 	 */
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
-		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
+		ret = exynos_dsi_register_te_irq(dsi, &device->dev);
 		if (ret)
 			return ret;
 	}
@@ -1605,18 +1507,10 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
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
@@ -1672,11 +1566,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
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

