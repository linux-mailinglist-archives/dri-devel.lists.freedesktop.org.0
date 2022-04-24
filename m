Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4050D477
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86211122CD;
	Sun, 24 Apr 2022 19:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA94610FEB9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id B8F2E1F44DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650827098;
 bh=tuKx3UZqmIV426YhuKAWKATSb+IbuD1a+3nRq6T84XI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NXVIs3IcxRdmvVlpIMLQd4xTzh9ulUjSE86Lylf/1Av0zRxeT0DcDQDN8ksUQJpQ7
 kBcSAQ1O5xgs3tuUM/xC5Tx32M5K/KqeQJjb9uITwwm1TSPlyyV+SOfBxbBg1cFR5B
 /ynAZEajCUOyEfmutxRfTskFjYYaiWm4gQETRUDelXKu68JHR3Be6SFxFqR97RL1OC
 naoAJe2i32xH1FA/Ku2yy098INu/kVpx+mALVAQePHFCSZNDZ2mnxBCE0Nub/oUZpk
 HyaRRoDTgSLOl9QtbY/HU0PqKqrpY1FlnInGl5DY0oj6w3qSy1L+fz90tBJ6Zlel3j
 7JobzsJZD/yUQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 12/17] drm/shmem-helper: Add generic memory shrinker
Date: Sun, 24 Apr 2022 22:04:19 +0300
Message-Id: <20220424190424.540501-13-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a common DRM SHMEM shrinker. It allows to reduce code
duplication among DRM drivers that implement theirs own shrinkers.
This is initial version of the shrinker that covers basic needs of
GPU drivers, both purging and eviction of shmem objects are supported.

This patch is based on a couple ideas borrowed from Rob's Clark MSM
shrinker and Thomas' Zimmermann variant of SHMEM shrinker.

In order to start using DRM SHMEM shrinker drivers should:

1. Optionally implement new purge(), evict() + swap_in() shmem objects
   callbacks.
2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device).
3. Use drm_gem_shmem_set_purgeable_and_evictable(shmem) and alike API
   functions to activate shrinking of shmem GEMs.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 734 +++++++++++++++++++++++--
 include/drm/drm_device.h               |   4 +
 include/drm/drm_gem_shmem_helper.h     | 115 +++-
 3 files changed, 820 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index cc90a4c28ace..25e9bc2803ee 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -89,6 +89,13 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	mutex_init(&shmem->vmap_lock);
 	INIT_LIST_HEAD(&shmem->madv_list);
 
