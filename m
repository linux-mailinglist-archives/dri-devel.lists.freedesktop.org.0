Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC493E624
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C1210E218;
	Sun, 28 Jul 2024 15:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="shxTCcdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8390710E218;
 Sun, 28 Jul 2024 15:44:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 926C9CE0917;
 Sun, 28 Jul 2024 15:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC2FC116B1;
 Sun, 28 Jul 2024 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181461;
 bh=NgpgxZfX4L2VcwkwLqo2bXEX+0W9YXM5a+jN9CcA/k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=shxTCcdrtghWMvEVvAqI3JKG+J0D9Tc0uSxmx/+8YW064KBMamZjCRnMJ8TcbhpcK
 CIH/5dbrZHUXgimN07sbUeOhI2x39gCORfwBoXMx1VbMV0j0WB9/aXcLpfeB5BQYXD
 HtDyW/EKL8HB9s4h0BLPs42NrV6u9lRCmh5TnhQMYtlVrty0xn3Nokqbw/RqnKdVO4
 7vWyYylKPU7JQl3wNCXmBZWI8nJehgEst9kepnRWmEBmuMXmQ0HrzRLy9CKsDSp/Jc
 nqWr92HaAeuHgdk2yHP26yPqMpltTb2vLbwZm/lZGBp8bVbXvt88j/QK8ipBReGiU9
 msy4OvqkmHCpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wenjing Liu <wenjing.liu@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jun.lei@amd.com, hamza.mahfooz@amd.com,
 chiahsuan.chung@amd.com, alvin.lee2@amd.com, george.shen@amd.com,
 alex.hung@amd.com, charlene.liu@amd.com, mario.limonciello@amd.com,
 allen.pan@amd.com, chaitanya.dhere@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 18/34] drm/amd/display: reduce ODM slice count to
 initial new dc state only when needed
Date: Sun, 28 Jul 2024 11:40:42 -0400
Message-ID: <20240728154230.2046786-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Wenjing Liu <wenjing.liu@amd.com>

[ Upstream commit 9a29c4adb0997be6ba3dd92dfba14ea75a8c6ce4 ]

[why]
We need to decrease ODM slice when adding or removing planes because MPO
support takes precedence over dynamic ODM combine. However there is a case where
we remove ODM combine even for ODM combine required timing in the initial new
dc state. This is normally okay because ODM will be added back after we pass DML
bandwidth validation. However since we remove ODM combine in the initial new
state, the previous ODM pipe allocation is lost. This may cause the new plane to
take away the original secondary OPP head pipe that is still required in the new
state.

For a timing that requires ODM 2:1 but optimized with ODM 4:1, if we add an MPO
plane, we will not have enough pipe to preserve ODM 4:1. In this case we should
reduce ODM slice count then try to add the MPO plane again. By reducing, we are
gradually remove 1 ODM slice from right most side one at a time until we have
enough free pipes for the new plane. If we remove ODM combine entirely, we could
use the pipe at ODM slice index 1 as a DPP pipe for the new plane. But ODM slice
1 is still needed as the timing requires ODM 2:1. This transition is not
seamless and user will see corruption on the screen.

[how]
Remove single ODM slice one at time until we have enough pipes for a new plane.
Remove previous logic to always remove ODM combine entirely.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 45 +++++++------
 .../gpu/drm/amd/display/dc/core/dc_state.c    | 67 +++++++++++++------
 2 files changed, 71 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 15819416a2f36..a2ca66a268c2d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2508,6 +2508,17 @@ static void remove_hpo_dp_link_enc_from_ctx(struct resource_context *res_ctx,
 	}
 }
 
+static int get_num_of_free_pipes(const struct resource_pool *pool, const struct dc_state *context)
+{
+	int i;
+	int count = 0;
+
+	for (i = 0; i < pool->pipe_count; i++)
+		if (resource_is_pipe_type(&context->res_ctx.pipe_ctx[i], FREE_PIPE))
+			count++;
+	return count;
+}
+
 enum dc_status resource_add_otg_master_for_stream_output(struct dc_state *new_ctx,
 		const struct resource_pool *pool,
 		struct dc_stream_state *stream)
