Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B81B99DB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF876E0EA;
	Mon, 27 Apr 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816CA6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a21so13707041ljj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vjzXQBVoXNlOPYoRpuXxrwu9NjBWZwX5wQQr4dUxZ/0=;
 b=L/1pHaJo+y7Pf9RDiaOmD5KWDnMF3o4aB16KZWanEL+C/Zxr+95Cqw0vzzRuFYRNZJ
 bYsMLE/oR9DClpsvtJyjJnGHXlR0puAk09u4fayX/+KPPOjnLcncvsgQOntXRLeuSnUi
 Z1JCgzeyhwT25qVmzOXpkc64/qqz4W7mt+QdW2fUnbY8J5oM0KWnykFptf3EnQr+EDnB
 HgmsvHxKydRgKBWMOAp2ot1uKof07NxMmS5GieLlSPauhIOiJJ7d1EBAoa+EbzeY0ega
 97U5S9QD5hqHK5gcorxqd9MOFUU2vZwN11VYIBz87p1w/tg7W/TClDIT6ynPdazc8eys
 QzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vjzXQBVoXNlOPYoRpuXxrwu9NjBWZwX5wQQr4dUxZ/0=;
 b=AN0PcaNVTRlQLjxVpSQBG412FHwIvWgae0Lhvkd0dlROgvFMpAoKzF63D97HHWns6K
 WadbX007OBqStDTk8/yGBONVOSNIts9nydKpg5TgnDPs3QqrKuM1BCRxkHQIkppbVWk8
 7nvEmFh7Vpbb49DAMLSxokkeJqDVfNu6uyePbXLsW7vm1mAGc1tzdxXQf5ke/RWUf6j/
 6oBvZkqtVuK6FiicrJyzvPCYK2J0ISz3d8/gnqOpAqXwlmOWZTqWVg4elqkL5jD6787P
 iYAbAiVoicPs9TNYzTMVca9oXwqhAEu5gOIQFvq/T2STBTYZ6WYWNYmXVvqHyjMWTCJ6
 i/WQ==
X-Gm-Message-State: AGi0PuYuxgrH8GueUN/SU6+j80xTDej64AHr2vdhRel6VZBnBX9WmoI0
 HS+8RJ8sab7J/GpEJmkP2R2CLOlB
X-Google-Smtp-Source: APiQypKtH0Sl5WCbPnb9Iw9oGOxXpFXQzfTpzpOym+yhQgzy/HkoZqbZ0ZJyKAk/KssSlEAenagb+A==
X-Received: by 2002:a2e:8549:: with SMTP id u9mr12631452ljj.24.1587975556609; 
 Mon, 27 Apr 2020 01:19:16 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 13/21] drm/bridge: megachips: add helper to create connector
Date: Mon, 27 Apr 2020 10:18:42 +0200
Message-Id: <20200427081850.17512-14-sam@ravnborg.org>
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

Factor out connector creation to a small helper function.

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
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 47 +++++++++++--------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 6200f12a37e6..258e0525cdcc 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -191,6 +191,32 @@ static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int ge_b850v3_lvds_create_connector(struct drm_bridge *bridge)
+{
+	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(connector,
+				 &ge_b850v3_lvds_connector_helper_funcs);
+
+	ret = drm_connector_init(bridge->dev, connector,
+				 &ge_b850v3_lvds_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	return drm_connector_attach_encoder(connector, bridge->encoder);
+}
+
 static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 {
 	struct i2c_client *stdp4028_i2c
@@ -209,7 +235,6 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
-	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
 	struct i2c_client *stdp4028_i2c
 			= ge_b850v3_lvds_ptr->stdp4028_i2c;
 	int ret;
@@ -219,25 +244,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(connector,
-				 &ge_b850v3_lvds_connector_helper_funcs);
-
-	ret = drm_connector_init(bridge->dev, connector,
-				 &ge_b850v3_lvds_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	ret = drm_connector_attach_encoder(connector, bridge->encoder);
+	ret = ge_b850v3_lvds_create_connector(bridge);
 	if (ret)
 		return ret;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
