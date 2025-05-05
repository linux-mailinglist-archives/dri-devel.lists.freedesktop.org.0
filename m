Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9630AAA059
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C46A10E4D5;
	Mon,  5 May 2025 22:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bSKMR9W/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9481310E4D4;
 Mon,  5 May 2025 22:33:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0B0B3A4CE36;
 Mon,  5 May 2025 22:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DCDC4CEED;
 Mon,  5 May 2025 22:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484435;
 bh=DZquRH23F/Ra237EA9z93bi6PKncT+I3G3FByGgCClA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bSKMR9W/2WsyR6fAL7U6B7ebrbhG+j6sz+VgHe6pH880M29wJv6ZXIAEbq6X7VOdo
 P5fyznHubODHI4hicmXE9ll8C2sb4/BEkb3a5p7N/CKEihs3yZjvBTl0iJUV6V0ONd
 4QvjP+iHU/BkVlBCgXr9tv8eB7PD1EOVMlsLLHhgHGbJ90UPKxwXmsIUNpC39u6xkb
 BH/zPG8LjAPUL4UbRC5T0yqyFyMPrdOOat4RCnxM6JlM1DE6AzijACsjhFHte4/NkP
 Ai950XtNypqgRmNvO0BaNeoMDLx68fdoXaVUYbvBhCKmsDjBG4MCk7M6Yj4eRV6miK
 SC9xlQ3URSGJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peterson Guo <peterson.guo@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com,
 zaeem.mohamed@amd.com, wenjing.liu@amd.com, rodrigo.siqueira@amd.com,
 Samson.Tam@amd.com, PeiChen.Huang@amd.com, chris.park@amd.com,
 Yihan.Zhu@amd.com, nicholas.kazlauskas@amd.com, dillon.varone@amd.com,
 Ovidiu.Bunea@amd.com, joshua.aberback@amd.com, Wayne.Lin@amd.com,
 chiahsuan.chung@amd.com, mwen@igalia.com, tjakobi@math.uni-bielefeld.de,
 zhikai.zhai@amd.com, ivlipski@amd.com, nevenko.stupar@amd.com,
 sarvinde@amd.com, rostrows@amd.com, Austin.Zheng@amd.com,
 karthi.kandasamy@amd.com, relja.vojvodic@amd.com, michael.strauss@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 476/642] drm/amd/display: Reverse the visual
 confirm recouts
Date: Mon,  5 May 2025 18:11:32 -0400
Message-Id: <20250505221419.2672473-476-sashal@kernel.org>
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

From: Peterson Guo <peterson.guo@amd.com>

[ Upstream commit 3c50bf2196aaddcaffe2c7a1a7080470380cbfdd ]

[WHY]
When checking if a pipe can disable cursor to prevent duplicate cursors,
having visual confirm on will prevent disabling cursors on planes which
cover the bottom of the screen.

[HOW]
When checking if a plane can disable visual confirm, the pipe first
reverses these calculations before doing the checks.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Peterson Guo <peterson.guo@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 67 +++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 50 +-------------
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 48 +------------
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 48 +------------
 drivers/gpu/drm/amd/display/dc/inc/resource.h |  2 +
 5 files changed, 73 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 3367030da3414..375b3b1d1d182 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -941,6 +941,17 @@ static void calculate_adjust_recout_for_visual_confirm(struct pipe_ctx *pipe_ctx
 		*base_offset = VISUAL_CONFIRM_BASE_DEFAULT;
 }
 
+static void reverse_adjust_recout_for_visual_confirm(struct rect *recout,
+		struct pipe_ctx *pipe_ctx)
+{
+	int dpp_offset, base_offset;
+
+	calculate_adjust_recout_for_visual_confirm(pipe_ctx, &base_offset,
+		&dpp_offset);
+	recout->height += base_offset;
+	recout->height += dpp_offset;
+}
+
 static void adjust_recout_for_visual_confirm(struct rect *recout,
 		struct pipe_ctx *pipe_ctx)
 {
@@ -1642,6 +1653,62 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 	return res;
 }
 
