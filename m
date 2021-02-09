Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99D314A0E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922DF6EB4A;
	Tue,  9 Feb 2021 07:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC786EA77;
 Tue,  9 Feb 2021 01:14:51 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0dd0000>; Mon, 08 Feb 2021 17:09:49 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:49 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:48 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 9/9] nouveau/svm: Implement atomic SVM access
Date: Tue, 9 Feb 2021 12:07:22 +1100
Message-ID: <20210209010722.13839-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832989; bh=Whkjwci3XuSPfP2PeMnAPMBOZ5w0/Q9OPh0Whknn010=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=hfFiA37vIHZ+oJYL+GYK4isP1fNlLzCchq/VL0lJOccXOty2fLKNLTUtLSmsRcByd
 j79RfYaij6YxftB1pww87D3T8Y0tRZJKHUJtxn4MWSWzrFpFL2MaqYOL444gFsD/MR
 4Or1WN9OB06PKUzt0joWDvqLstHQu5KFDEy1MBMbY2duKZz0rLpft+gHcL6m3t98tP
 0UDOv+CttC9jFWUV3ciUYUQehOXfeCUTX9OpKgngswDfgXtvDJJVo3ZYan9anycQ0q
 HClA2Q0FC/Gzmm+gantURF45MKBdn8KBf9zfBY6bFF4NCwNikhum8uNfNfaI8HpyFd
 yowDhLANzR+lA==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some NVIDIA GPUs do not support direct atomic access to system memory
via PCIe. Instead this must be emulated by granting the GPU exclusive
access to the memory. This is achieved by migrating the userspace
mappings to device private pages whilst leaving the actual page in
place.

The driver then grants the GPU permission to update the page undergoing
atomic access via the GPU page tables. When CPU access to the page is
required a CPU fault is raised which calls into the device driver via
migrate_to_ram() to remap the page into the CPU page tables and revoke
GPU access.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c        | 148 ++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.h        |   4 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 116 ++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 6 files changed, 249 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index d6dd40f21eed..9c7ff56831c5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -77,6 +77,7 @@ struct nvif_vmm_pfnmap_v0 {
 #define NVIF_VMM_PFNMAP_V0_APER                           0x00000000000000f0ULL
 #define NVIF_VMM_PFNMAP_V0_HOST                           0x0000000000000000ULL
 #define NVIF_VMM_PFNMAP_V0_VRAM                           0x0000000000000010ULL
+#define NVIF_VMM_PFNMAP_V0_A				  0x0000000000000004ULL
 #define NVIF_VMM_PFNMAP_V0_W                              0x0000000000000002ULL
 #define NVIF_VMM_PFNMAP_V0_V                              0x0000000000000001ULL
 #define NVIF_VMM_PFNMAP_V0_NONE                           0x0000000000000000ULL
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 8fb4949f3778..7b103670af56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -69,6 +69,7 @@ struct nouveau_dmem_chunk {
 	unsigned long callocated;
 	enum nouveau_dmem_type type;
 	struct dev_pagemap pagemap;
+	struct page **atomic_pages;
 };
 
 struct nouveau_dmem_migrate {
@@ -107,12 +108,51 @@ unsigned long nouveau_dmem_page_addr(struct page *page)
 	return chunk->bo->offset + off;
 }
 
+static struct page *nouveau_dpage_to_atomic(struct page *dpage)
+{
+	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(dpage);
+	int index;
+
+	if (WARN_ON_ONCE(chunk->type != NOUVEAU_ATOMIC))
+		return NULL;
+
+	index = page_to_pfn(dpage) - (chunk->pagemap.range.start >> PAGE_SHIFT);
+
+	if (WARN_ON_ONCE(index > DMEM_CHUNK_NPAGES))
+		return NULL;
+
+	return chunk->atomic_pages[index];
+}
+
+void nouveau_dmem_set_atomic(struct page *dpage, struct page *atomic_page)
+{
+	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(dpage);
+	int index;
+
+	if (WARN_ON_ONCE(chunk->type != NOUVEAU_ATOMIC))
+		return;
+
+	index = page_to_pfn(dpage) - (chunk->pagemap.range.start >> PAGE_SHIFT);
+
+	if (WARN_ON_ONCE(index > DMEM_CHUNK_NPAGES))
+		return;
+
+	chunk->atomic_pages[index] = atomic_page;
+}
+
 static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
 	spin_lock(&dmem->lock);
+	if (chunk->type == NOUVEAU_ATOMIC) {
+		struct page *atomic_page;
+
+		atomic_page = nouveau_dpage_to_atomic(page);
+		if (atomic_page)
+			unpin_user_page(atomic_page);
+	}
 	page->zone_device_data = dmem->free_pages[chunk->type];
 	dmem->free_pages[chunk->type] = page;
 
@@ -125,6 +165,65 @@ static void nouveau_dmem_page_free(struct page *page)
 	spin_unlock(&dmem->lock);
 }
 
