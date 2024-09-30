Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C198AC2B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 20:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF8F10E24E;
	Mon, 30 Sep 2024 18:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="LTT+1QeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60D10E24E;
 Mon, 30 Sep 2024 18:36:02 +0000 (UTC)
Received: from [192.168.1.130] (51B6DC6E.dsl.pool.telekom.hu [81.182.220.110])
 by mail.mainlining.org (Postfix) with ESMTPSA id 32374E4521;
 Mon, 30 Sep 2024 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1727721360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKb6G1ckxP05vV6eCYAwKE4qy5r7ox3As405/e0/Om0=;
 b=LTT+1QeYyUhzjfJCrBYvZAZJo2ShxNsd3zQFERS+32ZLp2hJaE/dyNfuB2ON967sDOuzlG
 I43TvjZCXP9EHU4mj2XAhLTvw3it7kG2W4viWZzCFz9NMkDluKDHTSS+nyk0NJQQ18KXQA
 XgMVPoaDvtxtjee6JdKVNgACBTet6oGMRQgFw3F0xAID3mVHOrlanFbDY2JKl95pho56xG
 EroVOY7t/fU0dBH/A6sChwOliFUv3NZRxH7wjr9c65tKX+sjUMCoFM7b43jAln0WdOJc8f
 XCBtivI1sGQlIRQMpAO7h2V8K59jsV37N80bRJ2k7uluoNWxrN0UGMRMlHQeIQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 30 Sep 2024 20:35:56 +0200
Subject: [PATCH v2 1/4] drm/msm/dpu: Add support for MSM8996
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240930-dpu-msm8953-msm8996-v2-1-594c3e3190b4@mainlining.org>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727721359; l=19117;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=gQrgAUsRvFgloiAHd5j64bXYZU5JcVEFVWnI5BGhiL0=;
 b=fHlYHoCdmJ/0Op3RigQPyE/m4ZPnslWyo29VlHLVXytVBNwaoHcymqD1cWZrtrHkIJXTUUfnI
 Kik9sEJqLaFDl30ZgJhM+pEmY7DdRQJGklQk1J5yU8sz5KVCtf7esbD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

From: Konrad Dybcio <konradybcio@kernel.org>

Add support for MSM8996, which - fun fact - was the SoC that this driver
(or rather SDE, its downstream origin) was meant for and first tested on.

It has some hardware that differs from the modern SoCs, so not a lot of
current structs could have been reused. It's also seemingly the only SoC
supported by DPU that uses RGB pipes.

