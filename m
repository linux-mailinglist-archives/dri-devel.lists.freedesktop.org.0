Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03009AAA040
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFA010E4B9;
	Mon,  5 May 2025 22:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gdy/qop2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4B910E4CD;
 Mon,  5 May 2025 22:33:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 10CB761129;
 Mon,  5 May 2025 22:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C66EC4CEEE;
 Mon,  5 May 2025 22:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484386;
 bh=feIJHnMtvQnMS0ls4qOK65YuDUdIMJtZqdYGB7wj2L4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gdy/qop28nJ0vgKDr5Rsb9/uwpRcOlHA0jnr2VwsoJWb+NVLyxhyl0MjjsuiT7mku
 IZ5tIFiektdhYY0auyM7zSOEU0tQhdAE6sAPlOwOgVwrPdZz+oa4RvOFup6qFU95If
 siv2m/bYHSccaoLTIVWxDVhi5UjLlQFo7wLxNtNAxFozE9xreEjxolmTwfbyFbV948
 pky+bXZZ6ZGkOQ6FS3TMk0S8T1V2LvI9Bsmu/6NB0+LmYaUDFPZx9M61efghNXNVLo
 MFcgsu2KI6BduXMU+BichRs7jgrYNgT1MyM2WKIfobg9jjCeaUdC35ozF64Edksh7s
 U+mHAHowMqNOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dillon Varone <dillon.varone@amd.com>, Austin Zheng <Austin.Zheng@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, hamzamahfooz@linux.microsoft.com, ryanseto@amd.com,
 rostrows@amd.com, aurabindo.pillai@amd.com, alvin.lee2@amd.com,
 chenhuacai@kernel.org, roheetchavan@gmail.com, chris.park@amd.com,
 george.shen@amd.com, jerry.zuo@amd.com, jiapeng.chong@linux.alibaba.com,
 rodrigo.siqueira@amd.com, chaitanya.dhere@amd.com, okuzhyln@amd.com,
 ruanjinjie@huawei.com, colin.i.king@gmail.com, wenjing.liu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 468/642] drm/amd/display: Fixes for mcache
 programming in DML21
Date: Mon,  5 May 2025 18:11:24 -0400
Message-Id: <20250505221419.2672473-468-sashal@kernel.org>
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

From: Dillon Varone <dillon.varone@amd.com>

[ Upstream commit c909a49128a31bced8cfbd2dfb0a4fe56e01a6d0 ]

[WHY & HOW]
- Fix indexing phantom planes for mcache programming in the wrapper
- Fix phantom mcache allocations to align with HW guidance
- Fix mcache assignment for chroma plane for multi-planar formats

Reviewed-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dml2/dml21/dml21_utils.c   |  1 -
 .../amd/display/dc/dml2/dml21/dml21_wrapper.c | 14 +++++++++
 .../display/dc/dml2/dml21/inc/dml_top_types.h |  1 +
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c | 30 ++++++++++++++++++-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      |  3 ++
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  | 21 +++++++++++++
 .../dml2/dml21/src/dml2_top/dml2_top_soc15.c  |  8 -----
 7 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
index 1e56d995cd0e7..930e86cdb88a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
@@ -232,7 +232,6 @@ void dml21_program_dc_pipe(struct dml2_context *dml_ctx, struct dc_state *contex
 		context->bw_ctx.bw.dcn.clk.dppclk_khz = pipe_ctx->plane_res.bw.dppclk_khz;
 
 	dml21_populate_mall_allocation_size(context, dml_ctx, pln_prog, pipe_ctx);
-	memcpy(&context->bw_ctx.bw.dcn.mcache_allocations[pipe_ctx->pipe_idx], &pln_prog->mcache_allocation, sizeof(struct dml2_mcache_surface_allocation));
 
 	bool sub_vp_enabled = is_sub_vp_enabled(pipe_ctx->stream->ctx->dc, context);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index d6fd13f43c08f..5d16f36ec95c8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -129,6 +129,7 @@ static void dml21_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_sta
 	struct pipe_ctx *dc_main_pipes[__DML2_WRAPPER_MAX_STREAMS_PLANES__];
 	struct pipe_ctx *dc_phantom_pipes[__DML2_WRAPPER_MAX_STREAMS_PLANES__] = {0};
 	int num_pipes;
+	unsigned int dml_phantom_prog_idx;
 
 	context->bw_ctx.bw.dcn.clk.dppclk_khz = 0;
 
@@ -142,6 +143,9 @@ static void dml21_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_sta
 	context->bw_ctx.bw.dcn.mall_ss_psr_active_size_bytes = 0;
 	context->bw_ctx.bw.dcn.mall_subvp_size_bytes = 0;
 
+	/* phantom's start after main planes */
+	dml_phantom_prog_idx = in_ctx->v21.mode_programming.programming->display_config.num_planes;
+
 	for (dml_prog_idx = 0; dml_prog_idx < DML2_MAX_PLANES; dml_prog_idx++) {
 		pln_prog = &in_ctx->v21.mode_programming.programming->plane_programming[dml_prog_idx];
 
@@ -167,6 +171,16 @@ static void dml21_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_sta
 				dml21_program_dc_pipe(in_ctx, context, dc_phantom_pipes[dc_pipe_index], pln_prog, stream_prog);
 			}
 		}
