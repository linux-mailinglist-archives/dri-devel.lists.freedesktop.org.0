Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7DD891967
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8843A1126C4;
	Fri, 29 Mar 2024 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QEvs2e8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494B31126D8;
 Fri, 29 Mar 2024 12:40:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 16EBFCE2E0D;
 Fri, 29 Mar 2024 12:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075ACC433B1;
 Fri, 29 Mar 2024 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716006;
 bh=+QOsqPF9phGa90E3z4gz+2x5xpc6ykcXbmlyOrQBK+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QEvs2e8FcEYqVaCpo3vXQ36WsGekoygDe3jPFBbI+kFxO9yXYBm6KETRBqOf1e/hQ
 2T8ubDlTQT2cWLaZsimS0sFxYlbAq6z4x0IUrIJTLaw/58TMqx+VHmh8pGP9l9ZvdW
 MEBtYewFK8U+PphlRIcsXmW4Nl+NdbAdpg3PvUCfCACq8sBP6Oyz63fqm0nB9yvgtL
 2IJ7ts+PPTLXZDgHKtEcWvbGFCqJuSOfDQOMKVNZo7P8YvsXNGh8AWPdlrvdjSYFQz
 uvsLAjEXfStBwqFAWgeKXT+imKvW8d5Wuq97DTGxxZsvUKosI8QyleCSOfXWOiZRbU
 6QYSGlQz/LRgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alvin Lee <alvin.lee2@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jun.lei@amd.com, wenjing.liu@amd.com,
 dillon.varone@amd.com, chiawen.huang@amd.com, hamza.mahfooz@amd.com,
 george.shen@amd.com, stylon.wang@amd.com, srinivasan.shanmugam@amd.com,
 samson.tam@amd.com, relja.vojvodic@amd.com, etbitnun@amd.com,
 sohaib.nadeem@amd.com, austin.zheng@amd.com, Qingqing.Zhuo@amd.com,
 Wesley.Chalmers@amd.com, dmytro.laktyushkin@amd.com, mdaenzer@redhat.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 10/98] drm/amd/display: For FPO and SubVP/DRR
 configs program vmin/max sel
Date: Fri, 29 Mar 2024 08:36:41 -0400
Message-ID: <20240329123919.3087149-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
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

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit fc9f47455ae143e8831415a46eab3fbc69e408aa ]

[Why & How]
For FPO and SubVP/DRR cases we need to ensure to program
OTG_V_TOTAL_MIN/MAX_SEL, otherwise stretching the vblank
in FPO / SubVP / DRR cases will not have any effect
and we could hit underflow / corruption.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 31 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 14 +++++++++
 .../display/dc/dcn32/dcn32_resource_helpers.c | 14 ---------
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 11 ++++---
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  1 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h |  3 ++
 .../dc/resource/dcn32/dcn32_resource.c        |  2 +-
 .../dc/resource/dcn32/dcn32_resource.h        |  3 --
 .../dc/resource/dcn321/dcn321_resource.c      |  2 +-
 9 files changed, 56 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 2c424e435962d..f0c36e9cf87de 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3484,6 +3484,33 @@ static void wait_for_outstanding_hw_updates(struct dc *dc, const struct dc_state
 	}
 }
 
