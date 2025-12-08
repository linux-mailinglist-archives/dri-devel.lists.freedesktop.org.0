Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91E6CAE6DA
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 00:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7841510E454;
	Mon,  8 Dec 2025 23:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M7fhjWDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E9810E44C;
 Mon,  8 Dec 2025 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sw2YnXwOOAwGnBazhiDw4inHTRuKMcIVf1xOlQlybxc=; b=M7fhjWDkDNGEtnvgABIaD3gjCv
 ugB1A47ckqXys8unS/Rj+9ygoG0gqRgJfkewiLJK4z7hXI61IhYRmWiN3DdEoXoM7FA+qNlIbOl2U
 QB6KB5yceE+hc2bIX+FKY7W5x4HoCEIVo/0xT3WGVAAR05AWk2zv+PZzB5WMio+INUL6TJ7e+9aFn
 5e/rVdcy+PBOqp7RrnwtAoPC5hpne3oCakQZ8C4K7iqzE3ukjoojt5lTWwCJDUZfeH7LUCXKLS8ZD
 SS0QAXHvTX6abR4s2wJ2bqidOLKVhBQey06shpxwVlu2ZCa04406cvCCrCjzND652wslqao+aTPXV
 9rKklWOw==;
Received: from [186.208.73.250] (helo=django)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSky7-00AGsY-Jq; Tue, 09 Dec 2025 00:48:40 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/amd/display: extend delta clamping logic to CM3
 LUT helper
