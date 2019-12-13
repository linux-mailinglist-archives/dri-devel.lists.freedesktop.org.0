Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839411ED76
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4A66EDF8;
	Fri, 13 Dec 2019 22:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049BD6EDE6;
 Fri, 13 Dec 2019 22:07:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558915"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 08/12] drm/i915/svm: Page copy support during migration
Date: Fri, 13 Dec 2019 13:56:10 -0800
Message-Id: <20191213215614.24558-9-niranjana.vishwanathapura@intel.com>
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

Copy the pages duing SVM migration using memcpy().

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_svm_devmem.c | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_svm_devmem.c b/drivers/gpu/drm/i915/i915_svm_devmem.c
index 98ab27879041..2b0c7f4c51b8 100644
--- a/drivers/gpu/drm/i915/i915_svm_devmem.c
+++ b/drivers/gpu/drm/i915/i915_svm_devmem.c
@@ -148,6 +148,69 @@ i915_devmem_page_free_locked(struct drm_i915_private *dev_priv,
 	put_page(page);
 }
 
+static int i915_migrate_cpu_copy(struct i915_devmem_migrate *migrate)
+{
+	const unsigned long *src = migrate->args->src;
+	unsigned long *dst = migrate->args->dst;
+	struct drm_i915_private *i915 = migrate->i915;
+	struct intel_memory_region *mem;
+	void *src_vaddr, *dst_vaddr;
+	u64 src_addr, dst_addr;
+	struct page *page;
+	int i, ret = 0;
+
+	/* XXX: Copy multiple pages at a time */
+	for (i = 0; !ret && i < migrate->npages; i++) {
+		if (!dst[i])
+			continue;
+
+		page = migrate_pfn_to_page(dst[i]);
+		mem = i915->mm.regions[migrate->dst_id];
+		dst_addr = page_to_pfn(page);
+		if (migrate->dst_id != INTEL_REGION_SMEM)
+			dst_addr -= mem->devmem->pfn_first;
+		dst_addr <<= PAGE_SHIFT;
+
+		if (migrate->dst_id == INTEL_REGION_SMEM)
+			dst_vaddr = phys_to_virt(dst_addr);
+		else
+			dst_vaddr = io_mapping_map_atomic_wc(&mem->iomap,
+							     dst_addr);
+		if (unlikely(!dst_vaddr))
+			return -ENOMEM;
+
+		page = migrate_pfn_to_page(src[i]);
+		mem = i915->mm.regions[migrate->src_id];
+		src_addr = page_to_pfn(page);
+		if (migrate->src_id != INTEL_REGION_SMEM)
+			src_addr -= mem->devmem->pfn_first;
+		src_addr <<= PAGE_SHIFT;
+
+		if (migrate->src_id == INTEL_REGION_SMEM)
+			src_vaddr = phys_to_virt(src_addr);
+		else
+			src_vaddr = io_mapping_map_atomic_wc(&mem->iomap,
+							     src_addr);
+
+		if (likely(src_vaddr))
+			memcpy(dst_vaddr, src_vaddr, PAGE_SIZE);
+		else
+			ret = -ENOMEM;
+
+		if (migrate->dst_id != INTEL_REGION_SMEM)
+			io_mapping_unmap_atomic(dst_vaddr);
+
+		if (migrate->src_id != INTEL_REGION_SMEM && src_vaddr)
+			io_mapping_unmap_atomic(src_vaddr);
+
+		DRM_DEBUG_DRIVER("src [%d] 0x%llx, dst [%d] 0x%llx\n",
+				 migrate->src_id, src_addr,
+				 migrate->dst_id, dst_addr);
+	}
+
+	return ret;
+}
+
 static int
 i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 {
@@ -207,6 +270,8 @@ i915_devmem_migrate_alloc_and_copy(struct i915_devmem_migrate *migrate)
 
 	/* Copy the pages */
 	migrate->npages = npages;
+	/* XXX: Flush the caches? */
+	ret = i915_migrate_cpu_copy(migrate);
 migrate_out:
 	if (unlikely(ret)) {
 		for (i = 0; i < npages; i++) {
@@ -292,6 +357,7 @@ i915_devmem_fault_alloc_and_copy(struct i915_devmem_migrate *migrate)
 	struct device *dev = migrate->i915->drm.dev;
 	struct migrate_vma *args = migrate->args;
 	struct page *dpage, *spage;
+	int err;
 
 	DRM_DEBUG_DRIVER("start 0x%lx\n", args->start);
 	/* Allocate host page */
@@ -308,6 +374,12 @@ i915_devmem_fault_alloc_and_copy(struct i915_devmem_migrate *migrate)
 
 	/* Copy the pages */
 	migrate->npages = 1;
+	err = i915_migrate_cpu_copy(migrate);
+	if (unlikely(err)) {
+		__free_page(dpage);
+		args->dst[0] = 0;
+		return VM_FAULT_SIGBUS;
+	}
 
 	return 0;
 }
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
