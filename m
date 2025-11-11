Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC680C4F16D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0317610E612;
	Tue, 11 Nov 2025 16:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0DoTO7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1D410E614;
 Tue, 11 Nov 2025 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879489; x=1794415489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cNbNO3/6YZdqe8ed1v/Cu0+tP8pU4bC7fPkPYb3bsJo=;
 b=I0DoTO7ICJ7dMk590LQcKDsyT6HzBPM1qcL9aPG0V28nyYJcajz4Ziya
 HaRG+UYmgzj6PIW2haxoy2wx7KOwEaGZY1i+lyjk/AXu5J8Pehu8K8IrU
 sh5OEqXsZxr1ehPzuXi/qZM2jZZpxdsBTyA+xX/KYmyjvWVi18m5rjqQF
 N0e9awel53BlckwlOrY7QU/TVC9IhaodkNjYeF/IR2TdkR7iZemgUqIVA
 sAbQBBfZqSNLOIgetLTLMaez2JZ+woidrm6W0Tgcszk5zJ057MPRFP6wm
 qiyOyR5DqZSM0UrHZzziSA1Ig7R539TA2j0zao+pjJKsHGI/bxz0IBAtA Q==;
X-CSE-ConnectionGUID: J22xXeR2Sp2nKph2rMgwmw==
X-CSE-MsgGUID: ceDy5dJkQ/C+4NmGMBDaIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244667"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:48 -0800
X-CSE-ConnectionGUID: mTAFSGPkT5i7mTa83G2VPA==
X-CSE-MsgGUID: ZC+4K/WJRDCdew58wDlRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188646816"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 05/17] drm/pagemap: Add a drm_pagemap cache and shrinker
Date: Tue, 11 Nov 2025 17:43:55 +0100
Message-ID: <20251111164408.113070-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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

Pagemaps are costly to set up and tear down, and they consume a lot
of system memory for the struct pages. Ideally they should be
created only when needed.

Add a caching mechanism to allow doing just that: Create the drm_pagemaps
when needed for migration. Keep them around to avoid destruction and
re-creation latencies and destroy inactive/unused drm_pagemaps on memory
pressure using a shrinker.

Only add the helper functions. They will be hooked up to the xe driver
in the upcoming patch.

