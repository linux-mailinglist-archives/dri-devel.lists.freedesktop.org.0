Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23AA3928BF
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033C6ED8F;
	Thu, 27 May 2021 07:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899556EDA6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:42:10 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 22so2989904pfv.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iKoyZrvsFP6hj+sTecEKs84BWsddp7iyyNAfS5YrByY=;
 b=K2es2FAtpGv9fegvJdeh5YP/A0RC9TqvE4FiUuLQ+d2zmZAPotE3JnwGCLTnpT2oJO
 pTLqwj//EAA5370QnKt5idZr716DsDeIAwj1bCoAhRQhnmQI0DN7wgyP7autSDSLQ/ZA
 yCwkrVajawz3Iir7PKF7uzIzNHgfb1o+PerWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iKoyZrvsFP6hj+sTecEKs84BWsddp7iyyNAfS5YrByY=;
 b=N5qtuwPCEeRRX+wPDoI9e76vAXWZKr+gbMUqQokd7ijSWAq3tQAMApGSZBGAJ7f2MJ
 4s4hjfmyBoJLvNvWJ6ENar3aqS/AKnhIEBuX+CRlaH2lqokyY7YGYuOlapHAzzl/IT40
 cWuYSYT/igqwmMVMlivwK71DvTMA4ojpMRgoWFo56k2mFX2DxnxOR8ngtIkAIirB9xN4
 FHxjQq178PqsTlR18W+aDLT/TnxSujKGzKarT118TLhVQj6n4b9TB5YEZ5P4iM4Qku2U
 Gx15OnaRWQ61MdpW3WZLeDbYXIZsI1TcDjWpeYvdNSRg/qEzhffwBVUZfeSj6sw4Tw09
 IG1g==
X-Gm-Message-State: AOAM533e4vsHimyNk/ZLt2Dot9bQ0NBjqBY6utvMrA5TmEpGTdWhtOYa
 GA7RodXCinATsj5AtUhDFeR+aI3U0Nr8rQ==
X-Google-Smtp-Source: ABdhPJyh8VQ7P/mYb4jkCg+CyiZPlNFyGqOdhZl1TfgjEhu4HrLCi0thLRH2AAf5Ehe9ojNiLBlGIQ==
X-Received: by 2002:a05:6a00:7c5:b029:2e8:d5f5:9677 with SMTP id
 n5-20020a056a0007c5b02902e8d5f59677mr2488009pfu.68.1622101329884; 
 Thu, 27 May 2021 00:42:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id h24sm1184857pfn.180.2021.05.27.00.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:42:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 RESEND 1/3] gpu: drm: separate panel orientation property
 creating and value setting
Date: Thu, 27 May 2021 15:42:00 +0800
Message-Id: <20210527074202.1706724-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Robert Foss <robert.foss@linaro.org>,
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
 drivers/gpu/drm/drm_connector.c         | 58 ++++++++++++++++++-------
 drivers/gpu/drm/i915/display/icl_dsi.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c |  1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c  |  1 +
 include/drm/drm_connector.h             |  2 +
 5 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..7189baaabf41 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1210,7 +1210,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
  *	coordinates, so if userspace rotates the picture to adjust for
  *	the orientation it must also apply the same transformation to the
- *	touchscreen input coordinates. This property is initialized by calling
+ *	touchscreen input coordinates. This property value is set by calling
  *	drm_connector_set_panel_orientation() or
  *	drm_connector_set_panel_orientation_with_quirk()
  *
@@ -2173,8 +2173,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
  * @connector: connector for which to set the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  *
- * This function sets the connector's panel_orientation and attaches
- * a "panel orientation" property to the connector.
+ * This function sets the connector's panel_orientation value. If the property
+ * doesn't exist, it will return an error.
  *
  * Calling this function on a connector where the panel_orientation has
  * already been set is a no-op (e.g. the orientation has been overridden with
@@ -2205,19 +2205,11 @@ int drm_connector_set_panel_orientation(
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
+	if (WARN_ON(!prop))
+		return -EINVAL;
 
-	drm_object_attach_property(&connector->base, prop,
-				   info->panel_orientation);
+	drm_object_property_set_value(&connector->base, prop,
+				      info->panel_orientation);
 	return 0;
 }
 EXPORT_SYMBOL(drm_connector_set_panel_orientation);
@@ -2225,7 +2217,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
 /**
  * drm_connector_set_panel_orientation_with_quirk -
  *	set the connector's panel_orientation after checking for quirks
- * @connector: connector for which to init the panel-orientation property.
+ * @connector: connector for which to set the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  * @width: width in pixels of the panel, used for panel quirk detection
  * @height: height in pixels of the panel, used for panel quirk detection
@@ -2252,6 +2244,40 @@ int drm_connector_set_panel_orientation_with_quirk(
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
 int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 				    struct drm_property *property,
 				    uint64_t value)
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 9282978060b0..5ac4538e4283 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1903,6 +1903,7 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
 
 	connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+	drm_connector_init_panel_orientation_property(&connector->base);
 	drm_connector_set_panel_orientation_with_quirk(&connector->base,
 				intel_dsi_get_panel_orientation(connector),
 				connector->panel.fixed_mode->hdisplay,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a5231ac3443a..f1d664e5abb2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5263,6 +5263,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_panel_setup_backlight(connector, pipe);
 
 	if (fixed_mode) {
+		drm_connector_init_panel_orientation_property(connector);
 		drm_connector_set_panel_orientation_with_quirk(connector,
 				dev_priv->vbt.orientation,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 9bee99fe5495..853855482af1 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1632,6 +1632,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
 
 		connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
+		drm_connector_init_panel_orientation_property(&connector->base);
 		drm_connector_set_panel_orientation_with_quirk(
 				&connector->base,
 				intel_dsi_get_panel_orientation(connector),
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1922b278ffad..4396c1c4a5db 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1696,6 +1696,8 @@ int drm_connector_set_panel_orientation_with_quirk(
 	struct drm_connector *connector,
 	enum drm_panel_orientation panel_orientation,
 	int width, int height);
+int drm_connector_init_panel_orientation_property(
+	struct drm_connector *connector);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
 
-- 
2.31.1.818.g46aad6cb9e-goog

