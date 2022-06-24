Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8544855A374
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1979D10EC38;
	Fri, 24 Jun 2022 21:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769010EC38;
 Fri, 24 Jun 2022 21:28:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o4so764886wrh.3;
 Fri, 24 Jun 2022 14:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCktfeAYPLOOLtXhnr6rkle2B8/7Lx7IsqF6fYWEEf4=;
 b=bgtOKvMkWO8UBlfenk00QtolZWZ7d1eujaiPKOc0nC5KfDahRspMRgQ77yP5BCa7bg
 UPpUEZBtJDbsvR7r+Ch+f2R59HLROHPR2zKRXvfgkr2w9wLXxc/ludwq+mB+Hnuw6n/O
 pVWSTyCHql2JNpToJ2zDKIcio77uR34+8pONeIpRgWFiXsJhYFzDQhaGIm4d6JTA/cHO
 MplDxtmN7+mUejacre7+zqf6mt+KBuIy/51cQWXy6isFON9aIopr+fCQeX6y/pVDhr+A
 6WFw0xrRb4RpNMzF23CcT1G+AKao6iL0pFsAgZIwnHS4deGQRVRstzN1jEcuYYQnhujA
 sHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCktfeAYPLOOLtXhnr6rkle2B8/7Lx7IsqF6fYWEEf4=;
 b=4WLr+48y+yUoKrnbj9sZYKvppDKYjWGBJAHkMOGER1gPPD69usqRwKDZT3Tu3XuA63
 BOl47+exNIoCyz0X61DFTMAjeQMEh94RiuxakpE2klfiJow5HeyQhlV24MeD1vX+02ED
 tQkBxUXU6VZLzG/c5S8DIy0tAK7iYjdwYl8NQ3fT5Iy/cwUgLpBgTgu4sKLAso/VjwxQ
 d9obj5evHv6atz8ERq1OdzG8ceTELCRvWSlBDiCphhOktV193UC7J1pKg0P01iiTnwbV
 b7L3ayQZPbiAkwz2IaX8oTBZFzPqOWotvUHAjAUwM6OqG7liXUuCclPBJUOeuRv/YXHv
 WVcA==
X-Gm-Message-State: AJIora+hVPss4fajJ31KuUZk8L8OKb7x0/KWm8QSiN+6eYxSejC7fdgW
 HT/AXFlWN+/r+VC8QOYQGKl0Dt4INkdSC3Ry9a2hK98VQTs=
X-Google-Smtp-Source: AGRyM1vs1LrakKe4qJRmIuRDauk61TKLNgXFMgwe+rKkgTkId3aXzDSCuhsJ4+UWqqkNWnUuZKrGL7SCBXzEHpZJwIE=
X-Received: by 2002:a5d:47c3:0:b0:219:b391:b748 with SMTP id
 o3-20020a5d47c3000000b00219b391b748mr923242wrc.221.1656106098000; Fri, 24 Jun
 2022 14:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220613205032.2652374-1-robdclark@gmail.com>
 <CAE-0n51ADDijFnPwAQNwYE=62Rj4ZeQ38G7D=Xx3s5x7MRm18A@mail.gmail.com>
 <CAF6AEGtKiv+Y+BQSKvoydEN7W629_BRJR_sMEdFqsWCDRwsSQQ@mail.gmail.com>
 <YrYlgiQYSIoJFqwH@phenom.ffwll.local>