+	/*
+	 * Eviction and purging are disabled by default, shmem user must enable
+	 * them explicitly using drm_gem_shmem_set_evictable/purgeable().
+	 */
+	shmem->eviction_disable_count = 1;
+	shmem->purge_disable_count = 1;
+
 	if (!private) {
 		/*
 		 * Our buffers are kept pinned, so allocating them
@@ -127,6 +134,77 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+static void
+drm_gem_shmem_add_pages_to_shrinker(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
+	size_t page_count = obj->size >> PAGE_SHIFT;
+
+	if (!shmem->pages_accounted_by_shrinker) {
+		WARN_ON(gem_shrinker->shrinkable_count + page_count < page_count);
+		gem_shrinker->shrinkable_count += page_count;
+		shmem->pages_accounted_by_shrinker = true;
+	}
+}
+
+static void
+drm_gem_shmem_remove_pages_from_shrinker(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
+	size_t page_count = obj->size >> PAGE_SHIFT;
+
+	if (shmem->pages_accounted_by_shrinker) {
+		WARN_ON(gem_shrinker->shrinkable_count < page_count);
+		gem_shrinker->shrinkable_count -= page_count;
+		shmem->pages_accounted_by_shrinker = false;
+	}
+}
+
+static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->madv >= 0) && !shmem->eviction_disable_count &&
+		!shmem->vmap_use_count && !shmem->base.dma_buf &&
+		!shmem->base.import_attach && shmem->sgt && !shmem->evicted;
+}
+
+static void
+drm_gem_shmem_update_pages_state_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
+
+	if (!gem_shrinker || obj->import_attach)
+		return;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	mutex_lock(&gem_shrinker->lock);
+
+	if (drm_gem_shmem_is_purgeable(shmem) && !shmem->purge_disable_count) {
+		drm_gem_shmem_add_pages_to_shrinker(shmem);
+		list_move_tail(&shmem->madv_list, &gem_shrinker->lru_purgeable);
+	} else if (drm_gem_shmem_is_evictable(shmem)) {
+		drm_gem_shmem_add_pages_to_shrinker(shmem);
+		list_move_tail(&shmem->madv_list, &gem_shrinker->lru_evictable);
+	} else if (shmem->madv < 0) {
+		drm_gem_shmem_remove_pages_from_shrinker(shmem);
+		list_del_init(&shmem->madv_list);
+	} else if (shmem->evicted) {
+		drm_gem_shmem_remove_pages_from_shrinker(shmem);
+		list_move_tail(&shmem->madv_list, &gem_shrinker->lru_evicted);
+	} else if (!shmem->pages) {
+		drm_gem_shmem_remove_pages_from_shrinker(shmem);
+		list_del_init(&shmem->madv_list);
+	} else {
+		drm_gem_shmem_remove_pages_from_shrinker(shmem);
+		list_move_tail(&shmem->madv_list, &gem_shrinker->lru_active);
+	}
+
+	mutex_unlock(&gem_shrinker->lock);
+}
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -138,6 +216,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	/* take out shmem GEM object from the memory shrinker */
+	drm_gem_shmem_madvise(shmem, -1);
+
 	WARN_ON(shmem->vmap_use_count);
 
 	if (obj->import_attach) {
@@ -149,7 +230,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
-		if (shmem->pages)
+		if (shmem->pages_use_count)
 			drm_gem_shmem_put_pages(shmem);
 	}
 
@@ -160,18 +241,208 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
+static int
+drm_gem_shmem_set_evictable_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret = 0;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	WARN_ON_ONCE(!shmem->eviction_disable_count--);
+
+	if (shmem->madv < 0)
+		ret = -ENOMEM;
+
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	return ret;
+}
+
+static int
+drm_gem_shmem_set_unevictable_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int err;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	if (shmem->madv < 0)
+		return -ENOMEM;
+
+	if (shmem->evicted) {
+		err = drm_gem_shmem_swap_in_locked(shmem);
+		if (err)
+			return err;
+	}
+
+	shmem->eviction_disable_count++;
+
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	return 0;
+}
+
+static int
+drm_gem_shmem_set_unpurgeable_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	if (shmem->madv < 0)
+		return -ENOMEM;
+
+	shmem->purge_disable_count++;
+
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	return 0;
+}
+
+static int
+drm_gem_shmem_set_purgeable_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret = 0;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	WARN_ON_ONCE(!shmem->purge_disable_count--);
+
+	if (shmem->madv < 0)
+		ret = -ENOMEM;
+
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	return ret;
+}
+
+/**
+ * drm_gem_shmem_set_purgeable() - Make GEM purgeable by memory shrinker
+ * @shmem: shmem GEM object
+ *
+ * Tell memory shrinker that this GEM can be purged. Initially purging is
+ * disabled for all GEMs. Each set_pureable() call must have corresponding
+ * set_unpureable() call. If GEM was purged, then -ENOMEM is returned.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	ret = drm_gem_shmem_set_purgeable_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_set_purgeable);
+
+static int
+drm_gem_shmem_set_purgeable_and_evictable_locked(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	ret = drm_gem_shmem_set_evictable_locked(shmem);
+	if (!ret) {
+		ret = drm_gem_shmem_set_purgeable_locked(shmem);
+		if (ret)
+			drm_gem_shmem_set_unevictable_locked(shmem);
+	}
+
+	return ret;
+}
+
+static int
+drm_gem_shmem_set_unpurgeable_and_unevictable_locked(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	ret = drm_gem_shmem_set_unpurgeable_locked(shmem);
+	if (!ret) {
+		ret = drm_gem_shmem_set_unevictable_locked(shmem);
+		if (ret)
+			drm_gem_shmem_set_purgeable_locked(shmem);
+	}
+
+	return ret;
+}
+
+/**
+ * drm_gem_shmem_set_purgeable_and_evictable() - Make GEM purgeable and
+ * 						 evictable by memory shrinker
+ * @shmem: shmem GEM object
+ *
+ * Tell memory shrinker that this GEM can be purged and evicted. Each
+ * set_unpurgeable_and_unevictable() call must have corresponding
+ * set_purgeable_and_evictable() call. If GEM was purged, then -ENOMEM
+ * is returned.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_set_purgeable_and_evictable(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	ret = drm_gem_shmem_set_purgeable_and_evictable_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_set_purgeable_and_evictable);
+
+/**
+ * drm_gem_shmem_set_unpurgeable_and_unevictable() - Make GEM unpurgeable and
+ * 						     unevictable by memory shrinker
+ * @shmem: shmem GEM object
+ *
+ * Tell memory shrinker that this GEM can't be purged and evicted. Each
+ * set_purgeable_and_evictable() call must have corresponding
+ * set_unpurgeable_and_unevictable() call. If GEM was purged, then -ENOMEM
+ * is returned.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static int
+drm_gem_shmem_set_unpurgeable_and_unevictable(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_shmem_set_unpurgeable_and_unevictable_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
+	return ret;
+}
+
+static int
+drm_gem_shmem_acquire_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
 
-	if (shmem->pages_use_count++ > 0)
+	if (shmem->madv < 0) {
+		WARN_ON(shmem->pages);
+		return -ENOMEM;
+	}
+
+	if (shmem->pages) {
+		WARN_ON(!shmem->evicted);
 		return 0;
+	}
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		DRM_DEBUG_KMS("Failed to get pages (%ld)\n", PTR_ERR(pages));
-		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
 
@@ -190,6 +461,25 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 	return 0;
 }
 
+static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	int err;
+
+	if (shmem->madv < 0)
+		return -ENOMEM;
+
+	if (shmem->pages_use_count++ > 0)
+		return 0;
+
+	err = drm_gem_shmem_acquire_pages_locked(shmem);
+	if (err) {
+		shmem->pages_use_count = 0;
+		return err;
+	}
+
+	return 0;
+}
+
 /*
  * drm_gem_shmem_get_pages - Allocate backing pages for a shmem GEM object
  * @shmem: shmem GEM object
@@ -210,21 +500,38 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 	if (ret)
 		return ret;
 	ret = drm_gem_shmem_get_pages_locked(shmem);
+
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_get_pages);
 
-static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_get_pages_no_fail(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_object *obj = &shmem->base;
+	WARN_ON(shmem->base.import_attach);
 
-	if (WARN_ON_ONCE(!shmem->pages_use_count))
-		return;
+	dma_resv_lock(shmem->base.resv, NULL);
 
-	if (--shmem->pages_use_count > 0)
+	if (drm_gem_shmem_get_pages_locked(shmem))
+		shmem->pages_use_count++;
+
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	dma_resv_unlock(shmem->base.resv);
+}
+
+static void
+drm_gem_shmem_release_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	if (!shmem->pages) {
+		WARN_ON(!shmem->evicted && shmem->madv >= 0);
 		return;
+	}
 
 #ifdef CONFIG_X86
 	if (shmem->map_wc)
@@ -237,6 +544,21 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 	shmem->pages = NULL;
 }
 
+static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	if (WARN_ON(!shmem->pages_use_count))
+		return;
+
+	if (--shmem->pages_use_count > 0)
+		return;
+
+	drm_gem_shmem_release_pages_locked(shmem);
+}
+
 /*
  * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
@@ -247,6 +569,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_put_pages_locked(shmem);
+	drm_gem_shmem_update_pages_state_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 }
 EXPORT_SYMBOL(drm_gem_shmem_put_pages);
@@ -263,9 +586,21 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  */
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
+	int err;
+
 	WARN_ON(shmem->base.import_attach);
 
