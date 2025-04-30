Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A910AA4E7F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3510E7BC;
	Wed, 30 Apr 2025 14:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DdHkeBoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4F610E7B9;
 Wed, 30 Apr 2025 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GulsZdAoZUK9PljRW5UNNscPehd8J2wGaFKzKGg9ZhU=; b=DdHkeBoB+s+nbikAmALHnRMlsP
 kby8FjHE8HUxXeI3sCFsHhEgDQvUS2lVNp++PKtdpRiFdo0e+QUnRsgg/3l3mpBNeBSuHCJmfj49W
 80zno4xxZFptnZBh3vPITUB0lmtDfIFbRiqkM1FqKHIc1kxNmXqfFryx1aViI41oQm9d+Jp6/YU7Q
 CTEwZJTfvPE09QaV1zBLAdLstoklhtunYQDIeec2f0PFDKDUqVq5/x0ga8nGFGO+ksDIOKfBu9wy+
 cmA56Ki6P5cdqzZbicsGm/FLTzsr01SE+7cyqMzlNYYPfOugahHHzzw8VX+f+8etK8w3eK+7Es0Y2
 HtIaDXJw==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA8NF-000vo2-Au; Wed, 30 Apr 2025 16:26:15 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 5/5] drm/amd/display: remove duplicated program_pipe code on
 dcn401
Date: Wed, 30 Apr 2025 11:20:11 -0300
Message-ID: <20250430142549.829861-6-mwen@igalia.com>
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

Reduce code duplication by reusing dcn20_program_pipe since both
dcn401/dcn20_program_pipe now does the same thing and so its caller on
dcn401.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 126 ------------------
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |   4 -
 2 files changed, 130 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 10c3ca86df65..dbdfd6502b5c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2214,132 +2214,6 @@ void dcn401_program_tg(struct dc *dc,
 		hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
 }
 
