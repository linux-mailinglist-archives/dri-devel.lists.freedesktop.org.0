Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73769805C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAB10EAFB;
	Wed, 15 Feb 2023 16:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B657410EAFB;
 Wed, 15 Feb 2023 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477712; x=1708013712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n4ovsEqlT6l3tqJByLmbZrFyXkrQBTKpHU8ibleASdU=;
 b=QwX0o0xa5h930OFKF6BmWF0uNc+EHDRASzlTBRvQLvmimmCr5CcdRJ5x
 RgbnN27FBD5IienO8nVDVEv9TGqPHMnglT9GXRUDX3m3JMccgeAHQDk36
 +R3YDa+eYvaXEmKcKcTJ5vJtMMz/zK6CH+Lelcb5yjutT0o5hg+HtWKYs
 pl3w79GV7KE9K5/H4QIf32eWez4hlQne0elczF7AzdXnss9JfRPuOIiYN
 rXrz5YJEUwTUttuHO/t4w342kOprzIChYIQnyc134WdiP4rLoixaBcgrv
 r/AVUtC7Apnp7AiurA1pGIcL1iEL6B1cRG8zCvBpl5c1k/1mxlK4whie6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870932"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472471"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472471"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 08/16] drm/ttm: Add a shrinker and shrinker accounting
Date: Wed, 15 Feb 2023 17:13:57 +0100
Message-Id: <20230215161405.187368-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register a TTM system memory-backed object shrinker and add
accounting for shrinkable and purgeable pages. For the shrinker to work,
the driver needs to register the bo_shrink callback which is responsible
for unbinding from GPU and the dma layer if needed. Helpers for that
callback to actually perform shrinking will be introduced in upcoming
patches.

Note that we can't lock the ttm_global_mutex from within the shrinker
scan() function as that might cause a deadlock issue. To fix that, add and
use a mutex which is used for global device list manipulation only and
make sure it isn't held when registering the shrinker.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c |  26 ++++---
 drivers/gpu/drm/ttm/ttm_tt.c     | 112 +++++++++++++++++++++++++++++--
 include/drm/ttm/ttm_tt.h         |   2 +
 3 files changed, 125 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e0a2be3ed13d..ce98752d2d32 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -36,10 +36,10 @@
 
 #include "ttm_module.h"
 
-/*
- * ttm_global_mutex - protecting the global state
- */
+/* ttm_global_mutex - protects the global state init and fini. */
 static DEFINE_MUTEX(ttm_global_mutex);
+/* ttm_global_list_mutex - protects the device list. */
+static DEFINE_MUTEX(ttm_global_list_mutex);
 static unsigned ttm_glob_use_count;
 struct ttm_global ttm_glob;
 EXPORT_SYMBOL(ttm_glob);
@@ -54,6 +54,7 @@ static void ttm_global_release(void)
 	if (--ttm_glob_use_count > 0)
 		goto out;
 
+	ttm_tt_mgr_fini();
 	ttm_pool_mgr_fini();
 	debugfs_remove(ttm_debugfs_root);
 
@@ -102,7 +103,10 @@ static int ttm_global_init(void)
 		goto out;
 	}
 
+	mutex_lock(&ttm_global_list_mutex);
 	INIT_LIST_HEAD(&glob->device_list);
+	mutex_unlock(&ttm_global_list_mutex);
+
 	atomic_set(&glob->bo_count, 0);
 
 	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
@@ -135,7 +139,7 @@ long ttm_global_swapout(struct ttm_operation_ctx *ctx,
 	struct ttm_device *bdev;
 	long ret = 0;
 
-	mutex_lock(&ttm_global_mutex);
+	mutex_lock(&ttm_global_list_mutex);
 	list_for_each_entry(bdev, &glob->device_list, device_list) {
 		ret = ttm_device_swapout(bdev, ctx, reason);
 		if (ret > 0) {
@@ -143,7 +147,7 @@ long ttm_global_swapout(struct ttm_operation_ctx *ctx,
 			break;
 		}
 	}
-	mutex_unlock(&ttm_global_mutex);
+	mutex_unlock(&ttm_global_list_mutex);
 	return ret;
 }
 
@@ -247,9 +251,9 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	spin_lock_init(&bdev->lru_lock);
 	INIT_LIST_HEAD(&bdev->pinned);
 	bdev->dev_mapping = mapping;
-	mutex_lock(&ttm_global_mutex);
+	mutex_lock(&ttm_global_list_mutex);
 	list_add_tail(&bdev->device_list, &glob->device_list);
-	mutex_unlock(&ttm_global_mutex);
+	mutex_unlock(&ttm_global_list_mutex);
 
 	return 0;
 }
@@ -260,14 +264,14 @@ void ttm_device_fini(struct ttm_device *bdev)
 	struct ttm_resource_manager *man;
 	unsigned i;
 
+	mutex_lock(&ttm_global_list_mutex);
+	list_del(&bdev->device_list);
+	mutex_unlock(&ttm_global_list_mutex);
+
 	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
 	ttm_resource_manager_set_used(man, false);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
 
-	mutex_lock(&ttm_global_mutex);
-	list_del(&bdev->device_list);
-	mutex_unlock(&ttm_global_mutex);
-
 	drain_workqueue(bdev->wq);
 	destroy_workqueue(bdev->wq);
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 771e5f3c2fee..5a57117c21ec 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -37,6 +37,7 @@
 #include <linux/module.h>
 #include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "ttm_module.h"
