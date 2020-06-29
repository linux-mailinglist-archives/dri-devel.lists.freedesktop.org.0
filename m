Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21020EF92
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC08B89DD8;
	Tue, 30 Jun 2020 07:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC5A89C89
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 15:54:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593446074; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nyhr+wKTuGHf9WtPCncyW6maFY7e62s62XEcHJ0A5CE=;
 b=mU7QsBXZoJsq96hn6dIlQ4HNkOwSE7LKksfYwnlB2tm5mFxRkJmfJHkfWgVom1xP/6XTZuJU
 fXW+FI6pwqK+MrJQ5lrWOy+Dbdd3mxs0STFsPK6CHpsJ1Kc3KZ/nS5XauyfdpSr+Ty8X/PPI
 fqq6RuDlRksoAEVR2iQ7GtzqwZo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5efa0eac8fe116ddd92fe66d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 15:54:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F3B95C43449; Mon, 29 Jun 2020 15:54:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 80E20C433CB;
 Mon, 29 Jun 2020 15:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80E20C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system cache(LLC)
Date: Mon, 29 Jun 2020 21:22:50 +0530
Message-Id: <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, Matthias Kaehlcke <mka@chromium.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sharat Masetty <smasetty@codeaurora.org>

The last level system cache can be partitioned to 32 different
slices of which GPU has two slices preallocated. One slice is
used for caching GPU buffers and the other slice is used for
caching the GPU SMMU pagetables. This talks to the core system
cache driver to acquire the slice handles, configure the SCID's
to those slices and activates and deactivates the slices upon
GPU power collapse and restore.

Some support from the IOMMU driver is also needed to make use
of the system cache. IOMMU_SYS_CACHE_ONLY is a buffer protection
flag which enables caching GPU data buffers in the system cache
with memory attributes such as outer cacheable, read-allocate,
write-allocate for buffers. The GPU then has the ability to
override a few cacheability parameters which it does to override
write-allocate to write-no-allocate as the GPU hardware does not
benefit much from it.

Similarly DOMAIN_ATTR_SYS_CACHE is another domain level attribute
used by the IOMMU driver to set the right attributes to cache the
hardware pagetables into the system cache.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
(sai: fix to set attr before device attach to IOMMU and rebase)
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 ++++++-
 drivers/gpu/drm/msm/msm_iommu.c         |  3 +
 drivers/gpu/drm/msm/msm_mmu.h           |  4 ++
 5 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6bee70853ea8..c33cd2a588e6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -9,6 +9,8 @@
 #include "a6xx_gmu.xml.h"
 
 #include <linux/devfreq.h>
+#include <linux/bitfield.h>
+#include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
 
@@ -808,6 +810,79 @@ static const u32 a6xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A6XX_CP_RB_CNTL),
 };
 
+static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
+{
+	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
+}
+
+static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
+{
+	return msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
+}
+
+static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)
+{
+	llcc_slice_deactivate(a6xx_gpu->llc_slice);
+	llcc_slice_deactivate(a6xx_gpu->htw_llc_slice);
+}
+
+static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 cntl1_regval = 0;
+
+	if (IS_ERR(a6xx_gpu->llc_mmio))
+		return;
+
+	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
+		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
+
+		gpu_scid &= 0x1f;
+		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
+			       (gpu_scid << 15) | (gpu_scid << 20);
+	}
+
+	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
+		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
+
+		gpuhtw_scid &= 0x1f;
+		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
+	}
+
+	if (cntl1_regval) {
+		/*
+		 * Program the slice IDs for the various GPU blocks and GPU MMU
+		 * pagetables
+		 */
+		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
+
+		/*
+		 * Program cacheability overrides to not allocate cache lines on
+		 * a write miss
+		 */
+		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
+	}
+}
+
+static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
+{
+	llcc_slice_putd(a6xx_gpu->llc_slice);
+	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
+}
+
+static void a6xx_llc_slices_init(struct platform_device *pdev,
+		struct a6xx_gpu *a6xx_gpu)
+{
+	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
+	if (IS_ERR(a6xx_gpu->llc_mmio))
+		return;
+
+	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
+	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
+
+	if (IS_ERR(a6xx_gpu->llc_slice) && IS_ERR(a6xx_gpu->htw_llc_slice))
+		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
+}
+
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -822,6 +897,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	msm_gpu_resume_devfreq(gpu);
 
+	a6xx_llc_activate(a6xx_gpu);
+
 	return 0;
 }
 
@@ -830,6 +907,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	a6xx_llc_deactivate(a6xx_gpu);
+
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
 	return a6xx_gmu_stop(a6xx_gpu);
@@ -868,6 +947,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put_unlocked(a6xx_gpu->sqe_bo);
 	}
 
+	a6xx_llc_slices_destroy(a6xx_gpu);
 	a6xx_gmu_remove(a6xx_gpu);
 
 	adreno_gpu_cleanup(adreno_gpu);
@@ -962,6 +1042,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 	adreno_gpu->reg_offsets = a6xx_register_offsets;
 
+	a6xx_llc_slices_init(pdev, a6xx_gpu);
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 7239b8b60939..90043448fab1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -21,6 +21,9 @@ struct a6xx_gpu {
 	struct msm_ringbuffer *cur_ring;
 
 	struct a6xx_gmu gmu;
+	void __iomem *llc_mmio;
+	void *llc_slice;
+	void *htw_llc_slice;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 3e717c1ebb7f..4666d2df8e65 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -190,10 +190,31 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev)
 {
 	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
-	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
 	u64 start, size;
 
+	/*
+	 * This allows GPU to set the bus attributes required to use system
+	 * cache on behalf of the iommu page table walker.
+	 */
+	if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
+		int gpu_htw_llc = 1;
+
+		iommu_domain_set_attr(iommu, DOMAIN_ATTR_SYS_CACHE, &gpu_htw_llc);
+	}
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	if (!IS_ERR(a6xx_gpu->llc_slice))
+		mmu->features |= MMU_FEATURE_USE_SYSTEM_CACHE;
+
 	/*
 	 * Use the aperture start or SZ_16M, whichever is greater. This will
 	 * ensure that we align with the allocated pagetable range while still
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index f455c597f76d..bd1d58229cc2 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 		iova |= GENMASK_ULL(63, 49);
 
 
+	if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
+		prot |= IOMMU_SYS_CACHE_ONLY;
+
 	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
 	WARN_ON(!ret);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 61ade89d9e48..90965241e567 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -23,12 +23,16 @@ enum msm_mmu_type {
 	MSM_MMU_IOMMU_PAGETABLE,
 };
 
+/* MMU features */
+#define MMU_FEATURE_USE_SYSTEM_CACHE	BIT(0)
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags);
 	void *arg;
 	enum msm_mmu_type type;
+	u32 features;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
