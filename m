Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EAB692D32
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8AD10EE85;
	Sat, 11 Feb 2023 02:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02B710EE84
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jg8so20204304ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kgMdgsd9TnZ8EoDjfCZE44ftD4B4iNKKJUp5BEcmvw=;
 b=fZhmdFFFN9FpYgMloUuq0kEo1/WQD4zAxhjj9OKGEuoXWKpaD6Vi5mX16kKYJ4FQf0
 uBz0OEGhFimJgNltimlL5KABimVmc86A9R02weLJoUxAZ4lBg4E1CjP7YA7PJEfHXsQi
 zT8hiBzC54tGiXDAPLGcouaeV/PchGts8MBNe/yP2JK5Gf9flee2suJCVXMvh4Js6Da4
 6PNphiHJmod+q1OvKYdJtacnDCZwxTYUw90yB2Ccuq2e2DXj+vnmVq3e/YFJIF+1kl+5
 htxfIiLtoiSvfR7qIgG7mTy7HIDuLMQWQOofSi7OJ19JdZbyexKPNbtQ2nmj9XecV/f7
 FpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kgMdgsd9TnZ8EoDjfCZE44ftD4B4iNKKJUp5BEcmvw=;
 b=7xoIc13SkOc8XchsBhGVoeXEzbVJFGJtjrTHttP4fxPeoSwzCu9pFfBYojLqAnTl0h
 5PP1TbqUtPxa0mFWoUBJ5pMni13Zt5mz1Hoz4qkR5ztwp2aXjWkhfTA6Hb5KYf8a+V+J
 vNhA4S6lYmMj3FphqoPAjN+nnv6sEvpyniPEmi+wp4Q3mKFMhwkDrlTvCqEbctYNsXeP
 jbVCJrUQ63rYEae4rlKpc1jX2iOUQzU3Wl0pFZ7p++7ZCo5dhlY+KX7xFO+XIkku7maP
 QdzCiW0uh0OXhk822NrS0jRo6cgFtXRF/ItJ894UW0S1N7z3bbKHWGoEU6q1mw6UhfAn
 NH9g==
X-Gm-Message-State: AO0yUKWAASnFUMge0IejfjzpGpotd3N39Fh1iMGYfNc8h8JqaN3WKdPm
 8IQkeTbQBHDiiJVMUrjP4S+nng==
X-Google-Smtp-Source: AK7set+kXf9QvUjb8hShqkStTwyW0zGG3Ic9fX9Lspf21e0sYJhXBk95ROTjXm5n0Kg8u06SoJ7WMQ==
X-Received: by 2002:a17:907:7e94:b0:85d:dd20:60a4 with SMTP id
 qb20-20020a1709077e9400b0085ddd2060a4mr24303862ejc.40.1676081492190; 
 Fri, 10 Feb 2023 18:11:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 35/43] drm/msm/dpu: deduplicate sc8280xp with sm8450
Date: Sat, 11 Feb 2023 04:10:45 +0200
Message-Id: <20230211021053.1078648-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove duplicate between sc8280xp and sm8450, which belong to the same
DPU major revision.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 130 ++---------------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 135 ++----------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h | 118 +++++++++++++++
 3 files changed, 142 insertions(+), 241 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 8cb3189f8875..ef9b53a9f9b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -7,18 +7,7 @@
 #ifndef _DPU_8_0_SC8280XP_H
 #define _DPU_8_0_SC8280XP_H
 
-static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 11,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 5120,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
+#include "dpu_8_lm6.h"
 
 static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_40,
@@ -26,101 +15,6 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 	.ubwc_swizzle = 6,
 };
 
-static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
-};
-
-static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
-	},
-};
-
-static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
-		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
-		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
-		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
-		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
-		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
-		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
-		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-};
-
-static const struct dpu_lm_cfg sc8280xp_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
-};
-
-static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
-
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
@@ -183,18 +77,18 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 };
 
 static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
