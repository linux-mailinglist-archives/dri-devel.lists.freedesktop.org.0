Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE1288DDD2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ED210FAF2;
	Wed, 27 Mar 2024 12:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sYs/jSdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7642D10FAFF;
 Wed, 27 Mar 2024 12:11:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B827ACE25AC;
 Wed, 27 Mar 2024 12:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C8CC433C7;
 Wed, 27 Mar 2024 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541489;
 bh=GazfdXS/9CEX8H0nsRFjh900LQV+XJ9wWXg0rZuCEkg=;
 h=From:To:Cc:Subject:Date:From;
 b=sYs/jSdFZChfvwUvXO4a6Mhl0NMiItPoHqWYKkwkfVEK0195HzBoVkP0vV7ch16dF
 Gp9lxFds/i4wAGeGDG3XBS/ocIJjIB7MdEwOeOdVVRPWSQLecwtbtosB3f58V3y1vo
 RAVrEvn0GRVdRgaPzsQXbTOVQ7ptze7HcJStUpgKmAoOaARDVBCrNddtkyfK1hAsCX
 kfmwzcBKreaYn3/OsyeKppiA4G1LBrchapK37+AEGr7gCNisO3/XwWNUC4BfNoMTNT
 jgmc1R8EtYNijM6bLvSPoEqiSe7sQVsyiTerkj57dCS7ycDe22NysyEjPJXngvyRQq
 SQWppGgOvL0jg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	wenjing.liu@amd.com
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: set odm_combine_policy based on
 context in dcn32 resource" failed to apply to 6.6-stable tree
Date: Wed, 27 Mar 2024 08:11:26 -0400
Message-ID: <20240327121127.2828745-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 0a5fd7811a17af708cefdaab93af86838353002d Mon Sep 17 00:00:00 2001
From: Wenjing Liu <wenjing.liu@amd.com>
Date: Thu, 18 Jan 2024 18:12:15 -0500
Subject: [PATCH] drm/amd/display: set odm_combine_policy based on context in
 dcn32 resource

[why]
When populating dml pipes, odm combine policy should be assigned based
on the pipe topology of the context passed in. DML pipes could be
repopulated multiple times during single validate bandwidth attempt. We
need to make sure that whenever we repopulate the dml pipes it is always
aligned with the updated context. There is a case where DML pipes get
repopulated during FPO optimization after ODM combine policy is changed.
Since in the current code we reinitlaize ODM combine policy, even though
the current context has ODM combine enabled, we overwrite it despite the
pipes are already split. This causes DML to think that MPC combine is
used so we mistakenly enable MPC combine because we apply pipe split
with ODM combine policy reset. This issue doesn't impact non windowed
MPO with ODM case because the legacy policy has restricted use cases. We
don't encounter the case where both ODM and FPO optimizations are
enabled together. So we decide to leave it as is because it is about to
be replaced anyway.

Cc: stable@vger.kernel.org # 6.6+
Reviewed-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 15 ++++++++++----
 drivers/gpu/drm/amd/display/dc/inc/resource.h | 20 ++++++++-----------
 .../dc/resource/dcn32/dcn32_resource.c        | 16 ++++++++++++++-
 3 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index a7981a0c4158f..4edf7df4c6aad 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1289,7 +1289,7 @@ static bool update_pipes_with_split_flags(struct dc *dc, struct dc_state *contex
 	return updated;
 }
 
-static bool should_allow_odm_power_optimization(struct dc *dc,
+static bool should_apply_odm_power_optimization(struct dc *dc,
 		struct dc_state *context, struct vba_vars_st *v, int *split,
 		bool *merge)
 {
@@ -1393,9 +1393,12 @@ static void try_odm_power_optimization_and_revalidate(
 {
 	int i;
 	unsigned int new_vlevel;
+	unsigned int cur_policy[MAX_PIPES];
 
-	for (i = 0; i < pipe_cnt; i++)
+	for (i = 0; i < pipe_cnt; i++) {
+		cur_policy[i] = pipes[i].pipe.dest.odm_combine_policy;
 		pipes[i].pipe.dest.odm_combine_policy = dm_odm_combine_policy_2to1;
+	}
 
 	new_vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, pipe_cnt);
 
@@ -1404,6 +1407,9 @@ static void try_odm_power_optimization_and_revalidate(
 		memset(merge, 0, MAX_PIPES * sizeof(bool));
 		*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, new_vlevel, split, merge);
 		context->bw_ctx.dml.vba.VoltageLevel = *vlevel;
+	} else {
+		for (i = 0; i < pipe_cnt; i++)
+			pipes[i].pipe.dest.odm_combine_policy = cur_policy[i];
 	}
 }
 
@@ -1581,7 +1587,7 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
 		}
 	}
 
