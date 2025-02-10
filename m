Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A7A2EF79
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B413F10E161;
	Mon, 10 Feb 2025 14:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YD8DFmU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9FF10E161
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739196913;
 bh=Cx5YhTcE+YerAakYfU57yJvmi/8wcu5a0Fj80oUEpnI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YD8DFmU5INtPw65n1U8GZvXvwbDE5aXSYJ8L3IL3gPA4L0oL/nE2ldcBGfMeu3lg1
 6CTmHMoqdyAw7efYeTXlPpGJgP0THDK21vwr5NODToew1KwdVJgfb7SXmX67cOCJhj
 oBHQGFAIr/EUrGC3JyeCko39QceE2/p1jJ+Nqv9bekZ/SIt4hUir2qjy21Z7FD7WRF
 EFmGJcvR64F9YTme0qHb6ggnUJEFpz4o4ZEn3844K08BkXREtQs25Tfl59PHSbzyJo
 TooweS7cfYVsSbFD/ZJOTlC2gLENI7blUy4f8xGs9+37bhBcCRBW5iHG3EpCSCwL4a
 V9GXfAogaNi7w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C307517E02BE;
 Mon, 10 Feb 2025 15:15:12 +0100 (CET)
Date: Mon, 10 Feb 2025 15:15:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Steven
 Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mihail Atanassov
 <mihail.atanassov@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panthor: Avoid sleep locking in the internal BO
 size path
Message-ID: <20250210151506.65067134@collabora.com>
In-Reply-To: <Z6oCdebq2ftGaZdq@e110455-lin.cambridge.arm.com>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <20250210124203.124191-2-adrian.larumbe@collabora.com>
 <20250210141807.064ccacf@collabora.com>
 <Z6oCdebq2ftGaZdq@e110455-lin.cambridge.arm.com>
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