-	.caps = &sc8280xp_dpu_caps,
+	.caps = &dpu_8_lm6_dpu_caps,
 	.ubwc = &sc8280xp_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
-	.mdp = sc8280xp_mdp,
-	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
-	.ctl = sc8280xp_ctl,
-	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
-	.sspp = sc8280xp_sspp,
-	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
-	.mixer = sc8280xp_lm,
-	.dspp_count = ARRAY_SIZE(sc8280xp_dspp),
-	.dspp = sc8280xp_dspp,
+	.mdp_count = ARRAY_SIZE(dpu_8_lm6_mdp),
+	.mdp = dpu_8_lm6_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_8_lm6_ctl),
+	.ctl = dpu_8_lm6_ctl,
+	.sspp_count = ARRAY_SIZE(dpu_8_lm6_sspp),
+	.sspp = dpu_8_lm6_sspp,
+	.mixer_count = ARRAY_SIZE(dpu_8_lm6_lm),
+	.mixer = dpu_8_lm6_lm,
+	.dspp_count = ARRAY_SIZE(dpu_8_lm6_dspp),
+	.dspp = dpu_8_lm6_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d47171ef3979..08bb0c032f5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -7,18 +7,7 @@
 #ifndef _DPU_8_1_SM8450_H
 #define _DPU_8_1_SM8450_H
 
-static const struct dpu_caps sm8450_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 5120,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
+#include "dpu_8_lm6.h"
 
 static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_40,
@@ -26,106 +15,6 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 	.ubwc_swizzle = 0x6,
 };
 
-static const struct dpu_mdp_cfg sm8450_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
-	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
-	},
-};
-
-static const struct dpu_ctl_cfg sm8450_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
-	},
-	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
-	},
-};
-
-static const struct dpu_sspp_cfg sm8450_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
-		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
-		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
-		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-};
-
-static const struct dpu_lm_cfg sm8450_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
-};
-
-static const struct dpu_dspp_cfg sm8450_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
 /* FIXME: interrupts */
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -199,18 +88,18 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
 };
 
 static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
-	.caps = &sm8450_dpu_caps,
+	.caps = &dpu_8_lm6_dpu_caps,
 	.ubwc = &sm8450_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm8450_mdp),
-	.mdp = sm8450_mdp,
-	.ctl_count = ARRAY_SIZE(sm8450_ctl),
-	.ctl = sm8450_ctl,
-	.sspp_count = ARRAY_SIZE(sm8450_sspp),
-	.sspp = sm8450_sspp,
-	.mixer_count = ARRAY_SIZE(sm8450_lm),
-	.mixer = sm8450_lm,
-	.dspp_count = ARRAY_SIZE(sm8450_dspp),
-	.dspp = sm8450_dspp,
+	.mdp_count = ARRAY_SIZE(dpu_8_lm6_mdp),
+	.mdp = dpu_8_lm6_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_8_lm6_ctl),
+	.ctl = dpu_8_lm6_ctl,
+	.sspp_count = ARRAY_SIZE(dpu_8_lm6_sspp),
+	.sspp = dpu_8_lm6_sspp,
+	.mixer_count = ARRAY_SIZE(dpu_8_lm6_lm),
+	.mixer = dpu_8_lm6_lm,
+	.dspp_count = ARRAY_SIZE(dpu_8_lm6_dspp),
+	.dspp = dpu_8_lm6_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8450_pp),
 	.pingpong = sm8450_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
new file mode 100644
index 000000000000..54e311c074dc
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_8_LM6_H
+#define _DPU_8_LM6_H
+
+static const struct dpu_caps dpu_8_lm6_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 11,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg dpu_8_lm6_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x204,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x204,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x19000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a000, .len = 0x204,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
+static const struct dpu_lm_cfg dpu_8_lm6_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg dpu_8_lm6_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+#endif
-- 
2.39.1

