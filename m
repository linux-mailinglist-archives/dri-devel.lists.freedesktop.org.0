Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F080049CE05
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBA210E900;
	Wed, 26 Jan 2022 15:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CE710E905;
 Wed, 26 Jan 2022 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210541; x=1674746541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cBJeVI4+Clu0ITmhGYnfg+0BzS9RthpNUTdMHiYKN0A=;
 b=OXFiyltqJeVGly/sYPuEWvdWgeCRcNkKRRucdyRIv44UCiQCLDQsv51Y
 uA5KSlzpCHK9Bnvy7n0nwKqGjA006slFVs459k65QyNp+N2FXaPR55vJB
 POtvSkxeinQux5X+utTVYBp9Fmy3DtNkdqpdv6RcivBljdTaSJ3xYb4BW
 riykagdDE8Aag4oteTkTQLqY/3NPwRf/UHz7Y6gHbyvdG2mB4v0Fk7A3L
 vcyc9hXC0TspWgIqlUvHmIh2ddBF3+IwBNTl/EHL6wHXdDi+U8dQlXfyt
 wwNIOLLW3Oj8S1EAY8Iv8DrnOCqMn+LKQvjYaK1C6cIh4nO5eR2btZq2/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885249"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386299"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/20] drm/i915/ttm: mappable migration on fault
Date: Wed, 26 Jan 2022 15:21:48 +0000
Message-Id: <20220126152155.3070602-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 58 ++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 8376e4c3d290..7299053fb1ec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -636,11 +636,25 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
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
+
 	if (!i915_ttm_cpu_maps_iomem(mem))
 		return 0;
 
+	if (!i915_ttm_resource_mappable(mem))
+		return -EINVAL;
+
 	mem->bus.caching = ttm_write_combined;
 	mem->bus.is_iomem = true;
 
@@ -779,14 +793,15 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
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
@@ -809,6 +824,12 @@ static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
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
@@ -940,6 +961,10 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 	ttm_bo_put(i915_gem_to_ttm(obj));
 }
 
+static int __i915_ttm_migrate(struct drm_i915_gem_object *obj,
+			      struct intel_memory_region *mr,
+			      unsigned int flags);
+
 static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 {
 	struct vm_area_struct *area = vmf->vma;
@@ -953,9 +978,6 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (!obj)
 		return VM_FAULT_SIGBUS;
 
-	if (obj->flags & I915_BO_ALLOC_TOPDOWN)
-		return -EINVAL;
-
 	/* Sanity check that we allow writing into this object */
 	if (unlikely(i915_gem_object_is_readonly(obj) &&
 		     area->vm_flags & VM_WRITE))
@@ -970,6 +992,30 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
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
+			flags &= ~I915_BO_ALLOC_TOPDOWN;
+			err = __i915_ttm_migrate(obj, mr, flags);
+			if (!err)
+				break;
+		}
+
+		if (err) {
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

