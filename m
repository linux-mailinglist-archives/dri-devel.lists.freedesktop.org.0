Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB34B2475
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432C710EACE;
	Fri, 11 Feb 2022 11:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06D10EABE;
 Fri, 11 Feb 2022 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579301; x=1676115301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l7hTul5YUoxv5WDxVYcLR2tvgoApnjmWZU6mUEdoG+Q=;
 b=Du6tm/82amiuq67gc907HjHub4jdpv2pymtyxmeZx/bD74d2d8AFzVli
 UtR8Kko5HMkgkGKCxsRU6cRUZQa4q1kYTvWvdDsdP/g7/o8V3uTUIJEFm
 Ucrhqrc+lk29O1FeCPd2sPy2aU7filRdShU+SNdRbpWI/rgg8XBPzIk+3
 X1QWESAGDI9TKqlsJm5LMLUmIQ9q2C0LwvichEIF1oska3uWshMzQvpbu
 eQJl8VUIizeE8oMQan6gkx/OYkep1Qfkh2QET5JHWzM+Y+d7hL1o6moR6
 QbGCyjeYUpyJR9jaq62ckc3V93SXLD8YDTZnw3L6kKm8lriup3fcv21TY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548245"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354979"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 09/15] drm/i915/ttm: mappable migration on fault
Date: Fri, 11 Feb 2022 11:34:31 +0000
Message-Id: <20220211113437.874691-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211113437.874691-1-matthew.auld@intel.com>
References: <20220211113437.874691-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The end goal is to have userspace tell the kernel what buffers will
require CPU access, however if we ever reach the CPU fault handler, and
the current resource is not mappable, then we should attempt to migrate
the buffer to the mappable portion of LMEM, or even system memory, if the
allowable placements permit it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 54 ++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 3790e569d6a9..7940dfec1d56 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -636,11 +636,24 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
 		i915_ttm_purge(obj);
 }
 
+static bool i915_ttm_resource_mappable(struct ttm_resource *res)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+
+	if (!i915_ttm_cpu_maps_iomem(res))
+		return true;
+
+	return bman_res->used_visible_size == bman_res->base.num_pages;
+}
+
 static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
 {
 	if (!i915_ttm_cpu_maps_iomem(mem))
 		return 0;
 
+	if (!i915_ttm_resource_mappable(mem))
+		return -EINVAL;
+
 	mem->bus.caching = ttm_write_combined;
 	mem->bus.is_iomem = true;
 
@@ -779,14 +792,15 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
  * Gem forced migration using the i915_ttm_migrate() op, is allowed even
  * to regions that are not in the object's list of allowable placements.
  */
-static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
-			    struct intel_memory_region *mr)
+static int __i915_ttm_migrate(struct drm_i915_gem_object *obj,
+			      struct intel_memory_region *mr,
+			      unsigned int flags)
 {
 	struct ttm_place requested;
 	struct ttm_placement placement;
 	int ret;
 
-	i915_ttm_place_from_region(mr, &requested, obj->flags);
+	i915_ttm_place_from_region(mr, &requested, flags);
 	placement.num_placement = 1;
 	placement.num_busy_placement = 1;
 	placement.placement = &requested;
@@ -809,6 +823,12 @@ static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
 	return 0;
 }
 
+static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
+			    struct intel_memory_region *mr)
+{
+	return __i915_ttm_migrate(obj, mr, obj->flags);
+}
+
 static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *st)
 {
@@ -953,9 +973,6 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (!obj)
 		return VM_FAULT_SIGBUS;
 
-	if (obj->flags & I915_BO_ALLOC_GPU_ONLY)
-		return -EINVAL;
-
 	/* Sanity check that we allow writing into this object */
 	if (unlikely(i915_gem_object_is_readonly(obj) &&
 		     area->vm_flags & VM_WRITE))
@@ -970,6 +987,31 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 
+	if (!i915_ttm_resource_mappable(bo->resource)) {
+		int err = -ENODEV;
+		int i;
+
+		for (i = 0; i < obj->mm.n_placements; i++) {
+			struct intel_memory_region *mr = obj->mm.placements[i];
+			unsigned int flags;
+
+			if (!mr->io_size && mr->type != INTEL_MEMORY_SYSTEM)
+				continue;
+
+			flags = obj->flags;
+			flags &= ~I915_BO_ALLOC_GPU_ONLY;
+			err = __i915_ttm_migrate(obj, mr, flags);
+			if (!err)
+				break;
+		}
+
+		if (err) {
+			drm_dbg(dev, "Unable to make resource CPU accessible\n");
+			dma_resv_unlock(bo->base.resv);
+			return VM_FAULT_SIGBUS;
+		}
+	}
+
 	if (drm_dev_enter(dev, &idx)) {
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
-- 
2.34.1

