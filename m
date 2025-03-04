Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA2A4D5CA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 09:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E9C10E205;
	Tue,  4 Mar 2025 08:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aYmC0ic0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810C10E205
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741075705;
 bh=TqwdvhkdF+IlPnumt9ZdEjwxTxBz79Zs40VYVW5s3PA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aYmC0ic0+2WmDaaF/H9WUdcDobxJwU29yWmdq8qOl23GYaXA6lgVhOKVTUy1O56A0
 c4arQl1CjjabBvquEQc+WkupHYBpe7Ph+nAS+xvTtZ/8BWg1bBP4B9pVxk7BYT5Ysm
 Kopg4LzERwGDiHhBFlxQEcIH8GKZwOhWGi4Uu6AxCZaVEVGLp6QyzR+KdVl6hmYfpg
 cxq8QMQzYUQ+zUiH9MvieD1xY9Tg+Iy/GddlzOTQNaihltJcmsFuXGoF88FVN/vvCL
 kI14orNlFp3873aUMrtt6A4IXzg8OYFxrU6VoaiOYSJqk0f+VOGpXHTdPLpt/SSKK7
 LvAVb2wNOPA4g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CC3117E088C;
 Tue,  4 Mar 2025 09:08:24 +0100 (CET)
Date: Tue, 4 Mar 2025 09:08:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Mihail Atanassov
 <mihail.atanassov@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/panthor: Avoid sleep locking in the internal
 BO size path
Message-ID: <20250304090819.47b7ca7e@collabora.com>
In-Reply-To: <20250303190923.1639985-2-adrian.larumbe@collabora.com>
References: <20250303190923.1639985-1-adrian.larumbe@collabora.com>
 <20250303190923.1639985-2-adrian.larumbe@collabora.com>
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

