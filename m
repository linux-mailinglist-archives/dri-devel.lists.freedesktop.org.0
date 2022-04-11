Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019774FC732
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8C610E38D;
	Mon, 11 Apr 2022 22:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4428F10E37B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:00:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 9CDBA1F438CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649714438;
 bh=fn5iGfrH7Doc77PZ/AjsmRZxm95B+x0ULuINeaTwWcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jS4tPgha2YFhH2EGV7voM/toaDcNss/uxjXzwvWz6Ibcjk6Vmu9c9hQw/OtV1vI+c
 eoLg+3CJV82AgLkFugnISzWUNnJBjFGGrEUAM1078hpdICYkv2bKtT71T/jbWnaQ4h
 HSxFvGyzRzd02YR9VKU0aTPj3WC3EGdeb5qovUBGMgAURmAARA/HWFogMA8JMaaGKx
 LVe6XCc4m1M6pYkkFcwlEJQAoRtWvzGyj6GstqZ2AJMzUwPTx/PYYugt602XKGDgNH
 pEb8cQSx+KccNt89GptkkHuDx7smsHkFtgPkdtNjfA2qATuqxbY6sMTSqn5NthtnFT
 wtYi8ZrTPekjg==
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
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 13/15] drm/panfrost: Switch to generic memory shrinker
Date: Tue, 12 Apr 2022 00:59:35 +0300
Message-Id: <20220411215937.281655-14-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
References: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
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

Replace Panfrost's memory shrinker with a generic DRM SHMEM memory
shrinker.

Tested-by: Steven Price <steven.price@arm.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  19 +--
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  30 +++--
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 --
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ------------------
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 ++-
 7 files changed, 39 insertions(+), 164 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index b71935862417..ecf0864cb515 100644
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
index 8b25278f34c8..fe04b21fc044 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -115,10 +115,6 @@ struct panfrost_device {
 		atomic_t pending;
 	} reset;
 
-	struct mutex shrinker_lock;
-	struct list_head shrinker_list;
-	struct shrinker shrinker;
-
 	struct panfrost_devfreq pfdevfreq;
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7fcbc2a5b6cd..57a93555813f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -160,7 +160,6 @@ panfrost_lookup_bos(struct drm_device *dev,
 			break;
 		}
 
-		atomic_inc(&bo->gpu_usecount);
 		job->mappings[i] = mapping;
 	}
 
