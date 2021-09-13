Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5278F408ED6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05F86EBA3;
	Mon, 13 Sep 2021 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FD589D56
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 12:51:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q11so14504198wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wwDbi/F1yzMdGSzPisZP/TR90sy0EJXO0nvDjAz0B6Y=;
 b=g54zQBkc0ygeJjGKY66WSYgOIek2MabARkvMCD1ydHRDdOGI/mNWhtuw+gDwTIko3u
 cpwhkBQVQTdXSbP7AbFq5czpikXB753YMjlYptR3gO1OBxWUCCP7YmJhDFVDYMEl6q4n
 Fb1ympWZ/lpRtSW3VeLnQanKpUmB+bWAo3kBrUbA9qkLo4Uv9+cBFemBYpBpqK1trrC1
 oq/U6gTRy08r9KpatwSWdunihSZ4AjjLfG6qDIp8NZxFiYDET/Mt0vw4d3r/Jm+A44zT
 s1Hd5JH4Bx2peeDA6Par1SxtEyx85JkR9mmtoofiAXWxPMir6cdYHsudVZ9Bf42RgAO+
 AXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wwDbi/F1yzMdGSzPisZP/TR90sy0EJXO0nvDjAz0B6Y=;
 b=SYRASdzdMXoamDzYcT6wEhK56sBvsKXr46LeTEHXbp+YU5IEr+5kSVR8bbtiwJfcbX
 zh6RROHrYCod+iQtml77p37LpSrlvWxUxASJNv/rRf3OHjkxpVMG6dQpM0WOFjZY4tVY
 IKcmpFxIeR+Gybw3weVOFQ8IPiXHaIoEb4XKSsommQjqtI7B5RO+9wHiCEUaquxsbyEf
 8UZLkVWVJIcp0fCBLRGnIQ/JC1nObh6cD+Y2Nh9zQBYLKdVn28teXuPoHOhZ7nkIktam
 YWeSt+n+rnOblIXcuuXYaK6rotiOf9JglS/rT1NtJEf69sh+WN88bpCHKkL/+tjqJKr0
 +KQQ==
X-Gm-Message-State: AOAM533bE2v5e2g62yxga7ST190dzqW/H6e5EmDTxqOvsvZjnIx/uqwR
 hRj5YVuk7gm0NY71sfYxew==
X-Google-Smtp-Source: ABdhPJxFg1Ha29Hbrj6P2UIpbQU+Lx2FIHYuJ78y+Zmnk3GykAhjnp18N9z3JGThly10GgNq25I4KA==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr8901817wrw.250.1631537479663; 
 Mon, 13 Sep 2021 05:51:19 -0700 (PDT)
Received: from alex-ThinkPad-E480.. ([2a02:810b:f40:4200:cd7c:5225:d3bf:f045])
 by smtp.googlemail.com with ESMTPSA id
 x21sm7145287wmc.14.2021.09.13.05.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:51:19 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to
 drm_bridge_attach
Date: Mon, 13 Sep 2021 14:51:08 +0200
Message-Id: <20210913125108.195704-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Sep 2021 13:35:57 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
this flag in some way since then.
Newly added bridge drivers must no longer contain the connector creation and
will fail probing if this flag isn't set.

In order to be able to connect to those newly added bridges as well,
make use of drm_bridge_connector API and have the connector initialized
by the display controller.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 29 ++++++++++++++++--------
 drivers/gpu/drm/rockchip/rockchip_rgb.c  | 26 ++++++++++++++++++++-
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 551653940e39..e3953c72fbdb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -19,6 +19,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -612,9 +613,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, lvds->soc_data->helper_funcs);
+	connector = &lvds->connector;
 
 	if (lvds->panel) {
-		connector = &lvds->connector;
 		connector->dpms = DRM_MODE_DPMS_OFF;
 		ret = drm_connector_init(drm_dev, connector,
 					 &rockchip_lvds_connector_funcs,
@@ -627,17 +628,27 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 		drm_connector_helper_add(connector,
 					 &rockchip_lvds_connector_helper_funcs);
-
-		ret = drm_connector_attach_encoder(connector, encoder);
-		if (ret < 0) {
-			DRM_DEV_ERROR(drm_dev->dev,
-				      "failed to attach encoder: %d\n", ret);
-			goto err_free_connector;
-		}
 	} else {
-		ret = drm_bridge_attach(encoder, lvds->bridge, NULL, 0);
+		ret = drm_bridge_attach(encoder, lvds->bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			goto err_free_encoder;
+
+		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
+		if (IS_ERR(connector)) {
+			DRM_DEV_ERROR(drm_dev->dev,
+				      "failed to initialize bridge connector: %pe\n",
+				      connector);
+			ret = PTR_ERR(connector);
+			goto err_free_encoder;
+		}
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		DRM_DEV_ERROR(drm_dev->dev,
+			      "failed to attach encoder: %d\n", ret);
+		goto err_free_connector;
 	}
 
 	pm_runtime_enable(dev);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index d691d9bef8e7..09be9678f2bd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -27,6 +28,7 @@ struct rockchip_rgb {
 	struct drm_device *drm_dev;
 	struct drm_bridge *bridge;
 	struct drm_encoder encoder;
+	struct drm_connector connector;
 	int output_mode;
 };
 
@@ -80,6 +82,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	int ret = 0, child_count = 0;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	struct drm_connector *connector;
 
 	rgb = devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
 	if (!rgb)
@@ -142,12 +145,32 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 
 	rgb->bridge = bridge;
 
-	ret = drm_bridge_attach(encoder, rgb->bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, rgb->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		goto err_free_encoder;
 
+	connector = &rgb->connector;
+	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
+	if (IS_ERR(connector)) {
+		DRM_DEV_ERROR(drm_dev->dev,
+			      "failed to initialize bridge connector: %pe\n",
+			      connector);
+		ret = PTR_ERR(connector);
+		goto err_free_encoder;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		DRM_DEV_ERROR(drm_dev->dev,
+			      "failed to attach encoder: %d\n", ret);
+		goto err_free_connector;
+	}
+
 	return rgb;
 
+err_free_connector:
+	drm_connector_cleanup(connector);
 err_free_encoder:
 	drm_encoder_cleanup(encoder);
 	return ERR_PTR(ret);
@@ -157,6 +180,7 @@ EXPORT_SYMBOL_GPL(rockchip_rgb_init);
 void rockchip_rgb_fini(struct rockchip_rgb *rgb)
 {
 	drm_panel_bridge_remove(rgb->bridge);
+	drm_connector_cleanup(&rgb->connector);
 	drm_encoder_cleanup(&rgb->encoder);
 }
 EXPORT_SYMBOL_GPL(rockchip_rgb_fini);

base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
-- 
2.30.2

