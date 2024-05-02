Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F98BA0A3
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 20:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BB210EBE5;
	Thu,  2 May 2024 18:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OX/vGK2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA4D10E568
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714675096;
 bh=2L24G+ekzA6uoxP0Wg1Jdp3eXNqrxTsU2kd/JSWX/sQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OX/vGK2xeiUMCtyvG0MvubFpPFNpEIaI+PvWGM2/3rSzXfjEWEHCNhsI7/2MDJFQl
 zOK0agI7/7hfo9aS8ZL7L4mUlAV5d/MdcbKKFnH+lOh6PFDivokgkYaQAaI3wOPj7O
 TsEqea50YNql+O4RKF7MMr/spsn8uZH/kO1UQKvcvMBUoLoqfwoVgMJZMayGH2gLpB
 ziGsasuUcRQFy553GPkv+tw3m5X+grkcRPgW+3vFv2D8Wyw9h987uO3D6y6gfBENU2
 fTajOqh96jiopwyPhJq/Gk3pG0M1lYuZADjEFIGt5gDUBUocYhcK+VSr5InGBq3wCN
 kdxIwg+tMwyaA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0A9563782135;
 Thu,  2 May 2024 18:38:15 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 2/4] drm/panthor: Keep a ref to the VM at the
 panthor_kernel_bo level
Date: Thu,  2 May 2024 20:38:10 +0200
Message-ID: <20240502183813.1612017-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502183813.1612017-1-boris.brezillon@collabora.com>
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoids use-after-free situations when panthor_fw_unplug() is called
and the kernel BO was mapped to the FW VM.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    |  4 ++--
 drivers/gpu/drm/panthor/panthor_gem.c   |  8 +++++---
 drivers/gpu/drm/panthor/panthor_gem.h   |  8 ++++++--
 drivers/gpu/drm/panthor/panthor_heap.c  |  8 ++++----
 drivers/gpu/drm/panthor/panthor_sched.c | 11 +++++------
 5 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 181395e2859a..b41685304a83 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -453,7 +453,7 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 
 	ret = panthor_kernel_bo_vmap(mem);
 	if (ret) {
-		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), mem);
+		panthor_kernel_bo_destroy(mem);
 		return ERR_PTR(ret);
 	}
 
@@ -1133,7 +1133,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	panthor_fw_stop(ptdev);
 
 	list_for_each_entry(section, &ptdev->fw->sections, node)
-		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), section->mem);
+		panthor_kernel_bo_destroy(section->mem);
 
 	/* We intentionally don't call panthor_vm_idle() and let
 	 * panthor_mmu_unplug() release the AS we acquired with
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index d6483266d0c2..38f560864879 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -26,18 +26,18 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 
 /**
  * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
- * @vm: The VM this BO was mapped to.
  * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
  * is skipped.
  */
-void panthor_kernel_bo_destroy(struct panthor_vm *vm,
-			       struct panthor_kernel_bo *bo)
+void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 {
+	struct panthor_vm *vm;
 	int ret;
 
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
+	vm = bo->vm;
 	panthor_kernel_bo_vunmap(bo);
 
 	if (drm_WARN_ON(bo->obj->dev,
@@ -53,6 +53,7 @@ void panthor_kernel_bo_destroy(struct panthor_vm *vm,
 	drm_gem_object_put(bo->obj);
 
 out_free_bo:
+	panthor_vm_put(vm);
 	kfree(bo);
 }
 
@@ -106,6 +107,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	if (ret)
 		goto err_free_va;
 
+	kbo->vm = panthor_vm_get(vm);
 	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
 	drm_gem_object_get(bo->exclusive_vm_root_gem);
 	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 3bccba394d00..e43021cf6d45 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -61,6 +61,11 @@ struct panthor_kernel_bo {
 	 */
 	struct drm_gem_object *obj;
 
+	/**
+	 * @vm: VM this private buffer is attached to.
+	 */
+	struct panthor_vm *vm;
+
 	/**
 	 * @va_node: VA space allocated to this GEM.
 	 */
@@ -136,7 +141,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
 			 u64 gpu_va);
 
-void panthor_kernel_bo_destroy(struct panthor_vm *vm,
-			       struct panthor_kernel_bo *bo);
+void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
 #endif /* __PANTHOR_GEM_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 143fa35f2e74..65921296a18c 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -127,7 +127,7 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
 	heap->chunk_count--;
 	mutex_unlock(&heap->lock);
 
-	panthor_kernel_bo_destroy(vm, chunk->bo);
+	panthor_kernel_bo_destroy(chunk->bo);
 	kfree(chunk);
 }
 
@@ -183,7 +183,7 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	return 0;
 
 err_destroy_bo:
-	panthor_kernel_bo_destroy(vm, chunk->bo);
+	panthor_kernel_bo_destroy(chunk->bo);
 
 err_free_chunk:
 	kfree(chunk);
@@ -391,7 +391,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 	mutex_unlock(&heap->lock);
 
 	if (removed) {
-		panthor_kernel_bo_destroy(pool->vm, chunk->bo);
+		panthor_kernel_bo_destroy(chunk->bo);
 		kfree(chunk);
 		ret = 0;
 	} else {
@@ -587,7 +587,7 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
 
 	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
-		panthor_kernel_bo_destroy(pool->vm, pool->gpu_contexts);
+		panthor_kernel_bo_destroy(pool->gpu_contexts);
 
 	/* Reflects the fact the pool has been destroyed. */
 	pool->vm = NULL;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 1d2708c3ab0a..6ea094b00cf9 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -826,8 +826,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 
 	panthor_queue_put_syncwait_obj(queue);
 
-	panthor_kernel_bo_destroy(group->vm, queue->ringbuf);
-	panthor_kernel_bo_destroy(panthor_fw_vm(group->ptdev), queue->iface.mem);
+	panthor_kernel_bo_destroy(queue->ringbuf);
+	panthor_kernel_bo_destroy(queue->iface.mem);
 
 	kfree(queue);
 }
@@ -837,15 +837,14 @@ static void group_release_work(struct work_struct *work)
 	struct panthor_group *group = container_of(work,
 						   struct panthor_group,
 						   release_work);
-	struct panthor_device *ptdev = group->ptdev;
 	u32 i;
 
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
-	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->suspend_buf);
-	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), group->protm_suspend_buf);
-	panthor_kernel_bo_destroy(group->vm, group->syncobjs);
+	panthor_kernel_bo_destroy(group->suspend_buf);
+	panthor_kernel_bo_destroy(group->protm_suspend_buf);
+	panthor_kernel_bo_destroy(group->syncobjs);
 
 	panthor_vm_put(group->vm);
 	kfree(group);
-- 
2.44.0

