Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589D22E293
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506F16E064;
	Sun, 26 Jul 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B90389C55
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:45 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t6so2074880ljk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C15A1UDnOXVGCMGjz4UccgYvW70KX4KigKoDq2NJ99w=;
 b=ppfheFy+6rIQJwaf0Be9d50qxPZ0MLUBRlsCcCiSq26PxmK/7WRHBtdLI13DPikppS
 gGBllBWtmVnAgyOo12gFjxetQc7fl0Q774MhcJj/CaQSa05LEHLeddkr7wf2ZZsIMKjI
 gk7cXA+wyuqnosbCFDPLFIFksRo5BelHkBeL7fVdwCL3IGmWOUITmhxtS2CamdYiQ3xP
 uCPFLI7cPEO7EDojBZ0rc8wjdQNbUA87qvMOIN1LpB32j7LfAdRgUIpvM28jrEdfp9FQ
 SyU+BdGMIK7LdXTeEmehOyIhD4RM94vJRlBOS54Nau5WSVyJjwBbXObju09Kw+GeSbOX
 rXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C15A1UDnOXVGCMGjz4UccgYvW70KX4KigKoDq2NJ99w=;
 b=g4MO+7YNtT7Q8pdQtzL42mJbp/pbP7Tja9DjdEgLCblJ1rKZBkrCXwHsNwZCaUK1UZ
 z/oe2BZCEvf1zoPgUWIfN4qqFni3J0Cp5wiHDUN9maR9kcPUcL19afXDPXCdYTvQrqMg
 SH9cD9f0Hl97Kfz8OJ3lwNuDe9BEuuPLKUXub1q4SXTTBNn9OuWOl/nlVSJ7rUfOZigY
 lhh57FVt/XD8q+wacJdxUCshQwmqgfSU1g5zQjL2sK6hh1+EzeEEDpJpmGNX30aO437s
 z5tIMovKcs2zkuTCzv/zYpw4FK91iJXp6v4xwtHE/8EG+xhrkyZV4QxuQgj5IG7f6E7A
 tGqA==
X-Gm-Message-State: AOAM533CyM1pjb+f8JkfkiIzIRNjbPi7H8bP63C4qKq7luhHL4bS0wpQ
 16UQKsn28APuSVq1QprdW9Z6NAKsWMM=
X-Google-Smtp-Source: ABdhPJyk4Wvu9vVNk2pv0POx3tXBGTWHllrn20qLaAEPvTQEwq9U3duQd5i1IgoVDeLQ3u+EQxoxBw==
X-Received: by 2002:a05:651c:1053:: with SMTP id
 x19mr8078128ljm.396.1595795623447; 
 Sun, 26 Jul 2020 13:33:43 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 08/15] drm/bridge: parade-ps8622: add drm_panel_bridge
 support
Date: Sun, 26 Jul 2020 22:33:17 +0200
Message-Id: <20200726203324.3722593-9-sam@ravnborg.org>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kbuild test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

The connecter is now either created by the panel bridge or the display
driver. So all code for connector creation in this driver is no longer
relevant and thus dropped.

The connector code had some special polling handling:
    connector.polled = DRM_CONNECTOR_POLL_HPD;
    drm_helper_hpd_irq_event(ps8622->bridge.dev);

This code was most likely added to speed up detection of the connector.
If really needed then this functionality belongs somewhere else.

Note: the bridge panel will use the connector type from the panel.

v2:
  - Fix to avoid creating connector twice (Laurent)
  - Drop all connector code - defer to bridge panel
  - Use panel_bridge for local variable to align with other drivers
  - Set bridge.type to DRM_MODE_CONNECTOR_LVDS;

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 100 ++++---------------------
 1 file changed, 13 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index d789ea2a7fb9..614b19f0f1b7 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -42,10 +42,9 @@
 #endif
 
 struct ps8622_bridge {
-	struct drm_connector connector;
 	struct i2c_client *client;
 	struct drm_bridge bridge;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	struct regulator *v12;
 	struct backlight_device *bl;
 
@@ -64,12 +63,6 @@ static inline struct ps8622_bridge *
 	return container_of(bridge, struct ps8622_bridge, bridge);
 }
 
