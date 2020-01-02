Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD312E55F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 12:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC956E0C6;
	Thu,  2 Jan 2020 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84A6E0C6
 for <dri-devel@freedesktop.org>; Thu,  2 Jan 2020 11:02:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577962968; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1+SmfBJxhir4MV0DvV7KBxalaP2HVtb0BFO1Q0tUrKU=;
 b=BNd5ICZT/h8MlpB9T+yMsjjrLTK+0H2AC0R8vbFXS6VMxnayV9uj6NlUfV4Y0rUvvSopgFeu
 CBJkpbHCh/UwPYjWaVkvJ1BEfHdpa0e3w84CVdoSujakHy8dlH3bPdLczFRKeiuPwVAS4Zx4
 kI32X9HuDG0DosECY9tJQgBQTBM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dcdd7.7f2a626e1180-smtp-out-n01;
 Thu, 02 Jan 2020 11:02:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 009B9C447A9; Thu,  2 Jan 2020 11:02:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 500DDC447A4;
 Thu,  2 Jan 2020 11:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 500DDC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/msm: Refactor address space initialization
Date: Thu,  2 Jan 2020 16:32:10 +0530
Message-Id: <1577962933-13577-5-git-send-email-smasetty@codeaurora.org>
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
 robin.murphy@arm.com, Sharat Masetty <smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Refactor how address space initialization works. Instead of having the
address space function create the MMU object (and thus require separate but
equal functions for gpummu and iommu) use a single function and pass the
MMU struct. Make the generic code cleaner by using target specific
functions to create the address space so a2xx can do its own thing in its
own space.  For all the other targets use a generic helper to initialize
IOMMU but leave the door open for newer targets to use customization
if they need it.

This patch also adds support for a6xx specific mmu initialization to
allow for future extensions like supporting split pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 24 +++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 +++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 14 +++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++++--
 drivers/gpu/drm/msm/msm_drv.h            |  8 ++---
 drivers/gpu/drm/msm/msm_gem_vma.c        | 52 +++++---------------------------
 drivers/gpu/drm/msm/msm_gpu.c            | 40 ++----------------------
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
 drivers/gpu/drm/msm/msm_iommu.c          |  3 ++
 16 files changed, 106 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 1f83bc1..60f6472 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -401,6 +401,21 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }

+static struct msm_gem_address_space *
+a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
+	struct msm_gem_address_space *aspace;
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
+		SZ_16M + 0xfff * SZ_64K);
+
+	if (IS_ERR(aspace) && !IS_ERR(mmu))
+		mmu->funcs->destroy(mmu);
+
+	return aspace;
+}
+
 /* Register offset defines for A2XX - copy of A3XX */
 static const unsigned int a2xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
@@ -429,6 +444,7 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 #endif
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = a2xx_create_address_space,
 	},
 };

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5f7e980..825e6f6 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -448,6 +448,7 @@ static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
 #endif
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = adreno_iommu_create_address_space,
 	},
 };

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index ab2b752..0484e48 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -538,6 +538,7 @@ static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 #endif
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
+		.create_address_space = adreno_iommu_create_address_space,
 	},
 	.get_timestamp = a4xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 99cd6e6..b5cc407 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1394,6 +1394,7 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
 		.gpu_busy = a5xx_gpu_busy,
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
+		.create_address_space = adreno_iommu_create_address_space,
 	},
 	.get_timestamp = a5xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index daf0780..0d72e6c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -878,6 +878,29 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }

+static struct msm_gem_address_space *
+a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
+
+	if (!iommu)
+		return ERR_PTR(-ENOMEM);
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M, 0xffffffff);
+	if (IS_ERR(aspace))
+		iommu_domain_free(iommu);
+
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -899,6 +922,7 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 #if defined(CONFIG_DRM_MSM_GPU_STATE)
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
+		.create_address_space = a6xx_create_address_space,
 #endif
 	},
 	.get_timestamp = a6xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 048c8be..20a0418 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -156,6 +156,23 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }

