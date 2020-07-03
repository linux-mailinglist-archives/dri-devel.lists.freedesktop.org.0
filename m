Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8DA213FF0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E2E6EBBD;
	Fri,  3 Jul 2020 19:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2CD6EBBA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so38141386ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBYYS+sb5XoIj43xilaf9vPwWeYrGCFZbZjcQxACSwk=;
 b=mHOq8ZCxWXXw14hiRcoMESeoguUggrJJaaXnQK3HOpF1uSIjp9NmJHqqjFcLxYIxo1
 A/vx7WNgDvzMcyqn8LBqXWMXacvJGPxC0+iiL2YNpjt2fZMU5bskEfsLoMSvVuv2pBqJ
 74DnPTFPz4MW8YcdY1FuN8hEdEog5ld8aoUpPHrdXgXh5dKRZMoB7D0IxKD2WSUUAyvB
 q7AHUZDZ1voogmmMmYNJR7/cb2E07uu5Q/By98yL1HNBATY/hQ0qV4m6lN5E7KTRBvIb
 DUFbCsnmRhVbGZIgN6DiErW+Tk3ToBxdcXKd4gUCo0Z6eaN2rHNtAjje7gXrZ8TT3Tu5
 ikjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eBYYS+sb5XoIj43xilaf9vPwWeYrGCFZbZjcQxACSwk=;
 b=tGXvWeFCyx6P9b9GITsOqptDTsfBxNJZarcoeDUhwmSPgUjcX20l+m70cO+1TGsFGA
 +ei2Vvzpd342h4EDkrf9qJqAr/P1oxCio9L84yRnz9zr1WA4t63R0mOU3nQcEKihr9ZE
 pF/TDgkUmbTU5doWv/3NHeDyZApMbbbjk0fy8hBYpf9jqaXNwBmQ0pqEHDfRARFtU5yH
 43qZ+Dn7GDFi4ZhxsZDPQckji7WmXPg3CQN43Pv7GIm+KtvQDmUmhTjdun8bZp582EHH
 BJyhd+ulJ/Js5OlrZu52NyIL+HLTxtX527syPhx3cyGmgfOZ7D2dbNJVnNvnZxJdnrjX
 if3g==
X-Gm-Message-State: AOAM533uD4miio65A7DV6eJJPdCClmb6hhT+kNy/ujLCUwrl3mf3I0/6
 YLaELdRPAOt3IU03UeqkbGllwqSsVAw=
X-Google-Smtp-Source: ABdhPJyeWiBlml1l00YNLxz2PDLaJlpSvGud2opGVHvBE9FfQKW6dFU9vbKuu3xlxxVANvxDMcWBUg==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr10474223ljk.407.1593804278412; 
 Fri, 03 Jul 2020 12:24:38 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 13/21] drm/bridge: megachips: add helper to create connector
Date: Fri,  3 Jul 2020 21:24:09 +0200
Message-Id: <20200703192417.372164-14-sam@ravnborg.org>
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
 Martin Donnelly <martin.donnelly@ge.com>, Sam Ravnborg <sam@ravnborg.org>,
 kbuild test robot <lkp@intel.com>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
