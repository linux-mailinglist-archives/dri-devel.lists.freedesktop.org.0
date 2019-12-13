Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2A11ED74
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685516EDE9;
	Fri, 13 Dec 2019 22:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CB56EDE9;
 Fri, 13 Dec 2019 22:07:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558909"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:31 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 07/12] drm/i915/svm: Implicitly migrate pages upon CPU fault
Date: Fri, 13 Dec 2019 13:56:09 -0800
Message-Id: <20191213215614.24558-8-niranjana.vishwanathapura@intel.com>
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

As PCIe is non-coherent link, do not allow direct memory access across
PCIe link. Handle CPU fault by migrating pages back to host memory.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_svm_devmem.c | 70 +++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_svm_devmem.c b/drivers/gpu/drm/i915/i915_svm_devmem.c
index 0a1f1394f196..98ab27879041 100644
--- a/drivers/gpu/drm/i915/i915_svm_devmem.c
+++ b/drivers/gpu/drm/i915/i915_svm_devmem.c
@@ -286,9 +286,77 @@ int i915_devmem_migrate_vma(struct intel_memory_region *mem,
 	return ret;
 }
 
+static vm_fault_t
+i915_devmem_fault_alloc_and_copy(struct i915_devmem_migrate *migrate)
+{
+	struct device *dev = migrate->i915->drm.dev;
+	struct migrate_vma *args = migrate->args;
+	struct page *dpage, *spage;
+
+	DRM_DEBUG_DRIVER("start 0x%lx\n", args->start);
+	/* Allocate host page */
+	spage = migrate_pfn_to_page(args->src[0]);
+	if (unlikely(!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE)))
+		return 0;
+
+	dpage = alloc_page_vma(GFP_HIGHUSER, args->vma, args->start);
+	if (unlikely(!dpage))
+		return VM_FAULT_SIGBUS;
+	lock_page(dpage);
+
+	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+
+	/* Copy the pages */
+	migrate->npages = 1;
+
+	return 0;
+}
+
+void i915_devmem_fault_finalize_and_map(struct i915_devmem_migrate *migrate)
+{
+	DRM_DEBUG_DRIVER("\n");
+}
+
+static inline struct i915_devmem *page_to_devmem(struct page *page)
+{
+	return container_of(page->pgmap, struct i915_devmem, pagemap);
+}
+
 static vm_fault_t i915_devmem_migrate_to_ram(struct vm_fault *vmf)
 {
-	return VM_FAULT_SIGBUS;
+	struct i915_devmem *devmem = page_to_devmem(vmf->page);
+	struct drm_i915_private *i915 = devmem->i915;
+	struct i915_devmem_migrate migrate = {0};
+	unsigned long src = 0, dst = 0;
+	vm_fault_t ret;
+	struct migrate_vma args = {
+		.vma		= vmf->vma,
+		.start		= vmf->address,
+		.end		= vmf->address + PAGE_SIZE,
+		.src		= &src,
+		.dst		= &dst,
+	};
+
+	/* XXX: Opportunistically migrate more pages? */
+	DRM_DEBUG_DRIVER("addr 0x%lx\n", args.start);
+	migrate.i915 = i915;
+	migrate.args = &args;
+	migrate.src_id = INTEL_REGION_LMEM;
+	migrate.dst_id = INTEL_REGION_SMEM;
+	if (migrate_vma_setup(&args) < 0)
+		return VM_FAULT_SIGBUS;
+	if (!args.cpages)
+		return 0;
+
+	ret = i915_devmem_fault_alloc_and_copy(&migrate);
+	if (ret || dst == 0)
+		goto done;
+
+	migrate_vma_pages(&args);
+	i915_devmem_fault_finalize_and_map(&migrate);
+done:
+	migrate_vma_finalize(&args);
+	return ret;
 }
 
 static void i915_devmem_page_free(struct page *page)
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
