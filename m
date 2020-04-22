Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202A1B381C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2486E9A2;
	Wed, 22 Apr 2020 06:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05E989AEB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 00:21:50 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id v7so790860qkc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 17:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6jx5s1QFqa5Fi5pvAWkXLjzi37bOuYx7wzDbWsKNIM=;
 b=Z6MLVg54zHfaS9JGudJC/MhIeYqj1lJ05T7T2FfuRFlBTDq2IlJEaLsiZsQ0hrIS6l
 540vf8ceMjyQr/lWJq6nOZ2OvnHssqlzVh6eXx+EjLhcOpMUDzNFxiMGTtsL53ofAeu1
 ssXsvkJyhRMG1JztdR8+KC4RDmNHRMA0bg+PE+DOsbVi6tyh55XI91x2XId9EEzheYlt
 e2B8LojcUAwKDnZAXyISHYgmu7QE9SSjAoP7Qp7jGDfdkjQmtko5PgvTobsf35tFuXrh
 ccfj5FCl8VgnjMgHbWRdUtPCQEc7mr7u5FO+q3ztYzO8p9sGMLS7iUCpVeIw0HzE5fIX
 i5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6jx5s1QFqa5Fi5pvAWkXLjzi37bOuYx7wzDbWsKNIM=;
 b=MtlqbImPY4qqgmc+abl+5ntdpJ30MSP1cohFUUrf+EyMufORxpjNQgStAhP7VkSP6W
 wgrFz+fwhIiFkj66AjYMBMTkDnHPaAv/CiA2YC6UJHSCViHbhvNggDgc3wjoLbFQU54s
 D9l7UWpasDtWVHZBMBMVSKONL2amy57f5tUA+DLKULLRat4MTPJpvw0bgI9e/+HXyGIz
 zbNZT9MPOltV9Zc94YvoAODLTc4ACtWM1ZIJJ2Wz6LDwGa9ctQNfQQ09AvZW5Gn3TwWX
 VacIEPnT0VxvZeiB7VZ9KZ13u27NqaPfUKaDWw+P0B7wjaathKUqcawkfBrV2IZ5ZYgJ
 JqXw==
X-Gm-Message-State: AGi0PubDIuwpNbQsWA+lsq3PynDA3eivobu6rUszkeIFWBseaRpE1hzp
 aSUQo+gV1W8tG3z/uSaeNXh/hQ==
X-Google-Smtp-Source: APiQypLF90q4U3Y/dl6afosrSOlfbeDMwobNMaohrDs8gVWh1ZzzkIwVjmhPXof7dvfsMkJ697m0yA==
X-Received: by 2002:a37:4d5:: with SMTP id 204mr24351039qke.176.1587514909415; 
 Tue, 21 Apr 2020 17:21:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 134sm2860360qki.16.2020.04.21.17.21.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 17:21:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jR398-0000Bf-Ke; Tue, 21 Apr 2020 21:21:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org,
	Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH hmm 5/5] mm/hmm: remove the customizable pfn format from
 hmm_range_fault
Date: Tue, 21 Apr 2020 21:21:46 -0300
Message-Id: <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
In-Reply-To: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
References: 
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
Cc: amd-gfx@lists.freedesktop.org, John Hubbard <jhubbard@nvidia.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Presumably the intent here was that hmm_range_fault() could put the data
into some HW specific format and thus avoid some work. However, nothing
actually does that, and it isn't clear how anything actually could do that
as hmm_range_fault() provides CPU addresses which must be DMA mapped.

Perhaps there is some special HW that does not need DMA mapping, but we
don't have any examples of this, and the theoretical performance win of
avoiding an extra scan over the pfns array doesn't seem worth the
complexity. Plus pfns needs to be scanned anyhow to sort out any
DEVICE_PRIVATE pages.

This version replaces the uint64_t with an usigned long containing a pfn
and fix flags. On input flags is filled with the HMM_PFN_REQ_* values, on
successful output it is filled with HMM_PFN_* values, describing the state
of the pages.

amdgpu is simple to convert, it doesn't use snapshot and doesn't use
per-page flags.

nouveau uses only 16 hmm_pte entries at most (ie fits in a few cache
lines), and it sweeps over its pfns array a couple of times anyhow.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/vm/hmm.rst                |  26 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  35 ++----
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  60 +++++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.h  |   4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  52 ++++----
 include/linux/hmm.h                     |  99 ++++++---------
 mm/hmm.c                                | 160 +++++++++++-------------
 7 files changed, 204 insertions(+), 232 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 9924f2caa0184c..73a9b8c858e5d9 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -185,9 +185,6 @@ The usage pattern is::
       range.start = ...;
       range.end = ...;
       range.pfns = ...;
