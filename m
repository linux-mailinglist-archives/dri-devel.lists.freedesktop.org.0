Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8670E8CC
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA7D10E511;
	Tue, 23 May 2023 22:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299CB10E4F4;
 Tue, 23 May 2023 22:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QyEh3O9RM++Y6y9sPln2GfMYP2hRx5HbMp1Jy1t+bdA=; b=GbDRvDEZLUjgr8b7ICnov2mXhT
 k2fgHj6iqXbIOuTRERJ20fbHUWdtoq8QMfcYX9awWmvc6vOhnadPpYzXZ3LsmFi2gjtG6lEKam8WI
 JoZfKO73StCDKyr19lmNFnXRmPJBuSgdC0fdX/qgxfLHbdx3aFD3pSpbX4FXa2z3TX3yvm9GaQQo6
 lgJleRVprEEKJbKq+W3g2iN/koKg8fEDuI/6enfmqAo/OAbxY2wKQwakSCtdIfk/GG/2ZK6+81Avw
 DFKkUkhu11KA7yqcVruuKQRe/+CZdpqFmLgsW+RrkurMLLn8mIFaff50T2JgB9ob4PQPZqkOuQZZt
 BmKU86tQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aI8-00HEOv-0M; Wed, 24 May 2023 00:15:40 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 11/36] drm/amd/display: add plane shaper LUT driver-specific
 properties
Date: Tue, 23 May 2023 21:14:55 -0100
Message-Id: <20230523221520.3115570-12-mwen@igalia.com>
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

On AMD HW, 3D LUT always assumes a preceding shaper 1D LUT used for
delinearizing and/or normalizing the color space before applying a 3D
LUT.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 ++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  5 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 9954643cb928..258dfc66c2ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1304,6 +1304,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
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
 	prop = drm_property_create(adev_to_drm(adev),
 				   DRM_MODE_PROP_BLOB,
 				   "AMD_PLANE_LUT3D", 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 93ec4a60f6e9..44306557a905 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -369,6 +369,16 @@ struct amdgpu_mode_info {
 	 * @plane_hdr_mult_property:
 	 */
 	struct drm_property *plane_hdr_mult_property;
+	/**
+	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
+	 * that converts color content before 3D LUT.
+	 */
+	struct drm_property *plane_shaper_lut_property;
+	/**
+	 * @shaper_lut_size_property: Plane property for the size of
+	 * pre-blending shaper LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_shaper_lut_size_property;
 	/**
 	 * @plane_lut3d_property: Plane property for gamma correction using a
 	 * 3D LUT (pre-blending).
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 7e4978c2f253..fa0bb6a5c598 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -744,6 +744,11 @@ struct dm_plane_state {
 	 * S31.32 sign-magnitude.
 	 */
 	__u64 hdr_mult;
+	/**
+	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
+	 * array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *shaper_lut;
 	/**
 	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
 	 * &struct drm_color_lut.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 5fc3855448d0..abc5b9a353a0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1344,6 +1344,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->shaper_lut)
+		drm_property_blob_get(dm_plane_state->shaper_lut);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_get(dm_plane_state->lut3d);
 
@@ -1421,6 +1423,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 		drm_property_blob_put(dm_plane_state->degamma_lut);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_put(dm_plane_state->lut3d);
+	if (dm_plane_state->shaper_lut)
+		drm_property_blob_put(dm_plane_state->shaper_lut);
 
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
@@ -1462,6 +1466,11 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 				   AMDGPU_HDR_MULT_DEFAULT);
 
 	if (dm->dc->caps.color.dpp.hw_3d_lut) {
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_shaper_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_shaper_lut_size_property,
+					   MAX_COLOR_LUT_ENTRIES);
 		drm_object_attach_property(&plane->base,
 					   dm->adev->mode_info.plane_lut3d_property, 0);
 		drm_object_attach_property(&plane->base,
@@ -1499,6 +1508,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
 	} else if (property == adev->mode_info.plane_lut3d_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->lut3d,
@@ -1534,6 +1551,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = dm_plane_state->degamma_tf;
 	} else if (property == adev->mode_info.plane_hdr_mult_property) {
 		*val = dm_plane_state->hdr_mult;
+	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
+		*val = (dm_plane_state->shaper_lut) ?
+			dm_plane_state->shaper_lut->base.id : 0;
 	} else 	if (property == adev->mode_info.plane_lut3d_property) {
 		*val = (dm_plane_state->lut3d) ?
 			dm_plane_state->lut3d->base.id : 0;
-- 
2.39.2

