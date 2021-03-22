Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82646344670
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAFA89DD8;
	Mon, 22 Mar 2021 14:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8957789DCF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:02:31 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so3297964pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ei9A5zbhvayRjVi6Vomvlir4u8ShWE4723QjD9pmyj8=;
 b=poA302j/mvAkaegxDWYEeeSk17OIGSpov5S1P+W+Nyni670nUYDk56aAlfN0qx378t
 6avkS+li79b9qoKIuEJLyjYHYy0peEVG81d9mw6rdaTR7p8VS2HDsWwfwVg0OfTFsCVH
 BNFDwWBXfQjh8kogqGp4QXi6lwkF95f46UAoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ei9A5zbhvayRjVi6Vomvlir4u8ShWE4723QjD9pmyj8=;
 b=Ft0Nap5sMpFGd9ZjDJUMt0l4BxiuFAP/mbb+Dqrwij60bEH1Sy1ballrewUZmtN77+
 1nL+s4CjEr/I96MB45X7m1J2hkPw89zBnabKH777/G0hJkxVUUFrMdIqmTLOom+y0SiO
 HAmC3BK+A/ugcR6FzhIt8eah4+FM/EUdDOTRZtgrCwHg/wBrYGm4UwoOvlmj40dOE2vU
 /mB77BijgMH2jXurD5ExdKjFaOoStoyqvFIb5nz5xcoJqT/OULVnw7ZA1MTZwNFMYblr
 Wq5NcPe/7uebIYLguAnXBXRF1/nA500OnSlVMN3FZB5ydbEbhEL+ON/NbI+9+OmAhCFw
 DdZQ==
X-Gm-Message-State: AOAM5318qAlG8lyWXjfrZdl519sXYBN9ajsGdrRGe0eNLNRGw9d+1Pz5
 2bnlUwiGwFiZmYa07ODNWGGE2Q==
X-Google-Smtp-Source: ABdhPJy7CvaUS8zMyaa3jiedTNo+wt6eK9DPbhjlpADTyIB/BG3TdxG1g9aaciqo9pn7TR0iyMRyHg==
X-Received: by 2002:a17:90a:f40f:: with SMTP id
 ch15mr13900475pjb.128.1616421751168; 
 Mon, 22 Mar 2021 07:02:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:15c1:9a30:414f:d84b])
 by smtp.gmail.com with ESMTPSA id gg22sm14112997pjb.20.2021.03.22.07.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:02:30 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 3/4] drm: sun4i: dsi: Convert to bridge driver
Date: Mon, 22 Mar 2021 19:31:51 +0530
Message-Id: <20210322140152.101709-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322140152.101709-1-jagan@amarulasolutions.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
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
Changes for v4:
- none
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
