Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A027D35CA47
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537689DA9;
	Mon, 12 Apr 2021 15:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B11889E98
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:43:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id w186so2577104wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=C/B/FXe5FvzpKtIgce/xkNQzxzv7HC+OvDXfUeHjL0c=;
 b=Pga/xDO9Yxoyozc5Ppt4uoQpdGe4z8NxIMnSyANMrDJgscrE6wp3JH9d9XeS9VVIg5
 1LzROhoZO8xT3LX79jAapNmqHBaG6slYi8fQdpnZeyFEx0unbqOf6IotamfNrIsa+nes
 nNSmEDEw5r5MvD3rqMHBJUrQxR7jIB5E/pbH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C/B/FXe5FvzpKtIgce/xkNQzxzv7HC+OvDXfUeHjL0c=;
 b=oFlAkKfJGwW1/lZEaiB0V/wPqlVFZJWeXOD8e5+MDc5fNvtOoJIl6SrLEojG2I8beD
 vwTIKivJuxO1v2Tc4YtvcjOKdgBsb4JSMTy2Cy9qSHUmDCim1M2gJNQypikX6gclsbvJ
 Jbfex8QOG2XIq7QdWBfQb+U4m3CgqsfMi4YR+sVL0klWLs+fLQ5raIb0XWwcd94yLfez
 VrDzny5ivF8GLb0lFp33Cc63qOEhY6rxadN+EJepYndN3p0J7JPshLgP6ixGj32Xwgz7
 o99Dg/EPW0ZxWmcboXvV1OPdGanfOlT+54nk7wm+7Nhb6a4YKojTlVjx2AESr+r4SIv3
 FZvg==
X-Gm-Message-State: AOAM532XEHRUDGgokDfy7o7B3l11QNJGvtQ2HEnE17zmzsMP7g32Y3zU
 maq/BRcsBdf/cUtQnleYDf9q5w==
X-Google-Smtp-Source: ABdhPJw+B9Kh+UO+Gak4QO6/23vMj95BQaCdt4Iq2779zmukdZ7ljPqegqtZyqCZeD6UaBQIZjfHhw==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr28239220wmj.2.1618242226657;
 Mon, 12 Apr 2021 08:43:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v8sm1032136wrt.71.2021.04.12.08.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:43:45 -0700 (PDT)
Date: Mon, 12 Apr 2021 17:43:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH] drm/ttm: Simplify the delayed destroy locking
Message-ID: <YHRqr2PhPvSZeq19@phenom.ffwll.local>
References: <20210412131740.10257-1-thomas.hellstrom@linux.intel.com>
 <cfa22b90-575d-c87e-a993-5ed13cea0f02@amd.com>
 <715d7cbd-264c-9422-e173-c57266800c5f@linux.intel.com>
 <4d8d0ccb-c635-acd7-c6e9-6c11a9b9409f@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d8d0ccb-c635-acd7-c6e9-6c11a9b9409f@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 04:21:37PM +0200, Christian K=F6nig wrote:
> =

> =

> Am 12.04.21 um 16:16 schrieb Thomas Hellstr=F6m:
> > Hi, Christian,
> > =

> > On 4/12/21 4:01 PM, Christian K=F6nig wrote:
> > > Hi Thomas,
> > > =

> > > well in general a good idea, but I'm working on a different plan for
> > > a while now.
> > > =

> > > My idea here is that instead of the BO the resource object is kept
> > > on a double linked lru list.
> > > =

> > > The resource objects then have a pointer to either the BO or a fence
> > > object.
> > > =

> > > When it is a fence object we can just grab a reference to it and
> > > wait for it to complete.
> > > =

> > > If it is a BO we evict it the same way we currently do.
> > > =

> > > This allows to remove both the delayed delete, individualization of
> > > BOs, ghost objects etc...
> > =

> > Hmm, ok. So in that case, what would trigger the final release of the
> > buffer object in the absence of a delayed delete list? Would we use a
> > fence callback for that?
> =

> Key point is you don't need any final release of the BO any more. When the
> BOs reference count becomes zero it can be destructed immediately.
> =

