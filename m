Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3D22F604
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BBC89DA7;
	Mon, 27 Jul 2020 17:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D2889D81
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:35 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b25so18065585ljp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dAHtfyfUwW59ao3VAUDxrunebd3xdsVu/hEafbbWNZI=;
 b=vA3LQptWxGe0fW6NeopI5W0VmGFVyo4qoWfyQ5EbZ9c0blmV1WSlKn5hPbjElZbTGs
 qJQkVeJu4luZeWbSm9PBJHkdVNdOQt0zHk2aIEfG9QHb8xR6fhk0bY0qY1YdBlHb7rbh
 einxvtxGYxOS4gzN5KtW9VDf0rFF2RKvGl972uZ2aXHDRMCUpSHKlyvs+yH/XgJPf9vS
 CdY0j4tWntgEY/aW9NZzxuI2iJmX7cAAp4Y5sN8RWhldywrY4FiWePwZEg0hMXM75gKW
 pqgNCh4j8lv9wjQTXTA8ErqwngynjcIZxAXl3MQPgfqGy5mUCD60GFkI9i23qN/c8n/u
 RkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dAHtfyfUwW59ao3VAUDxrunebd3xdsVu/hEafbbWNZI=;
 b=s0tsLr3ol7Q7v8b07RCGg6a8KndFYGC8VOEWGkes6an8EZV3xaUffCt484Md6j2tHx
 lh2UjJ04ipC77uls3YFscNQvA7tnzdiqR3msFZjq7ZR2zEeKxTWrtL1D5ktArxcYx36T
 +peoHtlhLIMRhzqTZBHGRPcqSaE+HMsgxxOPNtAOl0ArjHjIs27hZLMLtsp4M+0MxyaE
 tIb9FpGu3yqv2nnYu1B7/TqgLA5yTRRifDnf4G6HuQ3nBZFmEqCCZvklDJPZq3OmiVgd
 DXapj1HRRlNAjX5tAnY4vz4jU98u54PNDWiYkhILf4l6kTN5RqZIcoTWxSDgGnlG2mlC
 XDLw==
X-Gm-Message-State: AOAM530CvaEXSAqORcF76ZXgyt0XnqUoDQBiTSiU01SsqDaoH8/YRncT
 oY6PC7sf7siWlm9uPYaCl2KaY3eAgJY=
X-Google-Smtp-Source: ABdhPJwokhpI4f/9Mjpop1wJ5b53B8Y6anPOd8SAv4CXw3AM8xhPeYiZZ6mL9Kp8EayaAr14qzzhZw==
X-Received: by 2002:a2e:3001:: with SMTP id w1mr3263501ljw.147.1595869413680; 
 Mon, 27 Jul 2020 10:03:33 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a56d:c972:788a:ba53])
 by smtp.gmail.com with ESMTPSA id l3sm1417470lji.115.2020.07.27.10.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:03:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 5/5] drm/bridge: nxp-ptn3460: add drm_panel_bridge support
Date: Mon, 27 Jul 2020 19:03:20 +0200
Message-Id: <20200727170320.959777-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727170320.959777-1-sam@ravnborg.org>
References: <20200727170320.959777-1-sam@ravnborg.org>
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
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup.

- Replacing direct use of drm_panel with drm_panel_bridge support.
- Make the connector creation optional

Note: the bridge panel will use the connector type from the panel.

v3:
  - Fix wrong logic in connector creation (Laurent)

v2:
  - Use panel_bridge for local variable name to align with other drivers
  - Fix that connector was created twice (Laurent)
  - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 60 ++++++++++------------------
 1 file changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 2805c8938f98..391c1f66f60f 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -29,7 +29,7 @@ struct ptn3460_bridge {
 	struct drm_connector connector;
 	struct i2c_client *client;
 	struct drm_bridge bridge;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	struct gpio_desc *gpio_pd_n;
 	struct gpio_desc *gpio_rst_n;
 	u32 edid_emulation;
@@ -126,11 +126,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
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
@@ -145,16 +140,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
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
@@ -164,24 +149,10 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
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
 
 static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
 				     struct drm_connector *connector)
@@ -245,12 +216,18 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
+	enum drm_bridge_attach_flags panel_flags;
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	/* Let this driver create connector if requested */
+	panel_flags = flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+	ret = drm_bridge_attach(bridge->encoder, ptn_bridge->panel_bridge,
+				bridge, panel_flags);
+	if (ret < 0)
+		return ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
@@ -270,9 +247,6 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ptn_bridge->connector,
 							bridge->encoder);
 
-	if (ptn_bridge->panel)
-		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
-
 	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
 
 	return ret;
@@ -280,9 +254,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
-	.enable = ptn3460_enable,
 	.disable = ptn3460_disable,
-	.post_disable = ptn3460_post_disable,
 	.attach = ptn3460_bridge_attach,
 	.get_edid = ptn3460_get_edid,
 };
@@ -292,6 +264,8 @@ static int ptn3460_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
+	struct drm_bridge *panel_bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -299,10 +273,15 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ptn_bridge->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
 	if (ret)
 		return ret;
 
+	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
+
+	ptn_bridge->panel_bridge = panel_bridge;
 	ptn_bridge->client = client;
 
 	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown",
@@ -334,6 +313,7 @@ static int ptn3460_probe(struct i2c_client *client,
 
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
 	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
+	ptn_bridge->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	ptn_bridge->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ptn_bridge->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
