Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B056628E5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009B10E4A6;
	Mon,  9 Jan 2023 14:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5C010E44A;
 Mon,  9 Jan 2023 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qSDyQmdE5bEHApGBRVBbuA6qGY5F6QCsHw91603xSjI=; b=KMTWCybUZ+YkUUT62lAo6SbkVV
 6OHaMQn50EPHQJgSxAqHag3gg0B+/lxw009HeBHyRgzWWXAJhlDtCOsx5EThomWvNX0Wsy5uQDX3h
 oMdMJMuNCWnU6KfWoDNGnAoU2noWDMybh702kg/8QyLTihZCFgAamCGTd5QybGiamrLGoEaNhWfuX
 oYk78oRwZj0i9HvLi6at0HFV2NZ0XO1ivQbDYK6K4WmyomusE0J1dPnwfi9Kf19sQQ/MgkqUJrrTQ
 sLIDtYKMZQTG8wkfVs+S5uAfLR9jRHuDJGL5bD39SbxQLAiUnqsiV5RicGSJ0v7iFSbYxFTzKBp+F
 NbVewx4A==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtO9-003TyM-Nv; Mon, 09 Jan 2023 15:44:37 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 18/18] drm/amd/display: add user shaper LUT support to
 amdgpu_dm color pipeline
Date: Mon,  9 Jan 2023 13:38:46 -0100
Message-Id: <20230109143846.1966301-19-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now, we can use shaper LUT to delinearize and/or normalize the color
space for a more efficient 3D LUT support (so far, only for DRM atomic
color mgmt). If a degamma 1D LUT is passed to linearize the color space,
a custom shaper 1D LUT can be used before applying 3D LUT.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 95 ++++++++++++++++---
 1 file changed, 83 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 8a930f9bce60..81b20ac9ff19 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -497,14 +497,62 @@ static void amdgpu_dm_atomic_lut3d(struct dc_stream_state *stream,
 	stream->lut3d_func = lut;
 }
 
