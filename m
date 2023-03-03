Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4E6A9801
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B4C10E5EA;
	Fri,  3 Mar 2023 12:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457810E635
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i9so3464386lfc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwAz0xVIl3ix2Cu839FFxQHXAtm9WjHE2GW8tc2D1EM=;
 b=pJvdZZqYKpDXAiz2VwBjPeDHeaq+n+OpNGNdxSziJDpKCQ03Y4DefjVEhzjdrMLRJd
 8HQBdhDB7yTD4s2Wrv2r4cJDaBT7oDj5YVdUS8aaCbWTjAMabM7ezWPuFS3HPgppV1if
 g7Q6UpRgKq0hmvTDo8WVeMaW191u8yyTBsVuJk6gVW0aNaNiXvVq8XV3RLYWEyujhb2x
 ggMvpv5LMAANQccjS7HeB8tLolnRKBlChLDSkNEL1j8zsXCcHTk18VCcUpgzrQ3LNNue
 FaqOHDrUedVkd//GK/YK2z+Qpv7v9dhm2lFFEZpfslb1nAcRH57UrXKWnb0gqyPpB85A
 AIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwAz0xVIl3ix2Cu839FFxQHXAtm9WjHE2GW8tc2D1EM=;
 b=XtC31HnZG62aOZyKDTkxEXSwcaRII5twQVQh8phvLhwPYMxOGCqrife0CrZcIdirFY
 kH97dY+a0sNE6248s4dTPN5AIOZCm8Ih9M2v3Qdm60Yi/NkRsa2sqidJhCqFGTE0bAKk
 4PAhlVrjgymCqeCymgCh78WUR7MoVXTnDEdac3N0RLxH6/OPMpjy8iJty/yI6m1Grd3T
 BXM7cGIH4qTdsgLYmtxfXIdE3rqwbCsksvQBZUBqxbme227TwXkHfbUryEtqovbcXOBI
 Q4m9oRkBxaKBqyCXEOMDfxYvTU8O5CWy24XhLQCG3fdN2TE1LmX8z7M4M7g+d6RnwxxZ
 gM7w==
X-Gm-Message-State: AO0yUKXzPk5Y7JLMpEpsPnh5IssuvTOz+9/bJpMt0NVAzVs3YPW1oAB7
 +Af3gQrq+45k2bjzu1gNZvNRMpHWpKAAnx1G
X-Google-Smtp-Source: AK7set+jgSDQjtgXys2lHYAuOnWxeJVrvgaf2FmU3AyKrwhCtvDqmTSiytRzjxcyKou68LOFNny3/w==
X-Received: by 2002:a19:ee06:0:b0:4de:7b5b:f16f with SMTP id
 g6-20020a19ee06000000b004de7b5bf16fmr548741lfb.7.1677848265102; 
 Fri, 03 Mar 2023 04:57:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 28/30] drm/msm/dpu: populate SmartDMA features in hw catalog
Date: Fri,  3 Mar 2023 14:57:23 +0200
Message-Id: <20230303125725.3695011-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enabling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Per Abhinav's request enable the SmartDMA features only on the platforms
where the multirect was actually verified visually (sdm845 and sm8250).
An (untested) enablement on the rest of the platforms comes in the next
patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 44 ++++++++++++-------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cf053e8f081e..1fc0dfbebb7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -23,12 +23,18 @@
 #define VIG_SDM845_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
+#define VIG_SDM845_MASK_SDMA \
+	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+
 #define VIG_SC7180_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
+#define VIG_SM8250_MASK_SDMA \
+	(VIG_SM8250_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+
 #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
@@ -47,6 +53,12 @@
 #define DMA_CURSOR_SDM845_MASK \
 	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
 
+#define DMA_SDM845_MASK_SDMA \
+	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+
+#define DMA_CURSOR_SDM845_MASK_SDMA \
+	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
@@ -1196,21 +1208,21 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK_SDMA,
 		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK_SDMA,
 		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK_SDMA,
 		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK_SDMA,
 		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
@@ -1251,21 +1263,21 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK_SDMA,
 		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK_SDMA,
 		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK_SDMA,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK_SDMA,
 		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
-- 
2.39.2

