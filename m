Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB31764FF95
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCD010E1D5;
	Sun, 18 Dec 2022 16:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D410E1D5;
 Sun, 18 Dec 2022 16:04:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FEACB80B4D;
 Sun, 18 Dec 2022 16:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CD6C433EF;
 Sun, 18 Dec 2022 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379446;
 bh=EZjwXYvx3KOeOXy/eNhBJp6KRhkMY+TyQaIDydyG8GM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ErNvxrbTY3wDSXnS4deeTwIM2WP3nX0tI40adg6XxQ54w8Hm2yNtBAPinMBVKvklG
 Gx0miWPANvzT4UviY02Alz+jdmG9cN3U0j4J0NzvxfL7uP3IZ+Bg3GFps5afoVpS/y
 nTz5yiSYwL4yPjjmbGm+1mEYP0qicIU7Ao2FDAVYdR6F4DmnPWc1HEkQX2/EJMzUCc
 zgOzsz0wHBJ4tHrxpet8QzFCncntx8eQ0+QwCINvLRnbYOQk73wECT19CDMmIiHVG6
 aKrUV66jx7JF/mxP60TvAwg4841lg7Nfq5AmEGBjLnrt6I51nb2mewt22ydKuryiYT
 a0jijCHNLgUyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 36/85] drm/amd/display: Use min transition for
 SubVP into MPO
Date: Sun, 18 Dec 2022 11:00:53 -0500
Message-Id: <20221218160142.925394-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Sasha Levin <sashal@kernel.org>,
 Dillon.Varone@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Samson.Tam@amd.com, wenjing.liu@amd.com, meenakshikumar.somasundaram@amd.com,
 alex.hung@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <Alvin.Lee2@amd.com>

[ Upstream commit 9e7d03e8b046c84e1b2973a29cd800495a5a2f09 ]

[Description]
- For SubVP transitioning into MPO, we want to
  use a minimal transition to prevent transient
  underflow
- Transitioning a phantom pipe directly into a
  "real" pipe can result in underflow due to the
  HUBP still having it's "phantom" programming
  when HUBP is unblanked (have to wait for next
  VUPDATE of the new OTG)
- Also ensure subvp pipe lock is acquired early
  enough for programming in dc_commit_state_no_check
- When disabling phantom planes, enable phantom OTG
  first so the disable gets the double buffer update

Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 43 +++++++++++-------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 5c00907099c1..5260ad6de803 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1070,6 +1070,7 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 	int i, j;
 	struct dc_state *dangling_context = dc_create_state(dc);
 	struct dc_state *current_ctx;
+	struct pipe_ctx *pipe;
 
 	if (dangling_context == NULL)
 		return;
@@ -1112,6 +1113,16 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 		}
 
 		if (should_disable && old_stream) {
+			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+			/* When disabling plane for a phantom pipe, we must turn on the
+			 * phantom OTG so the disable programming gets the double buffer
+			 * update. Otherwise the pipe will be left in a partially disabled
+			 * state that can result in underflow or hang when enabling it
+			 * again for different use.
+			 */
+			if (old_stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
+			}
 			dc_rem_all_planes_for_stream(dc, old_stream, dangling_context);
 			disable_all_writeback_pipes_for_stream(dc, old_stream, dangling_context);
 
@@ -1760,6 +1771,12 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 		context->stream_count == 0)
 		dc->hwss.prepare_bandwidth(dc, context);
 
+	/* When SubVP is active, all HW programming must be done while
+	 * SubVP lock is acquired
+	 */
+	if (dc->hwss.subvp_pipe_control_lock)
+		dc->hwss.subvp_pipe_control_lock(dc, context, true, true, NULL, subvp_prev_use);
+
 	if (dc->debug.enable_double_buffered_dsc_pg_support)
 		dc->hwss.update_dsc_pg(dc, context, false);
 
@@ -1787,9 +1804,6 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 		dc->hwss.wait_for_mpcc_disconnect(dc, dc->res_pool, pipe);
 	}
 
-	if (dc->hwss.subvp_pipe_control_lock)
-		dc->hwss.subvp_pipe_control_lock(dc, context, true, true, NULL, subvp_prev_use);
-
 	result = dc->hwss.apply_ctx_to_hw(dc, context);
 
 	if (result != DC_OK) {
@@ -3576,7 +3590,6 @@ static bool could_mpcc_tree_change_for_active_pipes(struct dc *dc,
 
 	struct dc_stream_status *cur_stream_status = stream_get_status(dc->current_state, stream);
 	bool force_minimal_pipe_splitting = false;
-	uint32_t i;
 
 	*is_plane_addition = false;
 
@@ -3608,27 +3621,11 @@ static bool could_mpcc_tree_change_for_active_pipes(struct dc *dc,
 		}
 	}
 
-	/* For SubVP pipe split case when adding MPO video
-	 * we need to add a minimal transition. In this case
-	 * there will be 2 streams (1 main stream, 1 phantom
-	 * stream).
+	/* For SubVP when adding MPO video we need to add a minimal transition.
 	 */
-	if (cur_stream_status &&
-			dc->current_state->stream_count == 2 &&
-			stream->mall_stream_config.type == SUBVP_MAIN) {
-		bool is_pipe_split = false;
-
-		for (i = 0; i < dc->res_pool->pipe_count; i++) {
-			if (dc->current_state->res_ctx.pipe_ctx[i].stream == stream &&
-					(dc->current_state->res_ctx.pipe_ctx[i].bottom_pipe ||
-					dc->current_state->res_ctx.pipe_ctx[i].next_odm_pipe)) {
-				is_pipe_split = true;
-				break;
-			}
-		}
-
+	if (cur_stream_status && stream->mall_stream_config.type == SUBVP_MAIN) {
 		/* determine if minimal transition is required due to SubVP*/
-		if (surface_count > 0 && is_pipe_split) {
+		if (surface_count > 0) {
 			if (cur_stream_status->plane_count > surface_count) {
 				force_minimal_pipe_splitting = true;
 			} else if (cur_stream_status->plane_count < surface_count) {
-- 
2.35.1

