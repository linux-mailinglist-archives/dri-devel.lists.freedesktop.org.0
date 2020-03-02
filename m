Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F2B17657C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA066E843;
	Mon,  2 Mar 2020 20:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63EC6E843;
 Mon,  2 Mar 2020 20:58:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="262915303"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2020 12:58:49 -0800
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Mar 2020 12:58:49 -0800
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.2]) by
 fmsmsx115.amr.corp.intel.com ([169.254.4.81]) with mapi id 14.03.0439.000;
 Mon, 2 Mar 2020 12:58:49 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Jordan Crouse <jcrouse@codeaurora.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] drm/msm/a6xx: Use the DMA API for GMU memory
 objects
Thread-Topic: [PATCH v4 2/2] drm/msm/a6xx: Use the DMA API for GMU memory
 objects
Thread-Index: AQHV8NPlMBHxtuqcFk6x//p6aZDLUag1x50A
Date: Mon, 2 Mar 2020 20:58:48 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663F4FDE244@FMSMSX108.amr.corp.intel.com>
References: <1583182067-16530-1-git-send-email-jcrouse@codeaurora.org>
 <1583182067-16530-3-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1583182067-16530-3-git-send-email-jcrouse@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 "smasetty@codeaurora.org" <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Jordan Crouse
>Sent: Monday, March 2, 2020 3:48 PM
>To: linux-arm-msm@vger.kernel.org
>Cc: Douglas Anderson <dianders@chromium.org>; David Airlie
><airlied@linux.ie>; freedreno@lists.freedesktop.org;
>smasetty@codeaurora.org; linux-kernel@vger.kernel.org; dri-
>devel@lists.freedesktop.org; Stephen Boyd <swboyd@chromium.org>; Ruhl,
>Michael J <michael.j.ruhl@intel.com>; Sean Paul <sean@poorly.run>
>Subject: [PATCH v4 2/2] drm/msm/a6xx: Use the DMA API for GMU memory
>objects
>
>The GMU has very few memory allocations and uses a flat memory space so
>there is no good reason to go out of our way to bypass the DMA APIs which
>were basically designed for this exact scenario.
>
>v4: Use dma_alloc_wc()

The patch and the update look good to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Mike