-	return drm_gem_shmem_get_pages(shmem);
+	err = drm_gem_shmem_set_unpurgeable_and_unevictable(shmem);
+	if (err)
+		return err;
+
+	err = drm_gem_shmem_get_pages(shmem);
+	if (err) {
+		drm_gem_shmem_set_purgeable_and_evictable(shmem);
+		return err;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_gem_shmem_pin);
 
@@ -281,6 +616,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 	WARN_ON(shmem->base.import_attach);
 
 	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_set_purgeable_and_evictable(shmem);
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
@@ -365,8 +701,18 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 	if (ret)
 		return ret;
+
+	ret = drm_gem_shmem_set_unpurgeable_and_unevictable_locked(shmem);
+	if (ret)
+		goto unlock;
+
 	ret = drm_gem_shmem_vmap_locked(shmem, map);
+	if (ret)
+		drm_gem_shmem_set_purgeable_and_evictable_locked(shmem);
+	else
+		drm_gem_shmem_update_pages_state_locked(shmem);
 
+unlock:
 	if (obj->import_attach)
 		mutex_unlock(&shmem->vmap_lock);
 	else
@@ -420,6 +766,8 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 		dma_resv_lock(shmem->base.resv, NULL);
 
 	drm_gem_shmem_vunmap_locked(shmem, map);
