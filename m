Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E58268550
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977066E1B7;
	Mon, 14 Sep 2020 07:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 382 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2020 14:34:32 UTC
Received: from a27-185.smtp-out.us-west-2.amazonses.com
 (a27-185.smtp-out.us-west-2.amazonses.com [54.240.27.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C505B88A9C;
 Fri, 11 Sep 2020 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599834490;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=EohA/RPgLsQifsaqlGdO8cLmSjFdg04RXQoLbabyzvo=;
 b=h3VlPMq8htRmOwZEHkNvOcLCuETtjbBXGNvz42vm330buSVxBVSU6Vn6qsrfBB91
 a+N2REibOf04sJE8ibbNkjnm7teCAdcKZjnrZ78ej3smdlp7lSae42yV+tGqoKvI1G1
 4vJsnRmw2yJu5O1kleavCWYVWuHyvtFrEKaeqV74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599834490;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=EohA/RPgLsQifsaqlGdO8cLmSjFdg04RXQoLbabyzvo=;
 b=dmShjsCmi99q/HUAeOFY7LReQBFZTcLXvP1+gZfQA3ca8yoclPVFAhwCnWAPl4ri
 Sy1JOvtzJJRl4QNYY5ajEWqmh6AEaZzzx6gXSRyugNzTzDjz0GBXnYxFulDMC3IPaC+
 kqVXKtXK54wNN/V2Pe7iquRSYzxkLV56YMUmcQIM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB69CC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv4 4/6] drm/msm/a6xx: Add support for using system cache(LLC)
Date: Fri, 11 Sep 2020 14:28:10 +0000
Message-ID: <010101747d91036d-06c64bc8-3289-4319-ad7b-fce983a43b92-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.11-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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
of the system cache to set the right TCR attributes. GPU then
has the ability to override a few cacheability parameters which
it does to override write-allocate to write-no-allocate as the
GPU hardware does not benefit much from it.

DOMAIN_ATTR_SYS_CACHE is another domain level attribute used by the
IOMMU driver to set the right attributes to cache the hardware
pagetables into the system cache.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
(saiprakash.ranjan: fix to set attr before device attach to iommu and rebase)
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 83 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++-
 3 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a3a8d6fd06bb..6241b93ed375 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -9,6 +9,8 @@
 #include "a6xx_gmu.xml.h"
 
 #include <linux/devfreq.h>
+#include <linux/bitfield.h>
+#include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
 
@@ -969,6 +971,79 @@ static const u32 a6xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
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
@@ -985,6 +1060,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	msm_gpu_resume_devfreq(gpu);
 
+	a6xx_llc_activate(a6xx_gpu);
+
 	return 0;
 }
 
@@ -995,6 +1072,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	a6xx_llc_deactivate(a6xx_gpu);
+
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
 	return a6xx_gmu_stop(a6xx_gpu);
@@ -1033,6 +1112,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a6xx_gpu->sqe_bo);
 	}
 
+	a6xx_llc_slices_destroy(a6xx_gpu);
+
 	a6xx_gmu_remove(a6xx_gpu);
 
 	adreno_gpu_cleanup(adreno_gpu);
@@ -1132,6 +1213,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (adreno_is_a650(adreno_gpu))
 		adreno_gpu->base.hw_apriv = true;
 
+	a6xx_llc_slices_init(pdev, a6xx_gpu);
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index da22d7549d9b..da4c8a817025 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,10 @@ struct a6xx_gpu {
 	struct msm_file_private *cur_ctx;
 
 	struct a6xx_gmu gmu;
+
+	void __iomem *llc_mmio;
+	void *llc_slice;
+	void *htw_llc_slice;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b703e5308b01..b7a152451f78 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -16,6 +16,7 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <soc/qcom/ocmem.h>
 #include "adreno_gpu.h"
+#include "a6xx_gpu.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
@@ -190,10 +191,28 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
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
 	/*
 	 * Use the aperture start or SZ_16M, whichever is greater. This will
 	 * ensure that we align with the allocated pagetable range while still
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
