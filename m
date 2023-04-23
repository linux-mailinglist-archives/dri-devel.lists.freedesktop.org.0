Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561986EC03C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447F10E408;
	Sun, 23 Apr 2023 14:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D9A10E421;
 Sun, 23 Apr 2023 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DSe48vE9nywjx4G3xnygTop+WxvlePBvLA+a/JHlHUc=; b=JIxgWWwNV5I9b+JeGqYfWNgjd/
 8rdv1Drcdv9QZIxwJVANyd5HLbtCLyJJIETXuvP3ivC1Y+Us68jrlyzzfufTze/73gCrizVxU9123
 opcPsg0fkAlNGppOPlNtzSPq2SYKd2lWiMnd3ZnN9T2pEo7lItOuqSSAdCqwC2kHLj0F9uDSgdqSV
 td0yVqEI81iD3lVIlbco7S03v3nAe1rBELF/dPEimmtFKifIBVZt+URe014F5pQ8kWa0kCbQC6Kpr
 C5K9Ke68c/8CTe677l0PGaTwnXYZmlBm4JVOkhN8HCgMmbvHNUtn8LyQ9bWi9+he4fShwiR1rd6GQ
 9jsCqjeQ==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTl-00ANVs-MW; Sun, 23 Apr 2023 16:14:13 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 40/40] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Date: Sun, 23 Apr 2023 13:10:52 -0100
Message-Id: <20230423141051.702990-41-mwen@igalia.com>
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Need to funnel the color caps through to these functions so it can check
that the hardware is capable.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a034c0c0d383..f0b5f09b9146 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -336,6 +336,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 /**
  * __set_input_tf - calculates the input transfer function based on expected
  * input space.
+ * @caps: dc color capabilities
  * @func: transfer function
  * @lut: lookup table that defines the color space
  * @lut_size: size of respective lut.
@@ -343,7 +344,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
  * Returns:
  * 0 in case of success. -ENOMEM if fails.
  */
-static int __set_input_tf(struct dc_transfer_func *func,
+static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
 			  const struct drm_color_lut *lut, uint32_t lut_size)
 {
 	struct dc_gamma *gamma = NULL;
@@ -360,7 +361,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
 		__drm_lut_to_dc_gamma(lut, gamma, false);
 	}
 
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
 
 	if (gamma)
 		dc_gamma_release(&gamma);
@@ -512,7 +513,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
 		func_blend->tf = tf;
 		func_blend->sdr_ref_white_level = 80; /* hardcoded for now */
 
-		ret = __set_input_tf(func_blend, blend_lut, blend_size);
+		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
 	} else {
 		func_blend->type = TF_TYPE_BYPASS;
 		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
@@ -819,7 +820,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 }
 
 static int map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
-					struct dc_plane_state *dc_plane_state)
+					struct dc_plane_state *dc_plane_state,
+					struct dc_color_caps *caps)
 {
 	const struct drm_color_lut *degamma_lut;
 	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
@@ -874,7 +876,7 @@ static int map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 			dc_plane_state->in_transfer_func->tf =
 				TRANSFER_FUNCTION_LINEAR;
 
-		r = __set_input_tf(dc_plane_state->in_transfer_func,
+		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
 				   degamma_lut, degamma_size);
 		if (r)
 			return r;
@@ -887,7 +889,7 @@ static int map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 		dc_plane_state->in_transfer_func->tf = tf;
 
 		if (tf != TRANSFER_FUNCTION_SRGB &&
-		    !mod_color_calculate_degamma_params(NULL,
+		    !mod_color_calculate_degamma_params(caps,
 			    dc_plane_state->in_transfer_func, NULL, false))
 			return -ENOMEM;
 	}
@@ -898,7 +900,8 @@ static int map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 #ifdef CONFIG_STEAM_DECK
 static int
 __set_dm_plane_degamma(struct drm_plane_state *plane_state,
-		       struct dc_plane_state *dc_plane_state)
+		       struct dc_plane_state *dc_plane_state,
+		       struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	const struct drm_color_lut *degamma_lut;
@@ -907,6 +910,9 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	bool has_degamma_lut;
 	int ret;
 
+	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
+		color_caps = &dc_plane_state->ctx->dc->caps.color;
+
 	degamma_lut = __extract_blob_lut(dm_plane_state->degamma_lut, &degamma_size);
 
 	has_degamma_lut = degamma_lut &&
@@ -928,8 +934,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		dc_plane_state->in_transfer_func->type =
 			TF_TYPE_DISTRIBUTED_POINTS;
 
-		ret = __set_input_tf(dc_plane_state->in_transfer_func,
-				   degamma_lut, degamma_size);
+		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
+				     degamma_lut, degamma_size);
 		if (ret)
 			return ret;
        } else {
@@ -945,7 +951,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
-				     struct dc_plane_state *dc_plane_state)
+				     struct dc_plane_state *dc_plane_state,
+				     struct dc_color_caps *color_caps)
 {
 	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
 	enum drm_transfer_function shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
@@ -1014,6 +1021,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct drm_plane_state *plane_state,
 				      struct dc_plane_state *dc_plane_state)
 {
+	struct dc_color_caps *color_caps = NULL;
 	bool has_crtc_cm_degamma;
 	int ret;
 
@@ -1025,11 +1033,11 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
 #ifdef CONFIG_STEAM_DECK
-	ret = amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
+	ret = amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state, color_caps);
 	if(ret)
 		return ret;
 
-	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
+	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -1054,7 +1062,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		 * linearize (implicit degamma) from sRGB/BT709 according to
 		 * the input space.
 		 */
-		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
+		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
 		if (ret)
 			return ret;
 	}
-- 
2.39.2