On Mon, 10 Feb 2025 13:43:17 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, Feb 10, 2025 at 02:18:07PM +0100, Boris Brezillon wrote:
> > On Mon, 10 Feb 2025 12:42:00 +0000
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> >  =20
> > > A previous commit dealt with a similar situation, whereby upon enabli=
ng
> > > some mutex debug features, a warning about sleep muteces being used i=
n a =20
> >=20
> >                                                    ^ mutexes
> >   =20
> > > /proc file read atomic context was being triggered.
> > >=20
> > > Because in this case replacing the heap mutex with a spinlock isn't
> > > feasible, the fdinfo handler no longer traverses the list of heaps for
> > > every single VM associated with an open DRM file. Instad, when a new =
heap
> > > chunk is allocated, its size is accumulated into a VM-wide tally, whi=
ch
> > > also makes the atomic context code path somewhat faster.
> > >=20
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO'=
s over fdinfo")
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_heap.c | 38 ++++++++----------------=
--
> > >  drivers/gpu/drm/panthor/panthor_heap.h |  2 --
> > >  drivers/gpu/drm/panthor/panthor_mmu.c  | 18 +++++++-----
> > >  drivers/gpu/drm/panthor/panthor_mmu.h  |  1 +
> > >  4 files changed, 23 insertions(+), 36 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm=
/panthor/panthor_heap.c
> > > index db0285ce5812..686f209f5b09 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > > @@ -127,6 +127,8 @@ static void panthor_free_heap_chunk(struct pantho=
r_vm *vm,
> > >  	heap->chunk_count--;
> > >  	mutex_unlock(&heap->lock);
> > > =20
> > > +	panthor_vm_heaps_accumulate(vm, -heap->chunk_size);
> > > +
> > >  	panthor_kernel_bo_destroy(chunk->bo);
> > >  	kfree(chunk);
> > >  }
> > > @@ -180,6 +182,8 @@ static int panthor_alloc_heap_chunk(struct pantho=
r_device *ptdev,
> > >  	heap->chunk_count++;
> > >  	mutex_unlock(&heap->lock);
> > > =20
> > > +	panthor_vm_heaps_accumulate(vm, heap->chunk_size);
> > > +
> > >  	return 0;
> > > =20
> > >  err_destroy_bo:
> > > @@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap=
_pool *pool,
> > >  			removed =3D chunk;
> > >  			list_del(&chunk->node);
> > >  			heap->chunk_count--;
> > > +			panthor_vm_heaps_accumulate(chunk->bo->vm, -heap->chunk_size);
> > >  			break;
> > >  		}
> > >  	}
> > > @@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *p=
tdev, struct panthor_vm *vm)
> > >  	if (ret)
> > >  		goto err_destroy_pool;
> > > =20
> > > +	panthor_vm_heaps_accumulate(vm, pool->gpu_contexts->obj->size);
> > > +
> > >  	return pool;
> > > =20
> > >  err_destroy_pool:
> > > @@ -594,8 +601,11 @@ void panthor_heap_pool_destroy(struct panthor_he=
ap_pool *pool)
> > >  	xa_for_each(&pool->xa, i, heap)
> > >  		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, =
i));
> > > =20
> > > -	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
> > > +	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
> > > +		panthor_vm_heaps_accumulate(pool->gpu_contexts->vm,
> > > +					    -pool->gpu_contexts->obj->size);
> > >  		panthor_kernel_bo_destroy(pool->gpu_contexts);
> > > +	}
> > > =20
> > >  	/* Reflects the fact the pool has been destroyed. */
> > >  	pool->vm =3D NULL;
> > > @@ -603,29 +613,3 @@ void panthor_heap_pool_destroy(struct panthor_he=
ap_pool *pool)
> > > =20
> > >  	panthor_heap_pool_put(pool);
> > >  }
> > > -
> > > -/**
> > > - * panthor_heap_pool_size() - Calculate size of all chunks across al=
l heaps in a pool
> > > - * @pool: Pool whose total chunk size to calculate.
> > > - *
> > > - * This function adds the size of all heap chunks across all heaps i=
n the
> > > - * argument pool. It also adds the size of the gpu contexts kernel b=
o.
> > > - * It is meant to be used by fdinfo for displaying the size of inter=
nal
> > > - * driver BO's that aren't exposed to userspace through a GEM handle.
> > > - *
> > > - */
> > > -size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
> > > -{
> > > -	struct panthor_heap *heap;
> > > -	unsigned long i;
> > > -	size_t size =3D 0;
> > > -
> > > -	down_read(&pool->lock);
> > > -	xa_for_each(&pool->xa, i, heap)
> > > -		size +=3D heap->chunk_size * heap->chunk_count;
> > > -	up_read(&pool->lock);
> > > -
> > > -	size +=3D pool->gpu_contexts->obj->size;
> > > -
> > > -	return size;
> > > -}
> > > diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm=
/panthor/panthor_heap.h
> > > index e3358d4e8edb..25a5f2bba445 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_heap.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_heap.h
> > > @@ -27,8 +27,6 @@ struct panthor_heap_pool *
> > >  panthor_heap_pool_get(struct panthor_heap_pool *pool);
> > >  void panthor_heap_pool_put(struct panthor_heap_pool *pool);
> > > =20
> > > -size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
> > > -
> > >  int panthor_heap_grow(struct panthor_heap_pool *pool,
> > >  		      u64 heap_gpu_va,
> > >  		      u32 renderpasses_in_flight,
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/=
panthor/panthor_mmu.c
> > > index 0a4e352b5505..aaad1a560805 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -345,6 +345,10 @@ struct panthor_vm {
> > > =20
> > >  		/** @heaps.lock: Lock used to protect access to @pool. */
> > >  		struct mutex lock;
> > > +
> > > +		/** @heaps.size: Size of all chunks across all heaps in the pool. =
*/
> > > +		ssize_t size; =20
> >=20
> > Let's put that into an fdinfo struct.
> >  =20
> > > + =20
> >=20
> > Drop the extra blank-line.
> >  =20
> > >  	} heaps;
> > > =20
> > >  	/** @node: Used to insert the VM in the panthor_mmu::vm::list. */
> > > @@ -1539,6 +1543,7 @@ static void panthor_vm_destroy(struct panthor_v=
m *vm)
> > >  	mutex_lock(&vm->heaps.lock);
> > >  	panthor_heap_pool_destroy(vm->heaps.pool);
> > >  	vm->heaps.pool =3D NULL;
> > > +	vm->heaps.size =3D 0;
> > >  	mutex_unlock(&vm->heaps.lock);
> > > =20
> > >  	drm_WARN_ON(&vm->ptdev->base,
> > > @@ -1963,13 +1968,7 @@ void panthor_vm_heaps_sizes(struct panthor_fil=
e *pfile, struct drm_memory_stats
> > > =20
> > >  	xa_lock(&pfile->vms->xa);
> > >  	xa_for_each(&pfile->vms->xa, i, vm) {
> > > -		size_t size =3D 0;
> > > -
> > > -		mutex_lock(&vm->heaps.lock);
> > > -		if (vm->heaps.pool)
> > > -			size =3D panthor_heap_pool_size(vm->heaps.pool);
> > > -		mutex_unlock(&vm->heaps.lock);
> > > -
> > > +		size_t size =3D vm->heaps.size;
> > >  		stats->resident +=3D size;
> > >  		if (vm->as.id >=3D 0)
> > >  			stats->active +=3D size;
> > > @@ -1977,6 +1976,11 @@ void panthor_vm_heaps_sizes(struct panthor_fil=
e *pfile, struct drm_memory_stats
> > >  	xa_unlock(&pfile->vms->xa);
> > >  }
> > > =20
> > > +void panthor_vm_heaps_accumulate(struct panthor_vm *vm, ssize_t acc)
> > > +{ =20
> >=20
> > Either there's some lock protecting this operation and we want a
> > lockdep_assert_held(), or we need to make it an atomic operation (and
> > make the size an atomic_t) to avoid races. =20
>=20
> If Adri=C3=A1n moves the call site in panthor_{alloc,free}_heap_chunk() b=
efore he drops the heap->lock,
> would that be sufficient? Pool create and destroy are hopefully race-free=
 and
> panthor_heap_return_chunk() should be also safe.

I'm not sure that's enough. The tiler_oom_work is per-group, and you
can have multiple groups sharing the same VM. The workqueue we schedule
these works on is also not single-threaded, so you can potentially have
multiple threads updating the total VM tiler heap size at the same time.
