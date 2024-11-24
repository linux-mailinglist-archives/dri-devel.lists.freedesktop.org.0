Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614EC9D70AF
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD48810E4ED;
	Sun, 24 Nov 2024 13:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T6LqQG59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7C10E4EC;
 Sun, 24 Nov 2024 13:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA8645C5628;
 Sun, 24 Nov 2024 13:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA4DC4CECC;
 Sun, 24 Nov 2024 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455467;
 bh=oddvh8vUISydeyfq5mfog7VYlX2ELwy6ZEqEGG+WSTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T6LqQG594rggJg616z+AprVS0oBKvhuQUhFN/lve14UN3BEZBXSKHZPbjsKcjKxXa
 UEyV0m0Jc9Bcctsnlele7Wx1CfCE7goryR4oQvI8wV34RP8B55190jaiKbom8a+uFW
 wp72lA5GnKCuNvVigpIbPTw2jnG0EtQ6TpJvFyN0s41dtGW4mz+zRZA4yktGo6fAW4
 bxwGZyUc93waRJ2TvFFMt5F19EuA0mFeqhpu8F2okLKJGEO4x14E931U2IZvtcpvyI
 ts3z2/ZNVoWQCGHjYq9jiGa+zGpqh515XwO9kMj5uvENaFkzPAhh4vL5lwQtpaSH7i
 0p5g27ASuvzqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ausef Yousof <Ausef.Yousof@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, nicholas.kazlauskas@amd.com, Charlene.Liu@amd.com,
 chiahsuan.chung@amd.com, hamza.mahfooz@amd.com, Nicholas.Susanto@amd.com,
 sungjoon.kim@amd.com, roman.li@amd.com, zhongwei.zhang@amd.com,
 michael.strauss@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 080/107] drm/amd/display: Remove hw w/a toggle if
 on DP2/HPO
Date: Sun, 24 Nov 2024 08:29:40 -0500
Message-ID: <20241124133301.3341829-80-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Ausef Yousof <Ausef.Yousof@amd.com>

[ Upstream commit b4c804628485af2b46f0d24a87190735cac37d61 ]

[why&how]
Applying a hw w/a only relevant to DIG FIFO causing corruption
using HPO, do not apply the w/a if on DP2/HPO

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Ausef Yousof <Ausef.Yousof@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index 7d68006137a97..3bd0d46c17010 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -132,6 +132,8 @@ static void dcn35_disable_otg_wa(struct clk_mgr *clk_mgr_base, struct dc_state *
 	for (i = 0; i < dc->res_pool->pipe_count; ++i) {
 		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 		struct pipe_ctx *new_pipe = &context->res_ctx.pipe_ctx[i];
+		struct clk_mgr_internal *clk_mgr_internal = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+		struct dccg *dccg = clk_mgr_internal->dccg;
 		struct pipe_ctx *pipe = safe_to_lower
 			? &context->res_ctx.pipe_ctx[i]
 			: &dc->current_state->res_ctx.pipe_ctx[i];
@@ -148,8 +150,13 @@ static void dcn35_disable_otg_wa(struct clk_mgr *clk_mgr_base, struct dc_state *
 		new_pipe->stream_res.stream_enc &&
 		new_pipe->stream_res.stream_enc->funcs->is_fifo_enabled &&
 		new_pipe->stream_res.stream_enc->funcs->is_fifo_enabled(new_pipe->stream_res.stream_enc);
-		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal) ||
-			!pipe->stream->link_enc) && !stream_changed_otg_dig_on) {
+		bool has_active_hpo = dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(old_pipe) && dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(new_pipe);
+
+		if (!has_active_hpo && !dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe) &&
+					(pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal) ||
+					!pipe->stream->link_enc) && !stream_changed_otg_dig_on)) {
+
+
 			/* This w/a should not trigger when we have a dig active */
 			if (disable) {
 				if (pipe->stream_res.tg && pipe->stream_res.tg->funcs->immediate_disable_crtc)
-- 
2.43.0

