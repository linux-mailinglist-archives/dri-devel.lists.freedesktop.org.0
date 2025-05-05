Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2A9AA9F53
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801F210E452;
	Mon,  5 May 2025 22:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vRq85PjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9326310E456;
 Mon,  5 May 2025 22:22:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DA8E629C5;
 Mon,  5 May 2025 22:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F06C4CEE4;
 Mon,  5 May 2025 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483743;
 bh=JvaM8C4R7g+4rJcokCXnUEnCoHBolRT/IRg2BFIOovU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vRq85PjFinJ53sUtKDzG1couL+hfPgulF9tBeDRH2+4wwNH2ZW0CiT6o5G8FNmkSf
 +6Kl0SNySY+Z0ZYUwk5aAMHcY4LQvYa4mQp3FcwxKXL+sTKsBLootvX2w7ZKUYvkSS
 fAh+8Hc0CjAHBNbKahUBaUANa8wFDMRHHfag5gICmAvrsh33OZgq8qEKVa4GCflTGo
 V5R/M5q/++5cbGzG71sjvw/hUSpLQVvPSjuvRzYCBY2PmMktnwNcv9Ot2PE05koILM
 gU/QTknNuhwhuOPUuoerxKMoZHoIEE/Qzkq6nNtXptJe6pFRdMESi3seb1ypbABiOD
 Wql9jyANKOoXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Danny Wang <danny.wang@amd.com>, Anthony Koo <anthony.koo@amd.com>,
 Robin Chen <robin.chen@amd.com>, Zhongwei Zhang <Zhongwei.Zhang@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com, alex.hung@amd.com,
 alvin.lee2@amd.com, aurabindo.pillai@amd.com, Austin.Zheng@amd.com,
 Ilya.Bakoulin@amd.com, mario.limonciello@amd.com, Wayne.Lin@amd.com,
 Josip.Pavic@amd.com, dillon.varone@amd.com, wenjing.liu@amd.com,
 linux@treblig.org, Leo.Zeng@amd.com, Iswara.Nagulendran@amd.com,
 roman.li@amd.com, krunoslav.kovac@amd.com, jun.lei@amd.com,
 george.shen@amd.com, karthi.kandasamy@amd.com, Samson.Tam@amd.com,
 Charlene.Liu@amd.com, jerry.zuo@amd.com, Ovidiu.Bunea@amd.com,
 Kaitlyn.Tse@amd.com, ryanseto@amd.com, martin.tsai@amd.com,
 yi-lchen@amd.com, tjakobi@math.uni-bielefeld.de, Sungjoon.Kim@amd.com,
 michael.strauss@amd.com, mwen@igalia.com, zhikai.zhai@amd.com,
 peterson.guo@amd.com, ivlipski@amd.com, joshua.aberback@amd.com,
 rostrows@amd.com, srinivasan.shanmugam@amd.com,
 hamzamahfooz@linux.microsoft.com, nicholas.kazlauskas@amd.com,
 fudong.wang@amd.com, ian.chen@amd.com, PeiChen.Huang@amd.com,
 Aric.Cyr@amd.com, Nicholas.Susanto@amd.com, daniel.miess@amd.com,
 Yihan.Zhu@amd.com, Hansen.Dsouza@amd.com, nevenko.stupar@amd.com,
 sarvinde@amd.com, Relja.Vojvodic@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 197/642] drm/amd/display: Do not enable replay
 when vtotal update is pending.
Date: Mon,  5 May 2025 18:06:53 -0400
Message-Id: <20250505221419.2672473-197-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Danny Wang <danny.wang@amd.com>

[ Upstream commit bd00b29b5f236dce677089319176dee5872b5a7a ]

[Why&How]
Vtotal is not applied to HW when handling vsync interrupt.
Make sure vtotal is aligned before enable replay.

Reviewed-by: Anthony Koo <anthony.koo@amd.com>
Reviewed-by: Robin Chen <robin.chen@amd.com>
Signed-off-by: Danny Wang <danny.wang@amd.com>
Signed-off-by: Zhongwei Zhang <Zhongwei.Zhang@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c          |  9 +++++++--
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 15 +++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h      |  1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c |  7 ++-----
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  7 ++-----
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  8 ++------
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c   |  4 +---
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c   |  3 +--
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 10 +++-------
 .../gpu/drm/amd/display/dc/hwss/hw_sequencer.h    |  6 ++++++
 10 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 4683c7ef4507f..a444fe1e0838a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -452,6 +452,7 @@ bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 
 	if (dc->caps.max_v_total != 0 &&
 		(adjust->v_total_max > dc->caps.max_v_total || adjust->v_total_min > dc->caps.max_v_total)) {
+		stream->adjust.timing_adjust_pending = false;
 		if (adjust->allow_otg_v_count_halt)
 			return set_long_vtotal(dc, stream, adjust);
 		else
@@ -465,7 +466,7 @@ bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 			dc->hwss.set_drr(&pipe,
 					1,
 					*adjust);
-
+			stream->adjust.timing_adjust_pending = false;
 			return true;
 		}
 	}
