Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066ECA5E618
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151ED10E7BB;
	Wed, 12 Mar 2025 21:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfhDQXOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031D610E7C3;
 Wed, 12 Mar 2025 21:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813528; x=1773349528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRH6alolskh5ueYrVP60p72pyIHTehdVRlfCbBleTFY=;
 b=TfhDQXOpBjF9UWKSlGcRcMsSJJdKshZel768CK4ch0eDOFXrSKnMuUrh
 nmSq6AMmpJKmr+I4wgrLzRbicgHtlUIP7IyuD1VQDVSoywZ3zjrZR3cBo
 wcVQBVxq0j+uN6FUTSMIZU0QkJeTnnim3aHKcXaB9rRXlb/hWqR+HyC6M
 EzL6cSdfCAqcyCAYx25nW47yfF6N7UCfO1urEq6ZNoM8GjAlMLbWX6bYl
 1FGT9NqRlgAdlFL2MJ034UbnKHXF4ftTBS6LCiKAj/pX+81gN9Pjd6iqW
 Gr9tolJ49BKwh22i6xwbAgO1V6iDzVK3+Yg8S0MImEmCjVwTURfxozCTi w==;
X-CSE-ConnectionGUID: WqIkvP+6RjKttL+kfJaXlA==
X-CSE-MsgGUID: 5HLPavBBR0qfHCNM9SYh0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562220"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562220"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:27 -0700
X-CSE-ConnectionGUID: rmhKRwclQkC9kj8dUQUeAg==
X-CSE-MsgGUID: X7bCncp0QfK7nen9Jk1oWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791170"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 11/19] drm/xe: Use the drm_pagemap_util helper to get a
 svm pagemap owner
Date: Wed, 12 Mar 2025 22:04:08 +0100
Message-ID: <20250312210416.3120-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register a driver-wide owner list, provide a callback to identify
fast interconnects and use the drm_pagemap_util helper to allocate
or reuse a suitable owner struct. For now we consider pagemaps on
different tiles on the same device as having fast interconnect.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 40 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.h |  3 +++
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 20441da0aff7..25d49d0d7484 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -75,11 +75,6 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 	range_debug(range, operation);
 }
 
-static void *xe_svm_devm_owner(struct xe_device *xe)
-{
-	return xe;
-}
-
 static struct drm_gpusvm_range *
 xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 {
@@ -751,7 +746,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	/* Ensure the device has a pm ref while there are device pages active. */
 	xe_pm_runtime_get_noresume(xe);
 	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-					    start, end, xe_svm_devm_owner(xe));
+					    start, end, xpagemap->pagemap.owner);
 	if (err)
 		xe_svm_devmem_release(&bo->devmem_allocation);
 
@@ -791,6 +786,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
 	};
+	struct drm_pagemap *dpagemap;
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
@@ -818,16 +814,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
+	dpagemap = xe_tile_local_pagemap(tile);
 
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
 	    xe_svm_range_size(range) >= SZ_64K) {
-		struct drm_pagemap *dpagemap;
-
 		range->skip_migrate = true;
 
 		range_debug(range, "ALLOCATE VRAM");
-		dpagemap = xe_tile_local_pagemap(tile);
 		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 					      xe_svm_range_end(range),
 					      range->base.gpusvm->mm);
@@ -841,7 +835,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	range_debug(range, "GET PAGES");
-	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
+	ctx.device_private_page_owner = dpagemap ?
+		container_of(dpagemap, struct xe_pagemap, dpagemap)->pagemap.owner : NULL;
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
@@ -962,6 +957,11 @@ static void xe_pagemap_fini(struct xe_pagemap *xpagemap)
 		xpagemap->hpa_base = 0;
 	}
 
+	if (pagemap->owner) {
+		drm_pagemap_release_owner(&xpagemap->peer);
+		pagemap->owner = NULL;
+	}
+
 	if (pagemap->range.start) {
 		devm_release_mem_region(dev, pagemap->range.start,
 					pagemap->range.end - pagemap->range.start + 1);
@@ -995,6 +995,19 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap)
 	complete_all(&xpagemap->cache->queued);
 }
 
+static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
+				struct drm_pagemap_peer *peer2)
+{
+	struct xe_pagemap *xpagemap1 = container_of(peer1, typeof(*xpagemap1), peer);
+	struct xe_pagemap *xpagemap2 = container_of(peer2, typeof(*xpagemap1), peer);
+	struct device *dev1 = xpagemap1->dpagemap.drm->dev;
+	struct device *dev2 = xpagemap2->dpagemap.drm->dev;
+
+	return dev1 == dev2;
+}
+
+static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
+
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
 	.populate_mm = xe_drm_pagemap_populate_mm,
@@ -1046,11 +1059,16 @@ struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_pagemap_cac
 		goto out_err;
 	}
 
+	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
+					xe_has_interconnect);
+	if (err)
+		goto out_err;
+
 	pagemap->type = MEMORY_DEVICE_PRIVATE;
 	pagemap->range.start = res->start;
 	pagemap->range.end = res->end;
 	pagemap->nr_range = 1;
-	pagemap->owner = xe_svm_devm_owner(xe);
+	pagemap->owner = xpagemap->peer.owner;
 	pagemap->ops = drm_pagemap_pagemap_ops_get();
 	addr = devm_memremap_pages(dev, pagemap);
 	if (IS_ERR(addr)) {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 19469fd91666..3fd8fc125cba 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_pagemap.h>
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap_util.h>
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
@@ -54,6 +55,7 @@ struct xe_svm_range {
  * @pagemap: The struct dev_pagemap providing the struct pages.
  * @dpagemap: The drm_pagemap managing allocation and migration.
  * @destroy_work: Handles asnynchronous destruction and caching.
+ * @peer: Used for pagemap owner computation.
  * @hpa_base: The host physical address base for the managemd memory.
  * @cache: Backpointer to the struct xe_pagemap_cache for the memory region.
  * @vr: Backpointer to the xe_vram region.
@@ -65,6 +67,7 @@ struct xe_pagemap {
 	struct dev_pagemap pagemap;
 	struct drm_pagemap dpagemap;
 	struct delayed_work destroy_work;
+	struct drm_pagemap_peer peer;
 	resource_size_t hpa_base;
 	struct xe_pagemap_cache *cache;
 	struct xe_vram_region *vr;
-- 
2.48.1

