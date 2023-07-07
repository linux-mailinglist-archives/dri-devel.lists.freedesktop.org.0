Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40C74B803
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 22:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687F210E5F2;
	Fri,  7 Jul 2023 20:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD03910E07C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso2706602e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762247; x=1691354247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVNUqRxGSvqZGhfUwezGpm5aWkk2unbiIok3/DPMWHk=;
 b=Cw7DbQ+exWThzz4VkPpX5E/sLH//s6l21a73QaBM6njIFcVFlQQ7apaKHRfrd92Yq2
 T/iKbBR11tnnocKGPwQIv36zKvP+VQI10QH0UfZBtLQAL/zRaEC1pRfdYfJV25/Rj3ZM
 tYSJQj+YW5YsGoynnuxLzDdjkYFOvV3PeQBFAIYkaPpYwwMlYj/LQUwukl8/1Ua00V7j
 aWDjtg9U6QSQWvj451pNU4TUggjj8c2oaIbLx9Inq1GrBYDdMHfs8GeabeKGKS4qHZAe
 nvzWbMJeN7xWogsSSJ1GiLxPTOKrVXrPtTs62vrZJiKt337JND0s/GFcOVT+Y9o/RSP2
 G0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762247; x=1691354247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVNUqRxGSvqZGhfUwezGpm5aWkk2unbiIok3/DPMWHk=;
 b=JOTeWJoqJMxNDTTJomH+6An1gdtRsdQm9uz4cQJI+5ORIElR6v1CFXECzvvWXefj9v
 nRMG0b1mL1YNsn0tWXbDtZX51Ioo8SUtaaer+p0Si05oPxWjN+pouLZeOUAmea/pp4D6
 xjtq8Xc3OPfdZBdnulZnrdqgxFT2HjFc+BJ2ETlmxfdOsBXf2xwvucDxq9yjMG7n/hGr
 C5NQoTfrhCJbr9ry8Vo9XplRX0S3lu0bXhhF5kMoaSUAMADdzrY+A/2E3xkcfTjLZ2Ur
 Ji4DS5zhqA89+U3Y63vzIa4bij+1h0QNdiey8cdsFR2a1NiHYc6/YepA1lGjqvWdzOHm
 PcxA==
X-Gm-Message-State: ABy/qLbIBAMS8kCj0V0zldY0qlvNqwuF9sMZMUH29GDwS9YbBswJRPjd
 4ITBGXlkJ86yMBl1zxefzsM0AA==
X-Google-Smtp-Source: APBJJlHRAT7NBD93kQ4JaTf3hfiIrKgHXC6VAhcG56WhpT6ayg3RO3b8QJg9f4EMD/gb0dT+QSpe9Q==
X-Received: by 2002:a05:6512:3111:b0:4f8:52a8:d123 with SMTP id
 n17-20020a056512311100b004f852a8d123mr2133303lfb.12.1688762247008; 
 Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 03/13] drm/msm/dpu: use devres-managed allocation for
 interrupts data
Date: Fri,  7 Jul 2023 23:37:14 +0300
Message-Id: <20230707203724.3820757-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create interrupts data structure. This allows us to
remove corresponding kfree and drop dpu_hw_intr_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  4 +---
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..945f34736206 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -6,6 +6,8 @@
 #include <linux/debugfs.h>
 #include <linux/slab.h>
 
+#include <drm/drm_managed.h>
+
 #include "dpu_core_irq.h"
 #include "dpu_kms.h"
 #include "dpu_hw_interrupts.h"
@@ -441,8 +443,9 @@ static void __intr_offset(const struct dpu_mdss_cfg *m,
 	hw->blk_addr = addr + m->mdp[0].base;
 }
 
-struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
@@ -450,7 +453,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
 
-	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
+	intr = drmm_kzalloc(dev, struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
@@ -465,11 +468,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	return intr;
 }
 
-void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
-{
-	kfree(intr);
-}
-
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		void (*irq_cb)(void *arg, int irq_idx),
 		void *irq_arg)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1f2dabc54c22..b0d7bb073203 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -70,15 +70,12 @@ struct dpu_hw_intr {
 
 /**
  * dpu_hw_intr_init(): Initializes the interrupts hw object
+ * @dev:  Corresponding device for devres management
  * @addr: mapped register io address of MDP
  * @m:    pointer to MDSS catalog data
  */
-struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *m);
 
-/**
- * dpu_hw_intr_destroy(): Cleanup interrutps hw object
- * @intr: pointer to interrupts hw object
- */
-void dpu_hw_intr_destroy(struct dpu_hw_intr *intr);
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 85b8c9cc99ef..ef232dc838c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -807,8 +807,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
 	int i;
 
-	if (dpu_kms->hw_intr)
-		dpu_hw_intr_destroy(dpu_kms->hw_intr);
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */
@@ -1095,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
+	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-- 
2.39.2

