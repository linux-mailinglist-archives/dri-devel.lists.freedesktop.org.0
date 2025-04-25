Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E9A9D288
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F410E9C3;
	Fri, 25 Apr 2025 19:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ncTrHHJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE7C10E027;
 Fri, 25 Apr 2025 19:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rft/VMLG85HS5hQH2g2PgJNBINfikizGEu9oLhFhw9c=; b=ncTrHHJGWYcmYnb6MI264juTNH
 lt7OmS5g3TSQ7CY9oITVAO6obRNSk2sKIu60pYMVE/yBCeyjUi9RASvehf9H+Z6ChlN7IcltiJ7VC
 9urVcshtdpE4k12vEOUOgTskhnysUejN8sgw5YsxRnBzzy604QIGd1OLnoud/Tk3cM035yp+e0TfD
 66nL3pqWTKQN6vAbLhckbAHsA3Y3IiY6UErE5JzNzw4aMfQtEjVbFfjOC06tkTjpRQRta2zJt4W36
 cGCC/d5pTs/+YHKMf5jkFib839MHkGkbELlPnixZH9EAksUEXVnsDMiH8hSq7DefHig0HMItrvvru
 ynefQznQ==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u8PCO-008Tsm-4a; Fri, 25 Apr 2025 21:59:00 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: log color state for DCN401
Date: Fri, 25 Apr 2025 16:58:27 -0300
Message-ID: <20250425195853.307330-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing DTN logs for DCN401 to improve debugging tools.  There is no
DPP gamut_remap log: from `ddp_set_gamut_remap = NULL`, there is no DPP
gamut_remap. Also, log doesn't say anything yet about the position of
MPC shaper+3dlut+blndlut, that can be set before or after blending in
this hw version. This moviment is also the reason that there is no log
for DPP shaper+3dlut+blndlut too.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dpp/dcn401/dcn401_dpp.c    |  16 ++-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 120 ++++++++++++++++++
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |   3 +
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   1 +
 .../amd/display/dc/mpc/dcn401/dcn401_mpc.c    |  32 ++++-
 5 files changed, 169 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
index 97bf26fa3573..b89e35d2bc0c 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
@@ -44,12 +44,24 @@
 
 void dpp401_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
 {
-	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
+	uint32_t gamcor_lut_mode;
 
 	REG_GET(DPP_CONTROL,
 		DPP_CLOCK_ENABLE, &s->is_enabled);
+	// Pre-degamma (ROM)
+	REG_GET_2(PRE_DEGAM,
+		  PRE_DEGAM_MODE, &s->pre_dgam_mode,
+		  PRE_DEGAM_SELECT, &s->pre_dgam_select);
 
-	// TODO: Implement for DCN4
+	// Gamma Correction (RAM)
+	REG_GET(CM_GAMCOR_CONTROL,
+		CM_GAMCOR_MODE_CURRENT, &s->gamcor_mode);
+	if (s->gamcor_mode) {
+		REG_GET(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT_CURRENT, &gamcor_lut_mode);
+		if (!gamcor_lut_mode)
+			s->gamcor_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
+	}
 }
 
 void dpp401_dpp_setup(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 8611eb9607df..76043caaadbc 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -32,6 +32,7 @@
 #include "dcn32/dcn32_hwseq.h"
 #include "dcn401_hwseq.h"
 #include "dcn401/dcn401_resource.h"
+#include "dcn401/dcn401_mpc.h"
 #include "dc_state_priv.h"
 #include "link_enc_cfg.h"
 
@@ -78,6 +79,125 @@ static void dcn401_initialize_min_clocks(struct dc *dc)
 			true);
 }
 
