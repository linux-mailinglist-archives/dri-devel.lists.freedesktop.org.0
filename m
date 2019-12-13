Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B005811ED82
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9E46EE02;
	Fri, 13 Dec 2019 22:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6E6EDF7;
 Fri, 13 Dec 2019 22:07:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558934"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 12/12] drm/i915/svm: Add page table dump support
Date: Fri, 13 Dec 2019 13:56:14 -0800
Message-Id: <20191213215614.24558-13-niranjana.vishwanathapura@intel.com>
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

Add support to dump page table for debug purpose.
Here is an example dump. Format is,
[<page table index>] <start VA pfn>: <value>

Page Table dump start 0x0 len 0xffffffffffffffff
      [0x0fe] 0x7f0000000: 0x6b0003
              [0x1e6] 0x7f7980000: 0x6c0003
                      [0x16d] 0x7f79ada00: 0x5f0003
                              [0x000] 0x7f79ada00: 0x610803
                      [0x16e] 0x7f79adc00: 0x6d0003
                              [0x000] 0x7f79adc00: 0x630803
      [0x100] 0x800000000: 0x6f0003
              [0x000] 0x800000000: 0x700003
                      [0x000] 0x800000000: 0x710003
                              [0x000] 0x800000000: 0x5d0803

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug            | 14 +++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  1 +
 drivers/gpu/drm/i915/i915_gem_gtt.c           | 92 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_gem_gtt.h           | 14 +++
 4 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 206882e154bc..257510a38b15 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -221,3 +221,17 @@ config DRM_I915_DEBUG_RUNTIME_PM
 	  driver loading, suspend and resume operations.
 
 	  If in doubt, say "N"
+
+config DRM_I915_DUMP_PPGTT
+        bool "Enable PPGTT Page Table dump support"
+        depends on DRM_I915
+        default n
+        help
+	  Choose this option to enable PPGTT page table dump support.
+	  The page table snapshot helps developers to debug page table
+	  related issues. This will affect performance and dumps a lot of
+	  information, so only recommended for developer debug.
+
+          Recommended for driver developers only.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index a7ac24de2017..2c09d4bdee6f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2678,6 +2678,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		intel_engine_pool_mark_active(eb.batch->private, eb.request);
 
 	trace_i915_request_queue(eb.request, eb.batch_flags);
+	ppgtt_dump(eb.context->vm, 0, eb.context->vm->total);
 	err = eb_submit(&eb);
 err_request:
 	add_to_client(eb.request, file);
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 192674f03e4e..a473f43c5320 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -1227,6 +1227,97 @@ static int gen8_ppgtt_alloc(struct i915_address_space *vm,
 	return err;
 }
 
