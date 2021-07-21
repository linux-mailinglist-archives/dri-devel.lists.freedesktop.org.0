Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9403D0A80
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 10:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8BC6E916;
	Wed, 21 Jul 2021 08:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EAB6E916;
 Wed, 21 Jul 2021 08:32:15 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id o9so559589qvu.5;
 Wed, 21 Jul 2021 01:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SNsVoTi33ntWSldj4skGgRfv8OpN1MHrMtXlRrxkjWg=;
 b=C96TOJswETkFJ0ABqSUbGbcPsGjvjAMu+SioQG87gQfuWogH1/WwPJp0ZXvcs365sg
 SFMNXqIhCCg+xybbRLx1guqs1Obcp/JFR8OGYpvKjYsHdlexRIYqiQwppBens6BggTuC
 fKLNKgOIpe6ALhoik4Ws1KrzX1Fw4pUDM88Oy+TkhPq13+APDiVMcpCHLkoVdhRA1dO4
 YPug3kt7QzMLEJ8G8VYzrmCjouy0JVvabTlK8H1EcuJ/dHQa3M7Ka6vauDuT/Kne7lN2
 IMSewMwKfdoGfNn3k7B9oqOx6IBnh8NP7/399Jtu7AbmbRaUuyhXewv1Dp+d8H6DRHlu
 WoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SNsVoTi33ntWSldj4skGgRfv8OpN1MHrMtXlRrxkjWg=;
 b=JSRcct9JjpD14nSMiAS1BWSljxW2uhrCoR1msdN8n2AC/CxTY/au80dr20KoNlOSnD
 soWuvTmpaADWZeHJ8p9Wo0RQzpqHWOYAEuvA+jUimHqpetJ5vef0WsOQ9GYLieUNC4++
 JhzLv5mULMQIjs491/CBDqlITbf/3/iYEfrJeT/InIGSBLsHtWwJkE+KWm9D5PRB+WEy
 b3oQgVvqoS3t2jdpdxiXnK9FPHcbdddB05kL75fwBzQaeyZInaPUyg9Ev4L540a/p18O
 GQo1JbPa8Htkkdzb6Dg9Unm4k74T8RHdLyUSkTA2+L126Rxu+DzlpVEQd+Nnz+7P4TPS
 bEZw==
X-Gm-Message-State: AOAM531Ym0zPXfOI5JgO+pc2ttJJQaA+ZLh2K5omywYHZiTwbQhHjN8F
 71gENbUi//2v4hZ+1T8DZdYEKW1/cFUUb9bY1YKCwRatrmuGvQ==
X-Google-Smtp-Source: ABdhPJz5c4hGZbdt2dz9GvozxXV/ZG3SrYtw0c/JSNlKJryJkMpewWu2ZqsK2mZ7vkiAzO/Qbb+k//ua0ZiORlClXMQ=
X-Received: by 2002:a0c:e54e:: with SMTP id n14mr34883079qvm.41.1626856335010; 
 Wed, 21 Jul 2021 01:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-3-jason@jlekstrand.net>
 <CAM0jSHME+vRSDpTPAO74Z+xwjofZB4i1pbFH2Yvn+eeGYL-aqA@mail.gmail.com>
 <CAOFGe97RoL1+L+i5Qgoipnv=ta8isPiAWYhfYncF1KYBX+8t9g@mail.gmail.com>
In-Reply-To: <CAOFGe97RoL1+L+i5Qgoipnv=ta8isPiAWYhfYncF1KYBX+8t9g@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 21 Jul 2021 09:31:48 +0100
Message-ID: <CAM0jSHM6LNLbEQNS3EQmMU6-1XsiopZtUxmGEokzrcHn5SsfmQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/i915/gem: Refactor placement setup for
 i915_gem_object_create* (v2)
To: Jason Ekstrand <jason@jlekstrand.net>
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

