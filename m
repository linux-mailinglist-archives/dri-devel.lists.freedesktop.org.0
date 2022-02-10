Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4264B0ABF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB6F10E7D6;
	Thu, 10 Feb 2022 10:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9010E7D6;
 Thu, 10 Feb 2022 10:34:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC80B61B96;
 Thu, 10 Feb 2022 10:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051D8C004E1;
 Thu, 10 Feb 2022 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644489298;
 bh=s77zX8tlQZGtLkt3yoLZJ4/EQEAGs6BTpnX/BQtdbYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gHRGD9b92gcyrUm5uzA4/hTcbQZonWdYW3ITgsSZv/o7g5RSJMCHTYocCGoDJbQKV
 95oGsjC2j26rYBfW9cF0Ii8CbfHwApE7/ia+s7qb1tA2vWdDjI07S5zow4vQ16h0Ey
 8ho2lfovcwNdiFDd7T2YIU9mgJc7nkAG6gLMQMDetlMYzY8njKFNjEehNnwD3W4f5T
 cNqPZDX1gAUy4+M1ooWzOTxos3r4mi/LHAKLG8hYVxL2OnNvGcXCSuatxZOP1VBtYK
 IP0WdVlizy6woYoQZR/9KZxHgsNkPDczsmCwi49aPlnukUIMiwws5bOgQzNJWqx7qj
 uVXKZa/vjC20A==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [REPOST PATCH v4 06/13] drm/msm/disp/dpu1: Add DSC support in hw_ctl
Date: Thu, 10 Feb 2022 16:04:16 +0530
Message-Id: <20220210103423.271016-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210103423.271016-1-vkoul@kernel.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Later gens of hardware have DSC bits moved to hw_ctl, so configure these
bits so that DSC would work there as well

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 11 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 02da9ecf71f1..49659165cea8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -25,6 +25,8 @@
 #define   CTL_MERGE_3D_ACTIVE           0x0E4
 #define   CTL_INTF_ACTIVE               0x0F4
 #define   CTL_MERGE_3D_FLUSH            0x100
+#define   CTL_DSC_ACTIVE                0x0E8
+#define   CTL_DSC_FLUSH                0x104
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
@@ -34,6 +36,7 @@
 
 #define DPU_REG_RESET_TIMEOUT_US        2000
 #define  MERGE_3D_IDX   23
+#define  DSC_IDX        22
 #define  INTF_IDX       31
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
@@ -121,7 +124,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 
 static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
-
 	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
 				ctx->pending_merge_3d_flush_mask);
@@ -506,6 +508,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
+	if (cfg->dsc)
+		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
+
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
@@ -517,6 +522,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
+	if (cfg->dsc) {
+		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, cfg->dsc);
+		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
+	}
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..9847c9c46d6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
  * @stream_sel:            Stream selection for multi-stream interfaces
+ * @dsc:                   DSC BIT masks
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
@@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
 	int stream_sel;
+	unsigned int dsc;
 };
 
 /**
-- 
2.31.1

