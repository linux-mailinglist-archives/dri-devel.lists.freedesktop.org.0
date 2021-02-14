Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2731B243
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049446E0AB;
	Sun, 14 Feb 2021 19:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8C6E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:31 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id e9so2553905plh.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bf5bVF/V5mY1BZUCCppx1dZ4tCXtGjp23rohASbcBPw=;
 b=EgPf4vqR/zBJ4fhi76+l20KOIlr0QjBN013wIMcoM2wiR4tPdkayZ9w+h6vCZOgY8X
 F+FEWS1k/va/bp9VhfDwmEiDZjTQO8dwfTYvk65ttsYs/Z1FY529PkCSH3PVcDdR8He4
 cneko4X96/vWJo+LiwzTmV7V2huwgLkpzEUe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bf5bVF/V5mY1BZUCCppx1dZ4tCXtGjp23rohASbcBPw=;
 b=YPLusMrVnaTc+NPyMLKyJEMrqfrD8sUFxnw6r0LMhUJfEf/3q51bbqIKP99WBNoK5K
 09t6nMtR5grk4jlbqajH64IZ4uZTxFpCxpWzGnNKI/DOomtO50ixcjXKJbvam77kBJ0i
 QNm/EyecsnuI5m5lsKOm2RnfqiUa9RJcAPbWC9N2vfkHAmve2kYS6hgv6TTw3eWX5Kgx
 C2rlnpIo/BKp2MPpo890BOZ9a7kKcFBBrXvFz4zS5+5MCyKX8xtqqNe7tzIi0VN/rMtX
 7/6C+2QuvRaFbR5NjlU2PVVoq8PKHBtyMuG5KK9MFFDLDrckkJQYlLdS7PU9dBSgkiJ2
 Cf7Q==
X-Gm-Message-State: AOAM530fKj1ew9eUp+U1hcD1HB8sWbyKwjCMOD+bNIuZhZbDH+3qTumK
 ZRCXYoWqO8lLWzLyJFnkqLwtmA==
X-Google-Smtp-Source: ABdhPJwPwCNcwlAUsWS5/+FaZxoXxf/8pEHUEP2jFGuMeLBc4DXzF+O4eU7ry1PqloOvnMYMZfP4Xw==
X-Received: by 2002:a17:90a:1b6c:: with SMTP id
 q99mr12487478pjq.137.1613331691135; 
 Sun, 14 Feb 2021 11:41:31 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:30 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 3/7] drm: sun4i: dsi: Convert to bridge driver
Date: Mon, 15 Feb 2021 01:10:58 +0530
Message-Id: <20210214194102.126146-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM bridge drivers have build-in handling of treating all display
pipeline components as bridges.

So, convert the existing to a drm bridge driver with a built-in
encoder support for compatibility with existing component drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 75 ++++++++++++++++----------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  6 +++
 2 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 39321299dc27..6f3c5330a468 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -714,10 +714,10 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
 	return 0;
 }
 
-static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
+static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 	struct mipi_dsi_device *device = dsi->device;
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
@@ -801,9 +801,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	sun6i_dsi_start(dsi, DSI_START_HSD);
 }
 
-static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
+static void sun6i_dsi_bridge_disable(struct drm_bridge *bridge)
 {
-	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 
 	DRM_DEBUG_DRIVER("Disabling DSI output\n");
 
@@ -852,9 +852,40 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
-	.disable	= sun6i_dsi_encoder_disable,
-	.enable		= sun6i_dsi_encoder_enable,
+static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
+				   enum drm_bridge_attach_flags flags)
+{
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
+	int ret;
+
+	if (dsi->panel_bridge)
+		return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, NULL, 0);
+
+	if (dsi->panel) {
+		drm_connector_helper_add(&dsi->connector,
+					 &sun6i_dsi_connector_helper_funcs);
+		ret = drm_connector_init(bridge->dev, &dsi->connector,
+					 &sun6i_dsi_connector_funcs,
+					 DRM_MODE_CONNECTOR_DSI);
+		if (ret) {
+			dev_err(dsi->dev, "Couldn't initialise the DSI connector\n");
+			goto err_cleanup_connector;
+		}
+
+		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
+	}
+
+	return 0;
+
+err_cleanup_connector:
+	drm_encoder_cleanup(&dsi->encoder);
+	return ret;
+}
+
+static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
+	.enable		= sun6i_dsi_bridge_enable,
+	.disable	= sun6i_dsi_bridge_disable,
+	.attach		= sun6i_dsi_bridge_attach,
 };
 
 static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
@@ -1063,8 +1094,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
-	drm_encoder_helper_add(&dsi->encoder,
-			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
 				      DRM_MODE_ENCODER_DSI);
 	if (ret) {
@@ -1073,27 +1102,12 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
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
+		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
 		goto err_cleanup_connector;
 	}
 
-	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
-
-	if (dsi->panel_bridge) {
-		ret = drm_bridge_attach(&dsi->encoder, dsi->panel_bridge, NULL, 0);
-		if (ret) {
-			dev_err(dsi->dev, "Couldn't attach drm bridge\n");
-			goto err_cleanup_connector;
-		}
-	}
-
 	return 0;
 
 err_cleanup_connector:
@@ -1199,6 +1213,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		goto err_unprotect_clk;
 	}
 
+	dsi->bridge.funcs = &sun6i_dsi_bridge_funcs;
+	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&dsi->bridge);
+
 	ret = component_add(&pdev->dev, &sun6i_dsi_ops);
 	if (ret) {
 		dev_err(dev, "Couldn't register our component\n");
@@ -1222,6 +1242,7 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 
+	drm_bridge_remove(&dsi->bridge);
 	component_del(&pdev->dev, &sun6i_dsi_ops);
 	mipi_dsi_host_unregister(&dsi->host);
 	clk_rate_exclusive_put(dsi->mod_clk);
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 370ecb356a63..5e70666089ad 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -16,6 +16,7 @@
 #define SUN6I_DSI_TCON_DIV	4
 
 struct sun6i_dsi {
+	struct drm_bridge	bridge;
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 	struct mipi_dsi_host	host;
@@ -38,6 +39,11 @@ static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
 	return container_of(host, struct sun6i_dsi, host);
 };
 
+static inline struct sun6i_dsi *bridge_to_sun6i_dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sun6i_dsi, bridge);
+}
+
 static inline struct sun6i_dsi *connector_to_sun6i_dsi(struct drm_connector *connector)
 {
 	return container_of(connector, struct sun6i_dsi, connector);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