+#ifdef CONFIG_DRM_I915_DUMP_PPGTT
+static void __gen8_ppgtt_dump(struct i915_address_space * const vm,
+			      struct i915_page_directory * const pd,
+			      u64 start, u64 end, int lvl)
+{
+	char *prefix[4] = { "\t\t\t\t", "\t\t\t", "\t\t", "\t"};
+	char *format = "%s [0x%03x] 0x%llx: 0x%llx\n";
+	unsigned int idx, len;
+	gen8_pte_t *vaddr;
+	unsigned int pdpe;
+	bool is_large;
+
+	GEM_BUG_ON(end > vm->total >> GEN8_PTE_SHIFT);
+
+	len = gen8_pd_range(start, end, lvl--, &idx);
+	GEM_BUG_ON(!len || (idx + len - 1) >> gen8_pd_shift(1));
+
+	spin_lock(&pd->lock);
+	GEM_BUG_ON(!atomic_read(px_used(pd))); /* Must be pinned! */
+	do {
+		struct i915_page_table *pt = pd->entry[idx];
+
+		if (!pt) {
+			start += (1 << gen8_pd_shift(lvl + 1));
+			continue;
+		}
+
+		vaddr = kmap_atomic_px(&pd->pt);
+		pdpe = gen8_pd_index(start, lvl + 1);
+		DRM_DEBUG_DRIVER(format, prefix[lvl + 1], pdpe,
+				 start, vaddr[pdpe]);
+		is_large = (vaddr[pdpe] & GEN8_PDE_PS_2M);
+		kunmap_atomic(vaddr);
+		if (is_large) {
+			start += (1 << gen8_pd_shift(lvl + 1));
+			continue;
+		}
+
+		if (lvl) {
+			atomic_inc(&pt->used);
+			spin_unlock(&pd->lock);
+
+			__gen8_ppgtt_dump(vm, as_pd(pt),
+					  start, end, lvl);
+
+			start += (1 << gen8_pd_shift(lvl + 1));
+			spin_lock(&pd->lock);
+			atomic_dec(&pt->used);
+			GEM_BUG_ON(!atomic_read(&pt->used));
+		} else {
+			unsigned int count = gen8_pt_count(start, end);
+
+			pdpe = gen8_pd_index(start, lvl);
+			vaddr = kmap_atomic_px(pt);
+			while (count) {
+				if (vaddr[pdpe] != vm->scratch[lvl].encode)
+					DRM_DEBUG_DRIVER(format, prefix[lvl],
+							 pdpe, start,
+							 vaddr[pdpe]);
+				start++;
+				count--;
+				pdpe++;
+			}
+
+			kunmap_atomic(vaddr);
+			GEM_BUG_ON(atomic_read(&pt->used) > I915_PDES);
+		}
+	} while (idx++, --len);
+	spin_unlock(&pd->lock);
+}
+
+static void gen8_ppgtt_dump(struct i915_address_space *vm,
+			    u64 start, u64 length)
+{
+	GEM_BUG_ON(!IS_ALIGNED(start, BIT_ULL(GEN8_PTE_SHIFT)));
+	GEM_BUG_ON(!IS_ALIGNED(length, BIT_ULL(GEN8_PTE_SHIFT)));
+	GEM_BUG_ON(range_overflows(start, length, vm->total));
+
+	start >>= GEN8_PTE_SHIFT;
+	length >>= GEN8_PTE_SHIFT;
+	GEM_BUG_ON(length == 0);
+
+	DRM_DEBUG_DRIVER("PPGTT dump: start 0x%llx length 0x%llx\n",
+			 start, length);
+	__gen8_ppgtt_dump(vm, i915_vm_to_ppgtt(vm)->pd,
+			  start, start + length, vm->top);
+}
+#else
+#define gen8_ppgtt_dump   NULL
+#endif
+
 static inline struct sgt_dma {
 	struct scatterlist *sg;
 	dma_addr_t dma, max;
@@ -1596,6 +1687,7 @@ static struct i915_ppgtt *gen8_ppgtt_create(struct drm_i915_private *i915)
 	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
 	ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
 	ppgtt->vm.clear_range = gen8_ppgtt_clear;
+	ppgtt->vm.dump_va_range = gen8_ppgtt_dump;
 
 	if (intel_vgpu_active(i915))
 		gen8_ppgtt_notify_vgt(ppgtt, true);
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index e06e6447e0d7..db3505263e6c 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -367,6 +367,8 @@ struct i915_address_space {
 				 u64 start, u64 length);
 	void (*clear_range)(struct i915_address_space *vm,
 			    u64 start, u64 length);
+	void (*dump_va_range)(struct i915_address_space *vm,
+			      u64 start, u64 length);
 	void (*insert_page)(struct i915_address_space *vm,
 			    dma_addr_t addr,
 			    u64 offset,
@@ -684,6 +686,18 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 
 #define PIN_OFFSET_MASK		(-I915_GTT_PAGE_SIZE)
 
+#ifdef CONFIG_DRM_I915_DUMP_PPGTT
+static inline void ppgtt_dump(struct i915_address_space *vm,
+			      u64 start, u64 length)
+{
+	if (vm->dump_va_range)
+		vm->dump_va_range(vm, start, length);
+}
+#else
+static inline void ppgtt_dump(struct i915_address_space *vm,
+			      u64 start, u64 length) { }
+#endif
+
 /* SVM UAPI */
 #define I915_GTT_SVM_READONLY  BIT(0)
 
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
