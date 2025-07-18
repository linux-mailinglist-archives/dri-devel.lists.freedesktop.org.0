Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70BB0AAA8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 21:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E1610EA34;
	Fri, 18 Jul 2025 19:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XCFzNfmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395BC10EA31;
 Fri, 18 Jul 2025 19:21:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 992F95C6979;
 Fri, 18 Jul 2025 19:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2D5C4CEF6;
 Fri, 18 Jul 2025 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752866458;
 bh=MXulk40WrhMSfazklRDPLjWyPsn6UWw3jWMMvJXWmOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XCFzNfmMezrfQRDTjlp5orhJKg3OKglOd1+hWvCjAoqIp1Om/75oXrNes/VdfvI5Y
 jiqg4Ukfep/aOs5jyiIXXMwrTkfplevEbAoddgRDvd2SwNs4lPFSz7d8R2EE8g8HeA
 GrC08hVoP1+mh74skKlrcg3hHGeWsgOW9AZo1UII2mVz7daUW0Ukq5X4H23jzIRPho
 m8JVi+pJlJB40l8wK89Pqzw8IVV7mEaQ/XYAuFXjKfJY89T/q3Z2sjfpWMuVYLxs8I
 Rs9eF2ibGyqEY0+Na4X+4MtjZwNlS29bogg+pV3l0S63p4RkbH2kzcFMbJOXR4XFz/
 skcjeBgnHiixQ==
From: Mario Limonciello <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH v6 1/1] drm/amd: Re-introduce property to control adaptive
 backlight modulation
Date: Fri, 18 Jul 2025 14:20:45 -0500
Message-ID: <20250718192045.2091650-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718192045.2091650-1-superm1@kernel.org>
References: <20250718192045.2091650-1-superm1@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

commit 0887054d14ae2 ("drm/amd: Drop abm_level property") dropped the
abm level property in favor of sysfs control. Since then there have
been discussions that compositors showed an interest in modifying
a vendor specific property instead.

So re-introduce the abm level property, but with different semantics.
Rather than being an integer it's now an enum. One of the enum options
is 'sysfs', and that is because there is still a sysfs file for use by
userspace when the compositor doesn't support this property.

If usespace has not modified this property, the default value will
be for sysfs to control it. Once userspace has set the property stop
allowing sysfs control.

The property is only attached to non-OLED eDP panels.

Cc: Xaver Hugl <xaver.hugl@kde.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 60 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  7 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 39 +++++++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 5 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 35c778426a7c7..f061f63e31993 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1363,6 +1363,64 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
 	{ AMDGPU_FMT_DITHER_ENABLE, "on" },
 };
 
+/**
+ * DOC: property for adaptive backlight modulation
+ *
+ * The 'adaptive backlight modulation' property is used for the compositor to
+ * directly control the adaptive backlight modulation power savings feature
+ * that is part of DCN hardware.
+ *
+ * The property will be attached specifically to eDP panels that support it.
+ *
+ * The property is by default set to 'sysfs' to allow the sysfs file 'panel_power_savings'
+ * to be able to control it.
+ * If set to 'off' the compositor will ensure it stays off.
+ * The other values 'min', 'bias min', 'bias max', and 'max' will control the
+ * intensity of the power savings.
+ *
+ * Modifying this value can have implications on color accuracy, so tread
+ * carefully.
+ */
+static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
+{
+	const struct drm_prop_enum_list props[] = {
+		{ ABM_SYSFS_CONTROL, "sysfs" },
+		{ ABM_LEVEL_OFF, "off" },
+		{ ABM_LEVEL_MIN, "min" },
+		{ ABM_LEVEL_BIAS_MIN, "bias min" },
+		{ ABM_LEVEL_BIAS_MAX, "bias max" },
+		{ ABM_LEVEL_MAX, "max" },
+	};
+	struct drm_property *prop;
+	int i;
+
+	if (!adev->dc_enabled)
+		return 0;
+
+	prop = drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENUM,
+				"adaptive backlight modulation",
+				6);
+	if (!prop)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(props); i++) {
+		int ret;
+
+		ret = drm_property_add_enum(prop, props[i].type,
+						props[i].name);
+
+		if (ret) {
+			drm_property_destroy(adev_to_drm(adev), prop);
+
+			return ret;
+		}
+	}
+
+	adev->mode_info.abm_level_property = prop;
+
+	return 0;
+}
+
 int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 {
 	int sz;
@@ -1409,7 +1467,7 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
-	return 0;
+	return amdgpu_display_setup_abm_prop(adev);
 }
 
 void amdgpu_display_update_priority(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
index dfa0d642ac161..2b1536a167527 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
@@ -54,4 +54,11 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
 int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
 				      struct drm_scanout_buffer *sb);
 
