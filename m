Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13AE70E8DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFC310E51D;
	Tue, 23 May 2023 22:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EFC10E51B;
 Tue, 23 May 2023 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e+rWMT3cwEckRxaa1fRAT6sfqiG/XJriC6djQ+c3y7U=; b=kDOWVI/E1k6G7dHJuHW0lBgo75
 Pid2CARB8LxnH7ugJ83r4eOj41lhy0y6AyFO4nGmlo7qJiGYRcE7lwXAYfKWLYEPg/lT28E0plRl9
 3f2ECTJrmMB+s7/R6xZJc9dG8+eqrDltCZNmpaowXdNAJsBnb/SonZujuchfgK97alhG5Gy5BFdm2
 0ai4qb9h47V7IRntj/jmGchflQQpkB9jDJ/q4sJ3L/xBrqD3FQ461mtSJFioH/zaknTkF/qr3RA73
 xiO0FsGI85bkPTL7187zSQVlw93KR7UNFiE8RubK82UOIYbP2s6tCad6ssqgsdlW/HHdBZtd8KsVJ
 TQEnkgbw==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIQ-00HEOv-KO; Wed, 24 May 2023 00:15:58 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 23/36] drm/amd/display: add CRTC regamma TF support
Date: Tue, 23 May 2023 21:15:07 -0100
Message-Id: <20230523221520.3115570-24-mwen@igalia.com>
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

Add predefined transfer function programming. There is no out gamma ROM,
but we can use AMD color modules to program LUT parameters from a
predefined TF and an empty regamma LUT (or bump up LUT parameters with
predefined TF setup).

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 58 ++++++++++++++-----
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 934636d7b8d3..146363363ef0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -268,16 +268,18 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	struct calculate_buffer cal_buffer = {0};
 	bool res;
 
-	ASSERT(lut && lut_size == MAX_COLOR_LUT_ENTRIES);
-
 	cal_buffer.buffer_index = -1;
 
-	gamma = dc_create_gamma();
-	if (!gamma)
-		return -ENOMEM;
+	if (lut_size) {
+		ASSERT(lut && lut_size == MAX_COLOR_LUT_ENTRIES);
 
-	gamma->num_entries = lut_size;
-	__drm_lut_to_dc_gamma(lut, gamma, false);
+		gamma = dc_create_gamma();
+		if (!gamma)
+			return -ENOMEM;
+
+		gamma->num_entries = lut_size;
+		__drm_lut_to_dc_gamma(lut, gamma, false);
+	}
 
 	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
 		/*
@@ -285,32 +287,36 @@ static int __set_output_tf(struct dc_transfer_func *func,
 		 * on top of a linear input. But degamma params can be used
 		 * instead to simulate this.
 		 */
-		gamma->type = GAMMA_CUSTOM;
+		if (gamma)
+			gamma->type = GAMMA_CUSTOM;
 		res = mod_color_calculate_degamma_params(NULL, func,
-							gamma, true);
+							 gamma, gamma != NULL);
 	} else {
 		/*
 		 * Assume sRGB. The actual mapping will depend on whether the
 		 * input was legacy or not.
 		 */
-		gamma->type = GAMMA_CS_TFM_1D;
-		res = mod_color_calculate_regamma_params(func, gamma, false,
+		if (gamma)
+			gamma->type = GAMMA_CS_TFM_1D;
+		res = mod_color_calculate_regamma_params(func, gamma, gamma != NULL,
 							 has_rom, NULL, &cal_buffer);
 	}
 
-	dc_gamma_release(&gamma);
+	if (gamma)
+		dc_gamma_release(&gamma);
 
 	return res ? 0 : -ENOMEM;
 }
 
 static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 					const struct drm_color_lut *regamma_lut,
-					uint32_t regamma_size, bool has_rom)
+					uint32_t regamma_size, bool has_rom,
+					enum dc_transfer_func_predefined tf)
 {
 	struct dc_transfer_func *out_tf = stream->out_transfer_func;
 	int ret = 0;
 
-	if (regamma_size) {
+	if (regamma_size || tf != TRANSFER_FUNCTION_LINEAR) {
 		/* CRTC RGM goes into RGM LUT.
 		 *
 		 * Note: there is no implicit sRGB regamma here. We are using
@@ -318,7 +324,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 		 * from a linear base.
 		 */
 		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		out_tf->tf = TRANSFER_FUNCTION_LINEAR;
+		out_tf->tf = tf;
 
 		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
 	} else {
@@ -364,6 +370,24 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+static enum dc_transfer_func_predefined drm_tf_to_dc_tf(enum drm_transfer_function drm_tf)
+{
+	switch (drm_tf)
+	{
+	default:
+	case DRM_TRANSFER_FUNCTION_DEFAULT:	return TRANSFER_FUNCTION_LINEAR;
+	case DRM_TRANSFER_FUNCTION_SRGB:	return TRANSFER_FUNCTION_SRGB;
+	case DRM_TRANSFER_FUNCTION_BT709:	return TRANSFER_FUNCTION_BT709;
+	case DRM_TRANSFER_FUNCTION_PQ:		return TRANSFER_FUNCTION_PQ;
+	case DRM_TRANSFER_FUNCTION_LINEAR:	return TRANSFER_FUNCTION_LINEAR;
+	case DRM_TRANSFER_FUNCTION_UNITY:	return TRANSFER_FUNCTION_UNITY;
+	case DRM_TRANSFER_FUNCTION_HLG:		return TRANSFER_FUNCTION_HLG;
+	case DRM_TRANSFER_FUNCTION_GAMMA22:	return TRANSFER_FUNCTION_GAMMA22;
+	case DRM_TRANSFER_FUNCTION_GAMMA24:	return TRANSFER_FUNCTION_GAMMA24;
+	case DRM_TRANSFER_FUNCTION_GAMMA26:	return TRANSFER_FUNCTION_GAMMA26;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -639,6 +663,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
 	uint32_t degamma_size, regamma_size;
 	bool has_regamma, has_degamma;
+	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_LINEAR;
 	bool is_legacy;
 	const struct drm_color_lut *shaper_lut, *lut3d;
 	uint32_t shaper_size, lut3d_size;
@@ -650,6 +675,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 
 	lut3d = __extract_blob_lut(crtc->lut3d, &lut3d_size);
 	shaper_lut = __extract_blob_lut(crtc->shaper_lut, &shaper_size);
+	tf = drm_tf_to_dc_tf(crtc->regamma_tf);
 
 	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
 	if (r)
@@ -718,7 +744,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
 		 */
 		regamma_size = has_regamma ? regamma_size : 0;
 		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
-						 regamma_size, has_rom);
+						 regamma_size, has_rom, tf);
 		if (r)
 			return r;
 	}
-- 
2.39.2

