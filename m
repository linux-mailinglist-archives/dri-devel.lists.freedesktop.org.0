Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671771B99C6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8806E0CF;
	Mon, 27 Apr 2020 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED589FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:07 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 131so13019114lfh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44LbaTEcIFEJWRuTX5noLRkpnxVAvPcaJ/DYcm4Ot8U=;
 b=hPBCLZuE0hXCFuV18eWbzGtk2v+8LTKp6T8KTWBoGQMX1HEUBFu4OOptLDMQbcXqnC
 9Eb1ekKGQ4+ZlU7/L+Il7AX4eFL4EsVJjIpPqu1YHT9P3NJdmgTRa+xVwxA7BLScd0Sb
 KrcOmDek8m3W/sEMuVgMVQgttgf53hk8uO30kp0TBvwgJEcmLsFLK6sJF6Do9PFNeSDz
 jEWK79rsmi5/hsF3jFSvT5T297pUO1OiymmPqOlJxEG5S2QtqYXbX5CxwbMUIaAIUFBm
 1q9rkE2TCIoN+fDGqX2me3W+2mUkUZ95dlxuAHdXEuJ88qv/xVTc37IRK4xRnmOBEAP+
 aNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=44LbaTEcIFEJWRuTX5noLRkpnxVAvPcaJ/DYcm4Ot8U=;
 b=LNCzlYRKbUjwb4/7nbskfBgSrig0oLsVz4Xqb7EzgwCVTox6/oA++sDVotb8MO4JsV
 Y3J51dtwGuHbFmXTQe1iL9q8g+Au6t+rhbfMPLkeU/UTYnW3RR93ebF9TfiPLu1oyRqX
 +sJSfOGnZM3Rf++eJwmDTzw7mqDi2KkdfTB6U7hH/58rlN+cUG7tqyo3vGWi52mfRbdK
 w7r89mZ1FEZFXB7COgBsdc1pIXHKOXMaHIuK0jkCFwd8Y44mX8zz1wHdhSc0icWBWlQO
 eWLGA6ncAwDlqXRIpre//CarSAOPv9VHV5GkWV8gQ16ax4SIcQ8nf0LK9REiC0H2KKnf
 mZbQ==
X-Gm-Message-State: AGi0PuajC67KAmYQ5CQnxaa6y6WRp9PbixaH8Cp1A0A+qUdshTpmIzve
 wZR2+7V6/IKLh0RWaFkU0gIO9H8C
X-Google-Smtp-Source: APiQypLwMWnC/Ic/SkI0FZqgZX9h88k53s/ZUxuwe9yVe2jWx5J74Zip6836KeNPyN+TyWDmvGH3cQ==
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr14292672lfg.49.1587975545947; 
 Mon, 27 Apr 2020 01:19:05 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:05 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 04/21] drm/bridge: tc358764: add drm_panel_bridge support
Date: Mon, 27 Apr 2020 10:18:33 +0200
Message-Id: <20200427081850.17512-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

The bridge panel will use the connector type reported by the panel,
where the connector for this driver hardcode DRM_MODE_CONNECTOR_LVDS.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 59 +++++++++----------------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index a277739fab58..3adb2c191499 100644
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
@@ -407,12 +377,15 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
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
+	if (IS_ERR(ctx->panel_bridge))
+		return PTR_ERR(ctx->panel_bridge);
+
+	return 0;
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
