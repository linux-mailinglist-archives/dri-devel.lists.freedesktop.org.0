Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2300777D71
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92B010E5A6;
	Thu, 10 Aug 2023 16:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FF610E5A5;
 Thu, 10 Aug 2023 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oaPPgI4MashoQdDxkkKwWaQcDqhEIAnnmpGRJpRzwzI=; b=QXkGrPaQKwo1SsNQ9e0LLubWkg
 OlghZ1URClqKPyPJyg0h73Rxp6PLiVmIfRASw3DHovCPuli6+33SLv43XcLj49L3YctvIBUZasiuT
 dM82KFLKypPcg78P7z/x/XR3yfINSYFfu7x7YrWC+RsxpnPRN79iApfFDvTBwRAYnhiqCWehp9dRw
 GW69NX1oLOIshRFy7eQbm6Z+eu0PhdglorRYAkqhgG9rw6ZWbTPNI3TPPgpenzZIuU41O8/QH6nxk
 mtNtwj0Z3l7Cexltmvt4zbHz9nZmVl62zxtzkIyxxEFwF3ZzAbqbTi+7VzOuUZTSWdmUnu03ffxBa
 9drFb0Gg==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU89B-00GjYD-8X; Thu, 10 Aug 2023 18:04:25 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 31/34] drm/amd/display: set stream gamut remap matrix to
 MPC for DCN301
Date: Thu, 10 Aug 2023 15:03:11 -0100
Message-Id: <20230810160314.48225-32-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
MIME-Version: 1.0
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dc->caps.color.mpc.gamut_remap says there is a post-blending color block
for gamut remap matrix for DCN3 HW family and newer versions. However,
those drivers still follow DCN10 programming that remap stream
gamut_remap_matrix to DPP (pre-blending).

To enable pre-blending and post-blending gamut_remap matrix supports at
the same time, set stream gamut_remap to MPC and plane gamut_remap to
DPP for DCN301 that support both.

It was tested using IGT KMS color tests for DRM CRTC CTM property and it
preserves test results.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 37 +++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 ++
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |  2 +-
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 4cd4ae07d73d..4fb4e9ec03f1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -186,6 +186,43 @@ bool dcn30_set_input_transfer_func(struct dc *dc,
 	return result;
 }
 
+void dcn30_program_gamut_remap(struct pipe_ctx *pipe_ctx)
+{
+	int i = 0;
+	struct dpp_grph_csc_adjustment dpp_adjust;
+	struct mpc_grph_gamut_adjustment mpc_adjust;
+	int mpcc_id = pipe_ctx->plane_res.hubp->inst;
+	struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
+
+	memset(&dpp_adjust, 0, sizeof(dpp_adjust));
+	dpp_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+
+	if (pipe_ctx->plane_state &&
+	    pipe_ctx->plane_state->gamut_remap_matrix.enable_remap == true) {
+		dpp_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+		for (i = 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
+			dpp_adjust.temperature_matrix[i] =
+				pipe_ctx->plane_state->gamut_remap_matrix.matrix[i];
+	}
+
+	pipe_ctx->plane_res.dpp->funcs->dpp_set_gamut_remap(pipe_ctx->plane_res.dpp,
+							    &dpp_adjust);
+
+	memset(&mpc_adjust, 0, sizeof(mpc_adjust));
+	mpc_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+
+	if (pipe_ctx->top_pipe == NULL) {
+		if (pipe_ctx->stream->gamut_remap_matrix.enable_remap == true) {
+			mpc_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+			for (i = 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
+				mpc_adjust.temperature_matrix[i] =
+					pipe_ctx->stream->gamut_remap_matrix.matrix[i];
+		}
+	}
+
+	mpc->funcs->set_gamut_remap(mpc, mpcc_id, &mpc_adjust);
+}
+
 bool dcn30_set_output_transfer_func(struct dc *dc,
 				struct pipe_ctx *pipe_ctx,
 				const struct dc_stream_state *stream)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
index a24a8e33a3d2..cb34ca932a5f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
@@ -58,6 +58,9 @@ bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
 bool dcn30_set_input_transfer_func(struct dc *dc,
 				struct pipe_ctx *pipe_ctx,
 				const struct dc_plane_state *plane_state);
+
+void dcn30_program_gamut_remap(struct pipe_ctx *pipe_ctx);
+
 bool dcn30_set_output_transfer_func(struct dc *dc,
 				struct pipe_ctx *pipe_ctx,
 				const struct dc_stream_state *stream);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
index 257df8660b4c..81fd50ee97c3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
@@ -33,7 +33,7 @@
 #include "dcn301_init.h"
 
 static const struct hw_sequencer_funcs dcn301_funcs = {
-	.program_gamut_remap = dcn10_program_gamut_remap,
+	.program_gamut_remap = dcn30_program_gamut_remap,
 	.init_hw = dcn10_init_hw,
 	.power_down_on_boot = dcn10_power_down_on_boot,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
-- 
2.40.1