In-Reply-To: <YrYlgiQYSIoJFqwH@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 Jun 2022 14:28:25 -0700
Message-ID: <CAF6AEGvXUsyVUubhPJy0B=ZDoxofFgPkKh=7g2BEnRwt1N+qmw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Drop obj lock in msm_gem_free_object()
To: Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jun 24, 2022 at 1:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jun 16, 2022 at 06:59:46AM -0700, Rob Clark wrote:
> > On Thu, Jun 16, 2022 at 1:28 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Rob Clark (2022-06-13 13:50:32)
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > > > index d608339c1643..432032ad4aed 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > > @@ -229,7 +229,19 @@ msm_gem_unlock(struct drm_gem_object *obj)
> > > >  static inline bool
> > > >  msm_gem_is_locked(struct drm_gem_object *obj)
> > > >  {
> > > > -       return dma_resv_is_locked(obj->resv);
> > > > +       /*
> > > > +        * Destroying the object is a special case.. msm_gem_free_object()
> > > > +        * calls many things that WARN_ON if the obj lock is not held.  But
> > > > +        * acquiring the obj lock in msm_gem_free_object() can cause a
> > > > +        * locking order inversion between reservation_ww_class_mutex and
> > > > +        * fs_reclaim.
> > > > +        *
> > > > +        * This deadlock is not actually possible, because no one should
> > > > +        * be already holding the lock when msm_gem_free_object() is called.
> > > > +        * Unfortunately lockdep is not aware of this detail.  So when the
> > > > +        * refcount drops to zero, we pretend it is already locked.
> > > > +        */
> > > > +       return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
> > >
> > > Instead of modifying this function can we push down the fact that this
> > > function is being called from the free path and skip checking this
> > > condition in that case? Or add some "_locked/free_path" wrappers that
> > > skip the lock assertion? That would make it clearer to understand while
> > > reading the code that it is locked when it is asserted to be locked, and
> > > that we don't care when we're freeing because all references to the
> > > object are gone.
> >
> > that was my earlier attempt, and I wasn't too happy with the result.
> > And then I realized if refcount==0 then by definition we aren't racing
> > with anyone else ;-)
>
> I think that's not entirely correct, at least not for fairly reasonable
> shrinker designs:
>
> If the shrinker trylocks for throwing stuff out it might race with a
> concurrent finalization. Depends a bit upon your design, but usually
> that's possible.

Kinda but in fact no.  At least not if your shrinker is designed properly.

The shrinker does kref_get_unless_zero() and bails in the case that
we've already started finalizing.  See:

https://patchwork.freedesktop.org/patch/490160/

> There won't be a problem since you'll serialize on a lock eventually. But
> if you drop all your locking debug checks like this then it's very hard to
> figure this out :-)
>
> Ofc you can adjust your refcounting scheme to make this impossible, but
> then there's also not really any need to call any functions which might
> need some locking, since by that time all that stuff must have been
> cleaned up already (or the refcount could not have dropped to zero). Like
> if any iova mapping holds a reference you never have these problems.
>
> Long story short, this kind of design freaks me out big time. Especially
> when it involves both a cross-driver refcount like the gem_bo one and a
> cross driver lock ...
>
> The standard way to fix this is to trylock dma_resv on cleanup and push to
> a worker if you can't get it. This is what ttm and i915 does. Might be
> good to lift that into drm_gem.c helpers and just use it.

We used to do that (but unconditionally).. and got rid of it because
it was causing jank issues (lots of queued up finalizers delaying
retire work, or something along those lines, IIRC).  I guess back then
struct_mutex was also involved, and it might not be as bad if we only
took the async path if we didn't win the trylock.  But IMO that is
totally unnecessary.  And I kinda am skeptical about pushing too much
locking stuff to drm core.

BR,
-R

