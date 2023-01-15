Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48EF66B112
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 13:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D64F10E0F5;
	Sun, 15 Jan 2023 12:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C2D10E104
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 12:42:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s22so27261684ljp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 04:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uhk6AG+vgVStc/vBGK1JOmzHraPBW70vYQnmsaNQwVk=;
 b=bOXCLBB/Dw6sq3EQ2QjASZRL/hyEYdhHl5/T6dKrYi48iISarIzTfKPxv8t9pHoKpT
 SyJEpr2HCll1a8ho2e1HilFEkorRdS9egGkmFbv4o+2R9TIBLeWNRK3rT4CldJd8GxNu
 BBg6zabIMvfP2HIwm4vHC5AWxEJhJ893bfikmcpdNSboXOyXaMce0yJ3b4aDbiofxU56
 bB5F+nuoiiwib8FbgsT+GJzzaBhVc1Vm6G6gWYrY+YeOQIrcI4loCXKL8VVohvZPGlTk
 dYQR6aLNPt+K0lfVLsP95MEylDFlvfupczMRJQ9OaQMjMJxkXGIzgrXwcA25JnOSKjt2
 mk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uhk6AG+vgVStc/vBGK1JOmzHraPBW70vYQnmsaNQwVk=;
 b=S8kQn9V23CiGdJeeGUAYWrVVjBOaJkdOioKv4EKsy+gdXjcI0w6zu/CHJ/1OOZc3la
 KCOaFbddQhGgRNu3tg3JXlqz3C+2AzskammYitxrw8r3T346QVUeoHFUtuv8LHOlFml2
 xUEoIvzEo/jOYEivrflXJCEy7Crw7ogcoa7JqdoBRjnVKkFIOd7/711Fa7j8xYPHch1K
 f6ndFYwdEzyox9l/pMooPYMrizsPBFOyDzhYRYx2qNLPCWYBPpFSI4Gw0jIqw+MjH57P
 MhZWJsZ3kmn4iEESiI7C9xTx9YuDIpb+/McKHR4f8IDxhS/qamzINwYn+layRlVQxakY
 CmBw==
X-Gm-Message-State: AFqh2kqyOT5nx4Oo+fV9fUd8gXig38CiR1usdw/A6AYZuG+4bKwkpV9u
 Vaaf8+PsU/Npk21x2a+yvR6GFw==
X-Google-Smtp-Source: AMrXdXt0R9R6hjZfgiXQa0o+XQK2FtwQdalpX2Gcdixk5YUSBbV9ozEAiuuee9Uf36ty3KjwViQC1Q==
X-Received: by 2002:a05:651c:2de:b0:282:fe0b:d167 with SMTP id
 f30-20020a05651c02de00b00282fe0bd167mr1992536ljo.7.1673786521181; 
 Sun, 15 Jan 2023 04:42:01 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.85.102])
 by smtp.gmail.com with ESMTPSA id
 22-20020a2e1456000000b0028559373a31sm2688243lju.112.2023.01.15.04.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:42:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP
 clocks
Date: Sun, 15 Jan 2023 14:41:43 +0200
Message-Id: <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
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

DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
SSPP blocks used for the cursor planes. This has lead to the confusion
at least for the MSM8998 platform. In preparation to supporting the
cursor SSPP blocks, use proper enum values to index DMA SSPP clock
controls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ad0c55464154..b0f6e071fe4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -522,9 +522,9 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -539,9 +539,9 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -564,9 +564,9 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -602,9 +602,9 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2BC, .bit_off = 20},
@@ -631,9 +631,9 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 			.reg_off = 0x2ac, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2b4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2bc, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2c4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2bc, .bit_off = 20},
@@ -658,9 +658,9 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2BC, .bit_off = 20},
@@ -676,9 +676,9 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -696,8 +696,8 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
 	},
 };
@@ -724,9 +724,9 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 			.reg_off = 0x28330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2a330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA4] = {
 			.reg_off = 0x2c330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA5] = {
 			.reg_off = 0x2e330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2bc, .bit_off = 20},
@@ -1199,9 +1199,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
@@ -1216,9 +1216,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
@@ -1254,9 +1254,9 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
@@ -1282,9 +1282,9 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
@@ -1316,9 +1316,9 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
@@ -1327,9 +1327,9 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
@@ -1355,9 +1355,9 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
 		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
-		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
-		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 56d98b4dd2ac..9c96920e1849 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -513,6 +513,8 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_DMA1,
 	DPU_CLK_CTRL_DMA2,
 	DPU_CLK_CTRL_DMA3,
+	DPU_CLK_CTRL_DMA4,
+	DPU_CLK_CTRL_DMA5,
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
-- 
2.39.0