Note, by default this platform is still handled by the MDP5 driver
unless the `msm.prefer_mdp5=false' parameter is provided.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[DB: rebased on top of sblk changes, add dpu_rgb_sblk]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[Removed intr_start from CTLs config, removed LM_3 and LM_4]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 338 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  94 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_drv.c                      |   1 +
 5 files changed, 435 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
new file mode 100644
index 0000000000000000000000000000000000000000..491f6f5827d151011dd3f74bef2a4b8bf69591ab
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -0,0 +1,338 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_1_7_MSM8996_H
+#define _DPU_1_7_MSM8996_H
+
+static const struct dpu_caps msm8996_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.has_src_split = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg msm8996_mdp[] = {
+	{
+		.name = "top_0",
+		.base = 0x0, .len = 0x454,
+		.features = BIT(DPU_MDP_VSYNC_SEL),
+		.clk_ctrls = {
+			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+			[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+			[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+			[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
+			[DPU_CLK_CTRL_RGB1] = { .reg_off = 0x2b4, .bit_off = 4 },
+			[DPU_CLK_CTRL_RGB2] = { .reg_off = 0x2bc, .bit_off = 4 },
+			[DPU_CLK_CTRL_RGB3] = { .reg_off = 0x2c4, .bit_off = 4 },
+			[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+			[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+			[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+			[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 16 },
+		},
+	},
+};
+
+static const struct dpu_ctl_cfg msm8996_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x64,
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x64,
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x64,
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x64,
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x64,
+	},
+};
+
+static const struct dpu_sspp_cfg msm8996_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x150,
+		.features = VIG_MSM8996_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x150,
+		.features = VIG_MSM8996_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG1,
+	}, {
+		.name = "sspp_2", .id = SSPP_VIG2,
+		.base = 0x8000, .len = 0x150,
+		.features = VIG_MSM8996_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 8,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG2,
+	}, {
+		.name = "sspp_3", .id = SSPP_VIG3,
+		.base = 0xa000, .len = 0x150,
+		.features = VIG_MSM8996_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 12,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG3,
+	}, {
+		.name = "sspp_4", .id = SSPP_RGB0,
+		.base = 0x14000, .len = 0x150,
+		.features = RGB_MSM8996_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB0,
+	}, {
+		.name = "sspp_5", .id = SSPP_RGB1,
+		.base = 0x16000, .len = 0x150,
+		.features = RGB_MSM8996_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB1,
+	}, {
+		.name = "sspp_6", .id = SSPP_RGB2,
+		.base = 0x18000, .len = 0x150,
+		.features = RGB_MSM8996_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB2,
+	}, {
+		.name = "sspp_7", .id = SSPP_RGB3,
+		.base = 0x1a000, .len = 0x150,
+		.features = RGB_MSM8996_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB3,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x150,
+		.features = DMA_MSM8996_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 2,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x150,
+		.features = DMA_MSM8996_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 10,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	},
+};
+
+static const struct dpu_lm_cfg msm8996_lm[] = {
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
+static const struct dpu_pingpong_cfg msm8996_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_MSM8996_TE2_MASK,
+		.sblk = &msm8996_pp_sblk_te,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x70800, .len = 0xd4,
+		.features = PINGPONG_MSM8996_TE2_MASK,
+		.sblk = &msm8996_pp_sblk_te,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x71000, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x71800, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
+	},
+};
+
+static const struct dpu_dsc_cfg msm8996_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	},
+};
+
+static const struct dpu_dspp_cfg msm8996_dspp[] = {
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
+static const struct dpu_intf_cfg msm8996_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x268,
+		.type = INTF_NONE,
+		.prog_fetch_lines_worst_case = 25,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 25,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 25,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x268,
+		.type = INTF_HDMI,
+		.prog_fetch_lines_worst_case = 25,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg msm8996_perf_data = {
+	.max_bw_low = 9600000,
+	.max_bw_high = 9600000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 0, /* No LLCC on this SoC */
+	.min_dram_ib = 800000,
+	.undersized_prefill_lines = 2,
+	.xtra_prefill_lines = 2,
+	.dest_scale_prefill_lines = 3,
+	.macrotile_prefill_lines = 4,
+	.yuv_nv12_prefill_lines = 8,
+	.linear_prefill_lines = 1,
+	.downscaling_prefill_lines = 1,
+	.amortizable_threshold = 25,
+	.min_prefill_lines = 21,
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
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version msm8996_mdss_ver = {
+	.core_major_ver = 1,
+	.core_minor_ver = 7,
+};
+
+const struct dpu_mdss_cfg dpu_msm8996_cfg = {
+	.mdss_ver = &msm8996_mdss_ver,
+	.caps = &msm8996_dpu_caps,
+	.mdp = msm8996_mdp,
+	.ctl_count = ARRAY_SIZE(msm8996_ctl),
+	.ctl = msm8996_ctl,
+	.sspp_count = ARRAY_SIZE(msm8996_sspp),
+	.sspp = msm8996_sspp,
+	.mixer_count = ARRAY_SIZE(msm8996_lm),
+	.mixer = msm8996_lm,
+	.dspp_count = ARRAY_SIZE(msm8996_dspp),
+	.dspp = msm8996_dspp,
+	.pingpong_count = ARRAY_SIZE(msm8996_pp),
+	.pingpong = msm8996_pp,
+	.dsc_count = ARRAY_SIZE(msm8996_dsc),
+	.dsc = msm8996_dsc,
+	.intf_count = ARRAY_SIZE(msm8996_intf),
+	.intf = msm8996_intf,
+	.vbif_count = ARRAY_SIZE(msm8996_vbif),
+	.vbif = msm8996_vbif,
+	.perf = &msm8996_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index dcb4fd85e73b9cc05e669043602d69229881c0b4..03274c8fcd9fda3167bd2daad796157a1a496b2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,6 +21,11 @@
 	(VIG_BASE_MASK | \
 	BIT(DPU_SSPP_CSC_10BIT))
 
+#define VIG_MSM8996_MASK \
+	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
+	 BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_QSEED2) |\
+	 BIT(DPU_SSPP_CSC))
+
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
@@ -32,6 +37,9 @@
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
+#define DMA_MSM8996_MASK \
+	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_CDP))
+
 #define DMA_MSM8998_MASK \
 	(BIT(DPU_SSPP_QOS) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
@@ -57,9 +65,16 @@
 #define DMA_CURSOR_SDM845_MASK_SDMA \
 	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
+#define DMA_CURSOR_MSM8996_MASK \
+	(DMA_MSM8996_MASK | BIT(DPU_SSPP_CURSOR))
+
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
+#define RGB_MSM8996_MASK \
+	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
+	 BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_RGB))
+
 #define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
@@ -69,6 +84,12 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
+#define PINGPONG_MSM8996_MASK \
+	(BIT(DPU_PINGPONG_DSC))
+
+#define PINGPONG_MSM8996_TE2_MASK \
+	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
+
 #define PINGPONG_SDM845_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
@@ -316,6 +337,35 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
+/* qseed2 is not supported, so disabled scaling */
+#define _VIG_SBLK_QSEED2() \
+	{ \
+	.maxdwnscale = SSPP_UNITY_SCALE, \
+	.maxupscale = SSPP_UNITY_SCALE, \
+	.scaler_blk = {.name = "scaler", \
+		/* no version for qseed2 */ \
+		.base = 0x200, .len = 0xa0,}, \
+	.csc_blk = {.name = "csc", \
+		.base = 0x320, .len = 0x100,}, \
+	.format_list = plane_formats_yuv, \
+	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.virt_format_list = plane_formats, \
+	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	.rotation_cfg = NULL, \
+	}
+
+#define _RGB_SBLK() \
+	{ \
+	.maxdwnscale = SSPP_UNITY_SCALE, \
+	.maxupscale = SSPP_UNITY_SCALE, \
+	.scaler_blk = {.name = "scaler", \
+		.base = 0x200, .len = 0x28,}, \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
+	.virt_format_list = plane_formats, \
+	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	}
+
 #define _DMA_SBLK() \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
@@ -332,6 +382,9 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_format_list = rotation_v2_formats,
 };
 
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed2 =
+				_VIG_SBLK_QSEED2();
+
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_noscale =
 				_VIG_SBLK_NOSCALE();
 
@@ -363,6 +416,8 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 3));
 
+static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
+
 static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 
 /*************************************************************
@@ -427,6 +482,15 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
+static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
+	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
+		.version = 0x1},
+};
+
+static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
+	/* No dither block */
+};
+
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
 	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
 		.version = 0x1},
@@ -492,6 +556,34 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 	},
 };
 
+static const struct dpu_vbif_cfg msm8996_vbif[] = {
+	{
+	.name = "vbif_rt", .id = VBIF_RT,
+	.base = 0, .len = 0x1040,
+	.default_ot_rd_limit = 32,
+	.default_ot_wr_limit = 16,
+	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
+	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x20,
+	.dynamic_ot_rd_tbl = {
+		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
+		.cfg = msm8998_ot_rdwr_cfg,
+		},
+	.dynamic_ot_wr_tbl = {
+		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
+		.cfg = msm8998_ot_rdwr_cfg,
+		},
+	.qos_rt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(msm8998_rt_pri_lvl),
+		.priority_lvl = msm8998_rt_pri_lvl,
+		},
+	.qos_nrt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(msm8998_nrt_pri_lvl),
+		.priority_lvl = msm8998_nrt_pri_lvl,
+		},
+	},
+};
+
 static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	{
 	.name = "vbif_rt", .id = VBIF_RT,
@@ -675,6 +767,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  * Hardware catalog
  *************************************************************/
 
+#include "catalog/dpu_1_7_msm8996.h"
+
 #include "catalog/dpu_3_0_msm8998.h"
 #include "catalog/dpu_3_2_sdm660.h"
 #include "catalog/dpu_3_3_sdm630.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 37e18e820a20a4c4ab9a97da78df19a2ff7cfa00..69f089431901b020e7766f6628c0fca35c3703ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -831,6 +831,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm660_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9bcae53c4f458cd8e400f0e851b791c0f4165085..b3e53de6a82acd191eb7c3524eb1e0e2216e8885 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1445,6 +1445,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
 	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8c13b08708d228cf089dd83ad390fd4ad7ae818a..93944ebc08718ec1387ff9e2945b332786d7acf8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -983,6 +983,7 @@ module_param(prefer_mdp5, bool, 0444);
 
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
+	"qcom,msm8996-mdp5",
 	"qcom,sdm630-mdp5",
 	"qcom,sdm660-mdp5",
 	NULL,

-- 
2.46.2