+static void update_drr_for_full_update(struct dc *dc, struct dc_state *context)
+{
+	uint32_t i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct dc_stream_state *stream = pipe->stream;
+		struct timing_generator *tg = pipe->stream_res.tg;
+		struct drr_params params = {0};
+
+		/* pipe not in use */
+		if (!resource_is_pipe_type(pipe, OTG_MASTER))
+			continue;
+
+		/* skip phantom pipes */
+		if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM)
+			continue;
+
+		params.vertical_total_min = stream->adjust.v_total_min;
+		params.vertical_total_max = stream->adjust.v_total_max;
+		params.vertical_total_mid = stream->adjust.v_total_mid;
+		params.vertical_total_mid_frame_num = stream->adjust.v_total_mid_frame_num;
+		if (pipe->stream_res.tg->funcs->set_drr)
+			tg->funcs->set_drr(pipe->stream_res.tg, &params);
+	}
+}
+
 static void commit_planes_for_stream(struct dc *dc,
 		struct dc_surface_update *srf_updates,
 		int surface_count,
@@ -3853,6 +3880,10 @@ static void commit_planes_for_stream(struct dc *dc,
 			pipe_ctx->stream_res.tg->funcs->program_manual_trigger(pipe_ctx->stream_res.tg);
 	}
 
+	// Update DRR for all pipes
+	if (update_type != UPDATE_TYPE_FAST)
+		update_drr_for_full_update(dc, context);
+
 	current_stream_mask = get_stream_mask(dc, context);
 	if (current_stream_mask != context->stream_mask) {
 		context->stream_mask = current_stream_mask;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 9fbdb09697fd5..259ccbe858b49 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -4990,6 +4990,20 @@ enum dc_status update_dp_encoder_resources_for_test_harness(const struct dc *dc,
 	return DC_OK;
 }
 
+bool resource_subvp_in_use(struct dc *dc,
+		struct dc_state *context)
+{
+	uint32_t i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_NONE)
+			return true;
+	}
+	return false;
+}
+
 bool check_subvp_sw_cursor_fallback_req(const struct dc *dc, struct dc_stream_state *stream)
 {
 	if (!dc->debug.disable_subvp_high_refresh && is_subvp_high_refresh_candidate(stream))
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 87760600e154d..e4a328b45c8a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -183,20 +183,6 @@ bool dcn32_all_pipes_have_stream_and_plane(struct dc *dc,
 	return true;
 }
 
-bool dcn32_subvp_in_use(struct dc *dc,
-		struct dc_state *context)
-{
-	uint32_t i;
-
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
-
-		if (dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_NONE)
-			return true;
-	}
-	return false;
-}
-
 bool dcn32_mpo_in_use(struct dc_state *context)
 {
 	uint32_t i;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index ba76dd4a2ce29..4edf7df4c6aad 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -33,6 +33,7 @@
 #include "dcn30/dcn30_resource.h"
 #include "link.h"
 #include "dc_state_priv.h"
+#include "resource.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -291,7 +292,7 @@ int dcn32_find_dummy_latency_index_for_fw_based_mclk_switch(struct dc *dc,
 
 		/* for subvp + DRR case, if subvp pipes are still present we support pstate */
 		if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported &&
-				dcn32_subvp_in_use(dc, context))
+				resource_subvp_in_use(dc, context))
 			vba->DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] = temp_clock_change_support;
 
 		if (vlevel < context->bw_ctx.dml.vba.soc.num_states &&
@@ -2279,7 +2280,7 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 	unsigned int dummy_latency_index = 0;
 	int maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
 	unsigned int min_dram_speed_mts = context->bw_ctx.dml.vba.DRAMSpeed;
-	bool subvp_in_use = dcn32_subvp_in_use(dc, context);
+	bool subvp_active = resource_subvp_in_use(dc, context);
 	unsigned int min_dram_speed_mts_margin;
 	bool need_fclk_lat_as_dummy = false;
 	bool is_subvp_p_drr = false;
@@ -2288,7 +2289,7 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 	dc_assert_fp_enabled();
 
 	/* need to find dummy latency index for subvp */
-	if (subvp_in_use) {
+	if (subvp_active) {
 		/* Override DRAMClockChangeSupport for SubVP + DRR case where the DRR cannot switch without stretching it's VBLANK */
 		if (!pstate_en) {
 			context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] = dm_dram_clock_change_vblank_w_mall_sub_vp;
@@ -2474,7 +2475,7 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 				dc->clk_mgr->bw_params->clk_table.entries[min_dram_speed_mts_offset].memclk_mhz * 16;
 		}
 
-		if (!context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching && !subvp_in_use) {
+		if (!context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching && !subvp_active) {
 			/* find largest table entry that is lower than dram speed,
 			 * but lower than DPM0 still uses DPM0
 			 */
@@ -3534,7 +3535,7 @@ void dcn32_set_clock_limits(const struct _vcs_dpi_soc_bounding_box_st *soc_bb)
 void dcn32_override_min_req_memclk(struct dc *dc, struct dc_state *context)
 {
 	// WA: restrict FPO and SubVP to use first non-strobe mode (DCN32 BW issue)
-	if ((context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching || dcn32_subvp_in_use(dc, context)) &&
+	if ((context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching || resource_subvp_in_use(dc, context)) &&
 			dc->dml.soc.num_chans <= 8) {
 		int num_mclk_levels = dc->clk_mgr->bw_params->clk_table.num_entries_per_clk.num_memclk_levels;
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 931ac8ed7069d..14945fdd92187 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1958,7 +1958,6 @@ void dcn20_program_front_end_for_ctx(
 				&& context->res_ctx.pipe_ctx[i].stream)
 			hws->funcs.blank_pixel_data(dc, &context->res_ctx.pipe_ctx[i], true);
 
-
 	/* Disconnect mpcc */
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index 77a60aa9f27bb..2eae2f3e846d8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -605,6 +605,9 @@ bool dc_resource_acquire_secondary_pipe_for_mpc_odm_legacy(
 		struct pipe_ctx *sec_pipe,
 		bool odm);
 
+bool resource_subvp_in_use(struct dc *dc,
+		struct dc_state *context);
+
 /* A test harness interface that modifies dp encoder resources in the given dc
  * state and bypasses the need to revalidate. The interface assumes that the
  * test harness interface is called with pre-validated link config stored in the
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 6f10052caeef0..71cd20618bfe0 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1913,7 +1913,7 @@ int dcn32_populate_dml_pipes_from_context(
 
 static struct dc_cap_funcs cap_funcs = {
 	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap,
-	.get_subvp_en = dcn32_subvp_in_use,
+	.get_subvp_en = resource_subvp_in_use,
 };
 
 void dcn32_calculate_wm_and_dlg(struct dc *dc, struct dc_state *context,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
index 0c87b0fabba7d..62611acd4bcb5 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
@@ -131,9 +131,6 @@ void dcn32_merge_pipes_for_subvp(struct dc *dc,
 bool dcn32_all_pipes_have_stream_and_plane(struct dc *dc,
 		struct dc_state *context);
 
-bool dcn32_subvp_in_use(struct dc *dc,
-		struct dc_state *context);
-
 bool dcn32_mpo_in_use(struct dc_state *context);
 
 bool dcn32_any_surfaces_rotated(struct dc *dc, struct dc_state *context);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 74412e5f03fef..e1ab207c46f15 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1574,7 +1574,7 @@ static void dcn321_destroy_resource_pool(struct resource_pool **pool)
 
 static struct dc_cap_funcs cap_funcs = {
 	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap,
-	.get_subvp_en = dcn32_subvp_in_use,
+	.get_subvp_en = resource_subvp_in_use,
 };
 
 static void dcn321_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
-- 
2.43.0

