Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B1403259
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 03:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A306E104;
	Wed,  8 Sep 2021 01:43:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF4D6E0F1;
 Wed,  8 Sep 2021 01:43:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="242653610"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="242653610"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="431134818"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga003.jf.intel.com with ESMTP; 07 Sep 2021 18:42:59 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/8] drm/i915/guc: put all guc objects in lmem when available
Date: Tue,  7 Sep 2021 18:42:53 -0700
Message-Id: <20210908014259.50346-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908014259.50346-1-John.C.Harrison@Intel.com>
References: <20210908014259.50346-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

The firmware binary has to be loaded from lmem and the recommendation is
to put all other objects in there as well. Note that we don't fall back
to system memory if the allocation in lmem fails because all objects are
allocated during driver load and if we have issues with lmem at that point
something is seriously wrong with the system, so no point in trying to
handle it.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 ++++++++
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 ++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 75 +++++++++++++++++++++--
 6 files changed, 128 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index eb345305dc52..034226c5d4d0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -103,6 +103,32 @@ __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
 					     size, page_size, flags);
 }
 
+struct drm_i915_gem_object *
+i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
+				      const void *data, size_t size)
+{
+	struct drm_i915_gem_object *obj;
+	void *map;
+
+	obj = i915_gem_object_create_lmem(i915,
+					  round_up(size, PAGE_SIZE),
+					  I915_BO_ALLOC_CONTIGUOUS);
+	if (IS_ERR(obj))
+		return obj;
+
+	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
+	if (IS_ERR(map)) {
+		i915_gem_object_put(obj);
+		return map;
+	}
+
+	memcpy(map, data, size);
+
+	i915_gem_object_unpin_map(obj);
+
+	return obj;
+}
+
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
index 4ee81fc66302..1b88ea13435c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
@@ -23,6 +23,10 @@ bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
 
 bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
 
+struct drm_i915_gem_object *
+i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
+				      const void *data, size_t size);
+
 struct drm_i915_gem_object *
 __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
 				      resource_size_t size,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index fbfcae727d7f..8ffb689066f6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -3,6 +3,7 @@
  * Copyright © 2014-2019 Intel Corporation
  */
 
+#include "gem/i915_gem_lmem.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_pm_irq.h"
@@ -647,7 +648,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
 	u64 flags;
 	int ret;
 
-	obj = i915_gem_object_create_shmem(gt->i915, size);
+	if (HAS_LMEM(gt->i915))
+		obj = i915_gem_object_create_lmem(gt->i915, size,
+						  I915_BO_ALLOC_CPU_CLEAR |
+						  I915_BO_ALLOC_CONTIGUOUS);
+	else
+		obj = i915_gem_object_create_shmem(gt->i915, size);
+
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 76fe766ad1bc..196424be0998 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -41,18 +41,21 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
 }
 
 /* Copy RSA signature from the fw image to HW for verification */
-static void guc_xfer_rsa(struct intel_uc_fw *guc_fw,
-			 struct intel_uncore *uncore)
+static int guc_xfer_rsa(struct intel_uc_fw *guc_fw,
+			struct intel_uncore *uncore)
 {
 	u32 rsa[UOS_RSA_SCRATCH_COUNT];
 	size_t copied;
 	int i;
 
 	copied = intel_uc_fw_copy_rsa(guc_fw, rsa, sizeof(rsa));
-	GEM_BUG_ON(copied < sizeof(rsa));
+	if (copied < sizeof(rsa))
+		return -ENOMEM;
 
 	for (i = 0; i < UOS_RSA_SCRATCH_COUNT; i++)
 		intel_uncore_write(uncore, UOS_RSA_SCRATCH(i), rsa[i]);
+
+	return 0;
 }
 
 /*
@@ -141,7 +144,9 @@ int intel_guc_fw_upload(struct intel_guc *guc)
 	 * by the DMA engine in one operation, whereas the RSA signature is
 	 * loaded via MMIO.
 	 */
