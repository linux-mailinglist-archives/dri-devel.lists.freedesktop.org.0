Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11D98B4A9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD7410E5DA;
	Tue,  1 Oct 2024 06:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sVAKMpnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908BB10E118;
 Tue,  1 Oct 2024 06:42:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 44738A4295D;
 Tue,  1 Oct 2024 06:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD486C4CED8;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727764924;
 bh=v3RP1UPzqeHqFFdFRSlwVCnglut8DcPyOE5oOPw7/nI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=sVAKMpnEy20ilhm/NEePCXzJkdiLK3dJb/dGPq1Dveu2MYFz3E2vhO/Krq+360Q0i
 alM0TTtvCNSHUqBG4LVlxsJ3vyE2qQV2+9mgITc6DQkStJm73/rIYE2RrlkGCBKxBX
 2NWlNZ3k8Ka7BTCS5LQA2a1TzOj/Gr83hPFKF0jqz+1e4BY66t7JSJ+w8ClpSZftZA
 bTaLXr6Nyza8T+FHcQdHtslaE44XG54XtJ2PJZot7wxm8MIye5i/JWqwa0Yl5SeL27
 YxLFCnsvSPZ/U073bypHpItF16vOPFLTpbbV4z3KNuufh9f7aCx5zK2Uo8+qZ0zwCN
 Fjl56DudwN/QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C2D89CF6493;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
From: Mahadevan via B4 Relay <devnull+quic_mahap.quicinc.com@kernel.org>
Date: Tue, 01 Oct 2024 12:11:39 +0530
Subject: [PATCH v3 4/5] drm/msm/dpu: Add SA8775P support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-patchv3_1-v3-4-d23284f45977@quicinc.com>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
In-Reply-To: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727764922; l=18108;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Zy237LIcVUYH33tvD8kCgPy8GgGVYJXVxtOKbIY1X+E=;
 b=uNdkdxWowwDYBAyKwR8mwh3fCL6Xff+a5bvEcMU+Y+8Bd8vjf+TSaMxa2KDM4+PiIlEuwmIp7
 JTX9Kzx1oDnBiMtbrleLfqnpXt0Vyo+mB+IZKTriPLU7MJW4EEkjIEN
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Endpoint-Received: by B4 Relay for quic_mahap@quicinc.com/20241001 with
 auth_id=236
X-Original-From: Mahadevan <quic_mahap@quicinc.com>
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
Reply-To: quic_mahap@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mahadevan <quic_mahap@quicinc.com>

