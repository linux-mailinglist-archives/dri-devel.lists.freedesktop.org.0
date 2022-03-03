Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7014CC2F5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF24810EA6F;
	Thu,  3 Mar 2022 16:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818D210EA6F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:38:16 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id z15so5127012pfe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKZoe4JiEp2MmbPOTfnaYpdtxIogdQhsVfZjlkmH+tI=;
 b=N71k2QgdVEaKisjrBRGlvng/3X6l0aroRI9/7QqTs8CPi0tmOTswj/W2Jtd4Twz+Ag
 oqLnvFjwFK4QzBL8rT4M8fuUH/NlmpPZ7ff6gyeHLLkS3+ic84sW4XkowXJLpG76zm5A
 ZC08BcgH6gmCaQKPJ/w6isBrCcAaVXHfpoNEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKZoe4JiEp2MmbPOTfnaYpdtxIogdQhsVfZjlkmH+tI=;
 b=WN3SQrVZGBjrB9ztFDiUBJBpuOOY2OeQUoen3EVw/CuY4QfQEF+4yDD5CWzAjhgvzZ
 ZVe36vwLt3FU9JczEm8q/e5ZHMO7VfrfuwBj1P7Se/D49N8wmTnzKr39H1PgentTwcul
 GNrJp27aSCJUxGyXjYf1xvY5myOHqXx34ZPxZ32tbwLqaQlQwpoqxHYZhMzZ+6otTpU3
 HlV2deCxDCA5PePnzIB0D8pNwGJBwmqC1CPNLZAxY0eemHI8NSd89xMbaf/zLfEUCSlG
 g5gVw8NstVUbaMyaIQ07rkd+IwBSH3urET6ImPs2FMC1oeuNhqwMuHOQJ2FpBl9napj+
 yZag==
X-Gm-Message-State: AOAM53325JXhGRPRXoYne/XKpU2xmw9AR+aSCWwk+dSZyFUUIa2CGt1T
 vqfM7xLhYzEdlooHqDgbXEP2IA==
X-Google-Smtp-Source: ABdhPJyEdF1W6Jo0Vo4hCoXtW/th/WPpV0a/qd3mxqSiM+zsYPXsPWtkCZkAgBIrSY7ZuhZvA7Jm6A==
X-Received: by 2002:a05:6a00:23d4:b0:4c9:f1b6:8e97 with SMTP id
 g20-20020a056a0023d400b004c9f1b68e97mr38751714pfc.27.1646325496017; 
 Thu, 03 Mar 2022 08:38:16 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:4526:5253:a010:63f4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm3220983pfj.14.2022.03.03.08.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:38:15 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 5/6] drm: exynos: dsi: Convert to bridge driver
Date: Thu,  3 Mar 2022 22:06:53 +0530
Message-Id: <20220303163654.3381470-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303163654.3381470-1-jagan@amarulasolutions.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
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
Changes for v6, v5:
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
index 953094133ed8..59a4f7f52180 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -251,7 +251,7 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct list_head bridge_chain;
+	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
 	struct drm_display_mode mode;
@@ -282,9 +282,9 @@ struct exynos_dsi {
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
+static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
-	return container_of(e, struct exynos_dsi, encoder);
+	return container_of(b, struct exynos_dsi, bridge);
 }
 
 enum reg_idx {
@@ -1358,10 +1358,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
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
@@ -1374,63 +1373,64 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
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
@@ -1453,8 +1453,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
 
-	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
-	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
+	drm_bridge_add(&dsi->bridge);
+
+	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1493,13 +1494,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
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
 
@@ -1583,8 +1585,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
-	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
-
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
@@ -1596,9 +1596,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(encoder);
+	exynos_dsi_disable(&dsi->bridge);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1621,7 +1620,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	dsi->dsi_host.ops = &exynos_dsi_ops;
 	dsi->dsi_host.dev = dev;
@@ -1689,6 +1687,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
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

