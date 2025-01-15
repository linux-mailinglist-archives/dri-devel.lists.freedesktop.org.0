Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BEA123E2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71F710E663;
	Wed, 15 Jan 2025 12:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YNB4rmVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1D10E663
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736944678;
 bh=cZNI0oaGyOZ/qWThx+5kVZWZErCBbxjB86ymcisBx0o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YNB4rmVj0yBmWtb285hJ6vb71TuXVZ3+8noVr6QdVKCMyHVv8LVobwB5IA7QrXRge
 kT1zhu7OGeogPV9WyWwVMrYJ/vtntuqat01VtrZNNvF6o0fKjFTYU2ir4BidEOtKtY
 pHuR4UY3nXgS4KTDVdHY4x5pE183IRlQmJmngTgZtUXPLC87wDu2wnc/Ko7Se5SAUR
 Qb6dipCNmc0wearbcjYB8u2BHg/l0P9XdDVEXx8fuMGPs2/KWEp5L3D9mRqnCPWQrX
 2PnDuDqRd2yDz6Dpu1REQr5JgDP9UIvsJbzk3yBnYdd8tYJpApRiOpPXLW3H3k3WvV
 69HFAQGP3IZjw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8790017E06BE;
 Wed, 15 Jan 2025 13:37:57 +0100 (CET)
Date: Wed, 15 Jan 2025 13:37:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Mihail
 Atanassov <mihail.atanassov@arm.com>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v8 3/4] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <20250115133752.1672fd05@collabora.com>
In-Reply-To: <20250114173406.3060248-4-adrian.larumbe@collabora.com>
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
 <20250114173406.3060248-4-adrian.larumbe@collabora.com>
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

On Tue, 14 Jan 2025 17:34:02 +0000
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
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 14 +++++++
>  drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 34 +++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 51 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_sched.h |  2 +
>  7 files changed, 131 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index ac7e53f6e3f0..b75a9251f578 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1457,12 +1457,26 @@ static void panthor_gpu_show_fdinfo(struct pantho=
r_device *ptdev,
>  	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequenc=
y);
>  }
> =20
> +static void panthor_show_internal_memory_stats(struct drm_printer *p, st=
ruct drm_file *file)
> +{
> +	char *drv_name =3D file->minor->dev->driver->name;
> +	struct panthor_file *pfile =3D file->driver_priv;
> +	struct drm_memory_stats stats =3D {0};
> +
> +	panthor_group_kbo_sizes(pfile, &stats);
> +	panthor_vm_heaps_sizes(pfile, &stats);
> +
> +	drm_fdinfo_print_size(p, drv_name, "resident", "memory", stats.resident=
);
> +	drm_fdinfo_print_size(p, drv_name, "active", "memory", stats.active);
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
> index 3796a9eb22af..db0285ce5812 100644
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
> +	down_read(&pool->lock);
> +	xa_for_each(&pool->xa, i, heap)
> +		size +=3D heap->chunk_size * heap->chunk_count;
> +	up_read(&pool->lock);
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
> index c3f0b0225cf9..b43073010b7f 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1941,6 +1941,40 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool=
(struct panthor_vm *vm, bool c
>  	return pool;
>  }
> =20
> +/**
> + * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across a=
ll
> + * heaps over all the heap pools in a VM
> + * @pfile: File.
> + * @stats: Memory stats to be updated.
> + *
> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If th=
e VM
> + * is active, record the size as active as well.
> + */
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memor=
y_stats *stats)
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
> +		stats->resident +=3D size;
> +		if (vm->as.id >=3D 0)
> +			stats->active +=3D size;
> +	}
> +}
> +
>  static u64 mair_to_memattr(u64 mair, bool coherent)
>  {
>  	u64 memattr =3D 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/pant=
hor/panthor_mmu.h
> index 8d21e83d8aba..fc274637114e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -9,6 +9,7 @@
> =20
>  struct drm_exec;
>  struct drm_sched_job;
> +struct drm_memory_stats;
>  struct panthor_gem_object;
>  struct panthor_heap_pool;
>  struct panthor_vm;
> @@ -37,6 +38,8 @@ int panthor_vm_flush_all(struct panthor_vm *vm);
>  struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
> =20
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memor=
y_stats *stats);
> +
>  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
>  void panthor_vm_put(struct panthor_vm *vm);
>  struct panthor_vm *panthor_vm_create(struct panthor_device *ptdev, bool =
for_mcu,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index ef4bec7ff9c7..75b788c580a7 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -618,7 +618,7 @@ struct panthor_group {
>  	 */
>  	struct panthor_kernel_bo *syncobjs;
> =20
> -	/** @fdinfo: Per-file total cycle and timestamp values reference. */
> +	/** @fdinfo: Per-group total cycle and timestamp values and kernel BO s=
izes. */

Each subfield is documented, so let's just say "Per-file info exposed
through /proc/<process>/fdinfo".

>  	struct {
>  		/** @data: Total sampled values for jobs in queues from this group. */
>  		struct panthor_gpu_usage data;
> @@ -628,6 +628,9 @@ struct panthor_group {
>  		 * and job post-completion processing function
>  		 */
>  		struct mutex lock;
> +
> +		/** @kbo_sizes: Aggregate size of private kernel BO's held by the grou=
p. */

@fdinfo.kbo_sizes otherwise the doc builder complains.

> +		size_t kbo_sizes;
>  	} fdinfo;
> =20
>  	/** @state: Group state. */
> @@ -3365,6 +3368,29 @@ group_create_queue(struct panthor_group *group,
>  	return ERR_PTR(ret);
>  }
> =20
> +static void add_group_kbo_sizes(struct panthor_device *ptdev,
> +				struct panthor_group *group)
> +{
> +	struct panthor_queue *queue;
> +	int i;
> +
> +	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(group)))
> +		return;
> +	if (drm_WARN_ON(&ptdev->base, ptdev !=3D group->ptdev))
> +		return;
> +
> +	group->fdinfo.kbo_sizes +=3D group->suspend_buf->obj->size;
> +	group->fdinfo.kbo_sizes +=3D group->protm_suspend_buf->obj->size;
> +	group->fdinfo.kbo_sizes +=3D group->syncobjs->obj->size;
> +
> +	for (i =3D 0; i < group->queue_count; i++) {
> +		queue =3D	group->queues[i];
> +		group->fdinfo.kbo_sizes +=3D queue->ringbuf->obj->size;
> +		group->fdinfo.kbo_sizes +=3D queue->iface.mem->obj->size;
> +		group->fdinfo.kbo_sizes +=3D queue->profiling.slots->obj->size;
> +	}
> +}
> +
>  #define MAX_GROUPS_PER_POOL		128
> =20
>  int panthor_group_create(struct panthor_file *pfile,
> @@ -3489,6 +3515,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	}
>  	mutex_unlock(&sched->reset.lock);
> =20
> +	add_group_kbo_sizes(group->ptdev, group);
>  	mutex_init(&group->fdinfo.lock);
> =20
>  	return gid;
> @@ -3606,6 +3633,28 @@ void panthor_group_pool_destroy(struct panthor_fil=
e *pfile)
>  	pfile->groups =3D NULL;
>  }
> =20
> +/**
> + * panthor_group_kbo_sizes() - Retrieve aggregate size of all private ke=
rnel BO's
> + * belonging to all the groups owned by an open Panthor file
> + * @pfile: File.
> + * @stats: Memory statistics to be updated.
> + *
> + */
> +void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memo=
ry_stats *stats)

