Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC37BA790
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0317110E44A;
	Thu,  5 Oct 2023 17:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327410E445;
 Thu,  5 Oct 2023 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N1w5uF0CtTlV/63Z2pDpUDkJcFugeTVpHv7/dXW4H9w=; b=M3FcXOkwxgWvRzS97r0nhGifv0
 U4iwJDaLThnk4bfKbLlucg+pfO0vl6eY+pcQ+M+cA6txbR2h70uEr9IQs09N+zY0nOyN1rS6ewKam
 vxglbQDkYeCNY+yIlj6s6u0buquKcvxXpSJAkYQNqOsGB+FETu4b+9OaKYlrveL+GFazf9HZ1LlSE
 9GvLVN+wB8v2wu+jZuLcsbmHUCEPYlSnH3XjrXFElpUXzOsgjhrhB7KivMjM6hL6dJRClCIn2sZfz
 asIGruMR+/YQEIc6mU/3DRFiZdvFV9QbVDLzO4tfY5Gb+5lMLCvJU2+pWAIqyP8yavjaoONutwm1Z
 h6ad/74w==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRx2-00CFJN-FU; Thu, 05 Oct 2023 19:15:52 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 10/32] drm/amd/display: add plane shaper LUT and TF
 driver-specific properties
Date: Thu,  5 Oct 2023 16:15:05 -0100
Message-Id: <20231005171527.203657-11-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005171527.203657-1-mwen@igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
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

On AMD HW, 3D LUT always assumes a preceding shaper 1D LUT used for
delinearizing and/or normalizing the color space before applying a 3D
LUT. Add pre-defined transfer function to enable delinearizing content
with or without shaper LUT, where AMD color module calculates the
resulted shaper curve. We apply an inverse EOTF to go from linear
values to encoded values. If we are already in a non-linear space and/or
don't need to normalize values, we can bypass shaper LUT with a linear
transfer function that is also the default TF value.

There is no shaper ROM. When setting shaper TF (!= Identity) and LUT at
the same time, the color module will combine the pre-defined TF and the
custom LUT values into the LUT that's actually programmed.

v2:
- squash commits for shaper LUT and shaper TF
- define inverse EOTF as supported shaper TFs

