Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A67BA7B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4324510E469;
	Thu,  5 Oct 2023 17:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684D010E463;
 Thu,  5 Oct 2023 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xR+3whyKz9oUvzmEselgXe2DNwye6JNI6rUm5SQmDBw=; b=gmHcE47okjnZuk8bh3+PImR44d
 Miw/0ONb/TuTSva4E9ZHmVgdTwUNBkq62eeqbxQJ5RHHh+MqYwJH5ff+Lg7QCZ4XSVu6pf//0Alxf
 vuroLOoLeG/n5cuNAua6pYS1Gq7SshE5xhePx2HEAPTnThAtvcO+vGBCt3pPPXeCxZisEcXuYI+my
 bXZIGrS+s8vno3fm9S1EjWaUGQdnKgqQeQ4T8gDZLwXaqONfjKj+RJfk6/7MOV+FPdI4HBhiD7gkT
 Lu1ZKwpmD9bD1JcP4/gZdjzhyLJHGjbYEIZpB4a7EaN2uFrXZ0rxJ7q8qEojerUW7gHjsIEyfU0/l
 Qrfygpmw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxe-00CFJN-DT; Thu, 05 Oct 2023 19:16:30 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 28/32] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Date: Thu,  5 Oct 2023 16:15:23 -0100
Message-Id: <20231005171527.203657-29-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Need to funnel the color caps through to these functions so it can check
that the hardware is capable.

v2:
- remove redundant color caps assignment on plane degamma map (Harry)
- pass color caps to degamma params

v3:
- remove unused color_caps parameter from set_color_properties (Harry)

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0909ed5639bf..251b5f14bd89 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -564,6 +564,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 /**
  * __set_input_tf - calculates the input transfer function based on expected
  * input space.
+ * @caps: dc color capabilities
  * @func: transfer function
  * @lut: lookup table that defines the color space
  * @lut_size: size of respective lut.
@@ -571,7 +572,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
  * Returns:
  * 0 in case of success. -ENOMEM if fails.
  */
-static int __set_input_tf(struct dc_transfer_func *func,
+static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
 			  const struct drm_color_lut *lut, uint32_t lut_size)
 {
 	struct dc_gamma *gamma = NULL;
@@ -588,7 +589,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
 		__drm_lut_to_dc_gamma(lut, gamma, false);
 	}
 
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
 
 	if (gamma)
 		dc_gamma_release(&gamma);
@@ -752,7 +753,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
 		func_blend->tf = tf;
 		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 
-		ret = __set_input_tf(func_blend, blend_lut, blend_size);
+		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
 	} else {
 		func_blend->type = TF_TYPE_BYPASS;
 		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
@@ -968,7 +969,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 
 static int
 map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
-			     struct dc_plane_state *dc_plane_state)
+			     struct dc_plane_state *dc_plane_state,
+			     struct dc_color_caps *caps)
 {
 	const struct drm_color_lut *degamma_lut;
 	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
@@ -1023,7 +1025,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 			dc_plane_state->in_transfer_func->tf =
 				TRANSFER_FUNCTION_LINEAR;
 
-		r = __set_input_tf(dc_plane_state->in_transfer_func,
+		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
 				   degamma_lut, degamma_size);
 		if (r)
 			return r;
@@ -1036,7 +1038,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 		dc_plane_state->in_transfer_func->tf = tf;
 
 		if (tf != TRANSFER_FUNCTION_SRGB &&
-		    !mod_color_calculate_degamma_params(NULL,
+		    !mod_color_calculate_degamma_params(caps,
 							dc_plane_state->in_transfer_func,
 							NULL, false))
 			return -ENOMEM;
@@ -1047,7 +1049,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 
 static int
 __set_dm_plane_degamma(struct drm_plane_state *plane_state,
-		       struct dc_plane_state *dc_plane_state)
+		       struct dc_plane_state *dc_plane_state,
+		       struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	const struct drm_color_lut *degamma_lut;
@@ -1078,7 +1081,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		dc_plane_state->in_transfer_func->type =
 			TF_TYPE_DISTRIBUTED_POINTS;
 
-		ret = __set_input_tf(dc_plane_state->in_transfer_func,
+		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
 				     degamma_lut, degamma_size);
 		if (ret)
 			return ret;
@@ -1086,7 +1089,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		dc_plane_state->in_transfer_func->type =
 			TF_TYPE_PREDEFINED;
 
-		if (!mod_color_calculate_degamma_params(NULL,
+		if (!mod_color_calculate_degamma_params(color_caps,
 		    dc_plane_state->in_transfer_func, NULL, false))
 			return -ENOMEM;
 	}
@@ -1165,6 +1168,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state)
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
+	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
 
@@ -1174,6 +1178,9 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		return ret;
 	}
 
+	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
+		color_caps = &dc_plane_state->ctx->dc->caps.color;
+
 	/* Initially, we can just bypass the DGM block. */
 	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
 	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
@@ -1181,7 +1188,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
-	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
+	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
 	if (ret == -ENOMEM)
 		return ret;
 
@@ -1208,7 +1215,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		 * linearize (implicit degamma) from sRGB/BT709 according to
 		 * the input space.
 		 */
-		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
+		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
 		if (ret)
 			return ret;
 	}
-- 
2.40.1

