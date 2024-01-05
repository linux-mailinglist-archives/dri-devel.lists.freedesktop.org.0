Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA0825A88
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B4C10E694;
	Fri,  5 Jan 2024 18:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFFA10E67C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480452;
 bh=aX78HPzWZ5Oplw/Z9BqINCxZ65QTKKO+E85eRzWNe7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEQPp3pmDG+iVYgJIHsvF2gCGoCgY5eTAg8EJmsHXStLWn22zl361EWtYYAMHWN0O
 v7AoWXW5gn7FQHdeujiNDZlGo9xCXPdiEsvwbz7yzhQRJzTJKHpiWKYy2kKyNO45gL
 iLBD3pJU8/jATothCgc5M/L+SYC72gW6bUprIJhH3PUq98JLvxUgg+H3davLbFNXaU
 54SDKYwrHQwcYJktMmp7AZtlm9qH/seJlZOVkS8mhaJIlkThhLqp9htWmmtAJa3/l8
 TJsNcfN7H4vTbQdFbdcBYBxWw82mtGQvWBeBwSYZAZrjn31NpzgUp6tQCacxUJpF21
 xg7/Cke6XNETg==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 928B3378204D;
 Fri,  5 Jan 2024 18:47:31 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v19 30/30] drm/panfrost: Switch to generic memory shrinker
Date: Fri,  5 Jan 2024 21:46:24 +0300
Message-ID: <20240105184624.508603-31-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace Panfrost's custom memory shrinker with a common drm-shmem
memory shrinker.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   4 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  29 ++--
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  60 ++++----
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 --
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 140 ------------------
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 ++-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  24 ++-
 include/drm/drm_gem_shmem_helper.h            |   7 -
 10 files changed, 83 insertions(+), 213 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 7d2fe12bd793..56e88378079b 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -89,8 +89,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	if (ret)
 		goto err_release;
 