+static vm_fault_t nouveau_atomic_page_migrate(struct vm_fault *vmf)
+{
+	struct nouveau_drm *drm = page_to_drm(vmf->page);
+	struct page *dpage = vmf->page;
+	struct nouveau_svmm *svmm = dpage->zone_device_data;
+	struct migrate_vma args;
+	unsigned long src_pfn = 0, dst_pfn = 0;
+	struct page *src_page, *old_page;
+	int retry;
+	int ret = 0;
+
+	args.vma = vmf->vma;
+	args.src = &src_pfn;
+	args.dst = &dst_pfn;
+	args.start = vmf->address;
+	args.end = vmf->address + PAGE_SIZE;
+	args.pgmap_owner = drm->dev;
+	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+
+	for (retry = 0; retry < 10; retry++) {
+		ret = migrate_vma_setup(&args);
+		if (ret) {
+			ret = VM_FAULT_SIGBUS;
+			goto out;
+		}
+
+		if (src_pfn & MIGRATE_PFN_MIGRATE)
+			break;
+
+		cond_resched();
+	}
+
+	src_page = migrate_pfn_to_page(src_pfn);
+	old_page = nouveau_dpage_to_atomic(dpage);
+
+	/*
+	 * If we can't get a lock on the atomic page it means another thread is
+	 * racing or migrating so retry the fault.
+	 */
+	if (src_page && trylock_page(old_page))
+		dst_pfn = migrate_pfn(page_to_pfn(old_page)) |
+					MIGRATE_PFN_LOCKED | MIGRATE_PFN_UNPIN;
+	else
+		ret = VM_FAULT_RETRY;
+
+	migrate_vma_pages(&args);
+	if (src_pfn & MIGRATE_PFN_MIGRATE) {
+		nouveau_svmm_invalidate(svmm, args.start, args.end);
+		nouveau_dmem_set_atomic(dpage, NULL);
+	}
+	migrate_vma_finalize(&args);
+
+out:
+	if (ret == VM_FAULT_RETRY)
+		mmap_read_unlock(vmf->vma->vm_mm);
+
+	return ret;
+}
+
 static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 {
 	if (fence) {
@@ -224,6 +323,11 @@ static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
 };
 
+static const struct dev_pagemap_ops nouveau_atomic_pagemap_ops = {
+	.page_free = nouveau_dmem_page_free,
+	.migrate_to_ram = nouveau_atomic_page_migrate,
+};
+
 static int
 nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 	enum nouveau_dmem_type type)
@@ -255,18 +359,30 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 	chunk->pagemap.range.start = res->start;
 	chunk->pagemap.range.end = res->end;
 	chunk->pagemap.nr_range = 1;
-	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
+	if (type == NOUVEAU_DMEM)
+		chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
+	else
+		chunk->pagemap.ops = &nouveau_atomic_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
-	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
-			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
-			     &chunk->bo);
-	if (ret)
-		goto out_release;
+	if (type == NOUVEAU_DMEM) {
+		ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
+				NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
+				&chunk->bo);
+		if (ret)
+			goto out_release;
 
-	ret = nouveau_bo_pin(chunk->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-	if (ret)
-		goto out_bo_free;
+		ret = nouveau_bo_pin(chunk->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
+		if (ret)
+			goto out_bo_free;
+	} else {
+		chunk->atomic_pages = kcalloc(DMEM_CHUNK_NPAGES,
+						sizeof(void *), GFP_KERNEL);
+		if (!chunk->atomic_pages) {
+			ret = -ENOMEM;
+			goto out_release;
+		}
+	}
 
 	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
 	if (IS_ERR(ptr)) {
@@ -289,8 +405,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of device %smemory\n",
+		DMEM_CHUNK_SIZE >> 20, type == NOUVEAU_ATOMIC ? "atomic " : "");
 
 	return 0;
 
@@ -306,7 +422,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 	return ret;
 }
 
