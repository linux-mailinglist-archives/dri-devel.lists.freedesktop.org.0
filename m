Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64560AEC4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E3C10E838;
	Mon, 24 Oct 2022 15:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD2910E838
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:14:48 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u11so1201716ljk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9XDdH/TiHUQTYq4HIR69yDTOsBlc/3zxpHcznnQkZ4=;
 b=Xjd8gPrpeZnfKEd5iW0v6YbOPkrRGfFn0Nno9ZCXm3y34AwkZ/Nyfh2+Ju3t63C2hE
 3KpYkOMjkYZOZWZZsZjW3zuDr7qeTYHjCE6UAQUV39Wi7aasaOYMcwiTswpTteyn86Qo
 z4Wyma6CcvX1tuh5J3W5DS/C2YZ12kSLUzkYQ21EMmxNiH24WZ3Db6SUa2RJJjsXS41l
 CVHlEJovKB/ilaqHoWD6XW+kDhIfXgJ0DIxTQzTCUEEAXvlgNSP3oeIpYuPchqgV3CLM
 BHjMuhEfxMJlGBsLqKSfJggfNndvEGWQgrW3sXytY/c15JwHlV67xGIW5xRB2ZVEJ4E4
 wnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9XDdH/TiHUQTYq4HIR69yDTOsBlc/3zxpHcznnQkZ4=;
 b=trrM2csaHlHc6TsieIiekMD2no7b7B7yxGKsS2BSmhu8rIfLO+TlhXWBSYvgrXIGsg
 IATGatKBrbsGVk3kjyJHtmDKHyOpi4qPMD/8Bn7fnLDd8Fer9xOAZ+DHysqK6xiqnPVQ
 +NYZwMS2Cxa/1qp3X5NcGGzy2d9w1TukM31DnAnaO4RJMVxoFa6Wiiu3T8kZntq+pRyR
 TQBbnu+cC+f885z3VjmmkDDXqYBHbKIkDOpOFx77CWHzizk6k2Hcb4cTocUvoJwp22Ho
 cGuFPevzUcJWZ7+xxe5GOydd0o7Hql3IIjlpNlaDU7fYsRUfRAoDu9S3Po3wNn7n7t45
 SZ6Q==
X-Gm-Message-State: ACrzQf116EYiZJJmNv0CVEt/s5lBtRjaTWm8dZwOOpaEsc7PWk+o55FG
 +Awx0V5j0dlvtsgZDW/syxBXqw==
X-Google-Smtp-Source: AMsMyM5uIdTE2BO2SUlcboZZqfPveTPJQb2pWE96s6Sx4R8yOtolL5ufyd3Ae9bWVo15IJOpavRMzA==
X-Received: by 2002:a2e:a371:0:b0:26f:b9cf:be26 with SMTP id
 i17-20020a2ea371000000b0026fb9cfbe26mr12876660ljn.364.1666624486623; 
 Mon, 24 Oct 2022 08:14:46 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b002771057e0e5sm265943lji.76.2022.10.24.08.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:14:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/2] drm/msm: move domain allocation into msm_iommu_new()
Date: Mon, 24 Oct 2022 18:14:44 +0300
Message-Id: <20221024151444.3208225-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
References: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the msm_iommu instance is created, the IOMMU domain is completely
handled inside the msm_iommu code. Move the iommu_domain_alloc() call
into the msm_iommu_new() to simplify callers code.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Fixed the uninitialized variable usage in a6xx_gmu_memory_probe()
   (reported by lkp)
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 +++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 20 +++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++----------
 drivers/gpu/drm/msm/msm_iommu.c          | 18 +++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
 6 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e033d6a67a20..ff5444f596d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1213,19 +1213,17 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 
 static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 {
-	struct iommu_domain *domain;
 	struct msm_mmu *mmu;
 
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain)
+	mmu = msm_iommu_new(gmu->dev);
+	if (!mmu)
 		return -ENODEV;
+	if (IS_ERR(mmu))
+		return PTR_ERR(mmu);
 
-	mmu = msm_iommu_new(gmu->dev, domain);
 	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
