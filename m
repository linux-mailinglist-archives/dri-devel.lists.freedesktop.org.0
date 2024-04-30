Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375BE8B7E26
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 19:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941B610F919;
	Tue, 30 Apr 2024 17:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QPwR9sAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35BD10F919
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714496861;
 bh=us2aDPuA64aH88cJuVqdlLEGJNOmHrMn2tcDc3F1qA8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QPwR9sAvVgqkprVRcTkqqwNNN9lPtCq89gjF5ym/i6GrJdRBVKgAk+OGdATZWsabZ
 SsK/ViTsXhDG0IsLkL+E4HVDtCAdaKuxLyFKLW5jYo2ldyqTSTivlNKgUHbaU4q/bI
 TI4EV7bF9jGY5uhfHYobtkWhsdMFY0PgewKrHQXi6di4QVVit+T5y0sCv4nd1SjqPu
 wPAVnbNmdCx3d6cqiFjnQ30VgDDd6jNrCn7RYwrGwSYJnD8uXgUHBytbaRiWoSLZ1d
 bshmf71woaWtqdkiRc/vBX2dKYWO0R1x5dBtsR0HtY8SiQJoetFbdgg5EMVolkffF5
 LeA5FSkUy0bjg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 563073780629;
 Tue, 30 Apr 2024 17:07:41 +0000 (UTC)
Date: Tue, 30 Apr 2024 19:07:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Eric Smith <eric.smith@collabora.com>
Subject: Re: [PATCH v2 4/4] drm/panthor: Fix an off-by-one in the heap
 context retrieval logic
Message-ID: <20240430190739.28c9a120@collabora.com>
In-Reply-To: <ZjEfFiT7k_1y3agC@e110455-lin.cambridge.arm.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-5-boris.brezillon@collabora.com>
 <ZjEfFiT7k_1y3agC@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 30 Apr 2024 17:40:54 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Tue, Apr 30, 2024 at 01:28:52PM +0200, Boris Brezillon wrote:
> > ID 0 is reserved to encode 'no-tiler-heap', the heap ID range is
> > [1:MAX_HEAPS_PER_POOL], which we occasionally need to turn into an index
> > in the [0:MAX_HEAPS_PER_POOL-1] when we want to access the context object.
> > 
> > v2:
> > - New patch
> > 
> > Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> > Reported-by: Eric Smith <eric.smith@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Tested-by: Eric Smith <eric.smith@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_heap.c | 35 +++++++++++++++++++-------
> >  1 file changed, 26 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> > index 683bb94761bc..b1a7dbf25fb2 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > @@ -109,7 +109,11 @@ static int panthor_heap_ctx_stride(struct panthor_device *ptdev)
> >  
> >  static int panthor_get_heap_ctx_offset(struct panthor_heap_pool *pool, int id)  
> 
> Can we make id and the return type here u32? I keep thinking about returning large negative
> values here and how they can end up being exploited.

Actually, I had the prototype changed to take/return an u32 locally, but
decided to drop it to both keep the amount of changes minimal and keep
prototype consistent with the new helper. I'm fine switching to u32s
though.

> 
> >  {
> > -	return panthor_heap_ctx_stride(pool->ptdev) * id;
> > +	/* ID 0 is reserved to encode 'no-tiler-heap', the valid range
> > +	 * is [1:MAX_HEAPS_PER_POOL], which we need to turn into a
> > +	 * [0:MAX_HEAPS_PER_POOL-1] context index, hence the minus one here.
> > +	 */
> > +	return panthor_heap_ctx_stride(pool->ptdev) * (id - 1);
> >  }
> >  
> >  static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
> > @@ -118,6 +122,21 @@ static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
> >  	       panthor_get_heap_ctx_offset(pool, id);
> >  }
> >  
> > +static int panthor_get_heap_ctx_id(struct panthor_heap_pool *pool,
> > +				   u64 heap_ctx_gpu_va)
> > +{
> > +	u64 offset = heap_ctx_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
> > +	u32 heap_idx = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
> > +
> > +	if (offset > U32_MAX || heap_idx >= MAX_HEAPS_PER_POOL)
> > +		return -EINVAL;
> > +
> > +	/* ID 0 is reserved to encode 'no-tiler-heap', the valid range
> > +	 * is [1:MAX_HEAPS_PER_POOL], hence the plus one here.
> > +	 */
> > +	return heap_idx + 1;
> > +}
> > +
> >  static void panthor_free_heap_chunk(struct panthor_vm *vm,
> >  				    struct panthor_heap *heap,
> >  				    struct panthor_heap_chunk *chunk)
> > @@ -364,14 +383,13 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
> >  			      u64 heap_gpu_va,
> >  			      u64 chunk_gpu_va)
> >  {
> > -	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
> > -	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
> > +	int heap_id = panthor_get_heap_ctx_id(pool, heap_gpu_va);  
> 
> I would keep heap_id here u32. Why do we need to change it? Also, I don't see how
> panthor_get_heap_ctx_id() can ever return negative values unless we expect MAX_HEAPS_PER_POOL
> to be S32_MAX at some moment.

The reason I made it a signed value is so we could return an error code
too

-  > 0 => valid
-  < 0 error, with the value encoding the error

though we're likely to always return EINVAL anyway.

> 
> >  	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
> >  	struct panthor_heap *heap;
> >  	int ret;
> >  
> > -	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
> > -		return -EINVAL;
> > +	if (heap_id < 0)
> > +		return heap_id;  
> 
> This can then be removed if heap_id is u32.

We need to replace that by an extra check on the VA, and given this is
done in two different places, I thought having an helper that does both
the VA to offset and the offset consistency check was simpler. I mean,
I could make this helper return an u32, and consider 0 as the
'no-context-found' special-value, but I can't drop this check.

