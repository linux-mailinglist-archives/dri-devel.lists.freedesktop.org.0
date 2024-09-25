Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E998587C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E7F10E7F0;
	Wed, 25 Sep 2024 11:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l72kP6B+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E74A10E093;
 Wed, 25 Sep 2024 11:43:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A496C5C5820;
 Wed, 25 Sep 2024 11:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C791C4CEC3;
 Wed, 25 Sep 2024 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264635;
 bh=bGDg5HzBRyT0TNoq2HL7nACDfHAuY+jy4FyNpMPS6Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l72kP6B+6VtCnrwfBn/U1Q1QEx0P8CvCKsdCZDD93DsNXLcYyOARVRHV+RrtfwLF3
 Tu1cb236FRj35ewAIeT3ZtcYzVgUUwJXUqA54NWea2WJmLS5/2RFKw5eEdvCoRAN9g
 EX1fS09fLvy3Rwz8SjCGhhbu1WZZL8frEDVyOJd/xrot4L3wswzNXFG4vpOZMInCAU
 pcyDfUaGn6dF4jhUWa3PTR931gUbvi2XrrgHfSWFuWjJ8wdyCXdKI0BbIu/gepmGSs
 E7s2Cj+zdghPNopz8PG/EGcapwbhypjA3fUxoJXQ30JpeSkEEdLawtwmSBMxyHz6Hk
 DddDwI8SagXKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, bhuvanachandra.pinninti@amd.com, hamza.mahfooz@amd.com,
 mario.limonciello@amd.com, chiahsuan.chung@amd.com, alvin.lee2@amd.com,
 wayne.lin@amd.com, charlene.liu@amd.com, yi-lchen@amd.com,
 dmytro.laktyushkin@amd.com, chris.park@amd.com, mwen@igalia.com,
 roman.li@amd.com, moadhuri@amd.com, yi-ling.chen2@amd.com,
 nicholas.kazlauskas@amd.com, daniel.miess@amd.com, dillon.varone@amd.com,
 sungkim@amd.com, wenjing.liu@amd.com, george.shen@amd.com,
 zaeem.mohamed@amd.com, michael.strauss@amd.com, daniel.sa@amd.com,
 ran.shi@amd.com, yao.wang1@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 132/244] drm/amd/display: Check null pointers
 before used
Date: Wed, 25 Sep 2024 07:25:53 -0400
Message-ID: <20240925113641.1297102-132-sashal@kernel.org>
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

[ Upstream commit be1fb44389ca3038ad2430dac4234669bc177ee3 ]

[WHAT & HOW]
Poniters, such as dc->clk_mgr, are null checked previously in the same
function, so Coverity warns "implies that "dc->clk_mgr" might be null".
As a result, these pointers need to be checked when used again.

This fixes 10 FORWARD_NULL issues reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c    | 3 ++-
 drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c    | 3 ++-
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 5 +++--
 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 4 ++--
 drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c   | 4 ++--
 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 8 ++++----
 .../amd/display/dc/link/protocols/link_dp_capability.c    | 2 +-
 8 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