Date: Mon,  8 Dec 2025 22:44:15 -0100
Message-ID: <20251208234741.293037-3-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208234741.293037-1-mwen@igalia.com>
References: <20251208234741.293037-1-mwen@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 27fc10d1095f ("drm/amd/display: Fix the delta clamping for shaper
LUT") fixed banding when using plane shaper LUT in DCN10 CM helper.  The
problem is also present in DCN30 CM helper, fix banding by extending the
same bug delta clamping fix to CM3.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dcn30/dcn30_cm_common.c    | 30 +++++++++++++++----
 .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++-----
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 +++++-----
 5 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
index ba20575be214..b1c2c8da1937 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -105,9 +105,12 @@ void cm_helper_program_gamcor_xfer_func(
 #define NUMBER_REGIONS     32
 #define NUMBER_SW_SEGMENTS 16
 
-bool cm3_helper_translate_curve_to_hw_format(
-				const struct dc_transfer_func *output_tf,
-				struct pwl_params *lut_params, bool fixpoint)
+#define DC_LOGGER \
+		ctx->logger
+
+bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
+					     const struct dc_transfer_func *output_tf,
+					     struct pwl_params *lut_params, bool fixpoint)
 {
 	struct curve_points3 *corner_points;
 	struct pwl_result_data *rgb_resulted;
@@ -248,6 +251,10 @@ bool cm3_helper_translate_curve_to_hw_format(
 	if (fixpoint == true) {
 		i = 1;
 		while (i != hw_points + 2) {
+			uint32_t red_clamp;
+			uint32_t green_clamp;
+			uint32_t blue_clamp;
+
 			if (i >= hw_points) {
 				if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
 					rgb_plus_1->red = dc_fixpt_add(rgb->red,
@@ -260,9 +267,20 @@ bool cm3_helper_translate_curve_to_hw_format(
 							rgb_minus_1->delta_blue);
 			}
 
-			rgb->delta_red_reg   = dc_fixpt_clamp_u0d10(rgb->delta_red);
-			rgb->delta_green_reg = dc_fixpt_clamp_u0d10(rgb->delta_green);
-			rgb->delta_blue_reg  = dc_fixpt_clamp_u0d10(rgb->delta_blue);
+			rgb->delta_red   = dc_fixpt_sub(rgb_plus_1->red,   rgb->red);
+			rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
+			rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
+
+			red_clamp = dc_fixpt_clamp_u0d14(rgb->delta_red);
+			green_clamp = dc_fixpt_clamp_u0d14(rgb->delta_green);
+			blue_clamp = dc_fixpt_clamp_u0d14(rgb->delta_blue);
+
+			if (red_clamp >> 10 || green_clamp >> 10 || blue_clamp >> 10)
+				DC_LOG_ERROR("Losing delta precision while programming shaper LUT.");
+
+			rgb->delta_red_reg   = red_clamp & 0x3ff;
+			rgb->delta_green_reg = green_clamp & 0x3ff;
+			rgb->delta_blue_reg  = blue_clamp & 0x3ff;
 			rgb->red_reg         = dc_fixpt_clamp_u0d14(rgb->red);
 			rgb->green_reg       = dc_fixpt_clamp_u0d14(rgb->green);
 			rgb->blue_reg        = dc_fixpt_clamp_u0d14(rgb->blue);
diff --git a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
index b86347c9b038..95f9318a54ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
+++ b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
@@ -59,7 +59,7 @@ void cm_helper_program_gamcor_xfer_func(
 	const struct pwl_params *params,
 	const struct dcn3_xfer_func_reg *reg);
 
-bool cm3_helper_translate_curve_to_hw_format(
+bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
 	const struct dc_transfer_func *output_tf,
 	struct pwl_params *lut_params, bool fixpoint);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index 81bcadf5e57e..f2d4cd527874 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -239,7 +239,7 @@ bool dcn30_set_blend_lut(
 	if (plane_state->blend_tf.type == TF_TYPE_HWPWL)
 		blend_lut = &plane_state->blend_tf.pwl;
 	else if (plane_state->blend_tf.type == TF_TYPE_DISTRIBUTED_POINTS) {
-		result = cm3_helper_translate_curve_to_hw_format(
+		result = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
 				&plane_state->blend_tf, &dpp_base->regamma_params, false);
 		if (!result)
 			return result;
@@ -334,8 +334,9 @@ bool dcn30_set_input_transfer_func(struct dc *dc,
 	if (plane_state->in_transfer_func.type == TF_TYPE_HWPWL)
 		params = &plane_state->in_transfer_func.pwl;
 	else if (plane_state->in_transfer_func.type == TF_TYPE_DISTRIBUTED_POINTS &&
-		cm3_helper_translate_curve_to_hw_format(&plane_state->in_transfer_func,
-				&dpp_base->degamma_params, false))
+		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+							&plane_state->in_transfer_func,
+							&dpp_base->degamma_params, false))
 		params = &dpp_base->degamma_params;
 
 	result = dpp_base->funcs->dpp_program_gamcor_lut(dpp_base, params);
@@ -406,7 +407,7 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
 				params = &stream->out_transfer_func.pwl;
 			else if (pipe_ctx->stream->out_transfer_func.type ==
 					TF_TYPE_DISTRIBUTED_POINTS &&
-					cm3_helper_translate_curve_to_hw_format(
+					cm3_helper_translate_curve_to_hw_format(stream->ctx,
 					&stream->out_transfer_func,
 					&mpc->blender_params, false))
 				params = &mpc->blender_params;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index b213a2ac827a..27abc08918bc 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -486,8 +486,9 @@ bool dcn32_set_mcm_luts(
 	if (plane_state->blend_tf.type == TF_TYPE_HWPWL)
 		lut_params = &plane_state->blend_tf.pwl;
 	else if (plane_state->blend_tf.type == TF_TYPE_DISTRIBUTED_POINTS) {
-		result = cm3_helper_translate_curve_to_hw_format(&plane_state->blend_tf,
-				&dpp_base->regamma_params, false);
+		result = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+								 &plane_state->blend_tf,
+								 &dpp_base->regamma_params, false);
 		if (!result)
 			return result;
 
@@ -502,8 +503,9 @@ bool dcn32_set_mcm_luts(
 	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
 		// TODO: dpp_base replace
 		ASSERT(false);
-		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
-				&dpp_base->shaper_params, true);
+		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+							&plane_state->in_shaper_func,
+							&dpp_base->shaper_params, true);
 		lut_params = &dpp_base->shaper_params;
 	}
 
@@ -543,8 +545,9 @@ bool dcn32_set_input_transfer_func(struct dc *dc,
 	if (plane_state->in_transfer_func.type == TF_TYPE_HWPWL)
 		params = &plane_state->in_transfer_func.pwl;
 	else if (plane_state->in_transfer_func.type == TF_TYPE_DISTRIBUTED_POINTS &&
-		cm3_helper_translate_curve_to_hw_format(&plane_state->in_transfer_func,
-				&dpp_base->degamma_params, false))
+		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+							&plane_state->in_transfer_func,
+							&dpp_base->degamma_params, false))
 		params = &dpp_base->degamma_params;
 
 	dpp_base->funcs->dpp_program_gamcor_lut(dpp_base, params);
@@ -575,7 +578,7 @@ bool dcn32_set_output_transfer_func(struct dc *dc,
 				params = &stream->out_transfer_func.pwl;
 			else if (pipe_ctx->stream->out_transfer_func.type ==
 					TF_TYPE_DISTRIBUTED_POINTS &&
-					cm3_helper_translate_curve_to_hw_format(
+					cm3_helper_translate_curve_to_hw_format(stream->ctx,
 					&stream->out_transfer_func,
 					&mpc->blender_params, false))
 				params = &mpc->blender_params;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 2fbc22afb89c..5eda7648d0d2 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -430,7 +430,7 @@ void dcn401_populate_mcm_luts(struct dc *dc,
 		if (mcm_luts.lut1d_func->type == TF_TYPE_HWPWL)
 			m_lut_params.pwl = &mcm_luts.lut1d_func->pwl;
 		else if (mcm_luts.lut1d_func->type == TF_TYPE_DISTRIBUTED_POINTS) {
-			rval = cm3_helper_translate_curve_to_hw_format(
+			rval = cm3_helper_translate_curve_to_hw_format(mpc->ctx,
 					mcm_luts.lut1d_func,
 					&dpp_base->regamma_params, false);
 			m_lut_params.pwl = rval ? &dpp_base->regamma_params : NULL;
@@ -450,7 +450,7 @@ void dcn401_populate_mcm_luts(struct dc *dc,
 			m_lut_params.pwl = &mcm_luts.shaper->pwl;
 		else if (mcm_luts.shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
 			ASSERT(false);
-			rval = cm3_helper_translate_curve_to_hw_format(
+			rval = cm3_helper_translate_curve_to_hw_format(mpc->ctx,
 					mcm_luts.shaper,
 					&dpp_base->regamma_params, true);
 			m_lut_params.pwl = rval ? &dpp_base->regamma_params : NULL;
@@ -627,8 +627,9 @@ bool dcn401_set_mcm_luts(struct pipe_ctx *pipe_ctx,
 	if (plane_state->blend_tf.type == TF_TYPE_HWPWL)
 		lut_params = &plane_state->blend_tf.pwl;
 	else if (plane_state->blend_tf.type == TF_TYPE_DISTRIBUTED_POINTS) {
-		rval = cm3_helper_translate_curve_to_hw_format(&plane_state->blend_tf,
-				&dpp_base->regamma_params, false);
+		rval = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+							       &plane_state->blend_tf,
+							       &dpp_base->regamma_params, false);
 		lut_params = rval ? &dpp_base->regamma_params : NULL;
 	}
 	result = mpc->funcs->program_1dlut(mpc, lut_params, mpcc_id);
@@ -639,8 +640,9 @@ bool dcn401_set_mcm_luts(struct pipe_ctx *pipe_ctx,
 		lut_params = &plane_state->in_shaper_func.pwl;
 	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
 		// TODO: dpp_base replace
-		rval = cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
-				&dpp_base->shaper_params, true);
+		rval = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+							       &plane_state->in_shaper_func,
+							       &dpp_base->shaper_params, true);
 		lut_params = rval ? &dpp_base->shaper_params : NULL;
 	}
 	result &= mpc->funcs->program_shaper(mpc, lut_params, mpcc_id);
@@ -674,7 +676,7 @@ bool dcn401_set_output_transfer_func(struct dc *dc,
 				params = &stream->out_transfer_func.pwl;
 			else if (pipe_ctx->stream->out_transfer_func.type ==
 					TF_TYPE_DISTRIBUTED_POINTS &&
-					cm3_helper_translate_curve_to_hw_format(
+					cm3_helper_translate_curve_to_hw_format(stream->ctx,
 					&stream->out_transfer_func,
 					&mpc->blender_params, false))
 				params = &mpc->blender_params;
-- 
2.51.0

