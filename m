Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1E55A3E4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C8B10E30C;
	Fri, 24 Jun 2022 21:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CB510E30C;
 Fri, 24 Jun 2022 21:49:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so4764325wra.9;
 Fri, 24 Jun 2022 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=No3HtbaXixqxbVU93IS87MtvNsI6E4xrdnpxMPmipvg=;
 b=d6nW+jlfBJ/91egeIKsFUKSLSvyjeGUzXrjcXClVFtfKOISsveB1jpf63wgTmSjMbB
 nmRjQxAAeP+hCrjN20pchYlh0f4DMdcTrznviP8lIH2RK0LDayQdk8WITOsAOadPmkOH
 0xKDoLOzS6HhugxkgcPi7u08bxaUSAKdA4lTRTALSEDQPOdHk23y6sb+ql049alV1NP7
 dGq2M+q+osXzpQNoo7R7ZkgOdcB/TP8LKfd7ming3M7gwGuOy9x5GfNCL8UddNzzXl6e
 WQUEvCqB5DlcSByIjmtXr/nz5ELlSiC2Q0tYxRVtfmFLHScCamM7Gdn0JmyTC4/RrFGA
 LH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=No3HtbaXixqxbVU93IS87MtvNsI6E4xrdnpxMPmipvg=;
 b=1UWs3UdJEundiYKjkJIos8Inbi7o7BduOL0KCBnIjVWovE4S8lb9GjQZLYi0s4S6Tv
 xXiXKYwb43DNZZbq8cHm/boA08PLVk5Y5JC2yoYf97DKZ0cRB3lnwhz7y3VAjgoZLS8X
 lU8CyU9Fde34sObxq3acborTmohLykfB7J1MDtP/u9RI5qg2xIIIz8Gz9JAzEHxdMFWU
 wQp+aibCq3RbL2UHEDiWJ+/got40FwzAN4xWb8GWUeOJEYv27iBgHpc1ZF7o9BCyTDJJ
 jSQqjXq5USuGheCCTlOA3FwX4S2lmMJSUV09J5KsXeD9B7pMyvBljfaylQBjhJvc3n4O
 HjmQ==
X-Gm-Message-State: AJIora9zA9ABPnjclQwXmg1tTd5i9oORz/En2Ryq9Fs1jVVa0FpZWIwf
 6c3nrHfX16eGmAZRWzyOWMKppDMvCm9Vc5isIDA=
X-Google-Smtp-Source: AGRyM1s26PxopJzdtMMKntXKoWpUITUXA7ovH3EAYwwk6mGFvGQuG9Oo/t7Wj8LAH7SM1uFT7BcIazUEKeS/m823Tag=
X-Received: by 2002:a5d:47c3:0:b0:219:b391:b748 with SMTP id
 o3-20020a5d47c3000000b00219b391b748mr976570wrc.221.1656107342150; Fri, 24 Jun
 2022 14:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220613205032.2652374-1-robdclark@gmail.com>
 <CAE-0n51ADDijFnPwAQNwYE=62Rj4ZeQ38G7D=Xx3s5x7MRm18A@mail.gmail.com>
 <CAF6AEGtKiv+Y+BQSKvoydEN7W629_BRJR_sMEdFqsWCDRwsSQQ@mail.gmail.com>
 <YrYlgiQYSIoJFqwH@phenom.ffwll.local>
 <CAF6AEGvXUsyVUubhPJy0B=ZDoxofFgPkKh=7g2BEnRwt1N+qmw@mail.gmail.com>
 <YrYuXvI8ZyHGWAwZ@phenom.ffwll.local>
In-Reply-To: <YrYuXvI8ZyHGWAwZ@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 Jun 2022 14:49:10 -0700
Message-ID: <CAF6AEGtj-SqCKeS2M-7q74d9_6ynnUSGFis608634EiGmxoa4g@mail.gmail.com>
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

