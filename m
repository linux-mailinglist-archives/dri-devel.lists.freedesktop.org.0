Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E54C777D3C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962E10E574;
	Thu, 10 Aug 2023 16:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C00A10E564;
 Thu, 10 Aug 2023 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lb5cCVWrbRYB6cPrue9vveOB5OZxu6ptPPxOCwR44/Y=; b=LgtXpbU6IHC9HJ/X0FRZG+aoJx
 teb/3w7jyof2qTWMlvlcRZkZyjgmuaZcPSAfHWG0OHGpetlIuFW69A33VK5+nvQ2Wptz0u1l0lQtK
 QvWWCa6gX/GKvnFsMXzY8CapWZ7vwoZQ9gW4ZAVCXc+NM0bbU04J0bqk137lVpBCUAVpG2GufLbVK
 82dqE1RRkuMRlQSY+m7XzsUfCHbabb1oawgrEAVXDbVeB+QNCnrk1nZ/DDj63BMayz+ehGzh/OUnI
 EiiVt8KnlMgYerOu4sKsbo9KsVdRRKyPpbtADwjOsdCv2sR6GfCqZl+lXaSqJjpUTIwky6LdscpYX
 T86io1Pg==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU88J-00GjYD-3v; Thu, 10 Aug 2023 18:03:31 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 06/34] drm/amd/display: add plane degamma TF
 driver-specific property
Date: Thu, 10 Aug 2023 15:02:46 -0100
Message-Id: <20230810160314.48225-7-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Allow userspace to tell the kernel driver the input space and,
therefore, uses correct predefined transfer function (TF) to delinearize
content with or without LUT.

v2:
- rename TF enum prefix from DRM_ to AMDGPU_ (Harry)
- remove HLG TF

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
index ec4621deac8c..6ef958a14e16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -354,6 +354,11 @@ struct amdgpu_mode_info {
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
index f0343bbf0fe1..c749c9cb3d94 100644
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
index cf175b86ba80..56ce008b9095 100644
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
@@ -104,6 +116,15 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
index 488012d1558d..0a955abb1abf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1326,8 +1326,11 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
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
 
 static struct drm_plane_state *
@@ -1350,6 +1353,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
 
+	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
+
 	return &dm_plane_state->base;
 }
 
@@ -1441,6 +1446,9 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 		drm_object_attach_property(&plane->base,
 					   mode_info.plane_degamma_lut_size_property,
 					   MAX_COLOR_LUT_ENTRIES);
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_degamma_tf_property,
+					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
 	}
 }
 
@@ -1463,6 +1471,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1486,6 +1499,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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

