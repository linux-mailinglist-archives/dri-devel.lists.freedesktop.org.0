Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE601AA4E7D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A0710E7B5;
	Wed, 30 Apr 2025 14:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A/ol+jAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E4710E7B7;
 Wed, 30 Apr 2025 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XrZG89GbgyquXBV3YgHka5/yEo6WAJWnPawsQFPgIuk=; b=A/ol+jArhUY+5Z4gP82h2tJK6Q
 H39T9ssLKFLU206VYhIPmr0+GeCThAOJMor0c4tHn94dBZEUWkzXHkniNjL305lppPf4qTIB5ys/i
 5GkJ7AnL8C+Nms6IXFpD6i2YXM4EZkiYl9ZS8z59KDgMMjpo/hi1EG+D8VR6aUfNdZEO/k6hsB7Tz
 FAVqDSi4MKa8ilECb/LTYsreRL9jSZNNtxafho8tQcCB7b6YMVvoIVSpJNwFFQwEXdqt465sFsx5S
 2bQKCyBTnasqE3BB/3923bCs6yxkPNYfKSMn/I3Gr3amGnWZMK0QehX0tMxAzWO5TqE0QwX34DHLA
 z+/+JpGg==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA8NB-000vo2-A0; Wed, 30 Apr 2025 16:26:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 4/5] drm/amd/display: remove duplicated
 post_unlock_program_front_end code on dcn401
Date: Wed, 30 Apr 2025 11:20:10 -0300
Message-ID: <20250430142549.829861-5-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430142549.829861-1-mwen@igalia.com>
References: <20250430142549.829861-1-mwen@igalia.com>
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

Enable hw_sequence_private funcs: enable plane for program_pipe and
post_unlock_reset_opp for post_unlock_program_front_end (even if this is
actually dcn20_post_unlock_reset_opp) to remove duplicated
post_unlock_program_front_end code on dcn401.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  16 ++-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 135 ------------------
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |   1 -
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   2 +-
 4 files changed, 13 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index b5fc96338229..7905635c478f 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1940,6 +1940,8 @@ static void dcn20_program_pipe(
 	if (pipe_ctx->update_flags.bits.enable) {
 		if (hws->funcs.enable_plane)
 			hws->funcs.enable_plane(dc, pipe_ctx, context);
+		else if (dc->hwss.enable_plane)
+			dc->hwss.enable_plane(dc, pipe_ctx, context);
 		else
 			dcn20_enable_plane(dc, pipe_ctx, context);
 
@@ -2256,11 +2258,17 @@ void dcn20_post_unlock_program_front_end(
 	struct dce_hwseq *hwseq = dc->hwseq;
 	int i;
 
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		if (resource_is_pipe_type(&dc->current_state->res_ctx.pipe_ctx[i], OPP_HEAD) &&
-			!resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], OPP_HEAD))
-			dcn20_post_unlock_reset_opp(dc,
-				&dc->current_state->res_ctx.pipe_ctx[i]);
+		    !resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], OPP_HEAD)) {
+			if (dc->hwss.post_unlock_reset_opp)
+				dc->hwss.post_unlock_reset_opp(dc,
+							       &dc->current_state->res_ctx.pipe_ctx[i]);
+			else
+				dcn20_post_unlock_reset_opp(dc,
+							    &dc->current_state->res_ctx.pipe_ctx[i]);
+		}
+	}
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index f3ff144ce9a7..10c3ca86df65 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2340,141 +2340,6 @@ void dcn401_program_pipe(
 	}
 }
 
