Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFF22F601
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3F289DA8;
	Mon, 27 Jul 2020 17:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB9B89D8E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i19so9391003lfj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOZnXeuspKQ/lGHz5xL4ap67324QAsRgMOFpso9cHg4=;
 b=WG9Lq/HF1sBsz8cWfHa2hBE8iYeYfIl0UXyj2sLyO12HhiGUe80slLdtQxO5ih/BQh
 lTr0hnMn2qLnBUctEhzNyknL4UjPslEQ+Em5uIg6C9V1KTZX7VVJQ0lGcwbUMHmENgvG
 Vx07jNoopFCBMR3XyGmeH5FaAVRKsYjzmwTu1j0kmzOMak40+/dAGR0FV2LA4IWG/yEZ
 cw9WnVKYQwhm/7Te4Db2WkBGJymed34Zrbu+ZpAObdfX88jn+jiIyj3ffuQTek/HQmGy
 kyaoO+NzYYA1FFiIM+J6m9MYXReYSxHmCB7GemEgRLy5WKtybqaTdefjeWcVpox7ftLm
 s2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sOZnXeuspKQ/lGHz5xL4ap67324QAsRgMOFpso9cHg4=;
 b=e9q0VHVUiJSNkjN+RuwROH2pAJVa3lWuyvo9w9ZW6NI0YKQE+6SzUFxQiWSIa3Yd41
 dQSoPNX1bU6cYIDogMmansGpQDK/9f82hIsP34kVi6mmWp6H+fIlZ8LllI3Olv8C7qmg
 qNknN8IHfbBl030GSsyQNGPxmeYfrmOF+War+N72SXqZqUfj42x2+IKtt6EA9jiw+GDU
 SNLWdvr8i4xYf87j4MlRn+dJZOMeEQFhyGQ8L/Nmg1F13mVIhEqdFy/mkeWyOV2YO4IH
 8eue4ZTN5UyODW3//vi9oakaijkkyMQ425DEyrKs/3AJiD+72CRbdcm9EwVp/DviZF3i
 irIg==
X-Gm-Message-State: AOAM533i7/8mDlzKxmu86tP5DG+71NhzraOAB5tVF2squoPXwiPxQFMj
 h3bPZoE26keLJLIugkM4N806TbV5LS8=
X-Google-Smtp-Source: ABdhPJx1TNhhQWKxskbuN+/ZTvylYsenVsRiSEKHj/j1rr5/iydyzAaWlBbQ3qtQO3rIcBAUgCEMFA==
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr12165928lfi.21.1595869412326; 
 Mon, 27 Jul 2020 10:03:32 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a56d:c972:788a:ba53])
 by smtp.gmail.com with ESMTPSA id l3sm1417470lji.115.2020.07.27.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:03:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 4/5] drm/bridge: nxp-ptn3460: add get_edid bridge operation
Date: Mon, 27 Jul 2020 19:03:19 +0200
Message-Id: <20200727170320.959777-5-sam@ravnborg.org>
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

Add the get_edid() bridge operation to prepare for
use as a chained bridge.
Add helper function that is also used by the connector.

v2:
  - Fix memory leak (Laurent)
  - Do not save a copy of edid, read it when needed

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 43 ++++++++++++++++------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 438e566ce0a4..2805c8938f98 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -29,7 +29,6 @@ struct ptn3460_bridge {
 	struct drm_connector connector;
 	struct i2c_client *client;
 	struct drm_bridge bridge;
-	struct edid *edid;
 	struct drm_panel *panel;
 	struct gpio_desc *gpio_pd_n;
 	struct gpio_desc *gpio_rst_n;
@@ -184,17 +183,13 @@ static void ptn3460_post_disable(struct drm_bridge *bridge)
 	}
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
@@ -202,30 +197,40 @@ static int ptn3460_get_modes(struct drm_connector *connector)
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid) {
 		DRM_ERROR("Failed to allocate EDID\n");
-		return 0;
+		goto out;
 	}
 
 	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
-			EDID_LENGTH);
+				 EDID_LENGTH);
 	if (ret) {
 		kfree(edid);
+		edid = NULL;
 		goto out;
 	}
 
-	ptn_bridge->edid = (struct edid *)edid;
-	drm_connector_update_edid_property(connector, ptn_bridge->edid);
-
-	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
-
 out:
 	if (power_off)
 		ptn3460_disable(&ptn_bridge->bridge);
 
+	return (struct edid *)edid;
+}
+
+static int ptn3460_connector_get_modes(struct drm_connector *connector)
+{
+	struct ptn3460_bridge *ptn_bridge = connector_to_ptn3460(connector);
+	struct edid *edid;
+	int num_modes;
+
+	edid = ptn3460_get_edid(&ptn_bridge->bridge, connector);
+	drm_connector_update_edid_property(connector, edid);
+	num_modes = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
 	return num_modes;
 }
 
 static const struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
-	.get_modes = ptn3460_get_modes,
+	.get_modes = ptn3460_connector_get_modes,
 };
 
 static const struct drm_connector_funcs ptn3460_connector_funcs = {
@@ -279,6 +284,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.disable = ptn3460_disable,
 	.post_disable = ptn3460_post_disable,
 	.attach = ptn3460_bridge_attach,
+	.get_edid = ptn3460_get_edid,
 };
 
 static int ptn3460_probe(struct i2c_client *client,
@@ -327,6 +333,7 @@ static int ptn3460_probe(struct i2c_client *client,
 	}
 
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
+	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 	ptn_bridge->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ptn_bridge->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
