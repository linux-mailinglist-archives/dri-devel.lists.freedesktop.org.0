Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B46EBFFC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296C10E3D9;
	Sun, 23 Apr 2023 14:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA51610E3D1;
 Sun, 23 Apr 2023 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AAZ5sTWcL6d1F4he+h8JfjtWQIRJ5weYPHqgnNEExCI=; b=gZIKjW/5GVEjC1IrACr56Fi8tZ
 ACTVa/+kOaJqEB5Jev/ClLObH/ZmOOTJ6QtyJAaeDWG/A9uc1EI80NLMoTgC53sorKOtT7uBDGvAd
 zixe1i8FPGQ5J8WZVUoRescfFFZm6H12wRhwtqOme9GAvUw6Cp2Yn6hbfAKqOXedP2yC6b+P39IVx
 kjb2ljiKk+Lx6F1FY0dCIp1A8wbcX1dfj7YM5+6/KGbmfRGUoKZd7eLxyL396LN637nE5sOKvsbJn
 yQMvdGKIA+hUOCpzX7H9aB4rQ2r4XsaU+91m3a65dQLWM3mpLeuiQu2esYmvI4R8JhsIQW4J1LCXT
 CdWOkNGA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaS3-00ANVs-Ka; Sun, 23 Apr 2023 16:12:27 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 10/40] drm/amd/display: add plane degamma LUT
 driver-private props
Date: Sun, 23 Apr 2023 13:10:22 -0100
Message-Id: <20230423141051.702990-11-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Create driver-private properties (not DRM KMS generic) for plane degamma
LUT (user-blob and its size).

Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 11 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 78 ++++++++++++++++++-
 4 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 1913903cab88..996c9c3fd471 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1303,6 +1303,20 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.gamma_tf_property = prop;
 
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
index 76337e18c728..d4e609a8b67e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -372,6 +372,16 @@ struct amdgpu_mode_info {
 	 * @gamma_tf_property: Transfer function for CRTC regamma.
 	 */
 	struct drm_property *gamma_tf_property;
+	/**
+	 * @plane_degamma_lut_property: Plane property to set a degamma LUT to
+	 * convert color space before blending.
+	 */
+	struct drm_property *plane_degamma_lut_property;
+	/**
+	 * @plane_degamma_lut_size_property: Plane property to define the max
+	 * size of degamma LUT as supported by the driver (read-only).
+	 */
+	struct drm_property *plane_degamma_lut_size_property;
 #endif
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1e90a2dd445e..b1d0c65d821d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -719,6 +719,17 @@ enum drm_transfer_function {
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
+
+#ifdef CONFIG_STEAM_DECK
+	/* Plane color mgmt */
+	/**
+	 * @degamma_lut:
+	 *
+	 * LUT for converting plane pixel data before going into plane merger.
+	 * The blob (if not NULL) is an array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *degamma_lut;
+#endif
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 4e5498153be2..7b9d62c70b30 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1337,7 +1337,10 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		dm_plane_state->dc_state = old_dm_plane_state->dc_state;
 		dc_plane_state_retain(dm_plane_state->dc_state);
 	}
-
+#ifdef CONFIG_STEAM_DECK
+	if (dm_plane_state->degamma_lut)
+		drm_property_blob_get(dm_plane_state->degamma_lut);
+#endif
 	return &dm_plane_state->base;
 }
 
@@ -1404,7 +1407,9 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 				struct drm_plane_state *state)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
-
+#ifdef CONFIG_STEAM_DECK
+	drm_property_blob_put(dm_plane_state->degamma_lut);
+#endif
 	if (dm_plane_state->dc_state)
 		dc_plane_state_release(dm_plane_state->dc_state);
 
@@ -1444,6 +1449,68 @@ amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
 
 	return 0;
 }
+
+static void
+dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
+				      struct drm_plane *plane)
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
+			     struct drm_property *property, uint64_t val)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(state);
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	bool replaced = false;
+	int ret;
+
+	if (property == adev->mode_info.plane_degamma_lut_property) {
+		ret = amdgpu_dm_replace_property_blob_from_id(plane->dev,
+					&dm_plane_state->degamma_lut,
+					val,
+					-1, sizeof(struct drm_color_lut),
+					&replaced);
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
+
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
 #endif
 
 static const struct drm_plane_funcs dm_plane_funcs = {
@@ -1454,6 +1521,10 @@ static const struct drm_plane_funcs dm_plane_funcs = {
 	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
 	.atomic_destroy_state = dm_drm_plane_destroy_state,
 	.format_mod_supported = dm_plane_format_mod_supported,
+#ifdef CONFIG_STEAM_DECK
+	.atomic_set_property = dm_atomic_plane_set_property,
+	.atomic_get_property = dm_atomic_plane_get_property,
+#endif
 };
 
 int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
@@ -1524,6 +1595,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
 
+#ifdef CONFIG_STEAM_DECK
+	dm_plane_attach_color_mgmt_properties(dm, plane);
+#endif
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.39.2