-      range.flags = ...;
-      range.values = ...;
-      range.pfn_shift = ...;
 
       if (!mmget_not_zero(interval_sub->notifier.mm))
           return -EFAULT;
@@ -229,15 +226,10 @@ The hmm_range struct has 2 fields, default_flags and pfn_flags_mask, that specif
 fault or snapshot policy for the whole range instead of having to set them
 for each entry in the pfns array.
 
-For instance, if the device flags for range.flags are::
+For instance if the device driver wants pages for a range with at least read
+permission, it sets::
 
-    range.flags[HMM_PFN_VALID] = (1 << 63);
-    range.flags[HMM_PFN_WRITE] = (1 << 62);
-
-and the device driver wants pages for a range with at least read permission,
-it sets::
-
-    range->default_flags = (1 << 63);
+    range->default_flags = HMM_PFN_REQ_VALID;
     range->pfn_flags_mask = 0;
 
 and calls hmm_range_fault() as described above. This will fill fault all pages
@@ -246,18 +238,18 @@ in the range with at least read permission.
 Now let's say the driver wants to do the same except for one page in the range for
 which it wants to have write permission. Now driver set::
 
-    range->default_flags = (1 << 63);
-    range->pfn_flags_mask = (1 << 62);
-    range->pfns[index_of_write] = (1 << 62);
+    range->default_flags = HMM_PFN_REQ_VALID;
+    range->pfn_flags_mask = HMM_PFN_REQ_WRITE;
+    range->pfns[index_of_write] = HMM_PFN_REQ_WRITE;
 
 With this, HMM will fault in all pages with at least read (i.e., valid) and for the
 address == range->start + (index_of_write << PAGE_SHIFT) it will fault with
 write permission i.e., if the CPU pte does not have write permission set then HMM
 will call handle_mm_fault().
 
-Note that HMM will populate the pfns array with write permission for any page
-that is mapped with CPU write permission no matter what values are set
-in default_flags or pfn_flags_mask.
+After hmm_range_fault completes the flag bits are set to the current state of
+the page tables, ie HMM_PFN_VALID | HMM_PFN_WRITE will be set if the page is
+writable.
 
 
 Represent and manage device memory from core kernel point of view
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 449083f9f8a2bf..bcfa8c26647d5e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -766,17 +766,6 @@ struct amdgpu_ttm_tt {
 };
 
 #ifdef CONFIG_DRM_AMDGPU_USERPTR
-/* flags used by HMM internal, not related to CPU/GPU PTE flags */
-static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
-	(1 << 0), /* HMM_PFN_VALID */
-	(1 << 1), /* HMM_PFN_WRITE */
-};
-
-static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
-	0xfffffffffffffffeUL, /* HMM_PFN_ERROR */
-	0, /* HMM_PFN_NONE */
-};
-
 /**
  * amdgpu_ttm_tt_get_user_pages - get device accessible pages that back user
  * memory and start HMM tracking CPU page table update
@@ -815,18 +804,15 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 		goto out;
 	}
 	range->notifier = &bo->notifier;
-	range->flags = hmm_range_flags;
-	range->values = hmm_range_values;
-	range->pfn_shift = PAGE_SHIFT;
 	range->start = bo->notifier.interval_tree.start;
 	range->end = bo->notifier.interval_tree.last + 1;
-	range->default_flags = hmm_range_flags[HMM_PFN_VALID];
+	range->default_flags = HMM_PFN_REQ_FAULT;
 	if (!amdgpu_ttm_tt_is_readonly(ttm))
-		range->default_flags |= range->flags[HMM_PFN_WRITE];
+		range->default_flags |= HMM_PFN_REQ_WRITE;
 
-	range->pfns = kvmalloc_array(ttm->num_pages, sizeof(*range->pfns),
-				     GFP_KERNEL);
-	if (unlikely(!range->pfns)) {
+	range->hmm_pfns = kvmalloc_array(ttm->num_pages,
+					 sizeof(*range->hmm_pfns), GFP_KERNEL);
+	if (unlikely(!range->hmm_pfns)) {
 		r = -ENOMEM;
 		goto out_free_ranges;
 	}
@@ -867,7 +853,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
 	 */
 	for (i = 0; i < ttm->num_pages; i++)
-		pages[i] = hmm_device_entry_to_page(range, range->pfns[i]);
+		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
 
 	gtt->range = range;
 	mmput(mm);
@@ -877,7 +863,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 out_unlock:
 	up_read(&mm->mmap_sem);
 out_free_pfns:
-	kvfree(range->pfns);
+	kvfree(range->hmm_pfns);
 out_free_ranges:
 	kfree(range);
 out:
@@ -902,7 +888,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 	DRM_DEBUG_DRIVER("user_pages_done 0x%llx pages 0x%lx\n",
 		gtt->userptr, ttm->num_pages);
 
