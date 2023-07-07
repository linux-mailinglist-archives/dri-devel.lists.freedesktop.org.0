Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151674B9E6
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8E010E61D;
	Fri,  7 Jul 2023 23:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3C210E600
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:56 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso38933091fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771575; x=1691363575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVNUqRxGSvqZGhfUwezGpm5aWkk2unbiIok3/DPMWHk=;
 b=ky18xDEpCcxPdBYOA4OrvCpTH8nC+UMHO6VbvoFOjkRmdKc+AWsH1YSBjHruGE+91T
 +h8jlBrezZ9TUp8++rMeMT03GDEzm4LYfF+ajrvBcWR7dBHVBffn8sZYW1kOglm9G3i1
 QpARwMMN7vuOauIdOa4zDonYmlDF6L/bYqozryf2MJzi9AwGCy0M46JA5x0ZKONW7wI1
 Hpae3kY1IB4XG3CXX/a2nEe3geYkeyruJO+sTEJr4M8LaQzKln5sm+GgFEbnBPZ230I8
 ZwTtajZVhTkqLlEynadIGk3nYMMZkCD3tVW6zGzv79OeVlCtXMb+xAZ8v+ibL1sVSubp
 Z9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771575; x=1691363575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVNUqRxGSvqZGhfUwezGpm5aWkk2unbiIok3/DPMWHk=;
 b=CZuZs5Lv7E6zx5OSCjGzV9SxB6u9spPO8r1DNkyrlbiX8/mJVCsPrRePfYmWL7ayBY
 KHHLpVRXIxqI9aQZ9yGssJeSCaxHcdnqwAxLEYP7P0gtYOX+ayv5v9BXJfaO2kPJKWhl
 Dw21zl4RT8I3eZRDY9ZUD75TcJqdnzeMNxjXfTRPb4GO3ondpFSTjRRiSbJ2T1GWvUQ8
 CltpLW4e1+zrQVJ3kpoc/8z/L3nHrvJF6+Y64VdDMdY8PbTSFqFScwQltZaEFCBzFYVE
 PQKKOJVD306Bwr4g18Ry79YNVuH+a4cWurQPXdP0iNYPMmU5RBlohVbZCrqAj7KV/+CP
 K6yg==
X-Gm-Message-State: ABy/qLZqS+l+LHmufvQTFifhF4kwOi8LYRsmH/d6me8XKxA5kmvK4NTF
 AeZG88iFdYsole/g0akqqmuS5w==
X-Google-Smtp-Source: APBJJlEYhsfe/+maTxYWKGdBUzPHjbYa+DL0nxBD9q2MNZZTJH1vH1KSVi9yt9WBhr0kWYsCeHfkXA==
X-Received: by 2002:ac2:58fb:0:b0:4fb:92df:a27c with SMTP id
 v27-20020ac258fb000000b004fb92dfa27cmr6096033lfo.25.1688771574912; 
 Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 03/13] drm/msm/dpu: use devres-managed allocation for
 interrupts data
Date: Sat,  8 Jul 2023 02:12:41 +0300
Message-Id: <20230707231251.3849701-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