@@ -391,7 +390,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 {
 	struct panfrost_file_priv *priv = file_priv->driver_priv;
 	struct drm_panfrost_madvise *args = data;
-	struct panfrost_device *pfdev = dev->dev_private;
 	struct drm_gem_object *gem_obj;
 	struct panfrost_gem_object *bo;
 	int ret = 0;
@@ -404,7 +402,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	bo = to_panfrost_bo(gem_obj);
 
-	mutex_lock(&pfdev->shrinker_lock);
 	mutex_lock(&bo->mappings.lock);
 	if (args->madv == PANFROST_MADV_DONTNEED) {
 		struct panfrost_gem_mapping *first;
@@ -430,17 +427,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
 
-	if (args->retained) {
-		if (args->madv == PANFROST_MADV_DONTNEED)
-			list_add_tail(&bo->base.madv_list,
-				      &pfdev->shrinker_list);
-		else if (args->madv == PANFROST_MADV_WILLNEED)
-			list_del_init(&bo->base.madv_list);
-	}
-
 out_unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
-	mutex_unlock(&pfdev->shrinker_lock);
 
 	drm_gem_object_put(gem_obj);
 	return ret;
@@ -571,9 +559,6 @@ static int panfrost_probe(struct platform_device *pdev)
 	ddev->dev_private = pfdev;
 	pfdev->ddev = ddev;
 
-	mutex_init(&pfdev->shrinker_lock);
-	INIT_LIST_HEAD(&pfdev->shrinker_list);
-
 	err = panfrost_device_init(pfdev);
 	if (err) {
 		if (err != -EPROBE_DEFER)
@@ -595,7 +580,7 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out1;
 
-	panfrost_gem_shrinker_init(ddev);
+	drm_gem_shmem_shrinker_register(ddev);
 
 	return 0;
 
@@ -613,8 +598,8 @@ static int panfrost_remove(struct platform_device *pdev)
 	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
 	struct drm_device *ddev = pfdev->ddev;
 
+	drm_gem_shmem_shrinker_unregister(ddev);
 	drm_dev_unregister(ddev);
-	panfrost_gem_shrinker_cleanup(ddev);
 
 	pm_runtime_get_sync(pfdev->dev);
 	pm_runtime_disable(pfdev->dev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 293e799e2fe8..b4a7ea7c8f00 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -19,16 +19,6 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
 	struct panfrost_device *pfdev = obj->dev->dev_private;
 
-	/*
-	 * Make sure the BO is no longer inserted in the shrinker list before
-	 * taking care of the destruction itself. If we don't do that we have a
-	 * race condition between this function and what's done in
-	 * panfrost_gem_shrinker_scan().
-	 */
-	mutex_lock(&pfdev->shrinker_lock);
-	list_del_init(&bo->base.madv_list);
-	mutex_unlock(&pfdev->shrinker_lock);
-
 	/*
 	 * If we still have mappings attached to the BO, there's a problem in
 	 * our refcounting.
@@ -195,6 +185,22 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	return drm_gem_shmem_pin(&bo->base);
 }
 
+static unsigned long panfrost_gem_purge(struct drm_gem_object *obj)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+
+	if (!mutex_trylock(&bo->mappings.lock))
+		return 0;
+
+	panfrost_gem_teardown_mappings_locked(bo);
+	drm_gem_shmem_purge_locked(shmem);
+
+	mutex_unlock(&bo->mappings.lock);
+
+	return obj->size >> PAGE_SHIFT;
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -207,6 +213,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
+	.purge = panfrost_gem_purge,
 };
 
 /**
@@ -266,6 +273,9 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (!bo->is_heap)
+		drm_gem_shmem_set_purgeable(shmem);
+
 	return bo;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8088d5fd8480..09da064f1c07 100644
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
 	bool noexec		:1;
 	bool is_heap		:1;
 };
@@ -84,7 +78,4 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
 void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
 void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 
-void panfrost_gem_shrinker_init(struct drm_device *dev);
-void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
-
 #endif /* __PANFROST_GEM_H__ */
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
deleted file mode 100644
index 77e7cb6d1ae3..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ /dev/null
@@ -1,122 +0,0 @@
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
-static unsigned long
-panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
-{
-	struct panfrost_device *pfdev =
-		container_of(shrinker, struct panfrost_device, shrinker);
-	struct drm_gem_shmem_object *shmem;
-	unsigned long count = 0;
-
-	if (!mutex_trylock(&pfdev->shrinker_lock))
-		return 0;
-
-	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
-		if (drm_gem_shmem_is_purgeable(shmem))
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
-	if (!mutex_trylock(&shmem->pages_lock))
-		goto unlock_mappings;
-
-	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge_locked(&bo->base);
-	ret = true;
-
-	mutex_unlock(&shmem->pages_lock);
-
-unlock_mappings:
-	mutex_unlock(&bo->mappings.lock);
-	return ret;
-}
-
-static unsigned long
-panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
-{
-	struct panfrost_device *pfdev =
-		container_of(shrinker, struct panfrost_device, shrinker);
-	struct drm_gem_shmem_object *shmem, *tmp;
-	unsigned long freed = 0;
-
-	if (!mutex_trylock(&pfdev->shrinker_lock))
-		return SHRINK_STOP;
-
-	list_for_each_entry_safe(shmem, tmp, &pfdev->shrinker_list, madv_list) {
-		if (freed >= sc->nr_to_scan)
-			break;
-		if (drm_gem_shmem_is_purgeable(shmem) &&
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
-void panfrost_gem_shrinker_init(struct drm_device *dev)
-{
-	struct panfrost_device *pfdev = dev->dev_private;
-	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
-	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
-	pfdev->shrinker.seeks = DEFAULT_SEEKS;
-	WARN_ON(register_shrinker(&pfdev->shrinker));
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
-	if (pfdev->shrinker.nr_deferred) {
-		unregister_shrinker(&pfdev->shrinker);
-	}
-}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index fda5871aebe3..bcf496b837ce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -271,6 +271,19 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
 }
 
+static int panfrost_objects_prepare(struct drm_gem_object **bos, int bo_count)
+{
+	struct panfrost_gem_object *bo;
+	int ret = 0;
+
+	while (!ret && bo_count--) {
+		bo = to_panfrost_bo(bos[bo_count]);
+		ret = bo->base.madv ? -ENOMEM : 0;
+	}
+
+	return ret;
+}
+
 int panfrost_job_push(struct panfrost_job *job)
 {
 	struct panfrost_device *pfdev = job->pfdev;
@@ -282,6 +295,10 @@ int panfrost_job_push(struct panfrost_job *job)
 	if (ret)
 		return ret;
 
+	ret = panfrost_objects_prepare(job->bos, job->bo_count);
+	if (ret)
+		goto unlock;
+
 	mutex_lock(&pfdev->sched_lock);
 	drm_sched_job_arm(&job->base);
 
@@ -323,7 +340,6 @@ static void panfrost_job_cleanup(struct kref *ref)
 			if (!job->mappings[i])
 				break;
 
-			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
 			panfrost_gem_mapping_put(job->mappings[i]);
 		}
 		kvfree(job->mappings);
-- 
2.35.1

