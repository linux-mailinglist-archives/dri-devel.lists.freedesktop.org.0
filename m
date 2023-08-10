Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD837777D6F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8279410E5A4;
	Thu, 10 Aug 2023 16:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DAE10E59C;
 Thu, 10 Aug 2023 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8HLJFvw5ac3rOFR8J5I8NEI2fVQ3DMbsgiO0+YioEuQ=; b=fBD5pJPdp0JrTpwy4bdYrzNWz+
 woccX1n4pW6w2pjXc/CY8GeSBxLPhC7gbZMmOzBYPYThWUXq9+IKKfL0qX162OAB5lOBbmk3jJDLm
 Ei7mu2BYnsCPYwOve0braRIjgu2xR7JT++yrC9Jeej499Y9g9h6hcUkEcHbTYQPOSkZMX7tXm+NWE
 cKp8ztMBF1N1fXjjl2svujz2k6xFTClmD1gntYByPQgSo4PU8A6yhXM/dKfRZK7WbcnFdwQs4GyQE
 q4+WuKma5TQiRfO8b5ZAs+4SGESKKWkQpRkRizVoqS2GXVKdXD4Nu8PGP87xgeb1wLUEmgzOYTVbG
 NcMZD+YA==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU896-00GjYD-TU; Thu, 10 Aug 2023 18:04:21 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 29/34] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Date: Thu, 10 Aug 2023 15:03:09 -0100
Message-Id: <20230810160314.48225-30-mwen@igalia.com>
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

Need to funnel the color caps through to these functions so it can check
that the hardware is capable.

v2:
- remove redundant color caps assignment on plane degamma map (Harry)
- pass color caps to degamma params

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 ++++++++++++-------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index f638e5b3a70b..4356846a2bce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -538,6 +538,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 /**
  * __set_input_tf - calculates the input transfer function based on expected
  * input space.
+ * @caps: dc color capabilities
  * @func: transfer function
  * @lut: lookup table that defines the color space
  * @lut_size: size of respective lut.
@@ -545,7 +546,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
  * Returns:
  * 0 in case of success. -ENOMEM if fails.
  */
-static int __set_input_tf(struct dc_transfer_func *func,
+static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
 			  const struct drm_color_lut *lut, uint32_t lut_size)
 {
 	struct dc_gamma *gamma = NULL;
@@ -562,7 +563,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
 		__drm_lut_to_dc_gamma(lut, gamma, false);
 	}
 
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
 
 	if (gamma)
 		dc_gamma_release(&gamma);
@@ -725,7 +726,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
 		func_blend->tf = tf;
 		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 
-		ret = __set_input_tf(func_blend, blend_lut, blend_size);
+		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
 	} else {
 		func_blend->type = TF_TYPE_BYPASS;
 		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
@@ -950,7 +951,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 
 static int
 map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
-			     struct dc_plane_state *dc_plane_state)
+			     struct dc_plane_state *dc_plane_state,
+			     struct dc_color_caps *caps)
 {
 	const struct drm_color_lut *degamma_lut;
 	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
@@ -1005,7 +1007,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 			dc_plane_state->in_transfer_func->tf =
 				TRANSFER_FUNCTION_LINEAR;
 
-		r = __set_input_tf(dc_plane_state->in_transfer_func,
+		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
 				   degamma_lut, degamma_size);
 		if (r)
 			return r;
@@ -1018,7 +1020,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 		dc_plane_state->in_transfer_func->tf = tf;
 
 		if (tf != TRANSFER_FUNCTION_SRGB &&
-		    !mod_color_calculate_degamma_params(NULL,
+		    !mod_color_calculate_degamma_params(caps,
 							dc_plane_state->in_transfer_func,
 							NULL, false))
 			return -ENOMEM;
@@ -1029,7 +1031,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 
 static int
 __set_dm_plane_degamma(struct drm_plane_state *plane_state,
-		       struct dc_plane_state *dc_plane_state)
+		       struct dc_plane_state *dc_plane_state,
+		       struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	const struct drm_color_lut *degamma_lut;
@@ -1060,7 +1063,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		dc_plane_state->in_transfer_func->type =
 			TF_TYPE_DISTRIBUTED_POINTS;
 
-		ret = __set_input_tf(dc_plane_state->in_transfer_func,
+		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
 				     degamma_lut, degamma_size);
 		if (ret)
 			return ret;
@@ -1068,7 +1071,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		dc_plane_state->in_transfer_func->type =
 			TF_TYPE_PREDEFINED;
 
-		if (!mod_color_calculate_degamma_params(NULL,
+		if (!mod_color_calculate_degamma_params(color_caps,
 		    dc_plane_state->in_transfer_func, NULL, false))
 			return -ENOMEM;
 	}
@@ -1077,7 +1080,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
-				     struct dc_plane_state *dc_plane_state)
+				     struct dc_plane_state *dc_plane_state,
+				     struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
@@ -1147,6 +1151,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state)
 {
 	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
+	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
 
@@ -1156,6 +1161,9 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		return ret;
 	}
 
+	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
+		color_caps = &dc_plane_state->ctx->dc->caps.color;
+
 	/* Initially, we can just bypass the DGM block. */
 	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
 	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
@@ -1163,7 +1171,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	/* After, we start to update values according to color props */
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
-	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
+	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
 	if (ret == -ENOMEM)
 		return ret;
 
@@ -1189,10 +1197,11 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		 * linearize (implicit degamma) from sRGB/BT709 according to
 		 * the input space.
 		 */
-		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
+		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
 		if (ret)
 			return ret;
 	}
 
-	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
+	return amdgpu_dm_plane_set_color_properties(plane_state,
+						    dc_plane_state, color_caps);
 }
-- 
2.40.1