-	if (IS_ERR(gmu->aspace)) {
-		iommu_domain_free(domain);
+	if (IS_ERR(gmu->aspace))
 		return PTR_ERR(gmu->aspace);
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ed26b8dfc789..511ade96045e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -200,28 +200,26 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev)
 {
-	struct iommu_domain *iommu;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
+	struct iommu_domain_geometry *geometry;
 	u64 start, size;
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
-
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
+	mmu = msm_iommu_new(&pdev->dev);
+	if (IS_ERR_OR_NULL(mmu))
 		return ERR_CAST(mmu);
-	}
+
+	geometry = msm_iommu_get_geometry(mmu);
+	if (IS_ERR(geometry))
+		return ERR_CAST(geometry);
 
 	/*
 	 * Use the aperture start or SZ_16M, whichever is greater. This will
 	 * ensure that we align with the allocated pagetable range while still
 	 * allowing room in the lower 32 bits for GMEM and whatnot
 	 */
-	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
-	size = iommu->geometry.aperture_end - start + 1;
+	start = max_t(u64, SZ_16M, geometry->aperture_start);
+	size = geometry->aperture_end - start + 1;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu",
 		start & GENMASK_ULL(48, 0), size);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 964573d26d26..5f7488a539f5 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -387,7 +387,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
-	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 	u32 major, minor;
@@ -499,10 +499,15 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	iommu = iommu_domain_alloc(pdev->dev.bus);
-	if (iommu) {
-		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
-
+	mmu = msm_iommu_new(&pdev->dev);
+	if (IS_ERR(mmu)) {
+		ret = PTR_ERR(mmu);
+		goto fail;
+	} else if (!mmu) {
+		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
+				"contig buffers for scanout\n");
+		aspace = NULL;
+	} else {
 		aspace  = msm_gem_address_space_create(mmu,
 			"mdp4", 0x1000, 0x100000000 - 0x1000);
 
@@ -514,10 +519,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-	} else {
-		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
-				"contig buffers for scanout\n");
-		aspace = NULL;
 	}
 
 	ret = modeset_init(mdp4_kms);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 28034c21f6bc..9d7275304785 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -276,7 +276,6 @@ static int msm_drm_uninit(struct device *dev)
 
 struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 {
-	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
@@ -292,22 +291,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	else
 		iommu_dev = mdss_dev;
 
-	domain = iommu_domain_alloc(iommu_dev->bus);
-	if (!domain) {
+	mmu = msm_iommu_new(iommu_dev);
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
+	if (!mmu) {
 		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
 		return NULL;
 	}
 
-	mmu = msm_iommu_new(iommu_dev, domain);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(domain);
-		return ERR_CAST(mmu);
-	}
-
 	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
 		0x1000, 0x100000000 - 0x1000);
-	if (IS_ERR(aspace))
+	if (IS_ERR(aspace)) {
+		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
 		mmu->funcs->destroy(mmu);
+	}
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 768ab71cc43e..b2e0be4cc985 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -193,6 +193,13 @@ int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
 	return iommu_set_pgtable_quirks(iommu->domain, quirk);
 }
 
+struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	return &iommu->domain->geometry;
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
@@ -374,17 +381,21 @@ static const struct msm_mmu_funcs funcs = {
 		.resume_translation = msm_iommu_resume_translation,
 };
 
-struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
+struct msm_mmu *msm_iommu_new(struct device *dev)
 {
+	struct iommu_domain *domain;
 	struct msm_iommu *iommu;
 	int ret;
 
+	domain = iommu_domain_alloc(dev->bus);
 	if (!domain)
-		return ERR_PTR(-ENODEV);
+		return NULL;
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
-	if (!iommu)
+	if (!iommu) {
+		iommu_domain_free(domain);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
@@ -393,6 +404,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
+		iommu_domain_free(domain);
 		kfree(iommu);
 		return ERR_PTR(ret);
 	}
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index d968d9f8e19c..02df00ddd463 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -40,7 +40,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 	mmu->type = type;
 }
 
-struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
+struct msm_mmu *msm_iommu_new(struct device *dev);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
@@ -59,5 +59,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
 int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
+struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.35.1

