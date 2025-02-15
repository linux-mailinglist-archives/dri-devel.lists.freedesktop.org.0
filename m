Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4BA36D17
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 10:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4071C10E188;
	Sat, 15 Feb 2025 09:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WaYWSdY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1B10E188
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739612681;
 bh=1ULfGBgPrkYBEUwtxj+w4b9JlWLy1Aa/YFfZQLh2+m4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WaYWSdY6z6mSOO7LF+MdFZltF9A8Nmun7UbSFQl7JDKcAdLkmfpL1amr2Fvf7Rt/l
 +bsPZ7PifvBkXFTGsjfpikBESokpbylngotxBxfi0R22k9M6AGVMU9coHNT6xCXhY9
 J1s2zLZ7BrdePMoKG9IXzzo93uuwYWyLrAl14ASfu3vT0VVIKI+dXTBAXzYYIR5Naj
 ZYpfd6npV+lpXfJ0+K2i9DKjSJ5TO1diOCFwp8jU7AO7wBNXLT9Cq009BjCad1lyPr
 BBuugMnv39vQB+p7JjeXBlgHYbgsQbLo75iDpN0thtfyFQBYTdJ4Hh2IpYbbBupXkr
 HHQOqKgLMdpEQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F1C6417E10C2;
 Sat, 15 Feb 2025 10:44:40 +0100 (CET)
Date: Sat, 15 Feb 2025 10:44:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Mihail Atanassov
 <mihail.atanassov@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panthor: Avoid sleep locking in the internal
 BO size path
Message-ID: <20250215104438.13220f14@collabora.com>
In-Reply-To: <20250214210009.1994543-2-adrian.larumbe@collabora.com>
References: <20250214210009.1994543-1-adrian.larumbe@collabora.com>
 <20250214210009.1994543-2-adrian.larumbe@collabora.com>
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

