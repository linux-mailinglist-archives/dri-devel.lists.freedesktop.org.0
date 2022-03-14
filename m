Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20214D8FC8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 23:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8F910E1D1;
	Mon, 14 Mar 2022 22:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814B89951
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 22:44:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A87E11F42F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647297858;
 bh=lqIPNgHcK+R8RUthJvDL/DlyQjBceMvg3jqjByDDlWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P5spa+LjZqn9fP03vZ5eSHU2Uovd6b5RaczYBbB9jNsqXbfD1idsVRL0ztXzeohKR
 dMFlE59CSdzrWvD1nGboZMBFrF/+l6gxjELczROOMciJLE16rYKLrgK2Vj9blHBZ7O
 h8SHNQQDVOmTBx1RXqO/ldKy4TffeSkqsqUoNrbUx2r0GxsLU+6oaJU1AYsrBiuGLz
 7XBLXVZDkyuZub8oMLHVXCbAaCube74CyCFHSxaNfjOt8gqtjM2Ryt7yzAJ21Gt/y3
 CUBFPi2G+hQ/h1ypJAqhpsRFPbqsRVf63/sdk66iDgBHREkQAHUgskxpaaeW6adWD4
 TA7nz39Pck+4w==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v2 6/8] drm/shmem-helper: Add generic memory shrinker
Date: Tue, 15 Mar 2022 01:42:51 +0300
Message-Id: <20220314224253.236359-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a common DRM SHMEM shrinker. It allows to reduce code
duplication among DRM drivers, it also handles complicated lockings
for the drivers. This is initial version of the shrinker that covers
basic needs of GPU drivers.

This patch is based on a couple ideas borrowed from Rob's Clark MSM
shrinker and Thomas' Zimmermann variant of SHMEM shrinker.

GPU drivers that want to use generic DRM memory shrinker must support
generic GEM reservations.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 194 +++++++++++++++++++++++++
 include/drm/drm_device.h               |   4 +
 include/drm/drm_gem.h                  |  11 ++
 include/drm/drm_gem_shmem_helper.h     |  25 ++++
 4 files changed, 234 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 37009418cd28..35be2ee98f11 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -139,6 +139,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	/* take out shmem GEM object from the memory shrinker */
+	drm_gem_shmem_madvise(shmem, 0);
+
 	WARN_ON(shmem->vmap_use_count);
 
 	if (obj->import_attach) {
@@ -163,6 +166,42 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
+static void drm_gem_shmem_update_purgeable_status(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
+	size_t page_count = obj->size >> PAGE_SHIFT;
+
+	if (!gem_shrinker || obj->import_attach || !obj->funcs->purge)
+		return;
+
+	mutex_lock(&shmem->vmap_lock);
+	mutex_lock(&shmem->pages_lock);
+	mutex_lock(&gem_shrinker->lock);
+
+	if (shmem->madv < 0) {
+		list_del_init(&shmem->madv_list);
+		goto unlock;
+	} else if (shmem->madv > 0) {
+		if (!list_empty(&shmem->madv_list))
+			goto unlock;
+
+		WARN_ON(gem_shrinker->shrinkable_count + page_count < page_count);
+		gem_shrinker->shrinkable_count += page_count;
+
+		list_add_tail(&shmem->madv_list, &gem_shrinker->lru);
+	} else if (!list_empty(&shmem->madv_list)) {
+		list_del_init(&shmem->madv_list);
+
+		WARN_ON(gem_shrinker->shrinkable_count < page_count);
+		gem_shrinker->shrinkable_count -= page_count;
+	}
+unlock:
+	mutex_unlock(&gem_shrinker->lock);
+	mutex_unlock(&shmem->pages_lock);
+	mutex_unlock(&shmem->vmap_lock);
+}
+
 static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
@@ -366,6 +405,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	ret = drm_gem_shmem_vmap_locked(shmem, map);
 	mutex_unlock(&shmem->vmap_lock);
 
+	drm_gem_shmem_update_purgeable_status(shmem);
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_vmap);
@@ -409,6 +450,8 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 	mutex_lock(&shmem->vmap_lock);
 	drm_gem_shmem_vunmap_locked(shmem, map);
 	mutex_unlock(&shmem->vmap_lock);
+
+	drm_gem_shmem_update_purgeable_status(shmem);
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
@@ -451,6 +494,8 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 
 	mutex_unlock(&shmem->pages_lock);
 
