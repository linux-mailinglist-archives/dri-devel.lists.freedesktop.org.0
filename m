Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3012E55C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 12:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3E46E0B9;
	Thu,  2 Jan 2020 11:02:44 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C076E0B7
 for <dri-devel@freedesktop.org>; Thu,  2 Jan 2020 11:02:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577962963; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=KKi9YMaJOYMEHaQlQc8Vg5xsn1JheRLqTCMbmMznaUk=;
 b=v6sftwbpOSgtrrf5n4BMjmyMZ9La4SG1R8g96HhR3NxVK7OYqtNUUWWoXdJev0BL6rQNLIZe
 KCvbXhHBPmgbZlBySXbIPL6b5AJ1Q1turZU+00LOapP3rH7e/03iyVOKPb2GL1I3shJCJgdg
 S8ssnzZ/bdOYBWN3M+c3DYGxDv4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dcdd0.7f4119665420-smtp-out-n01;
 Thu, 02 Jan 2020 11:02:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E900C447A9; Thu,  2 Jan 2020 11:02:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 07EDFC447A3;
 Thu,  2 Jan 2020 11:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07EDFC447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/msm: Attach the IOMMU device during initialization
Date: Thu,  2 Jan 2020 16:32:09 +0530
Message-Id: <1577962933-13577-4-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
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
Cc: saiprakash.ranjan@codeaurora.org, will@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Everywhere an IOMMU object is created by msm_gpu_create_address_space
the IOMMU device is attached immediately after. Instead of carrying around
the infrastructure to do the attach from the device specific code do it
directly in the msm_iommu_init() function. This gets it out of the way for
more aggressive cleanups that follow.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ---------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  5 -----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  8 --------
 drivers/gpu/drm/msm/msm_gem_vma.c        | 23 +++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.c            | 11 +----------
 drivers/gpu/drm/msm/msm_gpummu.c         |  7 -------
 drivers/gpu/drm/msm/msm_iommu.c          | 16 +++++++---------
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 8 files changed, 27 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ee93ba3..fdd9e2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -736,7 +736,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
-	int ret;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
@@ -752,14 +751,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 		return PTR_ERR(aspace);
 	}
 
-	ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
-			ARRAY_SIZE(iommu_ports));
-	if (ret) {
-		DPU_ERROR("failed to attach iommu %d\n", ret);
-		msm_gem_address_space_put(aspace);
-		return ret;
-	}
-
 	dpu_kms->base.aspace = aspace;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 50711cc..c1c48df 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -523,11 +523,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-
-		ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
-				ARRAY_SIZE(iommu_ports));
-		if (ret)
-			goto fail;
 	} else {
 		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
 				"contig buffers for scanout\n");
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 91cd76a..2d66ae2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -736,14 +736,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-
-		ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
-				ARRAY_SIZE(iommu_ports));
-		if (ret) {
-			DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
-				ret);
-			goto fail;
-		}
 	} else {
 		DRM_DEV_INFO(&pdev->dev,
 			 "no iommu, fallback to phys contig buffers for scanout\n");
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1af5354..91d993a 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -131,8 +131,8 @@ struct msm_gem_address_space *
 		const char *name)
 {
 	struct msm_gem_address_space *aspace;
-	u64 size = domain->geometry.aperture_end -
-		domain->geometry.aperture_start;
+	u64 start = domain->geometry.aperture_start;
+	u64 size = domain->geometry.aperture_end - start;
 
 	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
 	if (!aspace)
@@ -141,9 +141,18 @@ struct msm_gem_address_space *
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
 	aspace->mmu = msm_iommu_new(dev, domain);
+	if (IS_ERR(aspace->mmu)) {
+		int ret = PTR_ERR(aspace->mmu);
 
-	drm_mm_init(&aspace->mm, (domain->geometry.aperture_start >> PAGE_SHIFT),
-		size >> PAGE_SHIFT);
+		kfree(aspace);
+		return ERR_PTR(ret);
+	}
+
+	/*
+	 * Attaching the IOMMU device changes the aperture values so use the
+	 * cached values instead
+	 */
+	drm_mm_init(&aspace->mm, start >> PAGE_SHIFT, size >> PAGE_SHIFT);
 
 	kref_init(&aspace->kref);
 
@@ -164,6 +173,12 @@ struct msm_gem_address_space *
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
 	aspace->mmu = msm_gpummu_new(dev, gpu);
+	if (IS_ERR(aspace->mmu)) {
+		int ret = PTR_ERR(aspace->mmu);
+
+		kfree(aspace);
+		return ERR_PTR(ret);
+	}
 
 	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
 		size >> PAGE_SHIFT);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a052364..ecfa6d9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -807,7 +807,6 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 		uint64_t va_start, uint64_t va_end)
 {
 	struct msm_gem_address_space *aspace;
-	int ret;
 
 	/*
 	 * Setup IOMMU.. eventually we will (I think) do this once per context
@@ -832,17 +831,9 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 			va_start, va_end);
 	}
 
-	if (IS_ERR(aspace)) {
+	if (IS_ERR(aspace))
 		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
 			PTR_ERR(aspace));
-		return ERR_CAST(aspace);
-	}
-
-	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
-	if (ret) {
-		msm_gem_address_space_put(aspace);
-		return ERR_PTR(ret);
-	}
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 34f643a..9e49928 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -21,12 +21,6 @@ struct msm_gpummu {
 #define GPUMMU_PAGE_SIZE SZ_4K
 #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
 
-static int msm_gpummu_attach(struct msm_mmu *mmu, const char * const *names,
-		int cnt)
-{
-	return 0;
-}
-
 static void msm_gpummu_detach(struct msm_mmu *mmu, const char * const *names,
 		int cnt)
 {
@@ -87,7 +81,6 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.attach = msm_gpummu_attach,
 		.detach = msm_gpummu_detach,
 		.map = msm_gpummu_map,
 		.unmap = msm_gpummu_unmap,
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 8c95c31..050d8cf 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -23,14 +23,6 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 	return 0;
 }
 
-static int msm_iommu_attach(struct msm_mmu *mmu, const char * const *names,
-			    int cnt)
-{
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-
-	return iommu_attach_device(iommu->domain, mmu->dev);
-}
-
 static void msm_iommu_detach(struct msm_mmu *mmu, const char * const *names,
 			     int cnt)
 {
@@ -68,7 +60,6 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.attach = msm_iommu_attach,
 		.detach = msm_iommu_detach,
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
@@ -78,6 +69,7 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 {
 	struct msm_iommu *iommu;
+	int ret;
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
@@ -87,5 +79,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 	msm_mmu_init(&iommu->base, dev, &funcs);
 	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
 
+	ret = iommu_attach_device(iommu->domain, dev);
+	if (ret) {
+		kfree(iommu);
+		return ERR_PTR(ret);
+	}
+
 	return &iommu->base;
 }
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 871d563..e4029b0 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -10,7 +10,6 @@
 #include <linux/iommu.h>
 
 struct msm_mmu_funcs {
-	int (*attach)(struct msm_mmu *mmu, const char * const *names, int cnt);
 	void (*detach)(struct msm_mmu *mmu, const char * const *names, int cnt);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
 			unsigned len, int prot);
-- 
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
