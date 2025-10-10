Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E3DBCC7BF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EB210E293;
	Fri, 10 Oct 2025 10:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pkYExrRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1035610E287
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760091121;
 bh=DcjlvuDYvXh4+zwxKFnJLps2HHsSa4BV9tG5WHOpngs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pkYExrRUL8RnCrASGhz0kZkRp3NsoqNJmxp3u3k1xXz/QZyPDGuPPD7QVbzWpy55o
 6OzxSOJZDbn5AW9gL6NGt9f/8e3y9sx/9UzHseB9PbuR8x9T2w+N4zu2IMIgv2lW8E
 fHcN4hS+Tr/nf0EWcwdsxOSNt8VBkkD8SewqVkfCM9Jpa/cRRCS9vI7zAt4LcMQvz6
 CTK9rgfRoNUpfUf9+FqLwL1EJAsJoybAD+nEg9pkWVyn9J36GcWF+cdX1RsTG59PKm
 XRk31fuN0hPnELfcS+lCq4THOCkGqpqbYyuW2dfvk+zBlqXl37/scfRtEv+jwOlxHD
 XO6TJSUKAUJnQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 47F6E17E13E0;
 Fri, 10 Oct 2025 12:12:01 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 kernel@collabora.com
Subject: [PATCH v2 07/13] drm/panthor: Add flag to map GEM object Write-Back
 Cacheable
Date: Fri, 10 Oct 2025 12:11:40 +0200
Message-ID: <20251010101147.3290604-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010101147.3290604-1-boris.brezillon@collabora.com>
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
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

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   |  8 +++++++-
 drivers/gpu/drm/panthor/panthor_gem.c   |  3 +++
 drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++++++++--
 include/uapi/drm/panthor_drm.h          |  9 +++++++++
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9004d0ba0e45..af9b431255a4 100644
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
@@ -1450,6 +1455,7 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
 		return -ENOENT;
 
 	bo = to_panthor_bo(obj);
+
 	args->pad = 0;
 	args->create_flags = bo->flags;
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 617e04134d30..a0ccc316e375 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -280,6 +280,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	bo = to_panthor_bo(&shmem->base);
 	bo->flags = flags;
 
+	if (flags & DRM_PANTHOR_BO_WB_MMAP)
+		shmem->map_wc = false;
+
 	if (exclusive_vm) {
 		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
 		drm_gem_object_get(bo->exclusive_vm_root_gem);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0cc9055f4ee5..5f9dba3a9d65 100644
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
+	 * drm_gem_shmem_sync() is a NOP if wap_wc=false, so no need to check
+	 * it here.
+	 */
+	drm_gem_shmem_sync(&bo->base, queue->syncwait.offset,
+			   queue->syncwait.sync64 ?
+				   sizeof(struct panthor_syncobj_64b) :
+				   sizeof(struct panthor_syncobj_32b),
+			   DRM_GEM_OBJECT_CPU_ACCESS | DRM_GEM_OBJECT_READ_ACCESS);
+
 	return queue->syncwait.kmap + queue->syncwait.offset;
 
 err_put_syncwait_obj:
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 54502286c8b1..e77d65e51c64 100644
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
2.51.0

