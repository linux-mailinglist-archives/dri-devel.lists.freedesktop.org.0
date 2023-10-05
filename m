Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0487BA7B9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8C610E475;
	Thu,  5 Oct 2023 17:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1710E46B;
 Thu,  5 Oct 2023 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LQiVKwjX4H6q3m+YOKkFgsg7Hv2Us9yPYww1uwEgLfU=; b=TglH1nCifSdQAeWgKQ9aWIfVJQ
 ZyaaS2WNoBvpNlo22iUPKixgAM23V+s1ARMxBOvrrpvCz/H9X5DH9+Zkh1lmfv7UKCGQYgbEDqwxK
 tX1+1nDlaZfaLCPqnmz/ptFy1TamtBhjbYDhNTd3yiGsedXFAxN29m43VTctax5tnrJBVXlSmZJ3q
 8CV+EZ5xuHdm2NiQAUQVj0XRWGjqV3Md4G8NikwJqgTD+IsbCckyc8iPjl3i0OeZKWFJhNVnKWuls
 sm8UlqEaLu8/bmaPnyS5x6BGsFghhLzdyonsDFgRbpVt4VHmK0aVeiaSCs3cpNCp0RPHjT/qICpzb
 TrjK/k7w==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxi-00CFJN-Kb; Thu, 05 Oct 2023 19:16:34 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 30/32] drm/amd/display: add plane CTM driver-specific
 property
Date: Thu,  5 Oct 2023 16:15:25 -0100
Message-Id: <20231005171527.203657-31-mwen@igalia.com>
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
index 071cc10bfd90..1347022ce57d 100644
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
index 219efa7fe181..c9cd2e5f79ae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -784,6 +784,13 @@ struct dm_plane_state {
 	 * TF is needed for any subsequent linear-to-non-linear transforms.
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
index 251b5f14bd89..41c5926ca068 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -239,6 +239,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
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
index f1070ca7076a..d9537d9bf18c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1361,6 +1361,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_get(dm_plane_state->degamma_lut);
+	if (dm_plane_state->ctm)
+		drm_property_blob_get(dm_plane_state->ctm);
 	if (dm_plane_state->shaper_lut)
 		drm_property_blob_get(dm_plane_state->shaper_lut);
 	if (dm_plane_state->lut3d)
@@ -1442,6 +1444,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
 
 	if (dm_plane_state->degamma_lut)
 		drm_property_blob_put(dm_plane_state->degamma_lut);
+	if (dm_plane_state->ctm)
+		drm_property_blob_put(dm_plane_state->ctm);
 	if (dm_plane_state->lut3d)
 		drm_property_blob_put(dm_plane_state->lut3d);
 	if (dm_plane_state->shaper_lut)
@@ -1479,6 +1483,11 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
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
@@ -1536,6 +1545,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -1597,6 +1614,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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