-	guc_xfer_rsa(&guc->fw, uncore);
+	ret = guc_xfer_rsa(&guc->fw, uncore);
+	if (ret)
+		goto out;
 
 	/*
 	 * Current uCode expects the code to be loaded at 8k; locations below
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index fc5387b410a2..ff4b6869b80b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -87,17 +87,25 @@ static int intel_huc_rsa_data_create(struct intel_huc *huc)
 									vma->obj, true));
 	if (IS_ERR(vaddr)) {
 		i915_vma_unpin_and_release(&vma, 0);
-		return PTR_ERR(vaddr);
+		err = PTR_ERR(vaddr);
+		goto unpin_out;
 	}
 
 	copied = intel_uc_fw_copy_rsa(&huc->fw, vaddr, vma->size);
-	GEM_BUG_ON(copied < huc->fw.rsa_size);
-
 	i915_gem_object_unpin_map(vma->obj);
 
+	if (copied < huc->fw.rsa_size) {
+		err = -ENOMEM;
+		goto unpin_out;
+	}
+
 	huc->rsa_data = vma;
 
 	return 0;
+
+unpin_out:
+	i915_vma_unpin_and_release(&vma, 0);
+	return err;
 }
 
 static void intel_huc_rsa_data_destroy(struct intel_huc *huc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index f632dbd32b42..f8cb00ffb506 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -7,6 +7,7 @@
 #include <linux/firmware.h>
 #include <drm/drm_print.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "intel_uc_fw.h"
 #include "intel_uc_fw_abi.h"
 #include "i915_drv.h"
@@ -370,7 +371,11 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
 		uc_fw->private_data_size = css->private_data_size;
 
-	obj = i915_gem_object_create_shmem_from_data(i915, fw->data, fw->size);
+	if (HAS_LMEM(i915))
+		obj = i915_gem_object_create_lmem_from_data(i915, fw->data, fw->size);
+	else
+		obj = i915_gem_object_create_shmem_from_data(i915, fw->data, fw->size);
+
 	if (IS_ERR(obj)) {
 		err = PTR_ERR(obj);
 		goto fail;
@@ -414,6 +419,7 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 	struct drm_i915_gem_object *obj = uc_fw->obj;
 	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
 	struct i915_vma *dummy = &uc_fw->dummy;
+	u32 pte_flags = 0;
 
 	dummy->node.start = uc_fw_ggtt_offset(uc_fw);
 	dummy->node.size = obj->base.size;
@@ -424,9 +430,13 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 	GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
 
 	/* uc_fw->obj cache domains were not controlled across suspend */
-	drm_clflush_sg(dummy->pages);
+	if (i915_gem_object_has_struct_page(obj))
+		drm_clflush_sg(dummy->pages);
+
+	if (i915_gem_object_is_lmem(obj))
+		pte_flags |= PTE_LM;
 
-	ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
+	ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, pte_flags);
 }
 
 static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
@@ -585,13 +595,68 @@ void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw)
  */
 size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
 {
-	struct sg_table *pages = uc_fw->obj->mm.pages;
+	struct intel_memory_region *mr = uc_fw->obj->mm.region;
 	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
 	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
+	struct sgt_iter iter;
+	size_t count = 0;
+	int idx;
 
+	/* Called during reset handling, must be atomic [no fs_reclaim] */
 	GEM_BUG_ON(!intel_uc_fw_is_available(uc_fw));
 
-	return sg_pcopy_to_buffer(pages->sgl, pages->nents, dst, size, offset);
+	idx = offset >> PAGE_SHIFT;
+	offset = offset_in_page(offset);
+	if (i915_gem_object_has_struct_page(uc_fw->obj)) {
+		struct page *page;
+
+		for_each_sgt_page(page, iter, uc_fw->obj->mm.pages) {
+			u32 len = min_t(u32, size, PAGE_SIZE - offset);
+			void *vaddr;
+
+			if (idx > 0) {
+				idx--;
+				continue;
+			}
+
+			vaddr = kmap_atomic(page);
+			memcpy(dst, vaddr + offset, len);
+			kunmap_atomic(vaddr);
+
+			offset = 0;
+			dst += len;
+			size -= len;
+			count += len;
+			if (!size)
+				break;
+		}
+	} else {
+		dma_addr_t addr;
+
+		for_each_sgt_daddr(addr, iter, uc_fw->obj->mm.pages) {
+			u32 len = min_t(u32, size, PAGE_SIZE - offset);
+			void __iomem *vaddr;
+
+			if (idx > 0) {
+				idx--;
+				continue;
+			}
+
+			vaddr = io_mapping_map_atomic_wc(&mr->iomap,
+							 addr - mr->region.start);
+			memcpy_fromio(dst, vaddr + offset, len);
+			io_mapping_unmap_atomic(vaddr);
+
+			offset = 0;
+			dst += len;
+			size -= len;
+			count += len;
+			if (!size)
+				break;
+		}
+	}
+
+	return count;
 }
 
 /**
-- 
2.25.1