+
+		/* copy per plane mcache allocation */
+		memcpy(&context->bw_ctx.bw.dcn.mcache_allocations[dml_prog_idx], &pln_prog->mcache_allocation, sizeof(struct dml2_mcache_surface_allocation));
+		if (pln_prog->phantom_plane.valid) {
+			memcpy(&context->bw_ctx.bw.dcn.mcache_allocations[dml_phantom_prog_idx],
+					&pln_prog->phantom_plane.mcache_allocation,
+					sizeof(struct dml2_mcache_surface_allocation));
+
+			dml_phantom_prog_idx++;
+		}
 	}
 
 	/* assign global clocks */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
index d2d053f2354d0..0ab19cf4d2421 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
@@ -245,6 +245,7 @@ struct dml2_per_plane_programming {
 	struct {
 		bool valid;
 		struct dml2_plane_parameters descriptor;
+		struct dml2_mcache_surface_allocation mcache_allocation;
 		struct dml2_dchub_per_pipe_register_set *pipe_regs[DML2_MAX_PLANES];
 	} phantom_plane;
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index 7216d25c783e6..44d2969a904ea 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -253,7 +253,8 @@ static void expand_implict_subvp(const struct display_configuation_with_meta *di
 static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_instance *core, const struct display_configuation_with_meta *display_cfg,
 	const struct dml2_display_cfg *svp_expanded_display_cfg, struct dml2_display_cfg_programming *programming, struct dml2_core_scratch *scratch)
 {
-	unsigned int stream_index, plane_index, pipe_offset, stream_already_populated_mask, main_plane_index;
+	unsigned int stream_index, plane_index, pipe_offset, stream_already_populated_mask, main_plane_index, mcache_index;
+	unsigned int total_main_mcaches_required = 0;
 	int total_pipe_regs_copied = 0;
 	int dml_internal_pipe_index = 0;
 	const struct dml2_plane_parameters *main_plane;
@@ -324,6 +325,13 @@ static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_in
 
 		dml2_core_calcs_get_mall_allocation(&core->clean_me_up.mode_lib, &programming->plane_programming[plane_index].surface_size_mall_bytes, dml_internal_pipe_index);
 
+		memcpy(&programming->plane_programming[plane_index].mcache_allocation,
+				&display_cfg->stage2.mcache_allocations[plane_index],
+				sizeof(struct dml2_mcache_surface_allocation));
+		total_main_mcaches_required += programming->plane_programming[plane_index].mcache_allocation.num_mcaches_plane0 +
+				programming->plane_programming[plane_index].mcache_allocation.num_mcaches_plane1 -
+				(programming->plane_programming[plane_index].mcache_allocation.last_slice_sharing.plane0_plane1 ? 1 : 0);
+
 		for (pipe_offset = 0; pipe_offset < programming->plane_programming[plane_index].num_dpps_required; pipe_offset++) {
 			// Assign storage for this pipe's register values
 			programming->plane_programming[plane_index].pipe_regs[pipe_offset] = &programming->pipe_regs[total_pipe_regs_copied];
@@ -362,6 +370,22 @@ static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_in
 		memcpy(&programming->plane_programming[main_plane_index].phantom_plane.descriptor, phantom_plane, sizeof(struct dml2_plane_parameters));
 
 		dml2_core_calcs_get_mall_allocation(&core->clean_me_up.mode_lib, &programming->plane_programming[main_plane_index].svp_size_mall_bytes, dml_internal_pipe_index);
+
+		/* generate mcache allocation, phantoms use identical mcache configuration, but in the MALL set and unique mcache ID's beginning after all main ID's */
+		memcpy(&programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation,
+				&programming->plane_programming[main_plane_index].mcache_allocation,
+				sizeof(struct dml2_mcache_surface_allocation));
+		for (mcache_index = 0; mcache_index < programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.num_mcaches_plane0; mcache_index++) {
+			programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.global_mcache_ids_plane0[mcache_index] += total_main_mcaches_required;
+			programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.global_mcache_ids_mall_plane0[mcache_index] =
+					programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.global_mcache_ids_plane0[mcache_index];
+		}
+		for (mcache_index = 0; mcache_index < programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.num_mcaches_plane1; mcache_index++) {
+			programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.global_mcache_ids_plane1[mcache_index] += total_main_mcaches_required;
+			programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.global_mcache_ids_mall_plane1[mcache_index] =
+					programming->plane_programming[main_plane_index].phantom_plane.mcache_allocation.global_mcache_ids_plane1[mcache_index];
+		}
+
 		for (pipe_offset = 0; pipe_offset < programming->plane_programming[main_plane_index].num_dpps_required; pipe_offset++) {
 			// Assign storage for this pipe's register values
 			programming->plane_programming[main_plane_index].phantom_plane.pipe_regs[pipe_offset] = &programming->pipe_regs[total_pipe_regs_copied];
@@ -571,6 +595,10 @@ bool core_dcn4_mode_programming(struct dml2_core_mode_programming_in_out *in_out
 
 				dml2_core_calcs_get_mall_allocation(&core->clean_me_up.mode_lib, &in_out->programming->plane_programming[plane_index].surface_size_mall_bytes, dml_internal_pipe_index);
 
+				memcpy(&in_out->programming->plane_programming[plane_index].mcache_allocation,
+						&in_out->display_cfg->stage2.mcache_allocations[plane_index],
+						sizeof(struct dml2_mcache_surface_allocation));
+
 				for (pipe_offset = 0; pipe_offset < in_out->programming->plane_programming[plane_index].num_dpps_required; pipe_offset++) {
 					in_out->programming->plane_programming[plane_index].plane_descriptor = &in_out->programming->display_config.plane_descriptors[plane_index];
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index c1ff869512f27..8ad7704b76691 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -2638,6 +2638,9 @@ static void calculate_mcache_setting(
 	// Luma/Chroma combine in the last mcache
 	// In the case of Luma/Chroma combine-mCache (with lc_comb_mcache==1), all mCaches except the last segment are filled as much as possible, when stay aligned to mvmpg boundary
 	if (*p->lc_comb_mcache && l->is_dual_plane) {
+		/* if luma and chroma planes share an mcache, increase total chroma mcache count */
+		*p->num_mcaches_c = *p->num_mcaches_c + 1;
+
 		for (n = 0; n < *p->num_mcaches_l - 1; n++)
 			p->mcache_offsets_l[n] = (n + 1) * l->mvmpg_per_mcache_lb_l * l->mvmpg_access_width_l;
 		p->mcache_offsets_l[*p->num_mcaches_l - 1] = l->full_vp_access_width_l;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index a3324f7b9ba68..15c906c42ec45 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -1082,12 +1082,21 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 	const struct dml2_fams2_meta *stream_fams2_meta;
 	unsigned int microschedule_vlines;
 	unsigned int i;
+	unsigned int mcaches_per_plane;
+	unsigned int total_mcaches_required = 0;
 
 	unsigned int num_planes_per_stream[DML2_MAX_PLANES] = { 0 };
 
 	/* confirm timing it is not a centered timing */
 	for (i = 0; i < display_config->display_config.num_planes; i++) {
 		plane_descriptor = &display_config->display_config.plane_descriptors[i];
+		mcaches_per_plane = 0;
+
+		if (plane_descriptor->surface.dcc.enable) {
+			mcaches_per_plane += display_config->stage2.mcache_allocations[i].num_mcaches_plane0 +
+					display_config->stage2.mcache_allocations[i].num_mcaches_plane1 -
+					(display_config->stage2.mcache_allocations[i].last_slice_sharing.plane0_plane1 ? 1 : 0);
+		}
 
 		if (is_bit_set_in_bitfield(mask, (unsigned char)plane_descriptor->stream_index)) {
 			num_planes_per_stream[plane_descriptor->stream_index]++;
@@ -1098,7 +1107,19 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 					plane_descriptor->composition.rotation_angle != dml2_rotation_0) {
 				return false;
 			}
+
+			/* phantom requires same number of mcaches as main */
+			if (plane_descriptor->surface.dcc.enable) {
+				mcaches_per_plane *= 2;
+			}
 		}
+
+		total_mcaches_required += mcaches_per_plane;
+	}
+
+	if (total_mcaches_required > pmo->soc_bb->num_dcc_mcaches) {
+		/* too many mcaches required */
+		return false;
 	}
 
 	for (i = 0; i < DML2_MAX_PLANES; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
index a8f58f8448e42..dc2ce5e77f579 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
@@ -831,7 +831,6 @@ static bool dml2_top_soc15_build_mode_programming(struct dml2_build_mode_program
 	bool uclk_pstate_success = false;
 	bool vmin_success = false;
 	bool stutter_success = false;
-	unsigned int i;
 
 	memset(l, 0, sizeof(struct dml2_build_mode_programming_locals));
 	memset(in_out->programming, 0, sizeof(struct dml2_display_cfg_programming));
@@ -976,13 +975,6 @@ static bool dml2_top_soc15_build_mode_programming(struct dml2_build_mode_program
 		l->base_display_config_with_meta.stage5.success = true;
 	}
 
-	/*
-	* Populate mcache programming
-	*/
-	for (i = 0; i < in_out->display_config->num_planes; i++) {
-		in_out->programming->plane_programming[i].mcache_allocation = l->base_display_config_with_meta.stage2.mcache_allocations[i];
-	}
-
 	/*
 	* Call DPMM to map all requirements to minimum clock state
 	*/
-- 
2.39.5

