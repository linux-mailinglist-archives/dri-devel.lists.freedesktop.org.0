Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80F791FEB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 03:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB35210E16A;
	Tue,  5 Sep 2023 01:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A287310E158
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 01:25:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-500bbe3ef0eso2346533e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693877131; x=1694481931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/MhsyB/N1tLArQBGhN7szg960JxCRye9CpHDot6cMgI=;
 b=xOBx+UsFubjPN8b/ZPrUPPU+yulwWsurJjWTqY0JEVcsnTcPBkKCoVESi6PJTz3JTJ
 Eu8uRG2TOXbRM4tkcxDcXvV3b4Fc9A0Ij+rLxthnPqiDIlY7TzTEJ1/BsyNSraT17eQF
 qp33sqQfpdfWG+LfBR2CCofbf+dLWPQLumwG/Iev33eWqb8Na1MIbpDc0I5pAc9To4dG
 2CFRCdyN+TRl3ttQDtnQasLwkGJaj+oEZtaRG3G8mJVDi1yWkg6QBoETxt8uDyas9V1s
 oDiuZgQ56SkDSC/JOScHCj+4GL6FP3q/+EF5d3y+l5x2ZhVmUdwF5f2Y4rdrrellRDy5
 zkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693877131; x=1694481931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/MhsyB/N1tLArQBGhN7szg960JxCRye9CpHDot6cMgI=;
 b=O/gVqgOZ4DlfUYGIFcaK2/PkROsz1VmP9+9s1phJASYu8y5PMpRBpoCciJMX0At2Ty
 DyqwK76gSvvRoEEUWqF4y8F4H/Qkq/OlVmmqnyguUeJhQQO5K9BU3/vGIxzFXAq1tScl
 TRMYseFhRwxtRvT8KOtZXI4z3YY62XqYTwmnb8uJO8CEQCsylZSTzJtSLmHaqxhETMjz
 28YeZo6KnBBC0SZbG8qi/CkDIOv0Mg9ANZIu1xDQaRcBCy3aflstVK6Fva/bjw+6ySuw
 ThGcw5LG+jsyG1U8yj5vZDk0X3u3y2d23Ivh3HubpsLTmteCocMx5mRB1CMDI5NCZpPU
 AW/Q==
X-Gm-Message-State: AOJu0YzTp2CxUVPGc7yzfxRjcb/5ebf+VUSP1xdjlnzBLf5gojD+3nQX
 9OZCTwYaM3d/cvloSR006jmluB8cPVi/c3TR5rw=
X-Google-Smtp-Source: AGHT+IH0DKiodW3JxCgRkYIoZ0izC6tsZDEBBlA1yoo6e/Cr6+Fj3ZejA8TOns0f1p9Ax9m+F5Onwg==
X-Received: by 2002:a05:6512:4006:b0:4fe:4896:b6ab with SMTP id
 br6-20020a056512400600b004fe4896b6abmr4176631lfb.15.1693877130215; 
 Mon, 04 Sep 2023 18:25:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 18:25:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 3/8] drm/msm/dpu: drop the `smart_dma_priority' field from
 struct dpu_sspp_sub_blks
Date: Tue,  5 Sep 2023 04:25:21 +0300
Message-Id: <20230905012526.3010798-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 112 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
 2 files changed, 40 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ed7458991509..e9773274bdd6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -253,11 +253,10 @@ static const uint32_t wb2_formats[] = {
 #define SSPP_SCALER_VER(maj, min) (((maj) << 16) | (min))
 
 /* SSPP common configuration */
-#define _VIG_SBLK(sdma_pri, scaler_ver) \
+#define _VIG_SBLK(scaler_ver) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
-	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -270,11 +269,10 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = NULL, \
 	}
 
-#define _VIG_SBLK_ROT(sdma_pri, scaler_ver, rot_cfg) \
+#define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
-	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -287,11 +285,10 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
-#define _DMA_SBLK(sdma_pri) \
+#define _DMA_SBLK() \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.smart_dma_priority = sdma_pri, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	.virt_format_list = plane_formats, \
@@ -299,17 +296,13 @@ static const uint32_t wb2_formats[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
@@ -318,107 +311,82 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 };
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK();
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK(4,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT(4,
-				      SSPP_SCALER_VER(3, 0),
+			_VIG_SBLK_ROT(SSPP_SCALER_VER(3, 0),
 				      &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(2,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(3,
-					  SSPP_SCALER_VER(2, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(3, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(3, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(9,
-					  SSPP_SCALER_VER(3, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(10,
-					  SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK();
 
-#define _VIG_SBLK_NOSCALE(sdma_pri) \
+#define _VIG_SBLK_NOSCALE() \
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
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE();
+static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK();
 
 /*************************************************************
  * MIXER sub blocks config
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cbffbef11ee7..7c08bbd2bdc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -373,7 +373,6 @@ struct dpu_caps {
  * common: Pointer to common configurations shared by sub blocks
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
- * @smart_dma_priority: hw priority of rect1 of multirect pipe
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -387,7 +386,6 @@ struct dpu_caps {
 struct dpu_sspp_sub_blks {
 	u32 maxdwnscale;
 	u32 maxupscale;
-	u32 smart_dma_priority;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-- 
2.39.2

