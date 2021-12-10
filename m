Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC3D470A41
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F30510EC8F;
	Fri, 10 Dec 2021 19:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590FE10EC91
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 19:20:33 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id z6so6898959plk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+LaYYqalTE0PFqsd8qC0JzK3G3SgXuhMj6ny3iea3fQ=;
 b=n3Doa08lDSmdO4jWKs1uPdyqEpX4Z9w5iN1+BIZBjwbF2RpeT9QDpwWIJkJ0kKs9FX
 T8vJka8f+nfF/H4DKKTdOKGCUSeY8sha2K0sB8vNy2dXOhyn/mPYT11j0HdEsy9LpY3Y
 ZbzL0r+f5Apw8U8YxAxy0MnbV2b7EJ/75e+XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+LaYYqalTE0PFqsd8qC0JzK3G3SgXuhMj6ny3iea3fQ=;
 b=DeqZmY0lQz+s5fwq0panEoZxC/CxkOWD8kRqTEJMr7pSGehb2FmsmuKKjKve0RWzVD
 4ic8cDd/G+fB4cGcv1ZJ74CHPmDH0G1Fa7KmvglPbPKNNRCDYUMdOQL3pIOXIe1bHNGA
 /qs9iwuihw7CCWigM9tJHncsPfnyLq38h65JzS5LjHDTloLbGx80j05GdkyeuakPmEAa
 sW6IjF/qOVXNjtPrzizjy+uiwggnpu9CaAxsmBvFW9C587almlqSrCKJYG1/we92VXuv
 53gg27FZ4KYnKzIND60OIN4WGoMQLt8LKwpbBmDSAhT7prWwAGP1+2ko8+lEn1HXofSc
 nT8g==
X-Gm-Message-State: AOAM530qz0Z2H2PiSKVWpFkD+b44572cJWl9aWg3rTrWEhYGCj3DfCBv
 1oMcGDXfcaqMgX2RmkgV9gdD4w==
X-Google-Smtp-Source: ABdhPJxmdOOctZJWXW42amwU8uEYxGlbwB/oKY1i3l01cqiOC+hykLYOUFC7XBPJbTOtkbBueSc2ew==
X-Received: by 2002:a17:90a:ff03:: with SMTP id
 ce3mr26106350pjb.89.1639164032951; 
 Fri, 10 Dec 2021 11:20:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id o62sm3493022pfb.211.2021.12.10.11.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:20:32 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 3/4] drm: exynos: dsi: Convert to bridge driver
Date: Sat, 11 Dec 2021 00:49:21 +0530
Message-Id: <20211210191922.2367979-4-jagan@amarulasolutions.com>
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

Convert the encoders to bridge drivers in order to standardize on
a single API with built-in dumb encoder support for compatibility
with existing component drivers.

Driver bridge conversion will help to reuse the same bridge on
different platforms as exynos dsi driver can be used as a Samsung
DSIM and use it for i.MX8MM platform.

Bridge conversion,

- Drops drm_encoder_helper_funcs, bridge_chain.

- Adds drm_bridge_funcs and register a drm bridge.

Convert it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- drop bridge_chain

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 84 +++++++++++++------------
 1 file changed, 45 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 8c6f7ac82822..37ad94b563c4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,7 +254,7 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct list_head bridge_chain;
+	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
 
@@ -284,9 +284,9 @@ struct exynos_dsi {
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
+static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
-	return container_of(e, struct exynos_dsi, encoder);
+	return container_of(b, struct exynos_dsi, bridge);
 }
 
 enum reg_idx {
@@ -877,9 +877,10 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
+static void exynos_dsi_set_display_mode(struct drm_bridge *bridge)
 {
-	struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *m = &bridge->encoder->crtc->state->adjusted_mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;
 
@@ -1371,10 +1372,10 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_enable(struct drm_encoder *encoder)
+static void exynos_dsi_enable(struct drm_bridge *bridge)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct drm_bridge *iter;
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1388,52 +1389,53 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-	}
+	if (dsi->out_bridge)
+		funcs->pre_enable(dsi->out_bridge);
 
-	exynos_dsi_set_display_mode(dsi);
+	exynos_dsi_set_display_mode(bridge);
 	exynos_dsi_set_display_enable(dsi, true);
 
-	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->enable)
-			iter->funcs->enable(iter);
-	}
+	if (dsi->out_bridge)
+		funcs->enable(dsi->out_bridge);
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 	return;
 }
 
-static void exynos_dsi_disable(struct drm_encoder *encoder)
+static void exynos_dsi_disable(struct drm_bridge *bridge)
 {
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct drm_bridge *iter;
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
-	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-	}
+	if (dsi->out_bridge)
+		funcs->disable(dsi->out_bridge);
 
 	exynos_dsi_set_display_enable(dsi, false);
 
-	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
-		if (iter->funcs->post_disable)
-			iter->funcs->post_disable(iter);
-	}
+	if (dsi->out_bridge)
+		funcs->post_disable(dsi->out_bridge);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
 
-static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
-	.enable = exynos_dsi_enable,
-	.disable = exynos_dsi_disable,
+static int exynos_dsi_attach(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, 0);
+}
+
+static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.enable			= exynos_dsi_enable,
+	.disable		= exynos_dsi_disable,
+	.attach			= exynos_dsi_attach,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1449,8 +1451,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	if (IS_ERR(dsi->out_bridge))
 		return PTR_ERR(dsi->out_bridge);
 
-	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
-	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
+	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1488,7 +1489,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 
 	if (dsi->out_bridge->funcs->detach)
 		dsi->out_bridge->funcs->detach(dsi->out_bridge);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
@@ -1585,8 +1585,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
-	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
-
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
@@ -1606,9 +1604,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(encoder);
+	exynos_dsi_disable(&dsi->bridge);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1634,7 +1631,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	dsi->dsi_host.ops = &exynos_dsi_ops;
 	dsi->dsi_host.dev = dev;
@@ -1702,6 +1698,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
+	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&dsi->bridge);
+
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
@@ -1716,6 +1718,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
+	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&dsi->bridge);
+
 	pm_runtime_disable(&pdev->dev);
 
 	component_del(&pdev->dev, &exynos_dsi_component_ops);
-- 
2.25.1

