Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AE1B3838
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3896E9D4;
	Wed, 22 Apr 2020 06:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5B6E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:41:54 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z90so246240qtd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b9pVDKP0g8S2MfYf57rVnW4jv51OskWN8uJ/QQ1ShYs=;
 b=eKvYVCAA3IuMzC7NIFA2msjk5O/EzP63iwMdo1CaabARLRTe3qM6ksBbM7oXPEIzKk
 dlgbJl0jUwBKgQb+ATjFLoBErcBv70VJ7uE7IPhncYnC1KwmX9CKEO8ciXndyBTAsUjX
 8RQlo4+a5hSqLWtaANXaw0QP6K9fqOEfQ2p2qDQN37b0FvKfG8IG/ysc25YFZij98p2n
 pMvRZF/iltw0GvL4Zm5qph2IJAbWCMfPhDaA/mGXEkh+brTR6XxZeGw7DgYFvCCXuQFI
 rlQqckrRq6FlwsTI5OiM4EDdUSOXF9QAyLnhMBvgfgnLkNh3ca2hqUIhD3dBYOngT+qO
 4CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9pVDKP0g8S2MfYf57rVnW4jv51OskWN8uJ/QQ1ShYs=;
 b=giTRbivJT2Os8W7KJnAuiIa9faFf/tFHF0Mia8BDi69roKi8gGdfyzV4z60bmi0aLM
 Z20r2RPHJsCVC96suLwprBkvNiPFwLPaHZvFZvA3UMmoCGhMhV0fZeSbWYy7vrQD1dc2
 +Ttt2Hldgku9teM6aJGG6OKey2qeb3K2lrtCMYJ9IA7BiyFjjUdleTgAtGarWX62GoCX
 6p2R37ihJL+xCq23Pp4g8yw7sWkMzRzUNBaIlFitRUZz4EaEcnD0EO7ohEcARIs9Gwf9
 LPHyT9eQExftpRe80Wrda8WpN5clU0Pl1ZfZldMM+2yCe2WlXoVXGPDxC4LLY9uk/zJ6
 AnnA==
X-Gm-Message-State: AGi0Pubn5o1lbA1bPmNKlYI/cg8hrp5cMvi4mYGJiYjN9S+fDK/meDXa
 aStGkD3qhjfE80NFBPUHh2QRYQ==
X-Google-Smtp-Source: APiQypJik1AHenL1jETiWCR/SiGe6lM8oTClQwmrr/TKg3hEM68Rw0RUUB7Vc9mjsSvefZOFo63JPA==
X-Received: by 2002:ac8:2dab:: with SMTP id p40mr23165393qta.6.1587512513360; 
 Tue, 21 Apr 2020 16:41:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:41:52 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/msm/a6xx: use msm_gem for GMU memory objects
Date: Tue, 21 Apr 2020 19:41:21 -0400
Message-Id: <20200421234127.27965-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This gives more fine-grained control over how memory is allocated over the
DMA api. In particular, it allows using an address range or pinning to
a fixed address.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 115 ++++++++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |   6 +-
 3 files changed, 88 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c4e71abbdd53..c9fd0470a321 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2,14 +2,16 @@
 /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
 
 #include <linux/clk.h>
-#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <soc/qcom/cmd-db.h>
+#include <drm/drm_gem.h>
 
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
+#include "msm_gem.h"
+#include "msm_mmu.h"
 
 static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
 {
@@ -620,7 +622,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_BOOT_CONFIG, 0x02);
 
 	/* Write the iova of the HFI table */
-	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_ADDR, gmu->hfi->iova);
+	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_ADDR, gmu->hfi.iova);
 	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_INFO, 1);
 
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
@@ -919,34 +921,77 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	return 0;
 }
 
-static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
+static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
-	if (IS_ERR_OR_NULL(bo))
-		return;
+	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace, false);
+
+	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
+	msm_gem_address_space_put(gmu->aspace);
+}
+
+static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
+		size_t size, u64 iova)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct drm_device *dev = a6xx_gpu->base.base.dev;
+	uint32_t flags = MSM_BO_WC;
+	u64 range_start, range_end;
+	int ret;
+
+	size = PAGE_ALIGN(size);
+	if (!iova) {
+		/* no fixed address - use GMU's uncached range */
+		range_start = 0x60000000;
+		range_end = 0x80000000;
+	} else {
+		/* range for fixed address */
+		range_start = iova;
+		range_end = iova + size;
+	}
+
+	bo->obj = msm_gem_new(dev, size, flags);
+	if (IS_ERR(bo->obj))
+		return PTR_ERR(bo->obj);
 
-	dma_free_wc(gmu->dev, bo->size, bo->virt, bo->iova);
-	kfree(bo);
+	ret = msm_gem_get_and_pin_iova_range(bo->obj, gmu->aspace, &bo->iova,
+		range_start >> PAGE_SHIFT, range_end >> PAGE_SHIFT);
+	if (ret) {
+		drm_gem_object_put(bo->obj);
+		return ret;
+	}
+
+	bo->virt = msm_gem_get_vaddr(bo->obj);
+	bo->size = size;
+
+	return 0;
 }
 
