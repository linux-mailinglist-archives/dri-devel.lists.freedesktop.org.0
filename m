Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DE475758
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 12:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4BF10E4B9;
	Wed, 15 Dec 2021 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F4B10E4B9;
 Wed, 15 Dec 2021 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639566475; x=1671102475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPW51pGwtLdgYtJgipxHtoyEngnV9NiFM/admpkhYEY=;
 b=iSjlaMJhUM5ozhkXzUiEft/wqi6rue9Jj153wYVil1yY1f240iwoX0bK
 p5cRToEVrlEUelM2YotOhj9kSNMVLD+9poE3Cye/YCQ2BKmUuRy9IJBnB
 pGanHaoYweJAbt50VLbPFzJdijwkdV9sBMBs7Ls1KMAmwGbSpw5gs4Zwi
 DO7yIzgLbu8Ss/FmqIj0tI/t076SXzPixRwjYXAwXkeEEVHtLzLW+To0L
 CU7OE2Gu5uCvcZ7hQrp2abzJexDXUxAfrDCNbv+EPIyuYYdqPvYtYnulc
 MLlow2F2kmCkxGGD/hCf4Moh9s+Iy7uNrzOpT7iP/K+M+ybj7flVyEryX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239014615"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239014615"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:07:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="614665100"
Received: from dhogarty-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.6.151])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:07:54 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: clean up shrinker_release_pages
Date: Wed, 15 Dec 2021 11:07:46 +0000
Message-Id: <20211215110746.865-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215110746.865-1-matthew.auld@intel.com>
References: <20211215110746.865-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some proper flags for the different modes, and shorten the name to
something more snappy.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 23 ++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  8 +++----
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 16 +++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 10 ++++----
 4 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 00c844caeabd..6f446cca4322 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -57,9 +57,26 @@ struct drm_i915_gem_object_ops {
 	void (*put_pages)(struct drm_i915_gem_object *obj,
 			  struct sg_table *pages);
 	int (*truncate)(struct drm_i915_gem_object *obj);
-	int (*shrinker_release_pages)(struct drm_i915_gem_object *obj,
-				      bool no_gpu_wait,
-				      bool should_writeback);
+	/**
+	 * shrink - Perform further backend specific actions to facilate
+	 * shrinking.
+	 * @obj: The gem object
+	 * @flags: Extra flags to control shrinking behaviour in the backend
+	 *
+	 * Possible values for @flags:
+	 *
+	 * I915_GEM_OBJECT_SHRINK_WRITEBACK - Try to perform writeback of the
+	 * backing pages, if supported.
+	 *
+	 * I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT - Don't wait for the object to
+	 * idle.  Active objects can be considered later. The TTM backend for
+	 * example might have aync migrations going on, which don't use any
+	 * i915_vma to track the active GTT binding, and hence having an unbound
+	 * object might not be enough.
+	 */
+#define I915_GEM_OBJECT_SHRINK_WRITEBACK   BIT(0)
+#define I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT BIT(1)
+	int (*shrink)(struct drm_i915_gem_object *obj, unsigned int flags);
 
 	int (*pread)(struct drm_i915_gem_object *obj,
 		     const struct drm_i915_gem_pread *arg);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 7fdf4fa10b0e..6c57b0a79c8a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -331,9 +331,7 @@ shmem_writeback(struct drm_i915_gem_object *obj)
 	__shmem_writeback(obj->base.size, obj->base.filp->f_mapping);
 }
 
-static int shmem_shrinker_release_pages(struct drm_i915_gem_object *obj,
-					bool no_gpu_wait,
-					bool writeback)
+static int shmem_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
 {
 	switch (obj->mm.madv) {
 	case I915_MADV_DONTNEED:
@@ -342,7 +340,7 @@ static int shmem_shrinker_release_pages(struct drm_i915_gem_object *obj,
 		return 0;
 	}
 
-	if (writeback)
+	if (flags & I915_GEM_OBJECT_SHRINK_WRITEBACK)
 		shmem_writeback(obj);
 
 	return 0;
@@ -520,7 +518,7 @@ const struct drm_i915_gem_object_ops i915_gem_shmem_ops = {
 	.get_pages = shmem_get_pages,
 	.put_pages = shmem_put_pages,
 	.truncate = shmem_truncate,
-	.shrinker_release_pages = shmem_shrinker_release_pages,
+	.shrink = shmem_shrink,
 
 	.pwrite = shmem_pwrite,
 	.pread = shmem_pread,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index fd54e05521f6..968ca0fdd57b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -57,10 +57,18 @@ static bool unsafe_drop_pages(struct drm_i915_gem_object *obj,
 
 static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
 {
-	if (obj->ops->shrinker_release_pages)
-		return obj->ops->shrinker_release_pages(obj,
-							!(flags & I915_SHRINK_ACTIVE),
-							flags & I915_SHRINK_WRITEBACK);
+	if (obj->ops->shrink) {
+		unsigned int shrink_flags = 0;
+
+		if (!(flags & I915_SHRINK_ACTIVE))
+			shrink_flags |= I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT;
+
+		if (flags & I915_SHRINK_WRITEBACK)
+			shrink_flags |= I915_GEM_OBJECT_SHRINK_WRITEBACK;
+
+		return obj->ops->shrink(obj, shrink_flags);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 923cc7ad8d70..21277f3c64e7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -424,16 +424,14 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
 	return 0;
 }
 
-static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
-					   bool no_wait_gpu,
-					   bool should_writeback)
+static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	struct i915_ttm_tt *i915_tt =
 		container_of(bo->ttm, typeof(*i915_tt), ttm);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
-		.no_wait_gpu = no_wait_gpu,
+		.no_wait_gpu = flags & I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT,
 	};
 	struct ttm_placement place = {};
 	int ret;
@@ -467,7 +465,7 @@ static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
 		return ret;
 	}
 
-	if (should_writeback)
+	if (flags & I915_GEM_OBJECT_SHRINK_WRITEBACK)
 		__shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
 
 	return 0;
@@ -953,7 +951,7 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
 	.truncate = i915_ttm_purge,
-	.shrinker_release_pages = i915_ttm_shrinker_release_pages,
+	.shrink = i915_ttm_shrink,
 
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
-- 
2.31.1