@@ -3127,8 +3128,12 @@ static void copy_stream_update_to_stream(struct dc *dc,
 	if (update->vrr_active_fixed)
 		stream->vrr_active_fixed = *update->vrr_active_fixed;
 
-	if (update->crtc_timing_adjust)
+	if (update->crtc_timing_adjust) {
+		if (stream->adjust.v_total_min != update->crtc_timing_adjust->v_total_min ||
+			stream->adjust.v_total_max != update->crtc_timing_adjust->v_total_max)
+			stream->adjust.timing_adjust_pending = true;
 		stream->adjust = *update->crtc_timing_adjust;
+	}
 
 	if (update->dpms_off)
 		stream->dpms_off = *update->dpms_off;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index 6eb9bae3af912..a49604b7701f7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -609,6 +609,21 @@ void set_p_state_switch_method(
 	}
 }
 
+void set_drr_and_clear_adjust_pending(
+		struct pipe_ctx *pipe_ctx,
+		struct dc_stream_state *stream,
+		struct drr_params *params)
+{
+	/* params can be null.*/
+	if (pipe_ctx && pipe_ctx->stream_res.tg &&
+			pipe_ctx->stream_res.tg->funcs->set_drr)
+		pipe_ctx->stream_res.tg->funcs->set_drr(
+				pipe_ctx->stream_res.tg, params);
+
+	if (stream)
+		stream->adjust.timing_adjust_pending = false;
+}
+
 void get_fams2_visual_confirm_color(
 		struct dc *dc,
 		struct dc_state *context,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index 5ac55601a6da1..37e381fc7f02a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -1015,6 +1015,7 @@ struct dc_crtc_timing_adjust {
 	uint32_t v_total_mid;
 	uint32_t v_total_mid_frame_num;
 	uint32_t allow_otg_v_count_halt;
+	uint8_t timing_adjust_pending;
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index fcbde50213d69..94ceccfc04982 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1655,9 +1655,7 @@ enum dc_status dce110_apply_single_controller_ctx_to_hw(
 
 	params.vertical_total_min = stream->adjust.v_total_min;
 	params.vertical_total_max = stream->adjust.v_total_max;
-	if (pipe_ctx->stream_res.tg->funcs->set_drr)
-		pipe_ctx->stream_res.tg->funcs->set_drr(
-			pipe_ctx->stream_res.tg, &params);
+	set_drr_and_clear_adjust_pending(pipe_ctx, stream, &params);
 
 	// DRR should set trigger event to monitor surface update event
 	if (stream->adjust.v_total_min != 0 && stream->adjust.v_total_max != 0)
@@ -2105,8 +2103,7 @@ static void set_drr(struct pipe_ctx **pipe_ctx,
 		struct timing_generator *tg = pipe_ctx[i]->stream_res.tg;
 
 		if ((tg != NULL) && tg->funcs) {
-			if (tg->funcs->set_drr)
-				tg->funcs->set_drr(tg, &params);
+			set_drr_and_clear_adjust_pending(pipe_ctx[i], pipe_ctx[i]->stream, &params);
 			if (adjust.v_total_max != 0 && adjust.v_total_min != 0)
 				if (tg->funcs->set_static_screen_control)
 					tg->funcs->set_static_screen_control(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 13f9e9b439f6a..4c89bf6725b3b 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -1112,9 +1112,7 @@ static void dcn10_reset_back_end_for_pipe(
 		pipe_ctx->stream_res.tg->funcs->disable_crtc(pipe_ctx->stream_res.tg);
 
 		pipe_ctx->stream_res.tg->funcs->enable_optc_clock(pipe_ctx->stream_res.tg, false);
-		if (pipe_ctx->stream_res.tg->funcs->set_drr)
-			pipe_ctx->stream_res.tg->funcs->set_drr(
-					pipe_ctx->stream_res.tg, NULL);
+		set_drr_and_clear_adjust_pending(pipe_ctx, pipe_ctx->stream, NULL);
 		if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
 			pipe_ctx->stream->link->phy_state.symclk_ref_cnts.otg = 0;
 	}
@@ -3217,8 +3215,7 @@ void dcn10_set_drr(struct pipe_ctx **pipe_ctx,
 		struct timing_generator *tg = pipe_ctx[i]->stream_res.tg;
 
 		if ((tg != NULL) && tg->funcs) {
-			if (tg->funcs->set_drr)
-				tg->funcs->set_drr(tg, &params);
+			set_drr_and_clear_adjust_pending(pipe_ctx[i], pipe_ctx[i]->stream, &params);
 			if (adjust.v_total_max != 0 && adjust.v_total_min != 0)
 				if (tg->funcs->set_static_screen_control)
 					tg->funcs->set_static_screen_control(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index b78096a7690ee..f7e31aec32058 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -952,9 +952,7 @@ enum dc_status dcn20_enable_stream_timing(
 	params.vertical_total_max = stream->adjust.v_total_max;
 	params.vertical_total_mid = stream->adjust.v_total_mid;
 	params.vertical_total_mid_frame_num = stream->adjust.v_total_mid_frame_num;
-	if (pipe_ctx->stream_res.tg->funcs->set_drr)
-		pipe_ctx->stream_res.tg->funcs->set_drr(
-			pipe_ctx->stream_res.tg, &params);
+	set_drr_and_clear_adjust_pending(pipe_ctx, stream, &params);
 
 	// DRR should set trigger event to monitor surface update event
 	if (stream->adjust.v_total_min != 0 && stream->adjust.v_total_max != 0)
@@ -2849,9 +2847,7 @@ void dcn20_reset_back_end_for_pipe(
 			pipe_ctx->stream_res.tg->funcs->set_odm_bypass(
 					pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing);
 
-		if (pipe_ctx->stream_res.tg->funcs->set_drr)
-			pipe_ctx->stream_res.tg->funcs->set_drr(
-					pipe_ctx->stream_res.tg, NULL);
+		set_drr_and_clear_adjust_pending(pipe_ctx, pipe_ctx->stream, NULL);
 		/* TODO - convert symclk_ref_cnts for otg to a bit map to solve
 		 * the case where the same symclk is shared across multiple otg
 		 * instances
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
index 03ba01f4ace18..38f8898266971 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
@@ -538,9 +538,7 @@ static void dcn31_reset_back_end_for_pipe(
 	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
 		pipe_ctx->stream->link->phy_state.symclk_ref_cnts.otg = 0;
 
-	if (pipe_ctx->stream_res.tg->funcs->set_drr)
-		pipe_ctx->stream_res.tg->funcs->set_drr(
-				pipe_ctx->stream_res.tg, NULL);
+	set_drr_and_clear_adjust_pending(pipe_ctx, pipe_ctx->stream, NULL);
 
 	/* DPMS may already disable or */
 	/* dpms_off status is incorrect due to fastboot
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index b907ad1acedd9..922b8d71cf1aa 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -1473,8 +1473,7 @@ void dcn35_set_drr(struct pipe_ctx **pipe_ctx,
 					num_frames = 2 * (frame_rate % 60);
 				}
 			}
-			if (tg->funcs->set_drr)
-				tg->funcs->set_drr(tg, &params);
+			set_drr_and_clear_adjust_pending(pipe_ctx[i], pipe_ctx[i]->stream, &params);
 			if (adjust.v_total_max != 0 && adjust.v_total_min != 0)
 				if (tg->funcs->set_static_screen_control)
 					tg->funcs->set_static_screen_control(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 89af3e4afbc25..f21e2f7449517 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -830,10 +830,7 @@ enum dc_status dcn401_enable_stream_timing(
 	}
 
 	hws->funcs.wait_for_blank_complete(pipe_ctx->stream_res.opp);
-
-	if (pipe_ctx->stream_res.tg->funcs->set_drr)
-		pipe_ctx->stream_res.tg->funcs->set_drr(
-			pipe_ctx->stream_res.tg, &params);
+	set_drr_and_clear_adjust_pending(pipe_ctx, stream, &params);
 
 	/* Event triggers and num frames initialized for DRR, but can be
 	 * later updated for PSR use. Note DRR trigger events are generated
@@ -1866,9 +1863,8 @@ void dcn401_reset_back_end_for_pipe(
 			pipe_ctx->stream_res.tg->funcs->set_odm_bypass(
 					pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing);
 
-		if (pipe_ctx->stream_res.tg->funcs->set_drr)
-			pipe_ctx->stream_res.tg->funcs->set_drr(
-					pipe_ctx->stream_res.tg, NULL);
+		set_drr_and_clear_adjust_pending(pipe_ctx, pipe_ctx->stream, NULL);
+
 		/* TODO - convert symclk_ref_cnts for otg to a bit map to solve
 		 * the case where the same symclk is shared across multiple otg
 		 * instances
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index a7d66cfd93c91..16ef5250a02e1 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -46,6 +46,7 @@ struct dce_hwseq;
 struct link_resource;
 struct dc_dmub_cmd;
 struct pg_block_update;
+struct drr_params;
 
 struct subvp_pipe_control_lock_fast_params {
 	struct dc *dc;
@@ -521,6 +522,11 @@ void set_p_state_switch_method(
 		struct dc_state *context,
 		struct pipe_ctx *pipe_ctx);
 
+void set_drr_and_clear_adjust_pending(
+		struct pipe_ctx *pipe_ctx,
+		struct dc_stream_state *stream,
+		struct drr_params *params);
+
 void hwss_execute_sequence(struct dc *dc,
 		struct block_sequence block_sequence[],
 		int num_steps);
-- 
2.39.5

