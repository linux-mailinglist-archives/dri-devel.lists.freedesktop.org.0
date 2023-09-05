Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CB792CB2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40010E369;
	Tue,  5 Sep 2023 17:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8627E10E0DE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:59 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso44071751fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935838; x=1694540638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZJhoPjJurEXvDsgDAjoxQ0slWvUmiiAyqElKYJkmGw=;
 b=wOIzq2Fr3rE6GT7KwJDGU63FU2suoQJlkxSxJrmNwAHRS5AuqaxAdTEBCgIByt/jn/
 aR/KOA/TyMjkWa9VS769gTNWXUMTHCs5Jv5yFY3vxh0N+2eZjgZBpHvSwRRTm/wVI41g
 Y7N29A9BkVZDZAjvPLfMLId+9vxz8wHIWLlPY6e2vZVTVX8CsPmhm3h7JdHV+vjkDOPf
 kJidBkUa+j+9dCRigGGHmQovJdkULtEtRc5PT1H0QSKD/bUrvE+QbeNc77hoATlgMFyd
 qgyYBAfDNDoJGyLyS6/leV6E9Q7GPsVAILUhRwKy9ji8JAjKh+hjXKwOwquv60D6sf6A
 zkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935838; x=1694540638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZJhoPjJurEXvDsgDAjoxQ0slWvUmiiAyqElKYJkmGw=;
 b=QBuHGN3F/ocLoQxSiGQmVojtcv0v+fp7EaWaLV+fWpMqR3lYaLXZI9w7BSwSRV+S38
 PbFxANWszjI9G3zkSp3a/e78FN2zsiLFGmxTuqDZGigrv8up54vet9hfENyq8fgdlucB
 QzgzItCh+mLKhqya71tW7nRFtOtTdG9kDAGYl0DMsjnQ6537839HyDgkmhMsaE71vahY
 4auvc7uCGRvdTFImSrUk9OMBcqi5cSR2ngEUuQgMPZei0yHxcWY/Dti5RLl0Ko8rppDl
 TSmazemvBqHnvpRIUGCrTcryD9ejkCAHTWaGgZ34MPoHKzy/sXfynXs8f3aj7CI14K6x
 MB9g==
X-Gm-Message-State: AOJu0YyyTnC8bJ3/AVxi02ZF5dayufOto+ZvQs4V0k7QME4dl4ZgPrbq
 BkJ7/QyHxaNiJKjgI0G7ODZFRg==
X-Google-Smtp-Source: AGHT+IG0Z1k9WuKTtgF8/09h4vOoE581Q58R1i/Ta9d2+ZMHf+5+pFfCjptfKHBkMJANxFl/neO+UA==
X-Received: by 2002:a2e:b78f:0:b0:2bc:df3f:7140 with SMTP id
 n15-20020a2eb78f000000b002bcdf3f7140mr350059ljo.17.1693935837719; 
 Tue, 05 Sep 2023 10:43:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 5/6] drm/msm/dpu: add support for SDM660 and SDM630 platforms
Date: Tue,  5 Sep 2023 20:43:52 +0300
Message-Id: <20230905174353.3118648-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bring in hardware support for the SDM660 and SDM630 platforms, which
belong to the same DPU generation as MSM8998.

