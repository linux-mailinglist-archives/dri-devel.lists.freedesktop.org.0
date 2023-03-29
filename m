Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3A6CDA7C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288FD10EABF;
	Wed, 29 Mar 2023 13:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEB510EABF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:19:54 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso18514666pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAaFhF/a5ENgWUKZdfeicYv37T8G+yzz+kNYaBM8Ibc=;
 b=HKqkbFZ2TYU68RSVDYycQrf3/QBAqDxyk3yugbSjnTad90HAJxauBWG3pqUTxIC5OX
 LSXPyPy4TO+DdSqZfNlD9kWSuR9mQamSmKAps4wplUDsC9JvHvXe4R4Tdeo2e4SD67qC
 eFn3r+7noJAIVpNaVr59LcSBfBFHcXvKjrQh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAaFhF/a5ENgWUKZdfeicYv37T8G+yzz+kNYaBM8Ibc=;
 b=3H4heAAdUJG0NBMN/k347Ndy+zolOohZ200k3k5SjHweaInBvOkz/JxsrpbvK5gE1K
 3aBJRBYHeJRf79VRMJpte/A8ez/ANTRTgv77VDU7ulDhtYZSdren6+W8D+X+5aKiUbtO
 7Y8CyjTWYXUQLX4oUAJfBNvq6wfegoVTDPIwOL0MTrv7F/cXYq5FcG3H/yBWopjPdioD
 handRjoxBv5tde3tAMoEOFvWqYhY3ck0nTi5eFuWJhxTwOFW96Js+j9iNZPOXG80uy2R
 0SXr9RRLQfL+hGFSktMeuwjakTN9T+Ysm5xKU4b+0B23wkda1xouVJw194vorsLuil3Z
 a3jA==
X-Gm-Message-State: AAQBX9cHtATuKslv95CVnvKF4VEml3bXSMbkuX9vtf2BErTHTHSE4Luh
 pfQ1YJtxu+vey7eygTNZj4RY7A==
X-Google-Smtp-Source: AKy350aIXLLIcBKLX4EnbM2MFHWk3+DhkZBq+rft36HmP01HP9W/YHK9ov8fdY0JAetpLe7hMizBhA==
X-Received: by 2002:a17:902:f551:b0:1a0:616d:7618 with SMTP id
 h17-20020a170902f55100b001a0616d7618mr18983382plf.51.1680095993863; 
 Wed, 29 Mar 2023 06:19:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902854900b0019c90f8c831sm22949389plo.242.2023.03.29.06.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:19:53 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 12/12] drm: sun4: dsi: Convert to bridge driver
Date: Wed, 29 Mar 2023 18:49:29 +0530
Message-Id: <20230329131929.1328612-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131929.1328612-1-jagan@amarulasolutions.com>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the encoder to bridge driver in order to standardize on a
single API by supporting all varients of downstream bridge devices.

The drm_encoder can't be removed as it's exposed to userspace, so it
then becomes a dumb encoder, without any operation implemented.

Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- drop bridge call chain
- use drmm_of_dsi_get_bridge
- switch to atomic bridge calls
- use atomic_pre_enable and atomic_enable for previous enable
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
 
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 143 ++++++++++---------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  10 +-
 2 files changed, 61 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 760ff05eabf4..71951a6dc914 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -20,8 +20,8 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -713,10 +713,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
 	return 0;
 }
 
-static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
+static void sun6i_dsi_bridge_pre_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 	struct mipi_dsi_device *device = dsi->device;
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
@@ -768,9 +769,12 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
 	phy_configure(dsi->dphy, &opts);
 	phy_power_on(dsi->dphy);
+}
 
-	if (dsi->panel)
-		drm_panel_prepare(dsi->panel);
+static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_state)
+{
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
@@ -784,9 +788,6 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	 * ordering on the panels I've tested it with, so I guess this
 	 * will do for now, until that IP is better understood.
 	 */
-	if (dsi->panel)
-		drm_panel_enable(dsi->panel);
-
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
 	udelay(1000);
@@ -794,17 +795,13 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	sun6i_dsi_start(dsi, DSI_START_HSD);
 }
 
-static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
+static void sun6i_dsi_bridge_disable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_state)
 {
-	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 
 	DRM_DEBUG_DRIVER("Disabling DSI output\n");
 
-	if (dsi->panel) {
-		drm_panel_disable(dsi->panel);
-		drm_panel_unprepare(dsi->panel);
-	}
-
 	phy_power_off(dsi->dphy);
 	phy_exit(dsi->dphy);
 
@@ -813,38 +810,23 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
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
+static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
+				   enum drm_bridge_attach_flags flags)
 {
-	struct sun6i_dsi *dsi = connector_to_sun6i_dsi(connector);
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 
-	return dsi->panel ? connector_status_connected :
-			    connector_status_disconnected;
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge,
+				 &dsi->bridge, flags);
 }
 
-static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
-	.detect			= sun6i_dsi_connector_detect,
-	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= drm_connector_cleanup,
-	.reset			= drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
-	.disable	= sun6i_dsi_encoder_disable,
-	.enable		= sun6i_dsi_encoder_enable,
+static const struct drm_bridge_funcs sun6i_mipi_dsi_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable	= sun6i_dsi_bridge_pre_enable,
+	.atomic_enable		= sun6i_dsi_bridge_enable,
+	.atomic_disable		= sun6i_dsi_bridge_disable,
+	.attach			= sun6i_dsi_bridge_attach,
 };
 
 static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