-	INIT_LIST_HEAD(&shmem->madv_list);
-
 	if (!private) {
 		/*
 		 * Our buffers are kept pinned, so allocating them
@@ -619,6 +617,8 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	drm_WARN_ON_ONCE(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
+
 	drm_gem_shmem_shrinker_put_pages_locked(shmem);
 	drm_gem_free_mmap_offset(obj);
 
diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index 2c01c1e7523e..f2cb1ab0a32d 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -5,7 +5,6 @@ panfrost-y := \
 	panfrost_device.o \
 	panfrost_devfreq.o \
 	panfrost_gem.o \
-	panfrost_gem_shrinker.o \
 	panfrost_gpu.o \
 	panfrost_job.o \
 	panfrost_mmu.o \
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 62f7e3527385..cea6df9cd650 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -140,10 +140,6 @@ struct panfrost_device {
 		atomic_t pending;
 	} reset;
 
-	struct mutex shrinker_lock;
-	struct list_head shrinker_list;
-	struct shrinker *shrinker;
-
 	struct panfrost_devfreq pfdevfreq;
 
 	struct {
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a15d62f19afb..5c730d15a24d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -171,7 +171,6 @@ panfrost_lookup_bos(struct drm_device *dev,
 			break;
 		}
 
-		atomic_inc(&bo->gpu_usecount);
 		job->mappings[i] = mapping;
 	}
 
@@ -397,7 +396,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 {
 	struct panfrost_file_priv *priv = file_priv->driver_priv;
 	struct drm_panfrost_madvise *args = data;
-	struct panfrost_device *pfdev = dev->dev_private;
 	struct drm_gem_object *gem_obj;
 	struct panfrost_gem_object *bo;
 	int ret = 0;
@@ -410,11 +408,15 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	bo = to_panfrost_bo(gem_obj);
 
+	if (bo->is_heap) {
+		args->retained = 1;
+		goto out_put_object;
+	}
+
 	ret = dma_resv_lock_interruptible(bo->base.base.resv, NULL);
 	if (ret)
 		goto out_put_object;
 
-	mutex_lock(&pfdev->shrinker_lock);
 	mutex_lock(&bo->mappings.lock);
 	if (args->madv == PANFROST_MADV_DONTNEED) {
 		struct panfrost_gem_mapping *first;
@@ -440,17 +442,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	args->retained = drm_gem_shmem_madvise_locked(&bo->base, args->madv);
 
-	if (args->retained) {
-		if (args->madv == PANFROST_MADV_DONTNEED)
-			list_move_tail(&bo->base.madv_list,
-				       &pfdev->shrinker_list);
-		else if (args->madv == PANFROST_MADV_WILLNEED)
-			list_del_init(&bo->base.madv_list);
-	}
-
 out_unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
-	mutex_unlock(&pfdev->shrinker_lock);
 	dma_resv_unlock(bo->base.base.resv);
 out_put_object:
 	drm_gem_object_put(gem_obj);
@@ -635,9 +628,6 @@ static int panfrost_probe(struct platform_device *pdev)
 	ddev->dev_private = pfdev;
 	pfdev->ddev = ddev;
 
-	mutex_init(&pfdev->shrinker_lock);
-	INIT_LIST_HEAD(&pfdev->shrinker_list);
-
 	err = panfrost_device_init(pfdev);
 	if (err) {
 		if (err != -EPROBE_DEFER)
@@ -659,13 +649,13 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out1;
 
-	err = panfrost_gem_shrinker_init(ddev);
-	if (err)
-		goto err_out2;
+	err = drmm_gem_shmem_init(ddev);
+	if (err < 0)
+		goto err_unregister_dev;
 
 	return 0;
 
-err_out2:
+err_unregister_dev:
 	drm_dev_unregister(ddev);
 err_out1:
 	pm_runtime_disable(pfdev->dev);
@@ -682,7 +672,6 @@ static void panfrost_remove(struct platform_device *pdev)
 	struct drm_device *ddev = pfdev->ddev;
 
 	drm_dev_unregister(ddev);
-	panfrost_gem_shrinker_cleanup(ddev);
 
 	pm_runtime_get_sync(pfdev->dev);
 	pm_runtime_disable(pfdev->dev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8c26b7e41b95..05eb5a89c4ed 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -17,17 +17,6 @@
 static void panfrost_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
-	struct panfrost_device *pfdev = obj->dev->dev_private;
-
-	/*
-	 * Make sure the BO is no longer inserted in the shrinker list before
-	 * taking care of the destruction itself. If we don't do that we have a
-	 * race condition between this function and what's done in
-	 * panfrost_gem_shrinker_scan().
-	 */
-	mutex_lock(&pfdev->shrinker_lock);
-	list_del_init(&bo->base.madv_list);
-	mutex_unlock(&pfdev->shrinker_lock);
 
 	/*
 	 * If we still have mappings attached to the BO, there's a problem in
@@ -57,26 +46,23 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
 	return mapping;
 }
 
-static void
-panfrost_gem_teardown_mapping(struct panfrost_gem_mapping *mapping)
+static void panfrost_gem_mapping_release(struct kref *kref)
 {
+	struct panfrost_gem_mapping *mapping =
+		container_of(kref, struct panfrost_gem_mapping, refcount);
+	struct panfrost_gem_object *bo = mapping->obj;
+	struct panfrost_device *pfdev = bo->base.base.dev->dev_private;
+
+	/* Shrinker may purge the mapping at the same time. */
+	dma_resv_lock(mapping->obj->base.base.resv, NULL);
 	if (mapping->active)
 		panfrost_mmu_unmap(mapping);
+	dma_resv_unlock(mapping->obj->base.base.resv);
 
 	spin_lock(&mapping->mmu->mm_lock);
 	if (drm_mm_node_allocated(&mapping->mmnode))
 		drm_mm_remove_node(&mapping->mmnode);
 	spin_unlock(&mapping->mmu->mm_lock);
-}
-
-static void panfrost_gem_mapping_release(struct kref *kref)
-{
-	struct panfrost_gem_mapping *mapping =
-		container_of(kref, struct panfrost_gem_mapping, refcount);
-	struct panfrost_gem_object *bo = mapping->obj;
-	struct panfrost_device *pfdev = bo->base.base.dev->dev_private;
-
-	panfrost_gem_teardown_mapping(mapping);
 
 	/* On heap BOs, release the sgts created in the fault handler path. */
 	if (bo->sgts) {
@@ -117,12 +103,14 @@ void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping)
 	kref_put(&mapping->refcount, panfrost_gem_mapping_release);
 }
 
-void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo)
+void panfrost_gem_evict_mappings_locked(struct panfrost_gem_object *bo)
 {
 	struct panfrost_gem_mapping *mapping;
 
-	list_for_each_entry(mapping, &bo->mappings.list, node)
-		panfrost_gem_teardown_mapping(mapping);
+	list_for_each_entry(mapping, &bo->mappings.list, node) {
+		if (mapping->active)
+			panfrost_mmu_unmap(mapping);
+	}
 }
 
 int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv)