+	drm_gem_shmem_update_purgeable_status(shmem);
+
 	return (madv >= 0);
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
@@ -763,6 +808,155 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
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
+	u64 count = gem_shrinker->shrinkable_count;
+
+	if (count >= SHRINK_EMPTY)
+		return SHRINK_EMPTY - 1;
+
+	return count ?: SHRINK_EMPTY;
+}
+
+static unsigned long
+drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
+				    struct shrink_control *sc)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
+	struct drm_gem_shmem_object *shmem;
+	struct list_head still_in_list;
+	bool lock_contention = true;
+	struct drm_gem_object *obj;
+	unsigned long freed = 0;
+
+	INIT_LIST_HEAD(&still_in_list);
+
+	mutex_lock(&gem_shrinker->lock);
+
+	while (freed < sc->nr_to_scan) {
+		shmem = list_first_entry_or_null(&gem_shrinker->lru,
+						 typeof(*shmem), madv_list);
+		if (!shmem)
+			break;
+
+		obj = &shmem->base;
+		list_move_tail(&shmem->madv_list, &still_in_list);
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
+		/* prevent racing with job submission code paths */
+		if (!dma_resv_trylock(obj->resv))
+			goto shrinker_lock;
+
+		/* prevent racing with the dma-buf exporting */
+		if (!mutex_trylock(&gem_shrinker->dev->object_name_lock))
+			goto resv_unlock;
+
+		if (!mutex_trylock(&shmem->vmap_lock))
+			goto object_name_unlock;
+
+		if (!mutex_trylock(&shmem->pages_lock))
+			goto vmap_unlock;
+
+		lock_contention = false;
+
+		/* check whether h/w uses this object */
+		if (!dma_resv_test_signaled(obj->resv, true))
+			goto pages_unlock;
+
+		/* GEM may've become unpurgeable while shrinker was unlocked */
+		if (!drm_gem_shmem_is_purgeable(shmem))
+			goto pages_unlock;
+
+		freed += obj->funcs->purge(obj);
+pages_unlock:
+		mutex_unlock(&shmem->pages_lock);
+vmap_unlock:
+		mutex_unlock(&shmem->vmap_lock);
+object_name_unlock:
+		mutex_unlock(&gem_shrinker->dev->object_name_lock);
+resv_unlock:
+		dma_resv_unlock(obj->resv);
+shrinker_lock:
+		drm_gem_object_put(&shmem->base);
+		mutex_lock(&gem_shrinker->lock);
+	}
+
+	list_splice_tail(&still_in_list, &gem_shrinker->lru);
+	WARN_ON(gem_shrinker->shrinkable_count < freed);
+	gem_shrinker->shrinkable_count -= freed;
+
+	mutex_unlock(&gem_shrinker->lock);
+
+	if (!freed && !lock_contention)
+		return SHRINK_STOP;
+
+	return freed;
+}
+
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
+	INIT_LIST_HEAD(&gem_shrinker->lru);
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
+void drm_gem_shmem_shrinker_unregister(struct drm_device *dev)
+{
+	struct drm_gem_shmem_shrinker *gem_shrinker = dev->shmem_shrinker;
+
+	if (gem_shrinker) {
+		unregister_shrinker(&gem_shrinker->base);
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
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index e2941cee14b6..cdb99cfbf0bc 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -172,6 +172,17 @@ struct drm_gem_object_funcs {
 	 * This is optional but necessary for mmap support.
 	 */
 	const struct vm_operations_struct *vm_ops;
+
+	/**
+	 * @purge:
+	 *
+	 * Releases the GEM object's allocated backing storage to the system.
+	 *
+	 * Returns the number of pages that have been freed by purging the GEM object.
+	 *
+	 * This callback is used by the GEM shrinker.
+	 */
+	unsigned long (*purge)(struct drm_gem_object *obj);
 };
 
 /**
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d0a57853c188..455254f131f6 100644
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
@@ -272,6 +274,29 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
 	return drm_gem_shmem_mmap(shmem, vma);
 }
 
+/**
+ * struct drm_gem_shmem_shrinker - Generic memory shrinker for shmem GEMs
+ */
+struct drm_gem_shmem_shrinker {
+	/** @base: Shrinker for purging shmem GEM objects */
+	struct shrinker base;
+
+	/** @lock: Protects @lru */
+	struct mutex lock;
+
+	/** @lru: List of shmem GEM objects available for purging */
+	struct list_head lru;
+
+	/** @dev: DRM device that uses this shrinker */
+	struct drm_device *dev;
+
+	/** @shrinkable_count: Count of shmem GEM pages to be purged */
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