-	WARN_ONCE(!gtt->range || !gtt->range->pfns,
+	WARN_ONCE(!gtt->range || !gtt->range->hmm_pfns,
 		"No user pages to check\n");
 
 	if (gtt->range) {
@@ -912,7 +898,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 		 */
 		r = mmu_interval_read_retry(gtt->range->notifier,
 					 gtt->range->notifier_seq);
-		kvfree(gtt->range->pfns);
+		kvfree(gtt->range->hmm_pfns);
 		kfree(gtt->range);
 		gtt->range = NULL;
 	}
@@ -1003,8 +989,7 @@ static void amdgpu_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
 
 		for (i = 0; i < ttm->num_pages; i++) {
 			if (ttm->pages[i] !=
-				hmm_device_entry_to_page(gtt->range,
-					      gtt->range->pfns[i]))
+			    hmm_pfn_to_page(gtt->range->hmm_pfns[i]))
 				break;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ad89e09a0be39a..07876fb0e1d665 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -672,27 +672,61 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	return ret;
 }
 
-void
-nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
-			 struct hmm_range *range)
+void nouveau_hmm_convert_pfn(struct nouveau_drm *drm, struct hmm_range *range,
+			     u64 *ioctl_addr)
 {
 	unsigned long i, npages;
 
+	/*
+	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
+	 * to an eventual DMA map on some call chain like:
+	 *    nouveau_svm_fault():
+	 *      args.i.m.method = NVIF_VMM_V0_PFNMAP
+	 *      nouveau_range_fault()
+	 *       nvif_object_ioctl()
+	 *        client->driver->ioctl()
+	 *           struct nvif_driver nvif_driver_nvkm:
+	 *             .ioctl = nvkm_client_ioctl
+	 *            nvkm_ioctl()
+	 *             nvkm_ioctl_path()
+	 *               nvkm_ioctl_v0[type].func(..)
+	 *               nvkm_ioctl_mthd()
+	 *                nvkm_object_mthd()
+	 *                   struct nvkm_object_func nvkm_uvmm:
+	 *                     .mthd = nvkm_uvmm_mthd
+	 *                    nvkm_uvmm_mthd()
+	 *                     nvkm_uvmm_mthd_pfnmap()
+	 *                      nvkm_vmm_pfn_map()
+	 *                       nvkm_vmm_ptes_get_map()
+	 *                        func == gp100_vmm_pgt_pfn
+	 *                         struct nvkm_vmm_desc_func gp100_vmm_desc_spt:
+	 *                           .pfn = gp100_vmm_pgt_pfn
+	 *                          nvkm_vmm_iter()
+	 *                           REF_PTES == func == gp100_vmm_pgt_pfn()
+	 *			      dma_map_page()
+	 *
+	 * This is all just encoding the internal hmm reprensetation into a
+	 * different nouveau internal representation.
+	 */
 	npages = (range->end - range->start) >> PAGE_SHIFT;
 	for (i = 0; i < npages; ++i) {
 		struct page *page;
-		uint64_t addr;
 
-		page = hmm_device_entry_to_page(range, range->pfns[i]);
-		if (page == NULL)
-			continue;
-
-		if (!is_device_private_page(page))
+		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
+			ioctl_addr[i] = 0;
 			continue;
+		}
 
-		addr = nouveau_dmem_page_addr(page);
-		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
-		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
-		range->pfns[i] |= NVIF_VMM_PFNMAP_V0_VRAM;
+		page = hmm_pfn_to_page(range->hmm_pfns[i]);
+		if (is_device_private_page(page))
+			ioctl_addr[i] = nouveau_dmem_page_addr(page) |
+					NVIF_VMM_PFNMAP_V0_V |
+					NVIF_VMM_PFNMAP_V0_VRAM;
+		else
+			ioctl_addr[i] = page_to_phys(page) |
+					NVIF_VMM_PFNMAP_V0_V |
+					NVIF_VMM_PFNMAP_V0_HOST;
+		if (range->hmm_pfns[i] & HMM_PFN_WRITE)
+			ioctl_addr[i] |= NVIF_VMM_PFNMAP_V0_W;
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
index 92394be5d64923..4607c0be7dd062 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
@@ -38,8 +38,8 @@ int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			     unsigned long start,
 			     unsigned long end);
 