+bool resource_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
+{
+	struct pipe_ctx *test_pipe, *split_pipe;
+	struct rect r1 = pipe_ctx->plane_res.scl_data.recout;
+	int r1_right, r1_bottom;
+	int cur_layer = pipe_ctx->plane_state->layer_index;
+
+	reverse_adjust_recout_for_visual_confirm(&r1, pipe_ctx);
+	r1_right = r1.x + r1.width;
+	r1_bottom = r1.y + r1.height;
+
+	/**
+	 * Disable the cursor if there's another pipe above this with a
+	 * plane that contains this pipe's viewport to prevent double cursor
+	 * and incorrect scaling artifacts.
+	 */
+	for (test_pipe = pipe_ctx->top_pipe; test_pipe;
+	     test_pipe = test_pipe->top_pipe) {
+		struct rect r2;
+		int r2_right, r2_bottom;
+		// Skip invisible layer and pipe-split plane on same layer
+		if (!test_pipe->plane_state ||
+		    !test_pipe->plane_state->visible ||
+		    test_pipe->plane_state->layer_index == cur_layer)
+			continue;
+
+		r2 = test_pipe->plane_res.scl_data.recout;
+		reverse_adjust_recout_for_visual_confirm(&r2, test_pipe);
+		r2_right = r2.x + r2.width;
+		r2_bottom = r2.y + r2.height;
+
+		/**
+		 * There is another half plane on same layer because of
+		 * pipe-split, merge together per same height.
+		 */
+		for (split_pipe = pipe_ctx->top_pipe; split_pipe;
+		     split_pipe = split_pipe->top_pipe)
+			if (split_pipe->plane_state->layer_index == test_pipe->plane_state->layer_index) {
+				struct rect r2_half;
+
+				r2_half = split_pipe->plane_res.scl_data.recout;
+				reverse_adjust_recout_for_visual_confirm(&r2_half, split_pipe);
+				r2.x = min(r2_half.x, r2.x);
+				r2.width = r2.width + r2_half.width;
+				r2_right = r2.x + r2.width;
+				r2_bottom = min(r2_bottom, r2_half.y + r2_half.height);
+				break;
+			}
+
+		if (r1.x >= r2.x && r1.y >= r2.y && r1_right <= r2_right && r1_bottom <= r2_bottom)
+			return true;
+	}
+
+	return false;
+}
+
 
 enum dc_status resource_build_scaling_params_for_context(
 	const struct dc  *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 44ff9abe2880f..87b4c2793df3c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -991,57 +991,11 @@ void dc_dmub_srv_log_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv)
 	DC_LOG_DEBUG("    is_cw6_en          : %d", diag_data.is_cw6_enabled);
 }
 