v2:
- Add lockdep checking for drm_pagemap_put(). (Matt Brost)
- Add a copyright notice. (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Makefile           |   3 +-
 drivers/gpu/drm/drm_pagemap.c      |  83 +++++-
 drivers/gpu/drm/drm_pagemap_util.c | 450 +++++++++++++++++++++++++++++
 include/drm/drm_pagemap.h          |  53 +++-
 include/drm/drm_pagemap_util.h     |  42 +++
 5 files changed, 613 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7789f42027ff..04ff0b3e55b0 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 drm_gpusvm_helper-y := \
 	drm_gpusvm.o\
-	drm_pagemap.o
+	drm_pagemap.o\
+	drm_pagemap_util.o
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index fb18a80d6a1c..50d3963ddbbc 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -8,6 +8,7 @@
 #include <linux/pagemap.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
 
 /**
@@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref *ref)
 	 * pagemap provider drm_device and its module.
 	 */
 	dpagemap->dev_hold = NULL;
-	kfree(dpagemap);
+	drm_pagemap_shrinker_add(dpagemap);
 	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
 	schedule_work(&drm_pagemap_work);
 	/*
@@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
 	return dev_hold;
 }
 
+/**
+ * drm_pagemap_reinit() - Reinitialize a drm_pagemap
+ * @dpagemap: The drm_pagemap to reinitialize
+ *
+ * Reinitialize a drm_pagemap, for which drm_pagemap_release
+ * has already been called. This interface is intended for the
+ * situation where the driver caches a destroyed drm_pagemap.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
+{
+	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
+	if (IS_ERR(dpagemap->dev_hold))
+		return PTR_ERR(dpagemap->dev_hold);
+
+	kref_init(&dpagemap->ref);
+	return 0;
+}
+EXPORT_SYMBOL(drm_pagemap_reinit);
+
+/**
+ * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
+ * @dpagemap: The drm_pagemap to initialize.
+ * @pagemap: The associated dev_pagemap providing the device
+ * private pages.
+ * @drm: The drm device. The drm_pagemap holds a reference on the
+ * drm_device and the module owning the drm_device until
+ * drm_pagemap_release(). This facilitates drm_pagemap exporting.
+ * @ops: The drm_pagemap ops.
+ *
+ * Initialize and take an initial reference on a drm_pagemap.
+ * After successful return, use drm_pagemap_put() to destroy.
+ *
+ ** Return: 0 on success, negative error code on error.
+ */
+int drm_pagemap_init(struct drm_pagemap *dpagemap,
+		     struct dev_pagemap *pagemap,
+		     struct drm_device *drm,
+		     const struct drm_pagemap_ops *ops)
+{
+	kref_init(&dpagemap->ref);
+	dpagemap->ops = ops;
+	dpagemap->pagemap = pagemap;
+	dpagemap->drm = drm;
+	dpagemap->cache = NULL;
+	INIT_LIST_HEAD(&dpagemap->shrink_link);
+
+	return drm_pagemap_reinit(dpagemap);
+}
+EXPORT_SYMBOL(drm_pagemap_init);
+
 /**
  * drm_pagemap_create() - Create a struct drm_pagemap.
  * @drm: Pointer to a struct drm_device providing the device-private memory.
@@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
 		   const struct drm_pagemap_ops *ops)
 {
 	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
-	struct drm_pagemap_dev_hold *dev_hold;
+	int err;
 
 	if (!dpagemap)
 		return ERR_PTR(-ENOMEM);
 
-	kref_init(&dpagemap->ref);
-	dpagemap->drm = drm;
-	dpagemap->ops = ops;
-	dpagemap->pagemap = pagemap;
-
-	dev_hold = drm_pagemap_dev_hold(dpagemap);
-	if (IS_ERR(dev_hold)) {
-		kfree(dpagemap);
-		return ERR_CAST(dev_hold);
-	}
-	dpagemap->dev_hold = dev_hold;
+	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
+	if (err)
+		return ERR_PTR(err);
 
 	return dpagemap;
 }
@@ -675,8 +720,10 @@ EXPORT_SYMBOL(drm_pagemap_create);
  */
 void drm_pagemap_put(struct drm_pagemap *dpagemap)
 {
-	if (likely(dpagemap))
+	if (likely(dpagemap)) {
+		drm_pagemap_shrinker_might_lock(dpagemap);
 		kref_put(&dpagemap->ref, drm_pagemap_release);
+	}
 }
 EXPORT_SYMBOL(drm_pagemap_put);
 
@@ -1023,6 +1070,14 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 }
 EXPORT_SYMBOL(drm_pagemap_populate_mm);
 
