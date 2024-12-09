Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFA9E95EA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED99810E726;
	Mon,  9 Dec 2024 13:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jeb/S6mu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC5C10E726
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733749896;
 bh=eWrwGPGz/lrqNsyg+rcigmjjVXI/0H9sLvLHdhhHvpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jeb/S6muAA0qk+Nu9y4zceb3BcEScY1q2fA0hhVs1ycTevfVkkv4Lc0ZL8g8lYBVD
 7LojrA7IKNGl4oQbO1ovpX2Gs+w7Wq+SAt62FQxT3v/bZ0l6u9d0Wj8ZZB+kdUUpvY
 +LlUkcCnNrHLqjFxORu5MxsMsSkHYz5VWoci9DyAa018tGhMR2t2Jc0udtBJdcNbSG
 WvEIvIUjbGVp8mT8XRl+Yhja4XPK1CTKFQ2gEe5A0s2UGBs5S2cvVkMl4OaKNV0yXv
 jC4TVTPWF2cZp4bMum9Oe+gOtt8nSkzlnBubU4BnqRN1OsiIgVq/t5NLSDvxvYIpJj
 aKO0dj2qBq+GQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B2AD217E3766;
 Mon,  9 Dec 2024 14:11:35 +0100 (CET)
Date: Mon, 9 Dec 2024 14:11:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <20241209141130.6e8bfd3c@collabora.com>
In-Reply-To: <20241205233915.2180630-1-adrian.larumbe@collabora.com>
References: <20241205233915.2180630-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu,  5 Dec 2024 23:39:07 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This will display the sizes of kenrel BO's bound to an open file, which a=
re
> otherwise not exposed to UM through a handle.
>=20
> The sizes recorded are as follows:
>  - Per group: suspend buffer, protm-suspend buffer, syncobjcs
>  - Per queue: ringbuffer, profiling slots, firmware interface
>  - For all heaps in all heap pools across all VM's bound to an open file,
>  record size of all heap chuks, and for each pool the gpu_context BO too.
>=20
> This does not record the size of FW regions, as these aren't bound to a
> specific open file and remain active through the whole life of the driver.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 14 +++++++++-
>  drivers/gpu/drm/panthor/panthor_heap.c  | 26 ++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_heap.h  |  2 ++
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 35 +++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  4 +++
>  drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |  4 +++
>  7 files changed, 110 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index ac7e53f6e3f0..94f1d5f16e35 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -876,7 +876,7 @@ static int panthor_ioctl_vm_create(struct drm_device =
*ddev, void *data,
>  	if (!drm_dev_enter(ddev, &cookie))
>  		return -ENODEV;
> =20
> -	ret =3D panthor_vm_pool_create_vm(ptdev, pfile->vms,  args);
> +	ret =3D panthor_vm_pool_create_vm(ptdev, pfile->vms, args);

Looks like an unrelated formatting fix. Can you move it to its own
commit?

>  	if (ret >=3D 0) {
>  		args->id =3D ret;
>  		ret =3D 0;
> @@ -1457,12 +1457,24 @@ static void panthor_gpu_show_fdinfo(struct pantho=
r_device *ptdev,
>  	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequenc=
y);
>  }
> =20
> +static void panthor_show_internal_memory_stats(struct drm_printer *p, st=
ruct drm_file *file)
> +{
> +	struct panthor_file *pfile =3D file->driver_priv;
> +	struct drm_memory_stats status =3D {0};
> +
> +	panthor_group_internal_sizes(pfile, &status);
> +	panthor_vm_heaps_size(pfile, &status);
> +
> +	drm_print_memory_stats(p, &status, DRM_GEM_OBJECT_RESIDENT, "internal");
> +}
> +
>  static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *=
file)
>  {
>  	struct drm_device *dev =3D file->minor->dev;
>  	struct panthor_device *ptdev =3D container_of(dev, struct panthor_devic=
e, base);
> =20
>  	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +	panthor_show_internal_memory_stats(p, file);
> =20
>  	drm_show_memory_stats(p, file);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/pan=
thor/panthor_heap.c
> index 3796a9eb22af..e4464c5e93ef 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -603,3 +603,29 @@ void panthor_heap_pool_destroy(struct panthor_heap_p=
ool *pool)
> =20
>  	panthor_heap_pool_put(pool);
>  }
> +
> +/**
> + * panthor_heap_pool_size() - Calculate size of all chunks across all he=
aps in a pool
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
> +	size_t size =3D 0;
> +
> +	down_write(&pool->lock);
> +	xa_for_each(&pool->xa, i, heap)
> +		size +=3D heap->chunk_size * heap->chunk_count;
> +	up_write(&pool->lock);
> +
> +	size +=3D pool->gpu_contexts->obj->size;
> +
> +	return size;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/pan=
thor/panthor_heap.h
> index 25a5f2bba445..e3358d4e8edb 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.h
> +++ b/drivers/gpu/drm/panthor/panthor_heap.h
> @@ -27,6 +27,8 @@ struct panthor_heap_pool *
>  panthor_heap_pool_get(struct panthor_heap_pool *pool);
>  void panthor_heap_pool_put(struct panthor_heap_pool *pool);
> =20
> +size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
> +
>  int panthor_heap_grow(struct panthor_heap_pool *pool,
>  		      u64 heap_gpu_va,
>  		      u32 renderpasses_in_flight,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 7ba8470a7543..e2f27a1667c3 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1937,6 +1937,41 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool=
(struct panthor_vm *vm, bool c
>  	return pool;
>  }
> =20
> +/**
> + * panthor_vm_heaps_size() - Calculate size of all heap chunks across all
> + * heaps over all the heap pools in a VM
> + * @pfile: File.
> + * @status: Memory status to be updated.
> + *
> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If th=
e VM
> + * is active, record the size as active as well.
> + */
> +void panthor_vm_heaps_size(struct panthor_file *pfile, struct drm_memory=
_stats *status)
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
> +		size =3D panthor_heap_pool_size(vm->heaps.pool);
> +		mutex_unlock(&vm->heaps.lock);
> +
> +		status->resident +=3D size;
> +		status->private +=3D size;
> +		if (vm->as.id >=3D 0)
> +			status->active +=3D size;
> +	}
> +}
> +
>  static u64 mair_to_memattr(u64 mair, bool coherent)
>  {
>  	u64 memattr =3D 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/pant=
hor/panthor_mmu.h
> index 8d21e83d8aba..25f7aea39ed9 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -5,10 +5,12 @@
>  #ifndef __PANTHOR_MMU_H__
>  #define __PANTHOR_MMU_H__
> =20
> +#include <linux/types.h>
>  #include <linux/dma-resv.h>
> =20
>  struct drm_exec;
>  struct drm_sched_job;
> +struct drm_memory_stats;
>  struct panthor_gem_object;
>  struct panthor_heap_pool;
>  struct panthor_vm;
> @@ -37,6 +39,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
>  struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
> =20
> +void panthor_vm_heaps_size(struct panthor_file *pfile, struct drm_memory=
_stats *status);
> +
>  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
>  void panthor_vm_put(struct panthor_vm *vm);
>  struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool =
for_mcu,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index ef4bec7ff9c7..6a4d5f63c86b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -582,6 +582,9 @@ struct panthor_group {
>  	/** @queues: Queues owned by this group. */
>  	struct panthor_queue *queues[MAX_CS_PER_CSG];
> =20
> +	/** @bo_sizes: Aggregate size of internal kernel BO's held by the group=
. */
> +	size_t kbo_sizes;

Given fdinfo_show() is not a hot-path, I'd do the sum of all kbos in a
helper function taking a group as an argument.

> +
>  	/**
>  	 * @csg_id: ID of the FW group slot.
>  	 *
> @@ -3305,6 +3308,7 @@ group_create_queue(struct panthor_group *group,
>  		ret =3D PTR_ERR(queue->ringbuf);
>  		goto err_free_queue;
>  	}
> +	group->kbo_sizes +=3D queue->ringbuf->obj->size;
> =20
>  	ret =3D panthor_kernel_bo_vmap(queue->ringbuf);
>  	if (ret)
> @@ -3319,6 +3323,7 @@ group_create_queue(struct panthor_group *group,
>  		ret =3D PTR_ERR(queue->iface.mem);
>  		goto err_free_queue;
>  	}
> +	group->kbo_sizes +=3D queue->iface.mem->obj->size;
> =20
>  	queue->profiling.slot_count =3D
>  		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
> @@ -3336,6 +3341,7 @@ group_create_queue(struct panthor_group *group,
>  		ret =3D PTR_ERR(queue->profiling.slots);
>  		goto err_free_queue;
>  	}
> +	group->kbo_sizes +=3D queue->profiling.slots->obj->size;
> =20
>  	ret =3D panthor_kernel_bo_vmap(queue->profiling.slots);
>  	if (ret)
> @@ -3433,6 +3439,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  		group->suspend_buf =3D NULL;
>  		goto err_put_group;
>  	}
> +	group->kbo_sizes +=3D group->suspend_buf->obj->size;
> =20
>  	suspend_size =3D csg_iface->control->protm_suspend_size;
>  	group->protm_suspend_buf =3D panthor_fw_alloc_suspend_buf_mem(ptdev, su=
spend_size);
> @@ -3441,6 +3448,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  		group->protm_suspend_buf =3D NULL;
>  		goto err_put_group;
>  	}
> +	group->kbo_sizes +=3D group->protm_suspend_buf->obj->size;
> =20
>  	group->syncobjs =3D panthor_kernel_bo_create(ptdev, group->vm,
>  						   group_args->queues.count *
> @@ -3453,6 +3461,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  		ret =3D PTR_ERR(group->syncobjs);
>  		goto err_put_group;
>  	}
> +	group->kbo_sizes +=3D group->syncobjs->obj->size;
> =20
>  	ret =3D panthor_kernel_bo_vmap(group->syncobjs);
>  	if (ret)
> @@ -3606,6 +3615,23 @@ void panthor_group_pool_destroy(struct panthor_fil=
e *pfile)
>  	pfile->groups =3D NULL;
>  }
> =20
> +void panthor_group_internal_sizes(struct panthor_file *pfile, struct drm=
_memory_stats *status)
> +{
> +	struct panthor_group_pool *gpool =3D pfile->groups;
> +	struct panthor_group *group;
> +	unsigned long i;
> +
> +	if (IS_ERR_OR_NULL(gpool))
> +		return;
> +
> +	xa_for_each(&gpool->xa, i, group) {
> +		status->resident +=3D group->kbo_sizes;
> +		status->private +=3D group->kbo_sizes;
> +		if (group->csg_id >=3D 0)
> +			status->active +=3D group->kbo_sizes;
> +	}
> +}
> +
>  static void job_release(struct kref *ref)
>  {
>  	struct panthor_job *job =3D container_of(ref, struct panthor_job, refco=
unt);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/pa=
nthor/panthor_sched.h
> index 5ae6b4bde7c5..e17c56a40d9c 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -4,11 +4,14 @@
>  #ifndef __PANTHOR_SCHED_H__
>  #define __PANTHOR_SCHED_H__
> =20
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
> @@ -36,6 +39,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, st=
ruct drm_sched_job *job);
> =20
>  int panthor_group_pool_create(struct panthor_file *pfile);
>  void panthor_group_pool_destroy(struct panthor_file *pfile);
> +void panthor_group_internal_sizes(struct panthor_file *pfile, struct drm=
_memory_stats *status);

s/panthor_group_internal_sizes/panthor_group_kbo_sizes/, as I find
the term internal a bit vague.

This looks good otherwise, and I certainly prefer this version over the
previous one involving a global lock and per-file kernel-BO
registration.
