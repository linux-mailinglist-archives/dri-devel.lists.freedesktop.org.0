Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E23CB80A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 15:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB96E986;
	Fri, 16 Jul 2021 13:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DB06E986
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 13:46:35 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id x192so14922534ybe.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NiIsFPTYk8lsZDMHZvx0abLXOLT+nLIoyG/QYfrHdRg=;
 b=EB1jb0zcasugoYMCXkeeIAtpAGgGdehCXCDI3sVjIme/6jB2XotC4HYmRTjqBFMWfx
 GWVS9J3dLwXX26A3sKzs3JkwZN5oV4Q3lujSrRLCcJ87Raqd5p+MB4bUnfHvHSomKMXL
 X7ZbBbBGa5sk9mcckiGoz9WG8NMKbypQYeBo6iPAPqs9bPk3aQBhSkmsghWkbTOFUwgD
 exKWanC5u6+sj8sjiGoVveFikU844GPvzLscbK/WCTAI7gNfv9DQUMixp9waUjb8TAic
 VpWnX1bzc5qbvxdSdRlUE9F8dsZgMq+C9kyPFQTiSXlBG2TL/Rdq47TaDtroK0WcIsEc
 Gb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NiIsFPTYk8lsZDMHZvx0abLXOLT+nLIoyG/QYfrHdRg=;
 b=kUaQA7AHgvvrbnbqsLKT2glTjsn+Pk7Tp7mo8gSiQfem6EMJLJ0DCcOp8bTqtTMaAM
 S9YL3dnXEFFU57QhgmQs9v0zRJw8yptcW2sD6U2bLALmXS7yo/mqL1N3vzFIRkgAX40/
 BJAeVSIueRk0yvsfbCy0WvUGV/BPbLvpt5mQA6Ma7m6q0EKSr9wPEJ5Sxj9+tZdOqsGh
 stIMa8EKkjm0ANYf5XfKcqzleWhmHzVfrHM2Incttoh7f47ykJwKRZAH54vs3hcCr34n
 9QnEMZhQh4xZvgEuQ3m+MX0QfAEWOWmBARWh0/vLa6DFTnZgpwoEYzvqDOcGNkiyFVCw
 LC/w==
X-Gm-Message-State: AOAM532WnatuKN1m8Mc2H+Wd1UZrw1kcCTSwlM632WpTcWi0b6uFxd9o
 RYnFAjsIzRsBP9nvNNT8ZuEZdipmRebVGtl8BShywg==
X-Google-Smtp-Source: ABdhPJzNI0YEXkprbkQiMCzCDFtf2MxFyTlu+ghPmq93S4KQwR56XZVSgnGoosKHHDzfC4yN1NynqIvAb7rUJwMre1c=
X-Received: by 2002:a25:d3c1:: with SMTP id
 e184mr13076274ybf.139.1626443194125; 
 Fri, 16 Jul 2021 06:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-5-jason@jlekstrand.net>
 <CAM0jSHN3kwyTuz=j4DAuBr0WxcB5-XyeGiPapDe8XS80jGpJ_g@mail.gmail.com>
In-Reply-To: <CAM0jSHN3kwyTuz=j4DAuBr0WxcB5-XyeGiPapDe8XS80jGpJ_g@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 16 Jul 2021 08:46:23 -0500
Message-ID: <CAOFGe9566FrvwkE3LkY-8RYmheHbcbA2-Yt4KZt928WdJ837Lw@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/i915/gem/ttm: Place new BOs in the requested
 region
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 8:18 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> >
> > __i915_gem_ttm_object_init() was ignoring the placement requests coming
> > from the client and always placing all BOs in SMEM upon creation.
> > Instead, compute the requested placement set from the object and pass
> > that into ttm_bo_init_reserved().
>
> AFAIK this is intentional, where we use SYS as a safe placeholder
> specifically for object creation, since that avoids allocating any
> actual pages. Later at get_pages() time we do the real allocation,
> where we need to consider the placements.
>
> If we set the real placements here, the ttm_bo_validate() call in
> init_reserved() might allocate the backing pages here for the
> lmem-only case, which is not what we want in i915.

I'm happy to drop this patch.  It doesn't actually fix anything AFAIK.
It makes the behavior more what I expected but my expectations are not
to be trusted here.

The other TTM patch does fix a real bug AFAIK.

--Jason


> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index 6589411396d3f..d30f274c329c7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -898,6 +898,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
> >  {
> >         static struct lock_class_key lock_class;
> >         struct drm_i915_private *i915 =3D mem->i915;
> > +       struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> > +       struct ttm_placement placement;
> >         struct ttm_operation_ctx ctx =3D {
> >                 .interruptible =3D true,
> >                 .no_wait_gpu =3D false,
> > @@ -919,6 +921,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
> >         /* Forcing the page size is kernel internal only */
> >         GEM_BUG_ON(page_size && obj->mm.n_placements);
> >
> > +       GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> > +       i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> > +
> >         /*
> >          * If this function fails, it will call the destructor, but
> >          * our caller still owns the object. So no freeing in the
> > @@ -927,8 +932,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
> >          * until successful initialization.
> >          */
> >         ret =3D ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj),=
 size,
> > -                                  bo_type, &i915_sys_placement,
> > -                                  page_size >> PAGE_SHIFT,
> > +                                  bo_type, &placement, page_size >> PA=
GE_SHIFT,
> >                                    &ctx, NULL, NULL, i915_ttm_bo_destro=
y);
> >         if (ret)
> >                 return i915_ttm_err_to_gem(ret);
> > --
> > 2.31.1
> >
