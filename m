Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B264AD3B1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F7B10E55A;
	Tue,  8 Feb 2022 08:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842410E42F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:42:40 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id 10so5360348plj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhwLsKgmug/LRenPO4tfGgZqEWLMYU+fvdrOVAURH3s=;
 b=Vkl+vynjUM51RqMEm6hc747W8khYbhvL5/qYvEKRlmgrdaUW3Os9zs0yzSi/jaG+F0
 ZjQMv2fVx+TMavj/WOX1KvUW+Cm94gUvefnTe1HzIaWZbhMNTyHbhFtCgj66jqFb4CzX
 QOTw4Gp0OM2viucwhKZdwqXz6HkS3kdf2VGcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhwLsKgmug/LRenPO4tfGgZqEWLMYU+fvdrOVAURH3s=;
 b=CDLalrf0xMc9axp9H4Te5qOsxn0QSB71DoHjIq7WAQKV14dYl/FPAZquaMh1YhrwtW
 9vGqGor5n8sZkOTbBGyOuA40eHSWgmPiOIyuI5Z2+TGMBFps2AthLxuEz0L/Ekj9RQx+
 xnxJBj96yoqxwXH1UgbCTaCFQmE2ArqklgkzmDsO4SmYMqppCACZTMYSIJTqE8l7ueCU
 xQITonLI4JeGpnzrf65Jz6q0SXjhFvdOcqYdHklpVTvCcnsRgc8Uu7WCd4QYY9cXkiK6
 Ue2ufcT5s3XS96D1W0MqE4+iCF/lnA3gBB2r7aJzfFd5U4Vx0u66C2ZIRv3dQJmjQu02
 924Q==
X-Gm-Message-State: AOAM531boqnCVzITY0tH53x/UwVYigfc9kObApZtxRpu4kGDZDdDg0fB
 eqTAVctDPzPCst9qz7MOsACe9tYSOTVYVg==
X-Google-Smtp-Source: ABdhPJwzo+N00PLczwH8aUY/AY0oPF2jSOF6dGlpW/jQcDkmK7hKjrKYCbbfX5ATisM8Z14A9ENepg==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr143971pjb.213.1644309759797; 
 Tue, 08 Feb 2022 00:42:39 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id m14sm15362390pfc.170.2022.02.08.00.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 1/3] gpu: drm: separate panel orientation property creating
 and value setting
Date: Tue,  8 Feb 2022 16:42:32 +0800
Message-Id: <20220208084234.1684930-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dev_register() sets connector->registration_state to
DRM_CONNECTOR_REGISTERED and dev->registered to true. If
drm_connector_set_panel_orientation() is first called after
drm_dev_register(), it will fail several checks and results in following
warning.

Add a function to create panel orientation property and set default value
to UNKNOWN, so drivers can call this function to init the property earlier
, and let the panel set the real value later.

