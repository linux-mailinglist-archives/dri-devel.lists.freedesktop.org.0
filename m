Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C81651A4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 22:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436376E87A;
	Wed, 19 Feb 2020 21:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14B26E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 21:33:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582147990; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=czO2p/B2uggnsY629WYpUQFeKB4TZChcSP7Dbrrg8vo=;
 b=t/NadnJrinfvoiFqu63OME2G1VOtCufj/mNQnAs7hmqj+eEpEKwsejs2HuLwpIUH+56GsSUR
 k73rbtv7SZ7UQsB+rWAq9GR48p04rXtz8jB8I32iZCfWkzLKyHeg9c69vCI1QeSGUc66P5u/
 fzp8RoiEgjs/TbylBzupLiKUQrk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4da994.7f635dc2ad50-smtp-out-n03;
 Wed, 19 Feb 2020 21:33:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E0960C43383; Wed, 19 Feb 2020 21:33:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BA99C4479D;
 Wed, 19 Feb 2020 21:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BA99C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 4/4] drm/msm/a6xx: Use the DMA API for GMU memory objects
Date: Wed, 19 Feb 2020 14:32:58 -0700
Message-Id: <1582147978-31475-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
References: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMU has very few memory allocations and uses a flat memory space so
there is no good reason to go out of our way to bypass the DMA APIs which
were basically designed for this exact secnario.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 107 ++--------------------------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   5 +-
 2 files changed, 7 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 983afea..97c9ddf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -895,21 +896,10 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
 {
-	int count, i;
-	u64 iova;
-
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
-	count = bo->size >> PAGE_SHIFT;
-	iova = bo->iova;
-
-	for (i = 0; i < count; i++, iova += PAGE_SIZE) {
-		iommu_unmap(gmu->domain, iova, PAGE_SIZE);
-		__free_pages(bo->pages[i], 0);
-	}
-
-	kfree(bo->pages);
+	dma_free_attrs(gmu->dev, bo->size, bo->virt, bo->iova, bo->attrs);
 	kfree(bo);
 }
 
@@ -917,94 +907,23 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 		size_t size)
 {
 	struct a6xx_gmu_bo *bo;
-	int ret, count, i;
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
 		return ERR_PTR(-ENOMEM);
 
 	bo->size = PAGE_ALIGN(size);
+	bo->attrs = DMA_ATTR_WRITE_COMBINE;
 
-	count = bo->size >> PAGE_SHIFT;
+	bo->virt = dma_alloc_attrs(gmu->dev, bo->size, &bo->iova, GFP_KERNEL,
+		bo->attrs);
 
-	bo->pages = kcalloc(count, sizeof(struct page *), GFP_KERNEL);
-	if (!bo->pages) {
+	if (!bo->virt) {
 		kfree(bo);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	for (i = 0; i < count; i++) {
-		bo->pages[i] = alloc_page(GFP_KERNEL);
-		if (!bo->pages[i])
-			goto err;
-	}
-
-	bo->iova = gmu->uncached_iova_base;
-
-	for (i = 0; i < count; i++) {
-		ret = iommu_map(gmu->domain,
-			bo->iova + (PAGE_SIZE * i),
-			page_to_phys(bo->pages[i]), PAGE_SIZE,
-			IOMMU_READ | IOMMU_WRITE);
-
-		if (ret) {
-			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
-
-			for (i = i - 1 ; i >= 0; i--)
-				iommu_unmap(gmu->domain,
-					bo->iova + (PAGE_SIZE * i),
-					PAGE_SIZE);
-
-			goto err;
-		}
-	}
-
-	bo->virt = vmap(bo->pages, count, VM_IOREMAP,
-		pgprot_writecombine(PAGE_KERNEL));
-	if (!bo->virt)
-		goto err;
-
-	/* Align future IOVA addresses on 1MB boundaries */
-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
-
 	return bo;
-
-err:
-	for (i = 0; i < count; i++) {
-		if (bo->pages[i])
-			__free_pages(bo->pages[i], 0);
-	}
-
-	kfree(bo->pages);
-	kfree(bo);
-
-	return ERR_PTR(-ENOMEM);
-}
-
-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
-{
-	int ret;
-
-	/*
-	 * The GMU address space is hardcoded to treat the range
-	 * 0x60000000 - 0x80000000 as un-cached memory. All buffers shared
-	 * between the GMU and the CPU will live in this space
-	 */
-	gmu->uncached_iova_base = 0x60000000;
-
-
-	gmu->domain = iommu_domain_alloc(&platform_bus_type);
-	if (!gmu->domain)
-		return -ENODEV;
-
-	ret = iommu_attach_device(gmu->domain, gmu->dev);
-
-	if (ret) {
-		iommu_domain_free(gmu->domain);
-		gmu->domain = NULL;
-	}
-
-	return ret;
 }
 
 /* Return the 'arc-level' for the given frequency */
@@ -1264,10 +1183,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
-	iommu_detach_device(gmu->domain, gmu->dev);
-
-	iommu_domain_free(gmu->domain);
-
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 
@@ -1300,11 +1215,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	/* Set up the IOMMU context bank */
-	ret = a6xx_gmu_memory_probe(gmu);
-	if (ret)
-		goto err_put_device;
-
 	/* Allocate memory for for the HFI queues */
 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
 	if (IS_ERR(gmu->hfi))
@@ -1350,11 +1260,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 err_memory:
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
-	if (gmu->domain) {
-		iommu_detach_device(gmu->domain, gmu->dev);
-
-		iommu_domain_free(gmu->domain);
-	}
 	ret = -ENODEV;
 
 err_put_device:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 2af91ed..31bd1987 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -13,7 +13,7 @@ struct a6xx_gmu_bo {
 	void *virt;
 	size_t size;
 	u64 iova;
-	struct page **pages;
+	unsigned long attrs;
 };
 
 /*
@@ -49,9 +49,6 @@ struct a6xx_gmu {
 	int hfi_irq;
 	int gmu_irq;
 
-	struct iommu_domain *domain;
-	u64 uncached_iova_base;
-
 	struct device *gxpd;
 
 	int idle_level;
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
