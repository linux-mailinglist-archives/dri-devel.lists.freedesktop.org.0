Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9F22E295
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1006E0D1;
	Sun, 26 Jul 2020 20:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1136E064
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 185so4811521ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0a7eoeooyl+78/8MyG1oCyo2+Hzh/e3h16Uz2HYAj/A=;
 b=NlX//OrNFaSzFwAM8DWWLHOgrEH4jQa/b5ZlxeokDliceMJqcUo+cTNOPfxjm0MwgE
 AVPZmoxcqWYIHvtHRarc/DlblPQBKAFJwduk4cnhOrVK7sMh6AC/QE67I1WXjoZ6zVWu
 ckzVY0K4pFfVSR51xg3eschLNb8gycY7fWYwLcoDO4f8IlcC5sh+Q9EwzTkuNxtqBjpC
 I5GfVtG8bQfRmAnYsiz9eMOd2iPfHhhpdVA/b70+PefhlLRflrrZHfoM94ML9Ob8o57r
 e5S0N/riXPtALcSnrfd/ex5N/2fINmBpv7xQD6iG8bbW5MlVpbFLolsdW7i1DgCq6RqX
 GVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0a7eoeooyl+78/8MyG1oCyo2+Hzh/e3h16Uz2HYAj/A=;
 b=MBnNDUYaX8RfP914JrlfP3hmy/n84vuTgwf9ounycrsdjRj1p33IJ0JK8xp7GxmTuR
 DUAUg/sw+2lHmxy8FS68U7o62xkq7A0KUZcnpHVqEnHGG+bI4PKdmLZ8c5MUdO4XzWbd
 G+3I9YVMZYHMTwmJR4lxpLvwBBw29n8FEX5leStqEgEASRBDcip7UhhfW++HkGLBSevs
 CQ3DmXVKuKwQ0aXJJhyiBRoeGKKN+NUyVbtrneiqH3F4qiAkAwhve5xtGL1bpxZlGRJm
 6Rkq4iPQ1UaM9TQfkL9WxNglomLRbrHQn5xK44QKf0EdSerJKAnxA39RIkKqVPLHMY9+
 LevQ==
X-Gm-Message-State: AOAM531HnZoI7k1PPJJP9HaM6LaTiyZwR5NA0zTVrqdFiZBmPzMj1fyI
 1+JRut8vRgCzYq1NUAVPoz/o4RG67SM=
X-Google-Smtp-Source: ABdhPJw2H8hmgxHo4hZ8j4VeIxYPascvCGPXINhTqQuOoE8A2OvwdnVt0qUX33ANhes9jMGQbzX9zQ==
X-Received: by 2002:a05:651c:222:: with SMTP id
 z2mr8964561ljn.395.1595795632071; 
 Sun, 26 Jul 2020 13:33:52 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 14/15] drm/bridge: nxp-ptn3460: add get_edid bridge
 operation
Date: Sun, 26 Jul 2020 22:33:23 +0200
Message-Id: <20200726203324.3722593-15-sam@ravnborg.org>
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

Add the get_edid() bridge operation to prepare for
use as a chained bridge.
Add helper function that is also used by the connector.

v2:
  - Fix memory leak (Laurent)
  - Do not save a copy of edid, read it when needed

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
