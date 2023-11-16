Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE07EE7CE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB7C10E699;
	Thu, 16 Nov 2023 19:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A4F10E6A0;
 Thu, 16 Nov 2023 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsBKgAHwDEf6FledKYH1OB+0v1Ds59Xb5Cep5ElUsMk=; b=rLgW1K1KmXMX0NCch8UcKXI0Rw
 l9dO/C0kedFHu84Oj4EdZVaroXaicgXKWCimHnmKO6XH9XSlhOoMPavNdnPMwo/jhLLyKXuewrWzR
 JeKKjYPJ8aNdUnoneA59Zo9JWWUyVZ3/XYRlO4ygkMaq7Xfzpv0xRiSpzD+XZHnajoNp17FNLAmGX
 yPOhSe84wOJBqIZmZSEF4YcC3Pxhdq9JKlYL6lD7u0N7AQ1K89Hkwb0FLVT5W9Mc0Uv1lY2whuK68
 jaefZuQuc4tlw8pj7y27cCVHRJ7qamy/NBe6UgwwFeI5e/czm2jhnHw1Dcp0XSVJSXEWNe1HJa7hu
 v1gO3hWg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVc-0048Yy-Iq; Thu, 16 Nov 2023 20:58:40 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 11/32] drm/amd/display: add plane blend LUT and TF
 driver-specific properties
Date: Thu, 16 Nov 2023 18:57:51 -0100
Message-Id: <20231116195812.906115-12-mwen@igalia.com>
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

Blend 1D LUT or a pre-defined transfer function (TF) can be set to
linearize content before blending, so that it's positioned just before
blending planes in the AMD color mgmt pipeline, and after 3D LUT
(non-linear space). Shaper and Blend LUTs are 1D LUTs that sandwich 3D
LUT. Drivers should advertize blend properties according to HW caps.

There is no blend ROM for pre-defined TF. When setting blend TF (!=
Identity) and LUT at the same time, the color module will combine the
pre-defined TF and the custom LUT values into the LUT that's actually
programmed.

v3:
- spell out TF+LUT behavior in the commit and comments (Harry)

v5:
- get blend blob correctly

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 22 +++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 ++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 21 +++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 37 +++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index bb27a3156204..d1c38dedfc7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -403,6 +403,28 @@ struct amdgpu_mode_info {
 	 * entries for 3D LUT array is the 3D LUT size cubed;
 	 */
 	struct drm_property *plane_lut3d_size_property;
+	/**
+	 * @plane_blend_lut_property: Plane property for output gamma before
+	 * blending. Userspace set a blend LUT to convert colors after 3D LUT
+	 * conversion. It works as a post-3DLUT 1D LUT. With shaper LUT, they
+	 * are sandwiching 3D LUT with two 1D LUT. If plane_blend_tf_property
+	 * != Identity TF, AMD color module will combine the user LUT values
+	 * with pre-defined TF into the LUT parameters to be programmed.
+	 */
+	struct drm_property *plane_blend_lut_property;
+	/**
+	 * @plane_blend_lut_size_property: Plane property to define the max
+	 * size of blend LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_blend_lut_size_property;
+	/**
+	 * @plane_blend_tf_property: Plane property to set a predefined
+	 * transfer function for pre-blending blend/out_gamma (after applying
+	 * 3D LUT) with or without LUT. There is no blend ROM, but we can use
+	 * AMD color modules to program LUT parameters from predefined TF (or
+	 * from a combination of pre-defined TF and the custom 1D LUT).
+	 */
+	struct drm_property *plane_blend_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 33e18005226a..8c040c55359b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -792,6 +792,18 @@ struct dm_plane_state {
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
+	enum amdgpu_transfer_function blend_tf;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 866c6f1d3d99..425676f5afb7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -274,6 +274,27 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
+	prop = amdgpu_create_tf_property(adev_to_drm(adev),
+					 "AMD_PLANE_BLEND_TF",
+					 amdgpu_eotf);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_blend_tf_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 7f0de29889f0..35a4732483ba 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1344,6 +1344,7 @@ static void amdgpu_dm_plane_drm_plane_reset(struct drm_plane *plane)
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
+	amdgpu_state->blend_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 }
 
 static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct drm_plane *plane)
@@ -1371,10 +1372,14 @@ static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct
 	if (old_dm_plane_state->lut3d)
 		dm_plane_state->lut3d =
 			drm_property_blob_get(old_dm_plane_state->lut3d);
+	if (old_dm_plane_state->blend_lut)
+		dm_plane_state->blend_lut =
+			drm_property_blob_get(old_dm_plane_state->blend_lut);
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
 	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
 	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
+	dm_plane_state->blend_tf = old_dm_plane_state->blend_tf;
 
 	return &dm_plane_state->base;
 }
@@ -1449,6 +1454,8 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
 		drm_property_blob_put(dm_plane_state->lut3d);
 	if (dm_plane_state->shaper_lut)
 		drm_property_blob_put(dm_plane_state->shaper_lut);
+	if (dm_plane_state->blend_lut)
+		drm_property_blob_put(dm_plane_state->blend_lut);
 
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
@@ -1498,6 +1505,17 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   mode_info.plane_lut3d_size_property,
 					   MAX_COLOR_3DLUT_SIZE);
 	}
+
+	if (dpp_color_caps.ogam_ram) {
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_blend_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_blend_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   mode_info.plane_blend_tf_property,
+					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
+	}
 }
 
 static int
@@ -1550,6 +1568,19 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1585,6 +1616,12 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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
2.40.1

