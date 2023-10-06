Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D937BB94F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3E10E515;
	Fri,  6 Oct 2023 13:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2197510E4FD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:37:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so2824444e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599446; x=1697204246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhSO35rk/ODMYGtT7B3r/VbyTf2rh2MQmKXa8jIY0MM=;
 b=n7HY1W44E0zjUVUMz5XEhu8rUvAxKwg8CsGs7E0bZC/kped4WtwBwpJKn87DA4dVrd
 O/aFS3ImaBI83bsc2R/tWiOro7J03547zbCYjaFC+YneWEEdyvkYz76TL/yu7zJPhKop
 OyN2yDnJIDgh6XS6/emSO57Wzwgaocp5eW8/O4/cB693gWvDZIZ8BqyAT6fSIWYGzckD
 eJZlYIvyxB/jMUL44psg88qdyHtFVdOc2UwbrB5EXjwsNWJItthAgEytELszcT2bJo0D
 KIW9MJDSgaW1HZmOCFZI+xR0Qo0OPhLz7bTE8gnW0H2MFbyWLkWsalAo3K3RIS1Ib4GB
 KMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599446; x=1697204246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhSO35rk/ODMYGtT7B3r/VbyTf2rh2MQmKXa8jIY0MM=;
 b=TWmJnvSc449uS1c8fpH8R1anF+HOo3zwo6SlJx3Te/RFrr5RmefysBAW9wXYQZd+Bv
 dSPmPUXi8caVw+bXjf1bvMgZZqiSc8innQDIKbvQoR5PcfEQ3OmSdwAZCA/Ou/DAoQc1
 tYy5LdcFmzKPXhFq1uSWedBP3MXhg6F0BZ+2iRfrOvvklnP9TG1e3Wnskdze0t1DU0QN
 CKhV7qlaZUQcosgd1j6pcwIyMKYRjgELWy5DqyjRGrh2BsQd0k8AOFdC7alinU78gOul
 phdbokeUJ6cc1HMzta4SdSwYQLZYEuwZICFhMJVs7bsaLCfKCfdeYrPlu2bKH9fQwid4
 vdKg==
X-Gm-Message-State: AOJu0Yw3Rojqj25j/K11PfQS8XuVFqkCTnWonu8ilVeLSZYZ5kjBZ0Rf
 Ol3xhxA2ydlB9/37HoleGZ9wnw==
X-Google-Smtp-Source: AGHT+IHfxCa7sJJEWcNnxMhag3m67MCyEcOxhQ22AxHtkJ+hRj86cMKXsnHWoGilc/suu92e9tDVaw==
X-Received: by 2002:a19:5e48:0:b0:500:91ac:c0b5 with SMTP id
 z8-20020a195e48000000b0050091acc0b5mr6421147lfi.30.1696599446279; 
 Fri, 06 Oct 2023 06:37:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:37:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 5/5] drm/msm/dpu: Add MSM8996 support
Date: Fri,  6 Oct 2023 16:37:20 +0300
Message-Id: <20231006133720.2471770-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
References: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@linaro.org>

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
---
 .../msm/disp/dpu1/catalog/dpu_1_7_msm8996.h   | 353 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  95 +++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_drv.c                 |   1 +
 5 files changed, 451 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
new file mode 100644
index 000000000000..43e952fcce9b
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -0,0 +1,353 @@
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
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
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
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &msm8998_lm_sblk,
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
index 8050b43cea97..0669d4cb0b15 100644
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
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
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
+	(BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+
+#define PINGPONG_MSM8996_TE2_MASK \
+	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
+
 #define PINGPONG_SDM845_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
 
@@ -286,6 +307,35 @@ static const uint32_t wb2_formats[] = {
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
@@ -302,6 +352,9 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_format_list = rotation_v2_formats,
 };
 
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed2 =
+				_VIG_SBLK_QSEED2();
+
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_noscale =
 				_VIG_SBLK_NOSCALE();
 
@@ -330,6 +383,8 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_1 =
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 
+static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
+
 static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 
 /*************************************************************
@@ -394,6 +449,15 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
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
@@ -448,6 +512,35 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 	},
 };
 
+static const struct dpu_vbif_cfg msm8996_vbif[] = {
+	{
+	.name = "vbif_0", .id = VBIF_RT,
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
+	/* TODO: VBIF_NRT */
+};
+
 static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	{
 	.name = "vbif_rt", .id = VBIF_RT,
@@ -611,6 +704,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  * Hardware catalog
  *************************************************************/
 
+#include "catalog/dpu_1_7_msm8996.h"
+
 #include "catalog/dpu_3_0_msm8998.h"
 #include "catalog/dpu_3_2_sdm660.h"
 #include "catalog/dpu_3_3_sdm630.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 07e57de85799..8c3c6cd2a186 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -822,6 +822,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm660_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e45f8b5b1242..3dae0b994463 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1413,6 +1413,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
 	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f3b95d50b0f2..27b0cd46a59e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1200,6 +1200,7 @@ module_param(prefer_mdp5, bool, 0444);
 
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
+	"qcom,msm8996-mdp5",
 	"qcom,sdm630-mdp5",
 	"qcom,sdm660-mdp5",
 	NULL,
-- 
2.39.2