+struct msm_gem_address_space *
+adreno_iommu_create_address_space(struct msm_gpu *gpu,
+		struct platform_device *pdev)
+{
+	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
+	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
+	struct msm_gem_address_space *aspace;
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
+		0xfffffff);
+
+	if (IS_ERR(aspace) && !IS_ERR(mmu))
+		mmu->funcs->destroy(mmu);
+
+	return aspace;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -909,12 +926,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,

 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";

-	adreno_gpu_config.va_start = SZ_16M;
-	adreno_gpu_config.va_end = 0xffffffff;
-	/* maximum range of a2xx mmu */
-	if (adreno_is_a2xx(adreno_gpu))
-		adreno_gpu_config.va_end = SZ_16M + 0xfff * SZ_64K;
-
 	adreno_gpu_config.nr_rings = nr_rings;

 	adreno_get_pwrlevels(&pdev->dev, gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e12d5a9..0e1d56d8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -258,6 +258,14 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 int adreno_gpu_state_put(struct msm_gpu_state *state);

 /*
+ * Common helper function to initialize the default address space for arm-smmu
+ * attached targets
+ */
+struct msm_gem_address_space *
+adreno_iommu_create_address_space(struct msm_gpu *gpu,
+		struct platform_device *pdev);
+
+/*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fdd9e2e..b51716d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -736,18 +736,18 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;

 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
 		return 0;

-	domain->geometry.aperture_start = 0x1000;
-	domain->geometry.aperture_end = 0xffffffff;
+	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
+	aspace = msm_gem_address_space_create(mmu, "dpu1",
+		0x1000, 0xfffffff);

-	aspace = msm_gem_address_space_create(dpu_kms->dev->dev,
-			domain, "dpu1");
 	if (IS_ERR(aspace)) {
-		iommu_domain_free(domain);
+		mmu->funcs->destroy(mmu);
 		return PTR_ERR(aspace);
 	}

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c1c48df..fd682e5 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -515,9 +515,15 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 	mdelay(16);

 	if (config->iommu) {
-		aspace = msm_gem_address_space_create(&pdev->dev,
-				config->iommu, "mdp4");
+		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
+			config->iommu);
+
+		aspace  = msm_gem_address_space_create(mmu,
+			"mdp4", 0x1000, 0xffffffff);
+
 		if (IS_ERR(aspace)) {
+			if (!IS_ERR(mmu))
+				mmu->funcs->destroy(mmu);
 			ret = PTR_ERR(aspace);
 			goto fail;
 		}
@@ -570,10 +576,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	config.max_clk = 266667000;
 	config.iommu = iommu_domain_alloc(&platform_bus_type);
-	if (config.iommu) {
-		config.iommu->geometry.aperture_start = 0x1000;
-		config.iommu->geometry.aperture_end = 0xffffffff;
-	}

 	return &config;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index f6e71ff..85dcf86 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -843,10 +843,6 @@ static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
 	static struct mdp5_cfg_platform config = {};

 	config.iommu = iommu_domain_alloc(&platform_bus_type);
-	if (config.iommu) {
-		config.iommu->geometry.aperture_start = 0x1000;
-		config.iommu->geometry.aperture_end = 0xffffffff;
-	}

 	return &config;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 2d66ae2..2c51b8b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -724,13 +724,20 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);

 	if (config->platform.iommu) {
+		struct msm_mmu *mmu;
+
 		iommu_dev = &pdev->dev;
 		if (!iommu_dev->iommu_fwspec)
 			iommu_dev = iommu_dev->parent;

-		aspace = msm_gem_address_space_create(iommu_dev,
-				config->platform.iommu, "mdp5");
+		mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
+
+		aspace = msm_gem_address_space_create(mmu, "mdp5",
+			0x1000, 0xffffffff);
+
 		if (IS_ERR(aspace)) {
+			if (!IS_ERR(mmu))
+				mmu->funcs->destroy(mmu);
 			ret = PTR_ERR(aspace);
 			goto fail;
 		}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 71547e7..2203729 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -247,12 +247,8 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 void msm_gem_address_space_put(struct msm_gem_address_space *aspace);

 struct msm_gem_address_space *
-msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
-		const char *name);
-
-struct msm_gem_address_space *
-msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
-		const char *name, uint64_t va_start, uint64_t va_end);
+msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+		u64 va_start, u64 va_end);

 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 91d993a..075ce52 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -125,63 +125,25 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 	return 0;
 }

-
 struct msm_gem_address_space *
-msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
-		const char *name)
-{
-	struct msm_gem_address_space *aspace;
-	u64 start = domain->geometry.aperture_start;
-	u64 size = domain->geometry.aperture_end - start;
-
-	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
-	if (!aspace)
-		return ERR_PTR(-ENOMEM);
-
-	spin_lock_init(&aspace->lock);
-	aspace->name = name;
-	aspace->mmu = msm_iommu_new(dev, domain);
-	if (IS_ERR(aspace->mmu)) {
-		int ret = PTR_ERR(aspace->mmu);
-
-		kfree(aspace);
-		return ERR_PTR(ret);
-	}
-
-	/*
-	 * Attaching the IOMMU device changes the aperture values so use the
-	 * cached values instead
-	 */
-	drm_mm_init(&aspace->mm, start >> PAGE_SHIFT, size >> PAGE_SHIFT);
-
-	kref_init(&aspace->kref);
-
-	return aspace;
-}
-
-struct msm_gem_address_space *
-msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
-		const char *name, uint64_t va_start, uint64_t va_end)
+msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+		u64 va_start, u64 va_end)
 {
 	struct msm_gem_address_space *aspace;
 	u64 size = va_end - va_start;

+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
 	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
 	if (!aspace)
 		return ERR_PTR(-ENOMEM);

 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
-	aspace->mmu = msm_gpummu_new(dev, gpu);
-	if (IS_ERR(aspace->mmu)) {
-		int ret = PTR_ERR(aspace->mmu);
-
-		kfree(aspace);
-		return ERR_PTR(ret);
-	}
+	aspace->mmu = mmu;

-	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
-		size >> PAGE_SHIFT);
+	drm_mm_init(&aspace->mm, va_start >> PAGE_SHIFT, size >> PAGE_SHIFT);

 	kref_init(&aspace->kref);

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ecfa6d9..a7387604 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -802,42 +802,6 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 	return 0;
 }

