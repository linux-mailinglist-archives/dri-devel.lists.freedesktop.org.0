Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9007FC0DF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044C410E5A1;
	Tue, 28 Nov 2023 17:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A810E597;
 Tue, 28 Nov 2023 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rty5V4hbWzXdget3+SFUk7XWb+7KExgVBrR/u4ZBmnM=; b=oKDlflFkIqjvtgoLNSl13Z8LO5
 mGLGXeK+L//v8eH4mEZs0uV3zx988Vd4E2F99e71z0hv+L0/3uTH3M3po7ck8HjqcFYEtRwRmFeDh
 D9jg7Idcypj2aZjhj0XUgxM974h3gKsi500nwbeaSjpBCJCU1JdG7Any62/GS1bylHoywXXIIFu7K
 ncyM4qOnLPZULZv8+2l5/rF84s6aQcD1LN7eY4wD0zw+U/mWy+Ecd2zJcSIUDX8NXErBB48qqZRiZ
 i3y6bQku0fcXBrU8QQ//TPoq9pKbPxmSMo1bdE23SHCphOmvn0jsXZb1e1lAgNFoyupPETlJRKO1E
 tnSyaaVw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82KA-0087Bf-VE; Tue, 28 Nov 2023 18:56:43 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 9/9] drm/amd/display: hook up DCN20 color blocks data to
 DTN log
Date: Tue, 28 Nov 2023 16:52:57 -0100
Message-ID: <20231128175623.121356-10-mwen@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128175623.121356-1-mwen@igalia.com>
References: <20231128175623.121356-1-mwen@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Color caps changed between HW versions, which caused the DCN10 color
state sections in the DTN log to no longer match DCN2+ state. Create a
color state log specific to DCN2.0 and hook it up to DCN2 family
drivers. Instead of reading gamut remap reg values, display gamut remap
matrix data in fixed 31.32.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c  |  30 ++---
 .../gpu/drm/amd/display/dc/dcn20/dcn20_init.c |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c  |  24 +++-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_init.c |   1 +
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 106 ++++++++++++++++++
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.h   |   2 +
 6 files changed, 149 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
index dedc2dcf2691..1516c0a48726 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
@@ -55,21 +55,23 @@ void dpp20_read_state(struct dpp *dpp_base,
 
 	REG_GET(DPP_CONTROL,
 			DPP_CLOCK_ENABLE, &s->is_enabled);
+
+	// Degamma LUT (RAM)
 	REG_GET(CM_DGAM_CONTROL,
-			CM_DGAM_LUT_MODE, &s->dgam_lut_mode);
-	// BGAM has no ROM, and definition is different, can't reuse same dump
-	//REG_GET(CM_BLNDGAM_CONTROL,
-	//		CM_BLNDGAM_LUT_MODE, &s->rgam_lut_mode);
-	REG_GET(CM_GAMUT_REMAP_CONTROL,
-			CM_GAMUT_REMAP_MODE, &s->gamut_remap_mode);
-	if (s->gamut_remap_mode) {
-		s->gamut_remap_c11_c12 = REG_READ(CM_GAMUT_REMAP_C11_C12);
-		s->gamut_remap_c13_c14 = REG_READ(CM_GAMUT_REMAP_C13_C14);
-		s->gamut_remap_c21_c22 = REG_READ(CM_GAMUT_REMAP_C21_C22);
-		s->gamut_remap_c23_c24 = REG_READ(CM_GAMUT_REMAP_C23_C24);
-		s->gamut_remap_c31_c32 = REG_READ(CM_GAMUT_REMAP_C31_C32);
-		s->gamut_remap_c33_c34 = REG_READ(CM_GAMUT_REMAP_C33_C34);
-	}
+		CM_DGAM_LUT_MODE, &s->dgam_lut_mode);
+
+	// Shaper LUT (RAM), 3D LUT (mode, bit-depth, size)
+	REG_GET(CM_SHAPER_CONTROL,
+		CM_SHAPER_LUT_MODE, &s->shaper_lut_mode);
+	REG_GET_2(CM_3DLUT_READ_WRITE_CONTROL,
+		  CM_3DLUT_CONFIG_STATUS, &s->lut3d_mode,
+		  CM_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_SIZE, &s->lut3d_size);
+
+	// Blend/Out Gamma (RAM)
+	REG_GET(CM_BLNDGAM_LUT_WRITE_EN_MASK,
+		CM_BLNDGAM_CONFIG_STATUS, &s->rgam_lut_mode);
 }
 
 void dpp2_power_on_obuf(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
index 884e3e323338..ef6488165b8f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
@@ -67,6 +67,7 @@ static const struct hw_sequencer_funcs dcn20_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dce110_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn20_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
index 5da6e44f284a..16b5ff208d14 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
@@ -542,8 +542,30 @@ static struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 	return NULL;
 }
 