-void dcn401_post_unlock_program_front_end(
-	struct dc *dc,
-	struct dc_state *context)
-{
-	// Timeout for pipe enable
-	unsigned int timeout_us = 100000;
-	unsigned int polling_interval_us = 1;
-	struct dce_hwseq *hwseq = dc->hwseq;
-	int i;
-
-	DC_LOGGER_INIT(dc->ctx->logger);
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		if (resource_is_pipe_type(&dc->current_state->res_ctx.pipe_ctx[i], OPP_HEAD) &&
-			!resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], OPP_HEAD))
-			dc->hwss.post_unlock_reset_opp(dc,
-				&dc->current_state->res_ctx.pipe_ctx[i]);
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
-			dc->hwss.disable_plane(dc, dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]);
-
-	/*
-	 * If we are enabling a pipe, we need to wait for pending clear as this is a critical
-	 * part of the enable operation otherwise, DM may request an immediate flip which
-	 * will cause HW to perform an "immediate enable" (as opposed to "vsync enable") which
-	 * is unsupported on DCN.
-	 */
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-		// Don't check flip pending on phantom pipes
-		if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.enable &&
-			dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
-			struct hubp *hubp = pipe->plane_res.hubp;
-			int j = 0;
-
-			for (j = 0; j < timeout_us / polling_interval_us
-				&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
-				udelay(polling_interval_us);
-		}
-	}
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
-
-		/* When going from a smaller ODM slice count to larger, we must ensure double
-		 * buffer update completes before we return to ensure we don't reduce DISPCLK
-		 * before we've transitioned to 2:1 or 4:1
-		 */
-		if (resource_is_pipe_type(old_pipe, OTG_MASTER) && resource_is_pipe_type(pipe, OTG_MASTER) &&
-			resource_get_odm_slice_count(old_pipe) < resource_get_odm_slice_count(pipe) &&
-			dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
-			int j = 0;
-			struct timing_generator *tg = pipe->stream_res.tg;
-
-			if (tg->funcs->get_optc_double_buffer_pending) {
-				for (j = 0; j < timeout_us / polling_interval_us
-					&& tg->funcs->get_optc_double_buffer_pending(tg); j++)
-					udelay(polling_interval_us);
-			}
-		}
-	}
-
-	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
-		dc->res_pool->hubbub->funcs->force_pstate_change_control(
-			dc->res_pool->hubbub, false, false);
-
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (pipe->plane_state && !pipe->top_pipe) {
-			/* Program phantom pipe here to prevent a frame of underflow in the MPO transition
-			 * case (if a pipe being used for a video plane transitions to a phantom pipe, it
-			 * can underflow due to HUBP_VTG_SEL programming if done in the regular front end
-			 * programming sequence).
-			 */
-			while (pipe) {
-				if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
-					/* When turning on the phantom pipe we want to run through the
-					 * entire enable sequence, so apply all the "enable" flags.
-					 */
-					if (dc->hwss.apply_update_flags_for_phantom)
-						dc->hwss.apply_update_flags_for_phantom(pipe);
-					if (dc->hwss.update_phantom_vp_position)
-						dc->hwss.update_phantom_vp_position(dc, context, pipe);
-					dcn401_program_pipe(dc, pipe, context);
-				}
-				pipe = pipe->bottom_pipe;
-			}
-		}
-	}
-
-	if (!hwseq)
-		return;
-
-	/* P-State support transitions:
-	 * Natural -> FPO:      P-State disabled in prepare, force disallow anytime is safe
-	 * FPO -> Natural:      Unforce anytime after FW disable is safe (P-State will assert naturally)
-	 * Unsupported -> FPO:  P-State enabled in optimize, force disallow anytime is safe
-	 * FPO -> Unsupported:  P-State disabled in prepare, unforce disallow anytime is safe
-	 * FPO <-> SubVP:       Force disallow is maintained on the FPO / SubVP pipes
-	 */
-	if (hwseq->funcs.update_force_pstate)
-		dc->hwseq->funcs.update_force_pstate(dc, context);
-
-	/* Only program the MALL registers after all the main and phantom pipes
-	 * are done programming.
-	 */
-	if (hwseq->funcs.program_mall_pipe_config)
-		hwseq->funcs.program_mall_pipe_config(dc, context);
-
-	/* WA to apply WM setting*/
-	if (hwseq->wa.DEGVIDCN21)
-		dc->res_pool->hubbub->funcs->apply_DEDCN21_147_wa(dc->res_pool->hubbub);
-
-
-	/* WA for stutter underflow during MPO transitions when adding 2nd plane */
-	if (hwseq->wa.disallow_self_refresh_during_multi_plane_transition) {
-
-		if (dc->current_state->stream_status[0].plane_count == 1 &&
-			context->stream_status[0].plane_count > 1) {
-
-			struct timing_generator *tg = dc->res_pool->timing_generators[0];
-
-			dc->res_pool->hubbub->funcs->allow_self_refresh_control(dc->res_pool->hubbub, false);
-
-			hwseq->wa_state.disallow_self_refresh_during_multi_plane_transition_applied = true;
-			hwseq->wa_state.disallow_self_refresh_during_multi_plane_transition_applied_on_frame =
-				tg->funcs->get_frame_count(tg);
-		}
-	}
-}
-
 bool dcn401_update_bandwidth(
 	struct dc *dc,
 	struct dc_state *context)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index 50fa08098449..acfdc856f543 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -102,7 +102,6 @@ void dcn401_program_pipe(
 	struct pipe_ctx *pipe_ctx,
 	struct dc_state *context);
 void dcn401_perform_3dlut_wa_unlock(struct pipe_ctx *pipe_ctx);
-void dcn401_post_unlock_program_front_end(struct dc *dc, struct dc_state *context);
 bool dcn401_update_bandwidth(struct dc *dc, struct dc_state *context);
 void dcn401_detect_pipe_changes(
 	struct dc_state *old_state,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index 848d8a74e6c5..40e575ab2835 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -20,7 +20,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.program_front_end_for_ctx = dcn20_program_front_end_for_ctx,
 	.clear_surface_dcc_and_tiling = dcn10_reset_surface_dcc_and_tiling,
 	.wait_for_pending_cleared = dcn10_wait_for_pending_cleared,
-	.post_unlock_program_front_end = dcn401_post_unlock_program_front_end,
+	.post_unlock_program_front_end = dcn20_post_unlock_program_front_end,
 	.update_plane_addr = dcn20_update_plane_addr,
 	.update_dchub = dcn10_update_dchub,
 	.update_pending_status = dcn10_update_pending_status,
-- 
2.47.2