@@ -2641,37 +2652,33 @@ static bool acquire_secondary_dpp_pipes_and_add_plane(
 		struct dc_state *cur_ctx,
 		struct resource_pool *pool)
 {
-	struct pipe_ctx *opp_head_pipe, *sec_pipe, *tail_pipe;
+	struct pipe_ctx *sec_pipe, *tail_pipe;
+	struct pipe_ctx *opp_heads[MAX_PIPES];
+	int opp_head_count;
+	int i;
 
 	if (!pool->funcs->acquire_free_pipe_as_secondary_dpp_pipe) {
 		ASSERT(0);
 		return false;
 	}
 
-	opp_head_pipe = otg_master_pipe;
-	while (opp_head_pipe) {
+	opp_head_count = resource_get_opp_heads_for_otg_master(otg_master_pipe,
+			&new_ctx->res_ctx, opp_heads);
+	if (get_num_of_free_pipes(pool, new_ctx) < opp_head_count)
+		/* not enough free pipes */
+		return false;
+
+	for (i = 0; i < opp_head_count; i++) {
 		sec_pipe = pool->funcs->acquire_free_pipe_as_secondary_dpp_pipe(
 				cur_ctx,
 				new_ctx,
 				pool,
-				opp_head_pipe);
-		if (!sec_pipe) {
-			/* try tearing down MPCC combine */
-			int pipe_idx = acquire_first_split_pipe(
-					&new_ctx->res_ctx, pool,
-					otg_master_pipe->stream);
-
-			if (pipe_idx >= 0)
-				sec_pipe = &new_ctx->res_ctx.pipe_ctx[pipe_idx];
-		}
-
-		if (!sec_pipe)
-			return false;
-
+				opp_heads[i]);
+		ASSERT(sec_pipe);
 		sec_pipe->plane_state = plane_state;
 
 		/* establish pipe relationship */
-		tail_pipe = get_tail_pipe(opp_head_pipe);
+		tail_pipe = get_tail_pipe(opp_heads[i]);
 		tail_pipe->bottom_pipe = sec_pipe;
 		sec_pipe->top_pipe = tail_pipe;
 		sec_pipe->bottom_pipe = NULL;
@@ -2682,8 +2689,6 @@ static bool acquire_secondary_dpp_pipes_and_add_plane(
 		} else {
 			sec_pipe->prev_odm_pipe = NULL;
 		}
-
-		opp_head_pipe = opp_head_pipe->next_odm_pipe;
 	}
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 76bb05f4d6bf3..52a1cfc5feed8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -437,6 +437,19 @@ enum dc_status dc_state_remove_stream(
 	return DC_OK;
 }
 
+static void remove_mpc_combine_for_stream(const struct dc *dc,
+		struct dc_state *new_ctx,
+		const struct dc_state *cur_ctx,
+		struct dc_stream_status *status)
+{
+	int i;
+
+	for (i = 0; i < status->plane_count; i++)
+		resource_update_pipes_for_plane_with_slice_count(
+				new_ctx, cur_ctx, dc->res_pool,
+				status->plane_states[i], 1);
+}
+
 bool dc_state_add_plane(
 		const struct dc *dc,
 		struct dc_stream_state *stream,
@@ -447,8 +460,12 @@ bool dc_state_add_plane(
 	struct pipe_ctx *otg_master_pipe;
 	struct dc_stream_status *stream_status = NULL;
 	bool added = false;
+	int odm_slice_count;
+	int i;
 
 	stream_status = dc_state_get_stream_status(state, stream);
+	otg_master_pipe = resource_get_otg_master_for_stream(
+			&state->res_ctx, stream);
 	if (stream_status == NULL) {
 		dm_error("Existing stream not found; failed to attach surface!\n");
 		goto out;
@@ -456,22 +473,39 @@ bool dc_state_add_plane(
 		dm_error("Surface: can not attach plane_state %p! Maximum is: %d\n",
 				plane_state, MAX_SURFACE_NUM);
 		goto out;
+	} else if (!otg_master_pipe) {
+		goto out;
 	}
 
-	if (stream_status->plane_count == 0 && dc->config.enable_windowed_mpo_odm)
-		/* ODM combine could prevent us from supporting more planes
-		 * we will reset ODM slice count back to 1 when all planes have
-		 * been removed to maximize the amount of planes supported when
-		 * new planes are added.
-		 */
-		resource_update_pipes_for_stream_with_slice_count(
-				state, dc->current_state, dc->res_pool, stream, 1);
+	added = resource_append_dpp_pipes_for_plane_composition(state,
+			dc->current_state, pool, otg_master_pipe, plane_state);
 
-	otg_master_pipe = resource_get_otg_master_for_stream(
-			&state->res_ctx, stream);
-	if (otg_master_pipe)
+	if (!added) {
+		/* try to remove MPC combine to free up pipes */
+		for (i = 0; i < state->stream_count; i++)
+			remove_mpc_combine_for_stream(dc, state,
+					dc->current_state,
+					&state->stream_status[i]);
 		added = resource_append_dpp_pipes_for_plane_composition(state,
-				dc->current_state, pool, otg_master_pipe, plane_state);
+					dc->current_state, pool,
+					otg_master_pipe, plane_state);
+	}
+
+	if (!added) {
+		/* try to decrease ODM slice count gradually to free up pipes */
+		odm_slice_count = resource_get_odm_slice_count(otg_master_pipe);
+		for (i = odm_slice_count - 1; i > 0; i--) {
+			resource_update_pipes_for_stream_with_slice_count(state,
+					dc->current_state, dc->res_pool, stream,
+					i);
+			added = resource_append_dpp_pipes_for_plane_composition(
+					state,
+					dc->current_state, pool,
+					otg_master_pipe, plane_state);
+			if (added)
+				break;
+		}
+	}
 
 	if (added) {
 		stream_status->plane_states[stream_status->plane_count] =
@@ -531,15 +565,6 @@ bool dc_state_remove_plane(
 
 	stream_status->plane_states[stream_status->plane_count] = NULL;
 
-	if (stream_status->plane_count == 0 && dc->config.enable_windowed_mpo_odm)
-		/* ODM combine could prevent us from supporting more planes
-		 * we will reset ODM slice count back to 1 when all planes have
-		 * been removed to maximize the amount of planes supported when
-		 * new planes are added.
-		 */
-		resource_update_pipes_for_stream_with_slice_count(
-				state, dc->current_state, dc->res_pool, stream, 1);
-
 	return true;
 }
 
-- 
2.43.0

