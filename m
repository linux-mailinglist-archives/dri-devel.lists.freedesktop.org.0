Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E879EF0E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF5B10E47C;
	Wed, 13 Sep 2023 16:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383FA10E35A;
 Wed, 13 Sep 2023 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PBB+vxUScI7B4WTK7HDrbGa47mJKzp3NWmEul8ohzvw=; b=NNMt6SmJu6AtwXcFOtMzlu8/7y
 AosCPtSqYDEkeqOfPHSACtOnSQfvT2Woc0WZvtamWgtiSDnMge4FEa21YaJx0clic3mSiU/4jh5Nh
 2CCDdWI8YEbu2qhLxL8q2ihNDoZgvxlQEfwh5LvX4XNV1crP3+7hb2KLNAa2d62S8Q8lhHzju/y0p
 6pgO06zfJ98qf3S0InUAKVN50+QUruoIMicoTPUECIsE5GC9pCGO2nH4xy0pq4yIBcHi71FPc2kcg
 M0NYhvcw5/JPYDQC8cXpCR9K7BdCT/j4siI55IrVBGKLA2BwSbLWTUyAGBZPQ83JDzeg4NmAnPq3Q
 /oOdAGqw==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qgSxi-003PbD-QY; Wed, 13 Sep 2023 18:43:34 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 2/5] drm/amd/display: fill up DCN3 DPP color state
Date: Wed, 13 Sep 2023 15:43:26 -0100
Message-Id: <20230913164329.123687-3-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230913164329.123687-1-mwen@igalia.com>
References: <20230913164329.123687-1-mwen@igalia.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DCN3 DPP color state was uncollected and some state elements from DCN1
doesn't fit DCN3. Create new elements according to DCN3 color caps and
fill them up for DTN log output.

rfc-v2:
- fix reading of gamcor and blnd gamma states

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 45 +++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  8 ++++
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 50dc83404644..a26b33c84ae0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -44,11 +44,50 @@
 void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
 {
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
+	uint32_t gamcor_lut_mode, rgam_lut_mode;
 
 	REG_GET(DPP_CONTROL,
-			DPP_CLOCK_ENABLE, &s->is_enabled);
-
-	// TODO: Implement for DCN3
+		DPP_CLOCK_ENABLE, &s->is_enabled);
+	// Pre-degamma (ROM)
+	REG_GET_2(PRE_DEGAM,
+		  PRE_DEGAM_MODE, &s->pre_dgam_mode,
+		  PRE_DEGAM_SELECT, &s->pre_dgam_select);
+	// Gamma Correction (RAM)
+	REG_GET(CM_GAMCOR_CONTROL,
+		CM_GAMCOR_MODE_CURRENT, &s->gamcor_mode);
+	if (s->gamcor_mode) {
+		REG_GET(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT_CURRENT, &gamcor_lut_mode);
+		if (!gamcor_lut_mode)
+			s->gamcor_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
+	}
+	// Shaper LUT (RAM), 3D LUT (mode, bit-depth, size)
+	REG_GET(CM_SHAPER_CONTROL,
+		CM_SHAPER_LUT_MODE, &s->shaper_lut_mode);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_MODE_CURRENT, &s->lut3d_mode);
+	REG_GET(CM_3DLUT_READ_WRITE_CONTROL,
+		CM_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_SIZE, &s->lut3d_size);
+	// Gamut Remap Matrix (3x4)
+	REG_GET(CM_GAMUT_REMAP_CONTROL,
+		CM_GAMUT_REMAP_MODE, &s->gamut_remap_mode);
+	if (s->gamut_remap_mode) {
+		s->gamut_remap_c11_c12 = REG_READ(CM_GAMUT_REMAP_C11_C12);
+		s->gamut_remap_c13_c14 = REG_READ(CM_GAMUT_REMAP_C13_C14);
+		s->gamut_remap_c21_c22 = REG_READ(CM_GAMUT_REMAP_C21_C22);
+		s->gamut_remap_c23_c24 = REG_READ(CM_GAMUT_REMAP_C23_C24);
+		s->gamut_remap_c31_c32 = REG_READ(CM_GAMUT_REMAP_C31_C32);
+		s->gamut_remap_c33_c34 = REG_READ(CM_GAMUT_REMAP_C33_C34);
+	}
+	// Blend/Out Gamma (RAM)
+	REG_GET(CM_BLNDGAM_CONTROL,
+		CM_BLNDGAM_MODE_CURRENT, &s->rgam_lut_mode);
+	if (s->rgam_lut_mode){
+		REG_GET(CM_BLNDGAM_CONTROL, CM_BLNDGAM_SELECT_CURRENT, &rgam_lut_mode);
+		if (!rgam_lut_mode)
+			s->rgam_lut_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
+	}
 }
 /*program post scaler scs block in dpp CM*/
 void dpp3_program_post_csc(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index f4aa76e02518..1dfe08dc4364 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -148,6 +148,14 @@ struct dcn_dpp_state {
 	uint32_t gamut_remap_c23_c24;
 	uint32_t gamut_remap_c31_c32;
 	uint32_t gamut_remap_c33_c34;
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
2.40.1