The panthor_group prefix is a bit confusing since it's not applying to
a group but to all groups attached to a pfile. How about
panthor_fdinfo_gather_group_mem_info() to follow the
panthor_fdinfo_gather_group_samples() naming?

> +{
> +	struct panthor_group_pool *gpool =3D pfile->groups;
> +	struct panthor_group *group;
> +	unsigned long i;
> +
> +	if (IS_ERR_OR_NULL(gpool))
> +		return;

I suspect we need to take a lock to protect against group removal,
otherwise you might end up with a UAF.

> +	xa_for_each(&gpool->xa, i, group) {
> +		stats->resident +=3D group->fdinfo.kbo_sizes;
> +		if (group->csg_id >=3D 0)
> +			stats->active +=3D group->fdinfo.kbo_sizes;
> +	}
> +}
> +
>  static void job_release(struct kref *ref)
>  {
>  	struct panthor_job *job =3D container_of(ref, struct panthor_job, refco=
unt);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/pa=
nthor/panthor_sched.h
> index 5ae6b4bde7c5..bfe26b26a15b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -9,6 +9,7 @@ struct dma_fence;
>  struct drm_file;
>  struct drm_gem_object;
>  struct drm_sched_job;
> +struct drm_memory_stats;
>  struct drm_panthor_group_create;
>  struct drm_panthor_queue_create;
>  struct drm_panthor_group_get_state;
> @@ -36,6 +37,7 @@ void panthor_job_update_resvs(struct drm_exec *exec, st=
ruct drm_sched_job *job);
> =20
>  int panthor_group_pool_create(struct panthor_file *pfile);
>  void panthor_group_pool_destroy(struct panthor_file *pfile);
> +void panthor_group_kbo_sizes(struct panthor_file *pfile, struct drm_memo=
ry_stats *stats);
> =20
>  int panthor_sched_init(struct panthor_device *ptdev);
>  void panthor_sched_unplug(struct panthor_device *ptdev);

