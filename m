Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2824CB6F3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 07:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C2C10EA84;
	Thu,  3 Mar 2022 06:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D328310EA81;
 Thu,  3 Mar 2022 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646288950; x=1677824950;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XEnn5MCbG6f2oWpeSqNY0xJn7fmIJXcLPQNX9vnVH14=;
 b=hPwoLhVWpLBdq2QNuGsFoqf45rBoebJakxy58F7GgUQXK7tCLbDTAOQg
 vA9RlHyUb5CjbfnN9hJH+Pw9O01Mrz5q/yiE7FjtcXPDwaAoF0BczGPgS
 wWd4+newbxfbN2ezOvL5LMGjmth4nbceVQu/3rz+PQnHNgKPbuT2NY9Zh
 hgfznfP9E/grBLQj1VfiWBA4Sfr09aN2iezxF1r8HbwP0bLsPwHo/FWUj
 rZDgFaUE9KuMlYtRV5yAarB4/zeWxgo6JQMPyGfHt9vaTK3t50vUtbvvY
 LrCIN/7DfOJvOytyqkgGpJWKTaZ6beW2HqoKlPbld6FTHPwevYGAd+lMn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="252418824"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="252418824"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 22:29:10 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="641991656"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 22:29:08 -0800
Message-ID: <efe060b412b43045124341e7550e3c2a55da81bf.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915: Remove the vma refcount
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Thu, 03 Mar 2022 07:29:05 +0100
In-Reply-To: <20220302220139.GH25117@nvishwa1-DESK>
References: <20220302102200.158637-1-thomas.hellstrom@linux.intel.com>
 <20220302102200.158637-3-thomas.hellstrom@linux.intel.com>
 <20220302220139.GH25117@nvishwa1-DESK>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-03-02 at 14:01 -0800, Niranjana Vishwanathapura wrote:
> On Wed, Mar 02, 2022 at 11:21:59AM +0100, Thomas Hellström wrote:
> > Now that i915_vma_parked() is taking the object lock on vma
> > destruction,
> > and the only user of the vma refcount, i915_gem_object_unbind()
> > also takes the object lock, remove the vma refcount.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> > drivers/gpu/drm/i915/i915_gem.c       | 17 +++++++++++++----
> > drivers/gpu/drm/i915/i915_vma.c       | 14 +++-----------
> > drivers/gpu/drm/i915/i915_vma.h       | 14 --------------
> > drivers/gpu/drm/i915/i915_vma_types.h |  1 -
> > 4 files changed, 16 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c
> > b/drivers/gpu/drm/i915/i915_gem.c
> > index dd84ebabb50f..c26110abcc0b 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -151,14 +151,25 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >                         break;
> >                 }
> > 
> > +               /*
> > +                * Requiring the vm destructor to take the object
> > lock
> > +                * before destroying a vma would help us eliminate
> > the
> > +                * i915_vm_tryget() here, AND thus also the barrier
> > stuff
> > +                * at the end. That's an easy fix, but sleeping
> > locks in
> > +                * a kthread should generally be avoided.
> > +                */
> >                 ret = -EAGAIN;
> >                 if (!i915_vm_tryget(vma->vm))
> >                         break;
> > 
> > -               /* Prevent vma being freed by i915_vma_parked as we
> > unbind */
> > -               vma = __i915_vma_get(vma);
> >                 spin_unlock(&obj->vma.lock);
> > 
> > +               /*
> > +                * Since i915_vma_parked() takes the object lock
> > +                * before vma destruction, it won't race us here,
> > +                * and destroy the vma from under us.
> > +                */
> > +
> >                 if (vma) {
> >                         bool vm_trylock = !!(flags &
> > I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
> >                         ret = -EBUSY;
> > @@ -180,8 +191,6 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >                                         ret = i915_vma_unbind(vma);
> >                                 }
> >                         }
> > -
> > -                       __i915_vma_put(vma);
> >                 }
> > 
> >                 i915_vm_put(vma->vm);
> 
> One issue still left in i915_gem_object_unbind is that it temporarily
> removes
> vmas from the obj->vma.list and adds back later as vma needs to be
> unbind outside
> the obj->vma.lock spinlock. This is an issue for other places where
> we iterate
> over the obj->vma.list. i915_debugfs_describe_obj is one such case
> (upcoming
> vm_bind will be another) that iterates over this list.
> What is the plan here? Do we need to take object lock while iterating
> over the
> list?

