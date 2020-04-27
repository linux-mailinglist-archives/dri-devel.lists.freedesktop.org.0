Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7321B99C4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412A96E0D4;
	Mon, 27 Apr 2020 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72406E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id g10so12985244lfj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7s05XMTYcFfENek8PsGO4hs1bY+4uIGfZAp5xveEl4A=;
 b=WaPDs1bg3Poh/6oyeL1gtfefhhVeBACY2UtNFjfEkoUh2duRZFDSCUqoS0XK9gw6GG
 Yy77WqhsE0W76xIquxttdAIdiPTpcy9oNBCGdXbo6NC2M3u6t/gwcU2c6kp6xR9U1cuD
 e8TtpSdpc4qVKwjSpFgqDU0VOA++yPfNQx7dXAistwHQaTEeOtsPrisGJ6mpphqNj/m5
 hLTLiT/Ce1XLAandpjToqteAv+wDc3zW5Di0G6Pp3/5SaNh94O2Kq/i2c6mgwrlwLqrh
 5vFHvyY1DU1ibB11cpnnFNQ9O1Xmkx2dU7CW5JV1v9bJywuUuHbQHSmF3scol5XycjhF
 bCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7s05XMTYcFfENek8PsGO4hs1bY+4uIGfZAp5xveEl4A=;
 b=A5dPSFJOjS363ID5qw7Y754xbp7Q2mHhJKBjvZYKC5VVyb7SKR6bfUOlGcLZ0cvRXL
 zmSkWkPsIoV6L0CqFHmNnBu0uY2b0FIYdmVDxkIgowog0qYZs2l90YvDsqJNV+sj8cmw
 74QlusCpWY36YZeYvvXSKpSt/jxtAuCetUqEcC6o7GqrEjGB3VY+2vgR+y+Uxan2gOgi
 s2mnMLhJMZxyJlenxvSwSJsUar+NYh+wz89K/sEgiOaJlKAPVnZ7dtsZ9Ogalt1YmRWA
 Pe5frQTpsdUv2LK8lwUGG510Pw+CbvFz+uBByc7MXSwKkzFBg4n72b4Kkgy4UAlNzaHU
 OnXQ==
X-Gm-Message-State: AGi0PubK9O6ozL1bLazQpzWarKIw8bvZw/zo8wwYa4m3j0dJBSxcSwgT
 Quc+HtXtBk27h0mCTCK9yW1IQfwK
X-Google-Smtp-Source: APiQypLchTDsch3VlYxoKPd8hHqKmZ1fSD86nVzyDaZx7Z9Li1s0kBXhpmMSlLQWguhx9S8ypObZFA==
X-Received: by 2002:a19:f518:: with SMTP id j24mr14989307lfb.205.1587975565953; 
 Mon, 27 Apr 2020 01:19:25 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:25 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 19/21] drm/bridge: nxp-ptn3460: add get_modes bridge
 operation
Date: Mon, 27 Apr 2020 10:18:48 +0200
Message-Id: <20200427081850.17512-20-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the get_modes() bridge operation to prepare for
use as a chained bridge.
Add helper function that is also used by the connector.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 52 ++++++++++++++++++----------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 0bd9f0e451b3..e253c185f94c 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -154,17 +154,13 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
 }
 
-static int ptn3460_get_modes(struct drm_connector *connector)
+static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
+				     struct drm_connector *connector)
 {
-	struct ptn3460_bridge *ptn_bridge;
-	u8 *edid;
-	int ret, num_modes = 0;
+	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	bool power_off;
-
-	ptn_bridge = connector_to_ptn3460(connector);
-
-	if (ptn_bridge->edid)
-		return drm_add_edid_modes(connector, ptn_bridge->edid);
+	u8 *edid;
+	int ret;
 
 	power_off = !ptn_bridge->enabled;
 	ptn3460_pre_enable(&ptn_bridge->bridge);
@@ -172,30 +168,46 @@ static int ptn3460_get_modes(struct drm_connector *connector)
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid) {
 		DRM_ERROR("Failed to allocate EDID\n");
-		return 0;
+		return NULL;
 	}
 
 	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
-			EDID_LENGTH);
+				 EDID_LENGTH);
 	if (ret) {
 		kfree(edid);
-		goto out;
+		return NULL;
 	}
 
+	if (power_off)
+		ptn3460_disable(&ptn_bridge->bridge);
+
+	kfree(ptn_bridge->edid);
 	ptn_bridge->edid = (struct edid *)edid;
-	drm_connector_update_edid_property(connector, ptn_bridge->edid);
 
-	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
+	return ptn_bridge->edid;
+}
 
-out:
-	if (power_off)
-		ptn3460_disable(&ptn_bridge->bridge);
+static int ptn3460_connector_get_modes(struct drm_connector *connector)
+{
+	struct ptn3460_bridge *ptn_bridge;
+	struct edid *edid;
+
+	ptn_bridge = connector_to_ptn3460(connector);
+
+	if (ptn_bridge->edid)
+		return drm_add_edid_modes(connector, ptn_bridge->edid);
+
+	edid = ptn3460_get_edid(&ptn_bridge->bridge, connector);
+	if (!edid)
+		return 0;
+
+	drm_connector_update_edid_property(connector, edid);
 
-	return num_modes;
+	return drm_add_edid_modes(connector, edid);
 }
 
 static const struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
-	.get_modes = ptn3460_get_modes,
+	.get_modes = ptn3460_connector_get_modes,
 };
 
 static const struct drm_connector_funcs ptn3460_connector_funcs = {
@@ -249,6 +261,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
 	.disable = ptn3460_disable,
 	.attach = ptn3460_bridge_attach,
+	.get_edid = ptn3460_get_edid,
 };
 
 static int ptn3460_probe(struct i2c_client *client,
@@ -304,6 +317,7 @@ static int ptn3460_probe(struct i2c_client *client,
 	}
 
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
+	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 	ptn_bridge->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ptn_bridge->bridge);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
