Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654A985881
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001D810E7F6;
	Wed, 25 Sep 2024 11:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fm6d2+Mx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724F610E7F5;
 Wed, 25 Sep 2024 11:44:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D041F5C56D8;
 Wed, 25 Sep 2024 11:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8F2C4CEC3;
 Wed, 25 Sep 2024 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264661;
 bh=ypUhCwZGscsAPSWKG6DQ2iJ0HUlY2+WvcklS72ShEYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fm6d2+Mx+Oj27VsOvBOzr49bLNZ/7g/N2N7Tu+u6Ki00a7v8omKk9/I4TXN33HNxh
 yIJiTA+1FEqPjokrWbFz/cZ4Ppn8RBH//T1i3CqgkbbXJOcUFLazqyJC4f8pnW/Qa6
 s405Od7tNizC5Ftt0KnemG8npkIh7SwLni6O3qM4YBP+KY8ggMnYAKFocK4KmYRD21
 CWA9QghuRQ4mLCztbMcqANAjXTsUUiejaGelVeCFobIoXYp8cXueI1KuWWrgOON5uI
 JEy3jE11QIU4JC9hE9NBZjWGio2ZJkK2BLdTF26HkGXl5x4w0JE/8HG6oAavwF0mDn
 frhFC9JdFlARg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nicholas.kazlauskas@amd.com, wayne.lin@amd.com,
 dillon.varone@amd.com, aurabindo.pillai@amd.com, aric.cyr@amd.com,
 relja.vojvodic@amd.com, alvin.lee2@amd.com, chiahsuan.chung@amd.com,
 wenjing.liu@amd.com, george.shen@amd.com, michael.strauss@amd.com,
 moadhuri@amd.com, martin.leung@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 133/244] drm/amd/display: Check null pointers
 before multiple uses
Date: Wed, 25 Sep 2024 07:25:54 -0400
Message-ID: <20240925113641.1297102-133-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit fdd5ecbbff751c3b9061d8ebb08e5c96119915b4 ]

[WHAT & HOW]
Poniters, such as stream_enc and dc->bw_vbios, are null checked previously
in the same function, so Coverity warns "implies that stream_enc and
dc->bw_vbios might be null". They are used multiple times in the
subsequent code and need to be checked.

