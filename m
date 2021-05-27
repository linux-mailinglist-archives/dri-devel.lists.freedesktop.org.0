Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F03937A3
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF056F4D4;
	Thu, 27 May 2021 20:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258A46F4CD;
 Thu, 27 May 2021 20:56:15 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id k4so1505933ili.4;
 Thu, 27 May 2021 13:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cYgArYhWT+z/4+YUOepxn67gZTW6vYNK84K++vMOkHs=;
 b=WRxOTAVFWmz3qY9+B7G7QF3T0vUcUKj5BuW11w3t3c+YM7LvApuzHn5SpFL5cKknQK
 50XjT3mrje7hY8gFU5USsRQH5OUQPjMcdNBycxXdNSKUQ2r7avtVUMHELPkhFHg0+qjK
 vS02LmYUQ0kZRU+6pWyi5Nd+r24IMUy6r0/FP+HDIMSTZPSnRaoLBlM6z9XCKQawhMca
 bYJSp3x4nnvWYp1EdM7DNHa+IgYfiysxJuk7aRjvf3LjC4n56HAklSK9qxhAHQuCEsI4
 LBVV6RNEzVl6g0FA+bs9YznieTnVI3+pW3ho4olrCIHpaDOkbYqtuorxKkUMunsSG/YM
 SQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYgArYhWT+z/4+YUOepxn67gZTW6vYNK84K++vMOkHs=;
 b=HXiQPZM77tGba+KD70VNG+4SQa506HyWMr74jgwh2pIEz2dJLWln4apFHw6WOTsxrU
 XbdeCllacTeI8uURsXXmzpCeQkhvgbHb/UAQMjbyo/WwlN+Gyz7D8HOCszHA1EVXOfvQ
 yLFFQZJkOiiW1ofeBNV8ZnaI91LiBO9URTn/C/3W2c1sptU5Di9eMIQovfmMDDWcnxto
 71oRsGrGNkKc/+C14rcfkUUznkKuLmcfqcO7fVFZRKq73uBLqClatTX1maWZsHJkOaJY
 fpS4GugWLp5wxGlNyXGgPIRhFTE7PiTVfnew0y8OeI06q66GtlfL/vbk2DzklMYGaQog
 0FUw==
X-Gm-Message-State: AOAM530eBBlnAhystLZL+eJJUjuUvGipuhuqKKugXh1kXLOij76YlHn0
 t3vSvKUBCZs/maYpJctJg3wmMHITRnNCzg==
X-Google-Smtp-Source: ABdhPJzuesr7wky56TrTaKRgKsSaC3GkVDswyJksMURbnn0KyXkg1sF3ojsumAw+QkoirYIsoKj5Fg==
X-Received: by 2002:a92:cda7:: with SMTP id g7mr4210742ild.50.1622148974142;
 Thu, 27 May 2021 13:56:14 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:13 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] drm/amdkfd: classify and map mixed svm range pages in
 GPU
Date: Thu, 27 May 2021 16:56:01 -0400
Message-Id: <20210527205606.2660-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527205606.2660-1-Felix.Kuehling@amd.com>
References: <20210527205606.2660-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

[Why]
svm ranges can have mixed pages from device or system memory.
A good example is, after a prange has been allocated in VRAM and a
copy-on-write is triggered by a fork. This invalidates some pages
inside the prange. Endding up in mixed pages.

[How]
By classifying each page inside a prange, based on its type. Device or
system memory, during dma mapping call. If page corresponds
to VRAM domain, a flag is set to its dma_addr entry for each GPU.
Then, at the GPU page table mapping. All group of contiguous pages within
the same type are mapped with their proper pte flags.

v2:
Instead of using ttm_res to calculate vram pfns in the svm_range. It is now
done by setting the vram real physical address into drm_addr array.
This makes more flexible VRAM management, plus removes the need to have
a BO reference in the svm_range.

v3:
Remove mapping member from svm_range

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 72 +++++++++++++++++-----------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 +-
 2 files changed, 46 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 2b4318646a75..7b50395ec377 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -119,11 +119,12 @@ static void svm_range_remove_notifier(struct svm_range *prange)
 }
 
 static int
