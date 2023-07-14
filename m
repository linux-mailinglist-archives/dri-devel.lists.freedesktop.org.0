Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898D752EFC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7710E7C3;
	Fri, 14 Jul 2023 01:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036FB10E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:55:07 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b703d7ed3aso21283161fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 18:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689299705; x=1689904505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPcgkOPls48kOZUuhjs762Sf1Fh9cTy88sR434ar5b0=;
 b=jcsx+2FBDnPPc58g8YDZ1jsQiT/RaBx51fAPmLr91QmOz9c5gxzV4zZ4ZjetGMNY2H
 G7q63XHIS353BAibbUrgBAGlSG2prj/tF1L3dTgIqYP5phALYy+BkkwynvRTdPKYhphh
 T7NzqFP6mo8LNcMvF2Znh+uE/bSRnEHvb/PjxDK8cJCJDr7a8b7MDO9QsecG/AL5nfLe
 CmZUVIFDdDJAxVxaofkVGA4JWJjHeUdkv4I/sAIJsvQewsz/aM6qhObmFPzybe6LYPwa
 fmiRKOGP76oxO1D16hI/MAVA1AuOkPFQSYESLdF1DuuPn6q9LvqknQRUiQtQa/r6cdLl
 UBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689299705; x=1689904505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPcgkOPls48kOZUuhjs762Sf1Fh9cTy88sR434ar5b0=;
 b=AI8zE35bHHU3sZU+xCwjwnfIOdbzvGL5gD0ibvuGlnxe+qWigs+2ML+CqyyxtFdj3r
 4z9MRpZn1jmJaJNlfZU4cH7DmcqPH64FIC6AdTAuhl2eriA7hECLaX9HuqQO/iWSc1bs
 JuFDBnBuTm3CAC2+bWpfWBl1IFNySmxFsla/kI/juXLAboILwSOenBIDlB/wjKCsKE+2
 XDnc4BbZGbs0XXvDiZzwCuhK99mSk+xq2bnfC2I8uBS0fnPMI0WJBBFaDu7mjjd6E/bv
 ne4MDXhD7Y7UjAWfmq3vPmISHBFV+/b043dS+fmAxwfAvmA2CvlI7opWOUIhED6I0oYF
 lRLg==
X-Gm-Message-State: ABy/qLY9bB3QuZ0b19E4y1+WqMXIGVMA1xm5Em5WXwKl49aZ2am6sbRi
 vxTOV3WLpoqEnF/yiEUBkIN6iw==
X-Google-Smtp-Source: APBJJlE9xEH0dTBoAM8EChNeAUnOL40zKh11xvYu9/hVUcJH1W8OHfLu1HLb8XXPuDcQdWqf6THuXA==
X-Received: by 2002:a19:4f1b:0:b0:4f7:6966:36fb with SMTP id
 d27-20020a194f1b000000b004f7696636fbmr2155697lfb.12.1689299705541; 
 Thu, 13 Jul 2023 18:55:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 18:55:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/4] drm/msm/dpu: drop the `smart_dma_priority' field from
 struct dpu_sspp_sub_blks
Date: Fri, 14 Jul 2023 04:55:01 +0300
Message-Id: <20230714015503.3198971-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
References: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
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

In preparation to deduplicating SSPP subblocks, drop the (unused)
`smart_dma_priority' field from struct dpu_sspp_sub_blks. If it is
needed later (e.g. for SmartDMA v1), it should be added to the SSPP
declarations themselves.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 68 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 -
 2 files changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index daec3f2758e3..63304c2ee6d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -251,11 +251,10 @@ static const uint32_t wb2_formats[] = {
  *************************************************************/
 
 /* SSPP common configuration */
-#define _VIG_SBLK(sdma_pri, qseed_ver) \
+#define _VIG_SBLK(qseed_ver) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
-	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
@@ -267,11 +266,10 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = NULL, \
 	}
 
-#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, rot_cfg) \
+#define _VIG_SBLK_ROT(qseed_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
-	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
@@ -283,11 +281,10 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
-#define _DMA_SBLK(sdma_pri) \
+#define _DMA_SBLK \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.smart_dma_priority = sdma_pri, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	.virt_format_list = plane_formats, \
@@ -295,13 +292,13 @@ static const uint32_t wb2_formats[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
@@ -310,64 +307,63 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 };
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK;
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK;
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK;
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK;
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
+			_VIG_SBLK_ROT(DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(3, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
+				_VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK;
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK;
 
-#define _VIG_SBLK_NOSCALE(sdma_pri) \
+#define _VIG_SBLK_NOSCALE \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.smart_dma_priority = sdma_pri, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
 	.virt_format_list = plane_formats, \
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE(2);
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK(1);
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE;
+static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK;
 
 /*************************************************************
  * MIXER sub blocks config
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4e8fc3bbc240..cc1800e324dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -392,7 +392,6 @@ struct dpu_caps {
  * common: Pointer to common configurations shared by sub blocks
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
- * @smart_dma_priority: hw priority of rect1 of multirect pipe
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -406,7 +405,6 @@ struct dpu_caps {
 struct dpu_sspp_sub_blks {
 	u32 maxdwnscale;
 	u32 maxupscale;
-	u32 smart_dma_priority;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-- 
2.39.2

