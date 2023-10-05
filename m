Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525667BA795
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0F10E44F;
	Thu,  5 Oct 2023 17:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018FB10E453;
 Thu,  5 Oct 2023 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bl0SilGRDvO7Qr3xXRiHJg3HAxQqqbfJTEh57b/EQqg=; b=KOzGzm1xMQFt/mYB+loyA0hr7H
 jZxUT4yP8VKPfdVWaa3+QJZkubolNfUYeZfrsX+DxMbLgWgbhPqDI4paiIACPQVWIAtZnfGtUG6M5
 PKyHgzwZgNbGccOuRjdKBB/UhWgkUZgWJJgqiFtJAvVyiAjHv3s30TlFSVAhPvWS6ZzQ34ddzI4Xo
 mBt3kzeZ9zXPyf36FpPhjUx6d75PKMbsGJJ9WUFQ1G67tJdDY8m6Gefm7E9t3Q1DzzxzYbeJ7OsF0
 p2e22oygJzDq8sAC0tNX7GWktNudhbIO7RQ8Hczbl+DTl2RGTw6qMXBp8SLeHWZLts2uVZnIp75qz
 6ab8ghGg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxD-00CFJN-0m; Thu, 05 Oct 2023 19:16:03 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 15/32] drm/amd/display: add CRTC gamma TF support
Date: Thu,  5 Oct 2023 16:15:10 -0100
Message-Id: <20231005171527.203657-16-mwen@igalia.com>
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

Add predefined transfer function programming. There is no post-blending
out gamma ROM for hardcoded curves, but we can use AMD color modules to
program LUT parameters from pre-defined coefficients and an empty
regamma LUT (or bump up LUT parameters with pre-defined TF values).

v2:
- update crtc color mgmt if regamma TF differs between states (Joshua)
- map inverse EOTF to DC transfer function (Melissa)

v3:
- update AMDGPU TF list

v4:
- update comment regarding regamma behavior

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 77 +++++++++++++++----
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7c55b1c0ac5c..846dbeddd0fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9876,6 +9876,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	 * when a modeset is needed, to ensure it gets reprogrammed.
 	 */
 	if (dm_new_crtc_state->base.color_mgmt_changed ||
+	    dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
 	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
 		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
 		if (ret)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0487fb715945..782adb8bea43 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -489,16 +489,18 @@ static int __set_output_tf(struct dc_transfer_func *func,
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
@@ -506,41 +508,49 @@ static int __set_output_tf(struct dc_transfer_func *func,
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
 		/*
 		 * CRTC RGM goes into RGM LUT.
 		 *
 		 * Note: there is no implicit sRGB regamma here. We are using
 		 * degamma calculation from color module to calculate the curve
-		 * from a linear base.
+		 * from a linear base if gamma TF is not set. However, if gamma
+		 * TF (!= Linear) and LUT are set at the same time, we will use
+		 * regamma calculation, and the color module will combine the
+		 * pre-defined TF and the custom LUT values into the LUT that's
+		 * actually programmed.
 		 */
 		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		out_tf->tf = TRANSFER_FUNCTION_LINEAR;
+		out_tf->tf = tf;
 
 		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
 	} else {
@@ -586,6 +596,36 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
+{
+	switch (tf)
+	{
+	default:
+	case AMDGPU_TRANSFER_FUNCTION_DEFAULT:
+	case AMDGPU_TRANSFER_FUNCTION_IDENTITY:
+		return TRANSFER_FUNCTION_LINEAR;
+	case AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	case AMDGPU_TRANSFER_FUNCTION_BT709_OETF:
+	case AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF:
+		return TRANSFER_FUNCTION_BT709;
+	case AMDGPU_TRANSFER_FUNCTION_PQ_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF:
+		return TRANSFER_FUNCTION_PQ;
+	case AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF:
+		return TRANSFER_FUNCTION_GAMMA22;
+	case AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF:
+		return TRANSFER_FUNCTION_GAMMA24;
+	case AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF:
+		return TRANSFER_FUNCTION_GAMMA26;
+	}
+}
+
 /**
  * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
  * @crtc_state: the DRM CRTC state
@@ -653,9 +693,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	const struct drm_color_lut *degamma_lut, *regamma_lut;
 	uint32_t degamma_size, regamma_size;
 	bool has_regamma, has_degamma;
+	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_LINEAR;
 	bool is_legacy;
 	int r;
 
+	tf = amdgpu_tf_to_dc_tf(crtc->regamma_tf);
+
 	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
 	if (r)
 		return r;
@@ -705,7 +748,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	} else {
 		regamma_size = has_regamma ? regamma_size : 0;
 		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
-						 regamma_size, has_rom);
+						 regamma_size, has_rom, tf);
 		if (r)
 			return r;
 	}
-- 
2.40.1

