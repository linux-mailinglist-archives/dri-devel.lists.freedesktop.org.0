Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDE70E8CE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFEE10E516;
	Tue, 23 May 2023 22:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA4310E4FD;
 Tue, 23 May 2023 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZnLZbxJjbI0/YfYzeogW8t0+tedK7XDsAnT9WUtN8Tw=; b=mNy6+btBxvcd5bpaWmRmaOakTO
 ZSNHEh8p82TOX3bStaG8OGhua+AtSUSqGYZ6OCVLVDh01WS1b5hlkoifgWWb0bJcQzjzvYgD2Q2Rl
 ZZyL4OBtGc25OgV0GJU1iJhfUDRD5gAXaz+utUJLW/MAPHvtYL678GxGoZ/OTeOOXYh5Lla+GPTyX
 98h0Q2yDC+bRD3e4QeqgwYLpWCEAfr01nm5B2NV58UCJE4YDpOC0Hj/QEUD/rLLriQcrRvox/0UEQ
 sP1CIrQlbc3+avNYh/lu/TlWnp0ovnv2ubJ+C20yU2AWDhmh+ePDInByuJ4AqPKjdQbwJD9Qm7XfL
 4rTqpyFg==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aI1-00HEOv-Q1; Wed, 24 May 2023 00:15:33 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 07/36] drm/amd/display: add plane driver-specific properties
 for degamma LUT
Date: Tue, 23 May 2023 21:14:51 -0100
Message-Id: <20230523221520.3115570-8-mwen@igalia.com>
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

Create and attach driver-private properties for plane color management.
First add plane degamma LUT properties that means user-blob and its
size. We will add more plane color properties in the next commits. In
addition, we keep these driver-private plane properties limited by
defining AMD_PRIVATE_COLOR.

Co-developed-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 77 +++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 88af075e6c18..fa67c84f5994 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1275,6 +1275,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.regamma_tf_property = prop;
 
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
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 881446c51b36..6c165ad9bdf0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -352,6 +352,14 @@ struct amdgpu_mode_info {
 	 * drm_transfer_function`.
 	 */
 	struct drm_property *regamma_tf_property;
+	/* @plane_degamma_lut_property: Plane property to set a degamma LUT to
+	 * convert color space before blending.
+	 */
+	struct drm_property *plane_degamma_lut_property;
+	/* @plane_degamma_lut_size_property: Plane property to define the max
+	 * size of degamma LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_degamma_lut_size_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ad5ee28b83dc..22e126654767 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -716,6 +716,15 @@ enum drm_transfer_function {
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
+
+	/* Plane color mgmt */
+	/**
+	 * @degamma_lut:
+	 *
+	 * LUT for converting plane pixel data before going into plane merger.
+	 * The blob (if not NULL) is an array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *degamma_lut;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 322668973747..e9cedc4068f1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1338,6 +1338,9 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		dc_plane_state_retain(dm_plane_state->dc_state);
 	}
 
+	if (dm_plane_state->degamma_lut)
+		drm_property_blob_get(dm_plane_state->degamma_lut);
+
 	return &dm_plane_state->base;
 }
 
@@ -1405,12 +1408,79 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
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
+	if (dm->dc->caps.color.dpp.dgam_ram || dm->dc->caps.color.dpp.gamma_corr ) {
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_degamma_lut_property, 0);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_degamma_lut_size_property,
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
@@ -1419,6 +1489,10 @@ static const struct drm_plane_funcs dm_plane_funcs = {
 	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
 	.atomic_destroy_state = dm_drm_plane_destroy_state,
 	.format_mod_supported = dm_plane_format_mod_supported,
+#ifdef AMD_PRIVATE_COLOR
+	.atomic_set_property = dm_atomic_plane_set_property,
+	.atomic_get_property = dm_atomic_plane_get_property,
+#endif
 };
 
 int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
@@ -1489,6 +1563,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
 
+#ifdef AMD_PRIVATE_COLOR
+	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#endif
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.39.2

