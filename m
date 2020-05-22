Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473EC1DF198
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 00:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658886E140;
	Fri, 22 May 2020 22:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46556E13B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 22:03:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590185015; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pFYjNnDpS0CBePanyoq+lGEeWijYjEz956FevuIXJqA=;
 b=p8q4Vbbmrl4EDRUWfAHV6Z2E8EKx5qPWvXd1K94v9UAqnhlKN1eDwF2qKEn9Q9L7hdqOWk7b
 d/DSUP3lTxCW7EDbNECo4w71/8MkcOUTyl1PwwtNHH5dFQ2Y4qxoMlGZr2sokLNLqAEx14Vg
 Imo+kZRnb5GgBLW7melGOzxJFUY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec84c3040528fe39446e067 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 22:03:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6AA19C433C9; Fri, 22 May 2020 22:03:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 27E81C433CB;
 Fri, 22 May 2020 22:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27E81C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/3] drm/msm: Attach the IOMMU device during initialization
Date: Fri, 22 May 2020 16:03:14 -0600
Message-Id: <20200522220316.23772-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522220316.23772-1-jcrouse@codeaurora.org>
References: <20200522220316.23772-1-jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tongtiangen <tongtiangen@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Georgi Djakov <georgi.djakov@linaro.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Everywhere an IOMMU object is created by msm_gpu_create_address_space
the IOMMU device is attached immediately after. Instead of carrying around
the infrastructure to do the attach from the device specific code do it
directly in the msm_iommu_init() function. This gets it out of the way for
more aggressive cleanups that follow.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 --------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  4 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  7 -------
 drivers/gpu/drm/msm/msm_gem_vma.c        | 23 +++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.c            | 11 +----------
 drivers/gpu/drm/msm/msm_gpummu.c         |  6 ------
 drivers/gpu/drm/msm/msm_iommu.c          |  8 +++++++-
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 8 files changed, 27 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 10c33cf7a5d7..c5150c67a3b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -794,7 +794,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
-	int ret;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
@@ -810,13 +809,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 		return PTR_ERR(aspace);
 	}
 
-	ret = aspace->mmu->funcs->attach(aspace->mmu);
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
index dda05436f716..9dba37c6344f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -518,10 +518,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-
-		ret = aspace->mmu->funcs->attach(aspace->mmu);
-		if (ret)
-			goto fail;
 	} else {
 		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
 				"contig buffers for scanout\n");
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 46c1c4707292..eba8ff480296 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -636,13 +636,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		}
 
 		kms->aspace = aspace;
-
-		ret = aspace->mmu->funcs->attach(aspace->mmu);
-		if (ret) {
-			DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
-				ret);
-			goto fail;
-		}
 	} else {
 		DRM_DEV_INFO(&pdev->dev,
 			 "no iommu, fallback to phys contig buffers for scanout\n");
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 407b7ab82818..72fc1980fff6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -133,8 +133,8 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
 		const char *name)
 {
 	struct msm_gem_address_space *aspace;
-	u64 size = domain->geometry.aperture_end -
-		domain->geometry.aperture_start;
+	u64 start = domain->geometry.aperture_start;
+	u64 size = domain->geometry.aperture_end - start;
 
 	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
 	if (!aspace)
@@ -143,9 +143,18 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
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
 
@@ -166,6 +175,12 @@ msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
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
index 615c5cda5389..b6f0d7204da9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -826,7 +826,6 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
 		uint64_t va_start, uint64_t va_end)
 {
 	struct msm_gem_address_space *aspace;
-	int ret;
 
 	/*
 	 * Setup IOMMU.. eventually we will (I think) do this once per context
@@ -851,17 +850,9 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
 			va_start, va_end);
 	}
 
-	if (IS_ERR(aspace)) {
+	if (IS_ERR(aspace))
 		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
 			PTR_ERR(aspace));
-		return ERR_CAST(aspace);
-	}
-
-	ret = aspace->mmu->funcs->attach(aspace->mmu);
-	if (ret) {
-		msm_gem_address_space_put(aspace);
-		return ERR_PTR(ret);
-	}
 
 	return aspace;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 34980d8eb7ad..0ad0f848560a 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -21,11 +21,6 @@ struct msm_gpummu {
 #define GPUMMU_PAGE_SIZE SZ_4K
 #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
 
-static int msm_gpummu_attach(struct msm_mmu *mmu)
-{
-	return 0;
-}
-
 static void msm_gpummu_detach(struct msm_mmu *mmu)
 {
 }
@@ -85,7 +80,6 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.attach = msm_gpummu_attach,
 		.detach = msm_gpummu_detach,
 		.map = msm_gpummu_map,
 		.unmap = msm_gpummu_unmap,
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index ad58cfe5998e..e35dab5792cf 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -66,7 +66,6 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.attach = msm_iommu_attach,
 		.detach = msm_iommu_detach,
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
@@ -76,6 +75,7 @@ static const struct msm_mmu_funcs funcs = {
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 {
 	struct msm_iommu *iommu;
+	int ret;
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
@@ -85,5 +85,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
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
index 67a623f14319..bae9e8e67ec1 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -10,7 +10,6 @@
 #include <linux/iommu.h>
 
 struct msm_mmu_funcs {
-	int (*attach)(struct msm_mmu *mmu);
 	void (*detach)(struct msm_mmu *mmu);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
 			unsigned len, int prot);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
