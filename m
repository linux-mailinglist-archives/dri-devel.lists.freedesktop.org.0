Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB40542BED
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB610E47F;
	Wed,  8 Jun 2022 09:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D379810E549
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:47 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id h192so11622936pgc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEB2zHdExy2JKoB2FnnXWzAZLyF7rSGKqnEw/8nOqCs=;
 b=BFMw6WULQCXhZ0tMZpRPApSUFdvzdpcdbu7DQ5CIROH9eKmlQdSvTvQvryO95/iwNh
 KjlKG2uLJlvDV3lsqovmLOB1RgNHoYkLjGCexXy9vCymrGL+byGXwuwL9r0yXNb0mdcf
 mXOpu12iRggJxkgYZEBDa+j0NDJ2POeM1/G5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEB2zHdExy2JKoB2FnnXWzAZLyF7rSGKqnEw/8nOqCs=;
 b=l6an+uHj9IQyxYCF6nT2wBZX7JLsqKbJR2fjPc4I6YiKXvp7J1Q3crVpmsvxES8wha
 oKR+Ze/DobQTaTaOaaoAWuOU79E4ks1U/K8Une3TTC7Fhyn0Gu0YAzl6Ugx2Op7AYkRU
 ijiz9dE7k3+V1jBLyWliqmTOrivytNbMAQPze30rLbB7dVlHsAAh1X8O+mMeoqBbb3Ih
 jU+DZvBP48z81LbSheKmWKF5o6KWl1CruVWauqPNwyWjH2Jwy+dMzQOA0ZVKs94wBxSQ
 unaRGNpUKpe9SFrLzlWNCVi4o8l6aeELEtmXPtOsJ3QSTA/hfEUUQnB8eyWrH8Nso/qy
 m5Lg==
X-Gm-Message-State: AOAM533s7gcmy+UBtRLqlot0nQzsUqjtpD3pxMNSf9deFRNGbwUHP0g4
 ilRX2CGTJr4oSx1upqJM6Mmvw6k/WZshqg==
X-Google-Smtp-Source: ABdhPJx3PhU71x1q1DzxQGfjWbLB3CXS9FckTrvMBw6DjrgI8cNdYqfg0cuniygWSY3E6OgqeEJ2xg==
X-Received: by 2002:a63:8a44:0:b0:3fc:a1f8:806d with SMTP id
 y65-20020a638a44000000b003fca1f8806dmr29776837pgd.363.1654681727327; 
 Wed, 08 Jun 2022 02:48:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:46 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 8/8] drm: Config orientation property if panel provides it
Date: Wed,  8 Jun 2022 17:48:16 +0800
Message-Id: <20220608094816.2898692-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608094816.2898692-1-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel orientation property should be set before drm_dev_register().
Some drm driver calls drm_dev_register() in .bind(). However, most
panels sets orientation property relatively late, mostly in .get_modes()
callback, since this is when they are able to get the connector and
binds the orientation property to it, though the value should be known
when the panel is probed.

In drm_bridge_connector_init(), if a bridge is a panel bridge, use it to
set the connector's panel orientation property.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v5->v6:
mtk_dsi is using panel bridge, we don't need to obtain the panel in
mtk_dsi. Instead, drm_connector_set_orientation_from_panel() can be
called from drm_bridge_connector_init().
---
 drivers/gpu/drm/bridge/panel.c         | 36 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c |  8 +++++-
 include/drm/drm_bridge.h               |  3 +++
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 0ee563eb2b6f..53c98cba719b 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -170,6 +170,17 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.debugfs_init = panel_bridge_debugfs_init,
 };
 
+/**
+ * drm_bridge_is_panel - Checks if a drm_bridge is a panel_bridge.
+ *
+ * @bridge: The drm_bridge to be checked.
+ */
+bool drm_bridge_is_panel(const struct drm_bridge *bridge)
+{
+	return bridge->funcs == &panel_bridge_bridge_funcs;
+}
+EXPORT_SYMBOL(drm_bridge_is_panel);
+
 /**
  * drm_panel_bridge_add - Creates a &drm_bridge and &drm_connector that
  * just calls the appropriate functions from &drm_panel.
@@ -269,6 +280,31 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 
+/**
+ * drm_panel_bridge_set_orientation - Set the connector's panel orientation
+ * if the bridge is a panel bridge.
+ *
+ * @connector: The connector to be set panel orientation.
+ * @bridge: The drm_bridge to be transformed to panel bridge.
+ */
+int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+				     struct drm_bridge *bridge)
+{
+	struct panel_bridge *panel_bridge;
+
+	if (!bridge)
+		return 0;
+
+	if (bridge->funcs != &panel_bridge_bridge_funcs)
+		return 0;
+
+	panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+	return drm_connector_set_orientation_from_panel(connector,
+							panel_bridge->panel);
+}
+EXPORT_SYMBOL(drm_panel_bridge_set_orientation);
+
 static void devm_drm_panel_bridge_release(struct device *dev, void *res)
 {
 	struct drm_bridge **bridge = res;
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 6b3dad03d77d..1c7d936523df 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -331,7 +331,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge, *panel_bridge = NULL;
 	int connector_type;
 
 	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
@@ -373,6 +373,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 		if (bridge->ddc)
 			ddc = bridge->ddc;
+
+		if (drm_bridge_is_panel(bridge))
+			panel_bridge = bridge;
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown) {
@@ -392,6 +395,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
+	if (panel_bridge)
+		drm_panel_bridge_set_orientation(connector, panel_bridge);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index f27b4060faa2..b0691d728139 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -917,10 +917,13 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
+bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 					      u32 connector_type);
 void drm_panel_bridge_remove(struct drm_bridge *bridge);
+int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+                                     struct drm_bridge *bridge);
 struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel);
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
-- 
2.36.1.255.ge46751e96f-goog

