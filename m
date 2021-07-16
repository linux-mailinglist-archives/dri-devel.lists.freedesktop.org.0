Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266623CB816
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 15:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD646E97E;
	Fri, 16 Jul 2021 13:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3546E97E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 13:52:12 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id r132so14974835yba.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wIp35/PBXnMiRRgyQR6IV+dBlBTg1W+8SzDs6b2zxeA=;
 b=RW+ll6BcnT2b9ZVtaFD5j7ATmjXgEcgzrq78KKmTGDmhXiC2pm+awiBMF69KVoDE3H
 UIh0bjmpGJ6NcBPjgEsPYy209JHKKX5TqiTlNLS7cuCFoaeAIzcFKkcmyVYmSaBydT/O
 cBVqXDk4eVOY5a+M+Z99/QDSKKNyEN9dKkoUzyDKuWPBEuon84W5LCmJ2QBah+NbL+Aa
 bpJAyfcJHBd/NWVSfGlWIho7ZAOZnS0c1tFp45J333ClnrVNJED8JuLsEyecYynSdVk3
 HC69/T9ablCrHFFmnoCG3cLQirwL4Dqe0kH3gCaGxDmaTZqHTtl0Z/glA9bxVL0x6HIT
 e5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wIp35/PBXnMiRRgyQR6IV+dBlBTg1W+8SzDs6b2zxeA=;
 b=O/lfT3VBC4Ml/oICz6K5SjUiuh43aWhnARBxoAqMjPHKdLAPuDXYoYQYpWa83ec/0M
 Y81Ya6XIJ/iRuyMNfgtGt1+5CxxjU87S0ASV4nAd2m5kir9ypROXJ3gh0FJLlA4SG0ha
 tPRt46j9bbqwWZdob+53H/TV58EwLBZEhYi+P9eKVUwU2sDg5c1kk7cDZt8ADj6zLoNF
 KEWq640qzkEl+hcTyeTcfS/EEg8wGBVfK/F3tDxEfH0Qo02jBNA4th73GE0AFDTrcRUU
 Y7KRG0nUF9OB1ctpr7WvtK+U72sgrVyfs6+ula/7F1IZ2fBfJD4MOaLO/1dV7I3OrzhZ
 FBkQ==
X-Gm-Message-State: AOAM530t0Wxig/fBjhQhbsmH7tR9ejD6qHQdwazMWSIpGNTaBTwSsXFA
 nfstrFG0MzOu4th3U6T5ePXv90GTZqIXDKITSbQdoA==
X-Google-Smtp-Source: ABdhPJzZiTYdzR9R88d4hO5ehdQOba9EgcIA/KAqSRZ4TvhLxa5PC5L/PmKR08m6W4rPSzx8Xe/5YfL/ia2+F2jamTA=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr13182074ybi.241.1626443531775; 
 Fri, 16 Jul 2021 06:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-3-jason@jlekstrand.net>
 <CAM0jSHO0Pauw157x5CRTvNitsurPUu-k_8VcVyzrJ9Q=UBY4dw@mail.gmail.com>
In-Reply-To: <CAM0jSHO0Pauw157x5CRTvNitsurPUu-k_8VcVyzrJ9Q=UBY4dw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 16 Jul 2021 08:52:01 -0500
Message-ID: <CAOFGe96=XqYfed3nEbm2ZG-NtXLwEGVohJ+0zWozNxzpWdtHug@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/gem: Refactor placement setup
 for i915_gem_object_create*
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 6:12 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
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
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> I think the plan was to have each extension directly hang/apply their
> state on the vanilla/proto object, or at least that was the idea
> behind: 357814f878f9 ("drm/i915: rework gem_create flow for upcoming
> extensions"). A previous version looked similar to this IIRC.

Right.  In my mind, struct create_extis that proto-obj, more-or-less.
If we wanted to codify that somehow, we could rename it
i915_gem_object_create_params and make _create_user take one instead
of separate parameters.  With only having three right now, it didn't
seem necessary to go that far.

> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_create.c | 75 +++++++++++++---------
> >  1 file changed, 45 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > index 51f92e4b1a69d..391c8c4a12172 100644
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
> > @@ -197,9 +215,12 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
> >         return ret;
> >  }
> >
> > +#define MAX_N_PLACEMENTS = (INTEL_REGION_UNKNOWN + 1)
>
> Unused?

Yup.  Left-over from an earlier version.  Dropped.

> > +
> >  struct create_ext {
> >         struct drm_i915_private *i915;
> > -       struct drm_i915_gem_object *vanilla_object;
> > +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> > +       unsigned int n_placements;
> >  };
> >
> >  static void repr_placements(char *buf, size_t size,
> > @@ -230,8 +251,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> >         struct drm_i915_private *i915 = ext_data->i915;
> >         struct drm_i915_gem_memory_class_instance __user *uregions =
> >                 u64_to_user_ptr(args->regions);
> > -       struct drm_i915_gem_object *obj = ext_data->vanilla_object;
> > -       struct intel_memory_region **placements;
> > +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> >         u32 mask;
> >         int i, ret = 0;
> >
> > @@ -245,6 +265,8 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> >                 ret = -EINVAL;
> >         }
> >
> > +       BUILD_BUG_ON(ARRAY_SIZE(i915->mm.regions) != ARRAY_SIZE(placements));
> > +       BUILD_BUG_ON(ARRAY_SIZE(ext_data->placements) != ARRAY_SIZE(placements));
> >         if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
> >                 drm_dbg(&i915->drm, "num_regions is too large\n");
> >                 ret = -EINVAL;
> > @@ -253,12 +275,6 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
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
> > @@ -293,14 +309,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
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
> kfree(placements) is still in the error unwind?

Yup.  Fixed.  Thanks!

--Jason
