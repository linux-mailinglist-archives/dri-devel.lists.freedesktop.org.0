Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248D7ADFFF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A244010E30A;
	Mon, 25 Sep 2023 19:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43710E2FE;
 Mon, 25 Sep 2023 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DrJznWu0tJHX4K7PEpisr3S/xIi9//FotBt39E+TmnI=; b=Zn9X5MqpDPRyJ1iRYXgKaVzwGL
 LXZhlpbfSq58v/xEdZ0qJsdVKYJ3yzboOYLz4BQoUGi6RuBoOALN/VOajRgJZaPJ9iyMTBAoMfVAQ
 wkik8JLB0x7keIzmhpOohC+JSppljiTmB8l/TRaJ3Hw6BHqdSKsfqyoqMRpRSUZyOG+7YLFVKePa+
 TIav75TpKWFz/RvCOsSG7aKSAZ+zq0F4CPoYxvm1+qQgrG10r+403zozzvPhzrIl4dJVHE5dGnbJx
 3pTb6zAZRRzXikX1A8uNHFLkgfnkYsrGoG2WXw+7Scpb4jXO6VHUH/ZAiHgFPSWT+rg89GkWgLqy8
 1SekPp0A==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrbP-008GsG-1V; Mon, 25 Sep 2023 21:50:43 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 30/32] drm/amd/display: add plane CTM driver-specific
 property
Date: Mon, 25 Sep 2023 18:49:30 -0100
Message-Id: <20230925194932.1329483-31-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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

Plane CTM for pre-blending color space conversion. Only enable
driver-specific plane CTM property on drivers that support both pre- and
post-blending gamut remap matrix, i.e., DCN3+ family. Otherwise it
conflits with DRM CRTC CTM property.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 +++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 2587847ae318..15f820926a3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -363,6 +363,8 @@ struct amdgpu_mode_info {
 	 * @plane_hdr_mult_property:
 	 */
 	struct drm_property *plane_hdr_mult_property;
+
+	struct drm_property *plane_ctm_property;
 	/**
 	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
 	 * that converts color content before 3D LUT. If
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ad583cc97f15..e3fbc242d9a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -773,6 +773,13 @@ struct dm_plane_state {
 	 * S31.32 sign-magnitude.
 	 */
 	__u64 hdr_mult;
+	/**
+	 * @ctm:
+	 *
+	 * Color transformation matrix. The blob (if not NULL) is a &struct
+	 * drm_color_ctm_3x4.
+	 */
+	struct drm_property_blob *ctm;
 	/**
 	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
 	 * array of &struct drm_color_lut.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 7871256f0e5f..26338f565574 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -216,6 +216,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_hdr_mult_property = prop;
 
+	prop = drm_property_create(adev_to_drm(adev),
+				   DRM_MODE_PROP_BLOB,
+				   "AMD_PLANE_CTM", 0);
+	if (!prop)
+		return -ENOMEM;
+	adev->mode_info.plane_ctm_property = prop;
+
 	prop = drm_property_create(adev_to_drm(adev),
 				   DRM_MODE_PROP_BLOB,
 				   "AMD_PLANE_SHAPER_LUT", 0);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index c7aeb9f06fa7..98501f5044c2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1363,6 +1363,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->ctm)
+		drm_property_blob_get(dm_plane_state->ctm);
 	if (dm_plane_state->shaper_lut)
 		drm_property_blob_get(dm_plane_state->shaper_lut);
 	if (dm_plane_state->lut3d)
@@ -1444,6 +1446,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_put(dm_plane_state->degamma_lut);
+	if (dm_plane_state->ctm)
+		drm_property_blob_put(dm_plane_state->ctm);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_put(dm_plane_state->lut3d);
 	if (dm_plane_state->shaper_lut)
@@ -1481,6 +1485,11 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 				   dm->adev->mode_info.plane_hdr_mult_property,
 				   AMDGPU_HDR_MULT_DEFAULT);
 
+	/* Only enable plane CTM if both DPP and MPC gamut remap is available. */
+	if (dm->dc->caps.color.mpc.gamut_remap)
+		drm_object_attach_property(&plane->base,
+					   dm->adev->mode_info.plane_ctm_property, 0);
+
 	if (dpp_color_caps.hw_3d_lut) {
 		drm_object_attach_property(&plane->base,
 					   mode_info.plane_shaper_lut_property, 0);
@@ -1538,6 +1547,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
 			dm_plane_state->hdr_mult = val;
 			dm_plane_state->base.color_mgmt_changed = 1;
 		}
+	} else if (property == adev->mode_info.plane_ctm_property) {
+		ret = drm_property_replace_blob_from_id(plane->dev,
+							&dm_plane_state->ctm,
+							val,
+							sizeof(struct drm_color_ctm), -1,
+							&replaced);
+		dm_plane_state->base.color_mgmt_changed |= replaced;
+		return ret;
 	} else if (property == adev->mode_info.plane_shaper_lut_property) {
 		ret = drm_property_replace_blob_from_id(plane->dev,
 							&dm_plane_state->shaper_lut,
@@ -1599,6 +1616,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = dm_plane_state->degamma_tf;
 	} else if (property == adev->mode_info.plane_hdr_mult_property) {
 		*val = dm_plane_state->hdr_mult;
+	} else if (property == adev->mode_info.plane_ctm_property) {
+		*val = (dm_plane_state->ctm) ?
+			dm_plane_state->ctm->base.id : 0;
 	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
 		*val = (dm_plane_state->shaper_lut) ?
 			dm_plane_state->shaper_lut->base.id : 0;
-- 
2.40.1