@@ -251,6 +239,25 @@ static size_t panfrost_gem_rss(struct drm_gem_object *obj)
 	return 0;
 }
 
+static int panfrost_shmem_evict(struct drm_gem_object *obj)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+
+	if (!drm_gem_shmem_is_purgeable(&bo->base))
+		return -EBUSY;
+
+	if (!mutex_trylock(&bo->mappings.lock))
+		return -EBUSY;
+
+	panfrost_gem_evict_mappings_locked(bo);
+
+	drm_gem_shmem_purge_locked(&bo->base);
+
+	mutex_unlock(&bo->mappings.lock);
+
+	return 0;
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -265,6 +272,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.status = panfrost_gem_status,
 	.rss = panfrost_gem_rss,
 	.vm_ops = &drm_gem_shmem_vm_ops,
+	.evict = panfrost_shmem_evict,
 };
 
 /**
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 7516b7ecf7fe..8ddc2d310d29 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -30,12 +30,6 @@ struct panfrost_gem_object {
 		struct mutex lock;
 	} mappings;
 
-	/*
-	 * Count the number of jobs referencing this BO so we don't let the
-	 * shrinker reclaim this object prematurely.
-	 */
-	atomic_t gpu_usecount;
-
 	/*
 	 * Object chunk size currently mapped onto physical memory
 	 */
@@ -86,7 +80,4 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
 void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
 void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 
-int panfrost_gem_shrinker_init(struct drm_device *dev);
-void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
-
 #endif /* __PANFROST_GEM_H__ */
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
deleted file mode 100644
index 7b4deba803ed..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ /dev/null
@@ -1,140 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright (C) 2019 Arm Ltd.
- *
- * Based on msm_gem_freedreno.c:
- * Copyright (C) 2016 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include <linux/list.h>
-
-#include <drm/drm_device.h>
-#include <drm/drm_gem_shmem_helper.h>
-
-#include "panfrost_device.h"
-#include "panfrost_gem.h"
-#include "panfrost_mmu.h"
-
-static bool panfrost_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
-{
-	return (shmem->madv > 0) &&
-		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
-		!shmem->base.dma_buf && !shmem->base.import_attach;
-}
-
-static unsigned long
-panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
-{
-	struct panfrost_device *pfdev = shrinker->private_data;
-	struct drm_gem_shmem_object *shmem;
-	unsigned long count = 0;
-
-	if (!mutex_trylock(&pfdev->shrinker_lock))
-		return 0;
-
-	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
-		if (panfrost_gem_shmem_is_purgeable(shmem))
-			count += shmem->base.size >> PAGE_SHIFT;
-	}
-
-	mutex_unlock(&pfdev->shrinker_lock);
-
-	return count;
-}
-
-static bool panfrost_gem_purge(struct drm_gem_object *obj)
-{
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
-	bool ret = false;
-
-	if (atomic_read(&bo->gpu_usecount))
-		return false;
-
-	if (!mutex_trylock(&bo->mappings.lock))
-		return false;
-
-	if (!dma_resv_trylock(shmem->base.resv))
-		goto unlock_mappings;
-
-	/* BO might have become unpurgeable if the last pages_use_count ref
-	 * was dropped, but the BO hasn't been destroyed yet.
-	 */
-	if (!panfrost_gem_shmem_is_purgeable(shmem))
-		goto unlock_mappings;
-
-	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge_locked(&bo->base);
-	ret = true;
-
-	dma_resv_unlock(shmem->base.resv);
-
-unlock_mappings:
-	mutex_unlock(&bo->mappings.lock);
-	return ret;
-}
-
-static unsigned long
-panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
-{
-	struct panfrost_device *pfdev = shrinker->private_data;
-	struct drm_gem_shmem_object *shmem, *tmp;
-	unsigned long freed = 0;
-
-	if (!mutex_trylock(&pfdev->shrinker_lock))
-		return SHRINK_STOP;
-
-	list_for_each_entry_safe(shmem, tmp, &pfdev->shrinker_list, madv_list) {
-		if (freed >= sc->nr_to_scan)
-			break;
-		if (panfrost_gem_shmem_is_purgeable(shmem) &&
-		    panfrost_gem_purge(&shmem->base)) {
-			freed += shmem->base.size >> PAGE_SHIFT;
-			list_del_init(&shmem->madv_list);
-		}
-	}
-
-	mutex_unlock(&pfdev->shrinker_lock);
-
-	if (freed > 0)
-		pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
-
-	return freed;
-}
-
-/**
- * panfrost_gem_shrinker_init - Initialize panfrost shrinker
- * @dev: DRM device
- *
- * This function registers and sets up the panfrost shrinker.
- */
-int panfrost_gem_shrinker_init(struct drm_device *dev)
-{
-	struct panfrost_device *pfdev = dev->dev_private;
-
-	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
-	if (!pfdev->shrinker)
-		return -ENOMEM;
-
-	pfdev->shrinker->count_objects = panfrost_gem_shrinker_count;
-	pfdev->shrinker->scan_objects = panfrost_gem_shrinker_scan;
-	pfdev->shrinker->private_data = pfdev;
-
-	shrinker_register(pfdev->shrinker);
-
-	return 0;
-}
-
-/**
- * panfrost_gem_shrinker_cleanup - Clean up panfrost shrinker
- * @dev: DRM device
- *
- * This function unregisters the panfrost shrinker.
- */
-void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
-{
-	struct panfrost_device *pfdev = dev->dev_private;
-
-	if (pfdev->shrinker)
-		shrinker_free(pfdev->shrinker);
-}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0c2dbf6ef2a5..9e26cb013191 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -289,6 +289,19 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
 }
 
