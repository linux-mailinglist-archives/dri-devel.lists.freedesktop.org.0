Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF92475759
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 12:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979BB10E4C5;
	Wed, 15 Dec 2021 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59A10E4C9;
 Wed, 15 Dec 2021 11:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639566475; x=1671102475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uWu4JrGrgQpY9oYwZ10O7u1YipqZG+5OiaTaIyJDID4=;
 b=XofWAF97F19gFS+RqxqWG+L0RDp00uEr9nBjSsk1rCcZgSOLjMtI629Z
 V+2/eJ8owbxLwN/DNgbw0si10Fs4I4nOh4sq2JSySCt3XOC+MsvSrP7EG
 a+AvyQmXPwMzQwkVBNaryhN0BKL5k/10r+yFz0+41MVm4G5uEdTiFuvLZ
 hgUCRPKo7Si0jbs4AQKwlRdXE+1W6Ew8CpaTsGzKiqRaSsCGvzeiR9Q0s
 Ia/vDymXHNZmimH+xdUakbY6mfdyPtUM/y6rLhKW/16iThgB/LqkIZ4be
 yOku7svxLwPOSzUNckskUGxZyu/WAg3O+Nh06bsM9p/esws0LoF0jmXCd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239014608"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239014608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:07:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="614665097"
Received: from dhogarty-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.6.151])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:07:53 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: remove writeback hook
Date: Wed, 15 Dec 2021 11:07:45 +0000
Message-Id: <20211215110746.865-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
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

Ditch the writeback hook and drop i915_gem_object_writeback(). We
already support the shrinker_release_pages hook which can just call
shmem_writeback directly.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 -
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 10 ----------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 19 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 12 ------------
 5 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 66f20b803b01..aaf9183e601b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -455,7 +455,6 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
-void i915_gem_object_writeback(struct drm_i915_gem_object *obj);
 
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index f9f7e44099fe..00c844caeabd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -57,7 +57,6 @@ struct drm_i915_gem_object_ops {
 	void (*put_pages)(struct drm_i915_gem_object *obj,
 			  struct sg_table *pages);
 	int (*truncate)(struct drm_i915_gem_object *obj);
-	void (*writeback)(struct drm_i915_gem_object *obj);
 	int (*shrinker_release_pages)(struct drm_i915_gem_object *obj,
 				      bool no_gpu_wait,
 				      bool should_writeback);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 89b70f5cde7a..820eee5e954e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -168,16 +168,6 @@ int i915_gem_object_truncate(struct drm_i915_gem_object *obj)
 	return 0;
 }
 
-/* Try to discard unwanted pages */
-void i915_gem_object_writeback(struct drm_i915_gem_object *obj)
-{
-	assert_object_held_shared(obj);
-	GEM_BUG_ON(i915_gem_object_has_pages(obj));
-
-	if (obj->ops->writeback)
-		obj->ops->writeback(obj);
-}
-
 static void __i915_gem_object_reset_page_iter(struct drm_i915_gem_object *obj)
 {
 	struct radix_tree_iter iter;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index cc9fe258fba7..7fdf4fa10b0e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -331,6 +331,23 @@ shmem_writeback(struct drm_i915_gem_object *obj)
 	__shmem_writeback(obj->base.size, obj->base.filp->f_mapping);
 }
 
+static int shmem_shrinker_release_pages(struct drm_i915_gem_object *obj,
+					bool no_gpu_wait,
+					bool writeback)
+{
+	switch (obj->mm.madv) {
+	case I915_MADV_DONTNEED:
+		return i915_gem_object_truncate(obj);
+	case __I915_MADV_PURGED:
+		return 0;
+	}
+
+	if (writeback)
+		shmem_writeback(obj);
+
+	return 0;
+}
+
 void
 __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 				struct sg_table *pages,
@@ -503,7 +520,7 @@ const struct drm_i915_gem_object_ops i915_gem_shmem_ops = {
 	.get_pages = shmem_get_pages,
 	.put_pages = shmem_put_pages,
 	.truncate = shmem_truncate,
-	.writeback = shmem_writeback,
+	.shrinker_release_pages = shmem_shrinker_release_pages,
 
 	.pwrite = shmem_pwrite,
 	.pread = shmem_pread,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 157a9765f483..fd54e05521f6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -61,18 +61,6 @@ static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
 		return obj->ops->shrinker_release_pages(obj,
 							!(flags & I915_SHRINK_ACTIVE),
 							flags & I915_SHRINK_WRITEBACK);
-
-	switch (obj->mm.madv) {
-	case I915_MADV_DONTNEED:
-		i915_gem_object_truncate(obj);
-		return 0;
-	case __I915_MADV_PURGED:
-		return 0;
-	}
-
-	if (flags & I915_SHRINK_WRITEBACK)
-		i915_gem_object_writeback(obj);
-
 	return 0;
 }
 
-- 
2.31.1