-static struct page *
+struct page *
 nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, enum nouveau_dmem_type type)
 {
 	struct nouveau_dmem_chunk *chunk;
@@ -382,8 +498,12 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 	mutex_lock(&drm->dmem->mutex);
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
-		nouveau_bo_unpin(chunk->bo);
-		nouveau_bo_ref(NULL, &chunk->bo);
+		if (chunk->type == NOUVEAU_DMEM) {
+			nouveau_bo_unpin(chunk->bo);
+			nouveau_bo_ref(NULL, &chunk->bo);
+		} else {
+			kfree(chunk->atomic_pages);
+		}
 		list_del(&chunk->list);
 		memunmap_pages(&chunk->pagemap);
 		release_mem_region(chunk->pagemap.range.start,
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
index 02e261c4acf1..6b52a7a8dea4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
@@ -30,6 +30,7 @@ struct hmm_range;
 
 enum nouveau_dmem_type {
 	NOUVEAU_DMEM,
+	NOUVEAU_ATOMIC,
 	NOUVEAU_DMEM_NTYPES, /* Number of types, must be last */
 };
 
@@ -45,6 +46,9 @@ int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			     unsigned long start,
 			     unsigned long end);
 unsigned long nouveau_dmem_page_addr(struct page *page);
+struct page *nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm,
+					enum nouveau_dmem_type type);
+void nouveau_dmem_set_atomic(struct page *dpage, struct page *atomic_page);
 
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 63332387402e..e571c6907bfd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -35,6 +35,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sort.h>
 #include <linux/hmm.h>
+#include <linux/idr.h>
 
 struct nouveau_svm {
 	struct nouveau_drm *drm;
@@ -421,9 +422,9 @@ nouveau_svm_fault_cmp(const void *a, const void *b)
 		return ret;
 	if ((ret = (s64)fa->addr - fb->addr))
 		return ret;
-	/*XXX: atomic? */
-	return (fa->access == 0 || fa->access == 3) -
-	       (fb->access == 0 || fb->access == 3);
+	/* Atomic access (2) has highest priority */
+	return (-1*(fa->access == 2) + (fa->access == 0 || fa->access == 3)) -
+	       (-1*(fb->access == 2) + (fb->access == 0 || fb->access == 3));
 }
 
 static void
@@ -555,10 +556,86 @@ static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 		args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
+static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
+			       struct nouveau_drm *drm,
+			       struct nouveau_pfnmap_args *args, u32 size,
+			       unsigned long hmm_flags, struct mm_struct *mm)
+{
+	struct page *dpage, *oldpage;
+	struct migrate_vma migrate_args;
+	unsigned long src_pfn = MIGRATE_PFN_PIN, dst_pfn = 0, start = args->p.addr;
+	int ret = 0;
+
+	mmap_read_lock(mm);
+
+	migrate_args.src = &src_pfn;
+	migrate_args.dst = &dst_pfn;
+	migrate_args.start = start;
+	migrate_args.end = migrate_args.start + PAGE_SIZE;
+	migrate_args.pgmap_owner = NULL;
+	migrate_args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+	migrate_args.vma = find_vma_intersection(mm, migrate_args.start, migrate_args.end);
+
+	ret = migrate_vma_setup(&migrate_args);
+
+	if (ret) {
+		SVMM_ERR(svmm, "Unable to setup atomic page migration");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	oldpage = migrate_pfn_to_page(src_pfn);
+
+	if (src_pfn & MIGRATE_PFN_MIGRATE) {
+		dpage = nouveau_dmem_page_alloc_locked(drm, NOUVEAU_ATOMIC);
+		if (!dpage) {
+			SVMM_ERR(svmm, "Unable to allocate atomic page");
+			*migrate_args.dst = 0;
+		} else {
+			nouveau_dmem_set_atomic(dpage, oldpage);
+			dpage->zone_device_data = svmm;
+			*migrate_args.dst = migrate_pfn(page_to_pfn(dpage)) |
+						MIGRATE_PFN_LOCKED;
+		}
+	}
+
+	migrate_vma_pages(&migrate_args);
+
+	/* Map the page on the GPU for successfully migrated mappings. Do this
+	 * before removing the migration PTEs in migrate_vma_finalize() as once
+	 * that happens a CPU thread can race and invalidate the GPU mappings
+	 * prior to mapping them here.
+	 */
+	if (src_pfn & MIGRATE_PFN_MIGRATE) {
+		args->p.page = 12;
+		args->p.size = PAGE_SIZE;
+		args->p.addr = start;
+		args->p.phys[0] = page_to_phys(oldpage) |
+				NVIF_VMM_PFNMAP_V0_V |
+				NVIF_VMM_PFNMAP_V0_A |
+				NVIF_VMM_PFNMAP_V0_HOST;
+
+		if (migrate_args.vma->vm_flags & VM_WRITE)
+			args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
+
+		mutex_lock(&svmm->mutex);
+		svmm->vmm->vmm.object.client->super = true;
+		ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+		svmm->vmm->vmm.object.client->super = false;
+		mutex_unlock(&svmm->mutex);
+	}
+
+	migrate_vma_finalize(&migrate_args);
+
+out:
+	mmap_read_unlock(mm);
+	return ret;
+}
+
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       struct nouveau_drm *drm,
 			       struct nouveau_pfnmap_args *args, u32 size,
-			       unsigned long hmm_flags,
+			       unsigned long hmm_flags, int atomic,
 			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =
@@ -608,12 +685,18 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		break;
 	}
 
