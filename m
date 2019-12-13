Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D303211ED79
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4F86EDF6;
	Fri, 13 Dec 2019 22:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BE16EDEE;
 Fri, 13 Dec 2019 22:07:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558923"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:33 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 10/12] drm/i915/svm: Use blitter copy for migration
Date: Fri, 13 Dec 2019 13:56:12 -0800
Message-Id: <20191213215614.24558-11-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com,
 sudeep.dutt@intel.com, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, jgg@mellanox.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use blitter engine to copy pages during migration.
As blitter context virtual address space is shared with other flows,
ensure virtual address are allocated properly from that address space.
Also ensure completion of blitter copy by waiting on the fence of the
issued request.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_svm_devmem.c | 249 ++++++++++++++++++++++++-
 1 file changed, 245 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_svm_devmem.c b/drivers/gpu/drm/i915/i915_svm_devmem.c
index 2b0c7f4c51b8..589cf42bc2da 100644
--- a/drivers/gpu/drm/i915/i915_svm_devmem.c
+++ b/drivers/gpu/drm/i915/i915_svm_devmem.c
@@ -15,7 +15,15 @@ struct i915_devmem_migrate {
 
 	enum intel_region_id src_id;
 	enum intel_region_id dst_id;
+	dma_addr_t *host_dma;
+	bool blitter_copy;
 	u64 npages;
+
+	/* required for blitter copy */
+	struct drm_mm_node src_node;
+	struct drm_mm_node dst_node;
+	struct intel_context *ce;
+	struct dma_fence *fence;
 };
 
 struct i915_devmem {
@@ -148,6 +156,139 @@ i915_devmem_page_free_locked(struct drm_i915_private *dev_priv,
 	put_page(page);
 }
 
+static int i915_devmem_bind_addr(struct i915_devmem_migrate *migrate,
+				 bool is_src)
+{
+	struct i915_gem_context *ctx = migrate->ce->gem_context;
+	struct drm_i915_private *i915 = migrate->i915;
+	struct i915_address_space *vm = ctx->vm;
+	struct intel_memory_region *mem;
+	u64 npages = migrate->npages;
+	enum intel_region_id mem_id;
+	struct drm_mm_node *node;
+	struct scatterlist *sg;
+	u32 sg_page_sizes = 0;
+	struct sg_table st;
+	u64 flags = 0;
+	int i, ret;
+
+	if (unlikely(sg_alloc_table(&st, npages, GFP_KERNEL)))
+		return -ENOMEM;
+
+	if (is_src) {
+		node = &migrate->src_node;
+		mem_id = migrate->src_id;
+		flags |= I915_GTT_SVM_READONLY;
+	} else {
+		node = &migrate->dst_node;
+		mem_id = migrate->dst_id;
+	}
+
+	mutex_lock(&vm->mutex);
+	ret = i915_gem_gtt_insert(vm, node, npages * PAGE_SIZE,
+				  I915_GTT_PAGE_SIZE_2M, 0,
+				  0, vm->total, PIN_USER);
+	mutex_unlock(&vm->mutex);
+	if (unlikely(ret))
+		return ret;
+
+	sg = NULL;
+	st.nents = 0;
+
+	/*
+	 * XXX: If the source page is missing, source it from a temporary
+	 * zero filled page. If needed, destination page missing scenarios
+	 * can be similarly handled by draining data into a temporary page.
+	 */
+	for (i = 0; i < npages; i++) {
+		u64 addr;
+
+		if (mem_id == INTEL_REGION_SMEM) {
+			addr = migrate->host_dma[i];
+		} else {
+			struct page *page;
+			unsigned long mpfn;
+
+			mpfn = is_src ? migrate->args->src[i] :
+					migrate->args->dst[i];
+			page = migrate_pfn_to_page(mpfn);
+			mem = i915->mm.regions[mem_id];
+			addr = page_to_pfn(page) - mem->devmem->pfn_first;
+			addr <<= PAGE_SHIFT;
+			addr += mem->region.start;
+		}
+
+		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
+			sg->length += PAGE_SIZE;
+			sg_dma_len(sg) += PAGE_SIZE;
+			continue;
+		}
+
+		if (sg)
+			sg_page_sizes |= sg->length;
+
+		sg =  sg ? __sg_next(sg) : st.sgl;
+		sg_dma_address(sg) = addr;
+		sg_dma_len(sg) = PAGE_SIZE;
+		sg->length = PAGE_SIZE;
+		st.nents++;
+	}
+
+	sg_page_sizes |= sg->length;
+	sg_mark_end(sg);
+	i915_sg_trim(&st);
+
+	ret = svm_bind_addr(vm, node->start, npages * PAGE_SIZE,
+			    flags, &st, sg_page_sizes);
+	sg_free_table(&st);
+
+	return ret;
+}
+
+static void i915_devmem_unbind_addr(struct i915_devmem_migrate *migrate,
+				    bool is_src)
+{
+	struct i915_gem_context *ctx = migrate->ce->gem_context;
+	struct i915_address_space *vm = ctx->vm;
+	struct drm_mm_node *node;
+
+	node = is_src ? &migrate->src_node : &migrate->dst_node;
+	svm_unbind_addr(vm, node->start, migrate->npages * PAGE_SIZE);
+	mutex_lock(&vm->mutex);
+	drm_mm_remove_node(node);
+	mutex_unlock(&vm->mutex);
+}
+
+static int i915_migrate_blitter_copy(struct i915_devmem_migrate *migrate)
+{
+	struct drm_i915_private *i915 = migrate->i915;
+	int ret;
+
+	migrate->ce = i915->engine[BCS0]->kernel_context;
+	ret = i915_devmem_bind_addr(migrate, true);
+	if (unlikely(ret))
+		return ret;
+
+	ret = i915_devmem_bind_addr(migrate, false);
+	if (unlikely(ret)) {
+		i915_devmem_unbind_addr(migrate, true);
+		return ret;
+	}
+
+	DRM_DEBUG_DRIVER("npages %lld\n", migrate->npages);
+	ret = i915_svm_copy_blt(migrate->ce,
+				migrate->src_node.start,
+				migrate->dst_node.start,
+				migrate->npages * PAGE_SIZE,
+				&migrate->fence);
+	if (unlikely(ret)) {
+		i915_devmem_unbind_addr(migrate, false);
+		i915_devmem_unbind_addr(migrate, true);
+	}
+
+	return ret;
+}
+
 static int i915_migrate_cpu_copy(struct i915_devmem_migrate *migrate)
 {
 	const unsigned long *src = migrate->args->src;
@@ -216,6 +357,7 @@ i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 {
 	struct drm_i915_private *i915 = migrate->i915;
 	struct migrate_vma *args = migrate->args;
+	struct device *dev = i915->drm.dev;
 	struct intel_memory_region *mem;
 	struct list_head blocks = {0};
 	unsigned long i, npages, cnt;
@@ -224,13 +366,35 @@ i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 
 	npages = (args->end - args->start) >> PAGE_SHIFT;
 	DRM_DEBUG_DRIVER("start 0x%lx npages %ld\n", args->start, npages);
+	/*
+	 * XXX: Set proper condition for cpu vs blitter copy for performance,
+	 * functionality and to avoid any deadlocks around blitter usage.
+	 */
+	migrate->blitter_copy = true;
+
+	if (migrate->blitter_copy) {
+		/* Allocate storage for DMA addresses, so we can unmap later. */
+		migrate->host_dma = kcalloc(npages, sizeof(*migrate->host_dma),
+					    GFP_KERNEL);
+		if (unlikely(!migrate->host_dma))
+			migrate->blitter_copy = false;
+	}
 
-	/* Check source pages */
+	/* Check and DMA map source pages */
 	for (i = 0, cnt = 0; i < npages; i++) {
 		args->dst[i] = 0;
 		page = migrate_pfn_to_page(args->src[i]);
-		if (unlikely(!page || !(args->src[i] & MIGRATE_PFN_MIGRATE)))
+		if (unlikely(!page || !(args->src[i] & MIGRATE_PFN_MIGRATE))) {
+			migrate->blitter_copy = false;
 			continue;
+		}
+
+		migrate->host_dma[i] = dma_map_page(dev, page, 0, PAGE_SIZE,
+						    PCI_DMA_TODEVICE);
+		if (unlikely(dma_mapping_error(dev, migrate->host_dma[i]))) {
+			migrate->blitter_copy = false;
+			migrate->host_dma[i] = 0;
+		}
 
 		args->dst[i] = MIGRATE_PFN_VALID;
 		cnt++;
@@ -254,6 +418,7 @@ i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 		page = i915_devmem_page_get_locked(mem, &blocks);
 		if (unlikely(!page)) {
 			WARN(1, "Failed to get dst page\n");
+			migrate->blitter_copy = false;
 			args->dst[i] = 0;
 			continue;
 		}
@@ -271,7 +436,11 @@ i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 	/* Copy the pages */
 	migrate->npages = npages;
 	/* XXX: Flush the caches? */
-	ret = i915_migrate_cpu_copy(migrate);
+	/* XXX: Fallback to cpu_copy if blitter_copy fails? */
+	if (migrate->blitter_copy)
+		ret = i915_migrate_blitter_copy(migrate);
+	else
+		ret = i915_migrate_cpu_copy(migrate);
 migrate_out:
 	if (unlikely(ret)) {
 		for (i = 0; i < npages; i++) {
@@ -283,12 +452,42 @@ i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 		}
 	}
 
+	if (unlikely(migrate->host_dma && (!migrate->blitter_copy || ret))) {
+		for (i = 0; i < npages; i++) {
+			if (migrate->host_dma[i])
+				dma_unmap_page(dev, migrate->host_dma[i],
+					       PAGE_SIZE, PCI_DMA_TODEVICE);
+		}
+		kfree(migrate->host_dma);
+		migrate->host_dma = NULL;
+	}
+
 	return ret;
 }
 
 void i915_devmem_migrate_finalize_and_map(struct i915_devmem_migrate *migrate)
 {
+	struct drm_i915_private *i915 = migrate->i915;
+	unsigned long i;
+	int ret;
+
+	if (!migrate->blitter_copy)
+		return;
+
 	DRM_DEBUG_DRIVER("npages %lld\n", migrate->npages);
+	ret = i915_svm_copy_blt_wait(i915, migrate->fence);
+	if (unlikely(ret < 0))
+		WARN(1, "Waiting for dma fence failed %d\n", ret);
+
+	i915_devmem_unbind_addr(migrate, true);
+	i915_devmem_unbind_addr(migrate, false);
+
+	for (i = 0; i < migrate->npages; i++)
+		dma_unmap_page(i915->drm.dev, migrate->host_dma[i],
+			       PAGE_SIZE, PCI_DMA_TODEVICE);
+
+	kfree(migrate->host_dma);
+	migrate->host_dma = NULL;
 }
 
 static void i915_devmem_migrate_chunk(struct i915_devmem_migrate *migrate)
@@ -360,6 +559,12 @@ i915_devmem_fault_alloc_and_copy(struct i915_devmem_migrate *migrate)
 	int err;
 
 	DRM_DEBUG_DRIVER("start 0x%lx\n", args->start);
+	/*
+	 * XXX: Set proper condition for cpu vs blitter copy for performance,
+	 * functionality and to avoid any deadlocks around blitter usage.
+	 */
+	migrate->blitter_copy = false;
+
 	/* Allocate host page */
 	spage = migrate_pfn_to_page(args->src[0]);
 	if (unlikely(!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE)))
@@ -370,12 +575,31 @@ i915_devmem_fault_alloc_and_copy(struct i915_devmem_migrate *migrate)
 		return VM_FAULT_SIGBUS;
 	lock_page(dpage);
 
+	/* DMA map host page */
+	if (migrate->blitter_copy) {
+		migrate->host_dma[0] = dma_map_page(dev, dpage, 0, PAGE_SIZE,
+						    PCI_DMA_FROMDEVICE);
+		if (unlikely(dma_mapping_error(dev, migrate->host_dma[0]))) {
+			migrate->host_dma[0] = 0;
+			err = -ENOMEM;
+			goto fault_out;
+		}
+	}
+
 	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 
 	/* Copy the pages */
 	migrate->npages = 1;
-	err = i915_migrate_cpu_copy(migrate);
+	/* XXX: Fallback to cpu_copy if blitter_copy fails? */
+	if (migrate->blitter_copy)
+		err = i915_migrate_blitter_copy(migrate);
+	else
+		err = i915_migrate_cpu_copy(migrate);
+fault_out:
 	if (unlikely(err)) {
+		if (migrate->host_dma[0])
+			dma_unmap_page(dev, migrate->host_dma[0],
+				       PAGE_SIZE, PCI_DMA_FROMDEVICE);
 		__free_page(dpage);
 		args->dst[0] = 0;
 		return VM_FAULT_SIGBUS;
@@ -386,7 +610,22 @@ i915_devmem_fault_alloc_and_copy(struct i915_devmem_migrate *migrate)
 
 void i915_devmem_fault_finalize_and_map(struct i915_devmem_migrate *migrate)
 {
+	struct drm_i915_private *i915 = migrate->i915;
+	int err;
+
 	DRM_DEBUG_DRIVER("\n");
+	if (!migrate->blitter_copy)
+		return;
+
+	err = i915_svm_copy_blt_wait(i915, migrate->fence);
+	if (unlikely(err < 0))
+		WARN(1, "Waiting for dma fence failed %d\n", err);
+
+	i915_devmem_unbind_addr(migrate, true);
+	i915_devmem_unbind_addr(migrate, false);
+
+	dma_unmap_page(i915->drm.dev, migrate->host_dma[0],
+		       PAGE_SIZE, PCI_DMA_FROMDEVICE);
 }
 
 static inline struct i915_devmem *page_to_devmem(struct page *page)
@@ -400,6 +639,7 @@ static vm_fault_t i915_devmem_migrate_to_ram(struct vm_fault *vmf)
 	struct drm_i915_private *i915 = devmem->i915;
 	struct i915_devmem_migrate migrate = {0};
 	unsigned long src = 0, dst = 0;
+	dma_addr_t dma_addr = 0;
 	vm_fault_t ret;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
@@ -413,6 +653,7 @@ static vm_fault_t i915_devmem_migrate_to_ram(struct vm_fault *vmf)
 	DRM_DEBUG_DRIVER("addr 0x%lx\n", args.start);
 	migrate.i915 = i915;
 	migrate.args = &args;
+	migrate.host_dma = &dma_addr;
 	migrate.src_id = INTEL_REGION_LMEM;
 	migrate.dst_id = INTEL_REGION_SMEM;
 	if (migrate_vma_setup(&args) < 0)
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
