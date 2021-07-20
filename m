Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D883D043E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1556E573;
	Tue, 20 Jul 2021 22:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC54C6E575
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 22:07:02 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id a16so568206ybt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nf5fJ4NM1G4kYJu2OvaEjjoSryHta6nu5v5fYiErDFI=;
 b=fyO1U8fmjdQ9bkRcWmubVc9zETqsWC45AfCC5PLMW5Tjy/JsBDWaef/4F0voTp5UU2
 JSwluYjNH3jlpQm0sZioV0rx3HCcu4he2ody/kVvM/g782qbzJJvayRwbu02Udbhx1dm
 gs/y5uFNPtZ7wvTM/4lnUIy95EG9pRshITT97h6q12SeQE8k621CaMtoclPZeNdy1Nyo
 Syl04ZHRGkb0ss8rGXbKRM4KSPXyrJ7uXYGlKvWgIlMGPeiRT2WHtuoLHhaQkzeEvN86
 k+2/5Bi2XBbUvwI4SYNIhs9tJxvQ2VXp18guc3a0vYYYtfYyuKl2XEtM4A6SxvOYIsyN
 moWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nf5fJ4NM1G4kYJu2OvaEjjoSryHta6nu5v5fYiErDFI=;
 b=EUAU+LbFFYl7e94fJsTRODtaCSGl3Y7Rmws1Dl1i66CQeCd/fx/woIfO6e86S6d6zO
 yFbMMOHHoP89Y7cFDLePknexTb/bgZ8aP9LSqZQ/hDPi9KtV3dR4ErdDMDftiWUXaCBw
 zplKLaH3CthC7qtv1416G5GlB8rP9VQoFYaSGUucTOi+6P0JTfCVm1dyYGmU9YCKaab+
 ZNVIFJJ85ifNTvL15jXM4WdCZyT+k1k2hmO46kx9dEaJbDAKfU6e82MZt4nDxlSkjlmx
 yBJCudhrPk9m53+keTEpoyc68lXi0HPbWwegDyJ1BUg4lapIpY1A21H69ZmH79Hxznr/
 XkUg==
X-Gm-Message-State: AOAM531lkggnP3HLLjkgYGOYp7PKBlV2TA42tg2ajp4WcCsFUAFqy8C4
 qrlu5CR07vWjvhPLWdvjhhy5dS0cJ2azXyVWGKAI5w==
X-Google-Smtp-Source: ABdhPJy2rX1yEo2kUPy5bBoVuTicVd0zt3LPdFzFRT7dX9VHSQKnXLkKGJgeTDVBwfNVmEKzKyeYzAx+/jp7/soh30Q=
X-Received: by 2002:a25:d3c1:: with SMTP id
 e184mr41729161ybf.139.1626818821926; 
 Tue, 20 Jul 2021 15:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-3-jason@jlekstrand.net>
 <CAM0jSHME+vRSDpTPAO74Z+xwjofZB4i1pbFH2Yvn+eeGYL-aqA@mail.gmail.com>
