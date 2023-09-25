Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FA7AD980
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 15:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1810E150;
	Mon, 25 Sep 2023 13:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AE210E150;
 Mon, 25 Sep 2023 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695649805; x=1727185805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EIGog8w3TlgXXakDJHqIMIytyiyXG4hEZNGWp12x/oQ=;
 b=ZVyelm3SHjdCw1driHRGbLnrUb5p2gdLHTvhVjh/s1rcKh6/8oRSnLKJ
 i6gyTa9haWK01d7hAum8VKfTTy1jEZuqHOCktBoaF6D/2fMwf6bFnpthH
 9xZDTq2jzSmWYRicQKFE5e5i38ks9RluTb4YkX3QZkcQNRdjl1/7S2Czb
 U0+ijUC7Nb8rakPGOWsuq/iIwrzZ1WEE0a5Abn0Col1LA7XBD8X5joBx5
 tadj2MJ9xWgvxWmIXHubiaGmDfitB87MxE9GKZ9Fu29hAJVRumHlBb5KC
 8SHZseqaKTjwf/2owZKn3dz4Yr9nig03qLIMyNns1BktzwhU/yX9kEzsy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371573812"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="371573812"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872060983"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="872060983"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:49:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
Date: Mon, 25 Sep 2023 15:49:38 +0200
Message-ID: <20230925134938.12043-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Where applicable, use for_each_gt instead of to_gt in the
i915_gem_shrinker functions to make them apply to more than just the
primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
VMAs from all GTs.

v2: Pass correct GT to intel_gt_retire_requests(Andrzej).

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 44 ++++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 214763942aa2..9cb7bbfb4278 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -14,6 +14,7 @@
 #include <linux/vmalloc.h>
 
 #include "gt/intel_gt_requests.h"
+#include "gt/intel_gt.h"
 
 #include "i915_trace.h"
 
@@ -119,7 +120,8 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 	intel_wakeref_t wakeref = 0;
 	unsigned long count = 0;
 	unsigned long scanned = 0;
-	int err = 0;
+	int err = 0, i = 0;
+	struct intel_gt *gt;
 
 	/* CHV + VTD workaround use stop_machine(); need to trylock vm->mutex */
 	bool trylock_vm = !ww && intel_vm_no_concurrent_access_wa(i915);
@@ -147,9 +149,11 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 	 * what we can do is give them a kick so that we do not keep idle
 	 * contexts around longer than is necessary.
 	 */
-	if (shrink & I915_SHRINK_ACTIVE)
-		/* Retire requests to unpin all idle contexts */
-		intel_gt_retire_requests(to_gt(i915));
+	if (shrink & I915_SHRINK_ACTIVE) {
+		for_each_gt(gt, i915, i)
+			/* Retire requests to unpin all idle contexts */
+			intel_gt_retire_requests(gt);
+	}
 
 	/*
 	 * As we may completely rewrite the (un)bound list whilst unbinding
@@ -389,6 +393,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 	struct i915_vma *vma, *next;
 	unsigned long freed_pages = 0;
 	intel_wakeref_t wakeref;
+	struct intel_gt *gt;
+	int i;
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		freed_pages += i915_gem_shrink(NULL, i915, -1UL, NULL,
@@ -397,24 +403,26 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 					       I915_SHRINK_VMAPS);
 
 	/* We also want to clear any cached iomaps as they wrap vmap */
-	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
-	list_for_each_entry_safe(vma, next,
-				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
-		unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
-		struct drm_i915_gem_object *obj = vma->obj;
-
-		if (!vma->iomap || i915_vma_is_active(vma))
-			continue;
+	for_each_gt(gt, i915, i) {
+		mutex_lock(&gt->ggtt->vm.mutex);
+		list_for_each_entry_safe(vma, next,
+					 &gt->ggtt->vm.bound_list, vm_link) {
+			unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
+			struct drm_i915_gem_object *obj = vma->obj;
+
+			if (!vma->iomap || i915_vma_is_active(vma))
+				continue;
 
-		if (!i915_gem_object_trylock(obj, NULL))
-			continue;
+			if (!i915_gem_object_trylock(obj, NULL))
+				continue;
 
-		if (__i915_vma_unbind(vma) == 0)
-			freed_pages += count;
+			if (__i915_vma_unbind(vma) == 0)
+				freed_pages += count;
 
-		i915_gem_object_unlock(obj);
+			i915_gem_object_unlock(obj);
+		}
+		mutex_unlock(&gt->ggtt->vm.mutex);
 	}
-	mutex_unlock(&to_gt(i915)->ggtt->vm.mutex);
 
 	*(unsigned long *)ptr += freed_pages;
 	return NOTIFY_DONE;
-- 
2.41.0