v3:
- spell out TF+LUT behavior in the commit and comments (Harry)
- replace BT709 EOTF by inv OETF

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 21 ++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 11 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 29 +++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 32 +++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index f7adaa52c23f..af70db4f6b4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -363,6 +363,27 @@ struct amdgpu_mode_info {
 	 * @plane_hdr_mult_property:
 	 */
 	struct drm_property *plane_hdr_mult_property;
+	/**
+	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
+	 * that converts color content before 3D LUT. If
+	 * plane_shaper_tf_property != Identity TF, AMD color module will
+	 * combine the user LUT values with pre-defined TF into the LUT
+	 * parameters to be programmed.
+	 */
+	struct drm_property *plane_shaper_lut_property;
+	/**
+	 * @shaper_lut_size_property: Plane property for the size of
+	 * pre-blending shaper LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_shaper_lut_size_property;
+	/**
+	 * @plane_shaper_tf_property: Plane property to set a predefined
+	 * transfer function for pre-blending shaper (before applying 3D LUT)
+	 * with or without LUT. There is no shaper ROM, but we can use AMD
+	 * color modules to program LUT parameters from predefined TF (or
+	 * from a combination of pre-defined TF and the custom 1D LUT).
+	 */
+	struct drm_property *plane_shaper_tf_property;
 	/**
 	 * @plane_lut3d_property: Plane property for color transformation using
 	 * a 3D LUT (pre-blending), a three-dimensional array where each
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 7a2350c62cf1..0e2a04a3caf3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -784,6 +784,17 @@ struct dm_plane_state {
 	 * TF is needed for any subsequent linear-to-non-linear transforms.
 	 */
 	__u64 hdr_mult;
+	/**
+	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
+	 * array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *shaper_lut;
+	/**
+	 * @shaper_tf:
+	 *
+	 * Predefined transfer function to delinearize color space.
+	 */
+	enum amdgpu_transfer_function shaper_tf;
 	/**
 	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
 	 * &struct drm_color_lut.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 011f2f9ec890..d3c7f9a13a61 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -173,6 +173,14 @@ static const u32 amdgpu_eotf =
 	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
 	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
 
+static const u32 amdgpu_inv_eotf =
+	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_OETF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF);
+
 static struct drm_property *
 amdgpu_create_tf_property(struct drm_device *dev,
 			  const char *name,
@@ -230,6 +238,27 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_hdr_mult_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_SHAPER_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_shaper_lut_property = prop;
+
+	prop = drm_property_create_range(adev_to_drm(adev),
+					 DRM_MODE_PROP_IMMUTABLE,
+					 "AMD_PLANE_SHAPER_LUT_SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_shaper_lut_size_property = prop;
+
+	prop = amdgpu_create_tf_property(adev_to_drm(adev),
+					 "AMD_PLANE_SHAPER_TF",
+					 amdgpu_inv_eotf);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_shaper_tf_property = prop;
+
 	prop = drm_property_create(adev_to_drm(adev),
 				   DRM_MODE_PROP_BLOB,
 				   "AMD_PLANE_LUT3D", 0);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 068798ffdd56..a381b3558bd1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1338,6 +1338,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
+	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 }
 
 static struct drm_plane_state *
@@ -1359,11 +1360,14 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->shaper_lut)
+		drm_property_blob_get(dm_plane_state->shaper_lut);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_get(dm_plane_state->lut3d);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
 	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
+	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
 
 	return &dm_plane_state->base;
 }
@@ -1436,6 +1440,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 		drm_property_blob_put(dm_plane_state->degamma_lut);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_put(dm_plane_state->lut3d);
+	if (dm_plane_state->shaper_lut)
+		drm_property_blob_put(dm_plane_state->shaper_lut);
 
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
@@ -1468,6 +1474,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 				   AMDGPU_HDR_MULT_DEFAULT);
 
 	if (dpp_color_caps.hw_3d_lut) {
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_shaper_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_shaper_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_shaper_tf_property,
+					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
 		drm_object_attach_property(&plane->base,
 					   mode_info.plane_lut3d_property, 0);
 		drm_object_attach_property(&plane->base,
@@ -1505,6 +1519,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 			dm_plane_state->hdr_mult = val;
 			dm_plane_state->base.color_mgmt_changed = 1;
 		}
+	} else if (property == adev->mode_info.plane_shaper_lut_property) {
+		ret = drm_property_replace_blob_from_id(plane->dev,
+							&dm_plane_state->shaper_lut,
+							val, -1,
+							sizeof(struct drm_color_lut),
+							&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
+	} else if (property == adev->mode_info.plane_shaper_tf_property) {
+		if (dm_plane_state->shaper_tf != val) {
+			dm_plane_state->shaper_tf = val;
+			dm_plane_state->base.color_mgmt_changed = 1;
+		}
 	} else if (property == adev->mode_info.plane_lut3d_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->lut3d,
@@ -1540,6 +1567,11 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = dm_plane_state->degamma_tf;
 	} else if (property == adev->mode_info.plane_hdr_mult_property) {
 		*val = dm_plane_state->hdr_mult;
+	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
+		*val = (dm_plane_state->shaper_lut) ?
+			dm_plane_state->shaper_lut->base.id : 0;
+	} else if (property == adev->mode_info.plane_shaper_tf_property) {
+		*val = dm_plane_state->shaper_tf;
 	} else 	if (property == adev->mode_info.plane_lut3d_property) {
 		*val = (dm_plane_state->lut3d) ?
 			dm_plane_state->lut3d->base.id : 0;
-- 
2.40.1