In-Reply-To: <CAM0jSHME+vRSDpTPAO74Z+xwjofZB4i1pbFH2Yvn+eeGYL-aqA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 20 Jul 2021 17:06:50 -0500
Message-ID: <CAOFGe97RoL1+L+i5Qgoipnv=ta8isPiAWYhfYncF1KYBX+8t9g@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/i915/gem: Refactor placement setup for
 i915_gem_object_create* (v2)
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 3:18 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > Since we don't allow changing the set of regions after creation, we can
> > make ext_set_placements() build up the region set directly in the
> > create_ext and assign it to the object later.  This is similar to what
> > we did for contexts with the proto-context only simpler because there's
> > no funny object shuffling.  This will be used in the next patch to allow
> > us to de-duplicate a bunch of code.  Also, since we know the maximum
> > number of regions up-front, we can use a fixed-size temporary array for
> > the regions.  This simplifies memory management a bit for this new
> > delayed approach.
> >
> > v2 (Matthew Auld):
> >  - Get rid of MAX_N_PLACEMENTS
> >  - Drop kfree(placements) from set_placements()
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_create.c | 81 ++++++++++++----------
> >  1 file changed, 45 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > index 51f92e4b1a69d..5766749a449c0 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > @@ -27,10 +27,13 @@ static u32 object_max_page_size(struct drm_i915_gem_object *obj)
> >         return max_page_size;
> >  }
> >
> > -static void object_set_placements(struct drm_i915_gem_object *obj,
> > -                                 struct intel_memory_region **placements,
> > -                                 unsigned int n_placements)
> > +static int object_set_placements(struct drm_i915_gem_object *obj,
> > +                                struct intel_memory_region **placements,
> > +                                unsigned int n_placements)
> >  {
> > +       struct intel_memory_region **arr;
> > +       unsigned int i;
> > +
> >         GEM_BUG_ON(!n_placements);
> >
> >         /*
> > @@ -44,9 +47,20 @@ static void object_set_placements(struct drm_i915_gem_object *obj,
> >                 obj->mm.placements = &i915->mm.regions[mr->id];
> >                 obj->mm.n_placements = 1;
> >         } else {
> > -               obj->mm.placements = placements;
> > +               arr = kmalloc_array(n_placements,
> > +                                   sizeof(struct intel_memory_region *),
> > +                                   GFP_KERNEL);
> > +               if (!arr)
> > +                       return -ENOMEM;
> > +
> > +               for (i = 0; i < n_placements; i++)
> > +                       arr[i] = placements[i];
> > +
> > +               obj->mm.placements = arr;
> >                 obj->mm.n_placements = n_placements;
> >         }
> > +
> > +       return 0;
> >  }
> >
> >  static int i915_gem_publish(struct drm_i915_gem_object *obj,
> > @@ -148,7 +162,9 @@ i915_gem_dumb_create(struct drm_file *file,
> >                 return -ENOMEM;
> >
> >         mr = intel_memory_region_by_type(to_i915(dev), mem_type);
> > -       object_set_placements(obj, &mr, 1);
> > +       ret = object_set_placements(obj, &mr, 1);
> > +       if (ret)
> > +               goto object_free;
> >
> >         ret = i915_gem_setup(obj, args->size);
> >         if (ret)
> > @@ -184,7 +200,9 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
> >                 return -ENOMEM;
> >
> >         mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
> > -       object_set_placements(obj, &mr, 1);
> > +       ret = object_set_placements(obj, &mr, 1);
> > +       if (ret)
> > +               goto object_free;
> >
> >         ret = i915_gem_setup(obj, args->size);
> >         if (ret)
> > @@ -199,7 +217,8 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
> >
> >  struct create_ext {
> >         struct drm_i915_private *i915;
> > -       struct drm_i915_gem_object *vanilla_object;
> > +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> > +       unsigned int n_placements;
> >  };
> >
> >  static void repr_placements(char *buf, size_t size,
> > @@ -230,8 +249,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> >         struct drm_i915_private *i915 = ext_data->i915;
> >         struct drm_i915_gem_memory_class_instance __user *uregions =
> >                 u64_to_user_ptr(args->regions);
> > -       struct drm_i915_gem_object *obj = ext_data->vanilla_object;
> > -       struct intel_memory_region **placements;
> > +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> >         u32 mask;
> >         int i, ret = 0;
> >
> > @@ -245,6 +263,8 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> >                 ret = -EINVAL;
> >         }
> >
> > +       BUILD_BUG_ON(ARRAY_SIZE(i915->mm.regions) != ARRAY_SIZE(placements));
> > +       BUILD_BUG_ON(ARRAY_SIZE(ext_data->placements) != ARRAY_SIZE(placements));
> >         if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
> >                 drm_dbg(&i915->drm, "num_regions is too large\n");
> >                 ret = -EINVAL;
> > @@ -253,21 +273,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> >         if (ret)
> >                 return ret;
> >
> > -       placements = kmalloc_array(args->num_regions,
> > -                                  sizeof(struct intel_memory_region *),
> > -                                  GFP_KERNEL);
> > -       if (!placements)
> > -               return -ENOMEM;
> > -
> >         mask = 0;
> >         for (i = 0; i < args->num_regions; i++) {
> >                 struct drm_i915_gem_memory_class_instance region;
> >                 struct intel_memory_region *mr;
> >
> > -               if (copy_from_user(&region, uregions, sizeof(region))) {
> > -                       ret = -EFAULT;
> > -                       goto out_free;
> > -               }
> > +               if (copy_from_user(&region, uregions, sizeof(region)))
> > +                       return -EFAULT;
> >
> >                 mr = intel_memory_region_lookup(i915,
> >                                                 region.memory_class,
> > @@ -293,14 +305,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> >                 ++uregions;
> >         }
> >
> > -       if (obj->mm.placements) {
> > +       if (ext_data->n_placements) {
> >                 ret = -EINVAL;
> >                 goto out_dump;
> >         }
> >
> > -       object_set_placements(obj, placements, args->num_regions);
> > -       if (args->num_regions == 1)
> > -               kfree(placements);
> > +       for (i = 0; i < args->num_regions; i++)
> > +               ext_data->placements[i] = placements[i];
>
> I guess here we forget to set the ext_data->n_placements, which would
> explain the CI failure.

What CI failure are you referring to?