-void nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
-			      struct hmm_range *range);
+void nouveau_hmm_convert_pfn(struct nouveau_drm *drm, struct hmm_range *range,
+			     u64 *ioctl_addr);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
 static inline void nouveau_dmem_fini(struct nouveau_drm *drm) {}
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index cf0d9bd61bebf9..d1059bce091192 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -369,18 +369,6 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static const u64
-nouveau_svm_pfn_flags[HMM_PFN_FLAG_MAX] = {
-	[HMM_PFN_VALID         ] = NVIF_VMM_PFNMAP_V0_V,
-	[HMM_PFN_WRITE         ] = NVIF_VMM_PFNMAP_V0_W,
-};
-
-static const u64
-nouveau_svm_pfn_values[HMM_PFN_VALUE_MAX] = {
-	[HMM_PFN_ERROR  ] = ~NVIF_VMM_PFNMAP_V0_V,
-	[HMM_PFN_NONE   ] =  NVIF_VMM_PFNMAP_V0_NONE,
-};
-
 /* Issue fault replay for GPU to retry accesses that faulted previously. */
 static void
 nouveau_svm_fault_replay(struct nouveau_svm *svm)
@@ -520,7 +508,8 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
 
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       struct nouveau_drm *drm, void *data, u32 size,
-			       u64 *pfns, struct svm_notifier *notifier)
+			       unsigned long hmm_pfns[], u64 *ioctl_addr,
+			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
@@ -529,10 +518,8 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		.notifier = &notifier->notifier,
 		.start = notifier->notifier.interval_tree.start,
 		.end = notifier->notifier.interval_tree.last + 1,
-		.pfns = pfns,
-		.flags = nouveau_svm_pfn_flags,
-		.values = nouveau_svm_pfn_values,
-		.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT,
+		.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
+		.hmm_pfns = hmm_pfns,
 	};
 	struct mm_struct *mm = notifier->notifier.mm;
 	int ret;
@@ -542,12 +529,15 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			return -EBUSY;
 
 		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		range.default_flags = 0;
-		range.pfn_flags_mask = -1UL;
 		down_read(&mm->mmap_sem);
 		ret = hmm_range_fault(&range);
 		up_read(&mm->mmap_sem);
 		if (ret) {
+			/*
+			 * FIXME: the input PFN_REQ flags are destroyed on
+			 * -EBUSY, we need to regenerate them, also for the
+			 * other continue below
+			 */
 			if (ret == -EBUSY)
 				continue;
 			return ret;
@@ -562,7 +552,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		break;
 	}
 
-	nouveau_dmem_convert_pfn(drm, &range);
+	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
 
 	svmm->vmm->vmm.object.client->super = true;
 	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
@@ -589,6 +579,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		} i;
 		u64 phys[16];
 	} args;
+	unsigned long hmm_pfns[ARRAY_SIZE(args.phys)];
 	struct vm_area_struct *vma;
 	u64 inst, start, limit;
 	int fi, fn, pi, fill;
@@ -704,12 +695,17 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			 * access flags.
 			 *XXX: atomic?
 			 */
-			if (buffer->fault[fn]->access != 0 /* READ. */ &&
-			    buffer->fault[fn]->access != 3 /* PREFETCH. */) {
-				args.phys[pi++] = NVIF_VMM_PFNMAP_V0_V |
-						  NVIF_VMM_PFNMAP_V0_W;
-			} else {
-				args.phys[pi++] = NVIF_VMM_PFNMAP_V0_V;
+			switch (buffer->fault[fn]->access) {
+			case 0: /* READ. */
+				hmm_pfns[pi++] = HMM_PFN_REQ_FAULT;
+				break;
+			case 3: /* PREFETCH. */
+				hmm_pfns[pi++] = 0;
+				break;
+			default:
+				hmm_pfns[pi++] = HMM_PFN_REQ_FAULT |
+						 HMM_PFN_REQ_WRITE;
+				break;
 			}
 			args.i.p.size = pi << PAGE_SHIFT;
 
@@ -737,7 +733,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			fill = (buffer->fault[fn    ]->addr -
 				buffer->fault[fn - 1]->addr) >> PAGE_SHIFT;
 			while (--fill)
-				args.phys[pi++] = NVIF_VMM_PFNMAP_V0_NONE;
+				hmm_pfns[pi++] = 0;
 		}
 
 		SVMM_DBG(svmm, "wndw %016llx-%016llx covering %d fault(s)",
@@ -753,7 +749,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			ret = nouveau_range_fault(
 				svmm, svm->drm, &args,
 				sizeof(args.i) + pi * sizeof(args.phys[0]),
-				args.phys, &notifier);
+				hmm_pfns, args.phys, &notifier);
 			mmu_interval_notifier_remove(&notifier.notifier);
 		}
 		mmput(mm);
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 81c302c884c0e3..e72529786f16f8 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -19,45 +19,45 @@
 #include <linux/mmu_notifier.h>
 
 /*
- * hmm_pfn_flag_e - HMM flag enums
+ * On output:
+ * 0             - The page is faultable and a future call with 
+ *                 HMM_PFN_REQ_FAULT could succeed.
+ * HMM_PFN_VALID - the pfn field points to a valid PFN. This PFN is at
+ *                 least readable. If dev_private_owner is !NULL then this could
+ *                 point at a DEVICE_PRIVATE page.
+ * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
+ * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
+ *                 fail. ie poisoned memory, special pages, no vma, etc
  *
- * Flags:
- * HMM_PFN_VALID: pfn is valid. It has, at least, read permission.
- * HMM_PFN_WRITE: CPU page table has write permission set
- *
- * The driver provides a flags array for mapping page protections to device
- * PTE bits. If the driver valid bit for an entry is bit 3,
- * i.e., (entry & (1 << 3)), then the driver must provide
- * an array in hmm_range.flags with hmm_range.flags[HMM_PFN_VALID] == 1 << 3.
- * Same logic apply to all flags. This is the same idea as vm_page_prot in vma
- * except that this is per device driver rather than per architecture.
+ * On input:
+ * 0                 - Return the current state of the page, do not fault it.
+ * HMM_PFN_REQ_FAULT - The output must have HMM_PFN_VALID or hmm_range_fault()
+ *                     will fail
+ * HMM_PFN_REQ_WRITE - The output must have HMM_PFN_WRITE or hmm_range_fault()
+ *                     will fail. Must be combined with HMM_PFN_REQ_FAULT.
  */
