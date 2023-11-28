Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 539107FC0E2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AF410E5A6;
	Tue, 28 Nov 2023 17:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7910110E599;
 Tue, 28 Nov 2023 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3epQ2D6VA9TKOT3i+iWm9xzwNeeawEwZASng5M4gvhw=; b=NTwzcz5KMOeWpOYp167VI7I1+W
 usudIJeEovvBzHMk9Tx8rDHHCzqUIDEni6nh93X0z07Z4Ce/LE4qi+CstNK8ZDZr2CwaHmOifATlv
 oxTbI+71MJxi46hFn4DAr77Uk6nfku8Q+tzoAVCvCuwLZt6oyXka6fm546iCHuWVOYlba91rNlDhn
 ae1Nk5I2bw4BbfVh1iGzUNfu5DYDYXiLtve08BahV4pFNJ0iq4xojyeytB/smlyuXx6mBSJheCOmY
 QjndHKiUHbqX9wTvUzL18nvcjd/JOgQjWSxuDciCgEUvse5pt1SZFxFQMSlUkzVVt7ZDgq0JM1pAN
 pAaIyD6Q==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82K5-0087Bf-8d; Tue, 28 Nov 2023 18:56:37 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 6/9] drm/amd/display: create DCN3-specific log for MPC state
Date: Tue, 28 Nov 2023 16:52:54 -0100
Message-ID: <20231128175623.121356-7-mwen@igalia.com>
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

Logging DCN3 MPC state was following DCN1 implementation that doesn't
consider new DCN3 MPC color blocks. Create new elements according to
DCN3 MPC color caps and a new DCN3-specific function for reading MPC
data.

v3:
- remove gamut remap reg reading in favor of fixed31_32 matrix data

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 48 ++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  7 +++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index a6a4c3413f89..bf3386cd444d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -1440,8 +1440,54 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
 	}
 }
 
+static void mpc3_read_mpcc_state(
+		struct mpc *mpc,
+		int mpcc_inst,
+		struct mpcc_state *s)
+{
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+	uint32_t rmu_status = 0xf;
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
+	REG_GET(MPC_RMU_CONTROL, MPC_RMU0_MUX_STATUS, &rmu_status);
+
+	if (rmu_status == mpcc_inst) {
+		REG_GET(SHAPER_CONTROL[0],
+			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
+		REG_GET(RMU_3DLUT_MODE[0],
+			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
+		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[0],
+			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+		REG_GET(RMU_3DLUT_MODE[0],
+			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
+	} else {
+		REG_GET(SHAPER_CONTROL[1],
+			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
+		REG_GET(RMU_3DLUT_MODE[1],
+			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
+		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[1],
+			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+		REG_GET(RMU_3DLUT_MODE[1],
+			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
+	}
+
+        REG_GET_2(MPCC_OGAM_CONTROL[mpcc_inst],
+		  MPCC_OGAM_MODE_CURRENT, &s->rgam_mode,
+		  MPCC_OGAM_SELECT_CURRENT, &s->rgam_lut);
+}
+
 static const struct mpc_funcs dcn30_mpc_funcs = {
-	.read_mpcc_state = mpc1_read_mpcc_state,
+	.read_mpcc_state = mpc3_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
 	.mpc_init = mpc1_mpc_init,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 61a2406dcc53..a11e40fddc44 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -199,6 +199,13 @@ struct mpcc_state {
 	uint32_t overlap_only;
 	uint32_t idle;
 	uint32_t busy;
+	uint32_t shaper_lut_mode;
+	uint32_t lut3d_mode;
+	uint32_t lut3d_bit_depth;
+	uint32_t lut3d_size;
+	uint32_t rgam_mode;
+	uint32_t rgam_lut;
+	struct mpc_grph_gamut_adjustment gamut_remap;
 };
 
 /**
-- 
2.42.0