> Only the resource object is kept around and protected by a fence until it
> can be released finally.

I was reading dma_resv here for a second, and wondered how we figure out
the refcounting for that. But since you aim for a fence, that's
refcounted, and then as long as we make sure the lifetime rules for
resource objects in this free-standing mode is very clear (lru owns it,
until we remove it holding the lru lock should work?) then I think this is
rather clean approach.

Also non-freestanding resource objects are fully owned by their objects.

> How that resource object is then destroyed could be handled in different
> ways, we could use a delayed work, shrinker callback or just rely on new
> allocations to scan the deleted objects.
> =

> > =

> > Otherwise sounds like a good idea, and if it runs into problems, we
> > could possibly resurrect this.
> =

> Well the main problem is that I need to change all drivers so that bo->mem
> can now be a pointer. IIRC you suggested that years ago and I'm working on
> the details of that idea ever since.

Yeah that's going to be a pile :-) But I think we've reached the same
conclusion on i915 for polishing our lmem manager (atm it's ghost objects
all the way down), before we decided to go direct adopting ttm.

So makes all sense to me.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > /Thomas
> > =

> > =

> > =

> > =

> > > =

> > > Regards,
> > > Christian.
> > > =

> > > Am 12.04.21 um 15:17 schrieb Thomas Hellstr=F6m:
> > > > This RFC needs some decent testing on a driver with bos that share
> > > > reservation objects, and of course a check for whether I missed
> > > > something obvious.
> > > > =

> > > > The locking around delayed destroy is rather complex due to the fact
> > > > that we want to individualize dma_resv pointers before putting
> > > > the object
> > > > on the delayed-destroy list. That individualization is currently
> > > > protected
> > > > by the lru lock forcing us to do try-reservations under the lru
> > > > lock when
> > > > reserving an object from the lru- or ddestroy lists, which complica=
tes
> > > > moving over to per-manager lru locks.
> > > > =

> > > > Instead protect the individualization with the object kref =3D=3D 0,
> > > > and ensure kref !=3D 0 before trying to reserve an object from the =
list.
> > > > Remove the lru lock around individualization and protect the delayed
> > > > destroy list with a separate spinlock. Isolate the delayed destroy =
list
> > > > similarly to a lockless list before traversing it. Also don't
> > > > try to drop
> > > > resource references from the delayed destroy list traversal, but le=
ave
> > > > that to the final object release. The role of the delayed
> > > > destroy thread
> > > > will now simply be to try to idle the object and when idle, drop
> > > > the delayed destoy reference.
> > > > =

> > > > This should pave the way for per-manager lru lists, sleeping
> > > > eviction locks
> > > > that are kept, optional drm_mm eviction roster usage and moving
> > > > over to a
> > > > completely lockless delayed destroy list even if the traversal order
> > > > will then change because there is no llist_add_tail().
> > > > =

> > > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =A0 drivers/gpu/drm/ttm/ttm_bo.c=A0=A0=A0=A0 | 193
> > > > +++++++++++++------------------
> > > > =A0 drivers/gpu/drm/ttm/ttm_device.c |=A0=A0 1 +
> > > > =A0 include/drm/ttm/ttm_device.h=A0=A0=A0=A0 |=A0=A0 1 +
> > > > =A0 3 files changed, 82 insertions(+), 113 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index 6ab7b66ce36d..fd57252bc8fe 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -217,6 +217,9 @@ static int ttm_bo_handle_move_mem(struct
> > > > ttm_buffer_object *bo,
> > > > =A0 =A0 static void ttm_bo_cleanup_memtype_use(struct
> > > > ttm_buffer_object *bo)
> > > > =A0 {
> > > > +=A0=A0=A0 if (kref_read(&bo->kref))
> > > > +=A0=A0=A0=A0=A0=A0=A0 dma_resv_assert_held(bo->base.resv);
> > > > +
> > > > =A0=A0=A0=A0=A0 if (bo->bdev->funcs->delete_mem_notify)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 bo->bdev->funcs->delete_mem_notify(bo);
> > > > =A0 @@ -239,13 +242,18 @@ static int
> > > > ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return r;
> > > > =A0 =A0=A0=A0=A0=A0 if (bo->type !=3D ttm_bo_type_sg) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 /* This works because the BO is about to be =
destroyed
> > > > and nobody
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 * reference it any more. The only tricky =
case is the
> > > > trylock on
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 * the resv object while holding the lru_l=
ock.
> > > > +=A0=A0=A0=A0=A0=A0=A0 /*
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * This works because nobody besides us ca=
n lock the bo or
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * assume it is locked while its refcount =
is zero.
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > -=A0=A0=A0=A0=A0=A0=A0 spin_lock(&bo->bdev->lru_lock);
> > > > +=A0=A0=A0=A0=A0=A0=A0 WARN_ON_ONCE(kref_read(&bo->kref));
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 bo->base.resv =3D &bo->base._resv;
> > > > -=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > +=A0=A0=A0=A0=A0=A0=A0 /*
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * Don't reorder against kref_init().
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * Matches the implicit full barrier of a =
successful
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * kref_get_unless_zero() after a lru_list=
_lookup.
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > +=A0=A0=A0=A0=A0=A0=A0 smp_mb();
> > > > =A0=A0=A0=A0=A0 }
> > > > =A0 =A0=A0=A0=A0=A0 return r;
> > > > @@ -274,122 +282,66 @@ static void
> > > > ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
> > > > =A0 }
> > > > =A0 =A0 /**
> > > > - * function ttm_bo_cleanup_refs
> > > > - * If bo idle, remove from lru lists, and unref.
> > > > - * If not idle, block if possible.
> > > > - *
> > > > - * Must be called with lru_lock and reservation held, this function
> > > > - * will drop the lru lock and optionally the reservation lock
> > > > before returning.
> > > > + * ttm_bo_cleanup_refs - idle and remove pages and gpu-bindings
> > > > and remove
> > > > + * from lru_lists.
> > > > =A0=A0 *
> > > > =A0=A0 * @bo:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 The buffer object to clean-up
> > > > =A0=A0 * @interruptible:=A0=A0=A0=A0=A0=A0=A0=A0 Any sleeps should =
occur interruptibly.
> > > > - * @no_wait_gpu:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Never wait for gpu.=
 Return -EBUSY instead.
> > > > - * @unlock_resv:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Unlock the reservat=
ion lock as well.
> > > > + * @no_wait_gpu:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Never wait for gpu.=
 Return -EBUSY if
> > > > not idle.
> > > > =A0=A0 */
> > > > -
> > > > =A0 static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool interr=
uptible, bool no_wait_gpu,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool unlock=
_resv)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool interr=
uptible, bool no_wait_gpu)
> > > > =A0 {
> > > > -=A0=A0=A0 struct dma_resv *resv =3D &bo->base._resv;
> > > > =A0=A0=A0=A0=A0 int ret;
> > > > =A0 -=A0=A0=A0 if (dma_resv_test_signaled_rcu(resv, true))
> > > > -=A0=A0=A0=A0=A0=A0=A0 ret =3D 0;
> > > > -=A0=A0=A0 else
> > > > -=A0=A0=A0=A0=A0=A0=A0 ret =3D -EBUSY;
> > > > -
> > > > -=A0=A0=A0 if (ret && !no_wait_gpu) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 long lret;
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (unlock_resv)
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > -=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 lret =3D dma_resv_wait_timeout_rcu(resv, tru=
e, interruptible,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 30 * HZ);
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (lret < 0)
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return lret;
> > > > -=A0=A0=A0=A0=A0=A0=A0 else if (lret =3D=3D 0)
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EBUSY;
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 spin_lock(&bo->bdev->lru_lock);
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (unlock_resv && !dma_resv_trylock(bo->bas=
e.resv)) {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * We raced, and lost, someone=
 else holds the
> > > > reservation now,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * and is probably busy in ttm=
_bo_cleanup_memtype_use.
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Even if it's not the case, =
because we finished
> > > > waiting any
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * delayed destruction would s=
ucceed, so just
> > > > return success
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * here.
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > -=A0=A0=A0=A0=A0=A0=A0 ret =3D 0;
> > > > -=A0=A0=A0 }
> > > > -
> > > > -=A0=A0=A0 if (ret || unlikely(list_empty(&bo->ddestroy))) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (unlock_resv)
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > -=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > +=A0=A0=A0 dma_resv_assert_held(bo->base.resv);
> > > > +=A0=A0=A0 WARN_ON_ONCE(!bo->deleted);
> > > > +=A0=A0=A0 ret =3D ttm_bo_wait(bo, interruptible, no_wait_gpu);
> > > > +=A0=A0=A0 if (ret)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > -=A0=A0=A0 }
> > > > =A0 +=A0=A0=A0 ttm_bo_cleanup_memtype_use(bo);
> > > > +=A0=A0=A0 spin_lock(&bo->bdev->lru_lock);
> > > > =A0=A0=A0=A0=A0 ttm_bo_del_from_lru(bo);
> > > > -=A0=A0=A0 list_del_init(&bo->ddestroy);
> > > > =A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > -=A0=A0=A0 ttm_bo_cleanup_memtype_use(bo);
> > > > -
> > > > -=A0=A0=A0 if (unlock_resv)
> > > > -=A0=A0=A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > -
> > > > -=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0 =A0=A0=A0=A0=A0 return 0;
> > > > =A0 }
> > > > =A0 =A0 /*
> > > > - * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> > > > - * encountered buffers.
> > > > + * Isolate a part of the delayed destroy list and check for
> > > > idle on all
> > > > + * buffer objects on it. If idle, remove from the list and drop the
> > > > + * delayed destroy refcount. Return all busy buffers to the delayed
> > > > + * destroy list.
> > > > =A0=A0 */
> > > > =A0 bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove=
_all)
> > > > =A0 {
> > > > -=A0=A0=A0 struct list_head removed;
> > > > -=A0=A0=A0 bool empty;
> > > > -
> > > > -=A0=A0=A0 INIT_LIST_HEAD(&removed);
> > > > -
> > > > -=A0=A0=A0 spin_lock(&bdev->lru_lock);
> > > > -=A0=A0=A0 while (!list_empty(&bdev->ddestroy)) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 struct ttm_buffer_object *bo;
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 bo =3D list_first_entry(&bdev->ddestroy, str=
uct
> > > > ttm_buffer_object,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dd=
estroy);
> > > > -=A0=A0=A0=A0=A0=A0=A0 list_move_tail(&bo->ddestroy, &removed);
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (!ttm_bo_get_unless_zero(bo))
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (remove_all || bo->base.resv !=3D &bo->ba=
se._resv) {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bdev->lru_lock);
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_lock(bo->base.resv, NUL=
L);
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_lock(&bdev->lru_lock);
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_cleanup_refs(bo, false, !=
remove_all, true);
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 } else if (dma_resv_trylock(bo->base.resv)) {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_cleanup_refs(bo, false, !=
remove_all, true);
> > > > -=A0=A0=A0=A0=A0=A0=A0 } else {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bdev->lru_lock);
> > > > +=A0=A0=A0 struct ttm_buffer_object *bo, *next;
> > > > +=A0=A0=A0 struct list_head isolated;
> > > > +=A0=A0=A0 bool empty, idle;
> > > > +
> > > > +=A0=A0=A0 INIT_LIST_HEAD(&isolated);
> > > > +
> > > > +=A0=A0=A0 spin_lock(&bdev->ddestroy_lock);
> > > > +=A0=A0=A0 list_splice_init(&bdev->ddestroy, &isolated);
> > > > +=A0=A0=A0 spin_unlock(&bdev->ddestroy_lock);
> > > > +=A0=A0=A0 list_for_each_entry_safe(bo, next, &isolated, ddestroy) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 WARN_ON_ONCE(!kref_read(&bo->kref) ||
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bo->base.resv !=
=3D &bo->base._resv);
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (!remove_all)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 idle =3D dma_resv_test_signaled_=
rcu(bo->base.resv, true);
> > > > +=A0=A0=A0=A0=A0=A0=A0 else
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 idle =3D (dma_resv_wait_timeout_=
rcu(bo->base.resv, true,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 false, 30 * HZ) > 0);
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (idle) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 list_del_init(&bo->ddestroy);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > -
> > > > -=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > -=A0=A0=A0=A0=A0=A0=A0 spin_lock(&bdev->lru_lock);
> > > > =A0=A0=A0=A0=A0 }
> > > > -=A0=A0=A0 list_splice_tail(&removed, &bdev->ddestroy);
> > > > +=A0=A0=A0 spin_lock(&bdev->ddestroy_lock);
> > > > +=A0=A0=A0 list_splice(&isolated, &bdev->ddestroy);
> > > > =A0=A0=A0=A0=A0 empty =3D list_empty(&bdev->ddestroy);
> > > > -=A0=A0=A0 spin_unlock(&bdev->lru_lock);
> > > > +=A0=A0=A0 spin_unlock(&bdev->ddestroy_lock);
> > > > =A0 =A0=A0=A0=A0=A0 return empty;
> > > > =A0 }
> > > > @@ -405,10 +357,16 @@ static void ttm_bo_release(struct kref *kref)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ttm_bo_individualize_resv(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Last resort, if we fail =
to allocate memory for the
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * fences block for the BO to =
become idle
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * fences block for the BO to =
become idle, and then
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * we are free to update the r=
esv pointer.
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_wait_timeout_rcu(b=
o->base.resv, true, false,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 30 * HZ);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (bo->type !=3D ttm_bo_type_sg=
) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bo->base.resv =3D &b=
o->base._resv;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Please see ttm_bo=
_individualize_resv() */
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 smp_mb();
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (bo->bdev->funcs->release_notify)
> > > > @@ -422,9 +380,8 @@ static void ttm_bo_release(struct kref *kref)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 !dma_resv_trylock(bo->base.resv)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 /* The BO is not idle, resurrect it for=
 delayed destroy */
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_flush_all_fences(bo);
> > > > -=A0=A0=A0=A0=A0=A0=A0 bo->deleted =3D true;
> > > > -
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_lock(&bo->bdev->lru_lock);
> > > > +=A0=A0=A0=A0=A0=A0=A0 bo->deleted =3D true;
> > > > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Make pinned bos immediately availa=
ble to
> > > > @@ -439,8 +396,10 @@ static void ttm_bo_release(struct kref *kref)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_move_to_lru_tail(bo,=
 &bo->mem, NULL);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0 +=A0=A0=A0=A0=A0=A0=A0 spin_lock(&bo->bdev->ddestroy_lock);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 kref_init(&bo->kref);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_add_tail(&bo->ddestroy, &bdev->dde=
stroy);
> > > > +=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->ddestroy_lock);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 schedule_delayed_work(&bdev->wq,
> > > > @@ -450,9 +409,11 @@ static void ttm_bo_release(struct kref *kref)
> > > > =A0 =A0=A0=A0=A0=A0 spin_lock(&bo->bdev->lru_lock);
> > > > =A0=A0=A0=A0=A0 ttm_bo_del_from_lru(bo);
> > > > -=A0=A0=A0 list_del(&bo->ddestroy);
> > > > =A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > =A0 +=A0=A0=A0 pr_info("Deleting.\n");
> > > > +=A0=A0=A0 WARN_ON_ONCE(!list_empty_careful(&bo->ddestroy));
> > > > +
> > > > =A0=A0=A0=A0=A0 ttm_bo_cleanup_memtype_use(bo);
> > > > =A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > =A0 @@ -630,25 +591,26 @@ int ttm_mem_evict_first(struct
> > > > ttm_device *bdev,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry(bo, &man->lru[i], l=
ru) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool busy;
> > > > =A0 +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ttm_bo_get_unless_zero(=
bo))
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > +
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ttm_bo_evict_swapout_a=
llowable(bo, ctx, &locked,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &busy)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (busy && !bu=
sy_bo && ticket !=3D
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma=
_resv_locking_ctx(bo->base.resv))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bus=
y_bo =3D bo;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (place && !bdev->fun=
cs->eviction_valuable(bo,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 place)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (locked)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma=
_resv_unlock(bo->base.resv);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ttm_bo_get_unless_zero(bo))=
 {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (locked)
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv=
_unlock(bo->base.resv);
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > +
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0 @@ -670,8 +632,11 @@ int ttm_mem_evict_first(struct ttm_device =
*bdev,
> > > > =A0=A0=A0=A0=A0 }
> > > > =A0 =A0=A0=A0=A0=A0 if (bo->deleted) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bdev->lru_lock);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ttm_bo_cleanup_refs(bo, ctx->in=
terruptible,
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ct=
x->no_wait_gpu, locked);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ct=
x->no_wait_gpu);
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (locked)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > =A0=A0=A0=A0=A0 }
> > > > @@ -1168,17 +1133,19 @@ int ttm_bo_swapout(struct
> > > > ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> > > > =A0=A0=A0=A0=A0 bool locked;
> > > > =A0=A0=A0=A0=A0 int ret;
> > > > =A0 -=A0=A0=A0 if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked=
, NULL))
> > > > +=A0=A0=A0 if (!ttm_bo_get_unless_zero(bo))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EBUSY;
> > > > =A0 -=A0=A0=A0 if (!ttm_bo_get_unless_zero(bo)) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (locked)
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > +=A0=A0=A0 if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NU=
LL)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EBUSY;
> > > > =A0=A0=A0=A0=A0 }
> > > > =A0 =A0=A0=A0=A0=A0 if (bo->deleted) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 ttm_bo_cleanup_refs(bo, false, false, locked=
);
> > > > +=A0=A0=A0=A0=A0=A0=A0 spin_unlock(&bo->bdev->lru_lock);
> > > > +=A0=A0=A0=A0=A0=A0=A0 ttm_bo_cleanup_refs(bo, false, false);
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (locked)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dma_resv_unlock(bo->base.resv);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(bo);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > > =A0=A0=A0=A0=A0 }
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > > > b/drivers/gpu/drm/ttm/ttm_device.c
> > > > index 9b787b3caeb5..b941989885ed 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > > > @@ -228,6 +228,7 @@ int ttm_device_init(struct ttm_device *bdev,
> > > > struct ttm_device_funcs *funcs,
> > > > =A0=A0=A0=A0=A0 bdev->vma_manager =3D vma_manager;
> > > > =A0=A0=A0=A0=A0 INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_wor=
kqueue);
> > > > =A0=A0=A0=A0=A0 spin_lock_init(&bdev->lru_lock);
> > > > +=A0=A0=A0 spin_lock_init(&bdev->ddestroy_lock);
> > > > =A0=A0=A0=A0=A0 INIT_LIST_HEAD(&bdev->ddestroy);
> > > > =A0=A0=A0=A0=A0 bdev->dev_mapping =3D mapping;
> > > > =A0=A0=A0=A0=A0 mutex_lock(&ttm_global_mutex);
> > > > diff --git a/include/drm/ttm/ttm_device.h
> > > > b/include/drm/ttm/ttm_device.h
> > > > index 7c8f87bd52d3..fa8c4f6a169e 100644
> > > > --- a/include/drm/ttm/ttm_device.h
> > > > +++ b/include/drm/ttm/ttm_device.h
> > > > @@ -279,6 +279,7 @@ struct ttm_device {
> > > > =A0=A0=A0=A0=A0=A0 * Protection for the per manager LRU and ddestro=
y lists.
> > > > =A0=A0=A0=A0=A0=A0 */
> > > > =A0=A0=A0=A0=A0 spinlock_t lru_lock;
> > > > +=A0=A0=A0 spinlock_t ddestroy_lock;
> > > > =A0=A0=A0=A0=A0 struct list_head ddestroy;
> > > > =A0 =A0=A0=A0=A0=A0 /*
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