index 78df96882d6ec..f8409453434c1 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
@@ -195,7 +195,7 @@ void dce11_pplib_apply_display_requirements(
 	 * , then change minimum memory clock based on real-time bandwidth
 	 * limitation.
 	 */
-	if ((dc->ctx->asic_id.chip_family == FAMILY_AI) &&
+	if (dc->bw_vbios && (dc->ctx->asic_id.chip_family == FAMILY_AI) &&
 	     ASICREV_IS_VEGA20_P(dc->ctx->asic_id.hw_internal_rev) && (context->stream_count >= 2)) {
 		pp_display_cfg->min_memory_clock_khz = max(pp_display_cfg->min_memory_clock_khz,
 							   (uint32_t) div64_s64(
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
index bf399819ca800..22ac2b7e49aea 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
@@ -749,7 +749,8 @@ bool hubp1_is_flip_pending(struct hubp *hubp)
 	if (flip_pending)
 		return true;
 
-	if (earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
+	if (hubp &&
+	    earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c
index 6bba020ad6fbf..0637e4c552d8a 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c
@@ -927,7 +927,8 @@ bool hubp2_is_flip_pending(struct hubp *hubp)
 	if (flip_pending)
 		return true;
 
-	if (earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
+	if (hubp &&
+	    earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 1f2eb2f727dc1..45eb392f44932 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -949,7 +949,7 @@ void dce110_edp_backlight_control(
 {
 	struct dc_context *ctx = link->ctx;
 	struct bp_transmitter_control cntl = { 0 };
-	uint8_t pwrseq_instance;
+	uint8_t pwrseq_instance = 0;
 	unsigned int pre_T11_delay = OLED_PRE_T11_DELAY;
 	unsigned int post_T7_delay = OLED_POST_T7_DELAY;
 
@@ -1002,7 +1002,8 @@ void dce110_edp_backlight_control(
 	 */
 	/* dc_service_sleep_in_milliseconds(50); */
 		/*edp 1.2*/
-	pwrseq_instance = link->panel_cntl->pwrseq_inst;
+	if (link->panel_cntl)
+		pwrseq_instance = link->panel_cntl->pwrseq_inst;
 
 	if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_ON) {
 		if (!link->dc->config.edp_no_power_sequencing)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 1d2be574f6680..83942abd08e84 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -1554,7 +1554,7 @@ void dcn10_init_hw(struct dc *dc)
 		dc->clk_mgr->funcs->init_clocks(dc->clk_mgr);
 
 	/* Align bw context with hw config when system resume. */
-	if (dc->clk_mgr->clks.dispclk_khz != 0 && dc->clk_mgr->clks.dppclk_khz != 0) {
+	if (dc->clk_mgr && dc->clk_mgr->clks.dispclk_khz != 0 && dc->clk_mgr->clks.dppclk_khz != 0) {
 		dc->current_state->bw_ctx.bw.dcn.clk.dispclk_khz = dc->clk_mgr->clks.dispclk_khz;
 		dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz = dc->clk_mgr->clks.dppclk_khz;
 	}
@@ -1674,7 +1674,7 @@ void dcn10_init_hw(struct dc *dc)
 		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
 	}
 
-	if (dc->clk_mgr->funcs->notify_wm_ranges)
+	if (dc->clk_mgr && dc->clk_mgr->funcs->notify_wm_ranges)
 		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
index 746c522adf84c..3d4b31bd99469 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
@@ -256,10 +256,10 @@ void dcn31_init_hw(struct dc *dc)
 	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
 		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
 
-	if (dc->clk_mgr->funcs->notify_wm_ranges)
+	if (dc->clk_mgr && dc->clk_mgr->funcs->notify_wm_ranges)
 		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
 
-	if (dc->clk_mgr->funcs->set_hard_max_memclk && !dc->clk_mgr->dc_mode_softmax_enabled)
+	if (dc->clk_mgr && dc->clk_mgr->funcs->set_hard_max_memclk && !dc->clk_mgr->dc_mode_softmax_enabled)
 		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
 
 	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index d5e9aec52a059..25fe2e7c274b6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -235,7 +235,7 @@ void dcn35_init_hw(struct dc *dc)
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
 */
-	if (res_pool->hubbub->funcs->dchubbub_init)
+	if (res_pool->hubbub && res_pool->hubbub->funcs->dchubbub_init)
 		res_pool->hubbub->funcs->dchubbub_init(dc->res_pool->hubbub);
 	/* If taking control over from VBIOS, we may want to optimize our first
 	 * mode set, so we need to skip powering down pipes until we know which
@@ -328,10 +328,10 @@ void dcn35_init_hw(struct dc *dc)
 	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
 		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
 
-	if (dc->clk_mgr->funcs->notify_wm_ranges)
+	if (dc->clk_mgr && dc->clk_mgr->funcs->notify_wm_ranges)
 		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
 
-	if (dc->clk_mgr->funcs->set_hard_max_memclk && !dc->clk_mgr->dc_mode_softmax_enabled)
+	if (dc->clk_mgr && dc->clk_mgr->funcs->set_hard_max_memclk && !dc->clk_mgr->dc_mode_softmax_enabled)
 		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
 
 
@@ -1041,7 +1041,7 @@ void dcn35_calc_blocks_to_gate(struct dc *dc, struct dc_state *context,
 		if (pipe_ctx->plane_res.hubp)
 			update_state->pg_pipe_res_update[PG_HUBP][pipe_ctx->plane_res.hubp->inst] = false;
 
-		if (pipe_ctx->plane_res.dpp)
+		if (pipe_ctx->plane_res.dpp && pipe_ctx->plane_res.hubp)
 			update_state->pg_pipe_res_update[PG_DPP][pipe_ctx->plane_res.hubp->inst] = false;
 
 		if (pipe_ctx->plane_res.dpp || pipe_ctx->stream_res.opp)
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 46bb7a855bc21..60015e94c4aa8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -2254,7 +2254,7 @@ bool dp_verify_link_cap_with_retries(
 
 		memset(&link->verified_link_cap, 0,
 				sizeof(struct dc_link_settings));
-		if (!link_detect_connection_type(link, &type) || type == dc_connection_none) {
+		if (link->link_enc && (!link_detect_connection_type(link, &type) || type == dc_connection_none)) {
 			link->verified_link_cap = fail_safe_link_settings;
 			break;
 		} else if (dp_verify_link_cap(link, known_limit_link_setting, &fail_count)) {
-- 
2.43.0