-void dcn401_program_pipe(
-	struct dc *dc,
-	struct pipe_ctx *pipe_ctx,
-	struct dc_state *context)
-{
-	struct dce_hwseq *hws = dc->hwseq;
-
-	/* Only need to unblank on top pipe */
-	if (resource_is_pipe_type(pipe_ctx, OTG_MASTER)) {
-		if (pipe_ctx->update_flags.bits.enable ||
-			pipe_ctx->update_flags.bits.odm ||
-			pipe_ctx->stream->update_flags.bits.abm_level)
-			hws->funcs.blank_pixel_data(dc, pipe_ctx,
-				!pipe_ctx->plane_state ||
-				!pipe_ctx->plane_state->visible);
-	}
-
-	/* Only update TG on top pipe */
-	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
-		&& !pipe_ctx->prev_odm_pipe)
-		dcn401_program_tg(dc, pipe_ctx, context, hws);
-
-	if (pipe_ctx->update_flags.bits.odm)
-		hws->funcs.update_odm(dc, context, pipe_ctx);
-
-	if (pipe_ctx->update_flags.bits.enable) {
-		if (hws->funcs.enable_plane)
-			hws->funcs.enable_plane(dc, pipe_ctx, context);
-		else
-			dc->hwss.enable_plane(dc, pipe_ctx, context);
-
-		if (dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes)
-			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
-	}
-
-	if (pipe_ctx->update_flags.bits.det_size) {
-		if (dc->res_pool->hubbub->funcs->program_det_size)
-			dc->res_pool->hubbub->funcs->program_det_size(
-				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
-		if (dc->res_pool->hubbub->funcs->program_det_segments)
-			dc->res_pool->hubbub->funcs->program_det_segments(
-				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
-	}
-
-	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.raw ||
-	    pipe_ctx->plane_state->update_flags.raw ||
-	    pipe_ctx->stream->update_flags.raw))
-		dc->hwss.update_dchubp_dpp(dc, pipe_ctx, context);
-
-	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||
-		pipe_ctx->plane_state->update_flags.bits.hdr_mult))
-		hws->funcs.set_hdr_multiplier(pipe_ctx);
-
-	if (hws->funcs.populate_mcm_luts) {
-		if (pipe_ctx->plane_state) {
-			hws->funcs.populate_mcm_luts(dc, pipe_ctx, pipe_ctx->plane_state->mcm_luts,
-				pipe_ctx->plane_state->lut_bank_a);
-			pipe_ctx->plane_state->lut_bank_a = !pipe_ctx->plane_state->lut_bank_a;
-		}
-	}
-
-	if (pipe_ctx->plane_state &&
-		(pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
-			pipe_ctx->plane_state->update_flags.bits.gamma_change ||
-			pipe_ctx->plane_state->update_flags.bits.lut_3d ||
-			pipe_ctx->update_flags.bits.enable))
-		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
-
-	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
-	 * only do gamma programming for powering on, internal memcmp to avoid
-	 * updating on slave planes
-	 */
-	if (pipe_ctx->update_flags.bits.enable ||
-		pipe_ctx->update_flags.bits.plane_changed ||
-		pipe_ctx->stream->update_flags.bits.out_tf ||
-		(pipe_ctx->plane_state &&
-			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
-		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
-
-	/* If the pipe has been enabled or has a different opp, we
-	 * should reprogram the fmt. This deals with cases where
-	 * interation between mpc and odm combine on different streams
-	 * causes a different pipe to be chosen to odm combine with.
-	 */
-	if (pipe_ctx->update_flags.bits.enable
-		|| pipe_ctx->update_flags.bits.opp_changed) {
-
-		pipe_ctx->stream_res.opp->funcs->opp_set_dyn_expansion(
-			pipe_ctx->stream_res.opp,
-			COLOR_SPACE_YCBCR601,
-			pipe_ctx->stream->timing.display_color_depth,
-			pipe_ctx->stream->signal);
-
-		pipe_ctx->stream_res.opp->funcs->opp_program_fmt(
-			pipe_ctx->stream_res.opp,
-			&pipe_ctx->stream->bit_depth_params,
-			&pipe_ctx->stream->clamping);
-	}
-
-	/* Set ABM pipe after other pipe configurations done */
-	if ((pipe_ctx->plane_state && pipe_ctx->plane_state->visible)) {
-		if (pipe_ctx->stream_res.abm) {
-			dc->hwss.set_pipe(pipe_ctx);
-			pipe_ctx->stream_res.abm->funcs->set_abm_level(pipe_ctx->stream_res.abm,
-				pipe_ctx->stream->abm_level);
-		}
-	}
-
-	if (pipe_ctx->update_flags.bits.test_pattern_changed) {
-		struct output_pixel_processor *odm_opp = pipe_ctx->stream_res.opp;
-		struct bit_depth_reduction_params params;
-
-		memset(&params, 0, sizeof(params));
-		odm_opp->funcs->opp_program_bit_depth_reduction(odm_opp, &params);
-		dc->hwss.set_disp_pattern_generator(dc,
-			pipe_ctx,
-			pipe_ctx->stream_res.test_pattern_params.test_pattern,
-			pipe_ctx->stream_res.test_pattern_params.color_space,
-			pipe_ctx->stream_res.test_pattern_params.color_depth,
-			NULL,
-			pipe_ctx->stream_res.test_pattern_params.width,
-			pipe_ctx->stream_res.test_pattern_params.height,
-			pipe_ctx->stream_res.test_pattern_params.offset);
-	}
-}
-
 bool dcn401_update_bandwidth(
 	struct dc *dc,
 	struct dc_state *context)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index acfdc856f543..5f3d9e7364ca 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -97,10 +97,6 @@ void dcn401_program_tg(struct dc *dc,
 		       struct pipe_ctx *pipe_ctx,
 		       struct dc_state *context,
 		       struct dce_hwseq *hws);
-void dcn401_program_pipe(
-	struct dc *dc,
-	struct pipe_ctx *pipe_ctx,
-	struct dc_state *context);
 void dcn401_perform_3dlut_wa_unlock(struct pipe_ctx *pipe_ctx);
 bool dcn401_update_bandwidth(struct dc *dc, struct dc_state *context);
 void dcn401_detect_pipe_changes(
-- 
2.47.2

