Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC064AF853
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F1B10E40C;
	Wed,  9 Feb 2022 17:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5710E50A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b9so5552500lfq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcKdYcy2gg8ZNxU2vs4D1XtYhBHKzBGRudwCCATIQNs=;
 b=b8IR7h5dbRXHphEJjKal5av2yFLfFOoWDbpU/y21y7SUYjXIY3R6u4gHM5E7CnQUsT
 yPoUE1h7KasAhtKVMzYmbWzgaGwAPzYeGt6ARJQxgV1/X2O/JbXpWEVRg4WXGApzgJFQ
 Q7zBeky8DJNnb/P3wwz9eiyPPYMSosqlV0RJ/I2fo5eeg5UQcWm23Q5lhM26hqwtmZZ4
 9mA0rgMoPxvfp2kRlb0aUsTFdsPVzTkjliKap2hcDnh03/sILrrMUcIDHtHxwb8q1JGJ
 n2ZNZ3CFDziviIfDkH4meJ88URKtFxl4ajc7ijVsOjIPDQI8GOYjd24RRkUs5FUHB+m9
 lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hcKdYcy2gg8ZNxU2vs4D1XtYhBHKzBGRudwCCATIQNs=;
 b=rYgbWs1+zWiENW7HBsD0pylF5Arn83UHC52vEd2r0RTbAh2Pw6nPeKOGRph/Dtx7R2
 +yj2qcesPzhFs2rmTb3A/b2jg09JLiB3dz9s+fNVdN4mGtcIwxzH3wh7gppss12IvxeM
 +EZgis+imEmhvKKqtLUIyJ61JFmLmdZYXkjTSthCMigSLElTVZq+Dde9DoLWYT0Q0giB
 +184YgSKTHVAdYM6TMWV6awk4j+VM6byqruzj1l+lSrnDZ7XPah7EwLR5uREFZ/0rKO4
 w68Ph4hXZ+LbP/0+Xjm6+IbWhmfmrGZM9GLSFI8SmGjafnV7WUW45HnaFAjdBRw1Ecgl
 aPGA==
X-Gm-Message-State: AOAM532lDSvp4QXLkAbNB6OlVCUYdGeJxbmSLvCydXm0iLy5El0celeC
 BvrQAUd/Sr/5AOBxd0I5Nw3VYJfuPmwCdg==
X-Google-Smtp-Source: ABdhPJz8kmyJanrqloX6/6HDqOUPHkqMRTOKp+o5kAZWrtD4BGIGG3nUvTZ+YjEh7LY3vLoUIZ85ow==
X-Received: by 2002:a05:6512:398a:: with SMTP id
 j10mr2241899lfu.189.1644427546995; 
 Wed, 09 Feb 2022 09:25:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 24/25] drm/msm/dpu: populate SmartDMA features in hw catalog
Date: Wed,  9 Feb 2022 20:25:19 +0300
Message-Id: <20220209172520.3719906-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa75991903a6..3564eea29563 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -17,17 +17,21 @@
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.34.1