-static struct msm_gem_address_space *
-msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
-		uint64_t va_start, uint64_t va_end)
-{
-	struct msm_gem_address_space *aspace;
-
-	/*
-	 * Setup IOMMU.. eventually we will (I think) do this once per context
-	 * and have separate page tables per context.  For now, to keep things
-	 * simple and to get something working, just use a single address space:
-	 */
-	if (!adreno_is_a2xx(to_adreno_gpu(gpu))) {
-		struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
-		if (!iommu)
-			return NULL;
-
-		iommu->geometry.aperture_start = va_start;
-		iommu->geometry.aperture_end = va_end;
-
-		DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
-
-		aspace = msm_gem_address_space_create(&pdev->dev, iommu, "gpu");
-		if (IS_ERR(aspace))
-			iommu_domain_free(iommu);
-	} else {
-		aspace = msm_gem_address_space_create_a2xx(&pdev->dev, gpu, "gpu",
-			va_start, va_end);
-	}
-
-	if (IS_ERR(aspace))
-		DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
-			PTR_ERR(aspace));
-
-	return aspace;
-}
-
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config)
@@ -910,8 +874,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,

 	msm_devfreq_init(gpu);

-	gpu->aspace = msm_gpu_create_address_space(gpu, pdev,
-		config->va_start, config->va_end);
+
+	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);

 	if (gpu->aspace == NULL)
 		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..41d86c2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -21,8 +21,6 @@

 struct msm_gpu_config {
 	const char *ioname;
-	uint64_t va_start;
-	uint64_t va_end;
 	unsigned int nr_rings;
 };

@@ -64,6 +62,8 @@ struct msm_gpu_funcs {
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
+	struct msm_gem_address_space *(*create_address_space)
+		(struct msm_gpu *gpu, struct platform_device *pdev);
 };

 struct msm_gpu {
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 050d8cf..2ec08daf 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -71,6 +71,9 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 	struct msm_iommu *iommu;
 	int ret;

+	if (!domain)
+		return ERR_PTR(-ENODEV);
+
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
 		return ERR_PTR(-ENOMEM);
--
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
