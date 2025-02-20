Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B0EA3E5D4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5417C10E061;
	Thu, 20 Feb 2025 20:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="di9T55Bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EEE10E061
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 20:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740083194; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g6YzpYu5p0hajy/Q1G+OT34zCRoEesIqdghLYuSTur1MPePxXDkeymNdj/LQsa2IFCUreZBRTosXNggR7v9uyEOSXEJEhQ/PkaMntWW9/nXJPMPlHW7j/JAbClPPNa1kBbVrjKw/Yqbpm8e38EiY46YDS5gQJfARUWB7HMX90+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740083194;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IkP67AER6aEjnCYCWLq5wbAPovaeURUiPdxzZYvXBRs=; 
 b=AVZ/NdQVHdUL76m8XEOLpImIOETidbYhQUb7KGGQlvFyXP3tDlVL72tFZe2QrVuN3jRMWHCCqeesGHhixwhQsQMEUdpQ4pnNsUkF5xsR3VEfUDqNo0E3BtG47RI6aF3Yg2KttMns3HsAwc3LcmZ7z/XgHcsZZieM5USo9nF2SF8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740083194; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=IkP67AER6aEjnCYCWLq5wbAPovaeURUiPdxzZYvXBRs=;
 b=di9T55Bzo35577mm2tI2Zz5251VuRvQnJPv+W9G5busu1Usj2vSntOACxO8JE7nR
 /UQNVpWAp43POlOa3ADPhO+yoaOGKI2sdSZQ6mNqsClkEHUewqOQ1eFSmnjpwDU09w2
 q0IamfQPQ1Dqa3vDhRPTfMfSxY++Mi0KO6yPemiM=
Received: by mx.zohomail.com with SMTPS id 1740083192429330.01870912248773;
 Thu, 20 Feb 2025 12:26:32 -0800 (PST)
Date: Thu, 20 Feb 2025 20:26:23 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Mihail Atanassov <mihail.atanassov@arm.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panthor: Avoid sleep locking in the internal
 BO size path
Message-ID: <22tktof6433nshmhihwjpvvgnwpos3v4mkggxqikxbta5p4s57@w2gzdqudhbfi>
References: <20250214210009.1994543-1-adrian.larumbe@collabora.com>
 <20250214210009.1994543-2-adrian.larumbe@collabora.com>
 <20250215104438.13220f14@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250215104438.13220f14@collabora.com>
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

Hi Boris,

