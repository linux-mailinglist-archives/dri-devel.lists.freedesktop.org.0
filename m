Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD8213FE8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCA56EBB3;
	Fri,  3 Jul 2020 19:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67E6EBB1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e8so3919804ljb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F+9ADDByH21le+8zG13U5csfCtz+PMsoryQTuXOQ1W0=;
 b=ZASSYPprHMF5zWeC1nKh4RtLV99MxGQBpjWA4pZpNM3vIzkMKApAEAkRoZtKxfyGiY
 /Oaaq2IJlMtD8ybYMsXlIbIIlg0m3UjXNrXcbRMBGK8WB0rmPKxnz/GpfFLp6ksQNA7Z
 B/ebFHj1FkOsjvu/wupydBnnzyeQsTl8Yg3qtePF8mYQoFNbfxjSKipjVIlG+fx8Nq20
 pOsuABclFvSwE6Z0woHFb2kgg1DqG86KYL6/+xf014Bt5GJLfBjMHXs54zSf6II/TRAu
 BM88ZJ0GR2U0rKJkVCjtKs9ADv4BtwyA3oed536G5fUoENHdZiXfLv7Oy06bvfKsGVSU
 OfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F+9ADDByH21le+8zG13U5csfCtz+PMsoryQTuXOQ1W0=;
 b=k8bA+VH8Hs6iFGcX0Ac7z99kEjOIBGjaZO1Ylus1i90BYhTEY/sjk2utdqA347LVAc
 PyFkMsNC25F2uU2kz5LlXX1VjahPCwz/bXesfWaf4cnhPRsRFCs4CWTsTFl9Jb8tTd9b
 d3Zb1tnSYr0PM8mw3yjyxX30AMZ36Nn0kPX8EABv0hrcd1NzziXTp1OG93G08DvMYEaX
 yyiz1LS1GN+mdf+nT6bNQZQOsojXCTifXkwKHNR76N9ISvfzOFH4blQJoC7u5MX74wZg
 jsHgH4VqCBwkZ5xoFLxRvwa+30+Hzji4XaBaDl6HhCFi0ku6Jk/pFeqQYQ7yNoj0yu99
 CHOA==
X-Gm-Message-State: AOAM533IoBNU++MNi1CE9c3oHoo0vvGjFFf/g2OTVe/EZ+lOmLaSJWFZ
 PD3hVW7uu4A4KQNXs2eNLs1334J11+Y=
X-Google-Smtp-Source: ABdhPJzZkY6FhAI1nODayisYB2ITYisNGnRpoLiC1OnhKeqZF15R14YL3vX4ej4O7K1iCoCC7fQ/IA==
X-Received: by 2002:a2e:94c9:: with SMTP id r9mr20161577ljh.445.1593804269564; 
 Fri, 03 Jul 2020 12:24:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:29 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 04/21] drm/bridge: tc358764: add drm_panel_bridge support
Date: Fri,  3 Jul 2020 21:24:00 +0200
Message-Id: <20200703192417.372164-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

The bridge panel will use the connector type reported by the panel,
where the connector for this driver hardcode DRM_MODE_CONNECTOR_LVDS.

v2:
  - Use PTR_ERR_OR_ZERO() (kbuild test robot)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kbuild test robot <lkp@intel.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 57 ++++++++-----------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index a277739fab58..e1f052a4f53b 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -156,7 +156,7 @@ struct tc358764 {
 	struct drm_connector connector;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
 	struct gpio_desc *gpio_reset;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	int error;
 };
 
@@ -282,7 +282,7 @@ static int tc358764_get_modes(struct drm_connector *connector)
 {
 	struct tc358764 *ctx = connector_to_tc358764(connector);
 
-	return drm_panel_get_modes(ctx->panel, connector);
+	return drm_bridge_get_modes(ctx->panel_bridge, connector);
 }
 
 static const
@@ -298,23 +298,11 @@ static const struct drm_connector_funcs tc358764_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void tc358764_disable(struct drm_bridge *bridge)
-{
-	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
-
-	if (ret < 0)
-		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
-}
-
 static void tc358764_post_disable(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 	int ret;
 
-	ret = drm_panel_unprepare(ctx->panel);
-	if (ret < 0)
-		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
 	tc358764_reset(ctx);
 	usleep_range(10000, 15000);
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
@@ -335,18 +323,6 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
 	ret = tc358764_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
-	ret = drm_panel_prepare(ctx->panel);
-	if (ret < 0)
-		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
-}
-
-static void tc358764_enable(struct drm_bridge *bridge)
-{
-	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-	int ret = drm_panel_enable(ctx->panel);
-
-	if (ret < 0)
-		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
 }
 
 static int tc358764_attach(struct drm_bridge *bridge,
@@ -356,6 +332,11 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
+	ret = drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+				bridge, flags);
+	if (ret < 0)
+		return ret;
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
 		return -EINVAL;
@@ -373,32 +354,21 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	drm_connector_helper_add(&ctx->connector,
 				 &tc358764_connector_helper_funcs);
 	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
-	drm_panel_attach(ctx->panel, &ctx->connector);
 	ctx->connector.funcs->reset(&ctx->connector);
 
 	return 0;
 }
 
-static void tc358764_detach(struct drm_bridge *bridge)
-{
-	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-
-	drm_panel_detach(ctx->panel);
-	ctx->panel = NULL;
-}
-
 static const struct drm_bridge_funcs tc358764_bridge_funcs = {
-	.disable = tc358764_disable,
 	.post_disable = tc358764_post_disable,
-	.enable = tc358764_enable,
 	.pre_enable = tc358764_pre_enable,
 	.attach = tc358764_attach,
-	.detach = tc358764_detach,
 };
 
 static int tc358764_parse_dt(struct tc358764 *ctx)
 {
 	struct device *dev = ctx->dev;
+	struct drm_panel *panel;
 	int ret;
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
@@ -407,12 +377,13 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
 		return PTR_ERR(ctx->gpio_reset);
 	}
 
-	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
-					  NULL);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(dev, "cannot find panel (%d)\n", ret);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret)
+		return ret;
 
-	return ret;
+	ctx->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+
+	return PTR_ERR_OR_ZERO(ctx->panel_bridge);
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
