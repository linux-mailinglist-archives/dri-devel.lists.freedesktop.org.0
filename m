Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0F7AB23A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 14:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A9910E65F;
	Fri, 22 Sep 2023 12:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9899510E65E;
 Fri, 22 Sep 2023 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695386166; x=1726922166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kGTwNKFOthyNsd2Xu8Yd/j/8VP99e25Bcka17ebylHk=;
 b=n2493HRDJ2qqcf37axugbKpnfvi4NAd9FsNDvA5wibbXp48AzBOt8q7w
 e7nkzWiymmZDzTKz176S4fQ7P5aQb46mpoGGmuX7A08AKvgL/iaZe4Qzb
 Y0q2CGnSpwM6frvMzBUbI8AF83yxD4r4QH4C7unbuGNO45kKQVnPEZmvr
 B2Abdn1lxTrkY/95C4IozlGiFXS0l1EZg2tnI+kMAxhuCCmzBP/v0I1cz
 guO09oCYpOJ/3gHDTLJWrOymdmShpU9za5BGpvXXQsWybtD/nU35UaJ7S
 1VG1PT+cd2ESidny9Zw7XUnmy9wTzx20TFnfcjykM9q1s7fbYv58N6qSu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467114840"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="467114840"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078355155"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="1078355155"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:35:51 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
Date: Fri, 22 Sep 2023 14:35:41 +0200
Message-ID: <20230922123541.23822-1-nirmoy.das@intel.com>
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
Cc: andrzej.hajda@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Where applicable, use for_each_gt instead of to_gt in the
i915_gem_shrinker functions to make them apply to more than just the
primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
VMAs from all GTs.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 44 ++++++++++++--------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 214763942aa2..3ef1fd32f80a 100644
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
+			intel_gt_retire_requests(to_gt(i915));
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

