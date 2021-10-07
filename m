Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B2424DD7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342746F39A;
	Thu,  7 Oct 2021 07:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712976F395;
 Thu,  7 Oct 2021 07:09:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D70CC61130;
 Thu,  7 Oct 2021 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633590588;
 bh=gvoMMCAWKy36jkFwVvyBX3pBuMN6exzVOCqmSKFg6Nc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PlzBhb/btG3y2G8pIgqOh7klQdPTa74w6eDGHwp+jpEI5+aELFMIpXMJjCk7pUEGK
 GdMEtcxFvW1WTeO1ExmdsFAeRUyXNukUKoWcq03lZRM58BqSvYs4lMKqiWrgA8ZI24
 3ASiu6nAi5mG8sJlOOX2gxWRT1H+xcwph/Uuz7NxjQL55zRuf1rtgBVh/X1jARgcgF
 wyynzJONEgYJkds2nn1rkmrsS4ANjPZpaj1iMVmZj8YFm4KvXam5ozXtQIlsmzrfr0
 TIfb9A+cMGT6a4D84Yto8WdZnpwTT8l90yHaUlH3YAezv59T+a/VzlZCIFKM0lGe1A
 R3LOE7XoWqi+g==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/msm/disp/dpu1: Add DSC support in hw_ctl
Date: Thu,  7 Oct 2021 12:38:56 +0530
Message-Id: <20211007070900.456044-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007070900.456044-1-vkoul@kernel.org>
References: <20211007070900.456044-1-vkoul@kernel.org>
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

Later gens of hardware have DSC bits moved to hw_ctl, so configure these
bits so that DSC would work there as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since
v1:
 - Move this patch from 6 to 7 due to dependency on 6th one
 - Use DSC indices for programming DSC registers and program only on non
   null indices

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 3c79bd9c2fe5..8ea9d8dce3f7 100644
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
 
@@ -120,7 +123,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 
 static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
-
 	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
 				ctx->pending_merge_3d_flush_mask);
@@ -128,7 +130,6 @@ static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
 				ctx->pending_intf_flush_mask);
 
-	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
 static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
@@ -498,6 +499,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 mode_sel = 0;
 
+	if (cfg->dsc)
+		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
+
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
@@ -509,6 +513,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
+	if (cfg->dsc) {
+		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  BIT(DSC_IDX));
+		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
+	}
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
-- 
2.31.1

