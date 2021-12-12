Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0A471C13
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2DC10ED88;
	Sun, 12 Dec 2021 18:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C4F10ED88
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:14:51 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id a23so8009355pgm.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tFBdWXWRLumKPbljQcPfLHxrbq6FvQTLeBP3tnX7MWM=;
 b=qfR6c/TYY21P6iXE7EpFuQdQ/Y3mJRip6cqNeUY0V1O0QCk14izpe2TAQqGsjMzVX6
 hr57Hoi08FMd/W41ml/zKFAHNmPCHxzPcL63Ekw7RDAsJ5jtkVUIGH02pZ85KAJVXNfc
 RwagJwdLMbndEkRe1rN4wUMt9vTMv87KJmE2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tFBdWXWRLumKPbljQcPfLHxrbq6FvQTLeBP3tnX7MWM=;
 b=2aA46OPmahr0GDzvou5U+/v7cJAvUgW3A/UNFBIiP88mmcw7TkaLH9rwjsoMeiWcHl
 yzRSr9yybU7s+kd0OPrUIZ0AU4ASsMPL0/bMmTVIuAWQY4SkS6/CmvL4dRYkootCNlt7
 mvAZnTYVmcbfPM+kb3Z3YonKLEdOCTMvclGQ8SHx9G21dIUzNuj/ED3/foKoKuyNRbco
 tU7xHMK4tM32XyKUKSyiW8BgobiMffcGR3cwieClNrE7Nq2ItBtt45R0jPBonnMnaq+x
 B+W/r0tSFlZKlW2n8uxuL7rvAVR+mNqJk+9z/NfUGGcZleLrNcZhIlBastBxRs0R9/I3
 ZtcA==
X-Gm-Message-State: AOAM5303KgcQnFZ8k4s7VrcVHwVVhkYwiYnehPKySmDS99tovbDd0z+M
 fEwAbTk6r9Jqk1M0Fx7ec8KF2w==
X-Google-Smtp-Source: ABdhPJx0DsQbsoB7i/I1rUWGw3qel1e6kvcstTg/ESCZL5EuKPSKnVOyqAVNHV9QQI6GLIhtwfurSA==
X-Received: by 2002:a63:951b:: with SMTP id p27mr28326382pgd.524.1639332891536; 
 Sun, 12 Dec 2021 10:14:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:14:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 3/7] drm: exynos: dsi: Convert to bridge driver
Date: Sun, 12 Dec 2021 23:44:12 +0530
Message-Id: <20211212181416.3312656-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212181416.3312656-1-jagan@amarulasolutions.com>
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
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
Changes for v3:
- move bridge add in host_attach
- move bridge remove in host_detach
- use flags, bridge in drm_bridge_attach in attch 
Changes for v2:
- drop bridge_chain

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 82 +++++++++++++------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d1039628b6f2..1450187c1edc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -259,7 +259,7 @@ struct exynos_dsi_driver_data {
 struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct list_head bridge_chain;
+	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
 
@@ -289,9 +289,9 @@ struct exynos_dsi {
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
+static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
-	return container_of(e, struct exynos_dsi, encoder);
+	return container_of(b, struct exynos_dsi, bridge);
 }
 
 enum reg_idx {
@@ -882,9 +882,10 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
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
 
@@ -1376,10 +1377,10 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
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
@@ -1393,52 +1394,53 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 
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
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge, flags);
+}
+
+static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.enable				= exynos_dsi_enable,
+	.disable			= exynos_dsi_disable,
+	.attach				= exynos_dsi_attach,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1460,8 +1462,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	DRM_DEV_INFO(dsi->dev, "Attached %s device\n", device->name);
 
-	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
-	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
+	drm_bridge_add(&dsi->bridge);
+
+	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1499,13 +1502,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 
 	if (dsi->out_bridge->funcs->detach)
 		dsi->out_bridge->funcs->detach(dsi->out_bridge);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
 	exynos_dsi_unregister_te_irq(dsi);
 
+	drm_bridge_remove(&dsi->bridge);
+
 	return 0;
 }
 
@@ -1591,8 +1595,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
-	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
-
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
 		return ret;
@@ -1612,9 +1614,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(encoder);
+	exynos_dsi_disable(&dsi->bridge);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1640,7 +1641,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-	INIT_LIST_HEAD(&dsi->bridge_chain);
 
 	dsi->dsi_host.ops = &exynos_dsi_ops;
 	dsi->dsi_host.dev = dev;
@@ -1708,6 +1708,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
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

