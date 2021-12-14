Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D1474A79
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 19:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6846810E137;
	Tue, 14 Dec 2021 18:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5357410E137;
 Tue, 14 Dec 2021 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639505304; x=1671041304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OdMvC3u1Hn8FUVRAgp87XZqM7zei6CAb9WA7+Pgm6w0=;
 b=GbDZ2RVtCmsCIsz7NzYJmp/Ii1g42j6s6eGY7K/fuuQA2yFA0OPqD04g
 GyiCQH3Bl83eXsza248tK0CsjeWZP8T+TS8832efqBfZT9J9dPRe99WJ1
 HPZO1YSNukoakpBz8ftCHwV9mN7ExoY/N/G+C/cYAy6aAi1jxWAyzFs0F
 q8s2wOsVkqJPiGgoE1D9I90skQ8nCdyX9a4Mm8XuMVaiVxGCZHX7OcTWd
 tR/8uhGO1K+dj4JpSODrkd+xfHEnV9Lq2RO8/Sf+P1U7QOgRdGImOMemM
 tjmxoDU1D0YrLDCOeYysfewjvO6Uhcw8cUbhcaNfxcJ3AYDt3b3UHUqEJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239264583"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="239264583"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 10:08:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="583705711"
Received: from vgavinx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 10:08:22 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: remove writeback hook
Date: Tue, 14 Dec 2021 18:07:54 +0000
Message-Id: <20211214180754.4113036-1-matthew.auld@intel.com>
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
index 49c6e55c68ce..52e975f57956 100644
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

