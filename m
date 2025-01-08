Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA6A066CE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77110E94B;
	Wed,  8 Jan 2025 21:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IecZ82zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8CA10EC90
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 21:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736370213; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YFb9bBztpmCpoAfIenDvu8Z+ZXe+mtv+cHm1Rbywf2zGwv9CRm7pyL01yKOpKqMuD/Q64VF8mtf3IVgh7FkOFIpPIRrTu2ah8Cljw0kNuxCqYBm0r0JFvqpqms0u5TVdTXlWtjPrEfHg1KRWxEOHJ1hWl+5Y/UfvwWToMR2AJOk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736370213;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cf+3pKc/11P3IOsbq6dyyYgjHTUbb9LNF+LWZ2Ywi2w=; 
 b=ZcWqgocG3l+XN6G9dwTQaMlc8MsR7PONaiOlBdYYh0YYot4xlXSBG5uE8N33VnHW4SFTuVXX2324jWlvgmR25Wy1PfAgv4pTNz2mKg9wuZuUPzRJs2bdRIRWdqntfCohOokGiv6tUbUyCtnXjhMvrDcsAtWccbsFjdy5KkOHdys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736370213; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=cf+3pKc/11P3IOsbq6dyyYgjHTUbb9LNF+LWZ2Ywi2w=;
 b=IecZ82zwxogdRO9RCGKSZCE/HUm5QUe83AptZOi6YuQf9YmlCqkeP2rGjGeo2Wk8
 qcHLHmAP666oUF0VR4uEuzaNRqfkgjAXoBwxbCdQbT0x0rqFF7XOaiYaQ4T9ofApeRl
 UNYFHRXk2BtsL7xVjB8NzD/YVTvD/OCwRYc/aJMQ=
Received: by mx.zohomail.com with SMTPS id 1736370212026522.9519763070799;
 Wed, 8 Jan 2025 13:03:32 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v7 3/4] drm/panthor: Expose size of driver internal BO's over
 fdinfo
Date: Wed,  8 Jan 2025 21:02:40 +0000
Message-ID: <20250108210259.647030-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108210259.647030-1-adrian.larumbe@collabora.com>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 13 +++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 34 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 51 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  2 +
 7 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..c41136af27d2 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1457,12 +1457,25 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
 }
 
+static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_memory_stats status = {0};
+
+	panthor_group_kbo_sizes(pfile, &status);
+	panthor_vm_heaps_sizes(pfile, &status);
+
+	drm_driver_print_size(p, file, "resident-memory", status.resident);
+	drm_driver_print_size(p, file, "active-memory", status.active);
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
index 3796a9eb22af..db0285ce5812 100644
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
+	down_read(&pool->lock);
+	xa_for_each(&pool->xa, i, heap)
+		size += heap->chunk_size * heap->chunk_count;
+	up_read(&pool->lock);
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
index c3f0b0225cf9..32cc0f8b8e23 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1941,6 +1941,40 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 	return pool;
 }
 
+/**
+ * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across all
+ * heaps over all the heap pools in a VM
+ * @pfile: File.
+ * @status: Memory status to be updated.
+ *
+ * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
+ * is active, record the size as active as well.
+ */
+void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
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
+		if (vm->as.id >= 0)
+			status->active += size;
+	}
+}
+
 static u64 mair_to_memattr(u64 mair, bool coherent)
 {
 	u64 memattr = 0;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 8d21e83d8aba..494c36d732b4 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -9,6 +9,7 @@
 
 struct drm_exec;
 struct drm_sched_job;
+struct drm_memory_stats;
 struct panthor_gem_object;
 struct panthor_heap_pool;
 struct panthor_vm;
@@ -37,6 +38,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
 struct panthor_heap_pool *
 panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
 
+void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
+
 struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
 void panthor_vm_put(struct panthor_vm *vm);
 struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ef4bec7ff9c7..e4acf6a0a9b1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -618,7 +618,7 @@ struct panthor_group {
 	 */
 	struct panthor_kernel_bo *syncobjs;
 
-	/** @fdinfo: Per-file total cycle and timestamp values reference. */
+	/** @fdinfo: Per-group total cycle and timestamp values and kernel BO sizes. */
 	struct {
 		/** @data: Total sampled values for jobs in queues from this group. */
 		struct panthor_gpu_usage data;
@@ -628,6 +628,9 @@ struct panthor_group {
 		 * and job post-completion processing function
 		 */
 		struct mutex lock;
+
+		/** @kbo_sizes: Aggregate size of private kernel BO's held by the group. */
+		size_t kbo_sizes;
 	} fdinfo;
 
 	/** @state: Group state. */
@@ -3365,6 +3368,29 @@ group_create_queue(struct panthor_group *group,
 	return ERR_PTR(ret);
 }
 
+static void add_group_kbo_sizes(struct panthor_device *ptdev,
+				struct panthor_group *group)
+{
+	struct panthor_queue *queue;
+	int i;
+
+	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(group)))
+		return;
+	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
+		return;
+
+	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
+	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
+	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
+
+	for (i = 0; i < group->queue_count; i++) {
+		queue =	group->queues[i];
+		group->fdinfo.kbo_sizes += queue->ringbuf->obj->size;
+		group->fdinfo.kbo_sizes += queue->iface.mem->obj->size;
+		group->fdinfo.kbo_sizes += queue->profiling.slots->obj->size;
+	}
+}
+
 #define MAX_GROUPS_PER_POOL		128
 
 int panthor_group_create(struct panthor_file *pfile,
@@ -3489,6 +3515,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
+	add_group_kbo_sizes(group->ptdev, group);
 	mutex_init(&group->fdinfo.lock);
 
 	return gid;
@@ -3606,6 +3633,28 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
 	pfile->groups = NULL;
 }
 
+/**
+ * panthor_group_kbo_sizes() - Retrieve aggregate size of all private kernel BO's
+ * belonging to all the groups owned by an open Panthor file
+ * @pfile: File.
+ * @status: Memory status to be updated.
+ *
+ */
+void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return;
+	xa_for_each(&gpool->xa, i, group) {
+		status->resident += group->fdinfo.kbo_sizes;
+		if (group->csg_id >= 0)
+			status->active += group->fdinfo.kbo_sizes;
+	}
+}
+
 static void job_release(struct kref *ref)
 {
 	struct panthor_job *job = container_of(ref, struct panthor_job, refcount);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 5ae6b4bde7c5..2327d441ceb1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -9,6 +9,7 @@ struct dma_fence;
 struct drm_file;
 struct drm_gem_object;
 struct drm_sched_job;
+struct drm_memory_stats;
 struct drm_panthor_group_create;
 struct drm_panthor_queue_create;
 struct drm_panthor_group_get_state;
@@ -36,6 +37,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
 
 int panthor_group_pool_create(struct panthor_file *pfile);
 void panthor_group_pool_destroy(struct panthor_file *pfile);
+void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
 
 int panthor_sched_init(struct panthor_device *ptdev);
 void panthor_sched_unplug(struct panthor_device *ptdev);
-- 
2.47.1