Add definitions for the display hardware used on the
Qualcomm SA8775P platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 488 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
new file mode 100644
index 0000000000000000000000000000000000000000..907b4d7ceb470b0391d2bbbab3ce520efa2b3263
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -0,0 +1,485 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DPU_8_4_SA8775P_H
+#define _DPU_8_4_SA8775P_H
+
+static const struct dpu_caps sa8775p_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg sa8775p_mdp = {
+	.name = "top_0",
+	.base = 0x0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+static const struct dpu_ctl_cfg sa8775p_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x204,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x204,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	}, {
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg sa8775p_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x32c,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x32c,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG1,
+	}, {
+		.name = "sspp_2", .id = SSPP_VIG2,
+		.base = 0x8000, .len = 0x32c,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
+		.xin_id = 8,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG2,
+	}, {
+		.name = "sspp_3", .id = SSPP_VIG3,
+		.base = 0xa000, .len = 0x32c,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_1,
+		.xin_id = 12,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG3,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x32c,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x32c,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x32c,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	}, {
+		.name = "sspp_11", .id = SSPP_DMA3,
+		.base = 0x2a000, .len = 0x32c,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA3,
+	},
+};
+
+static const struct dpu_lm_cfg sa8775p_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x400,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x400,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x400,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x400,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
+};
+
+static const struct dpu_dspp_cfg sa8775p_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg sa8775p_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x69000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x6a000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x6b000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x6c000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_4", .id = PINGPONG_4,
+		.base = 0x6d000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+	}, {
+		.name = "pingpong_5", .id = PINGPONG_5,
+		.base = 0x6e000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+	}, {
+		.name = "pingpong_6", .id = PINGPONG_6,
+		.base = 0x65800, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+	}, {
+		.name = "pingpong_7", .id = PINGPONG_7,
+		.base = 0x65c00, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+	},
+};
+
+static const struct dpu_merge_3d_cfg sa8775p_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x65f00, .len = 0x8,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sa8775p_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_2_0", .id = DSC_4,
+		.base = 0x82000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_2_1", .id = DSC_5,
+		.base = 0x82000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	},
+};
+
+static const struct dpu_wb_cfg sa8775p_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+/* TODO: INTF 3, 6, 7 and 8 are used for MST, marked as INTF_NONE for now */
+static const struct dpu_intf_cfg sa8775p_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x38000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+	}, {
+		.name = "intf_6", .id = INTF_6,
+		.base = 0x3A000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+	}, {
+		.name = "intf_7", .id = INTF_7,
+		.base = 0x3b000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
+	}, {
+		.name = "intf_8", .id = INTF_8,
+		.base = 0x3c000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_NONE,
+		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+	},
+};
+
+static const struct dpu_perf_cfg sa8775p_perf_data = {
+	.max_bw_low = 13600000,
+	.max_bw_high = 18200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	/* FIXME: lut tables */
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xfff0, 0x1},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
+		.entries = sm6350_qos_linear_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
+		.entries = sm6350_qos_linear_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version sa8775p_mdss_ver = {
+	.core_major_ver = 8,
+	.core_minor_ver = 4,
+};
+
+const struct dpu_mdss_cfg dpu_sa8775p_cfg = {
+	.mdss_ver = &sa8775p_mdss_ver,
+	.caps = &sa8775p_dpu_caps,
+	.mdp = &sa8775p_mdp,
+	.cdm = &sc7280_cdm,
+	.ctl_count = ARRAY_SIZE(sa8775p_ctl),
+	.ctl = sa8775p_ctl,
+	.sspp_count = ARRAY_SIZE(sa8775p_sspp),
+	.sspp = sa8775p_sspp,
+	.mixer_count = ARRAY_SIZE(sa8775p_lm),
+	.mixer = sa8775p_lm,
+	.dspp_count = ARRAY_SIZE(sa8775p_dspp),
+	.dspp = sa8775p_dspp,
+	.pingpong_count = ARRAY_SIZE(sa8775p_pp),
+	.pingpong = sa8775p_pp,
+	.dsc_count = ARRAY_SIZE(sa8775p_dsc),
+	.dsc = sa8775p_dsc,
+	.merge_3d_count = ARRAY_SIZE(sa8775p_merge_3d),
+	.merge_3d = sa8775p_merge_3d,
+	.wb_count = ARRAY_SIZE(sa8775p_wb),
+	.wb = sa8775p_wb,
+	.intf_count = ARRAY_SIZE(sa8775p_intf),
+	.intf = sa8775p_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sa8775p_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index dcb4fd85e73b9cc05e669043602d69229881c0b4..cc67bc82128f17216478e1b15928a9c90edecbbb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -699,6 +699,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_8_0_sc8280xp.h"
 #include "catalog/dpu_8_1_sm8450.h"
+#include "catalog/dpu_8_4_sa8775p.h"
 
 #include "catalog/dpu_9_0_sm8550.h"
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 37e18e820a20a4c4ab9a97da78df19a2ff7cfa00..9665eedec699e125cf72da20738a3031279bc522 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -850,6 +850,7 @@ extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
 extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
+extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
 extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9bcae53c4f458cd8e400f0e851b791c0f4165085..6d47d7dcffc2c1feafd99731571826a9b3f912b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1447,6 +1447,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
+	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
 	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
 	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
 	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },

-- 
2.34.1