+static int __set_func_shaper(struct dc_transfer_func *shaper_func,
+			     const struct drm_color_lut *lut, uint32_t lut_size)
+{
+	struct dc_gamma *gamma = NULL;
+	struct calculate_buffer cal_buffer = {0};
+	bool res;
+
+	ASSERT(lut && lut_size == MAX_COLOR_LUT_ENTRIES);
+
+	cal_buffer.buffer_index = -1;
+
+	gamma = dc_create_gamma();
+	if (!gamma)
+		return -ENOMEM;
+
+	gamma->num_entries = lut_size;
+	__drm_lut_to_dc_gamma(lut, gamma, false);
+
+	/*
+	 * Color module doesn't like calculating gamma params
+	 * on top of a linear input. But degamma params can be used
+	 * instead to simulate this.
+	 */
+	gamma->type = GAMMA_CUSTOM;
+	res = mod_color_calculate_degamma_params(NULL, shaper_func, gamma, true);
+
+	dc_gamma_release(&gamma);
+
+	return res ? 0 : -ENOMEM;
+}
+
 static int amdgpu_dm_atomic_shaper_lut(struct dc_stream_state *stream,
+				       const struct drm_color_lut *shaper_lut,
+				       uint32_t shaper_size,
 				       struct dc_transfer_func *func_shaper_new)
 {
-	/* We don't get DRM shaper LUT yet. We assume the input color space is already
+	/* If no DRM shaper LUT, we assume the input color space is already
 	 * delinearized, so we don't need a shaper LUT and we can just BYPASS
 	 */
-	func_shaper_new->type = TF_TYPE_BYPASS;
-	func_shaper_new->tf = TRANSFER_FUNCTION_LINEAR;
+	if (!shaper_size) {
+		func_shaper_new->type = TF_TYPE_BYPASS;
+		func_shaper_new->tf = TRANSFER_FUNCTION_LINEAR;
+	} else {
+		int r;
+
+		/* If DRM shaper LUT is set, we assume a linear color space
+		 * (linearized by DRM degamma 1D LUT or not)
+		 */
+		func_shaper_new->type = TF_TYPE_DISTRIBUTED_POINTS;
+		func_shaper_new->tf = TRANSFER_FUNCTION_LINEAR;
+
+		r = __set_func_shaper(func_shaper_new, shaper_lut, shaper_size);
+		if (r)
+			return r;
+	}
+
 	stream->func_shaper = func_shaper_new;
 
 	return 0;
@@ -514,6 +562,8 @@ static int amdgpu_dm_atomic_shaper_lut(struct dc_stream_state *stream,
  * interface
  * @dc: Display Core control structure
  * @stream: DC stream state to set shaper LUT and 3D LUT
+ * @drm_shaper_lut: DRM CRTC (user) shaper LUT
+ * @drm_shaper_size: size of shaper LUT
  * @drm_lut3d: DRM CRTC (user) 3D LUT
  * @drm_lut3d_size: size of 3D LUT
  *
@@ -522,6 +572,8 @@ static int amdgpu_dm_atomic_shaper_lut(struct dc_stream_state *stream,
  */
 static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 					 struct dc_stream_state *stream,
+					 const struct drm_color_lut *drm_shaper_lut,
+					 uint32_t drm_shaper_size,
 					 const struct drm_color_lut *drm_lut3d,
 					 uint32_t drm_lut3d_size,
 					 const struct drm_mode_lut3d_mode *mode)
@@ -532,11 +584,11 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc *dc,
 	lut3d_func_new = (struct dc_3dlut *) stream->lut3d_func;
 	func_shaper_new = (struct dc_transfer_func *) stream->func_shaper;
 
-
 	amdgpu_dm_atomic_lut3d(stream, drm_lut3d, drm_lut3d_size,
 			       mode, lut3d_func_new);
 
-	return amdgpu_dm_atomic_shaper_lut(stream, func_shaper_new);
+	return amdgpu_dm_atomic_shaper_lut(stream, drm_shaper_lut,
+					   drm_shaper_size, func_shaper_new);
 }
 
 static const struct drm_mode_lut3d_mode *
@@ -569,13 +621,23 @@ get_lut3d_mode(struct amdgpu_device *adev,
 int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
 				const struct drm_crtc_state *crtc_state)
 {
-	const struct drm_color_lut *lut3d = NULL;
+	const struct drm_color_lut *shaper = NULL, *lut3d = NULL;
 	const struct drm_mode_lut3d_mode *mode;
 	uint32_t exp_size, size;
 
+	/* shaper LUT is only available if 3D LUT color caps*/
+	exp_size = has_mpc_lut3d_caps(&adev->dm) ? MAX_COLOR_LUT_ENTRIES : 0;
+	shaper = __extract_blob_lut(crtc_state->shaper_lut, &size);
+
+	if (shaper && size != exp_size) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Shaper LUT size. Should be %u but got %u.\n",
+			exp_size, size);
+		return -EINVAL;
+	}
+
 	mode = get_lut3d_mode(adev, crtc_state);
 	exp_size = mode ? mode->lut_size * mode->lut_size * mode->lut_size : 0;
-
 	lut3d = __extract_blob_lut(crtc_state->lut3d, &size);
 
 	if (lut3d && size != exp_size) {
@@ -617,11 +679,11 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	bool has_rom = adev->asic_type <= CHIP_RAVEN;
 	struct drm_color_ctm *ctm = NULL;
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
-	const struct drm_color_lut *lut3d;
+	const struct drm_color_lut *shaper_lut, *lut3d;
 	uint32_t degamma_size, regamma_size;
-	uint32_t lut3d_size;
+	uint32_t lut3d_size, shaper_size;
 	bool has_regamma, has_degamma;
-	bool has_lut3d;
+	bool has_lut3d, has_shaper_lut;
 	bool is_legacy;
 	int r;
 
@@ -634,12 +696,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 		return r;
 
 	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
+	shaper_lut = __extract_blob_lut(crtc->base.shaper_lut, &shaper_size);
 	lut3d = __extract_blob_lut(crtc->base.lut3d, &lut3d_size);
 	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
 
 	has_degamma =
 		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
 
+	has_shaper_lut = shaper_lut != NULL;
 	has_lut3d = lut3d != NULL;
 
 	has_regamma =
@@ -680,10 +744,17 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 			return r;
 	} else {
 		if (has_lut3d) {
-			r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, stream, lut3d, lut3d_size,
+			/* enable 3D LUT only for DRM atomic color mgmt */
+			shaper_size = has_shaper_lut ? shaper_size : 0;
+
+			r = amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, stream,
+							  shaper_lut, shaper_size,
+							  lut3d, lut3d_size,
 							  get_lut3d_mode(adev, &crtc->base));
-			if (r)
+			if (r) {
+				DRM_DEBUG_DRIVER("Failed to set shaper and 3D LUT\n");
 				return r;
+			}
 		}
 		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
 		 * See params and set_output_gamma in
-- 
2.35.1

