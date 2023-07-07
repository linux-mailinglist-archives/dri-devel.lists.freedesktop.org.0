Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1A74B9EA
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519210E600;
	Fri,  7 Jul 2023 23:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EBD10E614
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:58 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso3761029e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771576; x=1691363576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycLiAJk0+8gBiCQVZUadLSm2sx3Dxp3u2YcVJD62Xgw=;
 b=EILakJZNP2VVqeuTyr0p64toof5XhiEBcJCYM5wtvw3aMK1Dt8IGCnnyFUMl7Y4UgV
 Up6R1ITWSaTKgpgvcZsdxvfF0GnlGYPTcS0EfWOMU/ZsfPTGe5R92Qjzq+Gl7ihYaxlo
 rphEQpSt8fabgFum5N9COpHKMw0IoV/yuQ/0HKODHUh20hko+p6FFpopC5keyK8GJEqG
 0wp8S6enPybiLO8/gZfMIrCIyfIQATw1LAf5JF7oqkpw5LVEBerD7L1VcuqX/l2/I2Ku
 YXyZP1o7T4yNnL08Mden1xi/8Xtk/uUZA/xcjq2Dvutr0k/VPhe2dLTLjktna8h4nu7W
 mhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771576; x=1691363576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycLiAJk0+8gBiCQVZUadLSm2sx3Dxp3u2YcVJD62Xgw=;
 b=XYU4yMuAA4dWESHX0j1UuAaXgvZaaI9JmXYlP4S3CMEIGWE2q06oD3++6kCZEuycIu
 lIpnk4Km9GqXtkb9R9JzDTpQang6DBQo9LXEPjQ9M77hKZUFWvMKrfUAgrNsbOoVN/Z1
 Cx5X4lflDisayobidCfhP0X9iECzgU1pGGRSobH+Zxd6L4vjjK2sgrqFpri+xqjlL8Bt
 F3ljo2KKo0jChXZZEhZPUaxrOjDn1f5HqD/pE66fV2oKA00PM6dpfiW9EwF4YJBYld/T
 yUMCmEWTxeALmKQ3u7MbCAepc5BTWoP/t6NS/Ux1Su1kQVndFPb2NaLqz0S6Q1u02+V9
 lPUQ==
X-Gm-Message-State: ABy/qLbUMd4+FmkmmgrGnbcKjb1ruZ6NFKdMTqQ0eWZ8YeXlTDNTU1wQ
 iHWc7m2k8l3t2T4FO83lOEzH7A==
X-Google-Smtp-Source: APBJJlE857VT1+lU2IoUcNMupDNlVwXlMliplgLlB5G0iVqQq9TaHaI2vqgJpQkcALJhLN/deBSKHA==
X-Received: by 2002:a19:d619:0:b0:4fb:7b2a:78de with SMTP id
 n25-20020a19d619000000b004fb7b2a78demr4880557lfg.45.1688771576319; 
 Fri, 07 Jul 2023 16:12:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 05/13] drm/msm/dpu: use devres-managed allocation for MDP
 TOP
Date: Sat,  8 Jul 2023 02:12:43 +0300
Message-Id: <20230707231251.3849701-6-dmitry.baryshkov@linaro.org>
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