On Tue, 20 Jul 2021 at 23:07, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, Jul 19, 2021 at 3:18 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >
> > > Since we don't allow changing the set of regions after creation, we can
> > > make ext_set_placements() build up the region set directly in the
> > > create_ext and assign it to the object later.  This is similar to what
> > > we did for contexts with the proto-context only simpler because there's
> > > no funny object shuffling.  This will be used in the next patch to allow
> > > us to de-duplicate a bunch of code.  Also, since we know the maximum
> > > number of regions up-front, we can use a fixed-size temporary array for
> > > the regions.  This simplifies memory management a bit for this new
> > > delayed approach.
> > >
> > > v2 (Matthew Auld):
> > >  - Get rid of MAX_N_PLACEMENTS
> > >  - Drop kfree(placements) from set_placements()
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_create.c | 81 ++++++++++++----------
> > >  1 file changed, 45 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > index 51f92e4b1a69d..5766749a449c0 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > @@ -27,10 +27,13 @@ static u32 object_max_page_size(struct drm_i915_gem_object *obj)
> > >         return max_page_size;
> > >  }
> > >
> > > -static void object_set_placements(struct drm_i915_gem_object *obj,
> > > -                                 struct intel_memory_region **placements,
> > > -                                 unsigned int n_placements)
> > > +static int object_set_placements(struct drm_i915_gem_object *obj,
> > > +                                struct intel_memory_region **placements,
> > > +                                unsigned int n_placements)
> > >  {
> > > +       struct intel_memory_region **arr;
> > > +       unsigned int i;
> > > +
> > >         GEM_BUG_ON(!n_placements);
> > >
> > >         /*
> > > @@ -44,9 +47,20 @@ static void object_set_placements(struct drm_i915_gem_object *obj,
> > >                 obj->mm.placements = &i915->mm.regions[mr->id];
> > >                 obj->mm.n_placements = 1;
> > >         } else {
> > > -               obj->mm.placements = placements;
> > > +               arr = kmalloc_array(n_placements,
> > > +                                   sizeof(struct intel_memory_region *),
> > > +                                   GFP_KERNEL);
> > > +               if (!arr)
> > > +                       return -ENOMEM;
> > > +
> > > +               for (i = 0; i < n_placements; i++)
> > > +                       arr[i] = placements[i];
> > > +
> > > +               obj->mm.placements = arr;
> > >                 obj->mm.n_placements = n_placements;
> > >         }
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  static int i915_gem_publish(struct drm_i915_gem_object *obj,
> > > @@ -148,7 +162,9 @@ i915_gem_dumb_create(struct drm_file *file,
> > >                 return -ENOMEM;
> > >
> > >         mr = intel_memory_region_by_type(to_i915(dev), mem_type);
> > > -       object_set_placements(obj, &mr, 1);
> > > +       ret = object_set_placements(obj, &mr, 1);
> > > +       if (ret)
> > > +               goto object_free;
> > >
> > >         ret = i915_gem_setup(obj, args->size);
> > >         if (ret)
> > > @@ -184,7 +200,9 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
> > >                 return -ENOMEM;
> > >
> > >         mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
> > > -       object_set_placements(obj, &mr, 1);
> > > +       ret = object_set_placements(obj, &mr, 1);
> > > +       if (ret)
> > > +               goto object_free;
> > >
> > >         ret = i915_gem_setup(obj, args->size);
> > >         if (ret)
> > > @@ -199,7 +217,8 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
> > >
> > >  struct create_ext {
> > >         struct drm_i915_private *i915;
> > > -       struct drm_i915_gem_object *vanilla_object;
> > > +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> > > +       unsigned int n_placements;
> > >  };
> > >
> > >  static void repr_placements(char *buf, size_t size,
> > > @@ -230,8 +249,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> > >         struct drm_i915_private *i915 = ext_data->i915;
> > >         struct drm_i915_gem_memory_class_instance __user *uregions =
> > >                 u64_to_user_ptr(args->regions);
> > > -       struct drm_i915_gem_object *obj = ext_data->vanilla_object;
> > > -       struct intel_memory_region **placements;
> > > +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> > >         u32 mask;
> > >         int i, ret = 0;
> > >
> > > @@ -245,6 +263,8 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> > >                 ret = -EINVAL;
> > >         }
> > >
> > > +       BUILD_BUG_ON(ARRAY_SIZE(i915->mm.regions) != ARRAY_SIZE(placements));
> > > +       BUILD_BUG_ON(ARRAY_SIZE(ext_data->placements) != ARRAY_SIZE(placements));
> > >         if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
> > >                 drm_dbg(&i915->drm, "num_regions is too large\n");
> > >                 ret = -EINVAL;
> > > @@ -253,21 +273,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> > >         if (ret)
> > >                 return ret;
> > >
> > > -       placements = kmalloc_array(args->num_regions,
> > > -                                  sizeof(struct intel_memory_region *),
> > > -                                  GFP_KERNEL);
> > > -       if (!placements)
> > > -               return -ENOMEM;
> > > -
> > >         mask = 0;
> > >         for (i = 0; i < args->num_regions; i++) {
> > >                 struct drm_i915_gem_memory_class_instance region;
> > >                 struct intel_memory_region *mr;
> > >
> > > -               if (copy_from_user(&region, uregions, sizeof(region))) {
> > > -                       ret = -EFAULT;
> > > -                       goto out_free;
> > > -               }
> > > +               if (copy_from_user(&region, uregions, sizeof(region)))
> > > +                       return -EFAULT;
> > >
> > >                 mr = intel_memory_region_lookup(i915,
> > >                                                 region.memory_class,
> > > @@ -293,14 +305,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
> > >                 ++uregions;
> > >         }
> > >
> > > -       if (obj->mm.placements) {
> > > +       if (ext_data->n_placements) {
> > >                 ret = -EINVAL;
> > >                 goto out_dump;
> > >         }
> > >
> > > -       object_set_placements(obj, placements, args->num_regions);
> > > -       if (args->num_regions == 1)
> > > -               kfree(placements);
> > > +       for (i = 0; i < args->num_regions; i++)
> > > +               ext_data->placements[i] = placements[i];
> >
> > I guess here we forget to set the ext_data->n_placements, which would
> > explain the CI failure.
>
> What CI failure are you referring to?

Pre-merge results for this series:

igt@gem_create@create-ext-placement-sanity-check:

shard-skl: PASS -> FAIL +1 similar issue
shard-apl: NOTRUN -> FAIL
shard-glk: PASS -> FAIL
shard-iclb: PASS -> FAIL
shard-kbl: PASS -> FAIL
shard-tglb: NOTRUN -> FAIL
