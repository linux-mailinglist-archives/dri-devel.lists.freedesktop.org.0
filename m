Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4922B9F6DE1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 20:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6853310E332;
	Wed, 18 Dec 2024 19:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="BXBLqXxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54F10E332
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 19:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1734549257; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QZkt4jDEVmU9t1FgyleRYVm1UnnrpHlQqLgVZCiOXZBRwx9/alxVKY0qhhVmpNTqitHX6xTyoAtQSz/hSg5TqZ+Ql3Dc/IsZPK0A1djq+Gqw9rXnMU0gXJidqgwi/15MP3VQIYuVMugGN7XksnC63gYr9au0PxdQdvSjOfZ31as=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1734549257;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NcU7woPhdfFVTxJa9HBXWF1YbAHOLBajffs7r2Lvj+0=; 
 b=fRo+qbotTnHPpCMeGoAuJ6v2FsmR+H/sHWcapDkR3FkLZ0oXPXAXR1OvhrmWMpb7QU9/P8gu8wOb/N0gevKPAaK6bL73Zg4f6fPUIs8hE3MD9RM2hdolJg1nNvmBxt+6Bm3uUK3B4u49ahguJl413Jk1DoHy2R8GS2w5ONr7DZk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734549257; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=NcU7woPhdfFVTxJa9HBXWF1YbAHOLBajffs7r2Lvj+0=;
 b=BXBLqXxwU1raKprVLm/u1M4DrxOkQ5bimP/Re50w8YV4Npg4/1WKEyge99izZ/kP
 c5fmtsv9sNoXecF2VYZ76jSyD8I2eZ4umX887vgYv9NXr6552LjmoOK/pkP/HXx+WEn
 FXNgdv9y0/rw9lENQHm2Hy+clyq+mljk3oqF+Wms=
Received: by mx.zohomail.com with SMTPS id 1734549255844985.6585038509945;
 Wed, 18 Dec 2024 11:14:15 -0800 (PST)
Date: Thu, 19 Dec 2024 03:14:09 +0800
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: "Cc:kernel"@collabora.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <awusmheh5i3qnhgyubf2gxmam6oio7xleb2wbnnsylhbhzfqtt@b4q66zp7i2ci>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218181844.886043-2-adrian.larumbe@collabora.com>
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