-	nouveau_hmm_convert_pfn(drm, &range, args);
+	if (atomic) {
+		mutex_unlock(&svmm->mutex);
+		ret = nouveau_atomic_range_fault(svmm, drm, args,
+						size, hmm_flags, mm);
+	} else {
+		nouveau_hmm_convert_pfn(drm, &range, args);
 
-	svmm->vmm->vmm.object.client->super = true;
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
-	svmm->vmm->vmm.object.client->super = false;
-	mutex_unlock(&svmm->mutex);
+		svmm->vmm->vmm.object.client->super = true;
+		ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+		svmm->vmm->vmm.object.client->super = false;
+		mutex_unlock(&svmm->mutex);
+	}
 
 out:
 	mmu_interval_notifier_remove(&notifier->notifier);
@@ -637,7 +720,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 	unsigned long hmm_flags;
 	u64 inst, start, limit;
 	int fi, fn;
-	int replay = 0, ret;
+	int replay = 0, atomic = 0, ret;
 
 	/* Parse available fault buffer entries into a cache, and update
 	 * the GET pointer so HW can reuse the entries.
@@ -718,12 +801,15 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		/*
 		 * Determine required permissions based on GPU fault
 		 * access flags.
-		 * XXX: atomic?
 		 */
 		switch (buffer->fault[fi]->access) {
 		case 0: /* READ. */
 			hmm_flags = HMM_PFN_REQ_FAULT;
 			break;
+		case 2: /* ATOMIC. */
+			hmm_flags = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
+			atomic = true;
+			break;
 		case 3: /* PREFETCH. */
 			hmm_flags = 0;
 			break;
@@ -740,7 +826,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 
 		notifier.svmm = svmm;
 		ret = nouveau_range_fault(svmm, svm->drm, &args.i,
-					sizeof(args), hmm_flags, &notifier);
+			sizeof(args), hmm_flags, atomic, &notifier);
 		mmput(mm);
 
 		limit = args.i.p.addr + args.i.p.size;
@@ -760,7 +846,11 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
 			    (buffer->fault[fi]->access != 0 /* READ. */ &&
 			     buffer->fault[fi]->access != 3 /* PREFETCH. */ &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)))
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)) ||
+			    (buffer->fault[fi]->access != 0 /* READ. */ &&
+			     buffer->fault[fi]->access != 1 /* WRITE. */ &&
+			     buffer->fault[fi]->access != 3 /* PREFETCH. */ &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_A)))
 				break;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index a2b179568970..f6188aa9171c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -178,6 +178,7 @@ void nvkm_vmm_unmap_region(struct nvkm_vmm *, struct nvkm_vma *);
 #define NVKM_VMM_PFN_APER                                 0x00000000000000f0ULL
 #define NVKM_VMM_PFN_HOST                                 0x0000000000000000ULL
 #define NVKM_VMM_PFN_VRAM                                 0x0000000000000010ULL
+#define NVKM_VMM_PFN_A					  0x0000000000000004ULL
 #define NVKM_VMM_PFN_W                                    0x0000000000000002ULL
 #define NVKM_VMM_PFN_V                                    0x0000000000000001ULL
 #define NVKM_VMM_PFN_NONE                                 0x0000000000000000ULL
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 236db5570771..f02abd9cb4dd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -88,6 +88,9 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |= BIT_ULL(6); /* RO. */
 
+		if (!(*map->pfn & NVKM_VMM_PFN_A))
+			data |= BIT_ULL(7); /* Atomic disable. */
+
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr = dma_map_page(dev, pfn_to_page(addr), 0,
@@ -322,6 +325,9 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |= BIT_ULL(6); /* RO. */
 
+		if (!(*map->pfn & NVKM_VMM_PFN_A))
+			data |= BIT_ULL(7); /* Atomic disable. */
+
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr = dma_map_page(dev, pfn_to_page(addr), 0,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
