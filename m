Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7C85E74F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 20:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2C10E23B;
	Wed, 21 Feb 2024 19:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="osJYnjDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABE810E28C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 19:31:19 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6da4a923b1bso5960112b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 11:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1708543879; x=1709148679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wil8gjSyTnU+pz7pK0gmQPP7ZNjidWBs2035hdRRsNo=;
 b=osJYnjDiBAYcHcPxOxHu90zZDTJdro6LQIpQ6iA1yH1prrxcQC6hLPjV3VC357Zyp0
 JA6ogdFOiSL0Xcb3i7ho9WAeSc1oY61StCA8j1XPY/6yWJPvU2PZC8aYz1oWSNDQbjiP
 lwx4GC66luAfzhlf479NzCVWfq28MCtb9OQjkoHCMvZGG5wqWBCfoR1IBcLT23QxqsgE
 fOFNO3yJbnDR+hAxWFwbAxf9JUOrGFACCzVjX3OAxZ+KDBeFRupEtM0n0B3d42zL5MYn
 Ng6FGEJ0B+pm11kX0zXq7ZOVZ+eoFq4LAY58SvSeUo6oJKcnT9lMjGGcS6aZefQtx3HJ
 DvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708543879; x=1709148679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wil8gjSyTnU+pz7pK0gmQPP7ZNjidWBs2035hdRRsNo=;
 b=VsDjI4XjR6Q9JpolFe7cMl7zhsUEGrvX0U9X9apjDMNJUuj9MT6yPPd4kUXPHOCdOe
 5K5SOisS83r3VWpAwUVI7Pld+DQi0xlUuxadmf6UE9nVrpiBwSzyxiJl/wRtZa1Jf58Z
 TvWATZ/yazNPM9FY0lwdLLBMrTqBv8uZbJ+Svcsw3o9ldPlacwWd3UhyEZ7vTrTAUCsj
 B9FAHyBPFaNQZds1L0L/yX3TNxASTkHtZ/TjHdrdbEKEI9nzseqjEZ16ST35LoSKwBhC
 3b4ezUCtoiGpps/LCiSnt1Zya0Ws7w5YCWVJwFAH10kwCvlTlNrrhGv8PMOV5vrf0e2o
 rBUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+OkLqWXx1/+v+1IBONho8Xfu+pVmXqS/3eJ41CWt+s5iEf94RfpkmFG2h2OHL++H8wHe0lb+eUhuAKgGA/uaZ6ndfz/OHtRHU0k65nqVj
X-Gm-Message-State: AOJu0Yx4lofSi6KpWXPXuaWTmFNB2sCCBQMz3Px/nYDNATphGnvD5j9P
 UNS/PA92LhkJFp1rx8fLKbdqR3B5P/BJLeXhemipiUklIT+33K/zRnokSxGeyA==
X-Google-Smtp-Source: AGHT+IHfXvxljzo3xaI0pUgJGFesNa7+zmxi1kE/L1RRj9v4JAJkaahqVIPUbfIVPPMvudIDHMXCyQ==
X-Received: by 2002:a05:6a21:3941:b0:1a0:885e:9706 with SMTP id
 ac1-20020a056a21394100b001a0885e9706mr15395464pzc.18.1708543879328; 
 Wed, 21 Feb 2024 11:31:19 -0800 (PST)
Received: from fedora.. ([2804:7f4:8280:eeaa:1a2:221e:6fb4:f083])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a056a0000c800b006d98ae070c3sm2445093pfj.135.2024.02.21.11.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 11:31:18 -0800 (PST)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Joao Paulo Pereira da Silva <jppaulo11@usp.br>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Add prefix to functions inside
 dnc10_cm_common.h
Date: Wed, 21 Feb 2024 16:27:19 -0300
Message-ID: <20240221192812.23038-1-jppaulo11@usp.br>
X-Mailer: git-send-email 2.43.0
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

While debugging with ftrace, it's useful to create filters to search
within the codebase. However, since some function names lack prefixes,
creating a good filter may become more difficult.