On Fri, Jun 24, 2022 at 2:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jun 24, 2022 at 02:28:25PM -0700, Rob Clark wrote:
> > On Fri, Jun 24, 2022 at 1:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, Jun 16, 2022 at 06:59:46AM -0700, Rob Clark wrote:
> > > > On Thu, Jun 16, 2022 at 1:28 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > >
> > > > > Quoting Rob Clark (2022-06-13 13:50:32)
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > > > > > index d608339c1643..432032ad4aed 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > > > > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > > > > @@ -229,7 +229,19 @@ msm_gem_unlock(struct drm_gem_object *obj)
> > > > > >  static inline bool
> > > > > >  msm_gem_is_locked(struct drm_gem_object *obj)
> > > > > >  {
> > > > > > -       return dma_resv_is_locked(obj->resv);
> > > > > > +       /*
> > > > > > +        * Destroying the object is a special case.. msm_gem_free_object()
> > > > > > +        * calls many things that WARN_ON if the obj lock is not held.  But
> > > > > > +        * acquiring the obj lock in msm_gem_free_object() can cause a
> > > > > > +        * locking order inversion between reservation_ww_class_mutex and
> > > > > > +        * fs_reclaim.
> > > > > > +        *
> > > > > > +        * This deadlock is not actually possible, because no one should
> > > > > > +        * be already holding the lock when msm_gem_free_object() is called.
> > > > > > +        * Unfortunately lockdep is not aware of this detail.  So when the
> > > > > > +        * refcount drops to zero, we pretend it is already locked.
> > > > > > +        */
> > > > > > +       return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
> > > > >
> > > > > Instead of modifying this function can we push down the fact that this
> > > > > function is being called from the free path and skip checking this
> > > > > condition in that case? Or add some "_locked/free_path" wrappers that
> > > > > skip the lock assertion? That would make it clearer to understand while
> > > > > reading the code that it is locked when it is asserted to be locked, and
> > > > > that we don't care when we're freeing because all references to the
> > > > > object are gone.
> > > >
> > > > that was my earlier attempt, and I wasn't too happy with the result.
> > > > And then I realized if refcount==0 then by definition we aren't racing
> > > > with anyone else ;-)
> > >
> > > I think that's not entirely correct, at least not for fairly reasonable
> > > shrinker designs:
> > >
> > > If the shrinker trylocks for throwing stuff out it might race with a
> > > concurrent finalization. Depends a bit upon your design, but usually
> > > that's possible.
> >
> > Kinda but in fact no.  At least not if your shrinker is designed properly.
> >
> > The shrinker does kref_get_unless_zero() and bails in the case that
> > we've already started finalizing.  See:
> >
> > https://patchwork.freedesktop.org/patch/490160/
>
> Oh you have the order differently than what I'd have typed. If you do
> dma_resv_trylock under the lru lock then the kref_get_unless_zero isn't
> needed.
>
> Ofc if you do it like you do then you need your locking check trickery.

Just as a side note, if I didn't sprinkle around so liberally
WARN_ON(!obj_is_locked(obj)) so much, we also wouldn't need this
trickery.  (But I'm a fan of those, both to remember where which locks
are expected to be held, and to be shouty if $future_me screws it up)

>
> > > There won't be a problem since you'll serialize on a lock eventually. But
> > > if you drop all your locking debug checks like this then it's very hard to
> > > figure this out :-)
> > >
> > > Ofc you can adjust your refcounting scheme to make this impossible, but
> > > then there's also not really any need to call any functions which might
> > > need some locking, since by that time all that stuff must have been
> > > cleaned up already (or the refcount could not have dropped to zero). Like
> > > if any iova mapping holds a reference you never have these problems.
> > >
> > > Long story short, this kind of design freaks me out big time. Especially
> > > when it involves both a cross-driver refcount like the gem_bo one and a
> > > cross driver lock ...
> > >
> > > The standard way to fix this is to trylock dma_resv on cleanup and push to
> > > a worker if you can't get it. This is what ttm and i915 does. Might be
> > > good to lift that into drm_gem.c helpers and just use it.
> >
> > We used to do that (but unconditionally).. and got rid of it because
> > it was causing jank issues (lots of queued up finalizers delaying
> > retire work, or something along those lines, IIRC).  I guess back then
> > struct_mutex was also involved, and it might not be as bad if we only
> > took the async path if we didn't win the trylock.  But IMO that is
> > totally unnecessary.  And I kinda am skeptical about pushing too much
> > locking stuff to drm core.
>
> Yeah with dev->struct_mutex and unconditionally it's going to be terrible.
> It really should't be that bad.
>
> Pulling back into the big picture, I really don't like drivers to spin
> their own world for this stuff. And with the ttm drivers (and the i915-gem
> one or so) doing one thing, I think msm should do the same. Unless there's
> a reason why that's really stupid, and then we should probably switch ttm
> over to that too?
>
> If ever driver uses dma_resv differently in the cleanup paths (which are
> really the tricky ones) then cross driver code reading becomes an exercise
> in pitfall counting and leg regeneration :-(
>
> Also I really don't care about which bikeshed we settle on, as least as
> they're all the same.

Start by bikeshedding my RFC for lru/shrinker helpers?  At least then
we could pull the tricky bit about parallel references to objects
being finalized into a helper.

(I'll send a non-RFC version with a few fixes, hopefully maybe even
today.. I'm just putting finishing touches on larger series that it is
a part of)

BR,
-R

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
