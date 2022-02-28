Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46284C6CB3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 13:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E8810E3D6;
	Mon, 28 Feb 2022 12:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAA410E3E5;
 Mon, 28 Feb 2022 12:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646051800; x=1677587800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PeW9ohZ7SA6zg447HR1Dawli87/CGkPek4nDIBajCdk=;
 b=POdHvr6HUSV7g39LULWFiAWVVHTH3RFHhcBl3j6jdvWh4rnHTPmWxCnm
 Tt0ByY0WBRkiIcsVBQrT8tQLDMJl/W+1PNnFTuW+karesctc62uHHJqTQ
 duhk3nhjepaATz1WdvH+CD/VbU3zI7rRdEK8u9H5ZuDAp6GMWrN1U1WXf
 KsfOUV3nBur+00bW74gVRQCXxUY/k0BEz9QA+O108geP58N17UYI4IOUL
 lo/LFlY1mVdkFJNTiB4CBICUP+w1jOoRdUygn6QDK1DHNBm4feeZEEJqI
 XsF11KrmtnJeQn5d+5TwKhOKJ2zGTMe3+hy66aqEzxP9mnWmHL3jS4I4L g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="233490729"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="233490729"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 04:36:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="550218609"
Received: from acroni2x-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 04:36:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 2/4] drm/i915/ttm: mappable migration on fault
Date: Mon, 28 Feb 2022 12:36:05 +0000
Message-Id: <20220228123607.580432-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228123607.580432-1-matthew.auld@intel.com>
References: <20220228123607.580432-1-matthew.auld@intel.com>
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
index 3c2f044b9c6b..45cc5837ce00 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -638,11 +638,24 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
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
 
@@ -781,14 +794,15 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
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
@@ -811,6 +825,12 @@ static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
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
@@ -955,9 +975,6 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (!obj)
 		return VM_FAULT_SIGBUS;
 
-	if (obj->flags & I915_BO_ALLOC_GPU_ONLY)
-		return -EINVAL;
-
 	/* Sanity check that we allow writing into this object */
 	if (unlikely(i915_gem_object_is_readonly(obj) &&
 		     area->vm_flags & VM_WRITE))
@@ -972,6 +989,31 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
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