-enum hmm_pfn_flag_e {
-	HMM_PFN_VALID = 0,
-	HMM_PFN_WRITE,
-	HMM_PFN_FLAG_MAX
+enum hmm_pfn_flags {
+	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
+	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
+	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+
+	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
+	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
+
+	HMM_PFN_FLAGS = HMM_PFN_VALID | HMM_PFN_WRITE | HMM_PFN_ERROR,
 };
 
 /*
- * hmm_pfn_value_e - HMM pfn special value
- *
- * Flags:
- * HMM_PFN_ERROR: corresponding CPU page table entry points to poisoned memory
- * HMM_PFN_NONE: corresponding CPU page table entry is pte_none()
+ * hmm_pfn_to_page() - return struct page pointed to by a device entry
  *
- * Driver provides values for none entry, error entry, and special entry.
- * Driver can alias (i.e., use same value) error and special, but
- * it should not alias none with error or special.
- *
- * HMM pfn value returned by hmm_vma_get_pfns() or hmm_vma_fault() will be:
- * hmm_range.values[HMM_PFN_ERROR] if CPU page table entry is poisonous,
- * hmm_range.values[HMM_PFN_NONE] if there is no CPU page table entry,
+ * This must be called under the caller 'user_lock' after a successful
+ * mmu_interval_read_begin(). The caller must have tested for HMM_PFN_VALID
+ * already.
  */
-enum hmm_pfn_value_e {
-	HMM_PFN_ERROR,
-	HMM_PFN_NONE,
-	HMM_PFN_VALUE_MAX
-};
+static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
+{
+	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
+}
 
 /*
  * struct hmm_range - track invalidation lock on virtual address range
@@ -66,12 +66,9 @@ enum hmm_pfn_value_e {
  * @notifier_seq: result of mmu_interval_read_begin()
  * @start: range virtual start address (inclusive)
  * @end: range virtual end address (exclusive)
- * @pfns: array of pfns (big enough for the range)
- * @flags: pfn flags to match device driver page table
- * @values: pfn value for some special case (none, special, error, ...)
+ * @hmm_pfns: array of pfns (big enough for the range)
  * @default_flags: default flags for the range (write, read, ... see hmm doc)
  * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
- * @pfn_shift: pfn shift value (should be <= PAGE_SHIFT)
  * @dev_private_owner: owner of device private pages
  */
 struct hmm_range {
@@ -79,36 +76,12 @@ struct hmm_range {
 	unsigned long		notifier_seq;
 	unsigned long		start;
 	unsigned long		end;
-	uint64_t		*pfns;
-	const uint64_t		*flags;
-	const uint64_t		*values;
-	uint64_t		default_flags;
-	uint64_t		pfn_flags_mask;
-	uint8_t			pfn_shift;
+	unsigned long		*hmm_pfns;
+	unsigned long		default_flags;
+	unsigned long		pfn_flags_mask;
 	void			*dev_private_owner;
 };
 
-/*
- * hmm_device_entry_to_page() - return struct page pointed to by a device entry
- * @range: range use to decode device entry value
- * @entry: device entry value to get corresponding struct page from
- * Return: struct page pointer if entry is a valid, NULL otherwise
- *
- * If the device entry is valid (ie valid flag set) then return the struct page
- * matching the entry value. Otherwise return NULL.
- */
-static inline struct page *hmm_device_entry_to_page(const struct hmm_range *range,
-						    uint64_t entry)
-{
-	if (entry == range->values[HMM_PFN_NONE])
-		return NULL;
-	if (entry == range->values[HMM_PFN_ERROR])
-		return NULL;
-	if (!(entry & range->flags[HMM_PFN_VALID]))
-		return NULL;
-	return pfn_to_page(entry >> range->pfn_shift);
-}
-
 /*
  * Please see Documentation/vm/hmm.rst for how to use the range API.
  */
diff --git a/mm/hmm.c b/mm/hmm.c
index 2693393dc14b30..c1c96d4cc0554c 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -37,28 +37,13 @@ enum {
 	HMM_NEED_ALL_BITS = HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT,
 };
 
-/*
- * hmm_device_entry_from_pfn() - create a valid device entry value from pfn
- * @range: range use to encode HMM pfn value
- * @pfn: pfn value for which to create the device entry
- * Return: valid device entry for the pfn
- */
-static uint64_t hmm_device_entry_from_pfn(const struct hmm_range *range,
-					  unsigned long pfn)
-{
-	return (pfn << range->pfn_shift) | range->flags[HMM_PFN_VALID];
-}
-
 static int hmm_pfns_fill(unsigned long addr, unsigned long end,
-		struct hmm_range *range, enum hmm_pfn_value_e value)
+			 struct hmm_range *range, unsigned long cpu_flags)
 {
-	uint64_t *pfns = range->pfns;
-	unsigned long i;
+	unsigned long i = (addr - range->start) >> PAGE_SHIFT;
 
-	i = (addr - range->start) >> PAGE_SHIFT;
 	for (; addr < end; addr += PAGE_SIZE, i++)
-		pfns[i] = range->values[value];
-
+		range->hmm_pfns[i] = cpu_flags;
 	return 0;
 }
 
@@ -96,7 +81,8 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 }
 
 static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
