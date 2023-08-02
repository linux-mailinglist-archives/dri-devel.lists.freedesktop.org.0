Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA676CA55
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 12:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0391A10E536;
	Wed,  2 Aug 2023 10:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CFB10E531
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 10:04:31 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so101606241fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970669; x=1691575469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bh92DeTzmx0FcOgrWNxOJtI5fqtRUnI1//gTt5OX3PU=;
 b=sPlZzX8gYI7g/F2NAvoMCTawQCu3Y8Rd5Mx4NQzs3mI6g86RjrZ3iTUcBb4SewDQ+v
 Ohb2AI5QFNMSBk4a6KXTHZxQNywvVtNUpYvBiKgyZ7v07fX9W+/Dzr8i/cIfTKeRQQFT
 ykhhQ38mvLs4UB91umy7X0zgEFMFESRVU9sXFkLg0sy+K59S9VpsrtX8LSjasOC1pXbT
 3Pp5w+KKvzmksZd/D+dV+sUFPLTnIJ4uu/L+d46ZlS/+eWVBXBjcPPKJzR/n571wuGiS
 E258ph4QlTogJNitxLH4+yPth0f2iUeX35HGvS8f0rhy+OyBtVIK4JRaMKKDpN+ghqDG
 4ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970669; x=1691575469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bh92DeTzmx0FcOgrWNxOJtI5fqtRUnI1//gTt5OX3PU=;
 b=HM8EBG4R8WTcP2SCAcrNjDlb/cHbXVzYZVcCYuiLjwDQmsg3+vqissPfIGykoR/EGI
 eU81vfe0raaCrE+LFEtYveKHKFe9W7Okeww5A1I4nRKw8UCBTLbgc5UOsqbXP6VVjhCY
 iN5t2qWyz1zQElE0EBksvrBvN7/1rs+QYfl86qpIfB5lsTrjhjeFUKwMsyHOs/FwLYxs
 GvkOp+I82jMGYh69QC1/nyA33J1mZyRpcebttx92GmSaZXbrzTvQ35+tPkkIrK/9v7aV
 9aKqkEAAAlRn7DkwtcAyEBsN7ez+YbAaVHBb7ODdnbb1qCO69NBEShnmSzmGdWNo5aUU
 L6rw==
X-Gm-Message-State: ABy/qLYYdwLnku5F53XZqnn6dd75UbkZ5tYNThj9hJFcaZlOpR09279o
 7Yxzh9haRTucNp/QNSmpsm0b1A==
X-Google-Smtp-Source: APBJJlEGYoD/3eoQLP3jdBxUHEqFaEk5mjItlEAIhSLZxaWpCNvwSc0jVncQ+0KlAGEiG/sazWX5Rg==
X-Received: by 2002:a19:6418:0:b0:4f8:6e6e:4100 with SMTP id
 y24-20020a196418000000b004f86e6e4100mr4090768lfb.52.1690970669556; 
 Wed, 02 Aug 2023 03:04:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 03:04:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 3/8] drm/msm/dpu: extract dpu_core_irq_is_valid() helper
Date: Wed,  2 Aug 2023 13:04:21 +0300
Message-Id: <20230802100426.4184892-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
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

In preparation to reworking IRQ indices, move irq_idx validation to
a separate helper.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
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

