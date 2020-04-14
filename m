Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A511A7663
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C306E49C;
	Tue, 14 Apr 2020 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793766E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:47:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q22so11611628ljg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 01:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6gJTT105aa4ue7YgxXuinhL2bM42pcNLnXZfYydKUrU=;
 b=Dq5THa19zQXUFRLjOkpIhd69jUyfgMjJYzKg7tlSggERlwxY4mVw+1KgLxGpm4Hx8+
 3eyIRnwD4s1pfV2LyaJWYo08IDUqXL9uPlviSK5d6FkkdSFLE/owkYqYHKAB0z1OtM6G
 vJU0pvZkVhnsAiOiJ/YmjBkjToGgHhYL0lDXe5xquhCRO3kn58WA2BA/X4EkuBa3Nnn2
 i5JfM727oXvuO/TOjzVMwyX8Uy7sXg9IdgkJjQXFyVXrSdQC4kY5048vaZPkWhONKfYI
 Mn8LZiiJ4WdcxFDyzFJhTRNpRZkY9YW3VsIZCRE9kfJ/5U7/CkUFZQE8RHZlhyqvrOfU
 qufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6gJTT105aa4ue7YgxXuinhL2bM42pcNLnXZfYydKUrU=;
 b=PWmAlAIO5SAjufD9NOLMZOqOsR7QVmwUnjIRars/j+trYxiFah5aYTIoFGi36hOeM7
 g7n7ZWnRMnZFMGl1Dn6Umy7U85HPxRRUTlvXpyMkAdkZvkgFIHhqfjEXUKYRB2Kf0gru
 a54/j1e/MF9+Clg/hT74n4A9saJWB6pUzpCCfImEYuBVRHVhl4VJoQlPvYVuOBO1NgaX
 dZcDcB061cgrBGgqRomOwqLaTOdfhiRYf0i61iTvKFJ6zU19I/sWERYWQ00yIZv3zxwn
 bVqH0G+sXvsCcpsFLmYnH1KeofyF7L7hWs5ud2ZoWKvSdujbekUZQhOynrRvdyovlsXM
 MX3g==
X-Gm-Message-State: AGi0Pub8N50vXNeg71OUK7oQUgCba8sgyN6EcwlFqK9xCFZaJWKmp21P
 1Go6qjCSCraeEGWyr8OQFOj/pSVnqso=
X-Google-Smtp-Source: APiQypJMM7w50F0xTeV/lqMhRhz8GhOIO8PPj/v1/JgdpXjGGO/T0C3j3HhG04YWxgb62mqAW94MjA==
X-Received: by 2002:a2e:b8c1:: with SMTP id s1mr13465299ljp.0.1586854059405;
 Tue, 14 Apr 2020 01:47:39 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q10sm9834979lfa.29.2020.04.14.01.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 01:47:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v1 3/4] drm/bridge: tc358764: add drm_panel_bridge support
Date: Tue, 14 Apr 2020 10:47:26 +0200
Message-Id: <20200414084727.8326-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414084727.8326-1-sam@ravnborg.org>
References: <20200414084727.8326-1-sam@ravnborg.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

Note that this change requires that the panel reports the correct
type of connector.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 59 +++++++++----------------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index a277739fab58..a5abf15e5c7f 100644
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
+				bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
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