-static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
-		size_t size)
+static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 {
-	struct a6xx_gmu_bo *bo;
+	struct iommu_domain *domain;
+	int ret;
 
-	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
-	if (!bo)
-		return ERR_PTR(-ENOMEM);
+	domain = iommu_domain_alloc(&platform_bus_type);
+	if (!domain)
+		return -ENODEV;
 
-	bo->size = PAGE_ALIGN(size);
+	domain->geometry.aperture_start = 0x00000000;
+	domain->geometry.aperture_end = 0x7fffffff;
 
-	bo->virt = dma_alloc_wc(gmu->dev, bo->size, &bo->iova, GFP_KERNEL);
+	gmu->aspace = msm_gem_address_space_create(gmu->dev, domain, "gmu");
+	if (IS_ERR(gmu->aspace)) {
+		iommu_domain_free(domain);
+		return PTR_ERR(gmu->aspace);
+	}
 
-	if (!bo->virt) {
-		kfree(bo);
-		return ERR_PTR(-ENOMEM);
+	ret = gmu->aspace->mmu->funcs->attach(gmu->aspace->mmu);
+	if (ret) {
+		msm_gem_address_space_put(gmu->aspace);
+		return ret;
 	}
 
-	return bo;
+	return 0;
 }
 
 /* Return the 'arc-level' for the given frequency */
@@ -1204,7 +1249,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	iounmap(gmu->mmio);
 	gmu->mmio = NULL;
 
-	a6xx_gmu_memory_free(gmu, gmu->hfi);
+	a6xx_gmu_memory_free(gmu);
 
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
@@ -1226,15 +1271,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	gmu->dev = &pdev->dev;
 
-	/* Pass force_dma false to require the DT to set the dma region */
-	ret = of_dma_configure(gmu->dev, node, false);
-	if (ret)
-		return ret;
-
-	/* Set the mask after the of_dma_configure() */
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(31));
-	if (ret)
-		return ret;
+	of_dma_configure(gmu->dev, node, true);
 
 	/* Fow now, don't do anything fancy until we get our feet under us */
 	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
@@ -1246,20 +1283,26 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
+	ret = a6xx_gmu_memory_probe(gmu);
+	if (ret)
+		goto err_put_device;
+
 	/* Allocate memory for for the HFI queues */
-	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
-	if (IS_ERR(gmu->hfi))
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0);
+	if (ret)
 		goto err_memory;
 
 	/* Allocate memory for the GMU debug region */
-	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
-	if (IS_ERR(gmu->debug))
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_16K, 0);
+	if (ret)
 		goto err_memory;
 
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
-	if (IS_ERR(gmu->mmio))
+	if (IS_ERR(gmu->mmio)) {
+		ret = PTR_ERR(gmu->mmio);
 		goto err_memory;
+	}
 
 	/* Get the HFI and GMU interrupts */
 	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
@@ -1288,11 +1331,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	iounmap(gmu->mmio);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
-err_memory:
-	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	ret = -ENODEV;
 
+err_memory:
+	a6xx_gmu_memory_free(gmu);
 err_put_device:
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 4af65a36d5ca..cd66a5e1d7e9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -10,9 +10,10 @@
 #include "a6xx_hfi.h"
 
 struct a6xx_gmu_bo {
+	struct drm_gem_object *obj;
 	void *virt;
 	size_t size;
-	dma_addr_t iova;
+	u64 iova;
 };
 
 /*
@@ -43,6 +44,8 @@ struct a6xx_gmu_bo {
 struct a6xx_gmu {
 	struct device *dev;
 
+	struct msm_gem_address_space *aspace;
+
 	void * __iomem mmio;
 
 	int hfi_irq;
@@ -52,8 +55,8 @@ struct a6xx_gmu {
 
 	int idle_level;
 
-	struct a6xx_gmu_bo *hfi;
-	struct a6xx_gmu_bo *debug;
+	struct a6xx_gmu_bo hfi;
+	struct a6xx_gmu_bo debug;
 
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index e450e0b97211..b90343d4caf0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -176,8 +176,8 @@ static int a6xx_hfi_send_gmu_init(struct a6xx_gmu *gmu, int boot_state)
 {
 	struct a6xx_hfi_msg_gmu_init_cmd msg = { 0 };
 
-	msg.dbg_buffer_addr = (u32) gmu->debug->iova;
-	msg.dbg_buffer_size = (u32) gmu->debug->size;
+	msg.dbg_buffer_addr = (u32) gmu->debug.iova;
+	msg.dbg_buffer_size = (u32) gmu->debug.size;
 	msg.boot_state = boot_state;
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_INIT, &msg, sizeof(msg),
@@ -385,7 +385,7 @@ static void a6xx_hfi_queue_init(struct a6xx_hfi_queue *queue,
 
 void a6xx_hfi_init(struct a6xx_gmu *gmu)
 {
-	struct a6xx_gmu_bo *hfi = gmu->hfi;
+	struct a6xx_gmu_bo *hfi = &gmu->hfi;
 	struct a6xx_hfi_queue_table_header *table = hfi->virt;
 	struct a6xx_hfi_queue_header *headers = hfi->virt + sizeof(*table);
 	u64 offset;
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
