Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35187BAC08
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6ED10E4AE;
	Thu,  5 Oct 2023 21:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCFE10E49A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so1787059e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541228; x=1697146028; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h01w8L/kilJV1fo82p5qpWiI1oIXkPC5GnMBarPktWU=;
 b=hyAakhiFkCL/hNpvzPwPL+LkXP9KtfNWKpX5nc8tbwodRQJ6q67zdwSULe+7kAFSDS
 UVPmRe4XoHz7x9SXLShaPHjfTqhxCN+jyBu7vplfHeOByF5yDRVrKNHLOCZ1D4445OEh
 P2gdaOmSZeUrc3JBC3zNBGOGGnukRUoi4peiOABAUkek5xD+rPhHAvDFGJrfAJMBTaSM
 8gVcGwkUSd4oBhlEhve8t5Cb2TWY2OQqC+9XBKTKe+PxLuSszOXNqyB/Ez9r7wWjLlkp
 G9cM0diZXA++eWQ56pigRANIiBsH44w2mj7YDfz0hQ/ON6KCOaXYNt/1lXvQmZRn9A1K
 3OnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541228; x=1697146028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h01w8L/kilJV1fo82p5qpWiI1oIXkPC5GnMBarPktWU=;
 b=CR0ezn/LvGaBTh+pjRdr4FhFcYeUdGw2ANCfbFb/2hoF5v0k9vXwvGUN93lbmzQAPP
 mii5YNq5/Wv30a8fEoawbENKfTMYVUUeinLcepHmfhC8qwlQRutIlkN9GUDlSWUaZESf
 6KE01fa5u/Es3GSw8/pI5nzbRBJThktHEHS//9OIqTO6cTrMmbtiTTGzq05eepvCmNxm
 XXxM1FiTiX2ecN4T1nn3i82KU2xNpEu+poHTD1g8zuqsJeRk4RULGEckFF17b7FlV8ND
 gTsccEw/lqDFFTyngcmi28bETh0pLPKIIs/6+Fqnxyy1H7qNEaL3zvq4SH7FwIF0XZsS
 x6Wg==
X-Gm-Message-State: AOJu0YyUkKPuyywdgVp4F5TfUNtuPAGzlTAAC01VGmk2ilRcWw9UwGdk
 KQ9r6EVu3wJXCTBplC4F0RRU1g==
X-Google-Smtp-Source: AGHT+IGAdvN9QQxRArkdaOKhCmAufm6JJbElfOTnjbteVMx94jXyqSERjmVJ0HNTX+6TyHmktiZLoQ==
X-Received: by 2002:ac2:4141:0:b0:505:6fcd:dc46 with SMTP id
 c1-20020ac24141000000b005056fcddc46mr5361460lfi.13.1696541227809; 
 Thu, 05 Oct 2023 14:27:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 05/10] drm/msm/dpu: drop the `smart_dma_priority' field
 from struct dpu_sspp_sub_blks
Date: Fri,  6 Oct 2023 00:26:58 +0300
Message-Id: <20231005212703.2400237-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
index c47969ba7ed5..19ab36ae6765 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -372,7 +372,6 @@ struct dpu_caps {
  * common: Pointer to common configurations shared by sub blocks
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
- * @smart_dma_priority: hw priority of rect1 of multirect pipe
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -386,7 +385,6 @@ struct dpu_caps {
 struct dpu_sspp_sub_blks {
 	u32 maxdwnscale;
 	u32 maxupscale;
-	u32 smart_dma_priority;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-- 
2.39.2

