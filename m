Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DBD836630
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C4210F292;
	Mon, 22 Jan 2024 14:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2287A10F2A8;
 Mon, 22 Jan 2024 14:59:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9CDAC6115A;
 Mon, 22 Jan 2024 14:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E354AC43390;
 Mon, 22 Jan 2024 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935566;
 bh=SzDlK78GFfznTK3Ky4AKYOL0qWgChy+mJ2ab472f5Ao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j6L+hq2jpW5ydaMwmtNIKK6E2rTaHHuqoZm7Lgl33etdSTvKKYZgs5kxxpISfRCv5
 SG4pkJ8KUtQlphXbgeiMf3w+TggSSj1ddyiRjeB1d9mhrOCR+BzU5aAGd67ut9Ol01
 1O/W+LqzczUwdBxV53vaCsqiEk7oUdamDLm8SYFKwrB1AeNHAIlXFRNCjqIK2y9cQm
 /wkpHAT9uymcp0Y/sKdU+jsQ/poFOW8SOcrMx0iDP5VFN2SaaTCsTTN1QS7auqy+Je
 0wo5ebbPVxXcLWRPYPqVfklb2thcqRDVRauPA8M+OUhd72bVcRT/ofwZuZOdQdsi3A
 tctOakWi6o5WQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 54/88] drm/msm/dpu: enable writeback on SM8450
Date: Mon, 22 Jan 2024 09:51:27 -0500
Message-ID: <20240122145608.990137-54-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, konrad.dybcio@linaro.org, daniel@ffwll.ch,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit eaa647cdbf2e357b4a14903f2f1e47ed9c4f8df3 ]

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/570187/
Link: https://lore.kernel.org/r/20231203002743.1291956-4-dmitry.baryshkov@linaro.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 7742f52be859..562de67103bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -32,6 +32,7 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -316,6 +317,21 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8450_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8450_wb),
+	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.43.0

