Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4559E616D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3AA10EFD8;
	Thu,  5 Dec 2024 23:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dNh/J5Tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5944D10EFDE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733441966; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f2yNdc+HU0iXZna2u7pzZIPqu+jYOea+Ifh33BI/Hn0LgyoZbpEZxXpwnhA471mdQF6+9jFaIM1slEnDv8x/xFA5gbXx/yt0sDZH4rwxy9z0xRnozmYuISAQTgGy1L9BXurV5J58egaswdZcx8LoCNKG/IuTsPbcV2/JUbG68J0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733441966;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LwH3yBZ1S7OJ5jglHEJqbUIEUEgBGwuJ/IW60uvY/lM=; 
 b=Gq0nb1foPsZCmPp1su/DYmi2ZR4AkJskiH/E2tOpCSVcHK9yfBSLuVK+S/JEu/RGqejcTH7qUD6YCvZepuwppBndmLZtSfmgDJ2vlDSgsB9NUgXhae/k/NTRCeYdJcj+HzShhtykBb+KYD3/Xa+BEChs7drrj60IHISjka0o2oE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733441966; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LwH3yBZ1S7OJ5jglHEJqbUIEUEgBGwuJ/IW60uvY/lM=;
 b=dNh/J5TrmyY0U/y/stR8P08Pkwb5Aly+9r3MuTtZfxAlXC7D93wtN8hy+BFOFcd6
 Gk1mD+9XNew14yxQTqsmpKyTofSFVH7oGaoB3Ot31ci3SuBhxChEiGQDMdRZywHN9Lh
 ZV8YNhEDlfY9PHPhQ2adxmPBhhcoyuulas8cFD6o=
Received: by mx.zohomail.com with SMTPS id 173344196396898.49331682214711;
 Thu, 5 Dec 2024 15:39:23 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/panthor: Expose size of driver internal BO's over
 fdinfo
Date: Thu,  5 Dec 2024 23:39:07 +0000
Message-ID: <20241205233915.2180630-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
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

This will display the sizes of kenrel BO's bound to an open file, which are
otherwise not exposed to UM through a handle.

The sizes recorded are as follows:
 - Per group: suspend buffer, protm-suspend buffer, syncobjcs
 - Per queue: ringbuffer, profiling slots, firmware interface
 - For all heaps in all heap pools across all VM's bound to an open file,
 record size of all heap chuks, and for each pool the gpu_context BO too.

This does not record the size of FW regions, as these aren't bound to a
specific open file and remain active through the whole life of the driver.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 14 +++++++++-
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c   | 35 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  4 +++
 drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h |  4 +++
 7 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..94f1d5f16e35 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -876,7 +876,7 @@ static int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
 	if (!drm_dev_enter(ddev, &cookie))
 		return -ENODEV;
 
-	ret = panthor_vm_pool_create_vm(ptdev, pfile->vms,  args);
+	ret = panthor_vm_pool_create_vm(ptdev, pfile->vms, args);
 	if (ret >= 0) {
 		args->id = ret;
 		ret = 0;
@@ -1457,12 +1457,24 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
 }
 
+static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_memory_stats status = {0};
+
+	panthor_group_internal_sizes(pfile, &status);
+	panthor_vm_heaps_size(pfile, &status);
+
+	drm_print_memory_stats(p, &status, DRM_GEM_OBJECT_RESIDENT, "internal");
+}
+
 static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
 	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
 
 	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
+	panthor_show_internal_memory_stats(p, file);
 
 	drm_show_memory_stats(p, file);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3796a9eb22af..e4464c5e93ef 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -603,3 +603,29 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 
 	panthor_heap_pool_put(pool);
 }
