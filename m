Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CDA470A3E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010610EC8C;
	Fri, 10 Dec 2021 19:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0949610EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 19:20:14 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id z6so6898502plk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u+8J0typzXJBP9SmIdZ7aUHRk1S8ZG0rEGDpl9ZWmlI=;
 b=mNAfy4UDJvH/nRCdp3aoTE8QQwZuxUWfThmVGEandqbraI1OYaBTgqjI/TAuCgCMZS
 NeLNQiAT2CtDO2hRl5+EaC79WyHyUXyBIHoArbatsn+GMOm3Dudnn923YWxg4P8YThcf
 bn23I7eoP+dPpxep4Y8GYfn3rtX7wblNoTLvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u+8J0typzXJBP9SmIdZ7aUHRk1S8ZG0rEGDpl9ZWmlI=;
 b=P9lQZfLek9F//md6keraWUl6FpI2rvMSj+EAkib2+k09nB7m4jhzkb/OH6NcewPb/F
 RRPO/O8pM9D9b72b1iq/gLI7brK5WMK1Aikksn8Xnr6WoTxPvaLg1xoeK539PFo2MHI+
 0rYJBr7LjyuW5gWSCJdo555eQTWs+CcGdwKkaEur5zKXYust0GWP7qxtXgSH6+8C7xbJ
 ttGT8P0/In6dCtEFWQPfyTalbQlLAc+ROUExKhaTtuFA2e6ZrDi4nm1FTCdGyzY3h9vW
 mYTM71GkiNFw/n6rNWeBQ+PnQbWyzxTbd1rEC55EzskLBt4wX/olzDgjQysI4qBYMSig
 xR3g==
X-Gm-Message-State: AOAM531AR+AmvBrr0i/0WWlOtg6wnhLuYY1AryMTHLDIjK+mj/Uy9U17
 13Vb/TSzB5FIwTYbEVq3euWyEw==
X-Google-Smtp-Source: ABdhPJxMQOpx152M/GZGKuIjj0d01lN2hqkjiHT3C4dCzlblT4FFK6H6oS/QeG9bSGKAGSJ2NxzkyA==
X-Received: by 2002:a17:902:ce8c:b0:141:d218:954 with SMTP id
 f12-20020a170902ce8c00b00141d2180954mr76943327plg.1.1639164013383; 
 Fri, 10 Dec 2021 11:20:13 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id o62sm3493022pfb.211.2021.12.10.11.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:20:12 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 2/4] drm: exynos: dsi: Use drm panel_bridge API
Date: Sat, 11 Dec 2021 00:49:20 +0530
Message-Id: <20211210191922.2367979-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210191922.2367979-1-jagan@amarulasolutions.com>
References: <20211210191922.2367979-1-jagan@amarulasolutions.com>
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
Changes for v2:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 147 +++---------------------
 1 file changed, 14 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0bb44e476633..8c6f7ac82822 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,8 +254,6 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct drm_connector connector;
-	struct drm_panel *panel;
 	struct list_head bridge_chain;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
@@ -285,7 +283,6 @@ struct exynos_dsi {
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
-#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
 static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
 {
@@ -1391,42 +1388,21 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 
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
@@ -1439,17 +1415,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
-	if (dsi->panel)
-		drm_panel_disable(dsi->panel);
-
 	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->disable)
 			iter->funcs->disable(iter);
 	}
 
 	exynos_dsi_set_display_enable(dsi, false);
-	if (dsi->panel)
-		drm_panel_unprepare(dsi->panel);
 
 	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->post_disable)
@@ -1460,70 +1431,6 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
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
@@ -1537,30 +1444,13 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
-	struct drm_bridge *out_bridge;
 
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
+	dsi->out_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 0, 0);
+	if (IS_ERR(dsi->out_bridge))
+		return PTR_ERR(dsi->out_bridge);
 
-		dsi->panel = of_drm_find_panel(device->dev.of_node);
-		if (IS_ERR(dsi->panel))
-			dsi->panel = NULL;
-		else
-			dsi->connector.status = connector_status_connected;
-	}
+	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
+	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1596,18 +1486,9 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
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
+	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
-- 
2.25.1