+void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim)
+{
+	if (dpagemap->ops->destroy)
+		dpagemap->ops->destroy(dpagemap, is_atomic_or_reclaim);
+	else
+		kfree(dpagemap);
+}
+
 static void drm_pagemap_exit(void)
 {
 	flush_work(&drm_pagemap_work);
diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
new file mode 100644
index 000000000000..84a7a4807bef
--- /dev/null
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
+#include <drm/drm_print.h>
+
+/**
+ * struct drm_pagemap_cache - Lookup structure for pagemaps
+ *
+ * Structure to keep track of active (refcount > 1) and inactive
+ * (refcount == 0) pagemaps. Inactive pagemaps can be made active
+ * again by waiting for the @queued completion (indicating that the
+ * pagemap has been put on the @shrinker's list of shrinkable
+ * pagemaps, and then successfully removing it from @shrinker's
+ * list. The latter may fail if the shrinker is already in the
+ * process of freeing the pagemap. A struct drm_pagemap_cache can
+ * hold a single struct drm_pagemap.
+ */
+struct drm_pagemap_cache {
+	/** @lookup_mutex: Mutex making the lookup process atomic */
+	struct mutex lookup_mutex;
+	/** @lock: Lock protecting the @dpagemap pointer */
+	spinlock_t lock;
+	/** @shrinker: Pointer to the shrinker used for this cache. Immutable. */
+	struct drm_pagemap_shrinker *shrinker;
+	/** @dpagemap: Non-refcounted pointer to the drm_pagemap */
+	struct drm_pagemap *dpagemap;
+	/**
+	 * @queued: Signals when an inactive drm_pagemap has been put on
+	 * @shrinker's list.
+	 */
+	struct completion queued;
+};
+
+/**
+ * struct drm_pagemap_shrinker - Shrinker to remove unused pagemaps
+ */
+struct drm_pagemap_shrinker {
+	/** @drm: Pointer to the drm device. */
+	struct drm_device *drm;
+	/** @lock: Spinlock to protect the @dpagemaps list. */
+	spinlock_t lock;
+	/** @dpagemaps: List of unused dpagemaps. */
+	struct list_head dpagemaps;
+	/** @num_dpagemaps: Number of unused dpagemaps in @dpagemaps. */
+	atomic_t num_dpagemaps;
+	/** @shrink: Pointer to the struct shrinker. */
+	struct shrinker *shrink;
+};
+
+static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap);
+
+static void drm_pagemap_cache_fini(void *arg)
+{
+	struct drm_pagemap_cache *cache = arg;
+	struct drm_pagemap *dpagemap;
+
+	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
+	spin_lock(&cache->lock);
+	dpagemap = cache->dpagemap;
+	if (!dpagemap) {
+		spin_unlock(&cache->lock);
+		goto out;
+	}
+
+	if (drm_pagemap_shrinker_cancel(dpagemap)) {
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+		drm_pagemap_destroy(dpagemap, false);
+	}
+
+out:
+	mutex_destroy(&cache->lookup_mutex);
+	kfree(cache);
+}
+
+/**
+ * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
+ * @shrinker: Pointer to a struct drm_pagemap_shrinker.
+ *
+ * Create a device-managed drm_pagemap cache. The cache is automatically
+ * destroyed on struct device removal, at which point any *inactive*
+ * drm_pagemap's are destroyed.
+ *
+ * Return: Pointer to a struct drm_pagemap_cache on success. Error pointer
+ * on failure.
+ */
+struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker)
+{
+	struct drm_pagemap_cache *cache = kzalloc(sizeof(*cache), GFP_KERNEL);
+	int err;
+
+	if (!cache)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&cache->lookup_mutex);
+	spin_lock_init(&cache->lock);
+	cache->shrinker = shrinker;
+	init_completion(&cache->queued);
+	err = devm_add_action_or_reset(shrinker->drm->dev, drm_pagemap_cache_fini, cache);
+	if (err)
+		return ERR_PTR(err);
+
+	return cache;
+}
+EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
+
+/**
+ * DOC: Cache lookup
+ *
+ * Cache lookup should be done under a locked mutex, so that a
+ * failed drm_pagemap_get_from_cache() and a following
+ * drm_pagemap_cache_setpagemap() are carried out as an atomic
+ * operation WRT other lookups. Otherwise, racing lookups may
+ * unnecessarily concurrently create pagemaps to fulfill a
+ * failed lookup. The API provides two functions to perform this lock,
+ * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and they
+ * should be used in the following way:
+ *
+ * .. code-block:: c
+ *
+ *		drm_pagemap_lock_lookup(cache);
+ *		dpagemap = drm_pagemap_get_from_cache(cache);
+ *		if (dpagemap)
+ *			goto out_unlock;
+ *
+ *		dpagemap = driver_create_new_dpagemap();
+ *		if (!IS_ERR(dpagemap))
+ *			drm_pagemap_cache_set_pagemap(cache, dpagemap);
+ *
+ *     out_unlock:
+ *		drm_pagemap_unlock_lookup(cache);
+ */
+
+/**
+ * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for lookup
+ * @cache: The drm_pagemap_cache to lock.
+ *
+ * Return: %-EINTR if interrupted while blocking. %0 otherwise.
+ */
+int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache)
+{
+	return mutex_lock_interruptible(&cache->lookup_mutex);
+}
+EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
+
+/**
+ * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache after lookup
+ * @cache: The drm_pagemap_cache to unlock.
+ */
+void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache)
+{
+	mutex_unlock(&cache->lookup_mutex);
+}
+EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
+
+/**
+ * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.
+ * @cache: The cache used for lookup.
+ *
+ * If an active pagemap is present in the cache, it is immediately returned.
+ * If an inactive pagemap is present, it's removed from the shrinker list and
+ * an attempt is made to make it active.
+ * If no pagemap present or the attempt to make it active failed, %NULL is returned
+ * to indicate to the caller to create a new drm_pagemap and insert it into
+ * the cache.
+ *
+ * Return: A reference-counted pointer to a drm_pagemap if successful. An error
+ * pointer if an error occurred, or %NULL if no drm_pagemap was found and
+ * the caller should insert a new one.
+ */
+struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache)
+{
+	struct drm_pagemap *dpagemap;
+	int err;
+
+	lockdep_assert_held(&cache->lookup_mutex);
+retry:
+	spin_lock(&cache->lock);
+	dpagemap = cache->dpagemap;
+	if (drm_pagemap_get_unless_zero(dpagemap)) {
+		spin_unlock(&cache->lock);
+		return dpagemap;
+	}
+
+	if (!dpagemap) {
+		spin_unlock(&cache->lock);
+		return NULL;
+	}
+
+	if (!try_wait_for_completion(&cache->queued)) {
+		spin_unlock(&cache->lock);
+		err = wait_for_completion_interruptible(&cache->queued);
+		if (err)
+			return ERR_PTR(err);
+		goto retry;
+	}
+
+	if (drm_pagemap_shrinker_cancel(dpagemap)) {
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+		err = drm_pagemap_reinit(dpagemap);
+		if (err) {
+			drm_pagemap_destroy(dpagemap, false);
+			return ERR_PTR(err);
+		}
+		drm_pagemap_cache_set_pagemap(cache, dpagemap);
+	} else {
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+		dpagemap = NULL;
+	}
+
+	return dpagemap;
+}
+EXPORT_SYMBOL(drm_pagemap_get_from_cache);
+
+/**
+ * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a drm_pagemap_cache
+ * @cache: The cache to assign the drm_pagemap to.
+ * @dpagemap: The drm_pagemap to assign.
+ *
+ * The function must be called to populate a drm_pagemap_cache only
+ * after a call to drm_pagemap_get_from_cache() returns NULL.
+ */
+void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap)
+{
+	struct drm_device *drm = dpagemap->drm;
+
+	lockdep_assert_held(&cache->lookup_mutex);
+	spin_lock(&cache->lock);
+	dpagemap->cache = cache;
+	swap(cache->dpagemap, dpagemap);
+	reinit_completion(&cache->queued);
+	spin_unlock(&cache->lock);
+	drm_WARN_ON(drm, !!dpagemap);
+}
+EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
+
+/**
+ * drm_pagemap_get_from_cache_if_active() - Quick lookup of active drm_pagemaps
+ * @cache: The cache to lookup from.
+ *
+ * Function that should be used to lookup a drm_pagemap that is already active.
+ * (refcount > 0).
+ *
+ * Return: A pointer to the cache's drm_pagemap if it's active; %NULL otherwise.
+ */
+struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache)
+{
+	struct drm_pagemap *dpagemap;
+
+	spin_lock(&cache->lock);
+	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
+	spin_unlock(&cache->lock);
+
+	return dpagemap;
+}
+EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
+
+static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap)
+{
+	struct drm_pagemap_cache *cache = dpagemap->cache;
+	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
+
+	spin_lock(&shrinker->lock);
+	if (list_empty(&dpagemap->shrink_link)) {
+		spin_unlock(&shrinker->lock);
+		return false;
+	}
+
+	list_del_init(&dpagemap->shrink_link);
+	atomic_dec(&shrinker->num_dpagemaps);
+	spin_unlock(&shrinker->lock);
+	return true;
+}
+
+#ifdef CONFIG_PROVE_LOCKING
+/**
+ * drm_pagemap_shrinker_might_lock() - lockdep test for drm_pagemap_shrinker_add()
+ * @dpagemap: The drm pagemap.
+ *
+ * The drm_pagemap_shrinker_add() function performs some locking.
+ * This function can be called in code-paths that might
+ * call drm_pagemap_shrinker_add() to detect any lockdep problems early.
+ */
+void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap)
+{
+	int idx;
+
+	if (drm_dev_enter(dpagemap->drm, &idx)) {
+		struct drm_pagemap_cache *cache = dpagemap->cache;
+
+		if (cache)
+			might_lock(&cache->shrinker->lock);
+
+		drm_dev_exit(idx);
+	}
+}
+#endif
+
+/**
+ * drm_pagemap_shrinker_add() - Add a drm_pagemap to the shrinker list or destroy
+ * @dpagemap: The drm_pagemap.
+ *
+ * If @dpagemap is associated with a &struct drm_pagemap_cache AND the
+ * struct device backing the drm device is still alive, add @dpagemap to
+ * the &struct drm_pagemap_shrinker list of shrinkable drm_pagemaps.
+ *
+ * Otherwise destroy the pagemap directly using drm_pagemap_destroy().
+ *
+ * This is an internal function which is not intended to be exposed to drivers.
+ */
+void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
+{
+	struct drm_pagemap_cache *cache;
+	struct drm_pagemap_shrinker *shrinker;
+	int idx;
+
+	/*
+	 * The pagemap cache and shrinker are disabled at
+	 * pci device remove time. After that, dpagemaps
+	 * are freed directly.
+	 */
+	if (!drm_dev_enter(dpagemap->drm, &idx))
+		goto out_no_cache;
+
+	cache = dpagemap->cache;
+	if (!cache) {
+		drm_dev_exit(idx);
+		goto out_no_cache;
+	}
+
+	shrinker = cache->shrinker;
+	spin_lock(&shrinker->lock);
+	list_add_tail(&dpagemap->shrink_link, &shrinker->dpagemaps);
+	atomic_inc(&shrinker->num_dpagemaps);
+	spin_unlock(&shrinker->lock);
+	complete_all(&cache->queued);
+	drm_dev_exit(idx);
+	return;
+
+out_no_cache:
+	drm_pagemap_destroy(dpagemap, true);
+}
+
+static unsigned long
+drm_pagemap_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
+	unsigned long count = atomic_read(&shrinker->num_dpagemaps);
+
+	return count ? : SHRINK_EMPTY;
+}
+
+static unsigned long
+drm_pagemap_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
+	struct drm_pagemap *dpagemap;
+	struct drm_pagemap_cache *cache;
+	unsigned long nr_freed = 0;
+
+	sc->nr_scanned = 0;
+	spin_lock(&shrinker->lock);
+	do {
+		dpagemap = list_first_entry_or_null(&shrinker->dpagemaps, typeof(*dpagemap),
+						    shrink_link);
+		if (!dpagemap)
+			break;
+
+		atomic_dec(&shrinker->num_dpagemaps);
+		list_del_init(&dpagemap->shrink_link);
+		spin_unlock(&shrinker->lock);
+
+		sc->nr_scanned++;
+		nr_freed++;
+
+		cache = dpagemap->cache;
+		spin_lock(&cache->lock);
+		cache->dpagemap = NULL;
+		spin_unlock(&cache->lock);
+
+		drm_dbg(dpagemap->drm, "Shrinking dpagemap %p.\n", dpagemap);
+		drm_pagemap_destroy(dpagemap, true);
+		spin_lock(&shrinker->lock);
+	} while (sc->nr_scanned < sc->nr_to_scan);
+	spin_unlock(&shrinker->lock);
+
+	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
+}
+
+static void drm_pagemap_shrinker_fini(void *arg)
+{
+	struct drm_pagemap_shrinker *shrinker = arg;
+
+	drm_dbg(shrinker->drm, "Destroying dpagemap shrinker.\n");
+	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker->num_dpagemaps));
+	shrinker_free(shrinker->shrink);
+	kfree(shrinker);
+}
+
+/**
+ * drm_pagemap_shrinker_create_devm() - Create and register a pagemap shrinker
+ * @drm: The drm device
+ *
+ * Create and register a pagemap shrinker that shrinks unused pagemaps
+ * and thereby reduces memory footprint.
+ * The shrinker is drm_device managed and unregisters itself when
+ * the drm device is removed.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
+{
+	struct drm_pagemap_shrinker *shrinker;
+	struct shrinker *shrink;
+	int err;
+
+	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
+	if (!shrinker)
+		return ERR_PTR(-ENOMEM);
+
+	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm->unique);
+	if (!shrink) {
+		kfree(shrinker);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	spin_lock_init(&shrinker->lock);
+	INIT_LIST_HEAD(&shrinker->dpagemaps);
+	shrinker->drm = drm;
+	shrinker->shrink = shrink;
+	shrink->count_objects = drm_pagemap_shrinker_count;
+	shrink->scan_objects = drm_pagemap_shrinker_scan;
+	shrink->private_data = shrinker;
+	shrinker_register(shrink);
+
+	err = devm_add_action_or_reset(drm->dev, drm_pagemap_shrinker_fini, shrinker);
+	if (err)
+		return ERR_PTR(err);
+
+	return shrinker;
+}
+EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 5cfe54331ba7..4b9af5e785c6 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -9,6 +9,7 @@
 #define NR_PAGES(order) (1U << (order))
 
 struct drm_pagemap;
+struct drm_pagemap_cache;
 struct drm_pagemap_dev_hold;
 struct drm_pagemap_zdd;
 struct device;
@@ -124,6 +125,25 @@ struct drm_pagemap_ops {
 			   unsigned long start, unsigned long end,
 			   struct mm_struct *mm,
 			   unsigned long timeslice_ms);
+	/**
+	 * @destroy: Destroy the drm_pagemap and associated resources.
+	 * @dpagemap: The drm_pagemap to destroy.
+	 * @is_atomic_or_reclaim: The function may be called from
+	 * atomic- or reclaim context.
+	 *
+	 * The implementation should take care not to attempt to
+	 * destroy resources that may already have been destroyed
+	 * using devm_ callbacks, since this function may be called
+	 * after the underlying struct device has been unbound.
+	 * If the implementation defers the execution to a work item
+	 * to avoid locking issues, then it must make sure the work
+	 * items are flushed before module exit. If the destroy call
+	 * happens after the provider's pci_remove() callback has
+	 * been executed, a module reference and drm device reference is
+	 * held across the destroy callback.
+	 */
+	void (*destroy)(struct drm_pagemap *dpagemap,
+			bool is_atomic_or_reclaim);
 };
 
 /**
@@ -135,6 +155,10 @@ struct drm_pagemap_ops {
  * @pagemap: Pointer to the underlying dev_pagemap.
  * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
  * device referencing.
+ * @cache: Back-pointer to the &struct drm_pagemap_cache used for this
+ * &struct drm_pagemap. May be NULL if no cache is used.
+ * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
+ * used if also using a pagemap cache.
  */
 struct drm_pagemap {
 	const struct drm_pagemap_ops *ops;
@@ -142,6 +166,8 @@ struct drm_pagemap {
 	struct drm_device *drm;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap_dev_hold *dev_hold;
+	struct drm_pagemap_cache *cache;
+	struct list_head shrink_link;
 };
 
 struct drm_pagemap_devmem;
@@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
 			   unsigned long npages);
 };
 
