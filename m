Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D190777D50
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6D710E577;
	Thu, 10 Aug 2023 16:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE0B10E577;
 Thu, 10 Aug 2023 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7h7yLqPjcU15/dvMrBp46UZ6Z5mMwdlomOvGnBFHL1M=; b=QKGFhxmjFSg4/aU9D/aH31uFaY
 IL6EExJybvKqUE/oSrEXus6XIUMmM6T7GZlLjL6uTvHXcuG/LvjAE5jWZkk9CxeDY5W/gmih0uWAW
 nFKe0Pkl1Sxc5NJq+HXauoJRYrkd+uSGeZH3rrpvQzB/bviIyVyAcpPJifQeKhdqBuH8ot/PfpPPs
 0vp6aXXiyXpyZwtF7TnFm43T3p6hMwDlnAKHaLxgcCATfh0P/ZUul14HCT/lIfYqSOaDTYHm1VXm+
 HAgHkBoyGPe2ofsUTH4dZfHb/sosbZ6slQUWKUmKsod2VYAjoYQrI3KqKfpTyV4xyom3qkqLCWpOe
 a3EeDV0A==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU88e-00GjYD-QU; Thu, 10 Aug 2023 18:03:52 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 16/34] drm/amd/display: add CRTC gamma TF support
Date: Thu, 10 Aug 2023 15:02:56 -0100
Message-Id: <20230810160314.48225-17-mwen@igalia.com>
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

Add predefined transfer function programming. There is no pre-blending
out gamma ROM, but we can use AMD color modules to program LUT
parameters from a pre-defined TF and an empty regamma LUT (or bump up
LUT parameters with pre-defined TF setup).

v2:
- update crtc color mgmt if regamma TF differs between states (Joshua)
- map inverse EOTF to DC transfer function (Melissa)

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 73 +++++++++++++++----
 2 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 77b4d671a9e0..272974b88cda 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9456,6 +9456,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	 * when a modeset is needed, to ensure it gets reprogrammed.
 	 */
 	if (dm_new_crtc_state->base.color_mgmt_changed ||
+	    dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
 	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
 		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
 		if (ret)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index c0bf55416b4d..0188e82d1fdd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -468,16 +468,18 @@ static int __set_output_tf(struct dc_transfer_func *func,
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
@@ -485,32 +487,36 @@ static int __set_output_tf(struct dc_transfer_func *func,
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
@@ -518,7 +524,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 		 * from a linear base.
 		 */
 		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		out_tf->tf = TRANSFER_FUNCTION_LINEAR;
+		out_tf->tf = tf;
 
 		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
 	} else {
@@ -564,6 +570,38 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
+{
+	switch (tf)
+	{
+	default:
+	case AMDGPU_TRANSFER_FUNCTION_DEFAULT:
+	case AMDGPU_TRANSFER_FUNCTION_LINEAR:
+		return TRANSFER_FUNCTION_LINEAR;
+	case AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	case AMDGPU_TRANSFER_FUNCTION_BT709_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF:
+		return TRANSFER_FUNCTION_BT709;
+	case AMDGPU_TRANSFER_FUNCTION_PQ_EOTF:
+	case AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF:
+		return TRANSFER_FUNCTION_PQ;
+	case AMDGPU_TRANSFER_FUNCTION_UNITY:
+		return TRANSFER_FUNCTION_UNITY;
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
@@ -631,9 +669,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
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
@@ -683,7 +724,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
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

