Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C93044CC2F0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6DE10E4F7;
	Thu,  3 Mar 2022 16:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408E010E9E1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:37:37 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id e6so4998475pgn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dias74Svt+6TABOfyKPB5h5wnbwc964CIcS14g2KvKI=;
 b=J2A6xeb0QefiEZ/G1JNR7iyyVy64kMSZUF81yKka45owxefvOCDMq8WxPrbKo5P9Rk
 QXRHJcCKaE3eydLLja/mHv0inaSlTZXXfDHtxlysPRiZL9WHY6kyKZTnhIBA2cDmklyo
 RtAfoR1WJJku7dUc5OhsdGm9NDmqrVu/toWHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dias74Svt+6TABOfyKPB5h5wnbwc964CIcS14g2KvKI=;
 b=agbpl9c282MwdYqQ2bRUFWOBxE5yEqPxDaLTiA+jZW6GDAmXoAS8z8EmvQNAjOgq4y
 Vkjk2iLzDmDgzDhtae/k7Wh0g3oxjUaQmc4/BK6r5LBb6rcgtPJTbQLjAY/EwO5ahClb
 JZ8npWi28tzPiATHmmlY3b+NmGBf965uSaNNjo0sxAgrDX7uDz6Wc27oCluO90e3jeWW
 dJRs0BzvSzflqSv3hcYfIYAcoECGcRl3v+Xx503AeGVLlEPoBFWGRJHOxFfZXlCkaeWx
 JABBm5gVQr5PGipvnR4kTy5yoXXixNvIwYDawwdYt756RUj4L0Nc0SkpyH1ZEDxjb/+G
 2ecw==
X-Gm-Message-State: AOAM5336QAc2XfJkxKlQM8UeRQkJAr1BjkPX0taWaHOxqxDwH7jebLTq
 HSan8GuUwurCth6EADPPeeo7QQ==
X-Google-Smtp-Source: ABdhPJwcl7o61aEWPlTB6atfnYmMPtxGadKJc/c0I6mtT/s+DvCs8PVOM6gtLUUZxYxrlHQPG9tH3w==
X-Received: by 2002:aa7:9253:0:b0:4e1:53d4:c2c6 with SMTP id
 19-20020aa79253000000b004e153d4c2c6mr39231339pfp.62.1646325456504; 
 Thu, 03 Mar 2022 08:37:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:4526:5253:a010:63f4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm3220983pfj.14.2022.03.03.08.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:37:36 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 1/6] drm: bridge: tc358764: Use drm panel_bridge API
Date: Thu,  3 Mar 2022 22:06:49 +0530
Message-Id: <20220303163654.3381470-2-jagan@amarulasolutions.com>
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

Replace the manual panel handling code by a drm panel_bridge via
devm_drm_of_get_bridge().

Adding panel_bridge handling,

- Drops drm_connector and related operations as drm_bridge_attach
  creates connector during attachment.

- Drops panel pointer and panel healpers.

This simplifies the driver and allows all components in the display
pipeline to be treated as bridges.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- none
Changes for v2:
- s/panel_bridge/next_bridge
- drop unneeded headers

 drivers/gpu/drm/bridge/tc358764.c | 104 ++----------------------------
 1 file changed, 6 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index c1e35bdf9232..dca41ed32f8a 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -16,14 +16,9 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_bridge.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
 
 #define FLD_MASK(start, end)    (((1 << ((start) - (end) + 1)) - 1) << (end))
 #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end))
@@ -153,10 +148,9 @@ static const char * const tc358764_supplies[] = {
 struct tc358764 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
+	struct drm_bridge *next_bridge;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
 	struct gpio_desc *gpio_reset;
-	struct drm_panel *panel;
 	int error;
 };
 
@@ -210,12 +204,6 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
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
@@ -278,43 +266,11 @@ static void tc358764_reset(struct tc358764 *ctx)
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
@@ -335,72 +291,25 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
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
-	ctx->connector.funcs->reset(&ctx->connector);
-	drm_connector_register(&ctx->connector);
-
-	return 0;
-}
-
-static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	drm_connector_unregister(&ctx->connector);
-	ctx->panel = NULL;
-	drm_connector_put(&ctx->connector);
+	return drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
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
 	struct device *dev = ctx->dev;
-	int ret;
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->gpio_reset)) {
@@ -408,12 +317,11 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
 		return PTR_ERR(ctx->gpio_reset);
 	}
 
-	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
-					  NULL);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(dev, "cannot find panel (%d)\n", ret);
+	ctx->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(ctx->next_bridge))
+		return PTR_ERR(ctx->next_bridge);
 
-	return ret;
+	return 0;
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
-- 
2.25.1