>v3: Set the dma mask correctly and use dma_addr_t for the iova type
>v2: Pass force_dma false to of_dma_configure to require that the DMA
>region be set up and return error from of_dma_configure to fail probe.
>
>Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>---
>
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 113 ++++---------------------------
>---
> drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   6 +-
> 2 files changed, 12 insertions(+), 107 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>index 748cd37..dd51dd0 100644
>--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>@@ -2,6 +2,7 @@
> /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
>
> #include <linux/clk.h>
>+#include <linux/dma-mapping.h>
> #include <linux/interconnect.h>
> #include <linux/pm_domain.h>
> #include <linux/pm_opp.h>
>@@ -920,21 +921,10 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>
> static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct
>a6xx_gmu_bo *bo)
> {
>-	int count, i;
>-	u64 iova;
>-
> 	if (IS_ERR_OR_NULL(bo))
> 		return;
>
>-	count = bo->size >> PAGE_SHIFT;
>-	iova = bo->iova;
>-
>-	for (i = 0; i < count; i++, iova += PAGE_SIZE) {
>-		iommu_unmap(gmu->domain, iova, PAGE_SIZE);
>-		__free_pages(bo->pages[i], 0);
>-	}
>-
>-	kfree(bo->pages);
>+	dma_free_wc(gmu->dev, bo->size, bo->virt, bo->iova);
> 	kfree(bo);
> }
>
>@@ -942,7 +932,6 @@ static struct a6xx_gmu_bo
>*a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
> 		size_t size)
> {
> 	struct a6xx_gmu_bo *bo;
>-	int ret, count, i;
>
> 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
> 	if (!bo)
>@@ -950,86 +939,14 @@ static struct a6xx_gmu_bo
>*a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>
> 	bo->size = PAGE_ALIGN(size);
>
>-	count = bo->size >> PAGE_SHIFT;
>+	bo->virt = dma_alloc_wc(gmu->dev, bo->size, &bo->iova,
>GFP_KERNEL);
>
>-	bo->pages = kcalloc(count, sizeof(struct page *), GFP_KERNEL);
>-	if (!bo->pages) {
>+	if (!bo->virt) {
> 		kfree(bo);
> 		return ERR_PTR(-ENOMEM);
> 	}
>
>-	for (i = 0; i < count; i++) {
>-		bo->pages[i] = alloc_page(GFP_KERNEL);
>-		if (!bo->pages[i])
>-			goto err;
>-	}
>-
>-	bo->iova = gmu->uncached_iova_base;
>-
>-	for (i = 0; i < count; i++) {
>-		ret = iommu_map(gmu->domain,
>-			bo->iova + (PAGE_SIZE * i),
>-			page_to_phys(bo->pages[i]), PAGE_SIZE,
>-			IOMMU_READ | IOMMU_WRITE);
>-
>-		if (ret) {
>-			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU
>buffer object\n");
>-
>-			for (i = i - 1 ; i >= 0; i--)
>-				iommu_unmap(gmu->domain,
>-					bo->iova + (PAGE_SIZE * i),
>-					PAGE_SIZE);
>-
>-			goto err;
>-		}
>-	}
>-
>-	bo->virt = vmap(bo->pages, count, VM_IOREMAP,
>-		pgprot_writecombine(PAGE_KERNEL));
>-	if (!bo->virt)
>-		goto err;
>-
>-	/* Align future IOVA addresses on 1MB boundaries */
>-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
>-
> 	return bo;
>-
>-err:
>-	for (i = 0; i < count; i++) {
>-		if (bo->pages[i])
>-			__free_pages(bo->pages[i], 0);
>-	}
>-
>-	kfree(bo->pages);
>-	kfree(bo);
>-
>-	return ERR_PTR(-ENOMEM);
>-}
>-
>-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>-{
>-	int ret;
>-
>-	/*
>-	 * The GMU address space is hardcoded to treat the range
>-	 * 0x60000000 - 0x80000000 as un-cached memory. All buffers shared
>-	 * between the GMU and the CPU will live in this space
>-	 */
>-	gmu->uncached_iova_base = 0x60000000;
>-
>-
>-	gmu->domain = iommu_domain_alloc(&platform_bus_type);
>-	if (!gmu->domain)
>-		return -ENODEV;
>-
>-	ret = iommu_attach_device(gmu->domain, gmu->dev);
>-
>-	if (ret) {
>-		iommu_domain_free(gmu->domain);
>-		gmu->domain = NULL;
>-	}
>-
>-	return ret;
> }
>
> /* Return the 'arc-level' for the given frequency */
>@@ -1289,10 +1206,6 @@ void a6xx_gmu_remove(struct a6xx_gpu
>*a6xx_gpu)
>
> 	a6xx_gmu_memory_free(gmu, gmu->hfi);
>
>-	iommu_detach_device(gmu->domain, gmu->dev);
>-
>-	iommu_domain_free(gmu->domain);
>-
> 	free_irq(gmu->gmu_irq, gmu);
> 	free_irq(gmu->hfi_irq, gmu);
>
>@@ -1313,7 +1226,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
>struct device_node *node)
>
> 	gmu->dev = &pdev->dev;
>
>-	of_dma_configure(gmu->dev, node, true);
>+	/* Pass force_dma false to require the DT to set the dma region */
>+	ret = of_dma_configure(gmu->dev, node, false);
>+	if (ret)
>+		return ret;
>+
>+	/* Set the mask after the of_dma_configure() */
>+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(31));
>
> 	/* Fow now, don't do anything fancy until we get our feet under us */
> 	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
>@@ -1325,11 +1244,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
>struct device_node *node)
> 	if (ret)
> 		goto err_put_device;
>
>-	/* Set up the IOMMU context bank */
>-	ret = a6xx_gmu_memory_probe(gmu);
>-	if (ret)
>-		goto err_put_device;
>-
> 	/* Allocate memory for for the HFI queues */
> 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
> 	if (IS_ERR(gmu->hfi))
>@@ -1375,11 +1289,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu,
>struct device_node *node)
> err_memory:
> 	a6xx_gmu_memory_free(gmu, gmu->hfi);
>
>-	if (gmu->domain) {
>-		iommu_detach_device(gmu->domain, gmu->dev);
>-
>-		iommu_domain_free(gmu->domain);
>-	}
> 	ret = -ENODEV;
>
> err_put_device:
>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>index 2af91ed..4af65a3 100644
>--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>@@ -12,8 +12,7 @@
> struct a6xx_gmu_bo {
> 	void *virt;
> 	size_t size;
>-	u64 iova;
>-	struct page **pages;
>+	dma_addr_t iova;
> };
>
> /*
>@@ -49,9 +48,6 @@ struct a6xx_gmu {
> 	int hfi_irq;
> 	int gmu_irq;
>
>-	struct iommu_domain *domain;
>-	u64 uncached_iova_base;
>-
> 	struct device *gxpd;
>
> 	int idle_level;
>--
>2.7.4
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