This fixes 10 FORWARD_NULL issues reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/core/dc_hw_sequencer.c | 96 ++++++++++---------
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  8 +-
 .../display/dc/link/accessories/link_dp_cts.c |  5 +-
 .../amd/display/dc/link/hwss/link_hwss_dio.c  |  5 +-
 .../dc/resource/dce112/dce112_resource.c      |  5 +-
 .../dc/resource/dcn32/dcn32_resource.c        |  3 +
 .../resource/dcn32/dcn32_resource_helpers.c   | 10 +-
 7 files changed, 76 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index 87e36d51c56d8..4a88412fdfab1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -636,57 +636,59 @@ void hwss_build_fast_sequence(struct dc *dc,
 	while (current_pipe) {
 		current_mpc_pipe = current_pipe;
 		while (current_mpc_pipe) {
-			if (dc->hwss.set_flip_control_gsl && current_mpc_pipe->plane_state && current_mpc_pipe->plane_state->update_flags.raw) {
-				block_sequence[*num_steps].params.set_flip_control_gsl_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].params.set_flip_control_gsl_params.flip_immediate = current_mpc_pipe->plane_state->flip_immediate;
-				block_sequence[*num_steps].func = HUBP_SET_FLIP_CONTROL_GSL;
-				(*num_steps)++;
-			}
-			if (dc->hwss.program_triplebuffer && dc->debug.enable_tri_buf && current_mpc_pipe->plane_state->update_flags.raw) {
-				block_sequence[*num_steps].params.program_triplebuffer_params.dc = dc;
-				block_sequence[*num_steps].params.program_triplebuffer_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].params.program_triplebuffer_params.enableTripleBuffer = current_mpc_pipe->plane_state->triplebuffer_flips;
-				block_sequence[*num_steps].func = HUBP_PROGRAM_TRIPLEBUFFER;
-				(*num_steps)++;
-			}
-			if (dc->hwss.update_plane_addr && current_mpc_pipe->plane_state->update_flags.bits.addr_update) {
-				if (resource_is_pipe_type(current_mpc_pipe, OTG_MASTER) &&
-						stream_status->mall_stream_config.type == SUBVP_MAIN) {
-					block_sequence[*num_steps].params.subvp_save_surf_addr.dc_dmub_srv = dc->ctx->dmub_srv;
-					block_sequence[*num_steps].params.subvp_save_surf_addr.addr = &current_mpc_pipe->plane_state->address;
-					block_sequence[*num_steps].params.subvp_save_surf_addr.subvp_index = current_mpc_pipe->subvp_index;
-					block_sequence[*num_steps].func = DMUB_SUBVP_SAVE_SURF_ADDR;
+			if (current_mpc_pipe->plane_state) {
+				if (dc->hwss.set_flip_control_gsl && current_mpc_pipe->plane_state->update_flags.raw) {
+					block_sequence[*num_steps].params.set_flip_control_gsl_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].params.set_flip_control_gsl_params.flip_immediate = current_mpc_pipe->plane_state->flip_immediate;
+					block_sequence[*num_steps].func = HUBP_SET_FLIP_CONTROL_GSL;
+					(*num_steps)++;
+				}
+				if (dc->hwss.program_triplebuffer && dc->debug.enable_tri_buf && current_mpc_pipe->plane_state->update_flags.raw) {
+					block_sequence[*num_steps].params.program_triplebuffer_params.dc = dc;
+					block_sequence[*num_steps].params.program_triplebuffer_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].params.program_triplebuffer_params.enableTripleBuffer = current_mpc_pipe->plane_state->triplebuffer_flips;
+					block_sequence[*num_steps].func = HUBP_PROGRAM_TRIPLEBUFFER;
+					(*num_steps)++;
+				}
+				if (dc->hwss.update_plane_addr && current_mpc_pipe->plane_state->update_flags.bits.addr_update) {
+					if (resource_is_pipe_type(current_mpc_pipe, OTG_MASTER) &&
+							stream_status->mall_stream_config.type == SUBVP_MAIN) {
+						block_sequence[*num_steps].params.subvp_save_surf_addr.dc_dmub_srv = dc->ctx->dmub_srv;
+						block_sequence[*num_steps].params.subvp_save_surf_addr.addr = &current_mpc_pipe->plane_state->address;
+						block_sequence[*num_steps].params.subvp_save_surf_addr.subvp_index = current_mpc_pipe->subvp_index;
+						block_sequence[*num_steps].func = DMUB_SUBVP_SAVE_SURF_ADDR;
+						(*num_steps)++;
+					}
+
+					block_sequence[*num_steps].params.update_plane_addr_params.dc = dc;
+					block_sequence[*num_steps].params.update_plane_addr_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].func = HUBP_UPDATE_PLANE_ADDR;
 					(*num_steps)++;
 				}
 
-				block_sequence[*num_steps].params.update_plane_addr_params.dc = dc;
-				block_sequence[*num_steps].params.update_plane_addr_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].func = HUBP_UPDATE_PLANE_ADDR;
-				(*num_steps)++;
-			}
-
-			if (hws->funcs.set_input_transfer_func && current_mpc_pipe->plane_state->update_flags.bits.gamma_change) {
-				block_sequence[*num_steps].params.set_input_transfer_func_params.dc = dc;
-				block_sequence[*num_steps].params.set_input_transfer_func_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].params.set_input_transfer_func_params.plane_state = current_mpc_pipe->plane_state;
-				block_sequence[*num_steps].func = DPP_SET_INPUT_TRANSFER_FUNC;
-				(*num_steps)++;
-			}
+				if (hws->funcs.set_input_transfer_func && current_mpc_pipe->plane_state->update_flags.bits.gamma_change) {
+					block_sequence[*num_steps].params.set_input_transfer_func_params.dc = dc;
+					block_sequence[*num_steps].params.set_input_transfer_func_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].params.set_input_transfer_func_params.plane_state = current_mpc_pipe->plane_state;
+					block_sequence[*num_steps].func = DPP_SET_INPUT_TRANSFER_FUNC;
+					(*num_steps)++;
+				}
 
-			if (dc->hwss.program_gamut_remap && current_mpc_pipe->plane_state->update_flags.bits.gamut_remap_change) {
-				block_sequence[*num_steps].params.program_gamut_remap_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].func = DPP_PROGRAM_GAMUT_REMAP;
-				(*num_steps)++;
-			}
-			if (current_mpc_pipe->plane_state->update_flags.bits.input_csc_change) {
-				block_sequence[*num_steps].params.setup_dpp_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].func = DPP_SETUP_DPP;
-				(*num_steps)++;
-			}
-			if (current_mpc_pipe->plane_state->update_flags.bits.coeff_reduction_change) {
-				block_sequence[*num_steps].params.program_bias_and_scale_params.pipe_ctx = current_mpc_pipe;
-				block_sequence[*num_steps].func = DPP_PROGRAM_BIAS_AND_SCALE;
-				(*num_steps)++;
+				if (dc->hwss.program_gamut_remap && current_mpc_pipe->plane_state->update_flags.bits.gamut_remap_change) {
+					block_sequence[*num_steps].params.program_gamut_remap_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].func = DPP_PROGRAM_GAMUT_REMAP;
+					(*num_steps)++;
+				}
+				if (current_mpc_pipe->plane_state->update_flags.bits.input_csc_change) {
+					block_sequence[*num_steps].params.setup_dpp_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].func = DPP_SETUP_DPP;
+					(*num_steps)++;
+				}
+				if (current_mpc_pipe->plane_state->update_flags.bits.coeff_reduction_change) {
+					block_sequence[*num_steps].params.program_bias_and_scale_params.pipe_ctx = current_mpc_pipe;
+					block_sequence[*num_steps].func = DPP_PROGRAM_BIAS_AND_SCALE;
+					(*num_steps)++;
+				}
 			}
 			if (hws->funcs.set_output_transfer_func && current_mpc_pipe->stream->update_flags.bits.out_tf) {
 				block_sequence[*num_steps].params.set_output_transfer_func_params.dc = dc;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 2532ad410cb56..456e19e0d415c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -2283,6 +2283,9 @@ void dcn20_post_unlock_program_front_end(
 		}
 	}
 
