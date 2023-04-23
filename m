Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E56EC023
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3373D10E405;
	Sun, 23 Apr 2023 14:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBFA10E3F9;
 Sun, 23 Apr 2023 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Muyaau4YvOlEED9C4uAM8ak2NdSxTNzeXN9VmH4gVg8=; b=RIi/I6X7R9U2EXTQ/46iYBOgt/
 Q16kxpKaEe9OCsrh6q1xeW46Kdite61TIWCNgJO7BP2xVORvhdoAlVp/FPTGO1UEsL0YSP6HvsX6v
 3DVGj2y8myl1uSjUAxLlH3PWtJPvmgwJQts9Jk9zsMX/3ZhuXm5nEupcNFflaIaSy/aL6UNK4x0/n
 PHuvrrunJQIMhtBoZovf0grLgxPWY1blvEKTahV9ca8F1GuZkloaqyjbURld8CZJ7A5l+AYaeFDzd
 nrjgbi5Uuf6UaEvPqJKVA/r8qHHpGLEnnXsh2aub327MWsVnlW/v5DIy0yOLKtwbrayNuePqlougm
 yQArAa1g==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaSy-00ANVs-8n; Sun, 23 Apr 2023 16:13:24 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 26/40] drm/amd/display: add CRTC shaper LUT support to amd
 color pipeline
Date: Sun, 23 Apr 2023 13:10:38 -0100
Message-Id: <20230423141051.702990-27-mwen@igalia.com>
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

Now, we can use DRM CRTC shaper LUT to delinearize and/or normalize the
color space for a more efficient 3D LUT support (so far, only for DRM
atomic color mgmt). If a degamma 1D LUT is passed to linearize the color
space, a custom shaper 1D LUT can be used before applying 3D LUT.

NOTE: although DRM CRTC shaper and 3D LUTs are optional properties, from
our tests, AMD HW doesn't allow 3D LUT when shaper LUT is set to BYPASS
(without user shaper LUT)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 81 +++++++++----------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 672ca5e9e59c..ff29be3929af 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -443,46 +443,26 @@ static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut,
 	}
 }
 
-/**
- * __set_input_tf - calculates the input transfer function based on expected
- * input space.
- * @func: transfer function
- * @lut: lookup table that defines the color space
- * @lut_size: size of respective lut.
- *
- * Returns:
- * 0 in case of success. -ENOMEM if fails.
- */
-static int __set_input_tf(struct dc_transfer_func *func,
-			  const struct drm_color_lut *lut, uint32_t lut_size)
+static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
+				       uint32_t shaper_size,
+				       struct dc_transfer_func *func_shaper)
 {
-	struct dc_gamma *gamma = NULL;
-	bool res;
-
-	gamma = dc_create_gamma();
-	if (!gamma)
-		return -ENOMEM;
-
-	gamma->type = GAMMA_CUSTOM;
-	gamma->num_entries = lut_size;
-
-	__drm_lut_to_dc_gamma(lut, gamma, false);
-
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, true);
-	dc_gamma_release(&gamma);
+	int ret = 0;
 
-	return res ? 0 : -ENOMEM;
-}
+	if (shaper_size) {
+		/* If DRM shaper LUT is set, we assume a linear color space
+		 * (linearized by DRM degamma 1D LUT or not)
+		 */
+		func_shaper->type = TF_TYPE_DISTRIBUTED_POINTS;
+		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
 
-static int amdgpu_dm_atomic_shaper_lut(struct dc_transfer_func *func_shaper)
-{
-	/* We don't get DRM shaper LUT yet. We assume the input color space is already
-	 * delinearized, so we don't need a shaper LUT and we can just BYPASS
-	 */
-	func_shaper->type = TF_TYPE_BYPASS;
-	func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, false);
+	} else {
+		func_shaper->type = TF_TYPE_BYPASS;
+		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+	}
 
-	return 0;
+	return ret;
 }
 
 /* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT to DC
@@ -530,7 +510,8 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 
 	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
 
-	return amdgpu_dm_atomic_shaper_lut(func_shaper);
+	return amdgpu_dm_atomic_shaper_lut(drm_shaper_lut,
+					   drm_shaper_size, func_shaper);
 }
 
 /**
@@ -562,12 +543,22 @@ static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
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
+		DRM_DEBUG_DRIVER(
+			"Invalid Shaper LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
+	exp_size = amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_3DLUT_ENTRIES);
 	lut3d = __extract_blob_lut(acrtc_state->lut3d, &size);
 
 	if (lut3d && size != exp_size) {
@@ -652,14 +643,15 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 	bool is_legacy;
 	int r;
 #ifdef CONFIG_STEAM_DECK
-	const struct drm_color_lut *lut3d;
-	uint32_t lut3d_size;
+	const struct drm_color_lut *shaper_lut, *lut3d;
+	uint32_t shaper_size, lut3d_size;
 
 	r =  amdgpu_dm_verify_lut3d_size(adev, &crtc->base);
 	if (r)
 		return r;
 
 	lut3d = __extract_blob_lut(crtc->lut3d, &lut3d_size);
+	shaper_lut = __extract_blob_lut(crtc->shaper_lut, &shaper_size);
 #endif
 
 	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
@@ -711,11 +703,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 	} else {
 #ifdef CONFIG_STEAM_DECK
 		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
 		r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
-						  NULL, 0,
+						  shaper_lut, shaper_size,
 						  lut3d, lut3d_size);
-		if (r)
+		if (r) {
+			DRM_DEBUG_DRIVER("Failed on shaper/3D LUTs setup\n");
 			return r;
+		}
 #endif
 		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
 		 * See params and set_output_gamma in
-- 
2.39.2