On 15.02.2025 10:44, Boris Brezillon wrote:
> On Fri, 14 Feb 2025 20:55:21 +0000
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > Commit 434e5ca5b5d7 ("drm/panthor: Expose size of driver internal BO's over
> > fdinfo") locks the VMS xarray, to avoid UAF errors when the same VM is
> > being concurrently destroyed by another thread. However, that puts the
> > current thread in atomic context, which means taking the VMS' heap locks
> > will trigger a warning as the thread is no longer allowed to sleep.
> >
> > Because in this case replacing the heap mutex with a spinlock isn't
> > feasible, the fdinfo handler no longer traverses the list of heaps for
> > every single VM associated with an open DRM file. Instead, when a new heap
> > chunk is allocated, its size is accumulated into a VM-wide tally, which
> > also makes the atomic context code path somewhat faster.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO's over fdinfo")
> > ---
> >  drivers/gpu/drm/panthor/panthor_heap.c | 38 ++++++++------------------
> >  drivers/gpu/drm/panthor/panthor_heap.h |  2 --
> >  drivers/gpu/drm/panthor/panthor_mmu.c  | 23 +++++++++++-----
> >  drivers/gpu/drm/panthor/panthor_mmu.h  |  1 +
> >  4 files changed, 28 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> > index db0285ce5812..e5e5953e4f87 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > @@ -127,6 +127,8 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
> >  	heap->chunk_count--;
> >  	mutex_unlock(&heap->lock);
> >
> > +	panthor_vm_heaps_size_accumulate(vm, -heap->chunk_size);
> > +
> >  	panthor_kernel_bo_destroy(chunk->bo);
> >  	kfree(chunk);
> >  }
> > @@ -180,6 +182,8 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
> >  	heap->chunk_count++;
> >  	mutex_unlock(&heap->lock);
> >
> > +	panthor_vm_heaps_size_accumulate(vm, heap->chunk_size);
> > +
> >  	return 0;
> >
> >  err_destroy_bo:
> > @@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
> >  			removed = chunk;
> >  			list_del(&chunk->node);
> >  			heap->chunk_count--;
> > +			panthor_vm_heaps_size_accumulate(chunk->bo->vm, -heap->chunk_size);
> >  			break;
> >  		}
> >  	}
> > @@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
> >  	if (ret)
> >  		goto err_destroy_pool;
> >
> > +	panthor_vm_heaps_size_accumulate(vm, pool->gpu_contexts->obj->size);
> > +
> >  	return pool;
> >
> >  err_destroy_pool:
> > @@ -594,8 +601,11 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
> >  	xa_for_each(&pool->xa, i, heap)
> >  		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
> >
> > -	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
> > +	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
> > +		panthor_vm_heaps_size_accumulate(pool->gpu_contexts->vm,
> > +					    -pool->gpu_contexts->obj->size);
> >  		panthor_kernel_bo_destroy(pool->gpu_contexts);
> > +	}
> >
> >  	/* Reflects the fact the pool has been destroyed. */
> >  	pool->vm = NULL;
> > @@ -603,29 +613,3 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
> >
> >  	panthor_heap_pool_put(pool);
> >  }
> > -
> > -/**
> > - * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
> > - * @pool: Pool whose total chunk size to calculate.
> > - *
> > - * This function adds the size of all heap chunks across all heaps in the
> > - * argument pool. It also adds the size of the gpu contexts kernel bo.
> > - * It is meant to be used by fdinfo for displaying the size of internal
> > - * driver BO's that aren't exposed to userspace through a GEM handle.
> > - *
> > - */
> > -size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
> > -{
> > -	struct panthor_heap *heap;
> > -	unsigned long i;
> > -	size_t size = 0;
> > -
> > -	down_read(&pool->lock);
> > -	xa_for_each(&pool->xa, i, heap)
> > -		size += heap->chunk_size * heap->chunk_count;
> > -	up_read(&pool->lock);
> > -
> > -	size += pool->gpu_contexts->obj->size;
> > -
> > -	return size;
> > -}
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
> > index e3358d4e8edb..25a5f2bba445 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.h
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.h
> > @@ -27,8 +27,6 @@ struct panthor_heap_pool *
> >  panthor_heap_pool_get(struct panthor_heap_pool *pool);
> >  void panthor_heap_pool_put(struct panthor_heap_pool *pool);
> >
> > -size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
> > -
> >  int panthor_heap_grow(struct panthor_heap_pool *pool,
> >  		      u64 heap_gpu_va,
> >  		      u32 renderpasses_in_flight,
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 8c6fc587ddc3..9e48b34fcf80 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -347,6 +347,14 @@ struct panthor_vm {
> >  		struct mutex lock;
> >  	} heaps;
> >
> > +	/**
> > +	 * @fdinfo: VM-wide fdinfo fields.
> > +	 */
> > +	struct {
> > +		/** @fdinfo.heaps_size: Size of all chunks across all heaps in the pool. */
> > +		atomic_t heaps_size;
> > +	} fdinfo;
>
> Feels more like a panthor_heap_pool field to me. If you do that,
> you can keep the panthor_heap_pool_size() helper.

The only downside of storing a per-heap-pool fdinfo size for its chunks size total is that we'll
have to traverse all the heap pools owned by a VM any time the fdinfo handler for an open
DRM file is invoked. That means spending a longer time with the vms xarray lock taken.

> > +
> >  	/** @node: Used to insert the VM in the panthor_mmu::vm::list. */
> >  	struct list_head node;
> >
> > @@ -1541,6 +1549,8 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
> >  	vm->heaps.pool = NULL;
> >  	mutex_unlock(&vm->heaps.lock);
> >
> > +	atomic_set(&vm->fdinfo.heaps_size, 0);
> > +
>
> I don't think that's needed, the VM is gone, so there's no way
> someone can query its heaps size after that point.

You're right, I had thought destruction doesn't always equal removal until
the refcnt for the VM goes to zero, but it seems all code paths that lead to
panthor_vm_destroy() either remove the VM from the VMS xarray or delete
that xarray altogether. I'll get rid of this line in the next revision.

> >  	drm_WARN_ON(&vm->ptdev->base,
> >  		    panthor_vm_unmap_range(vm, vm->base.mm_start, vm->base.mm_range));
> >  	panthor_vm_put(vm);
> > @@ -1963,13 +1973,7 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
> >
> >  	xa_lock(&pfile->vms->xa);
> >  	xa_for_each(&pfile->vms->xa, i, vm) {
> > -		size_t size = 0;
> > -
> > -		mutex_lock(&vm->heaps.lock);
> > -		if (vm->heaps.pool)
> > -			size = panthor_heap_pool_size(vm->heaps.pool);
> > -		mutex_unlock(&vm->heaps.lock);
> > -
> > +		size_t size = atomic_read(&vm->fdinfo.heaps_size);
> >  		stats->resident += size;
> >  		if (vm->as.id >= 0)
> >  			stats->active += size;
> > @@ -1977,6 +1981,11 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
> >  	xa_unlock(&pfile->vms->xa);
> >  }
> >
> > +void panthor_vm_heaps_size_accumulate(struct panthor_vm *vm, ssize_t acc)
> > +{
> > +	atomic_add(acc, &vm->fdinfo.heaps_size);
> > +}
>
> Calling atomic_add() directly would probably be shorter, and I prefer
> the idea of calling atomic_sub(size) instead of atomic_add(-size), so
> how about we drop this helper and use atomic_add/sub() directly?

I had to add this VM interface function because the VM struct fields are kept hidden from
other compilation units, as struct panthor_vm is defined inside panthor_mmu.c. I agree
using atomic_sub() would be clearer, but that would imply exporting yet another panthor_mmu
symbol, and atomic_add() can take signed values anyway.

> > +
> >  static u64 mair_to_memattr(u64 mair, bool coherent)
> >  {
> >  	u64 memattr = 0;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> > index fc274637114e..29030384eafe 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> > @@ -39,6 +39,7 @@ struct panthor_heap_pool *
> >  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
> >
> >  void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats);
> > +void panthor_vm_heaps_size_accumulate(struct panthor_vm *vm, ssize_t acc);
> >
> >  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
> >  void panthor_vm_put(struct panthor_vm *vm);

Adrian Larumbe
