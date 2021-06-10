Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF423A2F17
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2409289D63;
	Thu, 10 Jun 2021 15:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B0389D4D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:13:30 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id t140so2504729oih.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=63W3/iVz7u/ETiCu5+gG98ItxxoSVyRpvyqM4WeGAV4=;
 b=Fi12xoGAm63rNC4/P6yVLsDWXA8YK+ZHy10s92j67n5h23gqWXybCTP8ap6ZWGZdIB
 sH5P6fFDtyEpqNYq5H14QyLtq6fSa/tFwIdcWG1550DH/MgENDqbTBSzb3/Q75E+af9i
 C8gnRp9K3s+GcZ9D9JQQx9uYuaAMN6Yemd8bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=63W3/iVz7u/ETiCu5+gG98ItxxoSVyRpvyqM4WeGAV4=;
 b=CaOrYHpGg86mB8KlezuUSCsC1OaYWXMeENNzJ5fx0ElKzXDkfTWlR2a118hLBT3qlq
 UYnKT+GmlefRM/AcBvcncvPh3tp3XNaIOCK6/9iTeu9Di4xMq/vp5RUChcb+iNHjnGdM
 Q+R8I2/9H/McBPtpKv3gudUCGCRQblOQ+yFmk9/IsZ4E/ByzC1CBzSrtr5getD8fQglh
 lJ61wLI16jlKd6Yzjq9C3PN8Rc1TMDq/1yDAxtPm3apdop5NWzvHrqiJaUbOizN1eANx
 XjwjqSR78N6iCv7Lis0mp+YC3kYRgrujhPc5hhZWYs72Bh+1gFNJrqwgfJpTuNuT+Wad
 iEhw==
X-Gm-Message-State: AOAM533kiwFxwPq/W7csdDVRJzuG18p4QhoSDsi5RS8KtU8kPx7xmqX/
 UJcm2EJT4lsP1gbyVrRhHL140G2gQ49eaUmWHJDfzQ==
X-Google-Smtp-Source: ABdhPJxUmWqV5rf117N66awWktbA/kw1wr/ayHwxShdDndzIBhrUjAXZpGcS2MUdeSRJym/tLKJVheSc+IMPD6qL2fs=
X-Received: by 2002:aca:530f:: with SMTP id h15mr3867905oib.128.1623338009450; 
 Thu, 10 Jun 2021 08:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-6-jason@jlekstrand.net>
 <ea36431d-521a-c1c0-59e5-a196f55c28dd@amd.com>
 <CAOFGe97+JK9-HLsVrXdvm45Qk721utwpHyy8xpqR7uRCpZm5ig@mail.gmail.com>
In-Reply-To: <CAOFGe97+JK9-HLsVrXdvm45Qk721utwpHyy8xpqR7uRCpZm5ig@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 10 Jun 2021 17:13:18 +0200
Message-ID: <CAKMK7uGsQ3BWomCQtvrSygb-nc19LpAz2RFjsBzw-E_17tq8BA@mail.gmail.com>
Subject: Re: [PATCH 5/5] DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
To: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 3:59 PM Jason Ekstrand <jason@jlekstrand.net> wrote=
:
>
> On Thu, Jun 10, 2021 at 1:51 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 09.06.21 um 23:29 schrieb Jason Ekstrand:
> > > This helper existed to handle the weird corner-cases caused by using
> > > SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is using
> > > that anymore (i915 was the only real user), dma_fence_get_rcu is
> > > sufficient.  The one slightly annoying thing we have to deal with her=
e
> > > is that dma_fence_get_rcu_safe did an rcu_dereference as well as a
> > > SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each call si=
te
> > > ends up being 3 lines instead of 1.
> >
> > That's an outright NAK.
> >
> > The loop in dma_fence_get_rcu_safe is necessary because the underlying
> > fence object can be replaced while taking the reference.
>
> Right.  I had missed a bit of that when I first read through it.  I
> see the need for the loop now.  But there are some other tricky bits
> in there besides just the loop.

I thought that's what the kref_get_unless_zero was for in
dma_fence_get_rcu? Otherwise I guess I'm not seeing why still have
dma_fence_get_rcu around, since that should either be a kref_get or
it's just unsafe to call it ...

