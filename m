Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CF1B99C5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8C76E0DE;
	Mon, 27 Apr 2020 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E1B6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:22 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 131so13019739lfh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79dXfgAO/1oeiD7HqNr2rl3zX6hL5WsuZP7mG8zOV0A=;
 b=u+0Z8JI/IfLl23SikUEORaI8awTUnccAPh6UAuR3FExC+FwLvcmbzXGE8JSeZLIYFP
 D/Ny+b+yR7CwkEH+DT+Pkg5nEZs2EhWNqdIRt2T8jqlIBb7XR6SqlPHvzGXtV/Q0EglM
 Yp26q6WlrfjQf/JsydbGA4ZGs/MSZ6FmBqkcSPqMvpH6jaQpF7jC2PPKrrRlSmAmP1dz
 f6fAEr56XgEGBzsSU//uN2deEQexMdwTfksYMqpYAKObu/hxNSwA23BqXg+3IaKcXSVK
 jdRpzSzZiBPACfuBuV5NvwvnFGfUqByFFL9Jc7j+owvZm+sQxFXvKsFX118sqcNy2Nbz
 byIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=79dXfgAO/1oeiD7HqNr2rl3zX6hL5WsuZP7mG8zOV0A=;
 b=suejGi3pa77X6zkG3XAA1e7OHtbkVAE+Lv6xiQz+4FBxtgKLGf0i3eu0MMTUDtsp/u
 ZUOmKAMlg4uX89cGjgsWI/x7zdgunvYnU7nnN4YHVcrrMREuqvmhHidpx/Ourk0QcQBK
 rS84AHlcpyV0I0n6zukALbSPAazrFto+aXryL3lAfCgO+AVTaVK5SNth7sd6NRgS8T/8
 mUPEqlX/Udu0dcGj3pbGw7UXJ7bB7nE8wZZdU5TPmDpeZ8sdQ3ddgdRSwLaDZzNMbO7N
 DJD31ae/05GNBCxM4fJgoU2EshCw9+ydRIO5d26GPA3vo0Jl2eRvsbNRzHkfM6+0y5Jj
 6DEg==
X-Gm-Message-State: AGi0PuZEyp7SboOPzSbEBb2bxDTDTuK9nRQns1CRMHkL0h6nSz0ap45j
 fBbTL+Giti/TnyfObxaW5AvHAnp3
X-Google-Smtp-Source: APiQypKcE2YQtyGmXP5WvG0cnCGoRA44KeQryFmGOFdH5dVOUGByCXawHSUh85tXab533A7D6bXn4w==
X-Received: by 2002:a19:8a:: with SMTP id 132mr14437209lfa.139.1587975561090; 
 Mon, 27 Apr 2020 01:19:21 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 16/21] drm/bridge: megachips: add get_edid bridge operation
Date: Mon, 27 Apr 2020 10:18:45 +0200
Message-Id: <20200427081850.17512-17-sam@ravnborg.org>
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

To prepare for a chained bridge setup add support for the
get_edid bridge operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 78a9afe8f063..5f06e18f0a61 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -131,21 +131,29 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
 	return NULL;
 }
 
-static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
+static struct edid *ge_b850v3_lvds_get_edid(
+		struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct i2c_client *client;
-	int num_modes = 0;
 
 	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
 
 	kfree(ge_b850v3_lvds_ptr->edid);
 	ge_b850v3_lvds_ptr->edid = (struct edid *)stdp2690_get_edid(client);
 
-	if (ge_b850v3_lvds_ptr->edid) {
-		drm_connector_update_edid_property(connector,
-						      ge_b850v3_lvds_ptr->edid);
-		num_modes = drm_add_edid_modes(connector,
-					       ge_b850v3_lvds_ptr->edid);
+	return ge_b850v3_lvds_ptr->edid;
+}
+
+static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
+{
+	struct edid *edid;
+	int num_modes = 0;
+
+	edid = ge_b850v3_lvds_get_edid(&ge_b850v3_lvds_ptr->bridge, connector);
+
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		num_modes = drm_add_edid_modes(connector, edid);
 	}
 
 	return num_modes;
@@ -270,6 +278,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
 	.detect = ge_b850v3_lvds_bridge_detect,
+	.get_edid = ge_b850v3_lvds_get_edid,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
@@ -324,7 +333,8 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 
 	/* drm bridge initialization */
 	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
-	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
+	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
+					 DRM_BRIDGE_OP_EDID;
 	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