-				       uint64_t pfns, uint64_t cpu_flags)
+				       unsigned long pfn_req_flags,
+				       unsigned long cpu_flags)
 {
 	struct hmm_range *range = hmm_vma_walk->range;
 
@@ -110,27 +96,28 @@ static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 	 * waste to have the user pre-fill the pfn arrays with a default
 	 * flags value.
 	 */
-	pfns = (pfns & range->pfn_flags_mask) | range->default_flags;
+	pfn_req_flags &= range->pfn_flags_mask;
+	pfn_req_flags |= range->default_flags;
 
 	/* We aren't ask to do anything ... */
-	if (!(pfns & range->flags[HMM_PFN_VALID]))
+	if (!(pfn_req_flags & HMM_PFN_REQ_FAULT))
 		return 0;
 
 	/* Need to write fault ? */
-	if ((pfns & range->flags[HMM_PFN_WRITE]) &&
-	    !(cpu_flags & range->flags[HMM_PFN_WRITE]))
+	if ((pfn_req_flags & HMM_PFN_REQ_WRITE) &&
+	    !(cpu_flags & HMM_PFN_WRITE))
 		return HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT;
 
 	/* If CPU page table is not valid then we need to fault */
-	if (!(cpu_flags & range->flags[HMM_PFN_VALID]))
+	if (!(cpu_flags & HMM_PFN_VALID))
 		return HMM_NEED_FAULT;
 	return 0;
 }
 
 static unsigned int
 hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
-		     const uint64_t *pfns, unsigned long npages,
-		     uint64_t cpu_flags)
+		     const unsigned long hmm_pfns[], unsigned long npages,
+		     unsigned long cpu_flags)
 {
 	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned int required_fault = 0;
@@ -142,12 +129,12 @@ hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 	 * hmm_pte_need_fault() will always return 0.
 	 */
 	if (!((range->default_flags | range->pfn_flags_mask) &
-	      range->flags[HMM_PFN_VALID]))
+	      HMM_PFN_REQ_FAULT))
 		return 0;
 
 	for (i = 0; i < npages; ++i) {
-		required_fault |=
-			hmm_pte_need_fault(hmm_vma_walk, pfns[i], cpu_flags);
+		required_fault |= hmm_pte_need_fault(hmm_vma_walk, hmm_pfns[i],
+						     cpu_flags);
 		if (required_fault == HMM_NEED_ALL_BITS)
 			return required_fault;
 	}
@@ -161,12 +148,13 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned int required_fault;
 	unsigned long i, npages;
-	uint64_t *pfns;
+	unsigned long *hmm_pfns;
 
 	i = (addr - range->start) >> PAGE_SHIFT;
 	npages = (end - addr) >> PAGE_SHIFT;
-	pfns = &range->pfns[i];
-	required_fault = hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0);
+	hmm_pfns = &range->hmm_pfns[i];
+	required_fault =
+		hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0);
 	if (!walk->vma) {
 		if (required_fault)
 			return -EFAULT;
@@ -174,44 +162,44 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 	}
 	if (required_fault)
 		return hmm_vma_fault(addr, end, required_fault, walk);
