Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A4213FF5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9446EBC1;
	Fri,  3 Jul 2020 19:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A706EBBC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so38141591ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEAQ5gGsiTDdTz57IwHot9JAKAc3HnFvUfrCKECFUhE=;
 b=SM3VFc8bLlgqY2kvUjNdYCdxJwR/mcx+Q5Jbu6Py1GJhTPvoOB30HA5+IuBM/N/dlp
 RzZ4/+ehQXA6IzDv/fhqDe8keS8rxbAHwcj+yN3Mi+IqqYADmZUpOcZnp9ljwD5bSCcp
 UBf87jbhcYFBdiy2Z9LPciP5qbYo+Unp5mGOTwVgBKX8LJ0MGw708yCQiTIRIVTjuc3R
 L4hRH0vQGkbO4Du7U/MSuP9z8e8GVyKA3zlbUt6uk/dzqL5A3EF9JTQYTArs2fMsSjcd
 bZBwL45gEEdXS2VYtY6HoLmHTGolqYdSlSDHRi9/2flZHLwd1KA0aEXslZS5AX/sr00z
 JJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vEAQ5gGsiTDdTz57IwHot9JAKAc3HnFvUfrCKECFUhE=;
 b=SvBPtHneZPnsVdUH2SJrNw2+eMYhixjEO94o515Fo4y8URbXlYO1wcCvd+/HKwnW5M
 ruh9R+/CDpKEpToSaTxsZxxTgZlsTTztt2gt8Kzic4XS4O2zaySlwP6NcYr+ALg4tWbO
 keUa3waC7pS1ts3EOukT1mD6ObCcXCuaH9O3zRsm+1GVGMDplA2biEw/jw8fBYj8kbIr
 W4+JKZT9L4sV8yaOwUFxPnYeJYaf2dF9FAqpIlrUTXG6gSJ47dOhC4Ni34jsuWoHQiJi
 nHPBrC83yvawLZu4vzyxPMVrAuyFPRYH0NdFxH4kfnK0VFf4H+cJoC2BLyJK8WQb0q4j
 ovLQ==
X-Gm-Message-State: AOAM532c0M1UPAXnFA1RcqpVHvob/7xjNyLp73cOkbK9wSmMvYWPTxgD
 2tiC1zyPmO/1NHtOMH6q0zFkn8q+Fds=
X-Google-Smtp-Source: ABdhPJzCR4rSjrisc6LCec6gXiMQK6bMX/f9IFEVNWBnOd7A/z/rY7jh4tmY9xhQp7mQYPu9y30HQw==
X-Received: by 2002:a2e:9c59:: with SMTP id t25mr6676077ljj.402.1593804283368; 
 Fri, 03 Jul 2020 12:24:43 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 18/21] drm/bridge: nxp-ptn3460: add drm_panel_bridge support
Date: Fri,  3 Jul 2020 21:24:14 +0200
Message-Id: <20200703192417.372164-19-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

Note: the bridge panel will use the connector type from the panel.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 51 ++++++++--------------------
 1 file changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 438e566ce0a4..0bd9f0e451b3 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -30,7 +30,7 @@ struct ptn3460_bridge {
 	struct i2c_client *client;
 	struct drm_bridge bridge;
 	struct edid *edid;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	struct gpio_desc *gpio_pd_n;
 	struct gpio_desc *gpio_rst_n;
 	u32 edid_emulation;
@@ -127,11 +127,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 	usleep_range(10, 20);
 	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
 
-	if (drm_panel_prepare(ptn_bridge->panel)) {
-		DRM_ERROR("failed to prepare panel\n");
-		return;
-	}
-
 	/*
 	 * There's a bug in the PTN chip where it falsely asserts hotplug before
 	 * it is fully functional. We're forced to wait for the maximum start up
@@ -146,16 +141,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 	ptn_bridge->enabled = true;
 }
 
-static void ptn3460_enable(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
-
-	if (drm_panel_enable(ptn_bridge->panel)) {
-		DRM_ERROR("failed to enable panel\n");
-		return;
-	}
-}
-
 static void ptn3460_disable(struct drm_bridge *bridge)
 {
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
@@ -165,25 +150,10 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 	ptn_bridge->enabled = false;
 
-	if (drm_panel_disable(ptn_bridge->panel)) {
-		DRM_ERROR("failed to disable panel\n");
-		return;
-	}
-
 	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
 	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
 }
 
-static void ptn3460_post_disable(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
-
-	if (drm_panel_unprepare(ptn_bridge->panel)) {
-		DRM_ERROR("failed to unprepare panel\n");
-		return;
-	}
-}
-
 static int ptn3460_get_modes(struct drm_connector *connector)
 {
 	struct ptn3460_bridge *ptn_bridge;
@@ -242,6 +212,11 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	int ret;
 
+	ret = drm_bridge_attach(bridge->encoder, ptn_bridge->panel_bridge,
+				bridge, flags);
+	if (ret < 0)
+		return ret;
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
 		return -EINVAL;
@@ -265,9 +240,6 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ptn_bridge->connector,
 							bridge->encoder);
 
-	if (ptn_bridge->panel)
-		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
-
 	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
 
 	return ret;
@@ -275,9 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
-	.enable = ptn3460_enable,
 	.disable = ptn3460_disable,
-	.post_disable = ptn3460_post_disable,
 	.attach = ptn3460_bridge_attach,
 };
 
@@ -286,6 +256,8 @@ static int ptn3460_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
+	struct drm_bridge *pbridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -293,10 +265,15 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ptn_bridge->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
 	if (ret)
 		return ret;
 
+	pbridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(pbridge))
+		return PTR_ERR(pbridge);
+
+	ptn_bridge->panel_bridge = pbridge;
 	ptn_bridge->client = client;
 
 	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
