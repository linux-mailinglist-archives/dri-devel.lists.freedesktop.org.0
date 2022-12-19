Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D83650CEE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 15:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485D710E2A8;
	Mon, 19 Dec 2022 14:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7B3C10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:01:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A14AFEC;
 Mon, 19 Dec 2022 06:02:21 -0800 (PST)
Received: from e112269-lin.cambridge.arm.com (unknown [10.1.194.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10BA93F71A;
 Mon, 19 Dec 2022 06:01:38 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH] drm/panfrost: Fix GEM handle creation ref-counting
Date: Mon, 19 Dec 2022 14:01:30 +0000
Message-Id: <20221219140130.410578-1-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panfrost_gem_create_with_handle() previously returned a BO but with the
only reference being from the handle, which user space could in theory
guess and release, causing a use-after-free. Additionally if the call to
panfrost_gem_mapping_get() in panfrost_ioctl_create_bo() failed then
a(nother) reference on the BO was dropped.

The _create_with_handle() is a problematic pattern, so ditch it and
instead create the handle in panfrost_ioctl_create_bo(). If the call to
panfrost_gem_mapping_get() fails then this means that user space has
indeed gone behind our back and freed the handle. In which case just
return an error code.

Reported-by: Rob Clark <robdclark@chromium.org>
Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++++++---------
 drivers/gpu/drm/panfrost/panfrost_gem.c | 16 +--------------
 drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +----
 3 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index fa619fe72086..abb0dadd8f63 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -82,6 +82,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	struct panfrost_gem_object *bo;
 	struct drm_panfrost_create_bo *args = data;
 	struct panfrost_gem_mapping *mapping;
+	int ret;
 
 	if (!args->size || args->pad ||
 	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
@@ -92,21 +93,29 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	    !(args->flags & PANFROST_BO_NOEXEC))
 		return -EINVAL;
 
-	bo = panfrost_gem_create_with_handle(file, dev, args->size, args->flags,
-					     &args->handle);
+	bo = panfrost_gem_create(dev, args->size, args->flags);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
+	if (ret)
+		goto out;
+
 	mapping = panfrost_gem_mapping_get(bo, priv);
-	if (!mapping) {
-		drm_gem_object_put(&bo->base.base);
-		return -EINVAL;
+	if (mapping) {
+		args->offset = mapping->mmnode.start << PAGE_SHIFT;
+		panfrost_gem_mapping_put(mapping);
+	} else {
+		/* This can only happen if the handle from
+		 * drm_gem_handle_create() has already been guessed and freed
+		 * by user space
+		 */
+		ret = -EINVAL;
 	}
 
-	args->offset = mapping->mmnode.start << PAGE_SHIFT;
-	panfrost_gem_mapping_put(mapping);
-
-	return 0;
+out:
+	drm_gem_object_put(&bo->base.base);
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 293e799e2fe8..3c812fbd126f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -235,12 +235,8 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 }
 
 struct panfrost_gem_object *
-panfrost_gem_create_with_handle(struct drm_file *file_priv,
-				struct drm_device *dev, size_t size,
-				u32 flags,
-				uint32_t *handle)
+panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 {
-	int ret;
 	struct drm_gem_shmem_object *shmem;
 	struct panfrost_gem_object *bo;
 
@@ -256,16 +252,6 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
 
-	/*
-	 * Allocate an id of idr table where the obj is registered
-	 * and handle has the id what user can see.
-	 */
-	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&shmem->base);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return bo;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8088d5fd8480..ad2877eeeccd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -69,10 +69,7 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct sg_table *sgt);
 
 struct panfrost_gem_object *
-panfrost_gem_create_with_handle(struct drm_file *file_priv,
-				struct drm_device *dev, size_t size,
-				u32 flags,
-				uint32_t *handle);
+panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags);
 
 int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv);
 void panfrost_gem_close(struct drm_gem_object *obj,
-- 
2.34.1