-	return hmm_pfns_fill(addr, end, range, HMM_PFN_NONE);
+	return hmm_pfns_fill(addr, end, range, 0);
 }
 
-static inline uint64_t pmd_to_hmm_pfn_flags(struct hmm_range *range, pmd_t pmd)
+static inline unsigned long pmd_to_hmm_pfn_flags(struct hmm_range *range,
+						 pmd_t pmd)
 {
 	if (pmd_protnone(pmd))
 		return 0;
-	return pmd_write(pmd) ? range->flags[HMM_PFN_VALID] |
-				range->flags[HMM_PFN_WRITE] :
-				range->flags[HMM_PFN_VALID];
+	return pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
-		unsigned long end, uint64_t *pfns, pmd_t pmd)
+			      unsigned long end, unsigned long hmm_pfns[],
+			      pmd_t pmd)
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned long pfn, npages, i;
 	unsigned int required_fault;
-	uint64_t cpu_flags;
+	unsigned long cpu_flags;
 
 	npages = (end - addr) >> PAGE_SHIFT;
 	cpu_flags = pmd_to_hmm_pfn_flags(range, pmd);
 	required_fault =
-		hmm_range_need_fault(hmm_vma_walk, pfns, npages, cpu_flags);
+		hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, cpu_flags);
 	if (required_fault)
 		return hmm_vma_fault(addr, end, required_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++)
-		pfns[i] = hmm_device_entry_from_pfn(range, pfn) | cpu_flags;
+		hmm_pfns[i] = pfn | cpu_flags;
 	return 0;
 }
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
 /* stub to allow the code below to compile */
 int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
-		unsigned long end, uint64_t *pfns, pmd_t pmd);
+		unsigned long end, unsigned long hmm_pfns[], pmd_t pmd);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 static inline bool hmm_is_device_private_entry(struct hmm_range *range,
@@ -222,31 +210,31 @@ static inline bool hmm_is_device_private_entry(struct hmm_range *range,
 		range->dev_private_owner;
 }
 
-static inline uint64_t pte_to_hmm_pfn_flags(struct hmm_range *range, pte_t pte)
+static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
+						 pte_t pte)
 {
 	if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
 		return 0;
-	return pte_write(pte) ? range->flags[HMM_PFN_VALID] |
-				range->flags[HMM_PFN_WRITE] :
-				range->flags[HMM_PFN_VALID];
+	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
 static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
-			      uint64_t *pfn)
+			      unsigned long *hmm_pfn)
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned int required_fault;
-	uint64_t cpu_flags;
+	unsigned long cpu_flags;
 	pte_t pte = *ptep;
-	uint64_t orig_pfn = *pfn;
+	uint64_t pfn_req_flags = *hmm_pfn;
 
 	if (pte_none(pte)) {
-		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
+		required_fault =
+			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
 		if (required_fault)
 			goto fault;
-		*pfn = range->values[HMM_PFN_NONE];
+		*hmm_pfn = 0;
 		return 0;
 	}
 
@@ -258,17 +246,18 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 * the PFN even if not present.
 		 */
 		if (hmm_is_device_private_entry(range, entry)) {
-			*pfn = hmm_device_entry_from_pfn(range,
-				device_private_entry_to_pfn(entry));
-			*pfn |= range->flags[HMM_PFN_VALID];
+			cpu_flags = HMM_PFN_VALID;
 			if (is_write_device_private_entry(entry))
-				*pfn |= range->flags[HMM_PFN_WRITE];
+				cpu_flags |= HMM_PFN_WRITE;
+			*hmm_pfn = device_private_entry_to_pfn(entry) |
+					cpu_flags;
 			return 0;
 		}
 
-		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
+		required_fault =
+			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
 		if (!required_fault) {
-			*pfn = range->values[HMM_PFN_NONE];
+			*hmm_pfn = 0;
 			return 0;
 		}
 
@@ -288,7 +277,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	}
 
 	cpu_flags = pte_to_hmm_pfn_flags(range, pte);
-	required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags);
+	required_fault =
+		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
 	if (required_fault)
 		goto fault;
 
@@ -297,15 +287,15 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	 * fall through and treat it like a normal page.
 	 */
 	if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
-		if (hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0)) {
+		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
 			pte_unmap(ptep);
 			return -EFAULT;
 		}
-		*pfn = range->values[HMM_PFN_ERROR];
+		*hmm_pfn = HMM_PFN_ERROR;
 		return 0;
 	}
 
-	*pfn = hmm_device_entry_from_pfn(range, pte_pfn(pte)) | cpu_flags;
+	*hmm_pfn = pte_pfn(pte) | cpu_flags;
 	return 0;
 
 fault:
