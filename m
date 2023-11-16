Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4287EE7CD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA5C10E6A5;
	Thu, 16 Nov 2023 19:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B8310E69D;
 Thu, 16 Nov 2023 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CPStpgViIZFSCXrvQ1MTujUVqj1ovPogtMOsCIp5vEQ=; b=Y0CRAlo1FHU3EDGWskDcp7d8f1
 d24yZ/EKPYNb/0XHYF091on608srKI9K3kcPn+T2FFl6qAfTmVOOqAHtKPaYGBaPveeq6K6505Cmh
 NiPfCxLzuacFgnQWRXM7N5eY/mjf9CprkjGyC30WQmMR0gZrcw66aOg2gXW+n2a8591u8uKglFh0i
 nReFeVn8aVZl1uid8Ado5r5nPtB+kOaSNZo7H5jxdNtIcUczVS/8m8rOqvJ4V+3v44Wj+aHuvuWzT
 bZ1f2MXwWRsXkK+/E6J5cJ/31W/tHpZ7chVH2hJ+qk+u788hQ13BoL+oevWPk6CY24/t0H9n9nPUK
 qodNfUxA==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVP-0048Yy-EZ; Thu, 16 Nov 2023 20:58:27 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 05/32] drm/amd/display: add plane degamma TF
 driver-specific property
Date: Thu, 16 Nov 2023 18:57:45 -0100
Message-Id: <20231116195812.906115-6-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Allow userspace to tell the kernel driver the input space and,
therefore, uses correct predefined transfer function (TF) to go from
encoded values to linear values.

v2:
- rename TF enum prefix from DRM_ to AMDGPU_ (Harry)
- remove HLG TF

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  5 +++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 21 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 19 +++++++++++++++--
 4 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 13efb12edbcf..50572fe27ab0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -355,6 +355,11 @@ struct amdgpu_mode_info {
 	 * size of degamma LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *plane_degamma_lut_size_property;
+	/**
+	 * @plane_degamma_tf_property: Plane pre-defined transfer function to
+	 * to go from scanout/encoded values to linear values.
+	 */
+	struct drm_property *plane_degamma_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 0eafbf00505b..ab89538d5663 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -716,6 +716,18 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 
 extern const struct amdgpu_ip_block_version dm_ip_block;
 
+enum amdgpu_transfer_function {
+	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
+	AMDGPU_TRANSFER_FUNCTION_SRGB,
+	AMDGPU_TRANSFER_FUNCTION_BT709,
+	AMDGPU_TRANSFER_FUNCTION_PQ,
+	AMDGPU_TRANSFER_FUNCTION_LINEAR,
+	AMDGPU_TRANSFER_FUNCTION_UNITY,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
+};
+
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
@@ -729,6 +741,13 @@ struct dm_plane_state {
 	 * The blob (if not NULL) is an array of &struct drm_color_lut.
 	 */
 	struct drm_property_blob *degamma_lut;
+	/**
+	 * @degamma_tf:
+	 *
+	 * Predefined transfer function to tell DC driver the input space to
+	 * linearize.
+	 */
+	enum amdgpu_transfer_function degamma_tf;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 421af919387f..8e02d2b1249d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -85,6 +85,18 @@ void amdgpu_dm_init_color_mod(void)
 }
 
 #ifdef AMD_PRIVATE_COLOR
+static const struct drm_prop_enum_list amdgpu_transfer_function_enum_list[] = {
+	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
+	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
+	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
+	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
+	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
+	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
+	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
+	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
+	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
+};
+
 int
 amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 {
@@ -105,6 +117,15 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_lut_size_property = prop;
 
+	prop = drm_property_create_enum(adev_to_drm(adev),
+					DRM_MODE_PROP_ENUM,
+					"AMD_PLANE_DEGAMMA_TF",
+					amdgpu_transfer_function_enum_list,
+					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_degamma_tf_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index b1e50cfa9f83..d5e12e05d161 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1337,8 +1337,11 @@ static void amdgpu_dm_plane_drm_plane_reset(struct drm_plane *plane)
 	amdgpu_state = kzalloc(sizeof(*amdgpu_state), GFP_KERNEL);
 	WARN_ON(amdgpu_state == NULL);
 
-	if (amdgpu_state)
-		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
+	if (!amdgpu_state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
+	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 }
 
 static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct drm_plane *plane)
@@ -1361,6 +1364,8 @@ static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct
 		dm_plane_state->degamma_lut =
 			drm_property_blob_get(old_dm_plane_state->degamma_lut);
 
+	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
+
 	return &dm_plane_state->base;
 }
 
@@ -1455,6 +1460,9 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 		drm_object_attach_property(&plane->base,
 					   mode_info.plane_degamma_lut_size_property,
 					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_degamma_tf_property,
+					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
 	}
 }
 
@@ -1477,6 +1485,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == adev->mode_info.plane_degamma_tf_property) {
+		if (dm_plane_state->degamma_tf != val) {
+			dm_plane_state->degamma_tf = val;
+			dm_plane_state->base.color_mgmt_changed = 1;
+		}
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -1500,6 +1513,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 	if (property == adev->mode_info.plane_degamma_lut_property) {
 		*val = (dm_plane_state->degamma_lut) ?
 			dm_plane_state->degamma_lut->base.id : 0;
+	} else if (property == adev->mode_info.plane_degamma_tf_property) {
+		*val = dm_plane_state->degamma_tf;
 	} else {
 		return -EINVAL;
 	}
-- 
2.40.1