+#define ABM_SYSFS_CONTROL	-1
+#define ABM_LEVEL_OFF		0
+#define ABM_LEVEL_MIN		1
+#define ABM_LEVEL_BIAS_MIN	2
+#define ABM_LEVEL_BIAS_MAX	3
+#define ABM_LEVEL_MAX		4
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 6da4f946cac00..169bc667572e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -326,6 +326,8 @@ struct amdgpu_mode_info {
 	struct drm_property *audio_property;
 	/* FMT dithering */
 	struct drm_property *dither_property;
+	/* Adaptive Backlight Modulation (power feature) */
+	struct drm_property *abm_level_property;
 	/* hardcoded DFP edid from BIOS */
 	const struct drm_edid *bios_hardcoded_edid;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 928f61f972a1f..4025575d2f536 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5042,6 +5042,7 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
 static void setup_backlight_device(struct amdgpu_display_manager *dm,
 				   struct amdgpu_dm_connector *aconnector)
 {
+	struct amdgpu_dm_backlight_caps *caps;
 	struct dc_link *link = aconnector->dc_link;
 	int bl_idx = dm->num_of_edps;
 
@@ -5061,6 +5062,13 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
 	dm->num_of_edps++;
 
 	update_connector_ext_caps(aconnector);
+	caps = &dm->backlight_caps[aconnector->bl_idx];
+
+	/* Only offer ABM property when non-OLED and user didn't turn off by module parameter */
+	if (!caps->ext_caps->bits.oled && amdgpu_dm_abm_level < 0)
+		drm_object_attach_property(&aconnector->base.base,
+					   dm->adev->mode_info.abm_level_property,
+					   ABM_SYSFS_CONTROL);
 }
 
 static void amdgpu_set_panel_orientation(struct drm_connector *connector);
@@ -7122,6 +7130,20 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
+	} else if (property == adev->mode_info.abm_level_property) {
+		switch (val) {
+		case ABM_SYSFS_CONTROL:
+			dm_new_state->abm_sysfs_forbidden = false;
+			break;
+		case ABM_LEVEL_OFF:
+			dm_new_state->abm_sysfs_forbidden = true;
+			dm_new_state->abm_level = ABM_LEVEL_IMMEDIATE_DISABLE;
+			break;
+		default:
+			dm_new_state->abm_sysfs_forbidden = true;
+			dm_new_state->abm_level = val;
+		};
+		ret = 0;
 	}
 
 	return ret;
@@ -7164,6 +7186,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
+	} else if (property == adev->mode_info.abm_level_property) {
+		if (!dm_state->abm_sysfs_forbidden)
+			*val = ABM_SYSFS_CONTROL;
+		else
+			*val = (dm_state->abm_level != ABM_LEVEL_IMMEDIATE_DISABLE) ?
+				dm_state->abm_level : 0;
+		ret = 0;
 	}
 
 	return ret;
@@ -7216,10 +7245,16 @@ static ssize_t panel_power_savings_store(struct device *device,
 		return -EINVAL;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	to_dm_connector_state(connector->state)->abm_level = val ?:
-		ABM_LEVEL_IMMEDIATE_DISABLE;
+	if (to_dm_connector_state(connector->state)->abm_sysfs_forbidden)
+		ret = -EBUSY;
+	else
+		to_dm_connector_state(connector->state)->abm_level = val ?:
+			ABM_LEVEL_IMMEDIATE_DISABLE;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
+	if (ret)
+		return ret;
+
 	drm_kms_helper_hotplug_event(dev);
 
 	return count;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 0b964bfdd4a55..5a38373e054a8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -969,6 +969,7 @@ struct dm_connector_state {
 	bool underscan_enable;
 	bool freesync_capable;
 	bool update_hdcp;
+	bool abm_sysfs_forbidden;
 	uint8_t abm_level;
 	int vcpi_slots;
 	uint64_t pbn;
-- 
2.43.0

