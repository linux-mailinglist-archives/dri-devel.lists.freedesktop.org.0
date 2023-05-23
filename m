Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909C70E8BE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9FE10E4FD;
	Tue, 23 May 2023 22:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07910E502;
 Tue, 23 May 2023 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UQpYOOUO8N+Ok9w5Ew2znhTr4e/ikTXSm6Cy3/fdS0s=; b=Qn2DUWsEKYzIEWYUPYMmPqMlO9
 x3Cqsk/Sn5o7mJcMsMeUf2l5p1m2uXKjOLMXtQ94pA6zIK2VtznHMDAIS79jn3BFhdaqAm+8MBSeO
 EkmFzeHB6ELxM+Bz50snc8MP93BsF5LdXmDRozRykVdw8OzlWfblIDA207+UzZNxGn3YVPYR4krNb
 8Ry6OlLyCgCBRiW+VlwStrKikrEvZmsCSz2UkUwxXTXshF44mBgYkFAyGPXHCHyxoyThDZY193orw
 wTyO45ggI8D0fFv4Wukap0CT6xsqv+jvGsAR0b+AHSDzxBcdSTZ+svUEx0FGXQYf9PQZGVrl7TcOh
 MQQCly+w==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aI3-00HEOv-BN; Wed, 24 May 2023 00:15:35 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 08/36] drm/amd/display: add plane degamma TF driver-specific
 property
Date: Tue, 23 May 2023 21:14:52 -0100
Message-Id: <20230523221520.3115570-9-mwen@igalia.com>
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

Allow userspace to tell the kernel driver the input space and,
therefore, uses correct predefined transfer function (TF) to delinearize
content with or without LUT.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  9 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  5 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 ++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 32 +++++++++++++++++--
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index fa67c84f5994..fd6c4078c53a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1289,6 +1289,15 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_lut_size_property = prop;
 
+	prop = drm_property_create_enum(adev_to_drm(adev),
+					DRM_MODE_PROP_ENUM,
+					"AMD_PLANE_DEGAMMA_TF",
+					drm_transfer_function_enum_list,
+					ARRAY_SIZE(drm_transfer_function_enum_list));
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_degamma_tf_property = prop;
+
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 6c165ad9bdf0..9d7f47fe6303 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -360,6 +360,11 @@ struct amdgpu_mode_info {
 	 * size of degamma LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *plane_degamma_lut_size_property;
+	/**
+	 * @plane_degamma_tf_property: Predefined transfer function to
+	 * linearize content with or without LUT.
+	 */
+	struct drm_property *plane_degamma_tf_property;
 };
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 22e126654767..b8e432cc8078 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -725,6 +725,13 @@ struct dm_plane_state {
 	 * The blob (if not NULL) is an array of &struct drm_color_lut.
 	 */
 	struct drm_property_blob *degamma_lut;
+	/**
+	 * @degamma_tf:
+	 *
+	 * Predefined transfer function to tell DC driver the input space to
+	 * linearize.
+	 */
+	enum drm_transfer_function degamma_tf;
 };
 
 struct dm_crtc_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index e9cedc4068f1..6b71777a525c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1317,8 +1317,11 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
 	amdgpu_state = kzalloc(sizeof(*amdgpu_state), GFP_KERNEL);
 	WARN_ON(amdgpu_state == NULL);
 
-	if (amdgpu_state)
-		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
+	if (!amdgpu_state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
+	amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
 }
 
 static struct drm_plane_state *
@@ -1341,6 +1344,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
 
+	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
+
 	return &dm_plane_state->base;
 }
 
@@ -1417,6 +1422,19 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 	drm_atomic_helper_plane_destroy_state(plane, state);
 }
 
+static const struct drm_prop_enum_list drm_transfer_function_enum_list[] = {
+	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
+	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
+	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
+	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
+	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
+	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
+	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
+	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
+	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
+	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
+};
+
 #ifdef AMD_PRIVATE_COLOR
 static void
 dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
@@ -1428,6 +1446,9 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 		drm_object_attach_property(&plane->base,
 					   dm->adev->mode_info.plane_degamma_lut_size_property,
 					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_degamma_tf_property,
+					   DRM_TRANSFER_FUNCTION_DEFAULT);
 	}
 }
 
@@ -1450,6 +1471,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1473,6 +1499,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 	if (property == adev->mode_info.plane_degamma_lut_property) {
 		*val = (dm_plane_state->degamma_lut) ?
 			dm_plane_state->degamma_lut->base.id : 0;
+	} else if (property == adev->mode_info.plane_degamma_tf_property) {
+		*val = dm_plane_state->degamma_tf;
 	} else {
 		return -EINVAL;
 	}
-- 
2.39.2

