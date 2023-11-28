Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F77FC0DA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D35D10E59E;
	Tue, 28 Nov 2023 17:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFEC10E2FD;
 Tue, 28 Nov 2023 17:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iyNEss5RZFJ0ikgyV0qyUc9PcakRWbZTUYKd2vlA8JM=; b=Lt85mt+TEcgjVRwD6POq0QKBYk
 Lp4tfY12KKQbj4n3U5iapIiOIWrUBLx2cP85TNYFbDu2yQAmrzJRR9O5nPaUkNxU1eoCr/b1ZWRIA
 qPMzVfJuUnzOEjrg/XF2JQd2kC64Ya8gRgKXcv4o+wk3HykcCtDj47XOJb8uJIkO1ISM5Y67Qj0EU
 V95CoyWpFD2oa5AgFl87O4XDKzBlWZvhQNx7p+2ddmcvDGpZJn7H2nrRPfh0/rbVBI1sx9OmNrUnw
 8sPe6U0UlISR+pjGab3cQX6JyrU6PsD6iYg6kuqVs7j8gEiia37euvYL8Mf5NoWpAdeaZ78BUsbHq
 HlsFo2xQ==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82K3-0087Bf-Hb; Tue, 28 Nov 2023 18:56:35 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 5/9] drm/amd/display: add get_gamut_remap helper for MPC3
Date: Tue, 28 Nov 2023 16:52:53 -0100
Message-ID: <20231128175623.121356-6-mwen@igalia.com>
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

We want to be able to read the MPC's gamut remap matrix similar to
what we do with .dpp_get_gamut_remap functions. On the other hand, we
don't need a hook here because only DCN3+ has the MPC gamut remap
block, being absent in previous families.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 58 +++++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h  |  4 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index d1500b223858..a6a4c3413f89 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -1129,6 +1129,64 @@ void mpc3_set_gamut_remap(
 	}
 }
 
+static void read_gamut_remap(struct dcn30_mpc *mpc30,
+			     int mpcc_id,
+			     uint16_t *regval,
+			     uint32_t *select)
+{
+	struct color_matrices_reg gam_regs;
+
+	//current coefficient set in use
+	REG_GET(MPCC_GAMUT_REMAP_MODE[mpcc_id], MPCC_GAMUT_REMAP_MODE_CURRENT, select);
+
+	gam_regs.shifts.csc_c11 = mpc30->mpc_shift->MPCC_GAMUT_REMAP_C11_A;
+	gam_regs.masks.csc_c11  = mpc30->mpc_mask->MPCC_GAMUT_REMAP_C11_A;
+	gam_regs.shifts.csc_c12 = mpc30->mpc_shift->MPCC_GAMUT_REMAP_C12_A;
+	gam_regs.masks.csc_c12 = mpc30->mpc_mask->MPCC_GAMUT_REMAP_C12_A;
+
+	if (*select == GAMUT_REMAP_COEFF) {
+		gam_regs.csc_c11_c12 = REG(MPC_GAMUT_REMAP_C11_C12_A[mpcc_id]);
+		gam_regs.csc_c33_c34 = REG(MPC_GAMUT_REMAP_C33_C34_A[mpcc_id]);
+
+		cm_helper_read_color_matrices(
+				mpc30->base.ctx,
+				regval,
+				&gam_regs);
+
+	} else  if (*select == GAMUT_REMAP_COMA_COEFF) {
+
+		gam_regs.csc_c11_c12 = REG(MPC_GAMUT_REMAP_C11_C12_B[mpcc_id]);
+		gam_regs.csc_c33_c34 = REG(MPC_GAMUT_REMAP_C33_C34_B[mpcc_id]);
+
+		cm_helper_read_color_matrices(
+				mpc30->base.ctx,
+				regval,
+				&gam_regs);
+
+	}
+
+}
+
+void mpc3_get_gamut_remap(struct mpc *mpc,
+			  int mpcc_id,
+			  struct mpc_grph_gamut_adjustment *adjust)
+{
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+	uint16_t arr_reg_val[12];
+	int select;
+
+	read_gamut_remap(mpc30, mpcc_id, arr_reg_val, &select);
+
+	if (select == GAMUT_REMAP_BYPASS) {
+		adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
+		return;
+	}
+
+	adjust->gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
+	convert_hw_matrix(adjust->temperature_matrix,
+			  arr_reg_val, ARRAY_SIZE(arr_reg_val));
+}
+
 bool mpc3_program_3dlut(
 		struct mpc *mpc,
 		const struct tetrahedral_params *params,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
index 5198f2167c7c..9cb96ae95a2f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
@@ -1056,6 +1056,10 @@ void mpc3_set_gamut_remap(
 	int mpcc_id,
 	const struct mpc_grph_gamut_adjustment *adjust);
 
+void mpc3_get_gamut_remap(struct mpc *mpc,
+			  int mpcc_id,
+			  struct mpc_grph_gamut_adjustment *adjust);
+
 void mpc3_set_rmu_mux(
 	struct mpc *mpc,
 	int rmu_idx,
-- 
2.42.0

