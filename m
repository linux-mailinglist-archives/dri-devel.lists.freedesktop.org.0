Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED956934F3
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339010E3E6;
	Sat, 11 Feb 2023 23:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1810E3C7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qb15so21888329ejc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipFzsK4uevaNSa5kzoZBFwGfAOGsYkb27k28u0kwQ20=;
 b=pAX2awFK8vFG9EZ8Bo4UrqW6kSutSET6A4/New4ORfBa7Y1+ve47WfO5OVDg53gywT
 qESqQwxUwi1AC5zawnU6wU+i5R9MRNAuot0xJ0C+9NFQ9X4ymXePoEgGfVj40yfye1bx
 Xz8WT3VQh/v26/tc2QSDwwoFVFCi5uzT7zNgv/9UM4EERJzozx2Mky3BHMEkQbcNelCG
 CJylKpje16dl0eaiOaeOZvH9h1xD3YFICU+vecOvnwXbljOyl66ivWSs2xXe9iX7Nsok
 ecAiRY/UaSo88Ed36ZR7cRWmv0UdMiN9JEYxYuJcYCyy2dQXBAcIcGNTCtbmrH2NANWh
 AFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipFzsK4uevaNSa5kzoZBFwGfAOGsYkb27k28u0kwQ20=;
 b=d901ofL0dnzGj8v4cYF5DizLf7N6EqhTxdCfclVOIMFwYEHFHg5EHP1qwef2bmcEfN
 G1USMetQhldjGctb2tnnH1wyHS8Qykfg1mImsruAcwYjxzUvZRNZbS0zcyqdzCVI5RH7
 uhQipfXPVuPiVg6pXVbVtvfejPEmUafaifSTgdy/d7Y4n35t14jUP6OHr0mkFKuWgCNz
 vMjhfdq2VkQHKLiFLUsEJMf1h+v2D6o7NPz83Q/mc7NwPvYIK2EupVxR1AG9tRg92X6M
 ZRW4I8qZ7XML9Gs7/2kVKjxUZEP8iuBYEX8k6am6YvNvDXc5i1sumzE+XG3v3AbwYUzS
 GRJw==
X-Gm-Message-State: AO0yUKWkDCcyXIo4PpJzgcp2kw8gvYdyHEnJYN5ainN8X8abcTSRtQAY
 arSKl2DLD0KJdk81eOmB+Huy9g==
X-Google-Smtp-Source: AK7set/qn8UJiLCojvQR+k5ns46NMC0RWElJ6IBH3497bDqzyBKWfWM9MCJv32BBmhw2nJ9T3wo0WQ==
X-Received: by 2002:a17:906:f1d0:b0:86f:b99c:ac8d with SMTP id
 gx16-20020a170906f1d000b0086fb99cac8dmr22167517ejb.44.1676157197383; 
 Sat, 11 Feb 2023 15:13:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 13/50] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA
 SSPP clocks
Date: Sun, 12 Feb 2023 01:12:22 +0200
Message-Id: <20230211231259.1308718-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
SSPP blocks used for the cursor planes. This has lead to the confusion
at least for the MSM8998 platform. In preparation to supporting the
cursor SSPP blocks, use proper enum values to index DMA SSPP clock
controls.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550 on top of next-20230116
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e3460b35058f..e390be4ef10b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -525,9 +525,9 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
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
@@ -542,9 +542,9 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
 		.reg_off = 0x3B8, .bit_off = 24},
@@ -569,9 +569,9 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
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
@@ -609,9 +609,9 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
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
@@ -638,9 +638,9 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
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
@@ -666,9 +666,9 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
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
@@ -685,9 +685,9 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
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
@@ -705,8 +705,8 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
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
@@ -734,9 +734,9 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
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
@@ -1209,9 +1209,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
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
@@ -1226,9 +1226,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
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
@@ -1264,9 +1264,9 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
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
@@ -1292,9 +1292,9 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
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
@@ -1326,9 +1326,9 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
@@ -1337,9 +1337,9 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
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
@@ -1365,9 +1365,9 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
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
index ddab9caebb18..e6590302b3bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -515,6 +515,8 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_DMA1,
 	DPU_CLK_CTRL_DMA2,
 	DPU_CLK_CTRL_DMA3,
+	DPU_CLK_CTRL_DMA4,
+	DPU_CLK_CTRL_DMA5,
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
-- 
2.39.1