On Mon,  3 Mar 2025 19:08:46 +0000
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
> chunk is allocated, its size is accumulated into a pool-wide tally, which
> also makes the atomic context code path somewhat faster.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO's ov=
er fdinfo")

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 62 +++++++++++++-------------
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  8 +---
>  2 files changed, 31 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/pan=
thor/panthor_heap.c
> index db0285ce5812..3bdf61c14264 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -97,6 +97,9 @@ struct panthor_heap_pool {
> =20
>  	/** @gpu_contexts: Buffer object containing the GPU heap contexts. */
>  	struct panthor_kernel_bo *gpu_contexts;
> +
> +	/** @size: Size of all chunks across all heaps in the pool. */
> +	atomic_t size;
>  };
> =20
>  static int panthor_heap_ctx_stride(struct panthor_device *ptdev)
> @@ -118,7 +121,7 @@ static void *panthor_get_heap_ctx(struct panthor_heap=
_pool *pool, int id)
>  	       panthor_get_heap_ctx_offset(pool, id);
>  }
> =20
> -static void panthor_free_heap_chunk(struct panthor_vm *vm,
> +static void panthor_free_heap_chunk(struct panthor_heap_pool *pool,
>  				    struct panthor_heap *heap,
>  				    struct panthor_heap_chunk *chunk)
>  {
> @@ -127,12 +130,13 @@ static void panthor_free_heap_chunk(struct panthor_=
vm *vm,
>  	heap->chunk_count--;
>  	mutex_unlock(&heap->lock);
> =20
> +	atomic_sub(heap->chunk_size, &pool->size);
> +
>  	panthor_kernel_bo_destroy(chunk->bo);
>  	kfree(chunk);
>  }
> =20
> -static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
> -				    struct panthor_vm *vm,
> +static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
>  				    struct panthor_heap *heap,
>  				    bool initial_chunk)
>  {
> @@ -144,7 +148,7 @@ static int panthor_alloc_heap_chunk(struct panthor_de=
vice *ptdev,
>  	if (!chunk)
>  		return -ENOMEM;
> =20
> -	chunk->bo =3D panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
> +	chunk->bo =3D panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chu=
nk_size,
>  					     DRM_PANTHOR_BO_NO_MMAP,
>  					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
>  					     PANTHOR_VM_KERNEL_AUTO_VA);
> @@ -180,6 +184,8 @@ static int panthor_alloc_heap_chunk(struct panthor_de=
vice *ptdev,
>  	heap->chunk_count++;
>  	mutex_unlock(&heap->lock);
> =20
> +	atomic_add(heap->chunk_size, &pool->size);
> +
>  	return 0;
> =20
>  err_destroy_bo:
> @@ -191,17 +197,16 @@ static int panthor_alloc_heap_chunk(struct panthor_=
device *ptdev,
>  	return ret;
>  }
> =20
> -static void panthor_free_heap_chunks(struct panthor_vm *vm,
> +static void panthor_free_heap_chunks(struct panthor_heap_pool *pool,
>  				     struct panthor_heap *heap)
>  {
>  	struct panthor_heap_chunk *chunk, *tmp;
> =20
>  	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node)
> -		panthor_free_heap_chunk(vm, heap, chunk);
> +		panthor_free_heap_chunk(pool, heap, chunk);
>  }
> =20
> -static int panthor_alloc_heap_chunks(struct panthor_device *ptdev,
> -				     struct panthor_vm *vm,
> +static int panthor_alloc_heap_chunks(struct panthor_heap_pool *pool,
>  				     struct panthor_heap *heap,
>  				     u32 chunk_count)
>  {
> @@ -209,7 +214,7 @@ static int panthor_alloc_heap_chunks(struct panthor_d=
evice *ptdev,
>  	u32 i;
> =20
>  	for (i =3D 0; i < chunk_count; i++) {
> -		ret =3D panthor_alloc_heap_chunk(ptdev, vm, heap, true);
> +		ret =3D panthor_alloc_heap_chunk(pool, heap, true);
>  		if (ret)
>  			return ret;
>  	}
> @@ -226,7 +231,7 @@ panthor_heap_destroy_locked(struct panthor_heap_pool =
*pool, u32 handle)
>  	if (!heap)
>  		return -EINVAL;
> =20
> -	panthor_free_heap_chunks(pool->vm, heap);
> +	panthor_free_heap_chunks(pool, heap);
>  	mutex_destroy(&heap->lock);
>  	kfree(heap);
>  	return 0;
> @@ -308,8 +313,7 @@ int panthor_heap_create(struct panthor_heap_pool *poo=
l,
>  	heap->max_chunks =3D max_chunks;
>  	heap->target_in_flight =3D target_in_flight;
> =20
> -	ret =3D panthor_alloc_heap_chunks(pool->ptdev, vm, heap,
> -					initial_chunk_count);
> +	ret =3D panthor_alloc_heap_chunks(pool, heap, initial_chunk_count);
>  	if (ret)
>  		goto err_free_heap;
> =20
> @@ -342,7 +346,7 @@ int panthor_heap_create(struct panthor_heap_pool *poo=
l,
>  	return id;
> =20
>  err_free_heap:
> -	panthor_free_heap_chunks(pool->vm, heap);
> +	panthor_free_heap_chunks(pool, heap);
>  	mutex_destroy(&heap->lock);
>  	kfree(heap);
> =20
> @@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap_poo=
l *pool,
>  			removed =3D chunk;
>  			list_del(&chunk->node);
>  			heap->chunk_count--;
> +			atomic_sub(heap->chunk_size, &pool->size);
>  			break;
>  		}
>  	}
> @@ -466,7 +471,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>  	 * further jobs in this queue fail immediately instead of having to
>  	 * wait for the job timeout.
>  	 */
> -	ret =3D panthor_alloc_heap_chunk(pool->ptdev, pool->vm, heap, false);
> +	ret =3D panthor_alloc_heap_chunk(pool, heap, false);
>  	if (ret)
>  		goto out_unlock;
> =20
> @@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev=
, struct panthor_vm *vm)
>  	if (ret)
>  		goto err_destroy_pool;
> =20
> +	atomic_add(pool->gpu_contexts->obj->size, &pool->size);
> +
>  	return pool;
> =20
>  err_destroy_pool:
> @@ -594,8 +601,10 @@ void panthor_heap_pool_destroy(struct panthor_heap_p=
ool *pool)
>  	xa_for_each(&pool->xa, i, heap)
>  		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
> =20
> -	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
> +	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
> +		atomic_sub(pool->gpu_contexts->obj->size, &pool->size);
>  		panthor_kernel_bo_destroy(pool->gpu_contexts);
> +	}
> =20
>  	/* Reflects the fact the pool has been destroyed. */
>  	pool->vm =3D NULL;
> @@ -605,27 +614,16 @@ void panthor_heap_pool_destroy(struct panthor_heap_=
pool *pool)
>  }
> =20
>  /**
> - * panthor_heap_pool_size() - Calculate size of all chunks across all he=
aps in a pool
> - * @pool: Pool whose total chunk size to calculate.
> + * panthor_heap_pool_size() - Get a heap pool's total size
> + * @pool: Pool whose total chunks size to return
>   *
> - * This function adds the size of all heap chunks across all heaps in the
> - * argument pool. It also adds the size of the gpu contexts kernel bo.
> - * It is meant to be used by fdinfo for displaying the size of internal
> - * driver BO's that aren't exposed to userspace through a GEM handle.
> + * Returns the aggregated size of all chunks for all heaps in the pool
>   *
>   */
>  size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
>  {
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
> +	if (!pool)
> +		return 0;
> =20
> -	return size;
> +	return atomic_read(&pool->size);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 8c6fc587ddc3..12a02e28f50f 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1963,13 +1963,7 @@ void panthor_vm_heaps_sizes(struct panthor_file *p=
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
> +		size_t size =3D panthor_heap_pool_size(vm->heaps.pool);
>  		stats->resident +=3D size;
>  		if (vm->as.id >=3D 0)
>  			stats->active +=3D size;

