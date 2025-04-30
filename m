Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18386AA4E7B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DDB10E7B7;
	Wed, 30 Apr 2025 14:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fXF54Un3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CF810E7B4;
 Wed, 30 Apr 2025 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w0+B8SWqXRKLaEAVFVk6pI13pjv615WvZ1RCcqUaBOE=; b=fXF54Un32Ru/vaHVpPgJWuygZd
 3WaesMXWCHhZCC7TCn5UAe8juAIf0PUYMvMpZZ3yZzdQjfkjQ5txAnaP8KrxVGV0xPe5KZes3kTzF
 HqpD5QFXitllzLBWGbmtVfqWthZDdsegW3sn0skSNVn401p4hhVhgpTHSgVFGKNZx39XV0HxxwSnF
 FiBX45wPCvHEnYIalshK2s7g71MT6+Gq1vjDbOrTZs0BY4v7Y33GkdATvtfpRver7WAzhu/QBslrB
 Y38dGB5QWKer5+OhtOkdG6XLm9L1yCU5YRZccny87LNB30mpLDOPn19+G9lVl3IXNXsIxx/VCiOWa
 JYP2ifMw==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA8N7-000vo2-AM; Wed, 30 Apr 2025 16:26:07 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 3/5] drm/amd/display: remove duplicated
 program_front_end_for_ctx code
Date: Wed, 30 Apr 2025 11:20:09 -0300
Message-ID: <20250430142549.829861-4-mwen@igalia.com>
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

