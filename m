Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76A7BAC04
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F9510E4A2;
	Thu,  5 Oct 2023 21:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6C210E4A0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5045cb9c091so1900570e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541230; x=1697146030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGY8XNUMIpqcQ8toHqOGCriEZZdnRFn/WfV+Pd3FFIA=;
 b=K3exDPT8z+Jd1F+Pyr9LUU/3xnlMyJDRBhaBkqBG+5jTpKrztGfH42XVSlmfKO2f63
 E5ww3annTeq+Xrn5NRzQaWHoRH6mXlYfussY3VDkCVU+QaewXN6IBQGphZviYanaIkrF
 BWBFArIp8fZJspaIfVwpwFraWWwlxl7j1oTgMGvVVzMWUIp9mszT+4L+1HHlBDtItOOq
 8stnswaOIbEqrXH6ySIL05fbj9jb4/cyIkOTq74HXyiQqQ9c1Ic24eyK+ZmGcYStgLpD
 j9fGRlEVzzmwYVuALx49iD8Zj9cctxISua7Yr+Gz3tWPnx29IK5RKN6HNYzi8yIEwec7
 w04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541230; x=1697146030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGY8XNUMIpqcQ8toHqOGCriEZZdnRFn/WfV+Pd3FFIA=;
 b=xP52tbJ6D+plXAhJ9fz+AToFMHLnjQyL2UlHW/H9cSlB0Y2haHcV10mYs9e/hOkqI9
 mf+p6rti6o5Xh2498TeqzS2czLgGeTtbMUQmAobDNHGNpGJjWlVICwvOIVRodfW35l/D
 F4R3gNTNr4QEAXr2qKPUknTaSNI//A6jVDRcm5mKw/RLe7rqqnj5bI6PXF6elTpSlM/m
 C+iEHVNPzJomW64BygVJvPTVQ4vkolAcIBCdE1DIYpm3zxWjGi9op0VAcmf83WlXHBYs
 v08GqHuI3VYmUDepaa8qXR+H7V/TKUdkuhUcGgYZAMSk4HWNvjvx7DmbHZBz6ZZxvWjT
 +/qg==
X-Gm-Message-State: AOJu0Ywwq1l0zMWOLhYUir8ATIoqhiVkCKngTewMSYVIb++ftp30fKpX
 aXb861CPbAIRPFmvDZ7ZMECD0g==
X-Google-Smtp-Source: AGHT+IGeFPlbwHytXW0CEgJMbHl//wND0YtqmClaEpjL6xHAM4n5lLa5EjlYeDA8/2RITOAc7A/usw==
X-Received: by 2002:ac2:5b9e:0:b0:500:c765:bbe with SMTP id
 o30-20020ac25b9e000000b00500c7650bbemr4988725lfn.0.1696541230398; 
 Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE,
 QSEED4
Date: Fri,  6 Oct 2023 00:27:02 +0300
Message-Id: <20231005212703.2400237-10-dmitry.baryshkov@linaro.org>
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

Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
are all related to different versions of the same HW scaling block.
Corresponding driver parts use scaler_blk.version to identify the
correct way to program the hardware. In order to simplify the driver
codepath, merge these three feature bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23c0d4c85668..cccafee33825 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -31,10 +31,10 @@
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SM6125_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SC7180_MASK_SDMA \
 	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index fc5027b0123a..ba262b3f0bdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -51,9 +51,7 @@ enum {
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
- * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
- * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
- * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
+ * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
  * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
  * @DPU_SSPP_CSC,            Support of Color space converion
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
@@ -72,8 +70,6 @@ enum {
 enum {
 	DPU_SSPP_SCALER_QSEED2 = 0x1,
 	DPU_SSPP_SCALER_QSEED3,
-	DPU_SSPP_SCALER_QSEED3LITE,
-	DPU_SSPP_SCALER_QSEED4,
 	DPU_SSPP_SCALER_RGB,
 	DPU_SSPP_CSC,
 	DPU_SSPP_CSC_10BIT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 7e9c87088e17..d1b70cf72eef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
-	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
+	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
 
 	if (test_bit(DPU_SSPP_CDP, &features))
@@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			cfg->len,
 			kms);
 
-	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
+	if (sblk->scaler_blk.len)
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
 				debugfs_root,
 				sblk->scaler_blk.base + cfg->base,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 43135894263c..ba3ee4ba25b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pipe_hw->cap->features &
-			BIT(DPU_SSPP_SCALER_QSEED4)) {
+		if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
 		} else {
-- 
2.39.2