+void dcn401_log_color_state(struct dc *dc,
+			   struct dc_log_buffer_ctx *log_ctx)
+{
+	struct dc_context *dc_ctx = dc->ctx;
+	struct resource_pool *pool = dc->res_pool;
+	int i;
+
+	DTN_INFO("DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode"
+		 "  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode"
+		 "  GAMUT adjust  "
+		 "C11        C12        C13        C14        "
+		 "C21        C22        C23        C24        "
+		 "C31        C32        C33        C34        \n");
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		struct dpp *dpp = pool->dpps[i];
+		struct dcn_dpp_state s = {0};
+
+		dpp->funcs->dpp_read_state(dpp, &s);
+
+		if (!s.is_enabled)
+			continue;
+
+		DTN_INFO("[%2d]:  %7x  %13s  %8s",
+			 dpp->inst,
+			 s.pre_dgam_mode,
+			 (s.pre_dgam_select == 0) ? "sRGB" :
+			  ((s.pre_dgam_select == 1) ? "Gamma 2.2" :
+			  ((s.pre_dgam_select == 2) ? "Gamma 2.4" :
+			  ((s.pre_dgam_select == 3) ? "Gamma 2.6" :
+			  ((s.pre_dgam_select == 4) ? "BT.709" :
+			  ((s.pre_dgam_select == 5) ? "PQ" :
+			  ((s.pre_dgam_select == 6) ? "HLG" :
+						      "Unknown")))))),
+			 (s.gamcor_mode == 0) ? "Bypass" :
+			  ((s.gamcor_mode == 1) ? "RAM A" :
+						  "RAM B"));
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
+		 "  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT"
+		 "  GAMUT adjust  "
+		 "C11        C12        C13        C14        "
+		 "C21        C22        C23        C24        "
+		 "C31        C32        C33        C34        \n");
+
+	for (i = 0; i < pool->mpcc_count; i++) {
+		struct mpcc_state s = {0};
+
+		pool->mpc->funcs->read_mpcc_state(pool->mpc, i, &s);
+
+		if (s.opp_id != 0xf) {
+			mpc401_get_gamut_remap(pool->mpc, i,  &s.gamut_remap);
+
+			DTN_INFO("[%2d]:  %2xh  %2xh  %6xh  %4d  %10d  %7d  %12d  %4d  %11s %11s %16s %11s %10s %9s"
+				 "  %-12s  "
+				 "%010lld %010lld %010lld %010lld "
+				 "%010lld %010lld %010lld %010lld "
+				 "%010lld %010lld %010lld %010lld\n",
+				i, s.opp_id, s.dpp_id, s.bot_mpcc_id,
+				s.mode, s.alpha_mode, s.pre_multiplied_alpha, s.overlap_only,
+				s.idle,
+				(s.shaper_lut_mode == 1) ? "RAM A" :
+				 ((s.shaper_lut_mode == 2) ? "RAM B" :
+							     "Bypass"),
+				(s.lut3d_mode == 1) ? "RAM A" :
+				 ((s.lut3d_mode == 2) ? "RAM B" :
+							"Bypass"),
+				(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
+				(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
+				(s.rgam_mode == 0) ? "Bypass" :
+				 ((s.rgam_mode == 2) ? "RAM" :
+						       "Unknown"),
+				(s.rgam_mode == 1) ? "B" : "A",
+				(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
+					((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
+										  "SW"),
+				s.gamut_remap.temperature_matrix[0].value,
+				s.gamut_remap.temperature_matrix[1].value,
+				s.gamut_remap.temperature_matrix[2].value,
+				s.gamut_remap.temperature_matrix[3].value,
+				s.gamut_remap.temperature_matrix[4].value,
+				s.gamut_remap.temperature_matrix[5].value,
+				s.gamut_remap.temperature_matrix[6].value,
+				s.gamut_remap.temperature_matrix[7].value,
+				s.gamut_remap.temperature_matrix[8].value,
+				s.gamut_remap.temperature_matrix[9].value,
+				s.gamut_remap.temperature_matrix[10].value,
+				s.gamut_remap.temperature_matrix[11].value);
+		}
+	}
+	DTN_INFO("\n");
+	DTN_INFO("MPC Color Caps: gamut_remap:%d, 3dlut:%d, ogam_ram:%d, ocsc:%d\n\n",
+		 dc->caps.color.mpc.gamut_remap,
+		 dc->caps.color.mpc.num_3dluts,
+		 dc->caps.color.mpc.ogam_ram,
+		 dc->caps.color.mpc.ocsc);
+}
+
 void dcn401_program_gamut_remap(struct pipe_ctx *pipe_ctx)
 {
 	unsigned int i = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index ce65b4f6c672..5a6c6c6ff66e 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -35,6 +35,9 @@ void dcn401_program_gamut_remap(struct pipe_ctx *pipe_ctx);
 
 void dcn401_init_hw(struct dc *dc);
 
+void dcn401_log_color_state(struct dc *dc,
+			    struct dc_log_buffer_ctx *log_ctx);
+
 bool dcn401_set_mcm_luts(struct pipe_ctx *pipe_ctx,
 				const struct dc_plane_state *plane_state);
 bool dcn401_set_output_transfer_func(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index fe7aceb2f510..839bafa1df34 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -50,6 +50,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dcn30_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn401_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
index 98cf0cbd59ba..ba36465e0b79 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
@@ -575,8 +575,38 @@ void mpc401_get_gamut_remap(struct mpc *mpc,
 		arr_reg_val, ARRAY_SIZE(arr_reg_val));
 }
 
+static void mpc401_read_mpcc_state(struct mpc *mpc,
+				   int mpcc_inst,
+				   struct mpcc_state *s)
+{
+	struct dcn401_mpc *mpc401 = TO_DCN401_MPC(mpc);
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
+	/* Color blocks state */
+	REG_GET(MPCC_MCM_SHAPER_CONTROL[mpcc_inst], MPCC_MCM_SHAPER_MODE_CURRENT, &s->shaper_lut_mode);
+	REG_GET(MPCC_MCM_3DLUT_MODE[mpcc_inst],
+		MPCC_MCM_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
+	REG_GET(MPCC_MCM_3DLUT_READ_WRITE_CONTROL[mpcc_inst],
+		MPCC_MCM_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+	REG_GET(MPCC_MCM_3DLUT_MODE[mpcc_inst], MPCC_MCM_3DLUT_SIZE, &s->lut3d_size);
+	REG_GET(MPCC_MCM_1DLUT_CONTROL[mpcc_inst],
+		MPCC_MCM_1DLUT_MODE_CURRENT, &s->rgam_mode);
+	REG_GET(MPCC_MCM_1DLUT_CONTROL[mpcc_inst],
+		MPCC_MCM_1DLUT_SELECT_CURRENT, &s->rgam_lut);
+
+}
+
 static const struct mpc_funcs dcn401_mpc_funcs = {
-	.read_mpcc_state = mpc1_read_mpcc_state,
+	.read_mpcc_state = mpc401_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
 	.mpc_init = mpc32_mpc_init,
-- 
2.47.2

