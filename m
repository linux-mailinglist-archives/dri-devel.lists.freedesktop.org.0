Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD798AC2E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 20:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485BF10E2F0;
	Mon, 30 Sep 2024 18:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="hT+ZPoCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8313110E131;
 Mon, 30 Sep 2024 18:36:03 +0000 (UTC)
Received: from [192.168.1.130] (51B6DC6E.dsl.pool.telekom.hu [81.182.220.110])
 by mail.mainlining.org (Postfix) with ESMTPSA id E4021E4525;
 Mon, 30 Sep 2024 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1727721362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1o48v598RdAX8uBq3dEDUciaP1L2dPMwSXvDgPr/0g=;
 b=hT+ZPoCT5xhFiRxeTOkTfXc2pqTMIEDdAxYDWQh7lBQwcolVA8k3b+bDE0WHFuYQkPJ4Rf
 hrWcsd6ewcNuIpAtTAdgzY0lrNsUmc4a+TB8pEw/TIZ3jaFDjgttBqf5bWlpkXwsAxNvuQ
 wAO+sQNwxzqoBhUC8s95MBt2/jQlQ2KSd3bTMv4vE53NXjdpKDw0pAY+Oya+0z/XvNNS1L
 jPuBZUxTbJMjbjQVynwsO55nNrxyyfKNg701yaVwffwhSAnBuZBfXW/j6Gw+2YbFFK31A5
 VUShdhdBi+4Yke8C3RhDtr5q9+/6O74BcUYGJrgy+yQJvFz3BYKb5whuAXynHA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 30 Sep 2024 20:35:59 +0200
Subject: [PATCH v2 4/4] drm/msm/dpu: Add support for MSM8917
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240930-dpu-msm8953-msm8996-v2-4-594c3e3190b4@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727721359; l=8688;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=F2jqljH4/t6/YDSegE+tlioH0EQ6ekV53AbWjz1E41g=;
 b=t4asC6FtLq8RnAekUKGRLFiWf0A3277AWqbOOa1Z4TuYEeDGkNq/RpsKrnSTpArUcbR/AjFd2
 kYagvoOQAt3D+EKcOHZro0oAfTCB7r1eqzMS1Kmmfbex3YFg/0UCT/W
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add support for MSM8917, which has MDP5 v1.15. It looks like
trimmed down version of MSM8937. Even fewer PP, LM and no DSI1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[Remove intr_start from CTLs config, reword the commit]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 187 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_drv.c                      |   1 +
 5 files changed, 191 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
new file mode 100644
index 0000000000000000000000000000000000000000..6bdaecca676144f9162ab1839d99f3e2e3386dc7
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DPU_1_14_MSM8917_H
+#define _DPU_1_14_MSM8917_H
+
+static const struct dpu_caps msm8917_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
+	.pixel_ram_size = 16 * 1024,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg msm8917_mdp[] = {
+	{
+		.name = "top_0",
+		.base = 0x0, .len = 0x454,
+		.features = BIT(DPU_MDP_VSYNC_SEL),
+		.clk_ctrls = {
+			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
+			[DPU_CLK_CTRL_RGB1] = { .reg_off = 0x2b4, .bit_off = 4 },
+			[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+			[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+		},
+	},
+};
+
+static const struct dpu_ctl_cfg msm8917_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x64,
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x64,
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x64,
+	},
+};
+
+static const struct dpu_sspp_cfg msm8917_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x150,
+		.features = VIG_MSM8953_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_4", .id = SSPP_RGB0,
+		.base = 0x14000, .len = 0x150,
+		.features = RGB_MSM8953_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB0,
+	}, {
+		.name = "sspp_5", .id = SSPP_RGB1,
+		.base = 0x16000, .len = 0x150,
+		.features = RGB_MSM8953_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB1,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x150,
+		.features = DMA_MSM8953_MASK | BIT(DPU_SSPP_CURSOR),
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 2,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	},
+};
+
+static const struct dpu_lm_cfg msm8917_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.sblk = &msm8998_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	},
+};
+
+static const struct dpu_pingpong_cfg msm8917_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	},
+};
+
+static const struct dpu_dspp_cfg msm8917_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+};
+
+static const struct dpu_intf_cfg msm8917_intf[] = {
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg msm8917_perf_data = {
+	.max_bw_low = 1800000,
+	.max_bw_high = 1800000,
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
+static const struct dpu_mdss_version msm8917_mdss_ver = {
+	.core_major_ver = 1,
+	.core_minor_ver = 15,
+};
+
+const struct dpu_mdss_cfg dpu_msm8917_cfg = {
+	.mdss_ver = &msm8917_mdss_ver,
+	.caps = &msm8917_dpu_caps,
+	.mdp = msm8917_mdp,
+	.ctl_count = ARRAY_SIZE(msm8917_ctl),
+	.ctl = msm8917_ctl,
+	.sspp_count = ARRAY_SIZE(msm8917_sspp),
+	.sspp = msm8917_sspp,
+	.mixer_count = ARRAY_SIZE(msm8917_lm),
+	.mixer = msm8917_lm,
+	.dspp_count = ARRAY_SIZE(msm8917_dspp),
+	.dspp = msm8917_dspp,
+	.pingpong_count = ARRAY_SIZE(msm8917_pp),
+	.pingpong = msm8917_pp,
+	.intf_count = ARRAY_SIZE(msm8917_intf),
+	.intf = msm8917_intf,
+	.vbif_count = ARRAY_SIZE(msm8996_vbif),
+	.vbif = msm8996_vbif,
+	.perf = &msm8917_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 374d478faec4a08138f3e6cf2b396996eb082baa..431754b1187b455a69ecd0b3e513f793087e2869 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -780,6 +780,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_1_7_msm8996.h"
 #include "catalog/dpu_1_14_msm8937.h"
+#include "catalog/dpu_1_15_msm8917.h"
 #include "catalog/dpu_1_16_msm8953.h"
 
 #include "catalog/dpu_3_0_msm8998.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cd9cd27f816969cf95ecdc46d0f5821ba851294c..3dab1e1b8f72e3112f00c782527335af9a1d77c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -831,6 +831,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 778d11d6cb63235456451bec83f0b1d9127861b8..ecd66146d5e14a6b114d08e0fa4f8fe7a13ada66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1445,6 +1445,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
 	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
 	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index d7e51a7c25aad10629aee5166cd501693e8ec4fd..3557cf7af303fd8c744f60d49815aebc7da41841 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -983,6 +983,7 @@ module_param(prefer_mdp5, bool, 0444);
 
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
+	"qcom,msm8917-mdp5",
 	"qcom,msm8937-mdp5",
 	"qcom,msm8953-mdp5",
 	"qcom,msm8996-mdp5",

-- 
2.46.2

