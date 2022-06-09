Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E725444C9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B910FFEF;
	Thu,  9 Jun 2022 07:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0D10FFEF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:28:11 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id f9so9138367plg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EU3KV+nUfeIhuNF/Ro7jf0eLAkt330a3bAydA7XSi+w=;
 b=VqbUTr3H73qk7OZZz/TA+W+HpQdKZ3GSi8c1Gz+F66d9XD1DhQZtcZj9tYoGnBFCMH
 9jxzZQrJD2AuqpJhiITLGgJFsgqcH4cZdZ4DMvOA/HAXrFenxq9XEcffHdqI51W5b0+R
 vgKEqD5AT7EuudEvdhCxmhMR6bB4DJJnlMh60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EU3KV+nUfeIhuNF/Ro7jf0eLAkt330a3bAydA7XSi+w=;
 b=XikF1mz1MDOH3F36XPYyoHkt688qn4722/Fur4kjVfSDvltvgt25gVGkp86Icg1Gt2
 deY3UoobZUN1X/sHTL3YTZyGYel4wCTb4tRjJxZe+ouhnzLTuVIzrg7hAtWUrQ2XoF3Y
 gXE0I+nGGBUb5UTWbV36klNk9Cn1u00tFBnHnwu80Byl9luJLttzZ8XkuYdTu+ymxryV
 omvH0QDRN6qNaUz26us3aJv+q5jQysrhcbPSkDvYnZr3EgdLO+oXYmuVetvcGXFy2kbu
 UD+KxpOjs7AxNPDMxcvfXiaaJoHvVR5bysalvRd06TxA8H9cUi31K6zPaYa+0ia2mXMZ
 xsIw==
X-Gm-Message-State: AOAM532IEkLd/rylavznBaAs9Lgi6GoGC5v89TeAgcLbPLX5FiHJgWBa
 WMPYPWBEKdfP48/zsuhfhFh+5Q==
X-Google-Smtp-Source: ABdhPJx0y6DchLUvvk/yuIYEnoMtoscHMuzTnupHjzPr0+cwAebGuaRDhnVQTQoMdt/AcKvuivAq0Q==
X-Received: by 2002:a17:903:24f:b0:15c:e3b8:a640 with SMTP id
 j15-20020a170903024f00b0015ce3b8a640mr38088332plh.5.1654759691087; 
 Thu, 09 Jun 2022 00:28:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:28:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 8/8] drm: Config orientation property if panel provides it
Date: Thu,  9 Jun 2022 15:27:23 +0800
Message-Id: <20220609072722.3488207-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
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
v6->v7: remove redundant check and fix config issue.
---
 drivers/gpu/drm/bridge/panel.c         | 34 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c |  8 +++++-
 include/drm/drm_bridge.h               | 14 +++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 0ee563eb2b6f9..4277bf4f032be 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -170,6 +170,19 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.debugfs_init = panel_bridge_debugfs_init,
 };
 
+/**
+ * drm_bridge_is_panel - Checks if a drm_bridge is a panel_bridge.
+ *
+ * @bridge: The drm_bridge to be checked.
+ *
+ * Returns true if the bridge is a panel bridge, or false otherwise.
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
@@ -269,6 +282,27 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 
+/**
+ * drm_panel_bridge_set_orientation - Set the connector's panel orientation
+ * from the bridge that can be transformed to panel bridge.
+ *
+ * @connector: The connector to be set panel orientation.
+ * @bridge: The drm_bridge to be transformed to panel bridge.
+ *
+ * Returns 0 on success, negative errno on failure.
+ */
+int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+				     struct drm_bridge *bridge)
+{
+	struct panel_bridge *panel_bridge;
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
index 6b3dad03d77d0..1c7d936523df5 100644
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
index f27b4060faa2f..bd11bbe5e9b33 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -917,16 +917,30 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
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
 						   struct drm_panel *panel,
 						   u32 connector_type);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+#else
+static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
+{
+	return false;
+}
+
+static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
+						   struct drm_bridge *bridge)
+{
+	return -EINVAL;
+}
 #endif
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
-- 
2.36.1.255.ge46751e96f-goog

