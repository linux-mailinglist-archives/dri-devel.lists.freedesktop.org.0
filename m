Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D789696393
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 13:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D5110E8BD;
	Tue, 14 Feb 2023 12:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33EE10E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 12:35:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b3so23273351lfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S82dRmz8qXkz/e3PxT7Jj8sc/xhhQhtebeYuRJvdGOk=;
 b=jKeV5IJc7uD0YAs/d1PjuTHpQxCTv9xXdPwr7mURbUevuPvbh24fFFFeICIj70llpK
 cJ13Jop9k2rL3DchaemESD1kmIbWs2rsj6WaeD/nBje7qseLqArsPuPaQH+TrRkW7dJ9
 Jzmjle1dnKK+QEsnUsr2y77Z2SpEG7rSCTvRXGipTxPjzDwmYh4bZ+BD2hh+1zASGOCl
 8bvwr2b+D0RW4FzJAi9oqoVxbybo5CjiCrXD/ccWi3b6qfhRenjC56c1Lltd59h31vyA
 0lNqMjhzfmwnOwIOd1qRXHpvDsHzM+P1wtDMI/Q2YOg5HwqE3jOL+tslirtU2WbKy2tT
 +8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S82dRmz8qXkz/e3PxT7Jj8sc/xhhQhtebeYuRJvdGOk=;
 b=HJVpO8nUmvAeOFVxdynxtXknts0lhQjNoTgthchJiWVqGm5OOyVW49I0SwHvNa0T1G
 cukoIIi8zrAyYb8XT828EpZu/CgXSXgV5BYmEA2GF1+wunctHzfHF1K6Yv0ow6j821jg
 /dEpjCcrIEir320fITcxZ0f+vOm0QkuIjeBUgjhFHa7lDRJIibW+ZmKWzzM87KYqGmbi
 bUPGl7UVBW8v7i74k2uIjTymNxIGJzknAmmWmD+BBT6EJG2mWsdgwWwKTLOOhhDFbWS6
 R9P5x+/Y2mvUPnqItR0EIVbfa6IC82FeH3TPx3+JnPgjX8U9frzncBNuk680jO+ICADu
 SqJw==
X-Gm-Message-State: AO0yUKXmP9bj/NPZ/P3gbnuhGWu8NFeordoyIce4YdNit8o0RTYWh2f6
 m++zh7lj4JwtmrvG07EBvd8Twu/imbwlzqhH
X-Google-Smtp-Source: AK7set9FaFSRRgnbLYRM4Wfed0nvsgRYSBqreVWH5TFBpOzKqVtlTmWMs39x59nS9NWV4Z8IQlGi3g==
X-Received: by 2002:a05:6512:969:b0:4d2:c74:bf67 with SMTP id
 v9-20020a056512096900b004d20c74bf67mr570591lft.45.1676378106132; 
 Tue, 14 Feb 2023 04:35:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:35:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/msm/adreno: stall translation on fault for all GPU
 families
Date: Tue, 14 Feb 2023 15:35:02 +0300
Message-Id: <20230214123504.3729522-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
References: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
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

The commit e25e92e08e32 ("drm/msm: devcoredump iommu fault support")
enabled SMMU stalling to collect GPU state, but only for a6xx. It tied
enabling the stall with tha per-instance pagetables creation.

Since that commit SoCs with a5xx also gained support for
adreno-smmu-priv. Move stalling into generic code and add corresponding
resume_translation calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c         | 38 ++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 047c5e8c87ff..b5270324f5f8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1106,6 +1106,8 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *da
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
 
+	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 3bc02dbed9a7..a05d48ecae15 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -208,7 +208,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	struct msm_gem_address_space *aspace;
 	u64 start, size;
 
-	mmu = msm_iommu_new(&pdev->dev, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
 	if (IS_ERR_OR_NULL(mmu))
 		return ERR_CAST(mmu);
 
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index c2507582ecf3..418e1e06cdde 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -237,13 +237,6 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	if (!ttbr1_cfg)
 		return ERR_PTR(-ENODEV);
 
-	/*
-	 * Defer setting the fault handler until we have a valid adreno_smmu
-	 * to avoid accidentially installing a GPU specific fault handler for
-	 * the display's iommu
-	 */
-	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
-
 	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
 	if (!pagetable)
 		return ERR_PTR(-ENOMEM);
@@ -271,9 +264,6 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	 * the arm-smmu driver as a trigger to set up TTBR0
 	 */
 	if (atomic_inc_return(&iommu->pagetables) == 1) {
-		/* Enable stall on iommu fault: */
-		adreno_smmu->set_stall(adreno_smmu->cookie, true);
-
 		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
 		if (ret) {
 			free_io_pgtable_ops(pagetable->pgtbl_ops);
@@ -302,6 +292,7 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
+	struct msm_mmu *mmu = &iommu->base;
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
 	struct adreno_smmu_fault_info info, *ptr = NULL;
 
@@ -314,6 +305,10 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
 
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
+
+	if (mmu->funcs->resume_translation)
+		mmu->funcs->resume_translation(mmu);
+
 	return 0;
 }
 
@@ -321,7 +316,8 @@ static void msm_iommu_resume_translation(struct msm_mmu *mmu)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
 
-	adreno_smmu->resume_translation(adreno_smmu->cookie, true);
+	if (adreno_smmu->resume_translation)
+		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
 }
 
 static void msm_iommu_detach(struct msm_mmu *mmu)
@@ -406,3 +402,23 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 
 	return &iommu->base;
 }
+
+struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
+	struct msm_iommu *iommu;
+	struct msm_mmu *mmu;
+
+	mmu = msm_iommu_new(dev, quirks);
+	if (IS_ERR(mmu))
+		return mmu;
+
+	iommu = to_msm_iommu(mmu);
+	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+
+	/* Enable stall on iommu fault: */
+	if (adreno_smmu->set_stall)
+		adreno_smmu->set_stall(adreno_smmu->cookie, true);
+
+	return mmu;
+}
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 74cd81e701ff..eb72d3645c1d 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -41,6 +41,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 }
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
+struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
-- 
2.30.2