@@ -54,6 +55,11 @@ module_param_named(dma32_pages_limit, ttm_dma32_pages_limit, ulong, 0644);
 static atomic_long_t ttm_pages_allocated;
 static atomic_long_t ttm_dma32_pages_allocated;
 
+static long shrinkable_pages;
+static long purgeable_pages;
+static DEFINE_RWLOCK(shrinkable_lock);
+static struct shrinker mm_shrinker;
+
 static bool ttm_tt_shrinkable(const struct ttm_device *bdev,
 			      const struct ttm_tt *tt)
 {
@@ -69,6 +75,14 @@ static void ttm_tt_mod_allocated(bool dma32, long value)
 		atomic_long_add(value, &ttm_dma32_pages_allocated);
 }
 
+static void ttm_tt_mod_shrinkable_pages(long shrinkable, long purgeable)
+{
+	write_lock(&shrinkable_lock);
+	shrinkable_pages += shrinkable;
+	purgeable_pages += purgeable;
+	write_unlock(&shrinkable_lock);
+}
+
 /*
  * Allocates a ttm structure for the given BO.
  */
@@ -352,6 +366,9 @@ int ttm_tt_populate(struct ttm_device *bdev,
 		}
 	}
 
+	if (ttm_tt_shrinkable(bdev, ttm))
+		ttm_tt_mod_shrinkable_pages(ttm->num_pages, 0);
+
 	return 0;
 
 error:
@@ -368,6 +385,13 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	if (!ttm_tt_is_populated(ttm))
 		return;
 
+	if (ttm_tt_shrinkable(bdev, ttm)) {
+		if (ttm_tt_purgeable(ttm))
+			ttm_tt_mod_shrinkable_pages(0, -(long)ttm->num_pages);
+		else
+			ttm_tt_mod_shrinkable_pages(-(long)ttm->num_pages, 0);
+	}
+
 	if (bdev->funcs->ttm_tt_unpopulate)
 		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
 	else
@@ -394,11 +418,86 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
 
 #endif
 
+static unsigned long ttm_tt_shrinker_count(struct shrinker *shrink,
+					   struct shrink_control *sc)
+{
+	unsigned long num_pages;
 
-/*
- * ttm_tt_mgr_init - register with the MM shrinker
- *
- * Register with the MM shrinker for swapping out BOs.
+	num_pages = get_nr_swap_pages();
+	read_lock(&shrinkable_lock);
+	num_pages = min_t(unsigned long, num_pages, shrinkable_pages);
+	num_pages += purgeable_pages;
+	read_unlock(&shrinkable_lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+static unsigned long ttm_tt_shrinker_scan(struct shrinker *shrink,
+					  struct shrink_control *sc)
+{
+	bool is_kswapd = current_is_kswapd();
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = !is_kswapd,
+	};
+	unsigned long nr_to_scan, freed = 0;
+	long ret;
+
+	sc->nr_scanned = 0;
+	nr_to_scan = sc->nr_to_scan;
+
+	while (freed < nr_to_scan) {
+		ret = ttm_global_swapout(&ctx, TTM_SHRINK_PURGE);
+		if (ret <= 0)
+			break;
+
+		freed += ret;
+	}
+
+	sc->nr_scanned = freed;
+	if (freed < nr_to_scan)
+		nr_to_scan -= freed;
+	else
+		nr_to_scan = 0;
+	if (!nr_to_scan)
+		return freed ? freed : SHRINK_STOP;
+
+	while (freed < nr_to_scan) {
+		ret = ttm_global_swapout(&ctx, TTM_SHRINK_SWAP);
+		if (ret <= 0)
+			break;
+
+		freed += ret;
+	}
+
+	sc->nr_scanned = freed;
+
+	return freed ? freed : SHRINK_STOP;
+}
+
+/**
+ * ttm_tt_mgr_fini() - Check shrinkable accounting consistensy and remove
+ * the shrinker.
+ */
+void ttm_tt_mgr_fini(void)
+{
+	if (WARN_ON_ONCE(atomic_long_read(&ttm_pages_allocated) ||
+			 atomic_long_read(&ttm_dma32_pages_allocated) ||
+			 shrinkable_pages || purgeable_pages)) {
+		pr_warn("Inconsistent ttm_tt accounting:\n");
+		pr_warn("pages %ld dma32 %ld shrinkable %ld purgeable %ld\n",
+			atomic_long_read(&ttm_pages_allocated),
+			atomic_long_read(&ttm_dma32_pages_allocated),
+			shrinkable_pages, purgeable_pages);
+	}
+
+	unregister_shrinker(&mm_shrinker);
+}
+
+/**
+ * ttm_tt_mgr_init() - Provide watermark limits and register the shrinker.
+ * @num_pages - Number of pages TTM is allowed to pin.
+ * @num_dma32_pages - Number of dma32 pages TTM is allowed to pin.
  */
 void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 {
@@ -412,6 +511,11 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 
 	if (!ttm_dma32_pages_limit)
 		ttm_dma32_pages_limit = num_dma32_pages;
+
+	mm_shrinker.count_objects = ttm_tt_shrinker_count;
+	mm_shrinker.scan_objects = ttm_tt_shrinker_scan;
+	mm_shrinker.seeks = DEFAULT_SEEKS;
+	(void)register_shrinker(&mm_shrinker, "ttm-objects");
 }
 
 static void ttm_kmap_iter_tt_map_local(struct ttm_kmap_iter *iter,
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 627168eba8f6..3f99787e2b93 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -221,6 +221,8 @@ static inline void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
 
 void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
 
+void ttm_tt_mgr_fini(void);
+
 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
 					    struct ttm_tt *tt);
 
-- 
2.34.1

