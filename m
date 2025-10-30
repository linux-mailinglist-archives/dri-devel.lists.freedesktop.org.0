Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26437C20799
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBD810E9A9;
	Thu, 30 Oct 2025 14:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZWRh0q3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6448910E9A0;
 Thu, 30 Oct 2025 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833146;
 bh=7ad8n6gcbl4HuQzwChKXJkLBIVlNQqbVy/mBd5kEjpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZWRh0q3hCm3SKYMErJGBmsqD5iKBlJDU1d1kYN1phsncpH8mXSf8pxN+ilygoYNPO
 t+3t1yvJeE1Pors8++6300N/sAsWJZqbhCTa3W5Dsgc4wRn0k3AhMY4DuqoW9FUT4H
 YP4ApWLJ2AAkKAe8xJtcCJxpTrlIUjB4ZiHUksoAt/tGkVkqHI/Uj+hv02frKSSVwh
 7P0VxtFlo86fDF22rd2tMTrLngNRgBbzJ3TZ4owx/mbIjorXlmKNqJbFMJckAl19qN
 xwqj9fLlXf911yVWbr6We33iiJZWy8KdWeHKVfFpeohvyV+U4ysfy2lQZVOjEWKViK
 lMpfdNGdPsk7w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 20F4217E15C9;
 Thu, 30 Oct 2025 15:05:45 +0100 (CET)
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
Subject: [PATCH v5 09/16] drm/panthor: Add flag to map GEM object Write-Back
 Cacheable
Date: Thu, 30 Oct 2025 15:05:18 +0100
Message-ID: <20251030140525.366636-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030140525.366636-1-boris.brezillon@collabora.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
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

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   |  7 ++++-
 drivers/gpu/drm/panthor/panthor_gem.c   | 37 +++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++--
 include/uapi/drm/panthor_drm.h          | 12 ++++++++
 4 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index c07fc5dcd4a1..4e915f5ef3fa 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -900,7 +900,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device *ddev, void *data,
 	return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
 }
 
-#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
+#define PANTHOR_BO_FLAGS		(DRM_PANTHOR_BO_NO_MMAP | \
+					 DRM_PANTHOR_BO_WB_MMAP)
 
 static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 				   struct drm_file *file)
@@ -919,6 +920,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
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
index 1b1e98c61b8c..479a779ee59d 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -58,6 +58,39 @@ static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u
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
@@ -152,6 +185,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	bo = to_panthor_bo(&obj->base);
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
+	bo->base.map_wc = should_map_wc(bo, vm);
 
 	if (vm == panthor_fw_vm(ptdev))
 		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
@@ -255,7 +289,6 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
  */
 struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
 {
-	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct panthor_gem_object *obj;
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
@@ -263,7 +296,6 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 		return ERR_PTR(-ENOMEM);
 
 	obj->base.base.funcs = &panthor_gem_funcs;
-	obj->base.map_wc = !ptdev->coherent;
 	mutex_init(&obj->label.lock);
 
 	panthor_gem_debugfs_bo_init(obj);
@@ -298,6 +330,7 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 	bo = to_panthor_bo(&shmem->base);
 	bo->flags = flags;
+	bo->base.map_wc = should_map_wc(bo, exclusive_vm);
 
 	if (exclusive_vm) {
 		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index f5e01cb16cfc..7d5da5717de2 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -868,8 +868,11 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
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
@@ -886,6 +889,17 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 	if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
 		goto err_put_syncwait_obj;
 
+out_sync:
+	/* Make sure the CPU caches are invalidated before the seqno is read.
+	 * drm_gem_shmem_sync() is a NOP if map_wc=false, so no need to check
+	 * it here.
+	 */
+	drm_gem_shmem_sync(&bo->base, queue->syncwait.offset,
+			   queue->syncwait.sync64 ?
+				   sizeof(struct panthor_syncobj_64b) :
+				   sizeof(struct panthor_syncobj_32b),
+			   DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE);
+
 	return queue->syncwait.kmap + queue->syncwait.offset;
 
 err_put_syncwait_obj:
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 7eec9f922183..57e2f5ffa03c 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -681,6 +681,18 @@ struct drm_panthor_vm_get_state {
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
+	 *
+	 * Can't be set if exclusive_vm_id=0 (only private BOs can be mapped
+	 * cacheable).
+	 */
+	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
 };
 
 /**
-- 
2.51.0

