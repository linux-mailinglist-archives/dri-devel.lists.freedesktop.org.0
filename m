Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9C870E8C3
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD2810E508;
	Tue, 23 May 2023 22:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC6C10E506;
 Tue, 23 May 2023 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WMVuZCPQaOHbNtlqNTLFsmNeF5leI2KGy7NUa3c5E+o=; b=shfxgaSA2B7sVXoz3XFdhuGkKh
 N16J3cqmw/5JDK4P3udO4wTd1S9jbJfEj6zt1U4dVhRIrbCn5ZrFUB/Y+QvKbUpDiqPznzB/o1fAY
 tdPObwFvx3wDDXzd1v/lyFLUSP2sTXo93qHZVc3NHIroT9rhZkpGMkjB0fzHYVfv01Zl40XBOYKCL
 IJomTq83fMlGQBkEwQPN5ts3/4a2dSFw68+t9B/Lc/Af60pKnQvhhQMxUjbQMllCVjaJAY1aNfWef
 EC4XEijQY1yHDmMBHKs5q+BifFcETGW48LncQS14NjLbHr4K6B4soASIY3YsI+oDXNgVv8YnjFv6B
 /bZ63OsQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aI9-00HEOv-Hx; Wed, 24 May 2023 00:15:41 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 12/36] drm/amd/display: add plane shaper TF driver-private
 property
Date: Tue, 23 May 2023 21:14:56 -0100
Message-Id: <20230523221520.3115570-13-mwen@igalia.com>
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

Add property to set predefined transfer function to enable delinearizing
content with or without shaper LUT. Drivers should advertize this
property acoording to HW caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c          |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h             |  6 ++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h    |  6 ++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c  | 12 ++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 258dfc66c2ac..d52bed00bbdb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1318,6 +1318,15 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_shaper_lut_size_property = prop;
 
+	prop = drm_property_create_enum(adev_to_drm(adev),
+					DRM_MODE_PROP_ENUM,
+					"AMD_PLANE_SHAPER_TF",
+					drm_transfer_function_enum_list,
+					ARRAY_SIZE(drm_transfer_function_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_shaper_tf_property = prop;
+
 	prop = drm_property_create(adev_to_drm(adev),
 				   DRM_MODE_PROP_BLOB,
 				   "AMD_PLANE_LUT3D", 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 44306557a905..a41c3a39c367 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -379,6 +379,12 @@ struct amdgpu_mode_info {
 	 * pre-blending shaper LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *plane_shaper_lut_size_property;
+	/**
+	 * @plane_shaper_tf_property: Plane property to set a predefined
+	 * transfer function for pre-blending shaper (before applying 3D LUT)
+	 * with or without LUT.
+	 */
+	struct drm_property *plane_shaper_tf_property;
 	/**
 	 * @plane_lut3d_property: Plane property for gamma correction using a
 	 * 3D LUT (pre-blending).
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index fa0bb6a5c598..663ffc7d648e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -749,6 +749,12 @@ struct dm_plane_state {
 	 * array of &struct drm_color_lut.
 	 */
 	struct drm_property_blob *shaper_lut;
+	/**
+	 * @shaper_tf:
+	 *
+	 * Predefined transfer function to delinearize color space.
+	 */
+	enum drm_transfer_function shaper_tf;
 	/**
 	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
 	 * &struct drm_color_lut.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index abc5b9a353a0..61e47bdecde4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1323,6 +1323,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 	amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
+	amdgpu_state->shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
 }
 
 static struct drm_plane_state *
@@ -1351,6 +1352,7 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 
 	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
 	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
+	dm_plane_state->shaper_tf = old_dm_plane_state->shaper_tf;
 
 	return &dm_plane_state->base;
 }
@@ -1471,6 +1473,9 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 		drm_object_attach_property(&plane->base,
 					   dm->adev->mode_info.plane_shaper_lut_size_property,
 					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_shaper_tf_property,
+					   DRM_TRANSFER_FUNCTION_DEFAULT);
 		drm_object_attach_property(&plane->base,
 					   dm->adev->mode_info.plane_lut3d_property, 0);
 		drm_object_attach_property(&plane->base,
@@ -1516,6 +1521,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 							&replaced);
 		dm_plane_state->base.color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == adev->mode_info.plane_shaper_tf_property) {
+		if (dm_plane_state->shaper_tf != val) {
+			dm_plane_state->shaper_tf = val;
+			dm_plane_state->base.color_mgmt_changed = 1;
+		}
 	} else if (property == adev->mode_info.plane_lut3d_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->lut3d,
@@ -1554,6 +1564,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
 		*val = (dm_plane_state->shaper_lut) ?
 			dm_plane_state->shaper_lut->base.id : 0;
+	} else if (property == adev->mode_info.plane_shaper_tf_property) {
+		*val = dm_plane_state->shaper_tf;
 	} else 	if (property == adev->mode_info.plane_lut3d_property) {
 		*val = (dm_plane_state->lut3d) ?
 			dm_plane_state->lut3d->base.id : 0;
-- 
2.39.2