Because of this, add prefix to functions declared inside the header
dcn10/dcn10_cm_common.h to facilitate creating good filters for the
functions declared inside the file.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 .../drm/amd/display/dc/dcn10/dcn10_cm_common.c | 12 ++++++------
 .../drm/amd/display/dc/dcn10/dcn10_cm_common.h |  8 ++++----
 .../drm/amd/display/dc/dcn10/dcn10_dpp_cm.c    | 18 +++++++++---------
 .../drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |  8 ++++----
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |  8 ++++----
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  2 +-
 .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |  4 ++--
 .../drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |  6 +++---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  8 ++++----
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  6 +++---
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  2 +-
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  2 +-
 13 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
index 3538973bd0c6..3878b78faf89 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
@@ -38,7 +38,7 @@
 #define FN(reg_name, field_name) \
 	reg->shifts.field_name, reg->masks.field_name
 
-void cm_helper_program_color_matrices(
+void dcn10_cm_common_helper_program_color_matrices(
 		struct dc_context *ctx,
 		const uint16_t *regval,
 		const struct color_matrices_reg *reg)
@@ -62,7 +62,7 @@ void cm_helper_program_color_matrices(
 
 }
 
-void cm_helper_program_xfer_func(
+void dcn10_cm_common_helper_program_xfer_func(
 		struct dc_context *ctx,
 		const struct pwl_params *params,
 		const struct xfer_func_reg *reg)
@@ -125,7 +125,7 @@ void cm_helper_program_xfer_func(
 
 
 
-bool cm_helper_convert_to_custom_float(
+bool dcn10_cm_common_helper_convert_to_custom_float(
 		struct pwl_result_data *rgb_resulted,
 		struct curve_points3 *corner_points,
 		uint32_t hw_points_num,
@@ -311,7 +311,7 @@ bool cm_helper_convert_to_custom_float(
 #define DC_LOGGER \
 		ctx->logger
 
-bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
+bool dcn10_cm_common_helper_translate_curve_to_hw_format(struct dc_context *ctx,
 				const struct dc_transfer_func *output_tf,
 				struct pwl_params *lut_params, bool fixpoint)
 {
@@ -507,7 +507,7 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
 		++rgb;
 		++i;
 	}
-	cm_helper_convert_to_custom_float(rgb_resulted,
+	dcn10_cm_common_helper_convert_to_custom_float(rgb_resulted,
 						lut_params->corner_points,
 						hw_points, fixpoint);
 
@@ -653,7 +653,7 @@ bool cm_helper_translate_curve_to_degamma_hw_format(
 		++rgb;
 		++i;
 	}
-	cm_helper_convert_to_custom_float(rgb_resulted,
+	dcn10_cm_common_helper_convert_to_custom_float(rgb_resulted,
 						lut_params->corner_points,
 						hw_points, false);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
index 0a68b63d6126..0622dbdbe84b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
@@ -89,23 +89,23 @@ struct color_matrices_reg{
 	uint32_t csc_c33_c34;
 };
 
-void cm_helper_program_color_matrices(
+void dcn10_cm_common_helper_program_color_matrices(
 		struct dc_context *ctx,
 		const uint16_t *regval,
 		const struct color_matrices_reg *reg);
 
-void cm_helper_program_xfer_func(
+void dcn10_cm_common_helper_program_xfer_func(
 		struct dc_context *ctx,
 		const struct pwl_params *params,
 		const struct xfer_func_reg *reg);
 
-bool cm_helper_convert_to_custom_float(
+bool dcn10_cm_common_helper_convert_to_custom_float(
 		struct pwl_result_data *rgb_resulted,
 		struct curve_points3 *corner_points,
 		uint32_t hw_points_num,
 		bool fixpoint);
 
-bool cm_helper_translate_curve_to_hw_format(
+bool dcn10_cm_common_helper_translate_curve_to_hw_format(
 		struct dc_context *ctx,
 		const struct dc_transfer_func *output_tf,
 		struct pwl_params *lut_params, bool fixpoint);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
index 904c2d278998..b5cd5f17bc63 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
@@ -125,7 +125,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_C11_C12);
 		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dpp->base.ctx,
 				regval,
 				&gam_regs);
@@ -135,7 +135,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(CM_COMA_C11_C12);
 		gam_regs.csc_c33_c34 = REG(CM_COMA_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dpp->base.ctx,
 				regval,
 				&gam_regs);
@@ -145,7 +145,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(CM_COMB_C11_C12);
 		gam_regs.csc_c33_c34 = REG(CM_COMB_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dpp->base.ctx,
 				regval,
 				&gam_regs);
@@ -227,7 +227,7 @@ static void dpp1_cm_program_color_matrix(
 
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			dpp->base.ctx,
 			regval,
 			&gam_regs);
@@ -385,7 +385,7 @@ void dpp1_cm_program_regamma_luta_settings(
 	gam_regs.region_start = REG(CM_RGAM_RAMA_REGION_0_1);
 	gam_regs.region_end = REG(CM_RGAM_RAMA_REGION_32_33);
 
-	cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
 
 }
 
@@ -414,7 +414,7 @@ void dpp1_cm_program_regamma_lutb_settings(
 	gam_regs.region_start = REG(CM_RGAM_RAMB_REGION_0_1);
 	gam_regs.region_end = REG(CM_RGAM_RAMB_REGION_32_33);
 
-	cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
 }
 
 void dpp1_program_input_csc(
@@ -483,7 +483,7 @@ void dpp1_program_input_csc(
 
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			dpp->base.ctx,
 			regval,
 			&gam_regs);
@@ -539,7 +539,7 @@ void dpp1_program_degamma_lutb_settings(
 	gam_regs.region_end = REG(CM_DGAM_RAMB_REGION_14_15);
 
 
-	cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
 }
 
 /*program de gamma RAM A*/
@@ -567,7 +567,7 @@ void dpp1_program_degamma_luta_settings(
 	gam_regs.region_start = REG(CM_DGAM_RAMA_REGION_0_1);
 	gam_regs.region_end = REG(CM_DGAM_RAMA_REGION_14_15);
 
-	cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
 }
 
 void dpp1_power_on_degamma_lut(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
index 598caa508d43..254eb6a5844f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
@@ -199,7 +199,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_B_C33_C34);
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 				dpp->base.ctx,
 				regval,
 				&gam_regs);
@@ -298,7 +298,7 @@ void dpp2_program_input_csc(
 
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			dpp->base.ctx,
 			regval,
 			&icsc_regs);
@@ -407,7 +407,7 @@ static void dpp20_program_blnd_luta_settings(
 	gam_regs.region_start = REG(CM_BLNDGAM_RAMA_REGION_0_1);
 	gam_regs.region_end = REG(CM_BLNDGAM_RAMA_REGION_32_33);
 
-	cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
 }
 
 /*program blnd lut RAM B*/
@@ -435,7 +435,7 @@ static void dpp20_program_blnd_lutb_settings(
 	gam_regs.region_start = REG(CM_BLNDGAM_RAMB_REGION_0_1);
 	gam_regs.region_end = REG(CM_BLNDGAM_RAMB_REGION_32_33);
 
-	cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
 }
 
 static enum dc_lut_mode dpp20_get_blndgam_current(struct dpp *dpp_base)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
index 5da6e44f284a..e697bf79d14d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
@@ -174,7 +174,7 @@ void mpc2_set_output_csc(
 		ocsc_regs.csc_c33_c34 = REG(CSC_C33_C34_B[opp_id]);
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			mpc20->base.ctx,
 			regval,
 			&ocsc_regs);
@@ -233,7 +233,7 @@ void mpc2_set_ocsc_default(
 		ocsc_regs.csc_c33_c34 = REG(CSC_C33_C34_B[opp_id]);
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			mpc20->base.ctx,
 			regval,
 			&ocsc_regs);
@@ -342,7 +342,7 @@ static void mpc2_program_lutb(struct mpc *mpc, int mpcc_id,
 	gam_regs.region_start = REG(MPCC_OGAM_RAMB_REGION_0_1[mpcc_id]);
 	gam_regs.region_end = REG(MPCC_OGAM_RAMB_REGION_32_33[mpcc_id]);
 
-	cm_helper_program_xfer_func(mpc20->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(mpc20->base.ctx, params, &gam_regs);
 
 }
 
@@ -369,7 +369,7 @@ static void mpc2_program_luta(struct mpc *mpc, int mpcc_id,
 	gam_regs.region_start = REG(MPCC_OGAM_RAMA_REGION_0_1[mpcc_id]);
 	gam_regs.region_end = REG(MPCC_OGAM_RAMA_REGION_32_33[mpcc_id]);
 
-	cm_helper_program_xfer_func(mpc20->base.ctx, params, &gam_regs);
+	dcn10_cm_common_helper_program_xfer_func(mpc20->base.ctx, params, &gam_regs);
 
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 11f7746f3a65..4026e2034818 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -114,7 +114,7 @@ void dpp3_program_post_csc(
 
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			dpp->base.ctx,
 			regval,
 			&gam_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
index e43f77c11c00..d19b0f47a6b0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
@@ -351,7 +351,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_C11_C12);
 		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dpp->base.ctx,
 				regval,
 				&gam_regs);
@@ -361,7 +361,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(CM_GAMUT_REMAP_B_C11_C12);
 		gam_regs.csc_c33_c34 = REG(CM_GAMUT_REMAP_B_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dpp->base.ctx,
 				regval,
 				&gam_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
index 03a50c32fcfe..560d31c96fe0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
@@ -283,7 +283,7 @@ bool dwb3_ogam_set_input_transfer_func(
 	dwb_ogam_lut = kzalloc(sizeof(*dwb_ogam_lut), GFP_KERNEL);
 
 	if (dwb_ogam_lut) {
-		cm_helper_translate_curve_to_hw_format(dwbc->ctx,
+		dcn10_cm_common_helper_translate_curve_to_hw_format(dwbc->ctx,
 			in_transfer_func_dwb_ogam,
 			dwb_ogam_lut, false);
 
@@ -325,7 +325,7 @@ static void dwb3_program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(DWB_GAMUT_REMAPA_C11_C12);
 		gam_regs.csc_c33_c34 = REG(DWB_GAMUT_REMAPA_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dwbc30->base.ctx,
 				regval,
 				&gam_regs);
@@ -334,7 +334,7 @@ static void dwb3_program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(DWB_GAMUT_REMAPB_C11_C12);
 		gam_regs.csc_c33_c34 = REG(DWB_GAMUT_REMAPB_C33_C34);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				dwbc30->base.ctx,
 				regval,
 				&gam_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index d1500b223858..37a1550e56d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -1073,7 +1073,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(MPC_GAMUT_REMAP_C11_C12_A[mpcc_id]);
 		gam_regs.csc_c33_c34 = REG(MPC_GAMUT_REMAP_C33_C34_A[mpcc_id]);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				mpc30->base.ctx,
 				regval,
 				&gam_regs);
@@ -1083,7 +1083,7 @@ static void program_gamut_remap(
 		gam_regs.csc_c11_c12 = REG(MPC_GAMUT_REMAP_C11_C12_B[mpcc_id]);
 		gam_regs.csc_c33_c34 = REG(MPC_GAMUT_REMAP_C33_C34_B[mpcc_id]);
 
-		cm_helper_program_color_matrices(
+		dcn10_cm_common_helper_program_color_matrices(
 				mpc30->base.ctx,
 				regval,
 				&gam_regs);
@@ -1247,7 +1247,7 @@ void mpc3_set_output_csc(
 		ocsc_regs.csc_c11_c12 = REG(CSC_C11_C12_B[opp_id]);
 		ocsc_regs.csc_c33_c34 = REG(CSC_C33_C34_B[opp_id]);
 	}
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			mpc30->base.ctx,
 			regval,
 			&ocsc_regs);
@@ -1291,7 +1291,7 @@ void mpc3_set_ocsc_default(
 		ocsc_regs.csc_c33_c34 = REG(CSC_C33_C34_B[opp_id]);
 	}
 
-	cm_helper_program_color_matrices(
+	dcn10_cm_common_helper_program_color_matrices(
 			mpc30->base.ctx,
 			regval,
 			&ocsc_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 6dd479e8a348..942e6cc5b23c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -1853,7 +1853,7 @@ bool dcn10_set_output_transfer_func(struct dc *dc, struct pipe_ctx *pipe_ctx,
 	/* dcn10_translate_regamma_to_hw_format takes 750us, only do it when full
 	 * update.
 	 */
-	else if (cm_helper_translate_curve_to_hw_format(dc->ctx,
+	else if (dcn10_cm_common_helper_translate_curve_to_hw_format(dc->ctx,
 			stream->out_transfer_func,
 			&dpp->regamma_params, false)) {
 		dpp->funcs->dpp_program_regamma_pwl(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 4853ecac53f9..d01f2434d7be 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -921,7 +921,7 @@ bool dcn20_set_output_transfer_func(struct dc *dc, struct pipe_ctx *pipe_ctx,
 			params = &stream->out_transfer_func->pwl;
 		else if (pipe_ctx->stream->out_transfer_func->type ==
 			TF_TYPE_DISTRIBUTED_POINTS &&
-			cm_helper_translate_curve_to_hw_format(dc->ctx,
+			dcn10_cm_common_helper_translate_curve_to_hw_format(dc->ctx,
 			stream->out_transfer_func,
 			&mpc->blender_params, false))
 			params = &mpc->blender_params;
@@ -950,7 +950,7 @@ bool dcn20_set_blend_lut(
 		if (plane_state->blend_tf->type == TF_TYPE_HWPWL)
 			blend_lut = &plane_state->blend_tf->pwl;
 		else if (plane_state->blend_tf->type == TF_TYPE_DISTRIBUTED_POINTS) {
-			cm_helper_translate_curve_to_hw_format(plane_state->ctx,
+			dcn10_cm_common_helper_translate_curve_to_hw_format(plane_state->ctx,
 					plane_state->blend_tf,
 					&dpp_base->regamma_params, false);
 			blend_lut = &dpp_base->regamma_params;
@@ -972,7 +972,7 @@ bool dcn20_set_shaper_3dlut(
 		if (plane_state->in_shaper_func->type == TF_TYPE_HWPWL)
 			shaper_lut = &plane_state->in_shaper_func->pwl;
 		else if (plane_state->in_shaper_func->type == TF_TYPE_DISTRIBUTED_POINTS) {
-			cm_helper_translate_curve_to_hw_format(plane_state->ctx,
+			dcn10_cm_common_helper_translate_curve_to_hw_format(plane_state->ctx,
 					plane_state->in_shaper_func,
 					&dpp_base->shaper_params, true);
 			shaper_lut = &dpp_base->shaper_params;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index c34c13e1e0a4..4f31af5bdff6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -106,7 +106,7 @@ static bool dcn30_set_mpc_shaper_3dlut(struct pipe_ctx *pipe_ctx,
 		if (stream->func_shaper->type == TF_TYPE_HWPWL) {
 			shaper_lut = &stream->func_shaper->pwl;
 		} else if (stream->func_shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
-			cm_helper_translate_curve_to_hw_format(stream->ctx, stream->func_shaper,
+			dcn10_cm_common_helper_translate_curve_to_hw_format(stream->ctx, stream->func_shaper,
 							       &dpp_base->shaper_params, true);
 			shaper_lut = &dpp_base->shaper_params;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index 6c9299c7683d..06ca6b8a2dc7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -446,7 +446,7 @@ bool dcn32_set_mpc_shaper_3dlut(
 		if (stream->func_shaper->type == TF_TYPE_HWPWL)
 			shaper_lut = &stream->func_shaper->pwl;
 		else if (stream->func_shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
-			cm_helper_translate_curve_to_hw_format(stream->ctx,
+			dcn10_cm_common_helper_translate_curve_to_hw_format(stream->ctx,
 					stream->func_shaper,
 					&dpp_base->shaper_params, true);
 			shaper_lut = &dpp_base->shaper_params;
-- 
2.43.0