+
+/**
+ * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
+ * @pool: Pool whose total chunk size to calculate.
+ *
+ * This function adds the size of all heap chunks across all heaps in the
+ * argument pool. It also adds the size of the gpu contexts kernel bo.
+ * It is meant to be used by fdinfo for displaying the size of internal
+ * driver BO's that aren't exposed to userspace through a GEM handle.
+ *
+ */
+size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
+{
+	struct panthor_heap *heap;
+	unsigned long i;
+	size_t size = 0;
+
+	down_write(&pool->lock);
+	xa_for_each(&pool->xa, i, heap)
+		size += heap->chunk_size * heap->chunk_count;
+	up_write(&pool->lock);
+
+	size += pool->gpu_contexts->obj->size;
+
+	return size;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
index 25a5f2bba445..e3358d4e8edb 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.h
+++ b/drivers/gpu/drm/panthor/panthor_heap.h
@@ -27,6 +27,8 @@ struct panthor_heap_pool *
 panthor_heap_pool_get(struct panthor_heap_pool *pool);
 void panthor_heap_pool_put(struct panthor_heap_pool *pool);
 
+size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
+
 int panthor_heap_grow(struct panthor_heap_pool *pool,
 		      u64 heap_gpu_va,
 		      u32 renderpasses_in_flight,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 7ba8470a7543..e2f27a1667c3 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1937,6 +1937,41 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 	return pool;
 }
 
+/**
+ * panthor_vm_heaps_size() - Calculate size of all heap chunks across all
+ * heaps over all the heap pools in a VM
+ * @pfile: File.
+ * @status: Memory status to be updated.
+ *
+ * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
+ * is active, record the size as active as well.
+ */
+void panthor_vm_heaps_size(struct panthor_file *pfile, struct drm_memory_stats *status)
+{
+	struct panthor_vm *vm;
+	unsigned long i;
+
+	if (!pfile->vms)
+		return;
+
+	xa_for_each(&pfile->vms->xa, i, vm) {
+		size_t size;
+
+		mutex_lock(&vm->heaps.lock);
+		if (!vm->heaps.pool) {
+			mutex_unlock(&vm->heaps.lock);
+			continue;
+		}
+		size = panthor_heap_pool_size(vm->heaps.pool);
+		mutex_unlock(&vm->heaps.lock);
+
+		status->resident += size;
+		status->private += size;
+		if (vm->as.id >= 0)
+			status->active += size;
+	}
+}
+
 static u64 mair_to_memattr(u64 mair, bool coherent)
 {
 	u64 memattr = 0;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 8d21e83d8aba..25f7aea39ed9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -5,10 +5,12 @@
 #ifndef __PANTHOR_MMU_H__
 #define __PANTHOR_MMU_H__
 
+#include <linux/types.h>
 #include <linux/dma-resv.h>
 
 struct drm_exec;
 struct drm_sched_job;
+struct drm_memory_stats;
 struct panthor_gem_object;
 struct panthor_heap_pool;
 struct panthor_vm;
@@ -37,6 +39,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
 struct panthor_heap_pool *
 panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
 
+void panthor_vm_heaps_size(struct panthor_file *pfile, struct drm_memory_stats *status);
+
 struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
 void panthor_vm_put(struct panthor_vm *vm);
 struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ef4bec7ff9c7..6a4d5f63c86b 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -582,6 +582,9 @@ struct panthor_group {
 	/** @queues: Queues owned by this group. */
 	struct panthor_queue *queues[MAX_CS_PER_CSG];
 
+	/** @bo_sizes: Aggregate size of internal kernel BO's held by the group. */
+	size_t kbo_sizes;
+
 	/**
 	 * @csg_id: ID of the FW group slot.
 	 *
@@ -3305,6 +3308,7 @@ group_create_queue(struct panthor_group *group,
 		ret = PTR_ERR(queue->ringbuf);
 		goto err_free_queue;
 	}
+	group->kbo_sizes += queue->ringbuf->obj->size;
 
 	ret = panthor_kernel_bo_vmap(queue->ringbuf);
 	if (ret)
@@ -3319,6 +3323,7 @@ group_create_queue(struct panthor_group *group,
 		ret = PTR_ERR(queue->iface.mem);
 		goto err_free_queue;
 	}
+	group->kbo_sizes += queue->iface.mem->obj->size;
 
 	queue->profiling.slot_count =
 		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
@@ -3336,6 +3341,7 @@ group_create_queue(struct panthor_group *group,
 		ret = PTR_ERR(queue->profiling.slots);
 		goto err_free_queue;
 	}
+	group->kbo_sizes += queue->profiling.slots->obj->size;
 
 	ret = panthor_kernel_bo_vmap(queue->profiling.slots);
 	if (ret)
@@ -3433,6 +3439,7 @@ int panthor_group_create(struct panthor_file *pfile,
 		group->suspend_buf = NULL;
 		goto err_put_group;
 	}
+	group->kbo_sizes += group->suspend_buf->obj->size;
 
 	suspend_size = csg_iface->control->protm_suspend_size;
 	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
@@ -3441,6 +3448,7 @@ int panthor_group_create(struct panthor_file *pfile,
 		group->protm_suspend_buf = NULL;
 		goto err_put_group;
 	}
+	group->kbo_sizes += group->protm_suspend_buf->obj->size;
 
 	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
 						   group_args->queues.count *
@@ -3453,6 +3461,7 @@ int panthor_group_create(struct panthor_file *pfile,
 		ret = PTR_ERR(group->syncobjs);
 		goto err_put_group;
 	}
+	group->kbo_sizes += group->syncobjs->obj->size;
 
 	ret = panthor_kernel_bo_vmap(group->syncobjs);
 	if (ret)
@@ -3606,6 +3615,23 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
 	pfile->groups = NULL;
 }
 
+void panthor_group_internal_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return;
+
+	xa_for_each(&gpool->xa, i, group) {
+		status->resident += group->kbo_sizes;
+		status->private += group->kbo_sizes;
+		if (group->csg_id >= 0)
+			status->active += group->kbo_sizes;
+	}
+}
+
 static void job_release(struct kref *ref)
 {
 	struct panthor_job *job = container_of(ref, struct panthor_job, refcount);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 5ae6b4bde7c5..e17c56a40d9c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -4,11 +4,14 @@
 #ifndef __PANTHOR_SCHED_H__
 #define __PANTHOR_SCHED_H__
 
+#include <linux/types.h>
+
 struct drm_exec;
 struct dma_fence;
 struct drm_file;
 struct drm_gem_object;
 struct drm_sched_job;
+struct drm_memory_stats;
 struct drm_panthor_group_create;
 struct drm_panthor_queue_create;
 struct drm_panthor_group_get_state;
@@ -36,6 +39,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
 
 int panthor_group_pool_create(struct panthor_file *pfile);
 void panthor_group_pool_destroy(struct panthor_file *pfile);
+void panthor_group_internal_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
 
 int panthor_sched_init(struct panthor_device *ptdev);
 void panthor_sched_unplug(struct panthor_device *ptdev);
-- 
2.47.0