+int drm_pagemap_init(struct drm_pagemap *dpagemap,
+		     struct dev_pagemap *pagemap,
+		     struct drm_device *drm,
+		     const struct drm_pagemap_ops *ops);
+
 struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
 				       struct dev_pagemap *pagemap,
 				       const struct drm_pagemap_ops *ops);
@@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
 
 /**
  * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
- * @dpagemap: Pointer to the struct drm_pagemap.
+ * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
  *
- * Return: Pointer to the struct drm_pagemap.
+ * Return: Pointer to the struct drm_pagemap, or NULL.
  */
 static inline struct drm_pagemap *
 drm_pagemap_get(struct drm_pagemap *dpagemap)
@@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap *dpagemap)
 	return dpagemap;
 }
 
+/**
+ * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pagemap
+ * unless the current reference count is zero.
+ * @dpagemap: Pointer to the drm_pagemap or NULL.
+ *
+ * Return: A pointer to @dpagemap if the reference count was successfully
+ * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
+ */
+static inline struct drm_pagemap * __must_check
+drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
+{
+	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : NULL;
+}
+
 /**
  * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
  *
@@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			    struct mm_struct *mm,
 			    unsigned long timeslice_ms);
 
-#endif
+void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
 
+int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
+#endif
diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
new file mode 100644
index 000000000000..924244d5b899
--- /dev/null
+++ b/include/drm/drm_pagemap_util.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _DRM_PAGEMAP_UTIL_H_
+#define _DRM_PAGEMAP_UTIL_H_
+
+struct drm_device;
+struct drm_pagemap;
+struct drm_pagemap_cache;
+struct drm_pagemap_shrinker;
+
+void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
+
+int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
+
+void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache);
+
+struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
+
+struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker);
+
+struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
+
+void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
+
+struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
+
+#ifdef CONFIG_PROVE_LOCKING
+
+void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap);
+
+#else
+
+static inline void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap)
+{
+}
+
+#endif /* CONFIG_PROVE_LOCKING */
+
+#endif
-- 
2.51.1