+	drm_gem_shmem_update_pages_state_locked(shmem);
+	drm_gem_shmem_set_purgeable_and_evictable_locked(shmem);
 
 	if (obj->import_attach)
 		mutex_unlock(&shmem->vmap_lock);
@@ -465,12 +813,86 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 
 	madv = shmem->madv;
 
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
 	dma_resv_unlock(shmem->base.resv);
 
 	return (madv >= 0);
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
 
+/**
+ * drm_gem_shmem_swap_in_locked() - Moves shmem GEM back to memory and enables
+ *                                  hardware access to the memory.
+ * @shmem: shmem GEM object
+ *
+ * This function moves shmem GEM back to memory if it was previously evicted
+ * by the memory shrinker. The GEM is ready to use on success.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_swap_in_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct sg_table *sgt;
+	int err;
+
+	lockdep_assert_held(&obj->resv->lock.base);
+
+	if (shmem->evicted) {
+		err = drm_gem_shmem_acquire_pages_locked(shmem);
+		if (err)
+			return err;
+
+		sgt = drm_gem_shmem_get_sg_table(shmem);
+		if (IS_ERR(sgt))
+			return PTR_ERR(sgt);
+
+		err = dma_map_sgtable(obj->dev->dev, sgt,
+				      DMA_BIDIRECTIONAL, 0);
+		if (err) {
+			sg_free_table(sgt);
+			kfree(sgt);
+			return err;
+		}
+
+		shmem->sgt = sgt;
+		shmem->evicted = false;
+
+		drm_gem_shmem_update_pages_state_locked(shmem);
+
+		if (shmem->swap_in) {
+			err = shmem->swap_in(shmem);
+			if (err)
+				return err;
+		}
+	}
+
+	if (!shmem->pages)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_swap_in_locked);
+
+static void drm_gem_shmem_unpin_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_device *dev = obj->dev;
+
+	if (shmem->evicted)
+		return;
+
+	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	drm_gem_shmem_release_pages_locked(shmem);
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+
+	sg_free_table(shmem->sgt);
+	kfree(shmem->sgt);
+	shmem->sgt = NULL;
+}
+
 void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
@@ -501,17 +923,6 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
 
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
-{
-	if (!dma_resv_trylock(shmem->base.resv))
-		return false;
-	drm_gem_shmem_purge_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-
-	return true;
-}
-EXPORT_SYMBOL(drm_gem_shmem_purge);
-
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
@@ -561,22 +972,31 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	struct page *page;
 	pgoff_t page_offset;
+	bool pages_inactive;
+	int err;
 
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
-	if (page_offset >= num_pages ||
-	    WARN_ON_ONCE(!shmem->pages) ||
-	    shmem->madv < 0) {
+	pages_inactive = (shmem->evicted || shmem->madv < 0 || !shmem->pages_use_count);
+	WARN_ON_ONCE(!shmem->pages ^ pages_inactive);
+
+	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
+		err = drm_gem_shmem_swap_in_locked(shmem);
+		if (err) {
+			ret = VM_FAULT_OOM;
+			goto unlock;
+		}
+
 		page = shmem->pages[page_offset];
 
 		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
-
+unlock:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
@@ -586,13 +1006,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
-
-	WARN_ON(shmem->base.import_attach);
-
-	ret = drm_gem_shmem_get_pages(shmem);
-	WARN_ON_ONCE(ret != 0);
 
+	drm_gem_shmem_get_pages_no_fail(shmem);
 	drm_gem_vm_open(vma);
 }
 
@@ -660,9 +1075,13 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent)
 {
+	drm_printf_indent(p, indent, "eviction_disable_count=%u\n", shmem->eviction_disable_count);
+	drm_printf_indent(p, indent, "purge_disable_count=%u\n", shmem->purge_disable_count);
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
+	drm_printf_indent(p, indent, "evicted=%d\n", shmem->evicted);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
+	drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
 }
 EXPORT_SYMBOL(drm_gem_shmem_print_info);
 
@@ -735,6 +1154,10 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	shmem->sgt = sgt;
 
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_update_pages_state_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
 	return sgt;
 
 err_free_sgt:
@@ -781,6 +1204,255 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+static struct drm_gem_shmem_shrinker *
+to_drm_shrinker(struct shrinker *shrinker)
+{
+	return container_of(shrinker, struct drm_gem_shmem_shrinker, base);
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
+				     struct shrink_control *sc)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
+	u64 count = READ_ONCE(gem_shrinker->shrinkable_count);
+
+	if (count >= SHRINK_EMPTY)
+		return SHRINK_EMPTY - 1;
+
+	return count ?: SHRINK_EMPTY;
+}
+
+static unsigned long drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int err;
+
+	if (!drm_gem_shmem_is_evictable(shmem))
+		return 0;
+
+	if (shmem->evict) {
+		err = shmem->evict(shmem);
+		if (err)
+			return 0;
+	}
+
+	WARN_ON(!drm_gem_shmem_is_evictable(shmem));
+	WARN_ON(shmem->madv < 0);
+	WARN_ON(shmem->evicted);
+
+	drm_gem_shmem_unpin_pages_locked(shmem);
+
+	shmem->evicted = true;
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	return obj->size >> PAGE_SHIFT;
+}
+
+static unsigned long drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int err;
+
+	if (!drm_gem_shmem_is_purgeable(shmem))
+		return 0;
+
+	if (shmem->purge) {
+		err = shmem->purge(shmem);
+		if (err)
+			return 0;
+	}
+
+	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
+	WARN_ON(shmem->madv < 0);
+
+	drm_gem_shmem_unpin_pages_locked(shmem);
+	drm_gem_free_mmap_offset(obj);
+
+	/* Our goal here is to return as much of the memory as
+	 * is possible back to the system as we are called from OOM.
+	 * To do this we must instruct the shmfs to drop all of its
+	 * backing pages, *now*.
+	 */
+	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
+
+	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
+
+	shmem->madv = -1;
+	drm_gem_shmem_update_pages_state_locked(shmem);
+
+	return obj->size >> PAGE_SHIFT;
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_run_objects_scan(struct shrinker *shrinker,
+					unsigned long nr_to_scan,
+					bool *lock_contention,
+					bool evict)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
+	struct drm_gem_shmem_object *shmem;
+	struct list_head still_in_list;
+	struct drm_gem_object *obj;
+	unsigned long freed = 0;
+	struct list_head *lru;
+	size_t page_count;
+
+	INIT_LIST_HEAD(&still_in_list);
+
+	mutex_lock(&gem_shrinker->lock);
+
+	if (evict)
+		lru = &gem_shrinker->lru_evictable;
+	else
+		lru = &gem_shrinker->lru_purgeable;
+
+	while (freed < nr_to_scan) {
+		shmem = list_first_entry_or_null(lru, typeof(*shmem), madv_list);
+		if (!shmem)
+			break;
+
+		obj = &shmem->base;
+		page_count = obj->size >> PAGE_SHIFT;
+		list_move_tail(&shmem->madv_list, &still_in_list);
+
+		if (evict && get_nr_swap_pages() < page_count)
+			continue;
+
+		/*
+		 * If it's in the process of being freed, gem_object->free()
+		 * may be blocked on lock waiting to remove it.  So just
+		 * skip it.
+		 */
+		if (!kref_get_unless_zero(&obj->refcount))
+			continue;
+
+		mutex_unlock(&gem_shrinker->lock);
+
+		/* prevent racing with job-submission code paths */
+		if (!dma_resv_trylock(obj->resv)) {
+			*lock_contention |= true;
+			goto shrinker_lock;
+		}
+
+		/* prevent racing with the dma-buf exporting */
+		if (!mutex_trylock(&gem_shrinker->dev->object_name_lock)) {
+			*lock_contention |= true;
+			goto resv_unlock;
+		}
+
+		/* check whether h/w uses this object */
+		if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_WRITE))
+			goto object_name_unlock;
+
+		if (evict)
+			freed += drm_gem_shmem_evict(shmem);
+		else
+			freed += drm_gem_shmem_purge(shmem);
+
+object_name_unlock:
+		mutex_unlock(&gem_shrinker->dev->object_name_lock);
+resv_unlock:
+		dma_resv_unlock(obj->resv);
+shrinker_lock:
+		drm_gem_object_put(&shmem->base);
+		mutex_lock(&gem_shrinker->lock);
+	}
+
+	list_splice_tail(&still_in_list, lru);
+
+	mutex_unlock(&gem_shrinker->lock);
+
+	return freed;
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
+				    struct shrink_control *sc)
+{
+	unsigned long nr_to_scan = sc->nr_to_scan;
+	bool lock_contention = false;
+	unsigned long freed;
+
+	/* purge as many objects as we can */
+	freed = drm_gem_shmem_shrinker_run_objects_scan(shrinker, nr_to_scan,
+							&lock_contention, false);
+	nr_to_scan -= freed;
+
+	/* evict as many objects as we can */
+	if (freed < nr_to_scan)
+		freed += drm_gem_shmem_shrinker_run_objects_scan(shrinker,
+								 nr_to_scan,
+								 &lock_contention,
+								 true);
+
+	return (!freed && !lock_contention) ? SHRINK_STOP : freed;
+}
+
+/**
+ * drm_gem_shmem_shrinker_register() - Register shmem shrinker
+ * @dev: DRM device
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_shrinker_register(struct drm_device *dev)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker;
+	int err;
+
+	if (WARN_ON(dev->shmem_shrinker))
+		return -EBUSY;
+
+	gem_shrinker = kzalloc(sizeof(*gem_shrinker), GFP_KERNEL);
+	if (!gem_shrinker)
+		return -ENOMEM;
+
+	gem_shrinker->base.count_objects = drm_gem_shmem_shrinker_count_objects;
+	gem_shrinker->base.scan_objects = drm_gem_shmem_shrinker_scan_objects;
+	gem_shrinker->base.seeks = DEFAULT_SEEKS;
+	gem_shrinker->dev = dev;
+
+	INIT_LIST_HEAD(&gem_shrinker->lru_purgeable);
+	INIT_LIST_HEAD(&gem_shrinker->lru_evictable);
+	INIT_LIST_HEAD(&gem_shrinker->lru_evicted);
+	INIT_LIST_HEAD(&gem_shrinker->lru_active);
+	mutex_init(&gem_shrinker->lock);
+
+	dev->shmem_shrinker = gem_shrinker;
+
+	err = register_shrinker(&gem_shrinker->base);
+	if (err) {
+		dev->shmem_shrinker = NULL;
+		kfree(gem_shrinker);
+		return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_shrinker_register);
+
+/**
+ * drm_gem_shmem_shrinker_unregister() - Unregister shmem shrinker
+ * @dev: DRM device
+ */
+void drm_gem_shmem_shrinker_unregister(struct drm_device *dev)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = dev->shmem_shrinker;
+
+	if (gem_shrinker) {
+		unregister_shrinker(&gem_shrinker->base);
+		WARN_ON(!list_empty(&gem_shrinker->lru_purgeable));
+		WARN_ON(!list_empty(&gem_shrinker->lru_evictable));
+		WARN_ON(!list_empty(&gem_shrinker->lru_evicted));
+		WARN_ON(!list_empty(&gem_shrinker->lru_active));
+		mutex_destroy(&gem_shrinker->lock);
+		dev->shmem_shrinker = NULL;
+		kfree(gem_shrinker);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_shrinker_unregister);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS(DMA_BUF);
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 9923c7a6885e..929546cad894 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -16,6 +16,7 @@ struct drm_vblank_crtc;
 struct drm_vma_offset_manager;
 struct drm_vram_mm;
 struct drm_fb_helper;
