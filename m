Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4644767914
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A901A10E7AA;
	Fri, 28 Jul 2023 23:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5CF10E7A0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:32:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so4561785e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690587122; x=1691191922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz1hKoDY38DT//BIw/FpyOAtOdxg6YreDjToq5km+Ks=;
 b=abUkMbCTmdB/Bya5vivhruYnFj+FqgrbDwvOXl3qZ9Z07it8CY8xUH0jhGpNJHwgWz
 Q1X+3c/wC+O4qd2U3Q5fjknnTs/M9g4mjvcDrqeIz7guXgwgsT1ch6aQplMXGwPjE8uX
 i/ANrXw8oNR04bn4fjJFE+EUyXMQazSisRDmX3oEe/uesrKYWiUSmzyldZGvCEvuEM9h
 +WC3zLsmH3S9aYrRb/d4Q3DkBPVE5vZjL5KKsTqv/0zoxnn10Nv1g8VZ9Xcyu3UUvdhW
 ZsQZzqJXFeVjeRRmneKkfBT8GxwtausRHmj92SdhnPmsuLUVLg3QOxgZRF/VlBxe51ar
 cm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690587122; x=1691191922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz1hKoDY38DT//BIw/FpyOAtOdxg6YreDjToq5km+Ks=;
 b=LQK4eBMIPatFC1LA/su/N2uu735g9KtA5DC4gnyTEU4nsdlKeHLTMlmpoG5hUgPCzO
 llekv1y4d732DlyBM2UaytosBGL2pFNIs1s64KdQCr9GzET7rvxlM9VtEJnhb6MlY1Y3
 VNByn+KA+Viy7UnCK5EjIaw82t6+UGecNRkgzTmb9hwh7AfhILQwCVyPebB6Ah/4uRBq
 W9BxDayQlfcTqBOFXjt0yoev+yVo06oCcInv5QLIGdZOgh49hDx9FoVw3bd7MAc87WxV
 XKVatoDdE7ELqkHJipEnjygYcxsxxdd9ib1tDhpcfZwb/O7Qrb3T5KXRSJXRQCEHKnqs
 IKGw==
X-Gm-Message-State: ABy/qLaKkzM3NCJa8AnC505793LFWTNAD7AqdtSnEKd0ImvaXw014qk2
 60CkU6z66a42EdcshK4aAzKaCg==
X-Google-Smtp-Source: APBJJlEF/t3tbnHJUjTfUgF9okNauvNaBleuclbixZhx2wu2SKBy6OFlfIUp7kHyanVp77Y4HDOGZg==
X-Received: by 2002:a05:651c:115:b0:2b7:a64:6c3e with SMTP id
 a21-20020a05651c011500b002b70a646c3emr2651731ljb.26.1690587122796; 
 Fri, 28 Jul 2023 16:32:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 16:32:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 2/6] drm/msm/dpu: extract dpu_core_irq_is_valid() helper
Date: Sat, 29 Jul 2023 02:31:56 +0300
Message-Id: <20230728233200.151735-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
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

In preparation to reworking the IRQ indices, move irq_idx validation to
the separate helper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 01a9ccfcd54b..81d03b6c67d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -200,6 +200,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
 
+static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
+					 int irq_idx)
+{
+	return irq_idx >= 0 && irq_idx < intr->total_irqs;
+}
+
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @dpu_kms:		Pointer to DPU's KMS structure
@@ -291,7 +297,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -344,7 +350,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -429,13 +435,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	if (!intr)
 		return 0;
 
-	if (irq_idx < 0) {
-		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
-				__builtin_return_address(0), irq_idx);
-		return 0;
-	}
-
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
 	}
@@ -518,7 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -555,7 +555,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	unsigned long irq_flags;
 	int ret;
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
-- 
2.39.2

