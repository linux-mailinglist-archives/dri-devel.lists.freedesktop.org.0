Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A222E286
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F48989C49;
	Sun, 26 Jul 2020 20:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E1089C49
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:39 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m15so7211806lfp.7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9M/tVpbBKqBYSx6xTrhz9BeOgZwEWe6XuweGZBlE8E=;
 b=T+HhkBifZl2u3dFmOSIeSYpLrZcOtt3s7L8IxSKRG8oj33hfgHQ80Anuej9CEAI/yn
 j4KqdC+DfkK2ZvoSSsqgBUHOIRZPldc8HMZp7rxoU2BBTZA+LMpOnfgPFhPoslM3EYA1
 f/rIFU64wE6EnUwmf4qqSXUJIGX7Vo2TN4VtPC8NIcN/q9lfdynwFJ0N/N+/yyGKLtcJ
 MQfrImeYsw8Ey5bcXMqWez5GU4BG1EPCJnDLGe6JIHcPqa1/JGgJZMBjO2X+15L/yrg0
 i/zPdbRVxx6r/3YkdqGpAnrJkQFFRit68510iev5MloHiRq/ULJaxph3LhIUvCK/dOeU
 9Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I9M/tVpbBKqBYSx6xTrhz9BeOgZwEWe6XuweGZBlE8E=;
 b=T8pRk8bxjTP8V5iXCyjkfdTL/61G75LRHjoX0fdiDSZpTLcxdGQ+ow4NFxzUBDzo3C
 lLNtihVpjVEz9YqUykESaKx4rcK/cRW1rq2HEdSNvM4VkrtOah2slmJyPnLQ1mLPWef+
 pqSGzCYy3qqqjvu9tKlYYcvc2aof1UVpOfsVFrL+sTgwCX9Y6AqIAjImdCeULMfx2Ifl
 jrYZ8zgRamBi5nhgSR46XIn5/A0jyGL1lyrCniGIgrrDXJKnek7V7XKpfbmJsF4jgV1Y
 sKNQKsUPHSro8935tMc4tXK59SiY9PZ3Vp68cxCO41dWp2y53k/4WGMluk6eG4ymmjlP
 7SRw==
X-Gm-Message-State: AOAM532GP4hhHFrOgq+IDuy6keWd9sJsuVIGy4r/xbZImHH1EGs9jfF3
 S5DNlEgjhKx5gf74tuoS+9viY+yGVyM=
X-Google-Smtp-Source: ABdhPJyV4IEUsN1N7/bVDVEdnpkQX9iBjK/1qWJ4DPA6q/a2y4OHPmPCxA5imgPlDnnEmxRdB1lzLg==
X-Received: by 2002:a05:6512:6d6:: with SMTP id
 u22mr10013109lff.13.1595795617460; 
 Sun, 26 Jul 2020 13:33:37 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 04/15] drm/bridge: tc358764: add drm_panel_bridge support
Date: Sun, 26 Jul 2020 22:33:13 +0200
Message-Id: <20200726203324.3722593-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, kbuild test robot <lkp@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the tc358764 bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

The bridge panel will use the connector type reported by the panel,
where the connector for this driver hardcodes DRM_MODE_CONNECTOR_LVDS.

The tc358764 did not any additional info the the connector so the
connector creation is passed to the bridge panel driver.

v3:
  - Merge with patch to make connector creation optional to avoid
    creating two connectors (Laurent)
  - Pass connector creation to bridge panel, as this bridge driver
    did not add any extra info to the connector.
  - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.

v2:
  - Use PTR_ERR_OR_ZERO() (kbuild test robot)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kbuild test robot <lkp@intel.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 107 +++++-------------------------
 1 file changed, 16 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index a277739fab58..fdde4cfdc724 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -153,10 +153,9 @@ static const char * const tc358764_supplies[] = {
 struct tc358764 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
 	struct gpio_desc *gpio_reset;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	int error;
 };
 
@@ -210,12 +209,6 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
 	return container_of(bridge, struct tc358764, bridge);
 }
 
-static inline
-struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
-{
-	return container_of(connector, struct tc358764, connector);
-}
-
 static int tc358764_init(struct tc358764 *ctx)
 {
 	u32 v = 0;
@@ -278,43 +271,11 @@ static void tc358764_reset(struct tc358764 *ctx)
 	usleep_range(1000, 2000);
 }
 
-static int tc358764_get_modes(struct drm_connector *connector)
-{
-	struct tc358764 *ctx = connector_to_tc358764(connector);
-
-	return drm_panel_get_modes(ctx->panel, connector);
-}
-
-static const
-struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
-	.get_modes = tc358764_get_modes,
-};
-
-static const struct drm_connector_funcs tc358764_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
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
@@ -335,70 +296,28 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
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
 			   enum drm_bridge_attach_flags flags)
-{
-	struct tc358764 *ctx = bridge_to_tc358764(bridge);
-	struct drm_device *drm = bridge->dev;
-	int ret;
-
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
-	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(drm, &ctx->connector,
-				 &tc358764_connector_funcs,
-				 DRM_MODE_CONNECTOR_LVDS);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(&ctx->connector,
-				 &tc358764_connector_helper_funcs);
-	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
-	drm_panel_attach(ctx->panel, &ctx->connector);
-	ctx->connector.funcs->reset(&ctx->connector);
-
-	return 0;
-}
-
-static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	drm_panel_detach(ctx->panel);
-	ctx->panel = NULL;
+	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+				 bridge, flags);
 }
 
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
+	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
+	struct drm_panel *panel;
 	int ret;
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
@@ -407,12 +326,17 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
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
+	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
+
+	ctx->panel_bridge = panel_bridge;
+	return 0;
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
@@ -458,6 +382,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
+	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	ctx->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&ctx->bridge);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
