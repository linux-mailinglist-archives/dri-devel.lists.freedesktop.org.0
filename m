Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725FB70E8F7
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39B210E50F;
	Tue, 23 May 2023 22:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E76110E51A;
 Tue, 23 May 2023 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wVVCA15czvVkx5reO8SZXQtXiIa7amKsBMdm5Yn1wvk=; b=cWI1oGMjH7MOK3M3Jrp0K829UT
 P1lXtmtVXzVXyICjN0L3tOk3xqnIjM6uLqWDm0l19whW5zxyWMIhb0c9hh1JjTY9UXyIH4G5M+E4L
 S2bAxtQb/DdVlTvAKOKhzr4lNu3EuKfbITtngysjFqkgXvGaHt2RGzYHDeX0lG3uyXcDd8QE5Jg26
 azm7kdEB9+ZyISsyVrjXKHj/pCDD3hnQJnEjXVpWlZhh7aH4AKEFEiALrvGiiqrxUKXCQ1VEGRbRq
 BlQFwi3jDq6WognyZOTHMCfyt95I3a5SjABn7/ahf2ShmTykjxeNgVcSNRzDxBCer5UYjOUAz+drx
 E3K3P0Jg==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIP-00HEOv-31; Wed, 24 May 2023 00:15:57 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 22/36] drm/amd/display: add CRTC shaper LUT support
Date: Tue, 23 May 2023 21:15:06 -0100
Message-Id: <20230523221520.3115570-23-mwen@igalia.com>
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

Map DC shaper LUT to DM CRTC color management. Shaper LUT can be used to
delinearize and/or normalize the color space for computational
efficiency and achiving specific visual styles. Blending usually occurs
in linear space and if a CRTC degamma 1D LUT is set to linearize the
color space, a custom shaper 1D LUT can be used just before applying 3D
LUT.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 54 ++++++++++++++-----
 2 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index eebe12c353ad..ea76c2957848 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -803,6 +803,13 @@ struct dm_crtc_state {
 	 * has a larger set of post-blending color calibration. Here, DC MPC
 	 * color caps are wired up to DM CRTC state:
 	 */
+	/**
+	 * @shaper_lut:
+	 *
+	 * Post-blending 1D Lookup table used to de-linearize pixel data for 3D
+	 * LUT. The blob (if not NULL) is an array of &struct drm_color_lut.
+	 */
+	struct drm_property_blob *shaper_lut;
 	/**
 	 * @lut3d:
 	 *
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index cef8d0d7f37b..934636d7b8d3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -443,15 +443,26 @@ static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut,
 	}
 }
 
-static int amdgpu_dm_atomic_shaper_lut(struct dc_transfer_func *func_shaper)
+static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
+				       uint32_t shaper_size,
+				       struct dc_transfer_func *func_shaper)
 {
-	/* We don't get DRM shaper LUT yet. We assume the input color space is already
-	 * delinearized, so we don't need a shaper LUT and we can just BYPASS
-	 */
-	func_shaper->type = TF_TYPE_BYPASS;
-	func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+	int ret = 0;
 
-	return 0;
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
 }
 
 /* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT to DC
@@ -499,7 +510,8 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 
 	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
 
-	return amdgpu_dm_atomic_shaper_lut(func_shaper);
+	return amdgpu_dm_atomic_shaper_lut(drm_shaper_lut,
+					   drm_shaper_size, func_shaper);
 }
 
 /**
@@ -531,12 +543,22 @@ static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
 int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 				const struct drm_crtc_state *crtc_state)
 {
-	const struct drm_color_lut *lut3d = NULL;
 	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc_state);
+	const struct drm_color_lut *shaper = NULL, *lut3d = NULL;
 	uint32_t exp_size, size;
 
-	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_3DLUT_ENTRIES);
+	/* shaper LUT is only available if 3D LUT color caps*/
+	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_LUT_ENTRIES);
+	shaper = __extract_blob_lut(acrtc_state->shaper_lut, &size);
 
+	if (shaper && size != exp_size) {
+		drm_dbg(&adev->ddev,
+			"Invalid Shaper LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
+	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_3DLUT_ENTRIES);
 	lut3d = __extract_blob_lut(acrtc_state->lut3d, &size);
 
 	if (lut3d && size != exp_size) {
@@ -618,15 +640,16 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 	uint32_t degamma_size, regamma_size;
 	bool has_regamma, has_degamma;
 	bool is_legacy;
+	const struct drm_color_lut *shaper_lut, *lut3d;
+	uint32_t shaper_size, lut3d_size;
 	int r;
-	const struct drm_color_lut *lut3d;
-	uint32_t lut3d_size;
 
 	r =  amdgpu_dm_verify_lut3d_size(adev, &crtc->base);
 	if (r)
 		return r;
 
 	lut3d = __extract_blob_lut(crtc->lut3d, &lut3d_size);
+	shaper_lut = __extract_blob_lut(crtc->shaper_lut, &shaper_size);
 
 	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
 	if (r)
@@ -680,11 +703,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 		 * there is no user-blob.
 		 */
 		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
 		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
-						  NULL, 0,
+						  shaper_lut, shaper_size,
 						  lut3d, lut3d_size);
-		if (r)
+		if (r) {
+			drm_dbg(&adev->ddev, "Failed on shaper/3D LUTs setup\n");
 			return r;
+		}
 
 		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
 		 * See params and set_output_gamma in
-- 
2.39.2