-static inline struct ps8622_bridge *
-		connector_to_ps8622(struct drm_connector *connector)
-{
-	return container_of(connector, struct ps8622_bridge, connector);
-}
-
 static int ps8622_set(struct i2c_client *client, u8 page, u8 reg, u8 val)
 {
 	int ret;
@@ -365,11 +358,6 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
 			DRM_ERROR("fails to enable ps8622->v12");
 	}
 
-	if (drm_panel_prepare(ps8622->panel)) {
-		DRM_ERROR("failed to prepare panel\n");
-		return;
-	}
-
 	gpiod_set_value(ps8622->gpio_slp, 1);
 
 	/*
@@ -399,24 +387,9 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
 	ps8622->enabled = true;
 }
 
-static void ps8622_enable(struct drm_bridge *bridge)
-{
-	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
-
-	if (drm_panel_enable(ps8622->panel)) {
-		DRM_ERROR("failed to enable panel\n");
-		return;
-	}
-}
-
 static void ps8622_disable(struct drm_bridge *bridge)
 {
-	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
-
-	if (drm_panel_disable(ps8622->panel)) {
-		DRM_ERROR("failed to disable panel\n");
-		return;
-	}
+	/* Delay after panel is disabled */
 	msleep(PS8622_PWMO_END_T12_MS);
 }
 
@@ -436,11 +409,6 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
 	 */
 	gpiod_set_value(ps8622->gpio_slp, 0);
 
-	if (drm_panel_unprepare(ps8622->panel)) {
-		DRM_ERROR("failed to unprepare panel\n");
-		return;
-	}
-
 	if (ps8622->v12)
 		regulator_disable(ps8622->v12);
 
@@ -455,67 +423,17 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
 	msleep(PS8622_POWER_OFF_T17_MS);
 }
 
-static int ps8622_get_modes(struct drm_connector *connector)
-{
-	struct ps8622_bridge *ps8622;
-
-	ps8622 = connector_to_ps8622(connector);
-
-	return drm_panel_get_modes(ps8622->panel, connector);
-}
-
-static const struct drm_connector_helper_funcs ps8622_connector_helper_funcs = {
-	.get_modes = ps8622_get_modes,
-};
-
-static const struct drm_connector_funcs ps8622_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static int ps8622_attach(struct drm_bridge *bridge,
 			 enum drm_bridge_attach_flags flags)
 {
 	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
-	int ret;
-
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	ps8622->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(bridge->dev, &ps8622->connector,
-			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-	drm_connector_helper_add(&ps8622->connector,
-					&ps8622_connector_helper_funcs);
-	drm_connector_register(&ps8622->connector);
-	drm_connector_attach_encoder(&ps8622->connector,
-							bridge->encoder);
-
-	if (ps8622->panel)
-		drm_panel_attach(ps8622->panel, &ps8622->connector);
-
-	drm_helper_hpd_irq_event(ps8622->connector.dev);
-
-	return ret;
+	return drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
+				 &ps8622->bridge, flags);
 }
 
 static const struct drm_bridge_funcs ps8622_bridge_funcs = {
 	.pre_enable = ps8622_pre_enable,
-	.enable = ps8622_enable,
 	.disable = ps8622_disable,
 	.post_disable = ps8622_post_disable,
 	.attach = ps8622_attach,
@@ -533,16 +451,23 @@ static int ps8622_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ps8622_bridge *ps8622;
+	struct drm_bridge *panel_bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
 	if (!ps8622)
 		return -ENOMEM;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ps8622->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
 	if (ret)
 		return ret;
 
+	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
+
+	ps8622->panel_bridge = panel_bridge;
 	ps8622->client = client;
 
 	ps8622->v12 = devm_regulator_get(dev, "vdd12");
@@ -595,6 +520,7 @@ static int ps8622_probe(struct i2c_client *client,
 	}
 
 	ps8622->bridge.funcs = &ps8622_bridge_funcs;
+	ps8622->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	ps8622->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ps8622->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