On Fri, 14 Feb 2025 20:55:21 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit 434e5ca5b5d7 ("drm/panthor: Expose size of driver internal BO's ov=
er
> fdinfo") locks the VMS xarray, to avoid UAF errors when the same VM is
> being concurrently destroyed by another thread. However, that puts the
> current thread in atomic context, which means taking the VMS' heap locks
> will trigger a warning as the thread is no longer allowed to sleep.
>=20
> Because in this case replacing the heap mutex with a spinlock isn't
> feasible, the fdinfo handler no longer traverses the list of heaps for
> every single VM associated with an open DRM file. Instead, when a new heap
> chunk is allocated, its size is accumulated into a VM-wide tally, which
> also makes the atomic context code path somewhat faster.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO's ov=
er fdinfo")
> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 38 ++++++++------------------
>  drivers/gpu/drm/panthor/panthor_heap.h |  2 --
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 23 +++++++++++-----
>  drivers/gpu/drm/panthor/panthor_mmu.h  |  1 +
>  4 files changed, 28 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/pan=
thor/panthor_heap.c
> index db0285ce5812..e5e5953e4f87 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -127,6 +127,8 @@ static void panthor_free_heap_chunk(struct panthor_vm=
 *vm,
>  	heap->chunk_count--;
>  	mutex_unlock(&heap->lock);
> =20
> +	panthor_vm_heaps_size_accumulate(vm, -heap->chunk_size);
> +
>  	panthor_kernel_bo_destroy(chunk->bo);
>  	kfree(chunk);
>  }
> @@ -180,6 +182,8 @@ static int panthor_alloc_heap_chunk(struct panthor_de=
vice *ptdev,
>  	heap->chunk_count++;
>  	mutex_unlock(&heap->lock);
> =20
> +	panthor_vm_heaps_size_accumulate(vm, heap->chunk_size);
> +
>  	return 0;
> =20
>  err_destroy_bo:
> @@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap_poo=
l *pool,
>  			removed =3D chunk;
>  			list_del(&chunk->node);
>  			heap->chunk_count--;
> +			panthor_vm_heaps_size_accumulate(chunk->bo->vm, -heap->chunk_size);
>  			break;
>  		}
>  	}
> @@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev=
, struct panthor_vm *vm)
>  	if (ret)
>  		goto err_destroy_pool;
> =20
> +	panthor_vm_heaps_size_accumulate(vm, pool->gpu_contexts->obj->size);
> +
>  	return pool;
> =20
>  err_destroy_pool:
> @@ -594,8 +601,11 @@ void panthor_heap_pool_destroy(struct panthor_heap_p=
ool *pool)
>  	xa_for_each(&pool->xa, i, heap)
>  		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
> =20
> -	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
> +	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
> +		panthor_vm_heaps_size_accumulate(pool->gpu_contexts->vm,
> +					    -pool->gpu_contexts->obj->size);
>  		panthor_kernel_bo_destroy(pool->gpu_contexts);
> +	}
> =20
>  	/* Reflects the fact the pool has been destroyed. */
>  	pool->vm =3D NULL;
> @@ -603,29 +613,3 @@ void panthor_heap_pool_destroy(struct panthor_heap_p=
ool *pool)
> =20
>  	panthor_heap_pool_put(pool);
>  }
> -
> -/**
> - * panthor_heap_pool_size() - Calculate size of all chunks across all he=
aps in a pool
> - * @pool: Pool whose total chunk size to calculate.
> - *
> - * This function adds the size of all heap chunks across all heaps in the
> - * argument pool. It also adds the size of the gpu contexts kernel bo.
> - * It is meant to be used by fdinfo for displaying the size of internal
> - * driver BO's that aren't exposed to userspace through a GEM handle.
> - *
> - */
> -size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
> -{
> -	struct panthor_heap *heap;
> -	unsigned long i;
> -	size_t size =3D 0;
> -
> -	down_read(&pool->lock);
> -	xa_for_each(&pool->xa, i, heap)
> -		size +=3D heap->chunk_size * heap->chunk_count;
> -	up_read(&pool->lock);
> -
> -	size +=3D pool->gpu_contexts->obj->size;
> -
> -	return size;
> -}
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/pan=
thor/panthor_heap.h
> index e3358d4e8edb..25a5f2bba445 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.h
> +++ b/drivers/gpu/drm/panthor/panthor_heap.h
> @@ -27,8 +27,6 @@ struct panthor_heap_pool *
>  panthor_heap_pool_get(struct panthor_heap_pool *pool);
>  void panthor_heap_pool_put(struct panthor_heap_pool *pool);
> =20
> -size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
> -
>  int panthor_heap_grow(struct panthor_heap_pool *pool,
>  		      u64 heap_gpu_va,
>  		      u32 renderpasses_in_flight,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 8c6fc587ddc3..9e48b34fcf80 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -347,6 +347,14 @@ struct panthor_vm {
>  		struct mutex lock;
>  	} heaps;
> =20
> +	/**
> +	 * @fdinfo: VM-wide fdinfo fields.
> +	 */
> +	struct {
> +		/** @fdinfo.heaps_size: Size of all chunks across all heaps in the poo=
l. */
> +		atomic_t heaps_size;
> +	} fdinfo;

Feels more like a panthor_heap_pool field to me. If you do that,
you can keep the panthor_heap_pool_size() helper.

> +
>  	/** @node: Used to insert the VM in the panthor_mmu::vm::list. */
>  	struct list_head node;
> =20
> @@ -1541,6 +1549,8 @@ static void panthor_vm_destroy(struct panthor_vm *v=
m)
>  	vm->heaps.pool =3D NULL;
>  	mutex_unlock(&vm->heaps.lock);
> =20
> +	atomic_set(&vm->fdinfo.heaps_size, 0);
> +

I don't think that's needed, the VM is gone, so there's no way
someone can query its heaps size after that point.

>  	drm_WARN_ON(&vm->ptdev->base,
>  		    panthor_vm_unmap_range(vm, vm->base.mm_start, vm->base.mm_range));
>  	panthor_vm_put(vm);
> @@ -1963,13 +1973,7 @@ void panthor_vm_heaps_sizes(struct panthor_file *p=
file, struct drm_memory_stats
> =20
>  	xa_lock(&pfile->vms->xa);
>  	xa_for_each(&pfile->vms->xa, i, vm) {
> -		size_t size =3D 0;
> -
> -		mutex_lock(&vm->heaps.lock);
> -		if (vm->heaps.pool)
> -			size =3D panthor_heap_pool_size(vm->heaps.pool);
> -		mutex_unlock(&vm->heaps.lock);
> -
> +		size_t size =3D atomic_read(&vm->fdinfo.heaps_size);
>  		stats->resident +=3D size;
>  		if (vm->as.id >=3D 0)
>  			stats->active +=3D size;
> @@ -1977,6 +1981,11 @@ void panthor_vm_heaps_sizes(struct panthor_file *p=
file, struct drm_memory_stats
>  	xa_unlock(&pfile->vms->xa);
>  }
> =20
> +void panthor_vm_heaps_size_accumulate(struct panthor_vm *vm, ssize_t acc)
> +{
> +	atomic_add(acc, &vm->fdinfo.heaps_size);
> +}

Calling atomic_add() directly would probably be shorter, and I prefer
the idea of calling atomic_sub(size) instead of atomic_add(-size), so
how about we drop this helper and use atomic_add/sub() directly?

> +
>  static u64 mair_to_memattr(u64 mair, bool coherent)
>  {
>  	u64 memattr =3D 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/pant=
hor/panthor_mmu.h
> index fc274637114e..29030384eafe 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -39,6 +39,7 @@ struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
> =20
>  void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memor=
y_stats *stats);
> +void panthor_vm_heaps_size_accumulate(struct panthor_vm *vm, ssize_t acc=
);
> =20
>  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
>  void panthor_vm_put(struct panthor_vm *vm);

