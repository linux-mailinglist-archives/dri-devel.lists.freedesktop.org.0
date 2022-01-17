Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C620E49041E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090E10E416;
	Mon, 17 Jan 2022 08:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8210E419
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:47 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e8so6931800plh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lu7N54hDgGGVeugilU9YpEcDIXXB4MJdT5H56dpnQUM=;
 b=NG3UQCY9uE+b1IZsZ/xtw3+uhv1MUWbmDbkcFnIwEzArLhd9u7MJL576KB+68OOcut
 snMy2J8HG5c0TZhRM3HEAzGLa2CCOxks8R9C2Ovc+pSQIRZjARhUqhW96k9lqfCjPB6Q
 XZP4A8aH54PR8QRhOSHRcW7pTMT+XpNq/ll1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lu7N54hDgGGVeugilU9YpEcDIXXB4MJdT5H56dpnQUM=;
 b=vW7418jqimumFmTPioEMvJAKzCzBH4P1mu5WB35buJHfHNSyyBLJD+wU+TxK/jX+T+
 HT87+sOBBzsr/oEQKeTUNU0xNvf1cONCnBk8/WMuU2Ec5ul5FaW86nQ4IZAI0OHI10D7
 mYCKUGGUW5iwEWPbYurXP2yWM+/L4Y8xy4dC8Im86qDIxCM/m1x4okSa+Q6ptS4T/pPe
 xaqwQjU9KxP8rIoOre4K+l+nrcgqGZSngU5d9qqQSw4wEsqZ/ewBcIbUPm+9bGHphe7r
 qhIlLvsLETmojBvaUXa1FniVinqp99LfR9cyMUDWjqLaEI7EPb/6dLG90bg9sbRqKfFP
 e6JA==
X-Gm-Message-State: AOAM532X/KAn6bfTFiZPk0ez//S0Nzb9pAXFbqCn+mh80bisGUO66xhA
 uYbw09Mmj8NrHNsRqGh9ZpGUBA==
X-Google-Smtp-Source: ABdhPJxihgS7Rhor74yzBSlK/tZlh48a5RRtPUUa2fTG2Pt0NMpbLv9J6ydto9f8ZFRRt/a8qfh3SA==
X-Received: by 2002:a17:90a:b701:: with SMTP id
 l1mr12422181pjr.153.1642408967021; 
 Mon, 17 Jan 2022 00:42:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:955a:760d:bbf3:5d4b])
 by smtp.gmail.com with ESMTPSA id z3sm11763423pjq.32.2022.01.17.00.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:42:46 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 3/5] drm: exynos: dsi: Convert to bridge driver
Date: Mon, 17 Jan 2022 14:12:23 +0530
Message-Id: <20220117084225.125868-4-jagan@amarulasolutions.com>
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

Convert the encoders to bridge drivers in order to standardize on
a single API with built-in dumb encoder support for compatibility
with existing component drivers.

Driver bridge conversion will help to reuse the same bridge on
different platforms as exynos dsi driver can be used as a Samsung
DSIM and use it for i.MX8MM platform.

Bridge conversion,

- Drops drm_encoder_helper_funcs.

- Adds drm_bridge_funcs and register a drm bridge.

- Drops bridge_chain.

- Separate pre_enable from enable function.

- Separate post_disable from disable function.

Convert it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- none
Changes for v4:
- add pre_enable function
- add post_disable function
Changes for v3:
- move bridge add in host_attach
- move bridge remove in host_detach
- use flags, bridge in drm_bridge_attach in attch 
Changes for v2:
- drop bridge_chain

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 88 +++++++++++++------------
 1 file changed, 45 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ebb19194bb86..8ca95c72ef18 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -257,7 +257,7 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct list_head bridge_chain;
+	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
 	struct drm_display_mode mode;
@@ -288,9 +288,9 @@ struct exynos_dsi {
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
+static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
-	return container_of(e, struct exynos_dsi, encoder);
+	return container_of(b, struct exynos_dsi, bridge);
 }
 
 enum reg_idx {
@@ -1375,10 +1375,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_enable(struct drm_encoder *encoder)
+static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct drm_bridge *iter;
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1391,63 +1390,64 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+}
 
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-	}
+static void exynos_dsi_enable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
-	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->enable)
-			iter->funcs->enable(iter);
-	}
-
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
+
 	return;
 }
 
-static void exynos_dsi_disable(struct drm_encoder *encoder)
+static void exynos_dsi_disable(struct drm_bridge *bridge)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct drm_bridge *iter;
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
+}
 
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-	}
+static void exynos_dsi_post_disable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
 	exynos_dsi_set_display_enable(dsi, false);
 
-	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->post_disable)
-			iter->funcs->post_disable(iter);
-	}
-
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
 
-static void exynos_dsi_mode_set(struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+static void exynos_dsi_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
-static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
-	.enable = exynos_dsi_enable,
-	.disable = exynos_dsi_disable,
-	.mode_set = exynos_dsi_mode_set,
+static int exynos_dsi_attach(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+}
+
+static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.pre_enable			= exynos_dsi_pre_enable,
+	.enable				= exynos_dsi_enable,
+	.disable			= exynos_dsi_disable,
+	.post_disable			= exynos_dsi_post_disable,
+	.mode_set			= exynos_dsi_mode_set,
+	.attach				= exynos_dsi_attach,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1470,8 +1470,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
 
-	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
-	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
+	drm_bridge_add(&dsi->bridge);
+
+	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1510,13 +1511,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	if (dsi->out_bridge->funcs->detach)
 		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
 	exynos_dsi_unregister_te_irq(dsi);
 
+	drm_bridge_remove(&dsi->bridge);
+
 	return 0;
 }
 
@@ -1602,8 +1604,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
-	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
-
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
@@ -1623,9 +1623,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(encoder);
+	exynos_dsi_disable(&dsi->bridge);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1651,7 +1650,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	dsi->dsi_host.ops = &exynos_dsi_ops;
 	dsi->dsi_host.dev = dev;
@@ -1719,6 +1717,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
+	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
-- 
2.25.1