-svm_range_dma_map_dev(struct device *dev, dma_addr_t **dma_addr,
+svm_range_dma_map_dev(struct amdgpu_device *adev, dma_addr_t **dma_addr,
 		      unsigned long *hmm_pfns, uint64_t npages)
 {
 	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
 	dma_addr_t *addr = *dma_addr;
+	struct device *dev = adev->dev;
 	struct page *page;
 	int i, r;
 
@@ -141,6 +142,14 @@ svm_range_dma_map_dev(struct device *dev, dma_addr_t **dma_addr,
 			dma_unmap_page(dev, addr[i], PAGE_SIZE, dir);
 
 		page = hmm_pfn_to_page(hmm_pfns[i]);
+		if (is_zone_device_page(page)) {
+			addr[i] = (hmm_pfns[i] << PAGE_SHIFT) +
+				   adev->vm_manager.vram_base_offset -
+				   adev->kfd.dev->pgmap.range.start;
+			addr[i] |= SVM_RANGE_VRAM_DOMAIN;
+			pr_debug("vram address detected: 0x%llx\n", addr[i]);
+			continue;
+		}
 		addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
 		r = dma_mapping_error(dev, addr[i]);
 		if (r) {
@@ -175,7 +184,7 @@ svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
 		}
 		adev = (struct amdgpu_device *)pdd->dev->kgd;
 
-		r = svm_range_dma_map_dev(adev->dev, &prange->dma_addr[gpuidx],
+		r = svm_range_dma_map_dev(adev, &prange->dma_addr[gpuidx],
 					  hmm_pfns, prange->npages);
 		if (r)
 			break;
@@ -1003,21 +1012,22 @@ svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 }
 
 static uint64_t
-svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
+svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange,
+			int domain)
 {
 	struct amdgpu_device *bo_adev;
 	uint32_t flags = prange->flags;
 	uint32_t mapping_flags = 0;
 	uint64_t pte_flags;
-	bool snoop = !prange->ttm_res;
+	bool snoop = (domain != SVM_RANGE_VRAM_DOMAIN);
 	bool coherent = flags & KFD_IOCTL_SVM_FLAG_COHERENT;
 
-	if (prange->svm_bo && prange->ttm_res)
+	if (domain == SVM_RANGE_VRAM_DOMAIN)
 		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
 
 	switch (adev->asic_type) {
 	case CHIP_ARCTURUS:
-		if (prange->svm_bo && prange->ttm_res) {
+		if (domain == SVM_RANGE_VRAM_DOMAIN) {
 			if (bo_adev == adev) {
 				mapping_flags |= coherent ?
 					AMDGPU_VM_MTYPE_CC : AMDGPU_VM_MTYPE_RW;
@@ -1032,7 +1042,7 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 		}
 		break;
 	case CHIP_ALDEBARAN:
-		if (prange->svm_bo && prange->ttm_res) {
+		if (domain == SVM_RANGE_VRAM_DOMAIN) {
 			if (bo_adev == adev) {
 				mapping_flags |= coherent ?
 					AMDGPU_VM_MTYPE_CC : AMDGPU_VM_MTYPE_RW;
@@ -1061,14 +1071,14 @@ svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 		mapping_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
 
 	pte_flags = AMDGPU_PTE_VALID;
-	pte_flags |= prange->ttm_res ? 0 : AMDGPU_PTE_SYSTEM;
+	pte_flags |= (domain == SVM_RANGE_VRAM_DOMAIN) ? 0 : AMDGPU_PTE_SYSTEM;
 	pte_flags |= snoop ? AMDGPU_PTE_SNOOPED : 0;
 
 	pte_flags |= amdgpu_gem_va_map_flags(adev, mapping_flags);
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d PTE 0x%llx mapping 0x%x\n",
 		 prange->svms, prange->start, prange->last,
-		 prange->ttm_res ? 1:0, pte_flags, mapping_flags);
+		 (domain == SVM_RANGE_VRAM_DOMAIN) ? 1:0, pte_flags, mapping_flags);
 
 	return pte_flags;
 }
@@ -1138,31 +1148,40 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 {
 	struct amdgpu_bo_va bo_va;
 	uint64_t pte_flags;
+	unsigned long last_start;
+	int last_domain;
 	int r = 0;
+	int64_t i;
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
 		 prange->last);
 
-	if (prange->svm_bo && prange->ttm_res) {
+	if (prange->svm_bo && prange->ttm_res)
 		bo_va.is_xgmi = amdgpu_xgmi_same_hive(adev, bo_adev);
-		prange->mapping.bo_va = &bo_va;
-	}
 
-	prange->mapping.start = prange->start;
-	prange->mapping.last = prange->last;
-	prange->mapping.offset = prange->offset;
-	pte_flags = svm_range_get_pte_flags(adev, prange);
+	last_start = prange->start;
+	for (i = 0; i < prange->npages; i++) {
+		last_domain = dma_addr[i] & SVM_RANGE_VRAM_DOMAIN;
+		if ((prange->start + i) < prange->last &&
+		    last_domain == (dma_addr[i + 1] & SVM_RANGE_VRAM_DOMAIN))
+			continue;
 
-	r = amdgpu_vm_bo_update_mapping(adev, bo_adev, vm, false, false, NULL,
-					prange->mapping.start,
-					prange->mapping.last, pte_flags,
-					prange->mapping.offset,
-					prange->ttm_res ?
-						prange->ttm_res->mm_node : NULL,
-					dma_addr, &vm->last_update);
-	if (r) {
-		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
-		goto out;
+		pr_debug("Mapping range [0x%lx 0x%llx] on domain: %s\n",
+			 last_start, prange->start + i, last_domain ? "GPU" : "CPU");
+		pte_flags = svm_range_get_pte_flags(adev, prange, last_domain);
+		r = amdgpu_vm_bo_update_mapping(adev, bo_adev, vm, false, false, NULL,
+						last_start,
+						prange->start + i, pte_flags,
+						prange->offset +
+						((last_start - prange->start) << PAGE_SHIFT),
+						NULL,
+						dma_addr,
+						&vm->last_update);
+		if (r) {
+			pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
+			goto out;
+		}
+		last_start = prange->start + i + 1;
 	}
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
@@ -1176,7 +1195,6 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 out:
-	prange->mapping.bo_va = NULL;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 08542fe39303..27fbe1936493 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -35,6 +35,7 @@
 #include "amdgpu.h"
 #include "kfd_priv.h"
 
+#define SVM_RANGE_VRAM_DOMAIN (1UL << 0)
 #define SVM_ADEV_PGMAP_OWNER(adev)\
 			((adev)->hive ? (void *)(adev)->hive : (void *)(adev))
 
@@ -113,7 +114,6 @@ struct svm_range {
 	struct list_head		update_list;
 	struct list_head		remove_list;
 	struct list_head		insert_list;
-	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
 	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
 	struct ttm_resource		*ttm_res;
-- 
2.31.1