+static void mpc2_read_mpcc_state(
+		struct mpc *mpc,
+		int mpcc_inst,
+		struct mpcc_state *s)
+{
+	struct dcn20_mpc *mpc20 = TO_DCN20_MPC(mpc);
+
+	REG_GET(MPCC_OPP_ID[mpcc_inst], MPCC_OPP_ID, &s->opp_id);
+	REG_GET(MPCC_TOP_SEL[mpcc_inst], MPCC_TOP_SEL, &s->dpp_id);
+	REG_GET(MPCC_BOT_SEL[mpcc_inst], MPCC_BOT_SEL, &s->bot_mpcc_id);
+	REG_GET_4(MPCC_CONTROL[mpcc_inst], MPCC_MODE, &s->mode,
+			MPCC_ALPHA_BLND_MODE, &s->alpha_mode,
+			MPCC_ALPHA_MULTIPLIED_MODE, &s->pre_multiplied_alpha,
+			MPCC_BLND_ACTIVE_OVERLAP_ONLY, &s->overlap_only);
+	REG_GET_2(MPCC_STATUS[mpcc_inst], MPCC_IDLE, &s->idle,
+			MPCC_BUSY, &s->busy);
+
+	/* Gamma block state */
+	REG_GET(MPCC_OGAM_LUT_RAM_CONTROL[mpcc_inst],
+		MPCC_OGAM_CONFIG_STATUS, &s->rgam_mode);
+}
+
 static const struct mpc_funcs dcn20_mpc_funcs = {
-	.read_mpcc_state = mpc1_read_mpcc_state,
+	.read_mpcc_state = mpc2_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
 	.mpc_init = mpc1_mpc_init,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
index 18249c6b6d81..97348d3883d9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
@@ -67,6 +67,7 @@ static const struct hw_sequencer_funcs dcn21_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dce110_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn20_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 608221b0dd5d..a52fee82fb54 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -70,6 +70,112 @@
 #define FN(reg_name, field_name) \
 	hws->shifts->field_name, hws->masks->field_name
 
+void dcn20_log_color_state(struct dc *dc,
+			   struct dc_log_buffer_ctx *log_ctx)
+{
+	struct dc_context *dc_ctx = dc->ctx;
+	struct resource_pool *pool = dc->res_pool;
+	int i;
+
+	DTN_INFO("DPP:  DGAM mode  SHAPER mode  3DLUT mode  3DLUT bit depth"
+		 "  3DLUT size  RGAM mode  GAMUT adjust  "
+		 "C11        C12        C13        C14        "
+		 "C21        C22        C23        C24        "
+		 "C31        C32        C33        C34        \n");
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		struct dpp *dpp = pool->dpps[i];
+		struct dcn_dpp_state s = {0};
+
+		dpp->funcs->dpp_read_state(dpp, &s);
+		dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
+
+		if (!s.is_enabled)
+			continue;
+
+		DTN_INFO("[%2d]:  %8s  %11s  %10s  %15s  %10s  %9s  %12s  "
+			 "%010lld %010lld %010lld %010lld "
+			 "%010lld %010lld %010lld %010lld "
+			 "%010lld %010lld %010lld %010lld",
+			dpp->inst,
+			(s.dgam_lut_mode == 0) ? "Bypass" :
+			 ((s.dgam_lut_mode == 1) ? "sRGB" :
+			 ((s.dgam_lut_mode == 2) ? "Ycc" :
+			 ((s.dgam_lut_mode == 3) ? "RAM" :
+			 ((s.dgam_lut_mode == 4) ? "RAM" :
+						   "Unknown")))),
+			(s.shaper_lut_mode == 1) ? "RAM A" :
+			 ((s.shaper_lut_mode == 2) ? "RAM B" :
+						     "Bypass"),
+			(s.lut3d_mode == 1) ? "RAM A" :
+			 ((s.lut3d_mode == 2) ? "RAM B" :
+						"Bypass"),
+			(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
+			(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
+			(s.rgam_lut_mode == 1) ? "RAM A" :
+			 ((s.rgam_lut_mode == 1) ? "RAM B" : "Bypass"),
+			(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
+			 ((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
+								   "SW"),
+			s.gamut_remap.temperature_matrix[0].value,
+			s.gamut_remap.temperature_matrix[1].value,
+			s.gamut_remap.temperature_matrix[2].value,
+			s.gamut_remap.temperature_matrix[3].value,
+			s.gamut_remap.temperature_matrix[4].value,
+			s.gamut_remap.temperature_matrix[5].value,
+			s.gamut_remap.temperature_matrix[6].value,
+			s.gamut_remap.temperature_matrix[7].value,
+			s.gamut_remap.temperature_matrix[8].value,
+			s.gamut_remap.temperature_matrix[9].value,
+			s.gamut_remap.temperature_matrix[10].value,
+			s.gamut_remap.temperature_matrix[11].value);
+		DTN_INFO("\n");
+	}
+	DTN_INFO("\n");
+	DTN_INFO("DPP Color Caps: input_lut_shared:%d  icsc:%d"
+		 "  dgam_ram:%d  dgam_rom: srgb:%d,bt2020:%d,gamma2_2:%d,pq:%d,hlg:%d"
+		 "  post_csc:%d  gamcor:%d  dgam_rom_for_yuv:%d  3d_lut:%d"
+		 "  blnd_lut:%d  oscs:%d\n\n",
+		 dc->caps.color.dpp.input_lut_shared,
+		 dc->caps.color.dpp.icsc,
+		 dc->caps.color.dpp.dgam_ram,
+		 dc->caps.color.dpp.dgam_rom_caps.srgb,
+		 dc->caps.color.dpp.dgam_rom_caps.bt2020,
+		 dc->caps.color.dpp.dgam_rom_caps.gamma2_2,
+		 dc->caps.color.dpp.dgam_rom_caps.pq,
+		 dc->caps.color.dpp.dgam_rom_caps.hlg,
+		 dc->caps.color.dpp.post_csc,
+		 dc->caps.color.dpp.gamma_corr,
+		 dc->caps.color.dpp.dgam_rom_for_yuv,
+		 dc->caps.color.dpp.hw_3d_lut,
+		 dc->caps.color.dpp.ogam_ram,
+		 dc->caps.color.dpp.ocsc);
+
+	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE"
+		 "  OGAM mode\n");
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		struct mpcc_state s = {0};
+
+		pool->mpc->funcs->read_mpcc_state(pool->mpc, i, &s);
+		if (s.opp_id != 0xf)
+			DTN_INFO("[%2d]:  %2xh  %2xh  %6xh  %4d  %10d  %7d  %12d  %4d  %9s\n",
+				i, s.opp_id, s.dpp_id, s.bot_mpcc_id,
+				s.mode, s.alpha_mode, s.pre_multiplied_alpha, s.overlap_only,
+				s.idle,
+				(s.rgam_mode == 1) ? "RAM A" :
+				 ((s.rgam_mode == 2) ? "RAM B" :
+						       "Bypass"));
+	}
+	DTN_INFO("\n");
+	DTN_INFO("MPC Color Caps: gamut_remap:%d, 3dlut:%d, ogam_ram:%d, ocsc:%d\n\n",
+		 dc->caps.color.mpc.gamut_remap,
+		 dc->caps.color.mpc.num_3dluts,
+		 dc->caps.color.mpc.ogam_ram,
+		 dc->caps.color.mpc.ocsc);
+}
+
+
 static int find_free_gsl_group(const struct dc *dc)
 {
 	if (dc->res_pool->gsl_groups.gsl_0 == 0)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
index ab02e4e9c8c2..86d93eef9729 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h
@@ -28,6 +28,8 @@
 
 #include "hw_sequencer_private.h"
 
+void dcn20_log_color_state(struct dc *dc,
+			   struct dc_log_buffer_ctx *log_ctx);
 bool dcn20_set_blend_lut(
 	struct pipe_ctx *pipe_ctx, const struct dc_plane_state *plane_state);
 bool dcn20_set_shaper_3dlut(
-- 
2.42.0

