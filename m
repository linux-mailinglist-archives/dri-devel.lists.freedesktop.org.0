Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083A79237C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBD610E53C;
	Tue,  5 Sep 2023 14:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EACB10E53C;
 Tue,  5 Sep 2023 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sirAQZAPdPnWsUyXFp5LN9RPpy05TnI3JvpcApoK+os=; b=hd/FtBMKGOqPVR2mFadb+nlCgM
 beXi3typrZ8+V5hULa3NUscK+LFihLt7kykg7S8FiG9e1cvKs6VBsiscHHv3BCJwlRVCzRrQhb+zv
 1ecKJp0FLTzD1P3lmu4LYW2ZLZ8GPMtPf+OuplLJY8WqRgHdslHgzs/Wqt2z7W7Xrc/t5JlYqGIIa
 8Q6rmd/e5dJ4Zx8bC6jtssNepBHIfinbShTV8H+iRZMeUqDXpn38nXw8vqSCqKLa9DBfACCkz8xmB
 GoPLoGd+e3D7kBrCu8yU9sPXe92fb91gfRH14KvY6Ye/teQr3UreYd7DlSHqANLebQn+QG8B7libr
 3R2jgZsQ==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdX06-002cXU-1e; Tue, 05 Sep 2023 16:25:54 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 4/5] drm/amd/display: hook DCN30 color state logging to
 DTN log
Date: Tue,  5 Sep 2023 13:25:44 -0100
Message-Id: <20230905142545.451153-5-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230905142545.451153-1-mwen@igalia.com>
References: <20230905142545.451153-1-mwen@igalia.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Color caps changed between HW versions which caused DCN10 color state
sections on DTN log no longer fit DCN3.0 versions. Create a
DCN3.0-specific color state logging and hook it to drivers of DCN3.0
family.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  5 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 89 +++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |  1 +
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |  1 +
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  2 +
 6 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index d82e49045fbc..b2f3f1f85f4f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -357,7 +357,10 @@ void dcn10_log_hw_state(struct dc *dc,
 
 	dcn10_log_hubp_states(dc, log_ctx);
 
-	dcn10_log_color_state(dc, log_ctx);
+	if (dc->hwss.log_color_state)
+		dc->hwss.log_color_state(dc, log_ctx);
+	else
+		dcn10_log_color_state(dc, log_ctx);
 
 	DTN_INFO("OTG:  v_bs  v_be  v_ss  v_se  vpol  vmax  vmin  vmax_sel  vmin_sel  h_bs  h_be  h_ss  h_se  hpol  htot  vtot  underflow blank_en\n");
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 255713ec29bb..e1a2a68c1d45 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -69,6 +69,95 @@
 #define FN(reg_name, field_name) \
 	hws->shifts->field_name, hws->masks->field_name
 
+void
+dcn30_log_color_state(struct dc *dc,
+		      struct dc_log_buffer_ctx *log_ctx)
+{
+	struct dc_context *dc_ctx = dc->ctx;
+	struct resource_pool *pool = dc->res_pool;
+	int i;
+
+	DTN_INFO("DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode"
+		 "  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode"
+		 "  GAMUT mode  "
+		 "C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34\n");
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		struct dpp *dpp = pool->dpps[i];
+		struct dcn_dpp_state s = {-1};
+
+		dpp->funcs->dpp_read_state(dpp, &s);
+
+		if (!s.is_enabled)
+			continue;
+
+		DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s  %10s  %9s"
+			 "  %10x  %08xh %08xh %08xh %08xh %08xh %08xh",
+			dpp->inst,
+			s.pre_dgam_mode,
+			(s.pre_dgam_select == 0) ? "sRGB" :
+			 ((s.pre_dgam_select == 1) ? "Gamma 2.2" :
+			 ((s.pre_dgam_select == 2) ? "Gamma 2.4" :
+			 ((s.pre_dgam_select == 3) ? "Gamma 2.6" :
+			 ((s.pre_dgam_select == 4) ? "BT.709" :
+			 ((s.pre_dgam_select == 5) ? "PQ" :
+			 ((s.pre_dgam_select == 6) ? "HLG" :
+						     "Unknown")))))),
+			(s.gamcor_lut_mode == 0) ? "Bypass" :
+			 ((s.gamcor_lut_mode == 2) ? "RAM" :
+						     "Unknown"),
+			(s.shaper_lut_mode == 1) ? "RAM A" :
+			 ((s.shaper_lut_mode == 2) ? "RAM B" :
+						     "Bypass"),
+			(s.lut3d_mode == 1) ? "RAM A" :
+			 ((s.lut3d_mode == 2) ? "RAM B" :
+						"Bypass"),
+			(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
+			(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
+			(s.rgam_lut_mode == 0) ? "Bypass" :
+			 ((s.rgam_lut_mode == 1) ? "RAM A" :
+			 ((s.rgam_lut_mode == 2) ? "RAM B" :
+						   "Unknown")),
+			s.gamut_remap_mode,
+			s.gamut_remap_c11_c12, s.gamut_remap_c13_c14,
+			s.gamut_remap_c21_c22, s.gamut_remap_c23_c24,
+			s.gamut_remap_c31_c32, s.gamut_remap_c33_c34);
+		DTN_INFO("\n");
+	}
+	DTN_INFO("\n");
+
+	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE"
+		 "  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT"
+		 "  GAMUT mode  C11 C12   C33 C34\n");
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		struct mpcc_state s = {0};
+
+		pool->mpc->funcs->read_mpcc_state(pool->mpc, i, &s);
+		if (s.opp_id != 0xf)
+			DTN_INFO("[%2d]:  %2xh  %2xh  %6xh  %4d  %10d  %7d  %12d  %4d  %11s %11s %16s %11s %10s %9s"
+				 "  %10x %08xh %08xh\n",
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
+				s.gamut_remap_mode,
+				s.gamut_remap_c11_c12, s.gamut_remap_c33_c34);
+	}
+	DTN_INFO("\n");
+}
+
 bool dcn30_set_blend_lut(
 	struct pipe_ctx *pipe_ctx, const struct dc_plane_state *plane_state)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
index ce19c54097f8..cfb3646d6740 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
@@ -52,6 +52,9 @@ bool dcn30_mmhubbub_warmup(
 	unsigned int num_dwb,
 	struct dc_writeback_info *wb_info);
 
+void dcn30_log_color_state(struct dc *dc,
+			   struct dc_log_buffer_ctx *log_ctx);
+
 bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
 		const struct dc_plane_state *plane_state);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
index 0de8b2783cf6..58e4d7e1753b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
@@ -68,6 +68,7 @@ static const struct hw_sequencer_funcs dcn30_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dcn30_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn30_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
index 61205cdbe2d5..227e611f25b8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
@@ -72,6 +72,7 @@ static const struct hw_sequencer_funcs dcn301_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dcn30_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn30_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index fbfcd29b1d73..10de550c693a 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -343,6 +343,8 @@ struct hw_sequencer_funcs {
 
 	/* HW State Logging Related */
 	void (*log_hw_state)(struct dc *dc, struct dc_log_buffer_ctx *log_ctx);
+	void (*log_color_state)(struct dc *dc,
+				struct dc_log_buffer_ctx *log_ctx);
 	void (*get_hw_state)(struct dc *dc, char *pBuf,
 			unsigned int bufSize, unsigned int mask);
 	void (*clear_status_bits)(struct dc *dc, unsigned int mask);
-- 
2.40.1