Add detect_pipe_changes hook to dcn20_program_front_end_for_ctx and hook
the later to program_front_end_for_ctx in dcn401, then remove
dcn401_program_front_end_for_ctx duplicated code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  13 +-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 166 ------------------
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |   1 -
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   2 +-
 4 files changed, 11 insertions(+), 171 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 1be9be74564e..b5fc96338229 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -2082,9 +2082,16 @@ void dcn20_program_front_end_for_ctx(
 	}
 
 	/* Set pipe update flags and lock pipes */
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		dcn20_detect_pipe_changes(dc->current_state, context, &dc->current_state->res_ctx.pipe_ctx[i],
-			&context->res_ctx.pipe_ctx[i]);
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (dc->hwss.detect_pipe_changes)
+			dc->hwss.detect_pipe_changes(dc->current_state, context,
+						     &dc->current_state->res_ctx.pipe_ctx[i],
+						     &context->res_ctx.pipe_ctx[i]);
+		else
+			dcn20_detect_pipe_changes(dc->current_state, context,
+						  &dc->current_state->res_ctx.pipe_ctx[i],
+						  &context->res_ctx.pipe_ctx[i]);
+	}
 
 	/* When disabling phantom pipes, turn on phantom OTG first (so we can get double
 	 * buffer updates properly)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 06190c73c22c..f3ff144ce9a7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2340,172 +2340,6 @@ void dcn401_program_pipe(
 	}
 }
 
-void dcn401_program_front_end_for_ctx(
-	struct dc *dc,
-	struct dc_state *context)
-{
-	int i;
-	unsigned int prev_hubp_count = 0;
-	unsigned int hubp_count = 0;
-	struct dce_hwseq *hws = dc->hwseq;
-	struct pipe_ctx *pipe = NULL;
-
-	DC_LOGGER_INIT(dc->ctx->logger);
-
-	if (resource_is_pipe_topology_changed(dc->current_state, context))
-		resource_log_pipe_topology_update(dc, context);
-
-	if (dc->hwss.program_triplebuffer != NULL && dc->debug.enable_tri_buf) {
-		for (i = 0; i < dc->res_pool->pipe_count; i++) {
-			pipe = &context->res_ctx.pipe_ctx[i];
-
-			if (!pipe->top_pipe && !pipe->prev_odm_pipe && pipe->plane_state) {
-				if (pipe->plane_state->triplebuffer_flips)
-					BREAK_TO_DEBUGGER();
-
-				/*turn off triple buffer for full update*/
-				dc->hwss.program_triplebuffer(
-					dc, pipe, pipe->plane_state->triplebuffer_flips);
-			}
-		}
-	}
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		if (dc->current_state->res_ctx.pipe_ctx[i].plane_state)
-			prev_hubp_count++;
-		if (context->res_ctx.pipe_ctx[i].plane_state)
-			hubp_count++;
-	}
-
-	if (prev_hubp_count == 0 && hubp_count > 0) {
-		if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
-			dc->res_pool->hubbub->funcs->force_pstate_change_control(
-				dc->res_pool->hubbub, true, false);
-		udelay(500);
-	}
-
-	/* Set pipe update flags and lock pipes */
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		dc->hwss.detect_pipe_changes(dc->current_state, context, &dc->current_state->res_ctx.pipe_ctx[i],
-			&context->res_ctx.pipe_ctx[i]);
-
-	/* When disabling phantom pipes, turn on phantom OTG first (so we can get double
-	 * buffer updates properly)
-	 */
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct dc_stream_state *stream = dc->current_state->res_ctx.pipe_ctx[i].stream;
-
-		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
-
-		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable && stream &&
-			dc_state_get_pipe_subvp_type(dc->current_state, pipe) == SUBVP_PHANTOM) {
-			struct timing_generator *tg = dc->current_state->res_ctx.pipe_ctx[i].stream_res.tg;
-
-			if (tg->funcs->enable_crtc) {
-				if (dc->hwseq->funcs.blank_pixel_data)
-					dc->hwseq->funcs.blank_pixel_data(dc, pipe, true);
-
-				tg->funcs->enable_crtc(tg);
-			}
-		}
-	}
-	/* OTG blank before disabling all front ends */
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
-			&& !context->res_ctx.pipe_ctx[i].top_pipe
-			&& !context->res_ctx.pipe_ctx[i].prev_odm_pipe
-			&& context->res_ctx.pipe_ctx[i].stream)
-			hws->funcs.blank_pixel_data(dc, &context->res_ctx.pipe_ctx[i], true);
-
-
-	/* Disconnect mpcc */
-	for (i = 0; i < dc->res_pool->pipe_count; i++)
-		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
-			|| context->res_ctx.pipe_ctx[i].update_flags.bits.opp_changed) {
-			struct hubbub *hubbub = dc->res_pool->hubbub;
-
-			/* Phantom pipe DET should be 0, but if a pipe in use is being transitioned to phantom
-			 * then we want to do the programming here (effectively it's being disabled). If we do
-			 * the programming later the DET won't be updated until the OTG for the phantom pipe is
-			 * turned on (i.e. in an MCLK switch) which can come in too late and cause issues with
-			 * DET allocation.
-			 */
-			if ((context->res_ctx.pipe_ctx[i].update_flags.bits.disable ||
-				(context->res_ctx.pipe_ctx[i].plane_state &&
-				dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) ==
-				SUBVP_PHANTOM))) {
-				if (hubbub->funcs->program_det_size)
-					hubbub->funcs->program_det_size(hubbub,
-						dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
-				if (dc->res_pool->hubbub->funcs->program_det_segments)
-					dc->res_pool->hubbub->funcs->program_det_segments(
-						hubbub,	dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
-			}
-			hws->funcs.plane_atomic_disconnect(dc, dc->current_state,
-				&dc->current_state->res_ctx.pipe_ctx[i]);
-			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
-		}
-
-	/* update ODM for blanked OTG master pipes */
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		pipe = &context->res_ctx.pipe_ctx[i];
-		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
-			!resource_is_pipe_type(pipe, DPP_PIPE) &&
-			pipe->update_flags.bits.odm &&
-			hws->funcs.update_odm)
-			hws->funcs.update_odm(dc, context, pipe);
-	}
-
-	/*
-	 * Program all updated pipes, order matters for mpcc setup. Start with
-	 * top pipe and program all pipes that follow in order
-	 */
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (pipe->plane_state && !pipe->top_pipe) {
-			while (pipe) {
-				if (hws->funcs.program_pipe)
-					hws->funcs.program_pipe(dc, pipe, context);
-				else {
-					/* Don't program phantom pipes in the regular front end programming sequence.
-					 * There is an MPO transition case where a pipe being used by a video plane is
-					 * transitioned directly to be a phantom pipe when closing the MPO video.
-					 * However the phantom pipe will program a new HUBP_VTG_SEL (update takes place
-					 * right away) but the MPO still exists until the double buffered update of the
-					 * main pipe so we will get a frame of underflow if the phantom pipe is
-					 * programmed here.
-					 */
-					if (pipe->stream &&
-						dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM)
-						dcn401_program_pipe(dc, pipe, context);
-				}
-
-				pipe = pipe->bottom_pipe;
-			}
-		}
-
-		/* Program secondary blending tree and writeback pipes */
-		pipe = &context->res_ctx.pipe_ctx[i];
-		if (!pipe->top_pipe && !pipe->prev_odm_pipe
-			&& pipe->stream && pipe->stream->num_wb_info > 0
-			&& (pipe->update_flags.raw || (pipe->plane_state && pipe->plane_state->update_flags.raw)
-				|| pipe->stream->update_flags.raw)
-			&& hws->funcs.program_all_writeback_pipes_in_tree)
-			hws->funcs.program_all_writeback_pipes_in_tree(dc, pipe->stream, context);
-
-		/* Avoid underflow by check of pipe line read when adding 2nd plane. */
-		if (hws->wa.wait_hubpret_read_start_during_mpo_transition &&
-			!pipe->top_pipe &&
-			pipe->stream &&
-			pipe->plane_res.hubp->funcs->hubp_wait_pipe_read_start &&
-			dc->current_state->stream_status[0].plane_count == 1 &&
-			context->stream_status[0].plane_count > 1) {
-			pipe->plane_res.hubp->funcs->hubp_wait_pipe_read_start(pipe->plane_res.hubp);
-		}
-	}
-}
-
 void dcn401_post_unlock_program_front_end(
 	struct dc *dc,
 	struct dc_state *context)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index 26c350efb1c2..50fa08098449 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -102,7 +102,6 @@ void dcn401_program_pipe(
 	struct pipe_ctx *pipe_ctx,
 	struct dc_state *context);
 void dcn401_perform_3dlut_wa_unlock(struct pipe_ctx *pipe_ctx);
-void dcn401_program_front_end_for_ctx(struct dc *dc, struct dc_state *context);
 void dcn401_post_unlock_program_front_end(struct dc *dc, struct dc_state *context);
 bool dcn401_update_bandwidth(struct dc *dc, struct dc_state *context);
 void dcn401_detect_pipe_changes(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index 65c551895ac9..848d8a74e6c5 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -17,7 +17,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.init_hw = dcn401_init_hw,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
 	.apply_ctx_for_surface = NULL,
-	.program_front_end_for_ctx = dcn401_program_front_end_for_ctx,
+	.program_front_end_for_ctx = dcn20_program_front_end_for_ctx,
 	.clear_surface_dcc_and_tiling = dcn10_reset_surface_dcc_and_tiling,
 	.wait_for_pending_cleared = dcn10_wait_for_pending_cleared,
 	.post_unlock_program_front_end = dcn401_post_unlock_program_front_end,
-- 
2.47.2

