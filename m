Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA670E8D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE57410E515;
	Tue, 23 May 2023 22:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E61110E508;
 Tue, 23 May 2023 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eCwiILJvNeW4om6BYpiRfbAeGMM/qsCRpGz31fUSiN8=; b=GF8bcGOnQCJuCKj4IuuVtEpa9Y
 gyPOPRabHNjmY2iO3Bk2p9etM7k6CGf76WN3rT5RTeMEwfG88oGMIVbeaTUj5Hg3stJHkRdmqNg2E
 ZxeV4ex4xYCwLVwjiwUeeWwuo0d+yr30TIbkjZXA+c4BlfE4iRtfFKTb8mKhgNORkXu2pN1MSPi67
 OY+ZMdG8jlpJDQ3PkElynM0SOeVLQ43Vd8cDrYU1OdmnZn0ByzOWg+AN6tHX/kuIxRx5cJg/Qq8V0
 b9o2UqOIVOi1qevw374oZ/A+mGeLLV7LW7yqseDP0+J5hS++dwMYi7esTIF62U9QcRH+Pj5O7RX5Z
 1vXNqvow==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIB-00HEOv-4X; Wed, 24 May 2023 00:15:43 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 13/36] drm/amd/display: add plane blend LUT and TF
 driver-specific properties
Date: Tue, 23 May 2023 21:14:57 -0100
Message-Id: <20230523221520.3115570-14-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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

Blend 1D LUT or a predefined transfer function can be set to linearize
content before blending, so that it's positioned just before blending
planes in the AMD color mgmt pipeline, and after 3D LUT (non-linear
space). Shaper and Blend LUTs are 1D LUTs that sandwich 3D LUT. Drivers
should advertize blend properties according to HW caps.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 23 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 18 ++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 36 +++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index d52bed00bbdb..193e453beedf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1341,6 +1341,29 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_lut3d_size_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_BLEND_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_blend_lut_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_PLANE_BLEND_LUT_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_blend_lut_size_property = prop;
+
+	prop = drm_property_create_enum(adev_to_drm(adev),
+					DRM_MODE_PROP_ENUM,
+					"AMD_PLANE_BLEND_TF",
+					drm_transfer_function_enum_list,
+					ARRAY_SIZE(drm_transfer_function_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_blend_tf_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index a41c3a39c367..69dd1ae068c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -395,6 +395,24 @@ struct amdgpu_mode_info {
 	 * size of 3D LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *plane_lut3d_size_property;
+	/**
+	 * @plane_blend_lut_property: Plane property for output gamma before
+	 * blending. Userspace set a blend LUT to convert colors after 3D LUT
+	 * conversion. It works as a post-3D LUT 1D LUT, with shaper LUT, they
+	 * are sandwiching 3D LUT with two 1D LUT.
+	 */
+	struct drm_property *plane_blend_lut_property;
+	/**
+	 * @plane_blend_lut_size_property: Plane property to define the max
+	 * size of blend LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_blend_lut_size_property;
+	/**
+	 * @plane_blend_tf_property: Plane property to set a predefined
+	 * transfer function for pre-blending blend (before applying 3D LUT)
+	 * with or without LUT.
+	 */
+	struct drm_property *plane_blend_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 663ffc7d648e..ac430a23d3e1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -760,6 +760,18 @@ struct dm_plane_state {
 	 * &struct drm_color_lut.
 	 */
 	struct drm_property_blob *lut3d;
+	/**
+	 * @blend_lut: blend lut lookup table blob. The blob (if not NULL) is an
+	 * array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *blend_lut;
+	/**
+	 * @blend_tf:
+	 *
+	 * Pre-defined transfer function for converting plane pixel data before
+	 * applying blend LUT.
+	 */
+	enum drm_transfer_function blend_tf;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 61e47bdecde4..ea13b49fa021 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1324,6 +1324,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 	amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 	amdgpu_state->shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
+	amdgpu_state->blend_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
 }
 
 static struct drm_plane_state *
@@ -1349,10 +1350,13 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		drm_property_blob_get(dm_plane_state->shaper_lut);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_get(dm_plane_state->lut3d);
+	if (dm_plane_state->blend_lut)
+		drm_property_blob_get(dm_plane_state->blend_lut);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
 	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
 	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
+	dm_plane_state->blend_tf = old_dm_plane_state->blend_tf;
 
 	return &dm_plane_state->base;
 }
@@ -1427,6 +1431,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 		drm_property_blob_put(dm_plane_state->lut3d);
 	if (dm_plane_state->shaper_lut)
 		drm_property_blob_put(dm_plane_state->shaper_lut);
+	if (dm_plane_state->blend_lut)
+		drm_property_blob_put(dm_plane_state->blend_lut);
 
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
@@ -1482,6 +1488,17 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   dm->adev->mode_info.plane_lut3d_size_property,
 					   MAX_COLOR_3DLUT_ENTRIES);
 	}
+
+	if (dm->dc->caps.color.dpp.ogam_ram) {
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_blend_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_blend_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_blend_tf_property,
+					   DRM_TRANSFER_FUNCTION_DEFAULT);
+	}
 }
 
 static int
@@ -1534,6 +1551,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == adev->mode_info.plane_blend_lut_property) {
+		ret = drm_property_replace_blob_from_id(plane->dev,
+							&dm_plane_state->blend_lut,
+							val, -1,
+							sizeof(struct drm_color_lut),
+							&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
+	} else if (property == adev->mode_info.plane_blend_tf_property) {
+		if (dm_plane_state->blend_tf != val) {
+			dm_plane_state->blend_tf = val;
+			dm_plane_state->base.color_mgmt_changed = 1;
+		}
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
@@ -1569,6 +1599,12 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 	} else 	if (property == adev->mode_info.plane_lut3d_property) {
 		*val = (dm_plane_state->lut3d) ?
 			dm_plane_state->lut3d->base.id : 0;
+	} else 	if (property == adev->mode_info.plane_blend_lut_property) {
+		*val = (dm_plane_state->blend_lut) ?
+			dm_plane_state->blend_lut->base.id : 0;
+	} else if (property == adev->mode_info.plane_blend_tf_property) {
+		*val = dm_plane_state->blend_tf;
+
 	} else {
 		return -EINVAL;
 	}
-- 
2.39.2