> > This is completely unrelated to SLAB_TYPESAFE_BY_RCU. See the
> > dma_fence_chain usage for reference.
> >
> > What you can remove is the sequence number handling in dma-buf. That
> > should make adding fences quite a bit quicker.
>
> I'll look at that and try to understand what's going on there.

Hm I thought the seqlock was to make sure we have a consistent set of
fences across exclusive and all shared slot. Not to protect against
the fence disappearing due to typesafe_by_rcu.
-Daniel

> --Jason
>
> > Regards,
> > Christian.
> >
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > ---
> > >   drivers/dma-buf/dma-fence-chain.c         |  8 ++--
> > >   drivers/dma-buf/dma-resv.c                |  4 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
> > >   drivers/gpu/drm/i915/i915_active.h        |  4 +-
> > >   drivers/gpu/drm/i915/i915_vma.c           |  4 +-
> > >   include/drm/drm_syncobj.h                 |  4 +-
> > >   include/linux/dma-fence.h                 | 50 --------------------=
---
> > >   include/linux/dma-resv.h                  |  4 +-
> > >   8 files changed, 23 insertions(+), 59 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-=
fence-chain.c
> > > index 7d129e68ac701..46dfc7d94d8ed 100644
> > > --- a/drivers/dma-buf/dma-fence-chain.c
> > > +++ b/drivers/dma-buf/dma-fence-chain.c
> > > @@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signaling(stru=
ct dma_fence *fence);
> > >    * dma_fence_chain_get_prev - use RCU to get a reference to the pre=
vious fence
> > >    * @chain: chain node to get the previous node from
> > >    *
> > > - * Use dma_fence_get_rcu_safe to get a reference to the previous fen=
ce of the
> > > - * chain node.
> > > + * Use rcu_dereference and dma_fence_get_rcu to get a reference to t=
he
> > > + * previous fence of the chain node.
> > >    */
> > >   static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_=
chain *chain)
> > >   {
> > >       struct dma_fence *prev;
> > >
> > >       rcu_read_lock();
> > > -     prev =3D dma_fence_get_rcu_safe(&chain->prev);
> > > +     prev =3D rcu_dereference(chain->prev);
> > > +     if (prev)
> > > +             prev =3D dma_fence_get_rcu(prev);
> > >       rcu_read_unlock();
> > >       return prev;
> > >   }
> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index f26c71747d43a..cfe0db3cca292 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > > @@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *dst, st=
ruct dma_resv *src)
> > >               dst_list =3D NULL;
> > >       }
> > >
> > > -     new =3D dma_fence_get_rcu_safe(&src->fence_excl);
> > > +     new =3D rcu_dereference(src->fence_excl);
> > > +     if (new)
> > > +             new =3D dma_fence_get_rcu(new);
> > >       rcu_read_unlock();
> > >
> > >       src_list =3D dma_resv_shared_list(dst);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_fence.c
> > > index 72d9b92b17547..0aeb6117f3893 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > @@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, s=
truct dma_fence **f,
> > >               struct dma_fence *old;
> > >
> > >               rcu_read_lock();
> > > -             old =3D dma_fence_get_rcu_safe(ptr);
> > > +             old =3D rcu_dereference(*ptr);
> > > +             if (old)
> > > +                     old =3D dma_fence_get_rcu(old);
> > >               rcu_read_unlock();
> > >
> > >               if (old) {
> > > diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i91=
5/i915_active.h
> > > index d0feda68b874f..bd89cfc806ca5 100644
> > > --- a/drivers/gpu/drm/i915/i915_active.h
> > > +++ b/drivers/gpu/drm/i915/i915_active.h
> > > @@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fence *a=
ctive)
> > >       struct dma_fence *fence;
> > >
> > >       rcu_read_lock();
> > > -     fence =3D dma_fence_get_rcu_safe(&active->fence);
> > > +     fence =3D rcu_dereference(active->fence);
> > > +     if (fence)
> > > +             fence =3D dma_fence_get_rcu(fence);
> > >       rcu_read_unlock();
> > >
> > >       return fence;
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i=
915_vma.c
> > > index 0f227f28b2802..ed0388d99197e 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > @@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
> > >               struct dma_fence *fence;
> > >
> > >               rcu_read_lock();
> > > -             fence =3D dma_fence_get_rcu_safe(&vma->active.excl.fenc=
e);
> > > +             fence =3D rcu_dereference(vma->active.excl.fence);
> > > +             if (fence)
> > > +                     fence =3D dma_fence_get_rcu(fence);
> > >               rcu_read_unlock();
> > >               if (fence) {
> > >                       err =3D dma_fence_wait(fence, MAX_SCHEDULE_TIME=
OUT);
> > > diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> > > index 6cf7243a1dc5e..6c45d52988bcc 100644
> > > --- a/include/drm/drm_syncobj.h
> > > +++ b/include/drm/drm_syncobj.h
> > > @@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj=
)
> > >       struct dma_fence *fence;
> > >
> > >       rcu_read_lock();
> > > -     fence =3D dma_fence_get_rcu_safe(&syncobj->fence);
> > > +     fence =3D rcu_dereference(syncobj->fence);
> > > +     if (fence)
> > > +             fence =3D dma_fence_get_rcu(syncobj->fence);
> > >       rcu_read_unlock();
> > >
> > >       return fence;
> > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > index 6ffb4b2c63715..f4a2ab2b1ae46 100644
> > > --- a/include/linux/dma-fence.h
> > > +++ b/include/linux/dma-fence.h
> > > @@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_get_rc=
u(struct dma_fence *fence)
> > >               return NULL;
> > >   }
> > >
> > > -/**
> > > - * dma_fence_get_rcu_safe  - acquire a reference to an RCU tracked f=
ence
> > > - * @fencep: pointer to fence to increase refcount of
> > > - *
> > > - * Function returns NULL if no refcount could be obtained, or the fe=
nce.
> > > - * This function handles acquiring a reference to a fence that may b=
e
> > > - * reallocated within the RCU grace period (such as with SLAB_TYPESA=
FE_BY_RCU),
> > > - * so long as the caller is using RCU on the pointer to the fence.
> > > - *
> > > - * An alternative mechanism is to employ a seqlock to protect a bunc=
h of
> > > - * fences, such as used by struct dma_resv. When using a seqlock,
> > > - * the seqlock must be taken before and checked after a reference to=
 the
> > > - * fence is acquired (as shown here).
> > > - *
> > > - * The caller is required to hold the RCU read lock.
> > > - */
> > > -static inline struct dma_fence *
> > > -dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
> > > -{
> > > -     do {
> > > -             struct dma_fence *fence;
> > > -
> > > -             fence =3D rcu_dereference(*fencep);
> > > -             if (!fence)
> > > -                     return NULL;
> > > -
> > > -             if (!dma_fence_get_rcu(fence))
> > > -                     continue;
> > > -
> > > -             /* The atomic_inc_not_zero() inside dma_fence_get_rcu()
> > > -              * provides a full memory barrier upon success (such as=
 now).
> > > -              * This is paired with the write barrier from assigning
> > > -              * to the __rcu protected fence pointer so that if that
> > > -              * pointer still matches the current fence, we know we
> > > -              * have successfully acquire a reference to it. If it n=
o
> > > -              * longer matches, we are holding a reference to some o=
ther
> > > -              * reallocated pointer. This is possible if the allocat=
or
> > > -              * is using a freelist like SLAB_TYPESAFE_BY_RCU where =
the
> > > -              * fence remains valid for the RCU grace period, but it
> > > -              * may be reallocated. When using such allocators, we a=
re
> > > -              * responsible for ensuring the reference we get is to
> > > -              * the right fence, as below.
> > > -              */
> > > -             if (fence =3D=3D rcu_access_pointer(*fencep))
> > > -                     return rcu_pointer_handoff(fence);
> > > -
> > > -             dma_fence_put(fence);
> > > -     } while (1);
> > > -}
> > > -
> > >   #ifdef CONFIG_LOCKDEP
> > >   bool dma_fence_begin_signalling(void);
> > >   void dma_fence_end_signalling(bool cookie);
> > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > index 562b885cf9c3d..a38c021f379af 100644
> > > --- a/include/linux/dma-resv.h
> > > +++ b/include/linux/dma-resv.h
> > > @@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv *obj)
> > >               return NULL;
> > >
> > >       rcu_read_lock();
> > > -     fence =3D dma_fence_get_rcu_safe(&obj->fence_excl);
> > > +     fence =3D rcu_dereference(obj->fence_excl);
> > > +     if (fence)
> > > +             fence =3D dma_fence_get_rcu(fence);
> > >       rcu_read_unlock();
> > >
> > >       return fence;
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
