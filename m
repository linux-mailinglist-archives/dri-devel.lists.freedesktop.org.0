Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF5870E8F9
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AEA10E54C;
	Tue, 23 May 2023 22:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187610E4FE;
 Tue, 23 May 2023 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kg8o3n1Ivn4wLajrNZLigYd2IY82VNZtW40nr3NAhgc=; b=WgTWoIjA7qkyNA84LkosHydU5c
 BdmSBVmTPEKpUFWupQA0CncpbFfpPuI+a9HD6E+nA5QRVYxURv0DM4O/DmK6mE7IRHnDffB83tgPO
 QPCuDXERKFzHkiuDwgegOHjtq/Spdn98Tpe7J0lmb6qpFG60fRWjHOR3TazXDWZL+qJ72zy3832oS
 4QeiNXiu4ztVM16iQnr4VbzPrn1tHyVz6s+hTc/P5aVDu/9Rn1fDBkPINwcRWq66nYBUFDkN/BLo/
 iCjjeO65cDU/6SFGkj55vlvuNnv8lzmTzcCbE/MexOgypKCZotv6tUrSJiP+4yTGfV1gtHUBM1WVo
 5yfOrpNg==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIk-00HEOv-Nx; Wed, 24 May 2023 00:16:18 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 36/36] drm/amd/display: allow newer DC hardware to use degamma
 ROM for PQ/HLG
Date: Tue, 23 May 2023 21:15:20 -0100
Message-Id: <20230523221520.3115570-37-mwen@igalia.com>
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

Need to funnel the color caps through to these functions so it can check
that the hardware is capable.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 ++++++++++++-------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 4a2b66568451..714f07bb9c9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -338,6 +338,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 /**
  * __set_input_tf - calculates the input transfer function based on expected
  * input space.
+ * @caps: dc color capabilities
  * @func: transfer function
  * @lut: lookup table that defines the color space
  * @lut_size: size of respective lut.
@@ -345,7 +346,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
  * Returns:
  * 0 in case of success. -ENOMEM if fails.
  */
-static int __set_input_tf(struct dc_transfer_func *func,
+static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
 			  const struct drm_color_lut *lut, uint32_t lut_size)
 {
 	struct dc_gamma *gamma = NULL;
@@ -362,7 +363,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
 		__drm_lut_to_dc_gamma(lut, gamma, false);
 	}
 
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
 
 	if (gamma)
 		dc_gamma_release(&gamma);
@@ -511,7 +512,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
 		func_blend->tf = tf;
 		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 
-		ret = __set_input_tf(func_blend, blend_lut, blend_size);
+		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
 	} else {
 		func_blend->type = TF_TYPE_BYPASS;
 		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
@@ -818,7 +819,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 
 static int
 map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
-			     struct dc_plane_state *dc_plane_state)
+			     struct dc_plane_state *dc_plane_state,
+			     struct dc_color_caps *caps)
 {
 	const struct drm_color_lut *degamma_lut;
 	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
@@ -873,7 +875,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 			dc_plane_state->in_transfer_func->tf =
 				TRANSFER_FUNCTION_LINEAR;
 
-		r = __set_input_tf(dc_plane_state->in_transfer_func,
+		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
 				   degamma_lut, degamma_size);
 		if (r)
 			return r;
@@ -886,7 +888,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 		dc_plane_state->in_transfer_func->tf = tf;
 
 		if (tf != TRANSFER_FUNCTION_SRGB &&
-		    !mod_color_calculate_degamma_params(NULL,
+		    !mod_color_calculate_degamma_params(caps,
 							dc_plane_state->in_transfer_func,
 							NULL, false))
 			return -ENOMEM;
@@ -897,7 +899,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 
 static int
 __set_dm_plane_degamma(struct drm_plane_state *plane_state,
-		       struct dc_plane_state *dc_plane_state)
+		       struct dc_plane_state *dc_plane_state,
+		       struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	const struct drm_color_lut *degamma_lut;
@@ -906,6 +909,9 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	bool has_degamma_lut;
 	int ret;
 
+	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
+		color_caps = &dc_plane_state->ctx->dc->caps.color;
+
 	degamma_lut = __extract_blob_lut(dm_plane_state->degamma_lut,
 					 &degamma_size);
 
@@ -928,7 +934,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		dc_plane_state->in_transfer_func->type =
 			TF_TYPE_DISTRIBUTED_POINTS;
 
-		ret = __set_input_tf(dc_plane_state->in_transfer_func,
+		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
 				     degamma_lut, degamma_size);
 		if (ret)
 			return ret;
@@ -945,7 +951,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
-				     struct dc_plane_state *dc_plane_state)
+				     struct dc_plane_state *dc_plane_state,
+				     struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	enum drm_transfer_function shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
@@ -1013,9 +1020,13 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
+	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
 
+	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
+		color_caps = &dc_plane_state->ctx->dc->caps.color;
+
 	/* Initially, we can just bypass the DGM block. */
 	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
 	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
@@ -1023,7 +1034,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
-	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
+	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
 	if (ret == -ENOMEM)
 		return ret;
 
@@ -1049,11 +1060,11 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		 * linearize (implicit degamma) from sRGB/BT709 according to
 		 * the input space.
 		 */
-		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
+		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
 		if (ret)
 			return ret;
 	}
 
 	return amdgpu_dm_plane_set_color_properties(plane_state,
-						    dc_plane_state);
+						    dc_plane_state, color_caps);
 }
-- 
2.39.2

