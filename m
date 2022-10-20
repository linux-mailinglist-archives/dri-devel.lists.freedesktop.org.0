Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26036068EC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7860A10EC85;
	Thu, 20 Oct 2022 19:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F126F10F166
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:32:01 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id by36so793136ljb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uK2a3CldzNIRRMaqWYrmeMmnGxpuX490eqnTlz/whMk=;
 b=gn7RSbxXvh/wbP+BFkGo2xj6/HErlstNyfxHYnHdwXwb3ctWbWVd6cN/AQVjBOaX8F
 XhRZ+dVfymdr7HXoAIKUYI23MZTsMUaAYWAkM+Y90pte1zrxOZAXuD3UkaS5IAobNyj9
 lPgl2kSde4I8RaT04EimUGzxl5v6NCC3HkAa51g5AkQnZMhkmcxVjoKiebXt90kTbK8E
 La1YeaqqyzWaOOTMDE9j48WMUKVzfjAIV14guQ0GyZJgF6Zrqg0SGb6pteyV/6Ajg+/R
 pxS4VMyDLWjiefQx0x+2yAszOzYihFUv/jgr0138o3eDfx+jrano++L9BjTZk8VD9Yi3
 l4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uK2a3CldzNIRRMaqWYrmeMmnGxpuX490eqnTlz/whMk=;
 b=Te7FEEx2nKvcsPOsXlVC7Hl2eo46WRPJmy4QyG0Bwm0U/c1MD3jx6WpZSF1xnROesK
 TY8kPY/8I+0SjEQj2U3Wiyym6w2QocUe5J3Z10bNxXMigbbBdcESkXxzkMxoCuSOs72R
 fFgXWU7z6ia3OPizF8UIQA2nmSG8Ds1s8ea9sMNOc4rch3L3suQewdYeUrk1sGtEG/iL
 u2JIaflj3sf88WR+fFjU7wvxY5Li30eq4xEx2cRvDS46PvdwJyzqYv7nD1ZsF9mAxq/p
 yqT3XVhpLBS4qCbAEjRW4QrmVMxDOro0iKV5G46LZ7YqZiRE6U/5RzvIf0R3L6ld0AOf
 edfw==
X-Gm-Message-State: ACrzQf1lfAAGj+pJQshp6LiDT2NqzREj/CYhKHrQLFb36BUDiJ7n8Ez5
 lNroR4vM6Dxr3SV7Lb31VNYOkw==
X-Google-Smtp-Source: AMsMyM7sXAdNc7uj+dJykItHIyhTQHH0UaIVmwujgz/oFAInCA/irzQ7xBCvnyoTa1H1ldZwQqvb6Q==
X-Received: by 2002:a2e:a807:0:b0:26d:e1b6:14ad with SMTP id
 l7-20020a2ea807000000b0026de1b614admr5354133ljq.378.1666294319000; 
 Thu, 20 Oct 2022 12:31:59 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d7-20020ac25ec7000000b004a2c3fd32edsm2830652lfq.144.2022.10.20.12.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 12:31:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm: remove duplicated code from
 a6xx_create_address_space
Date: Thu, 20 Oct 2022 22:31:56 +0300
Message-Id: <20221020193157.2147112-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
References: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function a6xx_create_address_space() is mostly a copy of
adreno_iommu_create_address_space() with added quirk setting. Reuse the
original function to do the work, while introducing the wrapper to set
the quirk.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 ++++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  7 ++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 5 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fdc578016e0b..7640f5b960d6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1786,41 +1786,18 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct iommu_domain *iommu;
-	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
-	u64 start, size;
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu)
-		return NULL;
+	aspace = adreno_iommu_create_address_space(gpu, pdev);
+	if (IS_ERR_OR_NULL(aspace))
+		return ERR_CAST(aspace);
 
 	/*
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
 	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
-		adreno_set_llc_attributes(iommu);
-
-	mmu = msm_iommu_new(&pdev->dev, iommu);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(iommu);
-		return ERR_CAST(mmu);
-	}
-
-	/*
-	 * Use the aperture start or SZ_16M, whichever is greater. This will
-	 * ensure that we align with the allocated pagetable range while still
-	 * allowing room in the lower 32 bits for GMEM and whatnot
-	 */
-	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
-	size = iommu->geometry.aperture_end - start + 1;
-
-	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK_ULL(48, 0), size);
-
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
-		mmu->funcs->destroy(mmu);
+		adreno_set_llc_attributes(aspace->mmu);
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..ed26b8dfc789 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,9 +191,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu)
+void adreno_set_llc_attributes(struct msm_mmu *mmu)
 {
-	iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
+	msm_iommu_set_pgtable_quirks(mmu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
 }
 
 struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e7adc5c632d0..723729e463e8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -338,7 +338,7 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev);
 
-void adreno_set_llc_attributes(struct iommu_domain *iommu);
+void adreno_set_llc_attributes(struct msm_mmu *mmu);
 
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5577cea7c009..768ab71cc43e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
 	return 0;
 }
 
+int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	return iommu_set_pgtable_quirks(iommu->domain, quirk);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index de158e1bf765..d968d9f8e19c 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
+int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.35.1

