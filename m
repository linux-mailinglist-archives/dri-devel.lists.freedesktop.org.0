Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C8A2EE90
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561C210E144;
	Mon, 10 Feb 2025 13:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D773710E144
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:43:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0804B1BA8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 05:43:51 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0FF73F58B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 05:43:28 -0800 (PST)
Date: Mon, 10 Feb 2025 13:43:17 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mihail Atanassov <mihail.atanassov@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panthor: Avoid sleep locking in the internal BO
 size path
Message-ID: <Z6oCdebq2ftGaZdq@e110455-lin.cambridge.arm.com>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <20250210124203.124191-2-adrian.larumbe@collabora.com>
 <20250210141807.064ccacf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210141807.064ccacf@collabora.com>
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

On Mon, Feb 10, 2025 at 02:18:07PM +0100, Boris Brezillon wrote:
> On Mon, 10 Feb 2025 12:42:00 +0000
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > A previous commit dealt with a similar situation, whereby upon enabling
> > some mutex debug features, a warning about sleep muteces being used in a
> 
>                                                    ^ mutexes
>  
> > /proc file read atomic context was being triggered.
> > 
> > Because in this case replacing the heap mutex with a spinlock isn't
> > feasible, the fdinfo handler no longer traverses the list of heaps for
> > every single VM associated with an open DRM file. Instad, when a new heap
> > chunk is allocated, its size is accumulated into a VM-wide tally, which
> > also makes the atomic context code path somewhat faster.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO's over fdinfo")
> > ---
> >  drivers/gpu/drm/panthor/panthor_heap.c | 38 ++++++++------------------
> >  drivers/gpu/drm/panthor/panthor_heap.h |  2 --
> >  drivers/gpu/drm/panthor/panthor_mmu.c  | 18 +++++++-----
> >  drivers/gpu/drm/panthor/panthor_mmu.h  |  1 +
> >  4 files changed, 23 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> > index db0285ce5812..686f209f5b09 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > @@ -127,6 +127,8 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
> >  	heap->chunk_count--;
> >  	mutex_unlock(&heap->lock);
> >  
> > +	panthor_vm_heaps_accumulate(vm, -heap->chunk_size);
> > +
> >  	panthor_kernel_bo_destroy(chunk->bo);
> >  	kfree(chunk);
> >  }
> > @@ -180,6 +182,8 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
> >  	heap->chunk_count++;
> >  	mutex_unlock(&heap->lock);
> >  
> > +	panthor_vm_heaps_accumulate(vm, heap->chunk_size);
> > +
> >  	return 0;
> >  
> >  err_destroy_bo:
> > @@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
> >  			removed = chunk;
> >  			list_del(&chunk->node);
> >  			heap->chunk_count--;
> > +			panthor_vm_heaps_accumulate(chunk->bo->vm, -heap->chunk_size);
> >  			break;
> >  		}
> >  	}
> > @@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
> >  	if (ret)
> >  		goto err_destroy_pool;
> >  
> > +	panthor_vm_heaps_accumulate(vm, pool->gpu_contexts->obj->size);
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
> > +		panthor_vm_heaps_accumulate(pool->gpu_contexts->vm,
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
> > index 0a4e352b5505..aaad1a560805 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -345,6 +345,10 @@ struct panthor_vm {
> >  
> >  		/** @heaps.lock: Lock used to protect access to @pool. */
> >  		struct mutex lock;
> > +
> > +		/** @heaps.size: Size of all chunks across all heaps in the pool. */
> > +		ssize_t size;
> 
> Let's put that into an fdinfo struct.
> 
> > +
> 
> Drop the extra blank-line.
> 
> >  	} heaps;
> >  
> >  	/** @node: Used to insert the VM in the panthor_mmu::vm::list. */
> > @@ -1539,6 +1543,7 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
> >  	mutex_lock(&vm->heaps.lock);
> >  	panthor_heap_pool_destroy(vm->heaps.pool);
> >  	vm->heaps.pool = NULL;
> > +	vm->heaps.size = 0;
> >  	mutex_unlock(&vm->heaps.lock);
> >  
> >  	drm_WARN_ON(&vm->ptdev->base,
> > @@ -1963,13 +1968,7 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
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
> > +		size_t size = vm->heaps.size;
> >  		stats->resident += size;
> >  		if (vm->as.id >= 0)
> >  			stats->active += size;
> > @@ -1977,6 +1976,11 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
> >  	xa_unlock(&pfile->vms->xa);
> >  }
> >  
> > +void panthor_vm_heaps_accumulate(struct panthor_vm *vm, ssize_t acc)
> > +{
> 
> Either there's some lock protecting this operation and we want a
> lockdep_assert_held(), or we need to make it an atomic operation (and
> make the size an atomic_t) to avoid races.

If Adrián moves the call site in panthor_{alloc,free}_heap_chunk() before he drops the heap->lock,
would that be sufficient? Pool create and destroy are hopefully race-free and panthor_heap_return_chunk()
should be also safe.

Best regards,
Liviu

> 
> > +	vm->heaps.size += acc;
> > +}
> > +
> >  static u64 mair_to_memattr(u64 mair, bool coherent)
> >  {
> >  	u64 memattr = 0;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> > index fc274637114e..b6686896f8ef 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> > @@ -39,6 +39,7 @@ struct panthor_heap_pool *
> >  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
> >  
> >  void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats);
> > +void panthor_vm_heaps_accumulate(struct panthor_vm *vm, ssize_t acc);
> >  
> >  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
> >  void panthor_vm_put(struct panthor_vm *vm);
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