+	if (!hwseq)
+		return;
+
 	/* P-State support transitions:
 	 * Natural -> FPO: 		P-State disabled in prepare, force disallow anytime is safe
 	 * FPO -> Natural: 		Unforce anytime after FW disable is safe (P-State will assert naturally)
@@ -2290,7 +2293,7 @@ void dcn20_post_unlock_program_front_end(
 	 * FPO -> Unsupported:	P-State disabled in prepare, unforce disallow anytime is safe
 	 * FPO <-> SubVP:		Force disallow is maintained on the FPO / SubVP pipes
 	 */
-	if (hwseq && hwseq->funcs.update_force_pstate)
+	if (hwseq->funcs.update_force_pstate)
 		dc->hwseq->funcs.update_force_pstate(dc, context);
 
 	/* Only program the MALL registers after all the main and phantom pipes
@@ -2529,6 +2532,9 @@ bool dcn20_wait_for_blank_complete(
 {
 	int counter;
 
+	if (!opp)
+		return false;
+
 	for (counter = 0; counter < 1000; counter++) {
 		if (!opp->funcs->dpg_is_pending(opp))
 			break;
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 555c1c484cfdd..df3781081da7a 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -804,8 +804,11 @@ bool dp_set_test_pattern(
 			break;
 		}
 
+		if (!pipe_ctx->stream)
+			return false;
+
 		if (pipe_ctx->stream_res.tg->funcs->lock_doublebuffer_enable) {
-			if (pipe_ctx->stream && should_use_dmub_lock(pipe_ctx->stream->link)) {
+			if (should_use_dmub_lock(pipe_ctx->stream->link)) {
 				union dmub_hw_lock_flags hw_locks = { 0 };
 				struct dmub_hw_lock_inst_flags inst_flags = { 0 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
index b76737b7b9e41..3e47a6735912a 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
@@ -74,7 +74,10 @@ void reset_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
 	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(pipe_ctx->stream->link);
 	struct stream_encoder *stream_enc = pipe_ctx->stream_res.stream_enc;
 
-	if (stream_enc && stream_enc->funcs->disable_fifo)
+	if (!stream_enc)
+		return;
+
+	if (stream_enc->funcs->disable_fifo)
 		stream_enc->funcs->disable_fifo(stream_enc);
 	if (stream_enc->funcs->set_input_mode)
 		stream_enc->funcs->set_input_mode(stream_enc, 0);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
index 88afb2a30eef5..162856c523e40 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
@@ -1067,7 +1067,10 @@ static void bw_calcs_data_update_from_pplib(struct dc *dc)
 	struct dm_pp_clock_levels clks = {0};
 	int memory_type_multiplier = MEMORY_TYPE_MULTIPLIER_CZ;
 
-	if (dc->bw_vbios && dc->bw_vbios->memory_type == bw_def_hbm)
+	if (!dc->bw_vbios)
+		return;
+
+	if (dc->bw_vbios->memory_type == bw_def_hbm)
 		memory_type_multiplier = MEMORY_TYPE_HBM;
 
 	/*do system clock  TODO PPLIB: after PPLIB implement,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 969658313fd65..a43ffa53890af 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1651,6 +1651,9 @@ static void dcn32_enable_phantom_plane(struct dc *dc,
 		else
 			phantom_plane = dc_state_create_phantom_plane(dc, context, curr_pipe->plane_state);
 
+		if (!phantom_plane)
+			continue;
+
 		memcpy(&phantom_plane->address, &curr_pipe->plane_state->address, sizeof(phantom_plane->address));
 		memcpy(&phantom_plane->scaling_quality, &curr_pipe->plane_state->scaling_quality,
 				sizeof(phantom_plane->scaling_quality));
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c
index d184105ce2b3e..47c8a9fbe7546 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c
@@ -218,12 +218,12 @@ bool dcn32_is_center_timing(struct pipe_ctx *pipe)
 				pipe->stream->timing.v_addressable != pipe->stream->src.height) {
 			is_center_timing = true;
 		}
-	}
 
-	if (pipe->plane_state) {
-		if (pipe->stream->timing.v_addressable != pipe->plane_state->dst_rect.height &&
-				pipe->stream->timing.v_addressable != pipe->plane_state->src_rect.height) {
-			is_center_timing = true;
+		if (pipe->plane_state) {
+			if (pipe->stream->timing.v_addressable != pipe->plane_state->dst_rect.height &&
+					pipe->stream->timing.v_addressable != pipe->plane_state->src_rect.height) {
+				is_center_timing = true;
+			}
 		}
 	}
 
-- 
2.43.0

