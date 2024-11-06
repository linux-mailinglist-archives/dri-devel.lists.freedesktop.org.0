Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10A9BED4D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A46110E19E;
	Wed,  6 Nov 2024 13:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 10BFB10E19E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:10:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51CFD497
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 05:11:15 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E8083F66E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 05:10:45 -0800 (PST)
Date: Wed, 6 Nov 2024 13:10:37 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
Message-ID: <ZytqzTg2QnEkvDcl@e110455-lin.cambridge.arm.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
 <20241106131641.47487624@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106131641.47487624@collabora.com>
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

On Wed, Nov 06, 2024 at 01:16:41PM +0100, Boris Brezillon wrote:
> On Wed,  6 Nov 2024 12:07:48 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > Similar to cac075706f29 ("drm/panthor: Fix race when converting
> > group handle to group object") we need to use the XArray's internal
> > locking when retrieving a pointer from there for heap and vm.
> > 
> > Reported-by: Jann Horn <jannh@google.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

From the other email: I will add the Fixes tag for next version.

> > ---
> >  drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++--
> >  drivers/gpu/drm/panthor/panthor_mmu.c  |  2 ++
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> > index 3796a9eb22af2..fe0bcb6837f74 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > @@ -351,6 +351,17 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
> >  	return ret;
> >  }
> >  
> > +static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
> 
> struct pathor_heap_pool does not exist :-).

Oops! Turns out that for my "compile testing" of the patch on my Arm machine I was using
the wrong O= directory so my .config did not had Panthor enabled.

> 
> > +{
> > +	struct panthor_heap *heap;
> > +
> > +	xa_lock(&pool->xa);
> > +	heap = xa_load(&pool->xa, id);
> > +	xa_unlock(&pool->va);
> 
> Access to panthor_heap_pool::xa is protected by the external
> pathor_heap_pool::lock, so taking the xa lock seems redundant here. How
> about adding a lockdep_assert_held(pool->lock) instead?

panthor_heap_pool_release() does not take the panthor_heap_pool::lock, so the protection
is not really there. I could fix panthor_heap_pool_release() and then add a
lockdep_assert_held() before both calls to xa_load() if you think that's a better
solution.

Best regards,
Liviu

> 
> > +
> > +	return heap;
> > +}
> > +
> >  /**
> >   * panthor_heap_return_chunk() - Return an unused heap chunk
> >   * @pool: The pool this heap belongs to.
> > @@ -375,7 +386,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
> >  		return -EINVAL;
> >  
> >  	down_read(&pool->lock);
> > -	heap = xa_load(&pool->xa, heap_id);
> > +	heap = panthor_heap_from_id(pool, heap_id);
> >  	if (!heap) {
> >  		ret = -EINVAL;
> >  		goto out_unlock;
> > @@ -438,7 +449,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
> >  		return -EINVAL;
> >  
> >  	down_read(&pool->lock);
> > -	heap = xa_load(&pool->xa, heap_id);
> > +	heap = panthor_heap_from_id(pool, heap_id);
> >  	if (!heap) {
> >  		ret = -EINVAL;
> >  		goto out_unlock;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 8ca85526491e6..8b5cda9d21768 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
> >  {
> >  	struct panthor_vm *vm;
> >  
> > +	xa_lock(&pool->xa);
> >  	vm = panthor_vm_get(xa_load(&pool->xa, handle));
> > +	xa_unlock(&pool->va);
> >  
> >  	return vm;
> >  }
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