Yeah, I guess that's an option if that's at all possible (we might need
to iterate over the list in the mmu notifier, for example).

The other option is to
*) get rid of the GGTT / PPGTT sorting of vmas in the list,
*) being able to determine per vma *before we unlock* if we need to
unlock the list spinlock to take action,
*) re-add all vmas we've previously iterated over at the *tail* of the
list before unlocking the list lock.

Then a termination criterion for iterating would be that we reached the
end of the list without unlocking. Otherwise we need to restart
iteration after unlocking.

This would typically give us O(2N) complexity for the iteration. If we
re-add at the *head* of the list, we'd see O(N²), but to be able to re-
add previous vmas to the tail of the list requires us to get rid of the
sorting.

> 
> But this just something I noticed and not related to this patch.
> This patch looks good to me.
> Reviewed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
>  

Thanks for reviewing. I noticed there is some documentation needing
updating as well, so I'll send out a v3 without functional changes.

/Thomas


> 
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c
> > b/drivers/gpu/drm/i915/i915_vma.c
> > index 91538bc38110..6fd25b39748f 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -122,7 +122,6 @@ vma_create(struct drm_i915_gem_object *obj,
> >         if (vma == NULL)
> >                 return ERR_PTR(-ENOMEM);
> > 
> > -       kref_init(&vma->ref);
> >         vma->ops = &vm->vma_ops;
> >         vma->obj = obj;
> >         vma->size = obj->base.size;
> > @@ -1628,15 +1627,6 @@ void i915_vma_reopen(struct i915_vma *vma)
> >                 __i915_vma_remove_closed(vma);
> > }
> > 
> > -void i915_vma_release(struct kref *ref)
> > -{
> > -       struct i915_vma *vma = container_of(ref, typeof(*vma),
> > ref);
> > -
> > -       i915_active_fini(&vma->active);
> > -       GEM_WARN_ON(vma->resource);
> > -       i915_vma_free(vma);
> > -}
> > -
> > static void force_unbind(struct i915_vma *vma)
> > {
> >         if (!drm_mm_node_allocated(&vma->node))
> > @@ -1665,7 +1655,9 @@ static void release_references(struct
> > i915_vma *vma, bool vm_ddestroy)
> >         if (vm_ddestroy)
> >                 i915_vm_resv_put(vma->vm);
> > 
> > -       __i915_vma_put(vma);
> > +       i915_active_fini(&vma->active);
> > +       GEM_WARN_ON(vma->resource);
> > +       i915_vma_free(vma);
> > }
> > 
> > /**
> > diff --git a/drivers/gpu/drm/i915/i915_vma.h
> > b/drivers/gpu/drm/i915/i915_vma.h
> > index 67ae7341c7e0..6034991d89fe 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.h
> > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > @@ -222,20 +222,6 @@ void i915_vma_unlink_ctx(struct i915_vma
> > *vma);
> > void i915_vma_close(struct i915_vma *vma);
> > void i915_vma_reopen(struct i915_vma *vma);
> > 
> > -static inline struct i915_vma *__i915_vma_get(struct i915_vma
> > *vma)
> > -{
> > -       if (kref_get_unless_zero(&vma->ref))
> > -               return vma;
> > -
> > -       return NULL;
> > -}
> > -
> > -void i915_vma_release(struct kref *ref);
> > -static inline void __i915_vma_put(struct i915_vma *vma)
> > -{
> > -       kref_put(&vma->ref, i915_vma_release);
> > -}
> > -
> > void i915_vma_destroy_locked(struct i915_vma *vma);
> > void i915_vma_destroy(struct i915_vma *vma);
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
> > b/drivers/gpu/drm/i915/i915_vma_types.h
> > index eac36be184e5..be6e028c3b57 100644
> > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > @@ -211,7 +211,6 @@ struct i915_vma {
> >          * handles (but same file) for execbuf, i.e. the number of
> > aliases
> >          * that exist in the ctx->handle_vmas LUT for this vma.
> >          */
> > -       struct kref ref;
> >         atomic_t open_count;
> >         atomic_t flags;
> >         /**
> > -- 
> > 2.34.1
> > 