-	if (should_allow_odm_power_optimization(dc, context, vba, split, merge))
+	if (should_apply_odm_power_optimization(dc, context, vba, split, merge))
 		try_odm_power_optimization_and_revalidate(
 				dc, context, pipes, split, merge, vlevel, *pipe_cnt);
 
@@ -2210,7 +2216,8 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 		int i;
 
 		pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
-		dcn32_update_dml_pipes_odm_policy_based_on_context(dc, context, pipes);
+		if (!dc->config.enable_windowed_mpo_odm)
+			dcn32_update_dml_pipes_odm_policy_based_on_context(dc, context, pipes);
 
 		/* repopulate_pipes = 1 means the pipes were either split or merged. In this case
 		 * we have to re-calculate the DET allocation and run through DML once more to
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index 1d51fed12e200..2eae2f3e846d8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -427,22 +427,18 @@ struct pipe_ctx *resource_get_primary_dpp_pipe(const struct pipe_ctx *dpp_pipe);
 int resource_get_mpc_slice_index(const struct pipe_ctx *dpp_pipe);
 
 /*
- * Get number of MPC "cuts" of the plane associated with the pipe. MPC slice
- * count is equal to MPC splits + 1. For example if a plane is cut 3 times, it
- * will have 4 pieces of slice.
- * return - 0 if pipe is not used for a plane with MPCC combine. otherwise
- * the number of MPC "cuts" for the plane.
+ * Get the number of MPC slices associated with the pipe.
+ * The function returns 0 if the pipe is not associated with an MPC combine
+ * pipe topology.
  */
-int resource_get_mpc_slice_count(const struct pipe_ctx *opp_head);
+int resource_get_mpc_slice_count(const struct pipe_ctx *pipe);
 
 /*
- * Get number of ODM "cuts" of the timing associated with the pipe. ODM slice
- * count is equal to ODM splits + 1. For example if a timing is cut 3 times, it
- * will have 4 pieces of slice.
- * return - 0 if pipe is not used for ODM combine. otherwise
- * the number of ODM "cuts" for the timing.
+ * Get the number of ODM slices associated with the pipe.
+ * The function returns 0 if the pipe is not associated with an ODM combine
+ * pipe topology.
  */
-int resource_get_odm_slice_count(const struct pipe_ctx *otg_master);
+int resource_get_odm_slice_count(const struct pipe_ctx *pipe);
 
 /* Get the ODM slice index counting from 0 from left most slice */
 int resource_get_odm_slice_index(const struct pipe_ctx *opp_head);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index ac04a9c9a3d86..71cd20618bfe0 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1829,7 +1829,21 @@ int dcn32_populate_dml_pipes_from_context(
 		dcn32_zero_pipe_dcc_fraction(pipes, pipe_cnt);
 		DC_FP_END();
 		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
-		pipes[pipe_cnt].pipe.dest.odm_combine_policy = dm_odm_combine_policy_dal;
+		if (dc->config.enable_windowed_mpo_odm &&
+				dc->debug.enable_single_display_2to1_odm_policy) {
+			switch (resource_get_odm_slice_count(pipe)) {
+			case 2:
+				pipes[pipe_cnt].pipe.dest.odm_combine_policy = dm_odm_combine_policy_2to1;
+				break;
+			case 4:
+				pipes[pipe_cnt].pipe.dest.odm_combine_policy = dm_odm_combine_policy_4to1;
+				break;
+			default:
+				pipes[pipe_cnt].pipe.dest.odm_combine_policy = dm_odm_combine_policy_dal;
+			}
+		} else {
+			pipes[pipe_cnt].pipe.dest.odm_combine_policy = dm_odm_combine_policy_dal;
+		}
 		pipes[pipe_cnt].pipe.src.gpuvm_min_page_size_kbytes = 256; // according to spreadsheet
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 		pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth = dm_lb_19;
-- 
2.43.0




