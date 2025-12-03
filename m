Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B8C9E5A7
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8510E7AD;
	Wed,  3 Dec 2025 09:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MVYc70RN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2777510E7A7;
 Wed,  3 Dec 2025 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764752517;
 bh=IErT+0PtlZ6waWcdymjjG1lk6yDxwySwYscasubR30Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MVYc70RNLSiJY0/H/W9GLw+sKpeJvSZ+0NuQHKOWOze/30qUGLtFuMFVRzT8388A6
 Kz0vfXXRawjmMnBYZkbo/NotVxrSxtFV/n0HdLFInx6Is71WobN6EVIW5cPdol0/yQ
 ifp9AAbyVVIWkVxzJ3S0TbQrQeg1EpIEQAIspJUB4LDLpj3VGzn3HtvUhjkH23NDF5
 nYcerMFTI3HyJkZNXi3ebFaQYPm07/Z27WecgVm2ozEV3dyZEdwaIlD/x4rJuH6mlk
 0UVEHUQTlMSzeo/owcwFbjYOi7gWB3FLp3Lt6Kb4/GY2JKagi7HWQZRHhzcEP8HJdc
 IhImPn4tw44eA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DC76D17E110C;
 Wed,  3 Dec 2025 10:01:56 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 kernel@collabora.com, Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v7 06/13] drm/panthor: Add flag to map GEM object Write-Back
 Cacheable
Date: Wed,  3 Dec 2025 10:01:34 +0100
Message-ID: <20251203090141.227394-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251203090141.227394-1-boris.brezillon@collabora.com>
References: <20251203090141.227394-1-boris.brezillon@collabora.com>
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

From: Loïc Molinari <loic.molinari@collabora.com>

Will be used by the UMD to optimize CPU accesses to buffers
that are frequently read by the CPU, or on which the access
pattern makes non-cacheable mappings inefficient.

Mapping buffers CPU-cached implies taking care of the CPU
cache maintenance in the UMD, unless the GPU is IO coherent.

v2:
- Add more to the commit message
- Tweak the doc
- Make sure we sync the section of the BO pointing to the CS
  syncobj before we read its seqno

v3:
- Fix formatting/spelling issues

v4:
- Add Steve's R-b

v5:
- Drop Steve's R-b (changes in the ioctl semantics requiring
  new review)

v6:
- Fix the uAPI doc
- Fix inverted logic in some comment

v7:
- No changes

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   |  7 ++++-
 drivers/gpu/drm/panthor/panthor_gem.c   | 37 +++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++--
 include/uapi/drm/panthor_drm.h          |  9 ++++++
 4 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index db04f13217b9..1bb6a20c497a 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -902,7 +902,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device *ddev, void *data,
 	return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
 }
 
-#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
+#define PANTHOR_BO_FLAGS		(DRM_PANTHOR_BO_NO_MMAP | \
+					 DRM_PANTHOR_BO_WB_MMAP)
 
 static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 				   struct drm_file *file)
@@ -921,6 +922,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 		goto out_dev_exit;
 	}
 
+	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
+	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
+		return -EINVAL;
+
 	if (args->exclusive_vm_id) {
 		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
 		if (!vm) {
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 4be32fc1732b..7a9eb6010f6f 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -59,6 +59,39 @@ static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u
 static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
 #endif
 
+static bool
+should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
+{
+	struct panthor_device *ptdev = container_of(bo->base.base.dev, struct panthor_device, base);
+
+	/* We can't do uncached mappings if the device is coherent,
+	 * because the zeroing done by the shmem layer at page allocation
+	 * time happens on a cached mapping which isn't CPU-flushed (at least
+	 * not on Arm64 where the flush is deferred to PTE setup time, and
+	 * only done conditionally based on the mapping permissions). We can't
+	 * rely on dma_map_sgtable()/dma_sync_sgtable_for_xxx() either to flush
+	 * those, because they are NOPed if dma_dev_coherent() returns true.
+	 *
+	 * FIXME: Note that this problem is going to pop up again when we
+	 * decide to support mapping buffers with the NO_MMAP flag as
+	 * non-shareable (AKA buffers accessed only by the GPU), because we
+	 * need the same CPU flush to happen after page allocation, otherwise
+	 * there's a risk of data leak or late corruption caused by a dirty
+	 * cacheline being evicted. At this point we'll need a way to force
+	 * CPU cache maintenance regardless of whether the device is coherent
+	 * or not.
+	 */
+	if (ptdev->coherent)
+		return false;
+
+	/* Cached mappings are explicitly requested, so no write-combine. */
+	if (bo->flags & DRM_PANTHOR_BO_WB_MMAP)
+		return false;
+
+	/* The default is write-combine. */
+	return true;
+}
+
 static void panthor_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
@@ -145,6 +178,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	bo = to_panthor_bo(&obj->base);
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
+	bo->base.map_wc = should_map_wc(bo, vm);
 	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
 	drm_gem_object_get(bo->exclusive_vm_root_gem);
 	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
@@ -345,7 +379,6 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
  */
 struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
 {
-	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct panthor_gem_object *obj;
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
@@ -353,7 +386,6 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 		return ERR_PTR(-ENOMEM);
 
 	obj->base.base.funcs = &panthor_gem_funcs;
-	obj->base.map_wc = !ptdev->coherent;
 	mutex_init(&obj->label.lock);
 
 	panthor_gem_debugfs_bo_init(obj);
@@ -388,6 +420,7 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 	bo = to_panthor_bo(&shmem->base);
 	bo->flags = flags;
+	bo->base.map_wc = should_map_wc(bo, exclusive_vm);
 
 	if (exclusive_vm) {
 		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 389d508b3848..ae69a5704756 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -863,8 +863,11 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	struct iosys_map map;
 	int ret;
 
-	if (queue->syncwait.kmap)
-		return queue->syncwait.kmap + queue->syncwait.offset;
+	if (queue->syncwait.kmap) {
+		bo = container_of(queue->syncwait.obj,
+				  struct panthor_gem_object, base.base);
+		goto out_sync;
+	}
 
 	bo = panthor_vm_get_bo_for_va(group->vm,
 				      queue->syncwait.gpu_va,
@@ -881,6 +884,17 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
 		goto err_put_syncwait_obj;
 
+out_sync:
+	/* Make sure the CPU caches are invalidated before the seqno is read.
+	 * drm_gem_shmem_sync() is a NOP if map_wc=true, so no need to check
+	 * it here.
+	 */
+	panthor_gem_sync(&bo->base.base, queue->syncwait.offset,
+			 queue->syncwait.sync64 ?
+			 sizeof(struct panthor_syncobj_64b) :
+			 sizeof(struct panthor_syncobj_32b),
+			 DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE);
+
 	return queue->syncwait.kmap + queue->syncwait.offset;
 
 err_put_syncwait_obj:
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 39d5ce815742..e238c6264fa1 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -681,6 +681,15 @@ struct drm_panthor_vm_get_state {
 enum drm_panthor_bo_flags {
 	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
 	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
+
+	/**
+	 * @DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapping.
+	 *
+	 * CPU map the buffer object in userspace by forcing the "Write-Back
+	 * Cacheable" cacheability attribute. The mapping otherwise uses the
+	 * "Non-Cacheable" attribute if the GPU is not IO coherent.
+	 */
+	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
 };
 
 /**
-- 
2.51.1

