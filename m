Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078B75C7B9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 15:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4A410E67F;
	Fri, 21 Jul 2023 13:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B39510E088;
 Fri, 21 Jul 2023 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e2WBsfQdtF53jEaskT1x/L0w3qneqs04eI7iCf3SKcc=; b=Lu7FKCXiyTE33Hnj/RpTRsJ/FQ
 Enxi3FWAzrnJQTL4mGsJcRVXkSdZnOZcWYufd6Dhlo8ewaVKIEtxM9G+NfQ09cty5+P5kG+J9HcMi
 iph7ecLJaBakYjgHaUroJ90T7W3F8ICm/lI1MZBimMUGA3Qw0HRGZQhG+hPWLoHh1k3CTuQXc5mij
 rcUJmBXmC/pQiAtupas0EBsXbiZso7Cd2DnkiAL2VDK/KtWLpj8hD2cSvquWteOnMhNwX3afVDUtw
 U2ad1QyIFZB2T00fUY8/W1TjQmsioexDwpOfvGJuAKiKKDa/hiH4AWp2y6HILt9uUDqLU97UaY+YJ
 1nP98eNg==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qMq7U-001MbH-Rj; Fri, 21 Jul 2023 15:24:32 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: set stream gamut remap matrix to MPC for
 DCN3+
Date: Fri, 21 Jul 2023 12:24:31 -0100
Message-Id: <20230721132431.692158-1-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, bhawanpreet.lakha@amd.com, Nicholas.Kazlauskas@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dc->caps.color.mpc.gamut_remap says there is a post-blending color block
for gamut remap matrix for DCN3 HW family and newer versions. However,
those drivers still follow DCN10 programming that remap stream
gamut_remap_matrix to DPP (pre-blending).

To enable pre-blending and post-blending gamut_remap matrix supports at
the same time, set stream gamut_remap to MPC and plane gamut_remap to
DPP for DCN families that support both.

It was tested using IGT KMS color tests for DRM CRTC CTM property and it
preserves test results.

Signed-off-by: Melissa Wen <mwen@igalia.com>

---

Hi,

Two relevant things to consider for this change. One is that mapping DRM
CRTC CTM to MPC is a more consistent way since CRTC CTM is a
post-blending transformation. Second, programming stream
gamut_remap_matrix on MPC enables us to provide support for both plane
CTM and CRTC CTM color properties. If we don't make this separation, we
would need to reject an atomic commit that tries to set both properties
at the same time and userspace may also get unexpected results.

Thanks in advance for any feeback,

Melissa

 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 37 +++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 ++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |  2 +-
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |  2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_init.c |  2 +-
 .../drm/amd/display/dc/dcn314/dcn314_init.c   |  2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |  2 +-
 7 files changed, 45 insertions(+), 5 deletions(-)

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
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
index 3d19acaa12f3..5372eb76fcfc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
@@ -32,7 +32,7 @@
 #include "dcn30_init.h"
 
 static const struct hw_sequencer_funcs dcn30_funcs = {
-	.program_gamut_remap = dcn10_program_gamut_remap,
+	.program_gamut_remap = dcn30_program_gamut_remap,
 	.init_hw = dcn30_init_hw,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
 	.apply_ctx_for_surface = NULL,
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
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
index fc25cc300a17..4e724d52a68f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
@@ -34,7 +34,7 @@
 #include "dcn31_init.h"
 
 static const struct hw_sequencer_funcs dcn31_funcs = {
-	.program_gamut_remap = dcn10_program_gamut_remap,
+	.program_gamut_remap = dcn30_program_gamut_remap,
 	.init_hw = dcn31_init_hw,
 	.power_down_on_boot = dcn10_power_down_on_boot,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
index ca8fe55c33b8..01e03ecf2291 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
@@ -36,7 +36,7 @@
 #include "dcn314_init.h"
 
 static const struct hw_sequencer_funcs dcn314_funcs = {
-	.program_gamut_remap = dcn10_program_gamut_remap,
+	.program_gamut_remap = dcn30_program_gamut_remap,
 	.init_hw = dcn31_init_hw,
 	.power_down_on_boot = dcn10_power_down_on_boot,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
index 777b2fac20c4..625008d618fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -33,7 +33,7 @@
 #include "dcn32_init.h"
 
 static const struct hw_sequencer_funcs dcn32_funcs = {
-	.program_gamut_remap = dcn10_program_gamut_remap,
+	.program_gamut_remap = dcn30_program_gamut_remap,
 	.init_hw = dcn32_init_hw,
 	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
 	.apply_ctx_for_surface = NULL,
-- 
2.40.1

