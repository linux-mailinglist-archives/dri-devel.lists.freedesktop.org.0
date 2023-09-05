Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3979237B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DFB10E538;
	Tue,  5 Sep 2023 14:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47CE10E532;
 Tue,  5 Sep 2023 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QLX7651WP/di2UupuPM6pAWhGNGlxMnnSysfYFPg1Qw=; b=NuCJzTSt3y0+NbiOwFBn4U2/39
 5LKZbsP0tgTZxc0fn5kpwchDH9B30OIIskLZK33EUhNS7xT7muskpN4Y4MobpGtwNt/esCUNTzlqa
 D2R8maLw0POKWAyDjW96/Pms7302xnti/tOY3wHq1BMs7zLWMGRTF/IOWT8yzG2z+zS8FSqbD9rW3
 UDn8uRZbEXdZW8s5sJ39YVRq8zlC5CBEyZMDwowpot86KUE9iKikRQ0taUJn/xdoSb2pn6iqg9BsK
 fedetYBafF2TBKn1RiUU9KuZy8QCHBXcaahlMzYdxrAy0k6ALyK4J0DqKM8gKFV8GhgSkFdPDn/t7
 VvqUXTMQ==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdX04-002cXU-Dc; Tue, 05 Sep 2023 16:25:52 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 3/5] drm/amd/display: create DCN3-specific log for MPC
 state
Date: Tue,  5 Sep 2023 13:25:43 -0100
Message-Id: <20230905142545.451153-4-mwen@igalia.com>
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

Logging DCN3 MPC state was following DCN1 implementation that doesn't
consider new DCN3 MPC color blocks. Create new elements according to
DCN3 MPC color caps and a new DCN3-specific function for reading MPC
data.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 55 ++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 13 +++++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index d1500b223858..d164fbf89212 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -1382,8 +1382,61 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
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
+         REG_GET_2(MPCC_OGAM_CONTROL[mpcc_inst],
+		   MPCC_OGAM_MODE_CURRENT, &s->rgam_mode,
+		   MPCC_OGAM_SELECT_CURRENT, &s->rgam_lut);
+	REG_GET(MPCC_GAMUT_REMAP_MODE[mpcc_inst],
+		MPCC_GAMUT_REMAP_MODE_CURRENT, &s->gamut_remap_mode);
+	if (s->gamut_remap_mode == 1) {
+		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_A[mpcc_inst]);
+		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_A[mpcc_inst]);
+	} else if (s->gamut_remap_mode == 2) {
+		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_B[mpcc_inst]);
+		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_B[mpcc_inst]);
+	}
+}
+
 static const struct mpc_funcs dcn30_mpc_funcs = {
-	.read_mpcc_state = mpc1_read_mpcc_state,
+	.read_mpcc_state = mpc3_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
 	.mpc_init = mpc1_mpc_init,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 8d86159d9de0..e60b3503605b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -193,6 +193,19 @@ struct mpcc_state {
 	uint32_t overlap_only;
 	uint32_t idle;
 	uint32_t busy;
+	uint32_t shaper_lut_mode;
+	uint32_t lut3d_mode;
+	uint32_t lut3d_bit_depth;
+	uint32_t lut3d_size;
+	uint32_t rgam_mode;
+	uint32_t rgam_lut;
+	uint32_t gamut_remap_mode;
+	uint32_t gamut_remap_c11_c12;
+	uint32_t gamut_remap_c13_c14;
+	uint32_t gamut_remap_c21_c22;
+	uint32_t gamut_remap_c23_c24;
+	uint32_t gamut_remap_c31_c32;
+	uint32_t gamut_remap_c33_c34;
 };
 
 /**
-- 
2.40.1