+struct drm_gem_shmem_shrinker;
 
 struct inode;
 
@@ -277,6 +278,9 @@ struct drm_device {
 	/** @vram_mm: VRAM MM memory manager */
 	struct drm_vram_mm *vram_mm;
 
+	/** @shmem_shrinker: SHMEM GEM memory shrinker */
+	struct drm_gem_shmem_shrinker *shmem_shrinker;
+
 	/**
 	 * @switch_power_state:
 	 *
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 6f2b8fee620c..638cb16a4576 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -6,6 +6,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/shrinker.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -15,6 +16,7 @@
 struct dma_buf_attachment;
 struct drm_mode_create_dumb;
 struct drm_printer;
+struct drm_device;
 struct sg_table;
 
 /**
@@ -43,8 +45,8 @@ struct drm_gem_shmem_object {
 	 * @madv: State for madvise
 	 *
 	 * 0 is active/inuse.
+	 * 1 is not-needed/can-be-purged
 	 * A negative value is the object is purged.
-	 * Positive values are driver specific and not used by the helpers.
 	 */
 	int madv;
 
@@ -96,6 +98,80 @@ struct drm_gem_shmem_object {
 	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
 	bool map_wc;
+
+	/**
+	 * @eviction_disable_count:
+	 *
+	 * The shmem pages are disallowed to be evicted by the memory shrinker
+	 * while count is non-zero. Used internally by memory shrinker.
+	 */
+	unsigned int eviction_disable_count;
+
+	/**
+	 * @purge_disable_count:
+	 *
+	 * The shmem pages are disallowed to be purged by the memory shrinker
+	 * while count is non-zero. Used internally by memory shrinker.
+	 */
+	unsigned int purge_disable_count;
+
+	/**
+	 * @evicted: True if shmem pages were evicted by the memory shrinker.
+	 * Used internally by memory shrinker.
+	 */
+	bool evicted;
+
+	/**
+	 * @pages_accounted_by_shrinker: True if shmem pages can be evicted or
+	 * purged by the memory shrinker. Used internally by memory shrinker
+	 * to prevent double accounting of shrinkable pages.
+	 */
+	bool pages_accounted_by_shrinker;
+
+	/**
+	 * @swap_in:
+	 *
+	 * Invoked by shmem shrinker after pinning shmem GEM pages to memory.
+	 * GEM's DMA reservation is locked by the shrinker during invocation.
+	 * This callback is intended for DRM drivers that need to do something
+	 * special to make pages accessible to hardware after they've been
+	 * pinned.
+	 *
+	 * Returns 0 on success, or -errno on error.
+	 *
+	 * This callback is optional and should be set by drivers.
+	 */
+	int (*swap_in)(struct drm_gem_shmem_object *shmem);
+
+	/**
+	 * @evict:
+	 *
+	 * Invoked by shmem shrinker before unpinning shmem GEM pages from memory.
+	 * GEM's DMA reservation is locked by the shrinker during invocation.
+	 * This callback is intended for DRM drivers that need to do something
+	 * special to make pages unaccessible to hardware before they are
+	 * swapped out.
+	 *
+	 * Returns 0 on success, or -errno on error.
+	 *
+	 * This callback is optional and should be set by drivers.
+	 */
+	int (*evict)(struct drm_gem_shmem_object *shmem);
+
+	/**
+	 * @purge:
+	 *
+	 * Invoked by shmem shrinker before permanently purging shmem GEM pages.
+	 * GEM's DMA reservation is locked by the shrinker during invocation.
+	 * This callback is intended for DRM drivers that need to do something
+	 * special to make pages unaccessible to hardware before they are
+	 * purged.
+	 *
+	 * Returns 0 on success, or -errno on error.
+	 *
+	 * This callback is optional and should be set by drivers.
+	 */
+	int (*purge)(struct drm_gem_shmem_object *shmem);
 };
 
 #define to_drm_gem_shmem_obj(obj) \
@@ -116,6 +192,9 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 
+int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_set_purgeable_and_evictable(struct drm_gem_shmem_object *shmem);
+
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
 	return (shmem->madv > 0) &&
@@ -123,8 +202,8 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
+int drm_gem_shmem_swap_in_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
@@ -267,6 +346,38 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+/**
+ * struct drm_gem_shmem_shrinker - Generic memory shrinker for shmem GEMs
+ */
+struct drm_gem_shmem_shrinker {
+	/** @base: Shrinker for purging shmem GEM objects */
+	struct shrinker base;
+
+	/** @lock: Protects @lru_* */
+	struct mutex lock;
+
+	/** @lru_purgeable: List of shmem GEM objects that can be purged */
+	struct list_head lru_purgeable;
+
+	/** @lru_active: List of active shmem GEM objects */
+	struct list_head lru_active;
+
+	/** @lru_evictable: List of shmem GEM objects that can be evicted */
+	struct list_head lru_evictable;
+
+	/** @lru_evicted: List of evicted shmem GEM objects */
+	struct list_head lru_evicted;
+
+	/** @dev: DRM device that uses this shrinker */
+	struct drm_device *dev;
+
+	/** @shrinkable_count: Count of shmem GEM pages to be purged and evicted */
+	u64 shrinkable_count;
+};
+
+int drm_gem_shmem_shrinker_register(struct drm_device *dev);
+void drm_gem_shmem_shrinker_unregister(struct drm_device *dev);
+
 /*
  * Driver ops
  */
-- 
2.35.1