@@ -321,7 +311,8 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
-	uint64_t *pfns = &range->pfns[(start - range->start) >> PAGE_SHIFT];
+	unsigned long *hmm_pfns =
+		&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
 	unsigned long addr = start;
 	pte_t *ptep;
@@ -333,16 +324,16 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		return hmm_vma_walk_hole(start, end, -1, walk);
 
 	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
-		if (hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0)) {
+		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
 			hmm_vma_walk->last = addr;
 			pmd_migration_entry_wait(walk->mm, pmdp);
 			return -EBUSY;
 		}
-		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
+		return hmm_pfns_fill(start, end, range, 0);
 	}
 
 	if (!pmd_present(pmd)) {
-		if (hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0))
+		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
 			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 	}
@@ -362,7 +353,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
 			goto again;
 
-		return hmm_vma_handle_pmd(walk, addr, end, pfns, pmd);
+		return hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
 	}
 
 	/*
@@ -372,16 +363,16 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 	 * recover.
 	 */
 	if (pmd_bad(pmd)) {
-		if (hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0))
+		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
 			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 	}
 
 	ptep = pte_offset_map(pmdp, addr);
-	for (; addr < end; addr += PAGE_SIZE, ptep++, pfns++) {
+	for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
 		int r;
 
-		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, pfns);
+		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
 		if (r) {
 			/* hmm_vma_handle_pte() did pte_unmap() */
 			return r;
@@ -393,13 +384,12 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
 #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && \
     defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-static inline uint64_t pud_to_hmm_pfn_flags(struct hmm_range *range, pud_t pud)
+static inline unsigned long pud_to_hmm_pfn_flags(struct hmm_range *range,
+						 pud_t pud)
 {
 	if (!pud_present(pud))
 		return 0;
-	return pud_write(pud) ? range->flags[HMM_PFN_VALID] |
-				range->flags[HMM_PFN_WRITE] :
-				range->flags[HMM_PFN_VALID];
+	return pud_write(pud) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
 static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
@@ -427,7 +417,8 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	if (pud_huge(pud) && pud_devmap(pud)) {
 		unsigned long i, npages, pfn;
 		unsigned int required_fault;
-		uint64_t *pfns, cpu_flags;
+		unsigned long *hmm_pfns;
+		unsigned long cpu_flags;
 
 		if (!pud_present(pud)) {
 			spin_unlock(ptl);
@@ -436,10 +427,10 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 
 		i = (addr - range->start) >> PAGE_SHIFT;
 		npages = (end - addr) >> PAGE_SHIFT;
-		pfns = &range->pfns[i];
+		hmm_pfns = &range->hmm_pfns[i];
 
 		cpu_flags = pud_to_hmm_pfn_flags(range, pud);
-		required_fault = hmm_range_need_fault(hmm_vma_walk, pfns,
+		required_fault = hmm_range_need_fault(hmm_vma_walk, hmm_pfns,
 						      npages, cpu_flags);
 		if (required_fault) {
 			spin_unlock(ptl);
@@ -448,8 +439,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
 		for (i = 0; i < npages; ++i, ++pfn)
-			pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
-				  cpu_flags;
+			hmm_pfns[i] = pfn | cpu_flags;
 		goto out_unlock;
 	}
 
@@ -473,8 +463,9 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
 	struct vm_area_struct *vma = walk->vma;
-	uint64_t orig_pfn, cpu_flags;
 	unsigned int required_fault;
+	unsigned long pfn_req_flags;
+	unsigned long cpu_flags;
 	spinlock_t *ptl;
 	pte_t entry;
 
@@ -482,9 +473,10 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	entry = huge_ptep_get(pte);
 
 	i = (start - range->start) >> PAGE_SHIFT;
-	orig_pfn = range->pfns[i];
+	pfn_req_flags = range->hmm_pfns[i];
 	cpu_flags = pte_to_hmm_pfn_flags(range, entry);
-	required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags);
+	required_fault =
+		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
 	if (required_fault) {
 		spin_unlock(ptl);
 		return hmm_vma_fault(addr, end, required_fault, walk);
@@ -492,8 +484,8 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 
 	pfn = pte_pfn(entry) + ((start & ~hmask) >> PAGE_SHIFT);
 	for (; addr < end; addr += PAGE_SIZE, i++, pfn++)
-		range->pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
-				 cpu_flags;
+		range->hmm_pfns[i] = pfn | cpu_flags;
+
 	spin_unlock(ptl);
 	return 0;
 }
@@ -524,7 +516,7 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	 * failure.
 	 */
 	if (hmm_range_need_fault(hmm_vma_walk,
-				 range->pfns +
+				 range->hmm_pfns +
 					 ((start - range->start) >> PAGE_SHIFT),
 				 (end - start) >> PAGE_SHIFT, 0))
 		return -EFAULT;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
