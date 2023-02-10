Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A489692037
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C6510ED2D;
	Fri, 10 Feb 2023 13:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB510ED32
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 13:50:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud5so16034563ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HLLhisC9CobeA/CvC0IpPzgGnh3OKWszAb7m9DO1ayI=;
 b=cAkW97y2+HDo1PejMMPYqqnXP/0/o+lIOcuHWo2/z582g4pNvN307Zc3hglO+QW9UG
 +EAAe+yL1sMRHGrxb8NmF9O0k/GMCJAWA4xgdTLHX9cBFV+eqzsmbqSKywrg/O0IMwCz
 vciZ7DQTTgVkFgLUy7whVbrHNCfocGwura5fWgEDoqkXZ917TQ3Ex8KYeEYkCStl+A6J
 C/yHyeTcn92jskP000bYfqT5je7JFb6MbQLdvNbqBYN1WfORDBQyhcW8HyRQsLjYDx6M
 +OFza4MCXgbyOMWYy6ZPywnzTxnUJCfnN6RoNHbJYXv0pfYQN1dkq7BZIeSxritEjE2W
 Syow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HLLhisC9CobeA/CvC0IpPzgGnh3OKWszAb7m9DO1ayI=;
 b=vm12iHk82gtVN3VV2OcvdKBGFGBACjK2ZtYWULKjRKF8nH57I8kkPTPsEkhxsFiCoW
 vyINmSP97wwiJ+/ObKG8SBqzXD3YiEryJ4LN4977FenfMwpwi1afqrT8EnCVQJvnnJ+L
 kAlia4Abx7m4FbUZTQRhbxs2iPTY7YY9s4Yja/ZrLN/jDpKW3Fl15eRXoP5f/xg07KcE
 wK/ps5AvRvTz7JT8Uz//3cRujSDk8MOVM6T3enQhXIBvsieaCiBLpZtm9UiHvaPm6tvG
 CT4KG8fHD4kZIV1gljNedW1hiySGB+L7Ifsk2qdm3AOc/F0J2KZMOzei3/j5FbJV9a9q
 UzmA==
X-Gm-Message-State: AO0yUKU4Rc+TRmsN20vkD3riQNB9V03F8LzBEeJ748wyPtigqX+Kn0iX
 1NwJeFj7O6ZwB8W7xg3Bl4f+0A==
X-Google-Smtp-Source: AK7set8McDsNCzpGhy32A31BWwkbNIhWeQvhRb405swL6v6rFs0P9F+nPIh7ivTe3xcIUckjsAwkIQ==
X-Received: by 2002:a17:907:2104:b0:88d:697d:a3d2 with SMTP id
 qn4-20020a170907210400b0088d697da3d2mr14790974ejb.54.1676037021558; 
 Fri, 10 Feb 2023 05:50:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j22-20020a17090686d600b008aeed39adc7sm2405404ejy.63.2023.02.10.05.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:50:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/dpu: disable features unsupported by QCM2290
Date: Fri, 10 Feb 2023 15:50:19 +0200
Message-Id: <20230210135019.925145-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QCM2290 doesn't seem to support reg-dma, UBWC and CSC. Drop
corresponding features being incorrectly enabled for qcm2290.

Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Reenabled CDP, exclusion rectangles and SmartDMA

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 71df24a134ed..23b22a9e8e99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -12,11 +12,15 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_kms.h"
 
-#define VIG_MASK \
+#define VIG_BASE_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
-	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
+	BIT(DPU_SSPP_CDP) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
+#define VIG_MASK \
+	(VIG_BASE_MASK | \
+	BIT(DPU_SSPP_CSC_10BIT))
+
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
@@ -29,7 +33,7 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
-#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
@@ -317,7 +321,6 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -2841,8 +2844,6 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.intf = qcm2290_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &qcm2290_perf_data,
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
-- 
2.39.1

