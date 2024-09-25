Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67BD9858A3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320BC10E816;
	Wed, 25 Sep 2024 11:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IrFtVreQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A5F10E810;
 Wed, 25 Sep 2024 11:45:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00B995C5846;
 Wed, 25 Sep 2024 11:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2603C4CEC3;
 Wed, 25 Sep 2024 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264734;
 bh=T/RYXTNcdf625+837vnX5Tx0RG5+gm65B1AM1KFfEYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IrFtVreQeZj+aBJCpSaIrpAmHIgmmQT+e9M4kXLh8XIC1yWy6k3fF5+gp1YS65l3y
 0sBHE9Rk2CeAQ8SXBN/g7eRZl4AKX3RBQe0ySZtGWPls+q2oR6mdACoF28rbbQ5YRH
 2VplvZZ0t3cp+aw41XboAIBdRJneONStM3swc0KkDgHPM6s0ODMxPPXM8AoiatqC8y
 Uhxngxv4VGUEaMY9y0Mr9Pfn275NxDpc8DXBPrn1a7zrOw1NoUNDQOC9Mwjus9IOSj
 nwmSlkzKazLcDiz5w0a5wmPRkBIeS50Ixea8q6MB5W8uxS6+dG83QZYewHoBm/BQqJ
 z5kmO+6QRc2Pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, alvin.lee2@amd.com, wayne.lin@amd.com,
 wenjing.liu@amd.com, george.shen@amd.com, dillon.varone@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 142/244] drm/amd/display: Add null check for
 pipe_ctx->plane_state in dcn20_program_pipe
Date: Wed, 25 Sep 2024 07:26:03 -0400
Message-ID: <20240925113641.1297102-142-sashal@kernel.org>
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 8e4ed3cf1642df0c4456443d865cff61a9598aa8 ]

This commit addresses a null pointer dereference issue in the
`dcn20_program_pipe` function. The issue could occur when
`pipe_ctx->plane_state` is null.

The fix adds a check to ensure `pipe_ctx->plane_state` is not null
before accessing. This prevents a null pointer dereference.

Reported by smatch:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn20/dcn20_hwseq.c:1925 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state' could be null (see line 1877)

Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 30 ++++++++++++-------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 456e19e0d415c..17d1c195663a0 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1921,22 +1921,29 @@ static void dcn20_program_pipe(
 				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
 	}
 
-	if (pipe_ctx->update_flags.raw || pipe_ctx->plane_state->update_flags.raw || pipe_ctx->stream->update_flags.raw)
+	if (pipe_ctx->update_flags.raw ||
+	    (pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.raw) ||
+	    pipe_ctx->stream->update_flags.raw)
 		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
 
-	if (pipe_ctx->update_flags.bits.enable
-			|| pipe_ctx->plane_state->update_flags.bits.hdr_mult)
+	if (pipe_ctx->update_flags.bits.enable ||
+	    (pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.bits.hdr_mult))
 		hws->funcs.set_hdr_multiplier(pipe_ctx);
 
 	if (hws->funcs.populate_mcm_luts) {
-		hws->funcs.populate_mcm_luts(dc, pipe_ctx, pipe_ctx->plane_state->mcm_luts,
-				pipe_ctx->plane_state->lut_bank_a);
-		pipe_ctx->plane_state->lut_bank_a = !pipe_ctx->plane_state->lut_bank_a;
+		if (pipe_ctx->plane_state) {
+			hws->funcs.populate_mcm_luts(dc, pipe_ctx, pipe_ctx->plane_state->mcm_luts,
+						     pipe_ctx->plane_state->lut_bank_a);
+			pipe_ctx->plane_state->lut_bank_a = !pipe_ctx->plane_state->lut_bank_a;
+		}
 	}
 	if (pipe_ctx->update_flags.bits.enable ||
-	    pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
-	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
-	    pipe_ctx->plane_state->update_flags.bits.lut_3d)
+	    (pipe_ctx->plane_state &&
+	     pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change) ||
+	    (pipe_ctx->plane_state &&
+	     pipe_ctx->plane_state->update_flags.bits.gamma_change) ||
+	    (pipe_ctx->plane_state &&
+	     pipe_ctx->plane_state->update_flags.bits.lut_3d))
 		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
 
 	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
@@ -1946,7 +1953,8 @@ static void dcn20_program_pipe(
 	if (pipe_ctx->update_flags.bits.enable ||
 			pipe_ctx->update_flags.bits.plane_changed ||
 			pipe_ctx->stream->update_flags.bits.out_tf ||
-			pipe_ctx->plane_state->update_flags.bits.output_tf_change)
+			(pipe_ctx->plane_state &&
+			 pipe_ctx->plane_state->update_flags.bits.output_tf_change))
 		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
 
 	/* If the pipe has been enabled or has a different opp, we
@@ -1970,7 +1978,7 @@ static void dcn20_program_pipe(
 	}
 
 	/* Set ABM pipe after other pipe configurations done */
-	if (pipe_ctx->plane_state->visible) {
+	if ((pipe_ctx->plane_state && pipe_ctx->plane_state->visible)) {
 		if (pipe_ctx->stream_res.abm) {
 			dc->hwss.set_pipe(pipe_ctx);
 			pipe_ctx->stream_res.abm->funcs->set_abm_level(pipe_ctx->stream_res.abm,
-- 
2.43.0

