Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CC36C147
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 10:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B70C6E91A;
	Tue, 27 Apr 2021 08:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF346E911;
 Tue, 27 Apr 2021 08:54:37 +0000 (UTC)
IronPort-SDR: jOrP+yrSbsTtRs6Br9UADddrMrTWUO9miYRuhe3/Jma+AanlcV6babULHiIC61cnqVSWZQwv9q
 6bB9wYd90JCA==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="260428698"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="260428698"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:54:37 -0700
IronPort-SDR: 4KgPvVkPqaErwAO5cqqMWEeaYEQTThIxBRc0E19EUjVEJDukssQRxigniEmgFG6kXtcqAWR+I0
 c3jBhVG2B6NA==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="422978844"
Received: from galinart-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.12.239])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 01:54:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/i915/gtt/dgfx: place the PD in LMEM
Date: Tue, 27 Apr 2021 09:54:14 +0100
Message-Id: <20210427085417.120246-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210427085417.120246-1-matthew.auld@intel.com>
References: <20210427085417.120246-1-matthew.auld@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a requirement that for dgfx we place all the paging structures in
device local-memory.

v2: use i915_coherent_map_type()
v3: improve the shared dma-resv object comment

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  5 ++++-
 drivers/gpu/drm/i915/gt/intel_gtt.c  | 30 +++++++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  1 +
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index f83496836f0f..11fb5df45a0f 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -712,7 +712,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	 */
 	ppgtt->vm.has_read_only = !IS_GEN_RANGE(gt->i915, 11, 12);
 
-	ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
+	if (HAS_LMEM(gt->i915))
+		ppgtt->vm.alloc_pt_dma = alloc_pt_lmem;
+	else
+		ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
 
 	err = gen8_init_scratch(&ppgtt->vm);
 	if (err)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index d386b89e2758..061c39d2ad51 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -7,10 +7,26 @@
 
 #include <linux/fault-inject.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "i915_trace.h"
 #include "intel_gt.h"
 #include "intel_gtt.h"
 
+struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
+{
+	struct drm_i915_gem_object *obj;
+
+	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
+	/*
+	 * Ensure all paging structures for this vm share the same dma-resv
+	 * object underneath, with the idea that one object_lock() will lock
+	 * them all at once.
+	 */
+	if (!IS_ERR(obj))
+		obj->base.resv = &vm->resv;
+	return obj;
+}
+
 struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 {
 	struct drm_i915_gem_object *obj;
@@ -19,7 +35,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 		i915_gem_shrink_all(vm->i915);
 
 	obj = i915_gem_object_create_internal(vm->i915, sz);
-	/* ensure all dma objects have the same reservation class */
+	/*
+	 * Ensure all paging structures for this vm share the same dma-resv
+	 * object underneath, with the idea that one object_lock() will lock
+	 * them all at once.
+	 */
 	if (!IS_ERR(obj))
 		obj->base.resv = &vm->resv;
 	return obj;
@@ -27,9 +47,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 
 int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 {
+	enum i915_map_type type;
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	type = i915_coherent_map_type(vm->i915, obj, true);
+	vaddr = i915_gem_object_pin_map_unlocked(obj, type);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
@@ -39,9 +61,11 @@ int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 
 int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 {
+	enum i915_map_type type;
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	type = i915_coherent_map_type(vm->i915, obj, true);
+	vaddr = i915_gem_object_pin_map(obj, type);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 40e486704558..44ce27c51631 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -527,6 +527,7 @@ int setup_scratch_page(struct i915_address_space *vm);
 void free_scratch(struct i915_address_space *vm);
 
 struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz);
+struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz);
 struct i915_page_table *alloc_pt(struct i915_address_space *vm);
 struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
 struct i915_page_directory *__alloc_pd(int npde);
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
