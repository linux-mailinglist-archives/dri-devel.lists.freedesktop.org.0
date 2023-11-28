Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBD7FC0DE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721C610E59F;
	Tue, 28 Nov 2023 17:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B4910E597;
 Tue, 28 Nov 2023 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G5Iytc/tEvuV9z7GS3Rse1ihmdpYlNMwxT1kUrREvgw=; b=D3KA7EAkEq5GZCGUGZgEmmjb9I
 dHUm2iHlWeLH1H5eWfyuaeAuZsOS9TGcT5hU74GX6kslmyGOaSOQuMBrGTfw36lAo/gdh9hNzr61C
 2daj3GAs8ZjDC9ziY3toUlTtCmMLIFyfvVV4YJSZYmHyg+rbn2F+sd44U4lojR0RL1EJa2EhmcKbD
 gdqt4QpeD29mMRSZfr1RBCEt+zceSp62xfnj63OvwSFP1fjnFxEECAKXim2cD2oc49yQw+IZadHW7
 CVI55ZVnNpjFstiQYHLC/WGzbwYwQJGAVZcySzUQ2MFiO0mEjDnmHSspB2B6w5qT+107M+wcWOLKZ
 zasDDjkA==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82K6-0087Bf-QM; Tue, 28 Nov 2023 18:56:38 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 7/9] drm/amd/display: hook up DCN30 color blocks data to
 DTN log
Date: Tue, 28 Nov 2023 16:52:55 -0100
Message-ID: <20231128175623.121356-8-mwen@igalia.com>
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
state sections in the DTN log to no longer match DCN3+ state. Create a
color state log specific to DCN3.0 and hook it up to DCN3.0+ and DCN3.1+
drivers.

rfc-v2:
- detail RAM mode for gamcor and blnd gamma blocks
- add MPC gamut remap matrix log

v3:
- read MPC gamut remap matrix in fixed 31.32 format
- extend to DCN3.0+ and DCN3.1+ drivers (Harry)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_init.c |   1 +
 .../drm/amd/display/dc/dcn314/dcn314_init.c   |   1 +
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |   5 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 126 ++++++++++++++++++
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.h   |   3 +
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |   2 +
 8 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
index 9894caedffed..4064e6b7f599 100644
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
index 6477009ce065..1a9122252702 100644
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
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
index 669f524bd064..61577a3678a0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
@@ -71,6 +71,7 @@ static const struct hw_sequencer_funcs dcn31_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dcn30_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn30_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
index ccb7e317e86a..094b912832c1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
@@ -73,6 +73,7 @@ static const struct hw_sequencer_funcs dcn314_funcs = {
 	.setup_stereo = dcn10_setup_stereo,
 	.set_avmute = dcn30_set_avmute,
 	.log_hw_state = dcn10_log_hw_state,
+	.log_color_state = dcn30_log_color_state,
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index f0a9f8818909..f7d9bcdbc6c6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -374,7 +374,10 @@ void dcn10_log_hw_state(struct dc *dc,
 
 	dcn10_log_hubp_states(dc, log_ctx);
 
-	dcn10_log_color_state(dc, log_ctx);
+	if (dc->hwss.log_color_state)
+		dc->hwss.log_color_state(dc, log_ctx);
+	else
+		dcn10_log_color_state(dc, log_ctx);
 
 	DTN_INFO("OTG:  v_bs  v_be  v_ss  v_se  vpol  vmax  vmin  vmax_sel  vmin_sel  h_bs  h_be  h_ss  h_se  hpol  htot  vtot  underflow blank_en\n");
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index d71faf2ecd41..1e07f0a6be1f 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -69,6 +69,132 @@
 #define FN(reg_name, field_name) \
 	hws->shifts->field_name, hws->masks->field_name
 
+void dcn30_log_color_state(struct dc *dc,
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
+		dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
+
+		if (!s.is_enabled)
+			continue;
+
+		DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s  %10s  %9s"
+			 "  %12s  "
+			 "%010lld %010lld %010lld %010lld "
+			 "%010lld %010lld %010lld %010lld "
+			 "%010lld %010lld %010lld %010lld",
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
+			(s.gamcor_mode == 0) ? "Bypass" :
+			 ((s.gamcor_mode == 1) ? "RAM A" :
+						 "RAM B"),
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
+						   "RAM B"),
+			(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
+				((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
+									  "SW"),
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
+
+	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE"
+		 "  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT"
+		 "  GAMUT adjust  "
+		 "C11        C12        C13        C14        "
+		 "C21        C22        C23        C24        "
+		 "C31        C32        C33        C34        \n");
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		struct mpcc_state s = {0};
+
+		pool->mpc->funcs->read_mpcc_state(pool->mpc, i, &s);
+		mpc3_get_gamut_remap(pool->mpc, i,  &s.gamut_remap);
+
+		if (s.opp_id != 0xf)
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
+
+	}
+	DTN_INFO("\n");
+}
+
 bool dcn30_set_blend_lut(
 	struct pipe_ctx *pipe_ctx, const struct dc_plane_state *plane_state)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h
index e557e2b98618..4248a4c0e574 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h
@@ -52,6 +52,9 @@ bool dcn30_mmhubbub_warmup(
 	unsigned int num_dwb,
 	struct dc_writeback_info *wb_info);
 
+void dcn30_log_color_state(struct dc *dc,
+			   struct dc_log_buffer_ctx *log_ctx);
+
 bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
 		const struct dc_plane_state *plane_state);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index 452680fe9aab..5a95060ac8d0 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -338,6 +338,8 @@ struct hw_sequencer_funcs {
 
 	/* HW State Logging Related */
 	void (*log_hw_state)(struct dc *dc, struct dc_log_buffer_ctx *log_ctx);
+	void (*log_color_state)(struct dc *dc,
+				struct dc_log_buffer_ctx *log_ctx);
 	void (*get_hw_state)(struct dc *dc, char *pBuf,
 			unsigned int bufSize, unsigned int mask);
 	void (*clear_status_bits)(struct dc *dc, unsigned int mask);
-- 
2.42.0