-static bool dc_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
-{
-	struct pipe_ctx *test_pipe, *split_pipe;
-	const struct scaler_data *scl_data = &pipe_ctx->plane_res.scl_data;
-	struct rect r1 = scl_data->recout, r2, r2_half;
-	int r1_r = r1.x + r1.width, r1_b = r1.y + r1.height, r2_r, r2_b;
-	int cur_layer = pipe_ctx->plane_state->layer_index;
-
-	/**
-	 * Disable the cursor if there's another pipe above this with a
-	 * plane that contains this pipe's viewport to prevent double cursor
-	 * and incorrect scaling artifacts.
-	 */
-	for (test_pipe = pipe_ctx->top_pipe; test_pipe;
-	     test_pipe = test_pipe->top_pipe) {
-		// Skip invisible layer and pipe-split plane on same layer
-		if (!test_pipe->plane_state->visible || test_pipe->plane_state->layer_index == cur_layer)
-			continue;
-
-		r2 = test_pipe->plane_res.scl_data.recout;
-		r2_r = r2.x + r2.width;
-		r2_b = r2.y + r2.height;
-
-		/**
-		 * There is another half plane on same layer because of
-		 * pipe-split, merge together per same height.
-		 */
-		for (split_pipe = pipe_ctx->top_pipe; split_pipe;
-		     split_pipe = split_pipe->top_pipe)
-			if (split_pipe->plane_state->layer_index == test_pipe->plane_state->layer_index) {
-				r2_half = split_pipe->plane_res.scl_data.recout;
-				r2.x = (r2_half.x < r2.x) ? r2_half.x : r2.x;
-				r2.width = r2.width + r2_half.width;
-				r2_r = r2.x + r2.width;
-				break;
-			}
-
-		if (r1.x >= r2.x && r1.y >= r2.y && r1_r <= r2_r && r1_b <= r2_b)
-			return true;
-	}
-
-	return false;
-}
-
 static bool dc_dmub_should_update_cursor_data(struct pipe_ctx *pipe_ctx)
 {
 	if (pipe_ctx->plane_state != NULL) {
-		if (pipe_ctx->plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
-			return false;
-
-		if (dc_can_pipe_disable_cursor(pipe_ctx))
+		if (pipe_ctx->plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE ||
+			resource_can_pipe_disable_cursor(pipe_ctx))
 			return false;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 4c89bf6725b3b..bbeaefe1ef0db 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -3424,52 +3424,6 @@ void dcn10_update_dchub(struct dce_hwseq *hws, struct dchub_init_data *dh_data)
 	hubbub->funcs->update_dchub(hubbub, dh_data);
 }
 
-static bool dcn10_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
-{
-	struct pipe_ctx *test_pipe, *split_pipe;
-	const struct scaler_data *scl_data = &pipe_ctx->plane_res.scl_data;
-	struct rect r1 = scl_data->recout, r2, r2_half;
-	int r1_r = r1.x + r1.width, r1_b = r1.y + r1.height, r2_r, r2_b;
-	int cur_layer = pipe_ctx->plane_state->layer_index;
-
-	/**
-	 * Disable the cursor if there's another pipe above this with a
-	 * plane that contains this pipe's viewport to prevent double cursor
-	 * and incorrect scaling artifacts.
-	 */
-	for (test_pipe = pipe_ctx->top_pipe; test_pipe;
-	     test_pipe = test_pipe->top_pipe) {
-		// Skip invisible layer and pipe-split plane on same layer
-		if (!test_pipe->plane_state ||
-		    !test_pipe->plane_state->visible ||
-		    test_pipe->plane_state->layer_index == cur_layer)
-			continue;
-
-		r2 = test_pipe->plane_res.scl_data.recout;
-		r2_r = r2.x + r2.width;
-		r2_b = r2.y + r2.height;
-
-		/**
-		 * There is another half plane on same layer because of
-		 * pipe-split, merge together per same height.
-		 */
-		for (split_pipe = pipe_ctx->top_pipe; split_pipe;
-		     split_pipe = split_pipe->top_pipe)
-			if (split_pipe->plane_state->layer_index == test_pipe->plane_state->layer_index) {
-				r2_half = split_pipe->plane_res.scl_data.recout;
-				r2.x = (r2_half.x < r2.x) ? r2_half.x : r2.x;
-				r2.width = r2.width + r2_half.width;
-				r2_r = r2.x + r2.width;
-				break;
-			}
-
-		if (r1.x >= r2.x && r1.y >= r2.y && r1_r <= r2_r && r1_b <= r2_b)
-			return true;
-	}
-
-	return false;
-}
-
 void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
 {
 	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
@@ -3569,7 +3523,7 @@ void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
 			== PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
 		pos_cpy.enable = false;
 
-	if (pos_cpy.enable && dcn10_can_pipe_disable_cursor(pipe_ctx))
+	if (pos_cpy.enable && resource_can_pipe_disable_cursor(pipe_ctx))
 		pos_cpy.enable = false;
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 50e710b4ce651..47132e40aa2d2 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -972,52 +972,6 @@ void dcn401_setup_hpo_hw_control(const struct dce_hwseq *hws, bool enable)
 	REG_UPDATE(HPO_TOP_HW_CONTROL, HPO_IO_EN, enable);
 }
 
-static bool dcn401_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
-{
-	struct pipe_ctx *test_pipe, *split_pipe;
-	const struct scaler_data *scl_data = &pipe_ctx->plane_res.scl_data;
-	struct rect r1 = scl_data->recout, r2, r2_half;
-	int r1_r = r1.x + r1.width, r1_b = r1.y + r1.height, r2_r, r2_b;
-	int cur_layer = pipe_ctx->plane_state->layer_index;
-
-	/**
-	 * Disable the cursor if there's another pipe above this with a
-	 * plane that contains this pipe's viewport to prevent double cursor
-	 * and incorrect scaling artifacts.
-	 */
-	for (test_pipe = pipe_ctx->top_pipe; test_pipe;
-		test_pipe = test_pipe->top_pipe) {
-		// Skip invisible layer and pipe-split plane on same layer
-		if (!test_pipe->plane_state ||
-			!test_pipe->plane_state->visible ||
-			test_pipe->plane_state->layer_index == cur_layer)
-			continue;
-
-		r2 = test_pipe->plane_res.scl_data.recout;
-		r2_r = r2.x + r2.width;
-		r2_b = r2.y + r2.height;
-
-		/**
-		 * There is another half plane on same layer because of
-		 * pipe-split, merge together per same height.
-		 */
-		for (split_pipe = pipe_ctx->top_pipe; split_pipe;
-			split_pipe = split_pipe->top_pipe)
-			if (split_pipe->plane_state->layer_index == test_pipe->plane_state->layer_index) {
-				r2_half = split_pipe->plane_res.scl_data.recout;
-				r2.x = (r2_half.x < r2.x) ? r2_half.x : r2.x;
-				r2.width = r2.width + r2_half.width;
-				r2_r = r2.x + r2.width;
-				break;
-			}
-
-		if (r1.x >= r2.x && r1.y >= r2.y && r1_r <= r2_r && r1_b <= r2_b)
-			return true;
-	}
-
-	return false;
-}
-
 void adjust_hotspot_between_slices_for_2x_magnify(uint32_t cursor_width, struct dc_cursor_position *pos_cpy)
 {
 	if (cursor_width <= 128) {
@@ -1208,7 +1162,7 @@ void dcn401_set_cursor_position(struct pipe_ctx *pipe_ctx)
 	pos_cpy.x = (uint32_t)x_pos;
 	pos_cpy.y = (uint32_t)y_pos;
 
-	if (pos_cpy.enable && dcn401_can_pipe_disable_cursor(pipe_ctx))
+	if (pos_cpy.enable && resource_can_pipe_disable_cursor(pipe_ctx))
 		pos_cpy.enable = false;
 
 	x_pos = pos_cpy.x - param.recout.x;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index cd1157d225abe..b32d07ce0f087 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -152,6 +152,8 @@ bool resource_attach_surfaces_to_context(
 		struct dc_state *context,
 		const struct resource_pool *pool);
 
+bool resource_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx);
+
 #define FREE_PIPE_INDEX_NOT_FOUND -1
 
 /*
-- 
2.39.5

