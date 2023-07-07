Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF974B80D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 22:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FA010E5F4;
	Fri,  7 Jul 2023 20:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3129C10E5E6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso3826169e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762248; x=1691354248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycLiAJk0+8gBiCQVZUadLSm2sx3Dxp3u2YcVJD62Xgw=;
 b=wD8A1YrFuCsDllR50yj2hQL2T5aA8fN4p8rlZ2QHxfs3ywqWiD1/v6/EvNq6NoIq1x
 c75FFnynIrr7qmQxl4m7elQ4hdX3q4rk3WH6Q4cZ/iWl8MSmwL8uu1NckoLz0tRGzS+Y
 eyzHNj1ynscKwfRtZV1CWKr7FQris4L8z6KGXvvGYJtj01SuUyF2bGUqrm7GxnBoqOLG
 nKuRo7ik2TV5+ns/YKwegUqqNmkIRBMVyBcNrb3ma+QCGAbjnooPhXJK7StGxM7BC5Tq
 UFTMlN8v4264F28/0E7t2dC+PyI0WbDKwvyrM0tFp3qOOPncSdOBlj3V//3BiWVXGexZ
 N9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762248; x=1691354248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycLiAJk0+8gBiCQVZUadLSm2sx3Dxp3u2YcVJD62Xgw=;
 b=X/LSJ8UGvtaGO5U9mXtyOGk8Q+h83KoOYefTo1poWdK7tT6bI1PYpRj94JvwwXNBV0
 ZkAT6HASIdiQDU01ORs2q6nHOQVc2QJEDqbNxq6X9n1Cj0uvS4VJT9RT4An32ofsrOK8
 H8zWTPicnAGyC9DkAmOFZvUiecUAXQDeXpogPBQEV6dLHWu/NoQzTHSWX9zhDK00qEHl
 oyRVPUw9/3oB+0Dy6fOa7pLeihD082xbudAJdwU6ueveTDds4W3jAbeqYYQc4hwGqHYJ
 MsUl5PXtv5hcW9zcdjTYxQ3xFkhob+q+Mh9n/JE3QzlkjrmZtphUc8yXbQ+JDjfaU/Fr
 nL1w==
X-Gm-Message-State: ABy/qLYOxXuml0CSIU8x4hBEBQDX4r5e8E1U1haIJse9xpqM1ddOB6fs
 DdVql4rYqQ2Fz+QiRQuCPF1G8Q==
X-Google-Smtp-Source: APBJJlFXXoJuRs8u3T7/Bj8aboQjuwnz7Bz3M58aPwi6QAnmS6wm5iuxLbIAvp43+QzYVUUMkLbfyQ==
X-Received: by 2002:a05:6512:39cb:b0:4f3:93d6:f969 with SMTP id
 k11-20020a05651239cb00b004f393d6f969mr5304608lfu.59.1688762248367; 
 Fri, 07 Jul 2023 13:37:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 05/13] drm/msm/dpu: use devres-managed allocation for MDP TOP
Date: Fri,  7 Jul 2023 23:37:16 +0300
Message-Id: <20230707203724.3820757-6-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create MDP TOP structure. This allows us to remove
corresponding kfree and drop dpu_hw_mdp_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cff48763ce25..481b373d9ccb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_top.h"
@@ -268,16 +270,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
-struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
+				      const struct dpu_mdp_cfg *cfg,
+				      void __iomem *addr,
+				      const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_mdp *mdp;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
+	mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp)
 		return ERR_PTR(-ENOMEM);
 
@@ -292,9 +295,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
 
 	return mdp;
 }
-
-void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
-{
-	kfree(mdp);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 8b1463d2b2f0..6f3dc98087df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -145,13 +145,15 @@ struct dpu_hw_mdp {
 
 /**
  * dpu_hw_mdptop_init - initializes the top driver for the passed config
+ * @dev:  Corresponding device for devres management
  * @cfg:  MDP TOP configuration from catalog
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
+				      const struct dpu_mdp_cfg *cfg,
+				      void __iomem *addr,
+				      const struct dpu_mdss_cfg *m);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f7723f89cbbc..48c3f8b6b88f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -822,8 +822,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 
 	dpu_kms->catalog = NULL;
 
-	if (dpu_kms->hw_mdp)
-		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
 	dpu_kms->hw_mdp = NULL;
 }
 
@@ -1051,7 +1049,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
-	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
+	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
+					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
-- 
2.39.2

