Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6B777D39
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183D10E564;
	Thu, 10 Aug 2023 16:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903910E572;
 Thu, 10 Aug 2023 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/6whw1ahexxrgci80vTVJZ0ceFsURZjWGMkpFZPupeI=; b=HpjUhzZ7JQ0gQrZvyVfkL6IY5+
 2nsqMfXu681txUmO1Bh5w8bgbZOul90XHMNQirfpjqrWaRN8OzsnohQQiNjs64NpMZ7NvoZSz7Rwh
 XvAeF1cE5fNLfBybQTcha00jA+53AajuX8wVeMVWtO+aARBtt9Mo8gGGDWkHxBh2ucyT2wCViIgq6
 QlUuyKKuAKAealuFSKyNLqvHKgG+XshSnG02OGAnz46cTpYRW2FWrv+5qbr2kVvXqh/XUnZ7FfcmA
 Cz3fMpLqSBPhnAdUir0iIsfHmKIRcSQ6EXxVW/Hj/HvUNiVGLTjlJ9DiiO98Q7Ld1ex2PQqFVzf0E
 sjX3XCkw==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU88G-00GjYD-V6; Thu, 10 Aug 2023 18:03:29 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 05/34] drm/amd/display: add driver-specific property for
 plane degamma LUT
Date: Thu, 10 Aug 2023 15:02:45 -0100
Message-Id: <20230810160314.48225-6-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hook up driver-specific atomic operations for managing AMD color
properties. Create AMD driver-specific color management properties
and attach them according to HW capabilities defined by `struct
dc_color_caps`.

First add plane degamma LUT properties that means user-blob and its
size. We will add more plane color properties in the next patches. In
addition, we define AMD_PRIVATE_COLOR to guard these driver-specific
plane properties.

Plane degamma can be used to linearize input space for arithmetical
operations that are more accurate when applied in linear color.

v2:
- update degamma LUT prop description
- move private color operations from amdgpu_display to amdgpu_dm_color

Co-developed-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 11 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 11 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 24 ++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 81 +++++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 32fe05c810c6..ec4621deac8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -343,6 +343,17 @@ struct amdgpu_mode_info {
 	int			disp_priority;
 	const struct amdgpu_display_funcs *funcs;
 	const enum drm_plane_type *plane_type;
+
+	/* Driver-private color mgmt props */
+
+	/* @plane_degamma_lut_property: Plane property to set a degamma LUT to
+	 * convert input space before blending.
+	 */
+	struct drm_property *plane_degamma_lut_property;
+	/* @plane_degamma_lut_size_property: Plane property to define the max
+	 * size of degamma LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_degamma_lut_size_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dffa584410a5..77b4d671a9e0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3949,6 +3949,11 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 		return r;
 	}
 
+#ifdef AMD_PRIVATE_COLOR
+	if (amdgpu_dm_create_color_properties(adev))
+		return -ENOMEM;
+#endif
+
 	r = amdgpu_dm_audio_init(adev);
 	if (r) {
 		dc_release_state(state->context);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index a2d34be82613..f0343bbf0fe1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -719,6 +719,16 @@ extern const struct amdgpu_ip_block_version dm_ip_block;
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
+
+	/* Plane color mgmt */
+	/**
+	 * @degamma_lut:
+	 *
+	 * 1D LUT for mapping framebuffer/plane pixel data before sampling or
+	 * blending operations. It's usually applied to linearize input space.
+	 * The blob (if not NULL) is an array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *degamma_lut;
 };
 
 struct dm_crtc_state {
@@ -809,6 +819,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
 
 void amdgpu_dm_init_color_mod(void);
+int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a4cb23d059bd..cf175b86ba80 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -84,6 +84,30 @@ void amdgpu_dm_init_color_mod(void)
 	setup_x_points_distribution();
 }
 
+#ifdef AMD_PRIVATE_COLOR
+int
+amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_DEGAMMA_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_degamma_lut_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_PLANE_DEGAMMA_LUT_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_degamma_lut_size_property = prop;
+
+	return 0;
+}
+#endif
+
 /**
  * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
  * @blob: DRM color mgmt property blob
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8eeca160d434..488012d1558d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1347,6 +1347,9 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		dc_plane_state_retain(dm_plane_state->dc_state);
 	}
 
+	if (dm_plane_state->degamma_lut)
+		drm_property_blob_get(dm_plane_state->degamma_lut);
+
 	return &dm_plane_state->base;
 }
 
@@ -1414,12 +1417,83 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
 
+	if (dm_plane_state->degamma_lut)
+		drm_property_blob_put(dm_plane_state->degamma_lut);
+
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
 
 	drm_atomic_helper_plane_destroy_state(plane, state);
 }
 
+#ifdef AMD_PRIVATE_COLOR
+static void
+dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
+					     struct drm_plane *plane)
+{
+	struct amdgpu_mode_info mode_info = dm->adev->mode_info;
+	struct dpp_color_caps dpp_color_caps = dm->dc->caps.color.dpp;
+
+	/* Check HW color pipeline capabilities for DPP (pre-blending) before expose*/
+	if (dpp_color_caps.dgam_ram || dpp_color_caps.gamma_corr) {
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_degamma_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_degamma_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
+	}
+}
+
+static int
+dm_atomic_plane_set_property(struct drm_plane *plane,
+			     struct drm_plane_state *state,
+			     struct drm_property *property,
+			     uint64_t val)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	bool replaced = false;
+	int ret;
+
+	if (property == adev->mode_info.plane_degamma_lut_property) {
+		ret = drm_property_replace_blob_from_id(plane->dev,
+							&dm_plane_state->degamma_lut,
+							val,
+							-1, sizeof(struct drm_color_lut),
+							&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
+	} else {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
+			       plane->base.id, plane->name,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+dm_atomic_plane_get_property(struct drm_plane *plane,
+			     const struct drm_plane_state *state,
+			     struct drm_property *property,
+			     uint64_t *val)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+
+	if (property == adev->mode_info.plane_degamma_lut_property) {
+		*val = (dm_plane_state->degamma_lut) ?
+			dm_plane_state->degamma_lut->base.id : 0;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+#endif
+
 static const struct drm_plane_funcs dm_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -1428,6 +1502,10 @@ static const struct drm_plane_funcs dm_plane_funcs = {
 	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
 	.atomic_destroy_state = dm_drm_plane_destroy_state,
 	.format_mod_supported = dm_plane_format_mod_supported,
+#ifdef AMD_PRIVATE_COLOR
+	.atomic_set_property = dm_atomic_plane_set_property,
+	.atomic_get_property = dm_atomic_plane_get_property,
+#endif
 };
 
 int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
@@ -1498,6 +1576,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
 
+#ifdef AMD_PRIVATE_COLOR
+	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#endif
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.40.1

