Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C067FC0D4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD4610E591;
	Tue, 28 Nov 2023 17:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9C610E32B;
 Tue, 28 Nov 2023 17:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fo/Z2dbF9VUluYs16pMeHKAaV9qahO1OFUOsjcI1BI8=; b=j+Fl3iCQ0hy0mRd82TO9AoC7ZK
 w521blcWn2+fYJydouFTIvMsgh6sfzuKekFq0ug9RncxN9NnbUa/MjrJe9YWw9BBxEmoFIx01vQnr
 KgJNqhCcm2DPP2xBSqrZkYmwTmtYTpi+yWDXpU6N/JPgchXwCEc56TF9pTHwWsdI0QRN3AQXlgrl9
 ZkLxr4fXZABtPhJ0IWOFlq67SidoXAg/AUFd4cq0tj1nhrUAEMFLzFN4ugq3goYs23lv8BpK5+jea
 iH/jH9rOplCWnGbsKPmelEf+tZDotS6ewfwH2MOqMdCkKRbOISB27QDIwdHfRoJhqxkIv0BQ05yrC
 L/xDQg4w==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82K1-0087Bf-MZ; Tue, 28 Nov 2023 18:56:33 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 4/9] drm/amd/display: fill up DCN3 DPP color state
Date: Tue, 28 Nov 2023 16:52:52 -0100
Message-ID: <20231128175623.121356-5-mwen@igalia.com>
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

DCN3 DPP color state was uncollected and some state elements from DCN1
doesn't fit DCN3. Create new elements according to DCN3 color caps and
fill them up for DTN log output.

rfc-v2:
- fix reading of gamcor and blnd gamma states
- remove gamut remap register in favor of gamut remap matrix reading

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 37 ++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  8 ++++
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 7c18f31bb56c..a3a769aad042 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -44,12 +44,45 @@
 void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
 {
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	uint32_t gamcor_lut_mode, rgam_lut_mode;
 
 	REG_GET(DPP_CONTROL,
-			DPP_CLOCK_ENABLE, &s->is_enabled);
+		DPP_CLOCK_ENABLE, &s->is_enabled);
 
-	// TODO: Implement for DCN3
+	// Pre-degamma (ROM)
+	REG_GET_2(PRE_DEGAM,
+		  PRE_DEGAM_MODE, &s->pre_dgam_mode,
+		  PRE_DEGAM_SELECT, &s->pre_dgam_select);
+
+	// Gamma Correction (RAM)
+	REG_GET(CM_GAMCOR_CONTROL,
+		CM_GAMCOR_MODE_CURRENT, &s->gamcor_mode);
+	if (s->gamcor_mode) {
+		REG_GET(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT_CURRENT, &gamcor_lut_mode);
+		if (!gamcor_lut_mode)
+			s->gamcor_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
+	}
+
+	// Shaper LUT (RAM), 3D LUT (mode, bit-depth, size)
+	REG_GET(CM_SHAPER_CONTROL,
+		CM_SHAPER_LUT_MODE, &s->shaper_lut_mode);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_MODE_CURRENT, &s->lut3d_mode);
+	REG_GET(CM_3DLUT_READ_WRITE_CONTROL,
+		CM_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_SIZE, &s->lut3d_size);
+
+	// Blend/Out Gamma (RAM)
+	REG_GET(CM_BLNDGAM_CONTROL,
+		CM_BLNDGAM_MODE_CURRENT, &s->rgam_lut_mode);
+	if (s->rgam_lut_mode){
+		REG_GET(CM_BLNDGAM_CONTROL, CM_BLNDGAM_SELECT_CURRENT, &rgam_lut_mode);
+		if (!rgam_lut_mode)
+			s->rgam_lut_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
+	}
 }
+
 /*program post scaler scs block in dpp CM*/
 void dpp3_program_post_csc(
 		struct dpp *dpp_base,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index b6acfd86642a..4e604bf24f51 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -151,6 +151,14 @@ struct dcn_dpp_state {
 	uint32_t gamut_remap_c33_c34;
 	// gamut_remap data for dcn*_log_color_state()
 	struct dpp_grph_csc_adjustment gamut_remap;
+	uint32_t shaper_lut_mode;
+	uint32_t lut3d_mode;
+	uint32_t lut3d_bit_depth;
+	uint32_t lut3d_size;
+	uint32_t blnd_lut_mode;
+	uint32_t pre_dgam_mode;
+	uint32_t pre_dgam_select;
+	uint32_t gamcor_mode;
 };
 
 struct CM_bias_params {
-- 
2.42.0

