Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF97BAC01
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622B9891D7;
	Thu,  5 Oct 2023 21:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F7F10E4A5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-505748580ceso1812679e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541229; x=1697146029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
 b=dEVd67osTTMbJp+tVHziOXNRIVdEm0aJz9Z3a3IgktNdomEczem6EJX9TnIbwldeE1
 LozDi2RqWaxA1HKRayulpc5oMoqgjlsa6k19Xx3o/BhpQPtuzYbGKv4iHAVSfoekAPO5
 wl8aKkUHnv55xv0Ls0CLbWwG5o0erqBrmfhWiFxYXBv7OW/Oyd45y0btKCb8eSZjovD2
 4A0NExJQ73ueFyrxuGBr/37Mu0Tsw2Fdn8ve7vIgNnBFkj0jlNluF1Af1xA2KthWvYex
 519MM3MR6iXkMH9fu/p43jWJG7DcPQS7MaEvY3TG6rEeRknYbqR9+zn0kbfWdNCDCalc
 8pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541229; x=1697146029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
 b=s+WvdzIx0JFeQyHeB6tmCQoe867dq13DteqErh5xEAEm8CyoanEjh2xEDUGcdgHOTw
 fRpppoxgYDO/nRCrICMqfJIGlTuZbfjnR3eTvAUNq2DCC90UQWiqF/1uis6KlPZYTM4v
 6qzBw8NmSMUn0X38yBLudbSBvF2t+CkmvoNbgh+9QEUlqmfvX1rkRerf1FfOw9ALV4Z7
 Nwt0UBPAKcgJD3dbxyTLISwq04YJBbByRtANotAT9UXnJmBzuUqpSLM/Vw5nNHgZfyFH
 L5jkXmYzWv5lHnGdiuGBtFMrggaT6K3mBixZae8rPTQcs6r0Kd+mAecT2/8DCcmo1UWL
 z1qA==
X-Gm-Message-State: AOJu0YzGmENmjkwUFp3mgUqOY42m/4X/UNVBzvsK/mBQw8mg0VOs/4Z3
 pVqQp9thGwiqT2AeENayu1pxog==
X-Google-Smtp-Source: AGHT+IE61WKg2qEsPtNBH3ocjcXEL1yByatl5Bf/fVU2tmLzVIv4CUpC2bT2hPMSBX7xXOUfBnHq0A==
X-Received: by 2002:a05:6512:1242:b0:500:a378:db71 with SMTP id
 fb2-20020a056512124200b00500a378db71mr6845000lfb.57.1696541229714; 
 Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 08/10] drm/msm/dpu: rewrite scaler and CSC presense checks
Date: Fri,  6 Oct 2023 00:27:01 +0300
Message-Id: <20231005212703.2400237-9-dmitry.baryshkov@linaro.org>
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

In order to check whether the SSPP block has scaler and CSC subblocks
the funcion dpu_plane_atomic_check_pipe() uses macros which enumerate
all possible scaler and CSC features. Replace those checks with the
scaler and CSC subblock length checks in order to be able to drop those
two macros.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ca02f86c94ed..d1480ff2574a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -21,21 +21,6 @@ struct dpu_hw_sspp;
 #define DPU_SSPP_ROT_90			BIT(3)
 #define DPU_SSPP_SOLID_FILL		BIT(4)
 
-/**
- * Define all scaler feature bits in catalog
- */
-#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
-			 BIT(DPU_SSPP_SCALER_QSEED2) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
-			 BIT(DPU_SSPP_SCALER_QSEED4))
-
-/*
- * Define all CSC feature bits in catalog
- */
-#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
-			  BIT(DPU_SSPP_CSC_10BIT))
-
 /**
  * Component indices
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..43135894263c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -740,8 +740,8 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-	    (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
-	     !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
+	     !pipe->sspp->cap->sblk->csc_blk.len)) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.39.2