@@ -959,20 +941,27 @@ static int sun6i_dsi_dcs_read(struct sun6i_dsi *dsi,
 	return 1;
 }
 
+static const struct component_ops sun6i_dsi_ops;
+
 static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
-	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
+	int ret;
+
+	dsi->device = device;
+
+	drm_bridge_add(&dsi->bridge);
+
+	ret = component_add(dsi->dev, &sun6i_dsi_ops);
+	if (ret) {
+		dev_err(dsi->dev, "Couldn't register our component\n");
+		return ret;
+	}
 
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
 	if (!dsi->drm || !dsi->drm->registered)
 		return -EPROBE_DEFER;
 
-	dsi->panel = panel;
-	dsi->device = device;
-
 	drm_kms_helper_hotplug_event(dsi->drm);
 
 	dev_info(host->dev, "Attached device %s\n", device->name);
@@ -985,11 +974,10 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
-	dsi->panel = NULL;
+	component_del(dsi->dev, &sun6i_dsi_ops);
+	drm_bridge_remove(&dsi->bridge);
 	dsi->device = NULL;
 
-	drm_kms_helper_hotplug_event(dsi->drm);
-
 	return 0;
 }
 
@@ -1054,8 +1042,13 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
-	drm_encoder_helper_add(&dsi->encoder,
-			       &sun6i_dsi_enc_helper_funcs);
+	dsi->out_bridge = drmm_of_dsi_get_bridge(drm, dev->of_node, 0, 1);
+	if (IS_ERR(dsi->out_bridge)) {
+		ret = PTR_ERR(dsi->out_bridge);
+		DRM_DEV_ERROR(dsi->dev, "failed to find the bridge: %d\n", ret);
+		return ret;
+	}
+
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
 	if (ret) {
@@ -1064,39 +1057,19 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
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
-		goto err_cleanup_connector;
+		dev_err(dsi->dev, "Couldn't attach the DSI bridge\n");
+		return ret;
 	}
 
-	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
-
 	dsi->drm = drm;
 
 	return 0;
-
-err_cleanup_connector:
-	drm_encoder_cleanup(&dsi->encoder);
-	return ret;
-}
-
-static void sun6i_dsi_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
-
-	dsi->drm = NULL;
 }
 
 static const struct component_ops sun6i_dsi_ops = {
 	.bind	= sun6i_dsi_bind,
-	.unbind	= sun6i_dsi_unbind,
 };
 
 static int sun6i_dsi_probe(struct platform_device *pdev)
@@ -1175,22 +1148,19 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		goto err_unprotect_clk;
 	}
 
+	dsi->bridge.funcs = &sun6i_mipi_dsi_bridge_funcs;
+	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	dsi->bridge.enable_next_first = true;
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret) {
 		dev_err(dev, "Couldn't register MIPI-DSI host\n");
 		goto err_unprotect_clk;
 	}
 
-	ret = component_add(&pdev->dev, &sun6i_dsi_ops);
-	if (ret) {
-		dev_err(dev, "Couldn't register our component\n");
-		goto err_remove_dsi_host;
-	}
-
 	return 0;
 
-err_remove_dsi_host:
-	mipi_dsi_host_unregister(&dsi->host);
 err_unprotect_clk:
 	if (dsi->variant->has_mod_clk && dsi->variant->set_mod_clk)
 		clk_rate_exclusive_put(dsi->mod_clk);
@@ -1205,7 +1175,6 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 
-	component_del(&pdev->dev, &sun6i_dsi_ops);
 	mipi_dsi_host_unregister(&dsi->host);
 	if (dsi->variant->has_mod_clk && dsi->variant->set_mod_clk)
 		clk_rate_exclusive_put(dsi->mod_clk);
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index f1ddefe0f554..8b9263e0f4ef 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -21,9 +21,9 @@ struct sun6i_dsi_variant {
 };
 
 struct sun6i_dsi {
-	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 	struct mipi_dsi_host	host;
+	struct drm_bridge	bridge;
 
 	struct clk		*bus_clk;
 	struct clk		*mod_clk;
@@ -35,7 +35,7 @@ struct sun6i_dsi {
 	struct device		*dev;
 	struct mipi_dsi_device	*device;
 	struct drm_device	*drm;
-	struct drm_panel	*panel;
+	struct drm_bridge	*out_bridge;
 
 	const struct sun6i_dsi_variant *variant;
 };
@@ -45,10 +45,10 @@ static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
 	return container_of(host, struct sun6i_dsi, host);
 };
 
-static inline struct sun6i_dsi *connector_to_sun6i_dsi(struct drm_connector *connector)
+static inline struct sun6i_dsi *bridge_to_sun6i_dsi(struct drm_bridge *bridge)
 {
-	return container_of(connector, struct sun6i_dsi, connector);
-};
+	return container_of(bridge, struct sun6i_dsi, bridge);
+}
 
 static inline struct sun6i_dsi *encoder_to_sun6i_dsi(const struct drm_encoder *encoder)
 {
-- 
2.25.1

