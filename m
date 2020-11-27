Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20942C652F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1394B6ECE2;
	Fri, 27 Nov 2020 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E1A6ECCF;
 Fri, 27 Nov 2020 12:10:55 +0000 (UTC)
IronPort-SDR: QENYjjeboAjU0hcX02eYP6pTAO+pazQjwUzHfWDzR7Puo7JZQaytpYTkhXMR+0RQgpRJ4Ejr4H
 jiscaQSTBpMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092822"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092822"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:55 -0800
IronPort-SDR: VSMSTK6rAP35pBoQenLu70fwTXSPAxNfLr0BXmXOAeBLo/zu2BeYHMA+Oo/59tMeUelKrjfV5Q
 dXzyregYu4zw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029565"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 109/162] drm/i915: add i915_gem_object_is_devmem() function
Date: Fri, 27 Nov 2020 12:06:25 +0000
Message-Id: <20201127120718.454037-110-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>, CQ Tang <cq.tang@intel.com>,
 Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>,
 dri-devel@lists.freedesktop.org,
 Francesco Balestrieri <francesco.balestrieri@intel.com>,
 Neel Desai <neel.desai@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

We have three memory region types: INTEL_SMEM, INTEL_LMEM, and
INTEL_STOLEN. We also have two types of memory:	system memory
and device memory (or called local memory).

Memory region with type INTEL_SMEM only has system memory; the
other two types of memory regions could have either system memory
or device memory.

This function is used to distinguish real local device memory or
system memory (including fake local memmory and bios stolen system
memory) for INTEL_LMEM and INTEL_STOLEN memory region type.

PPGTT will program PTE_LM bit based on this value.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Chris P Wilson <chris.p.wilson@intel.com>
Cc: Francesco Balestrieri <francesco.balestrieri@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>
Cc: Neel Desai <neel.desai@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c   | 11 ++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h   |  1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c      |  2 +-
 drivers/gpu/drm/i915/intel_memory_region.h |  1 +
 drivers/gpu/drm/i915/intel_region_lmem.c   |  3 +++
 6 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 840b68eb10d3..e56874e54fde 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -217,7 +217,16 @@ i915_gem_object_lmem_io_map_page_atomic(struct drm_i915_gem_object *obj,
 
 bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 {
-	return obj->ops == &i915_gem_lmem_obj_ops;
+	struct intel_memory_region *region = obj->mm.region;
+
+	return region && (region->is_devmem || region->type == INTEL_MEMORY_LOCAL);
+}
+
+bool i915_gem_object_is_devmem(struct drm_i915_gem_object *obj)
+{
+	struct intel_memory_region *region = obj->mm.region;
+
+	return region && region->is_devmem;
 }
 
 struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
index a24d94bc380f..a1b6a10050bf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
@@ -21,6 +21,7 @@ i915_gem_object_lmem_io_map_page_atomic(struct drm_i915_gem_object *obj,
 					unsigned long n);
 
 bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj);
+bool i915_gem_object_is_devmem(struct drm_i915_gem_object *obj);
 
 struct drm_i915_gem_object *
 i915_gem_object_create_lmem(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 26aa5debd7e9..eed5b640e493 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -456,7 +456,7 @@ static void ggtt_bind_vma(struct i915_address_space *vm,
 	pte_flags = 0;
 	if (vma->vm->has_read_only && i915_gem_object_is_readonly(obj))
 		pte_flags |= PTE_READ_ONLY;
-	if (i915_gem_object_is_lmem(obj))
+	if (i915_gem_object_is_devmem(obj))
 		pte_flags |= PTE_LM;
 
 	vm->insert_entries(vm, vma, cache_level, pte_flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 731d8730fa5f..34a02643bb75 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -195,7 +195,7 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
 	pte_flags = 0;
 	if (i915_gem_object_is_readonly(vma->obj))
 		pte_flags |= PTE_READ_ONLY;
-	if (i915_gem_object_is_lmem(vma->obj))
+	if (i915_gem_object_is_devmem(vma->obj))
 		pte_flags |= PTE_LM;
 
 	vm->insert_entries(vm, vma, cache_level, pte_flags);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 20431d3ce490..ed827c770d47 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -92,6 +92,7 @@ struct intel_memory_region {
 	enum intel_region_id id;
 	char name[8];
 	struct intel_gt *gt; /* GT closest to this region. */
+	bool is_devmem;	/* true for device memory */
 
 	dma_addr_t remap_addr;
 
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 7f2b31d469b0..939cf0d195a5 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -166,6 +166,9 @@ setup_lmem(struct drm_i915_private *dev_priv)
 			 (u64)mem->io_start);
 		DRM_INFO("Intel graphics LMEM size: %llx\n",
 			 (u64)lmem_size);
+
+		/* this is real device memory */
+		mem->is_devmem = true;
 	}
 
 	return mem;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