+static int panfrost_objects_prepare(struct drm_gem_object **bos, int bo_count)
+{
+	struct panfrost_gem_object *bo;
+	int ret = 0;
+
+	while (!ret && bo_count--) {
+		bo = to_panfrost_bo(bos[bo_count]);
+		ret = bo->base.madv != PANFROST_MADV_WILLNEED ? -EINVAL : 0;
+	}
+
+	return ret;
+}
+
 int panfrost_job_push(struct panfrost_job *job)
 {
 	struct panfrost_device *pfdev = job->pfdev;
@@ -300,6 +313,10 @@ int panfrost_job_push(struct panfrost_job *job)
 	if (ret)
 		return ret;
 
+	ret = panfrost_objects_prepare(job->bos, job->bo_count);
+	if (ret)
+		goto unlock;
+
 	mutex_lock(&pfdev->sched_lock);
 	drm_sched_job_arm(&job->base);
 
@@ -341,7 +358,6 @@ static void panfrost_job_cleanup(struct kref *ref)
 			if (!job->mappings[i])
 				break;
 
-			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
 			panfrost_gem_mapping_put(job->mappings[i]);
 		}
 		kvfree(job->mappings);
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 4a0b4bf03f1a..22e18f7986e7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -328,6 +328,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE;
+	int ret = 0;
 
 	if (WARN_ON(mapping->active))
 		return 0;
@@ -335,15 +336,32 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (bo->noexec)
 		prot |= IOMMU_NOEXEC;
 
+	if (!obj->import_attach) {
+		/*
+		 * Don't allow shrinker to move pages while pages are mapped.
+		 * It's fine to move pages afterwards because shrinker will
+		 * take care of unmapping pages during eviction.
+		 */
+		ret = drm_gem_shmem_pin(shmem);
+		if (ret)
+			return ret;
+	}
+
 	sgt = drm_gem_shmem_get_pages_sgt(shmem);
-	if (WARN_ON(IS_ERR(sgt)))
-		return PTR_ERR(sgt);
+	if (WARN_ON(IS_ERR(sgt))) {
+		ret = PTR_ERR(sgt);
+		goto unpin;
+	}
 
 	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
 		   prot, sgt);
 	mapping->active = true;
 
-	return 0;
+unpin:
+	if (!obj->import_attach)
+		drm_gem_shmem_unpin(shmem);
+
+	return ret;
 }
 
 void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 167f00f089de..9c6bb00260fc 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -61,13 +61,6 @@ struct drm_gem_shmem_object {
 	 */
 	int madv;
 
-	/**
-	 * @madv_list: List entry for madvise tracking
-	 *
-	 * Typically used by drivers to track purgeable objects
-	 */
-	struct list_head madv_list;
-
 	/**
 	 * @sgt: Scatter/gather table for imported PRIME buffers
 	 */
-- 
2.43.0

