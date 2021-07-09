Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E73C279F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 18:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7F889A32;
	Fri,  9 Jul 2021 16:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBB089A32;
 Fri,  9 Jul 2021 16:35:15 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id j184so9890333qkd.6;
 Fri, 09 Jul 2021 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2E9nSTOQ9evUwXAuwYMJy1PpLDyZpXGi/w/pyrG+K8M=;
 b=hx0E0AjwXOe64I3s0rjgskrHiGE7MQ+AQrVGcPv7LjQwmU0k40VtV5NVU76IWA62Q/
 OwonoQiB3hr0gxc9UNVgkEdsfO0R7X7LR+vC3A2x3rCtwFq3EQArx40nualHSVYNBf/6
 nZtzf/OxE4nrTLx4bJhqHdniJ84OrF/LgMKfto+4pHbRspoZ6L8VhA5wE5BLgbL5IqEA
 Ww9tpzYwHumPqvcqT86ndTL+ZKztjD1agenLKNI8bx18pe3TY7EfLhkMuDRcPRpPt9Aw
 5+/eJAc0wfm58kZ8t7ZubXruCiMFvUPeptYRpZM1SR1P6HtOqqppmbrFgq9tNzS/fPRm
 OD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2E9nSTOQ9evUwXAuwYMJy1PpLDyZpXGi/w/pyrG+K8M=;
 b=B0z6z2bJNRCIM1kU2ndYRvIxCBOjMsLSvPM+eOEQa8UzX0/xHNGSSHyiAI2q4jqz3O
 RRHSzmgFYnLO81t0Cvy545OmxovzaxrFufy841MDqaIWaJF5N+06e1OmasrPe9NfQ59l
 pS/ugDYdWGoP0PwcVzuEyQl/W+nM1sI86mGWnHFxU/QpsqKNgRrD17M9Zdw3H3n+yNNP
 /ER9z1kN55xQQbtfd4DBDdBZcoR7XaPPVcBsonu2WWClbJjBUR0FeFvpO9zOhsYJS0D0
 PNlaljOLjtNeUMYUnQUsaAtZ8H+ky/xdNNrVJyTgNKR1uEAqPI6pHj+rGmHUWjrw3Ni/
 i5xw==
X-Gm-Message-State: AOAM531hUO5i8/NIcGDdBt7MZCGQfBZdYPbkrzBOyT1opDODLEU17Zz2
 VzRh5uNbNbU8X6exfTPAVwI1up7SsHlwJc6FueI=
X-Google-Smtp-Source: ABdhPJyx48aN2WkXw27KZZGnSB8trx/9LcqJORaV2wEtFsX+KUjdjDs7zEuxSuBV6gQpp7bJ4Vetyy4NZ2cAnIOvBsY=
X-Received: by 2002:a37:a997:: with SMTP id s145mr1072755qke.327.1625848514118; 
 Fri, 09 Jul 2021 09:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210709151933.1994078-1-matthew.auld@intel.com>
 <CAKMK7uHThXJBMKxgyhAN5-1N793a9n=RN39anqCS6GPZiP=bNA@mail.gmail.com>
In-Reply-To: <CAKMK7uHThXJBMKxgyhAN5-1N793a9n=RN39anqCS6GPZiP=bNA@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 9 Jul 2021 17:34:46 +0100
Message-ID: <CAM0jSHNswrbF6Mzsm1RuJnEBWG3utWCrOww46fr9=X3O6ssS9A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: unconditionally flush the pages
 on acquire
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Francisco Jerez <francisco.jerez.plata@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Jul 2021 at 17:13, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jul 9, 2021 at 5:19 PM Matthew Auld <matthew.auld@intel.com> wrote:
> >
> > EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
> > possible for userspace to bypass the GTT caching bits set by the kernel,
> > as per the given object cache_level. This is troublesome since the heavy
> > flush we apply when first acquiring the pages is skipped if the kernel
> > thinks the object is coherent with the GPU. As a result it might be
> > possible to bypass the cache and read the contents of the page directly,
> > which could be stale data. If it's just a case of userspace shooting
> > themselves in the foot then so be it, but since i915 takes the stance of
> > always zeroing memory before handing it to userspace, we need to prevent
> > this.
> >
> > BSpec: 34007
> > References: 046091758b50 ("Revert "drm/i915/ehl: Update MOCS table for EHL"")
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: Francisco Jerez <francisco.jerez.plata@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 29 +++++++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > index 6a04cce188fc..7e9ec68cce9e 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -298,11 +298,12 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
> >
> >  void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_table *pages)
> >  {
> > +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> >         struct sgt_iter sgt_iter;
> >         struct pagevec pvec;
> >         struct page *page;
> >
> > -       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
> > +       GEM_WARN_ON(IS_DGFX(i915));
> >         __i915_gem_object_release_shmem(obj, pages, true);
> >
> >         i915_gem_gtt_finish_pages(obj, pages);
> > @@ -325,7 +326,12 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
> >         }
> >         if (pagevec_count(&pvec))
> >                 check_release_pagevec(&pvec);
> > -       obj->mm.dirty = false;
> > +
> > +       /* See the comment in shmem_object_init() for why we need this */
> > +       if (IS_JSL_EHL(i915) && obj->flags & I915_BO_ALLOC_USER)
> > +               obj->mm.dirty = true;
> > +       else
> > +               obj->mm.dirty = false;
> >
> >         sg_free_table(pages);
> >         kfree(pages);
> > @@ -539,6 +545,25 @@ static int shmem_object_init(struct intel_memory_region *mem,
> >
> >         i915_gem_object_set_cache_coherency(obj, cache_level);
> >
> > +       /*
> > +        * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
> > +        * possible for userspace to bypass the GTT caching bits set by the
> > +        * kernel, as per the given object cache_level. This is troublesome
> > +        * since the heavy flush we apply when first gathering the pages is
> > +        * skipped if the kernel thinks the object is coherent with the GPU. As
> > +        * a result it might be possible to bypass the cache and read the
> > +        * contents of the page directly, which could be stale data. If it's
> > +        * just a case of userspace shooting themselves in the foot then so be
> > +        * it, but since i915 takes the stance of always zeroing memory before
> > +        * handing it to userspace, we need to prevent this.
> > +        *
> > +        * By setting cache_dirty here we make the clflush when first acquiring
> > +        * the pages unconditional on such platforms. We also set this again in
> > +        * put_pages().
> > +        */
> > +       if (IS_JSL_EHL(i915) && flags & I915_BO_ALLOC_USER)
> > +               obj->cache_dirty = true;
>
> I don't think this is enough, because every time we drop our pages
> shmem could move them around or swap them out, and we get fresh ones.
> So we need to re-force this every time we grab new pages.

We also rearm this in put_pages(), or at least we do in v2, so if the
pages are swapped out or whatever it should then flush them again when
we re-acquire the pages.

>
> Also there's already a pile of other cases (well not WB coherency
> mode) where userspace can be clever and bypass the coherency if we
> don't clflush first. I think it'd be really good to have all that in
> one places as much as possible.
>
> Finally this is extremely tricky code, and obj->cache_dirty and
> related stuff isn't really documented. kerneldoc for all that would be
> really good.

Ok, I'll take a look.

> -Daniel
>
> > +
> >         i915_gem_object_init_memory_region(obj, mem);
> >
> >         return 0;
> > --
> > 2.26.3
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