[    4.480976] ------------[ cut here ]------------
[    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
<snip>
[    4.609772] Call trace:
[    4.612208]  __drm_mode_object_add+0xb4/0xbc
[    4.616466]  drm_mode_object_add+0x20/0x2c
[    4.620552]  drm_property_create+0xdc/0x174
[    4.624723]  drm_property_create_enum+0x34/0x98
[    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
[    4.634716]  boe_panel_get_modes+0x88/0xd8
[    4.638802]  drm_panel_get_modes+0x2c/0x48
[    4.642887]  panel_bridge_get_modes+0x1c/0x28
[    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
[    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
[    4.658266]  drm_mode_getconnector+0x1b4/0x45c
[    4.662699]  drm_ioctl_kernel+0xac/0x128
[    4.666611]  drm_ioctl+0x268/0x410
[    4.670002]  drm_compat_ioctl+0xdc/0xf0
[    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
[    4.678436]  el0_svc_common+0xf4/0x1c0
[    4.682174]  do_el0_svc_compat+0x28/0x3c
[    4.686088]  el0_svc_compat+0x10/0x1c
[    4.689738]  el0_sync_compat_handler+0xa8/0xcc
[    4.694171]  el0_sync_compat+0x178/0x180
[    4.698082] ---[ end trace b4f2db9d9c88610b ]---
[    4.702721] ------------[ cut here ]------------
[    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
<snip>
[    4.833830] Call trace:
[    4.836266]  drm_object_attach_property+0x48/0xb8
[    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
[    4.846432]  boe_panel_get_modes+0x88/0xd8
[    4.850516]  drm_panel_get_modes+0x2c/0x48
[    4.854600]  panel_bridge_get_modes+0x1c/0x28
[    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
[    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
[    4.869978]  drm_mode_getconnector+0x1b4/0x45c
[    4.874410]  drm_ioctl_kernel+0xac/0x128
[    4.878320]  drm_ioctl+0x268/0x410
[    4.881711]  drm_compat_ioctl+0xdc/0xf0
[    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
[    4.890142]  el0_svc_common+0xf4/0x1c0
[    4.893879]  do_el0_svc_compat+0x28/0x3c
[    4.897791]  el0_svc_compat+0x10/0x1c
[    4.901441]  el0_sync_compat_handler+0xa8/0xcc
[    4.905873]  el0_sync_compat+0x178/0x180
[    4.909783] ---[ end trace b4f2db9d9c88610c ]---

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---
v7->v8:
- check if the prop is created to avoid leak issue when called multiple
  times.
- attempt to create prop in drm_connector_set_panel_orientation if prop
  is not created before, so driver don't need to call
  drm_connector_init_panel_orientation_property if they don't need to
  set the property earlier.
---
 drivers/gpu/drm/drm_connector.c | 62 ++++++++++++++++++++++++---------
 include/drm/drm_connector.h     |  2 ++
 2 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2fec..572ead7ac10690 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
  *	coordinates, so if userspace rotates the picture to adjust for
  *	the orientation it must also apply the same transformation to the
- *	touchscreen input coordinates. This property is initialized by calling
+ *	touchscreen input coordinates. This property value is set by calling
  *	drm_connector_set_panel_orientation() or
  *	drm_connector_set_panel_orientation_with_quirk()
  *
@@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
  * @connector: connector for which to set the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  *
- * This function sets the connector's panel_orientation and attaches
- * a "panel orientation" property to the connector.
+ * This function sets the connector's panel_orientation value. If the property
+ * doesn't exist, it will try to create one.
  *
  * Calling this function on a connector where the panel_orientation has
  * already been set is a no-op (e.g. the orientation has been overridden with
@@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
 	info->panel_orientation = panel_orientation;
 
 	prop = dev->mode_config.panel_orientation_property;
-	if (!prop) {
-		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
-				"panel orientation",
-				drm_panel_orientation_enum_list,
-				ARRAY_SIZE(drm_panel_orientation_enum_list));
-		if (!prop)
-			return -ENOMEM;
-
-		dev->mode_config.panel_orientation_property = prop;
-	}
+	if (!prop &&
+	    drm_connector_init_panel_orientation_property(connector) < 0)
+		return -ENOMEM;
 
-	drm_object_attach_property(&connector->base, prop,
-				   info->panel_orientation);
+	drm_object_property_set_value(&connector->base, prop,
+				      info->panel_orientation);
 	return 0;
 }
 EXPORT_SYMBOL(drm_connector_set_panel_orientation);
@@ -2393,7 +2386,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
 /**
  * drm_connector_set_panel_orientation_with_quirk - set the
  *	connector's panel_orientation after checking for quirks
- * @connector: connector for which to init the panel-orientation property.
+ * @connector: connector for which to set the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  * @width: width in pixels of the panel, used for panel quirk detection
  * @height: height in pixels of the panel, used for panel quirk detection
@@ -2420,6 +2413,43 @@ int drm_connector_set_panel_orientation_with_quirk(
 }
 EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
 
+/**
+ * drm_connector_init_panel_orientation_property -
+ * 	create the connector's panel orientation property
+ *
+ * This function attaches a "panel orientation" property to the connector
+ * and initializes its value to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
+ *
+ * The value of the property can be set by drm_connector_set_panel_orientation()
+ * or drm_connector_set_panel_orientation_with_quirk() later.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_init_panel_orientation_property(
+	struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if(dev->mode_config.panel_orientation_property)
+		return 0;
+
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
+			"panel orientation",
+			drm_panel_orientation_enum_list,
+			ARRAY_SIZE(drm_panel_orientation_enum_list));
+	if (!prop)
+		return -ENOMEM;
+
+	dev->mode_config.panel_orientation_property = prop;
+	drm_object_attach_property(&connector->base, prop,
+				   DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
+
 static const struct drm_prop_enum_list privacy_screen_enum[] = {
 	{ PRIVACY_SCREEN_DISABLED,		"Disabled" },
 	{ PRIVACY_SCREEN_ENABLED,		"Enabled" },
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 64cf5f88c05b6a..d3448a71bb4d85 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1798,6 +1798,8 @@ int drm_connector_set_panel_orientation_with_quirk(
 	struct drm_connector *connector,
 	enum drm_panel_orientation panel_orientation,
 	int width, int height);
+int drm_connector_init_panel_orientation_property(
+	struct drm_connector *connector);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
 void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
-- 
2.35.0.263.gb82422642f-goog