Note, by default these platforms are still handled by the MDP5 driver
unless the `msm.prefer_mdp5=false' parameter is provided.

Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_2_sdm660.h    | 291 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_3_3_sdm630.h    | 225 ++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +
 drivers/gpu/drm/msm/msm_drv.c                 |   2 +
 6 files changed, 524 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
new file mode 100644
index 000000000000..bd38fb753849
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -0,0 +1,291 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023. Linaro Inc. All rights reserved.
+ */
+
+#ifndef _DPU_3_2_SDM660_H
+#define _DPU_3_2_SDM660_H
+
+static const struct dpu_caps sdm660_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg sdm660_mdp = {
+	.name = "top_0",
+	.base = 0x0, .len = 0x458,
+	.features = BIT(DPU_MDP_VSYNC_SEL),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+	},
+};
+
+static const struct dpu_ctl_cfg sdm660_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x94,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x94,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+};
+
+static const struct dpu_sspp_cfg sdm660_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x1ac,
+		.features = VIG_MSM8998_MASK,
+		.sblk = &dpu_vig_sblk_1_2,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x1ac,
+		.features = VIG_MSM8998_MASK,
+		.sblk = &dpu_vig_sblk_1_2,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG1,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x1ac,
+		.features = DMA_MSM8998_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x1ac,
+		.features = DMA_MSM8998_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x1ac,
+		.features = DMA_CURSOR_MSM8998_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	},
+};
+
+static const struct dpu_lm_cfg sdm660_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_pingpong_cfg sdm660_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_SDM845_TE2_MASK,
+		.sblk = &sdm845_pp_sblk_te,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x70800, .len = 0xd4,
+		.features = PINGPONG_SDM845_TE2_MASK,
+		.sblk = &sdm845_pp_sblk_te,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x71000, .len = 0xd4,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x71800, .len = 0xd4,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
+	},
+};
+
+static const struct dpu_dsc_cfg sdm660_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	},
+};
+
+static const struct dpu_dspp_cfg sdm660_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+};
+
+static const struct dpu_intf_cfg sdm660_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x280,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x280,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg sdm660_perf_data = {
+	.max_bw_low = 6600000,
+	.max_bw_high = 6600000,
+	.min_core_ib = 3100000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.undersized_prefill_lines = 2,
+	.xtra_prefill_lines = 2,
+	.dest_scale_prefill_lines = 3,
+	.macrotile_prefill_lines = 4,
+	.yuv_nv12_prefill_lines = 8,
+	.linear_prefill_lines = 1,
+	.downscaling_prefill_lines = 1,
+	.amortizable_threshold = 25,
+	.min_prefill_lines = 25,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
+		.entries = msm8998_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
+		.entries = msm8998_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
+		.entries = msm8998_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 200,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version sdm660_mdss_ver = {
+	.core_major_ver = 3,
+	.core_minor_ver = 2,
+};
+
+const struct dpu_mdss_cfg dpu_sdm660_cfg = {
+	.mdss_ver = &sdm660_mdss_ver,
+	.caps = &sdm660_dpu_caps,
+	.mdp = &sdm660_mdp,
+	.ctl_count = ARRAY_SIZE(sdm660_ctl),
+	.ctl = sdm660_ctl,
+	.sspp_count = ARRAY_SIZE(sdm660_sspp),
+	.sspp = sdm660_sspp,
+	.mixer_count = ARRAY_SIZE(sdm660_lm),
+	.mixer = sdm660_lm,
+	.dspp_count = ARRAY_SIZE(sdm660_dspp),
+	.dspp = sdm660_dspp,
+	.pingpong_count = ARRAY_SIZE(sdm660_pp),
+	.pingpong = sdm660_pp,
+	.dsc_count = ARRAY_SIZE(sdm660_dsc),
+	.dsc = sdm660_dsc,
+	.intf_count = ARRAY_SIZE(sdm660_intf),
+	.intf = sdm660_intf,
+	.vbif_count = ARRAY_SIZE(msm8998_vbif),
+	.vbif = msm8998_vbif,
+	.perf = &sdm660_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
new file mode 100644
index 000000000000..0029505f71d9
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -0,0 +1,225 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023. Linaro Inc. All rights reserved.
+ */
+
+#ifndef _DPU_3_3_SDM630_H
+#define _DPU_3_3_SDM630_H
+
+static const struct dpu_caps sdm630_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg sdm630_mdp = {
+	.name = "top_0",
+	.base = 0x0, .len = 0x458,
+	.features = BIT(DPU_MDP_VSYNC_SEL),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+	},
+};
+
+static const struct dpu_ctl_cfg sdm630_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x94,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x94,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+};
+
+static const struct dpu_sspp_cfg sdm630_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x1ac,
+		.features = VIG_MSM8998_MASK,
+		.sblk = &dpu_vig_sblk_1_2,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x1ac,
+		.features = DMA_MSM8998_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x1ac,
+		.features = DMA_MSM8998_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x1ac,
+		.features = DMA_CURSOR_MSM8998_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	},
+};
+
+static const struct dpu_lm_cfg sdm630_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+		.pingpong = PINGPONG_2,
+	},
+};
+
+static const struct dpu_pingpong_cfg sdm630_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_SDM845_TE2_MASK,
+		.sblk = &sdm845_pp_sblk_te,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x71000, .len = 0xd4,
+		.features = PINGPONG_SDM845_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
+	},
+};
+
+static const struct dpu_dspp_cfg sdm630_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+};
+
+static const struct dpu_intf_cfg sdm630_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x280,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 21,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg sdm630_perf_data = {
+	.max_bw_low = 4100000,
+	.max_bw_high = 4100000,
+	.min_core_ib = 3200000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.undersized_prefill_lines = 2,
+	.xtra_prefill_lines = 2,
+	.dest_scale_prefill_lines = 3,
+	.macrotile_prefill_lines = 4,
+	.yuv_nv12_prefill_lines = 8,
+	.linear_prefill_lines = 1,
+	.downscaling_prefill_lines = 1,
+	.amortizable_threshold = 25,
+	.min_prefill_lines = 25,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
+		.entries = msm8998_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
+		.entries = msm8998_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
+		.entries = msm8998_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 200,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version sdm630_mdss_ver = {
+	.core_major_ver = 3,
+	.core_minor_ver = 3,
+};
+
+const struct dpu_mdss_cfg dpu_sdm630_cfg = {
+	.mdss_ver = &sdm630_mdss_ver,
+	.caps = &sdm630_dpu_caps,
+	.mdp = &sdm630_mdp,
+	.ctl_count = ARRAY_SIZE(sdm630_ctl),
+	.ctl = sdm630_ctl,
+	.sspp_count = ARRAY_SIZE(sdm630_sspp),
+	.sspp = sdm630_sspp,
+	.mixer_count = ARRAY_SIZE(sdm630_lm),
+	.mixer = sdm630_lm,
+	.dspp_count = ARRAY_SIZE(sdm630_dspp),
+	.dspp = sdm630_dspp,
+	.pingpong_count = ARRAY_SIZE(sdm630_pp),
+	.pingpong = sdm630_pp,
+	.intf_count = ARRAY_SIZE(sdm630_intf),
+	.intf = sdm630_intf,
+	.vbif_count = ARRAY_SIZE(msm8998_vbif),
+	.vbif = msm8998_vbif,
+	.perf = &sdm630_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 337d4f612f9a..f90b418b4c93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -612,6 +612,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  *************************************************************/
 
 #include "catalog/dpu_3_0_msm8998.h"
+#include "catalog/dpu_3_2_sdm660.h"
+#include "catalog/dpu_3_3_sdm630.h"
 
 #include "catalog/dpu_4_0_sdm845.h"
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8dbf0322394e..72c792bcd6ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -822,6 +822,8 @@ struct dpu_mdss_cfg {
 };
 
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
+extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
+extern const struct dpu_mdss_cfg dpu_sdm660_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3cb8c2ada5e..4463679460fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1417,6 +1417,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
+	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
+	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
 	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
 	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
 	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1b8ec55704ba..462216c5c1e9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1198,6 +1198,8 @@ module_param(prefer_mdp5, bool, 0444);
 
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
+	"qcom,sdm630-mdp5",
+	"qcom,sdm660-mdp5",
 	NULL,
 };
 
-- 
2.39.2

