Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC67ADFFE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCE010E308;
	Mon, 25 Sep 2023 19:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E320410E2FE;
 Mon, 25 Sep 2023 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aILwgNfLvN/WKKIefWHbPKN+5o2tYhwm9bxdN75+vqE=; b=kWFY1EODr52yFfkgzSeyDtMB6e
 ewQJwFkpY6UDx2FX9zua1ny/EfpUt+gYCEK90C3vHnJDfqmMHMzSf+qhtSZGjQOICsSIrBUBjKCm5
 erGe4LpxLGhngr5DUCDDX/vEbLeuNieJ4yiDc1PY02NlPWc7LSOysryJN8DaHz/yzyQctKDSlOGPa
 Dil2c/JM78TriHN3taVjByVyFPmP5MSBkBZuxQAlXd1iz6FctTfHp4lOkQP6IGwg8ALH03xahn8G0
 0mZn7w0Zk38zacdr+6Few5pAsYrORhi5R7IcKkKhqeW49SFPWW1x/PaPSRW2m/k7cUe8dMsz/Nlog
 GEz1Jpvw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrb9-008GsG-NE; Mon, 25 Sep 2023 21:50:27 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 23/32] drm/amd/display: add plane shaper LUT support
Date: Mon, 25 Sep 2023 18:49:23 -0100
Message-Id: <20230925194932.1329483-24-mwen@igalia.com>
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

Map DC shaper LUT to DM plane color management. Shaper LUT can be used
to delinearize and/or normalize the color space for computational
efficiency and achiving specific visual styles. If a plane degamma is
apply to linearize the color space, a custom shaper 1D LUT can be used
just before applying 3D LUT.

v2:
- use DPP color caps to verify plane 3D LUT support
- add debug message if shaper LUT programming fails

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 108 +++++++++++++++++-
 3 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 455b690d6185..af18c523c431 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8185,6 +8185,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].in_transfer_func = dc_plane->in_transfer_func;
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
 			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
+			bundle->surface_updates[planes_count].func_shaper = dc_plane->in_shaper_func;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index b7b1d67f87a0..ad583cc97f15 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -897,6 +897,8 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 /* 3D LUT max size is 17x17x17 */
 #define MAX_COLOR_3DLUT_ENTRIES 4913
 #define MAX_COLOR_3DLUT_BITDEPTH 12
+int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
+				struct drm_plane_state *plane_state);
 /* 1D LUT size */
 #define MAX_COLOR_LUT_ENTRIES 4096
 /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 577a9dc669a5..8c991b5cf473 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -594,6 +594,74 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
+				       uint32_t shaper_size,
+				       struct dc_transfer_func *func_shaper)
+{
+	int ret = 0;
+
+	if (shaper_size) {
+		/* If DRM shaper LUT is set, we assume a linear color space
+		 * (linearized by DRM degamma 1D LUT or not)
+		 */
+		func_shaper->type = TF_TYPE_DISTRIBUTED_POINTS;
+		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+
+		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, false);
+	} else {
+		func_shaper->type = TF_TYPE_BYPASS;
+		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+	}
+
+	return ret;
+}
+
+/* amdgpu_dm_lut3d_size - get expected size according to hw color caps
+ * @adev: amdgpu device
+ * @lut_size: default size
+ *
+ * Return:
+ * lut_size if DC 3D LUT is supported, zero otherwise.
+ */
+static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
+					 uint32_t lut_size)
+{
+	return adev->dm.dc->caps.color.dpp.hw_3d_lut ? lut_size : 0;
+}
+
+/**
+ * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and if DRM 3D
+ * LUT matches the hw supported size
+ * @adev: amdgpu device
+ * @crtc_state: the DRM CRTC state
+ *
+ * Verifies if post-blending (MPC) 3D LUT is supported by the HW (DCN 3.0 or
+ * newer) and if the DRM 3D LUT matches the supported size.
+ *
+ * Returns:
+ * 0 on success. -EINVAL if lut size are invalid.
+ */
+int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
+				struct drm_plane_state *plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	const struct drm_color_lut *shaper = NULL;
+	uint32_t exp_size, size;
+
+	/* shaper LUT is only available if 3D LUT color caps*/
+	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_LUT_ENTRIES);
+	shaper = __extract_blob_lut(dm_plane_state->shaper_lut, &size);
+
+	if (shaper && size != exp_size) {
+		drm_dbg(&adev->ddev,
+			"Invalid Shaper LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
  * @crtc_state: the DRM CRTC state
@@ -881,6 +949,34 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
+				     struct dc_plane_state *dc_plane_state)
+{
+	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	const struct drm_color_lut *shaper_lut;
+	uint32_t shaper_size;
+	int ret;
+
+	/* We have nothing to do here, return */
+	if (!plane_state->color_mgmt_changed)
+		return 0;
+
+	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
+
+	shaper_lut = __extract_blob_lut(dm_plane_state->shaper_lut, &shaper_size);
+	shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+	ret = amdgpu_dm_atomic_shaper_lut(shaper_lut, shaper_size,
+					  dc_plane_state->in_shaper_func);
+	if (ret)
+		drm_dbg_kms(plane_state->plane->dev,
+			    "setting plane %d shaper LUT failed.\n",
+			    plane_state->plane->index);
+
+	return ret;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -898,10 +994,16 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
-	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
 	bool has_crtc_cm_degamma;
 	int ret;
 
+	ret = amdgpu_dm_verify_lut3d_size(adev, plane_state);
+	if (ret) {
+		drm_dbg_driver(&adev->ddev, "amdgpu_dm_verify_lut3d_size() failed\n");
+		return ret;
+	}
+
 	/* Initially, we can just bypass the DGM block. */
 	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
 	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
@@ -909,8 +1011,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
-	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
-
 	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
 	if (ret == -ENOMEM)
 		return ret;
@@ -942,5 +1042,5 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 			return ret;
 	}
 
-	return 0;
+	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
-- 
2.40.1

