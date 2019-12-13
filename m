Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7211ED78
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438806EDF3;
	Fri, 13 Dec 2019 22:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC2E6EDE7;
 Fri, 13 Dec 2019 22:07:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558880"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:29 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 04/12] drm/i915/svm: Page table update support for SVM
Date: Fri, 13 Dec 2019 13:56:06 -0800
Message-Id: <20191213215614.24558-5-niranjana.vishwanathapura@intel.com>
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

For Shared Virtual Memory (SVM) system (SYS) allocator, there is no
backing buffer object (BO). Add support to bind a VA to PA mapping
in the device page table.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 60 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_gem_gtt.h | 10 +++++
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 7d4f5fa84b02..6657ff41dc3f 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -195,6 +195,50 @@ static void ppgtt_unbind_vma(struct i915_vma *vma)
 		vma->vm->clear_range(vma->vm, vma->node.start, vma->size);
 }
 
+int svm_bind_addr_prepare(struct i915_address_space *vm, u64 start, u64 size)
+{
+	return vm->allocate_va_range(vm, start, size);
+}
+
+int svm_bind_addr_commit(struct i915_address_space *vm, u64 start, u64 size,
+			 u64 flags, struct sg_table *st, u32 sg_page_sizes)
+{
+	struct i915_vma vma = {0};
+	u32 pte_flags = 0;
+
+	/* use a vma wrapper */
+	vma.page_sizes.sg = sg_page_sizes;
+	vma.node.start = start;
+	vma.node.size = size;
+	vma.pages = st;
+	vma.vm = vm;
+
+	/* Applicable to VLV, and gen8+ */
+	if (flags & I915_GTT_SVM_READONLY)
+		pte_flags |= PTE_READ_ONLY;
+
+	vm->insert_entries(vm, &vma, 0, pte_flags);
+	return 0;
+}
+
+int svm_bind_addr(struct i915_address_space *vm, u64 start, u64 size,
+		  u64 flags, struct sg_table *st, u32 sg_page_sizes)
+{
+	int ret;
+
+	ret = svm_bind_addr_prepare(vm, start, size);
+	if (ret)
+		return ret;
+
+	return svm_bind_addr_commit(vm, start, size, flags, st, sg_page_sizes);
+}
+
+void svm_unbind_addr(struct i915_address_space *vm,
+		     u64 start, u64 size)
+{
+	vm->clear_range(vm, start, size);
+}
+
 static int ppgtt_set_pages(struct i915_vma *vma)
 {
 	GEM_BUG_ON(vma->pages);
@@ -985,11 +1029,21 @@ static u64 __gen8_ppgtt_clear(struct i915_address_space * const vm,
 	DBG("%s(%p):{ lvl:%d, start:%llx, end:%llx, idx:%d, len:%d, used:%d }\n",
 	    __func__, vm, lvl + 1, start, end,
 	    idx, len, atomic_read(px_used(pd)));
-	GEM_BUG_ON(!len || len >= atomic_read(px_used(pd)));
+	/*
+	 * FIXME: In SVM case, during mmu invalidation, we need to clear ppgtt,
+	 * but we don't know if the entry exist or not. So, we can't assume
+	 * that it is called only when the entry exist. revisit.
+	 * Also need to add the ebility to properly handle partial invalidations
+	 * by downgrading the large mappings.
+	 */
+	GEM_BUG_ON(!len);
 
 	do {
 		struct i915_page_table *pt = pd->entry[idx];
 
+		if (!pt)
+			continue;
+
 		if (atomic_fetch_inc(&pt->used) >> gen8_pd_shift(1) &&
 		    gen8_pd_contains(start, end, lvl)) {
 			DBG("%s(%p):{ lvl:%d, idx:%d, start:%llx, end:%llx } removing pd\n",
@@ -1012,7 +1066,9 @@ static u64 __gen8_ppgtt_clear(struct i915_address_space * const vm,
 			    __func__, vm, lvl, start, end,
 			    gen8_pd_index(start, 0), count,
 			    atomic_read(&pt->used));
-			GEM_BUG_ON(!count || count >= atomic_read(&pt->used));
+			GEM_BUG_ON(!count);
+			if (count > atomic_read(&pt->used))
+				count = atomic_read(&pt->used);
 
 			vaddr = kmap_atomic_px(pt);
 			memset64(vaddr + gen8_pd_index(start, 0),
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index 7c1b54c9677d..8a8a314e1295 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -39,6 +39,7 @@
 #include <linux/mm.h>
 #include <linux/pagevec.h>
 #include <linux/workqueue.h>
+#include <linux/scatterlist.h>
 
 #include <drm/drm_mm.h>
 
@@ -679,4 +680,13 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 
 #define PIN_OFFSET_MASK		(-I915_GTT_PAGE_SIZE)
 
+/* SVM UAPI */
+#define I915_GTT_SVM_READONLY  BIT(0)
+
+int svm_bind_addr_prepare(struct i915_address_space *vm, u64 start, u64 size);
+int svm_bind_addr_commit(struct i915_address_space *vm, u64 start, u64 size,
+			 u64 flags, struct sg_table *st, u32 sg_page_sizes);
+int svm_bind_addr(struct i915_address_space *vm, u64 start, u64 size,
+		  u64 flags, struct sg_table *st, u32 sg_page_sizes);
+void svm_unbind_addr(struct i915_address_space *vm, u64 start, u64 size);
 #endif
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