> -Daniel
>
> >
> > > Here's a totally untested patch to show the idea. The comment about
> > > pretending the lock is held can be put in msm_gem_free_object() to
> > > clarify why it's OK to call the locked variants of the functions.
> > >
> > > ---8<---
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > index 97d5b4d8b9b0..01f19d37bfb6 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -346,13 +346,11 @@ static void del_vma(struct msm_gem_vma *vma)
> > >   * mapping.
> > >   */
> > >  static void
> > > -put_iova_spaces(struct drm_gem_object *obj, bool close)
> > > +put_iova_spaces_locked(struct drm_gem_object *obj, bool close)
> > >  {
> > >         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > >         struct msm_gem_vma *vma;
> > >
> > > -       GEM_WARN_ON(!msm_gem_is_locked(obj));
> > > -
> > >         list_for_each_entry(vma, &msm_obj->vmas, list) {
> > >                 if (vma->aspace) {
> > >                         msm_gem_purge_vma(vma->aspace, vma);
> > > @@ -362,18 +360,28 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
> > >         }
> > >  }
> > >
> > > -/* Called with msm_obj locked */
> > > +static void put_iova_spaces(struct drm_gem_object *obj, bool close)
> > > +{
> > > +       GEM_WARN_ON(!msm_gem_is_locked(obj));
> > > +       put_iova_spaces_locked(obj, close);
> > > +}
> >
> > they are both _locked paths ;-)
> >
> > But in general I think the parallel code paths make things more
> > confusing about what is the right thing to call.  And I would like to
> > put more WARN_ON(!locked()) in the gem_vma code, to make it clear that
> > the obj lock is protecting things there as well.. which, with this
> > approach would turn into parallel code paths multiple levels deep
> >
> > BR,
> > -R
> >
> > > +
> > > +/* Called with msm_obj locked or on the free path */
> > >  static void
> > > -put_iova_vmas(struct drm_gem_object *obj)
> > > +put_iova_vmas_locked(struct drm_gem_object *obj)
> > >  {
> > >         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > >         struct msm_gem_vma *vma, *tmp;
> > >
> > > -       GEM_WARN_ON(!msm_gem_is_locked(obj));
> > > -
> > > -       list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
> > > +       list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list)
> > >                 del_vma(vma);
> > > -       }
> > > +}
> > > +
> > > +static void
> > > +put_iova_vmas(struct drm_gem_object *obj)
> > > +{
> > > +       GEM_WARN_ON(!msm_gem_is_locked(obj));
> > > +       put_iova_vmas_locked(obj);
> > >  }
> > >
> > >  static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
> > > @@ -795,12 +803,10 @@ void msm_gem_evict(struct drm_gem_object *obj)
> > >         update_inactive(msm_obj);
> > >  }
> > >
> > > -void msm_gem_vunmap(struct drm_gem_object *obj)
> > > +static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
> > >  {
> > >         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > >
> > > -       GEM_WARN_ON(!msm_gem_is_locked(obj));
> > > -
> > >         if (!msm_obj->vaddr || GEM_WARN_ON(!is_vunmapable(msm_obj)))
> > >                 return;
> > >
> > > @@ -808,6 +814,12 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
> > >         msm_obj->vaddr = NULL;
> > >  }
> > >
> > > +void msm_gem_vunmap(struct drm_gem_object *obj)
> > > +{
> > > +       GEM_WARN_ON(!msm_gem_is_locked(obj));
> > > +       msm_gem_vunmap_locked(obj);
> > > +}
> > > +
> > >  void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
> > >  {
> > >         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > > @@ -1021,12 +1033,11 @@ void msm_gem_free_object(struct drm_gem_object *obj)
> > >         list_del(&msm_obj->mm_list);
> > >         mutex_unlock(&priv->mm_lock);
> > >
> > > -       msm_gem_lock(obj);
> > > -
> > >         /* object should not be on active list: */
> > >         GEM_WARN_ON(is_active(msm_obj));
> > >
> > > -       put_iova_spaces(obj, true);
> > > +       put_iova_spaces_locked(obj, true);
> > > +
> > >
> > >         if (obj->import_attach) {
> > >                 GEM_WARN_ON(msm_obj->vaddr);
> > > @@ -1036,19 +1047,13 @@ void msm_gem_free_object(struct drm_gem_object *obj)
> > >                  */
> > >                 kvfree(msm_obj->pages);
> > >
> > > -               put_iova_vmas(obj);
> > > -
> > > -               /* dma_buf_detach() grabs resv lock, so we need to unlock
> > > -                * prior to drm_prime_gem_destroy
> > > -                */
> > > -               msm_gem_unlock(obj);
> > > +               put_iova_vmas_locked(obj);
> > >
> > >                 drm_prime_gem_destroy(obj, msm_obj->sgt);
> > >         } else {
> > > -               msm_gem_vunmap(obj);
> > > +               msm_gem_vunmap_locked(obj);
> > >                 put_pages(obj);
> > > -               put_iova_vmas(obj);
> > > -               msm_gem_unlock(obj);
> > > +               put_iova_vmas_locked(obj);
> > >         }
> > >
> > >         drm_gem_object_release(obj);
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > > index c75d3b879a53..b2998a074de7 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > @@ -253,7 +253,6 @@ static inline bool is_purgeable(struct
> > > msm_gem_object *msm_obj)
> > >
> > >  static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
> > >  {
> > > -       GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
> > >         return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > > b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > > index 086dacf2f26a..afff3a79e925 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > > @@ -175,6 +175,7 @@ static const int vmap_shrink_limit = 15;
> > >  static bool
> > >  vmap_shrink(struct msm_gem_object *msm_obj)
> > >  {
> > > +       GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
> > >         if (!is_vunmapable(msm_obj))
> > >                 return false;
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