On 19.12.2024 02:18, Adrián Martínez Larumbe wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> This will display the sizes of kenrel BO's bound to an open file, which are
> otherwise not exposed to UM through a handle.
> 
> The sizes recorded are as follows:
>  - Per group: suspend buffer, protm-suspend buffer, syncobjcs
>  - Per queue: ringbuffer, profiling slots, firmware interface
>  - For all heaps in all heap pools across all VM's bound to an open file,
>  record size of all heap chuks, and for each pool the gpu_context BO too.
> 
> This does not record the size of FW regions, as these aren't bound to a
> specific open file and remain active through the whole life of the driver.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 12 ++++++
>  drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 35 +++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  4 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 52 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_sched.h |  4 ++
>  7 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index d5dcd3d1b33a..277babcdae12 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1457,12 +1457,24 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
>  	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
>  }
>  
> +static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_memory_stats status = {0};
> +
> +	panthor_group_kbo_sizes(pfile, &status);
> +	panthor_vm_heaps_sizes(pfile, &status);
> +
> +	drm_print_memory_stats(p, &status, DRM_GEM_OBJECT_RESIDENT, "internal");
> +}
> +
>  static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  {
>  	struct drm_device *dev = file->minor->dev;
>  	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
>  
>  	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +	panthor_show_internal_memory_stats(p, file);
>  
>  	drm_show_memory_stats(p, file);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3796a9eb22af..49e426fc2a31 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -603,3 +603,29 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
>  
>  	panthor_heap_pool_put(pool);
>  }
> +
> +/**
> + * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
> + * @pool: Pool whose total chunk size to calculate.
> + *
> + * This function adds the size of all heap chunks across all heaps in the
> + * argument pool. It also adds the size of the gpu contexts kernel bo.
> + * It is meant to be used by fdinfo for displaying the size of internal
> + * driver BO's that aren't exposed to userspace through a GEM handle.
> + *
> + */
> +size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
> +{
> +	struct panthor_heap *heap;
> +	unsigned long i;
> +	size_t size = 0;
> +
> +	down_read(&pool->lock);
> +	xa_for_each(&pool->xa, i, heap)
> +		size += heap->chunk_size * heap->chunk_count;
> +	up_write(&pool->lock);

Oh well, just realised I forgot to change this to up_read() so will do in a final revision.

> +	size += pool->gpu_contexts->obj->size;
> +
> +	return size;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
> index 25a5f2bba445..e3358d4e8edb 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.h
> +++ b/drivers/gpu/drm/panthor/panthor_heap.h
> @@ -27,6 +27,8 @@ struct panthor_heap_pool *
>  panthor_heap_pool_get(struct panthor_heap_pool *pool);
>  void panthor_heap_pool_put(struct panthor_heap_pool *pool);
>  
> +size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
> +
>  int panthor_heap_grow(struct panthor_heap_pool *pool,
>  		      u64 heap_gpu_va,
>  		      u32 renderpasses_in_flight,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index c39e3eb1c15d..51f6e66df3f5 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1941,6 +1941,41 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>  	return pool;
>  }
>  
> +/**
> + * panthor_vm_heaps_size() - Calculate size of all heap chunks across all
> + * heaps over all the heap pools in a VM
> + * @pfile: File.
> + * @status: Memory status to be updated.
> + *
> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
> + * is active, record the size as active as well.
> + */
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
> +{
> +	struct panthor_vm *vm;
> +	unsigned long i;
> +
> +	if (!pfile->vms)
> +		return;
> +
> +	xa_for_each(&pfile->vms->xa, i, vm) {
> +		size_t size;
> +
> +		mutex_lock(&vm->heaps.lock);
> +		if (!vm->heaps.pool) {
> +			mutex_unlock(&vm->heaps.lock);
> +			continue;
> +		}
> +		size = panthor_heap_pool_size(vm->heaps.pool);
> +		mutex_unlock(&vm->heaps.lock);
> +
> +		status->resident += size;
> +		status->private += size;
> +		if (vm->as.id >= 0)
> +			status->active += size;
> +	}
> +}
> +
>  static u64 mair_to_memattr(u64 mair, bool coherent)
>  {
>  	u64 memattr = 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 8d21e83d8aba..2aeb2522cdfa 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -5,10 +5,12 @@
>  #ifndef __PANTHOR_MMU_H__
>  #define __PANTHOR_MMU_H__
>  
> +#include <linux/types.h>
>  #include <linux/dma-resv.h>
>  
>  struct drm_exec;
>  struct drm_sched_job;
> +struct drm_memory_stats;
>  struct panthor_gem_object;
>  struct panthor_heap_pool;
>  struct panthor_vm;
> @@ -37,6 +39,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
>  struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
>  
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
> +
>  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
>  void panthor_vm_put(struct panthor_vm *vm);
>  struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 77b184c3fb0c..bb4b3ffadcd1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -628,7 +628,7 @@ struct panthor_group {
>  	 */
>  	struct panthor_kernel_bo *syncobjs;
>  
> -	/** @fdinfo: Per-file total cycle and timestamp values reference. */
> +	/** @fdinfo: Per-group total cycle and timestamp values and kernel BO sizes. */
>  	struct {
>  		/** @data: Total sampled values for jobs in queues from this group. */
>  		struct panthor_gpu_usage data;
> @@ -638,6 +638,9 @@ struct panthor_group {
>  		 * and job post-completion processing function
>  		 */
>  		struct mutex lock;
> +
> +		/** @bo_sizes: Aggregate size of private kernel BO's held by the group. */
> +		size_t kbo_sizes;
>  	} fdinfo;
>  
>  	/** @state: Group state. */
> @@ -3381,6 +3384,29 @@ group_create_queue(struct panthor_group *group,
>  	return ERR_PTR(ret);
>  }
>  
> +static void add_group_kbo_sizes(struct panthor_device *ptdev,
> +				struct panthor_group *group)
> +{
> +	struct panthor_queue *queue;
> +	int i;
> +
> +	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(group)))
> +		return;
> +	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
> +		return;
> +
> +	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
> +	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
> +	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
> +
> +	for (i = 0; i < group->queue_count; i++) {
> +		queue =	group->queues[i];
> +		group->fdinfo.kbo_sizes += queue->ringbuf->obj->size;
> +		group->fdinfo.kbo_sizes += queue->iface.mem->obj->size;
> +		group->fdinfo.kbo_sizes += queue->profiling.slots->obj->size;
> +	}
> +}
> +
>  #define MAX_GROUPS_PER_POOL		128
>  
>  int panthor_group_create(struct panthor_file *pfile,
> @@ -3505,6 +3531,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	}
>  	mutex_unlock(&sched->reset.lock);
>  
> +	add_group_kbo_sizes(group->ptdev, group);
>  	mutex_init(&group->fdinfo.lock);
>  
>  	return gid;
> @@ -3624,6 +3651,29 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
>  	pfile->groups = NULL;
>  }
>  
> +/**
> + * panthor_group_kbo_sizes() - Retrieve aggregate size of all private kernel BO's
> + * belonging to all the groups owned by an open Panthor file
> + * @pfile: File.
> + * @status: Memory status to be updated.
> + *
> + */
> +void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
> +{
> +	struct panthor_group_pool *gpool = pfile->groups;
> +	struct panthor_group *group;
> +	unsigned long i;
> +
> +	if (IS_ERR_OR_NULL(gpool))
> +		return;
> +	xa_for_each(&gpool->xa, i, group) {
> +		status->resident += group->fdinfo.kbo_sizes;
> +		status->private += group->fdinfo.kbo_sizes;
> +		if (group->csg_id >= 0)
> +			status->active += group->fdinfo.kbo_sizes;
> +	}
> +}
> +
>  static void job_release(struct kref *ref)
>  {
>  	struct panthor_job *job = container_of(ref, struct panthor_job, refcount);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index 5ae6b4bde7c5..4dd6a7fc8fbd 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -4,11 +4,14 @@
>  #ifndef __PANTHOR_SCHED_H__
>  #define __PANTHOR_SCHED_H__
>  
> +#include <linux/types.h>
> +
>  struct drm_exec;
>  struct dma_fence;
>  struct drm_file;
>  struct drm_gem_object;
>  struct drm_sched_job;
> +struct drm_memory_stats;
>  struct drm_panthor_group_create;
>  struct drm_panthor_queue_create;
>  struct drm_panthor_group_get_state;
> @@ -36,6 +39,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
>  
>  int panthor_group_pool_create(struct panthor_file *pfile);
>  void panthor_group_pool_destroy(struct panthor_file *pfile);
> +void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memory_stats *status);
>  
>  int panthor_sched_init(struct panthor_device *ptdev);
>  void panthor_sched_unplug(struct panthor_device *ptdev);
> -- 
> 2.47.0

Adrian Larumbe
