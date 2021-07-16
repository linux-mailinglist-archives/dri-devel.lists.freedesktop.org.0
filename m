Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8973CB695
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 13:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F276E961;
	Fri, 16 Jul 2021 11:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89C6E961;
 Fri, 16 Jul 2021 11:12:33 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id m3so8271841qkm.10;
 Fri, 16 Jul 2021 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JuxAdsinPI8+ReMKTxv8mLZoLxxtTywQEkEdnLgcNHE=;
 b=e0XfGkmr5InVgBkB6p6s5xe8A9HEQLt44dPJCxQvNEhV5j63N7PRDu+HKD180qSk3l
 QyulAMA1e+bdwAynKPZDN22AHb1t9DO0iMw5PMmXOs7JSrqFy2BsWW48VXiXEOHAzs3A
 n1+5oUhP0hV3LcuHPqZzCtkynQ42mcVkfXOQcwgtZmTg29lNjZ2I+heIvqO+pIKDkcXo
 5mdko/Jgp5eLaksW3lUt52plfU7Nbbecg8mm7iUNbZxTVoS4fcJIsBdV0rvByMX/+Dmx
 F8d7zqLlYNFnKH5TXyqmznvhUicdD8oafPEBwAhJDjRHfQp4cSHpt+nXcbLRESkVr8SW
 GgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JuxAdsinPI8+ReMKTxv8mLZoLxxtTywQEkEdnLgcNHE=;
 b=WRNSUDw9iHVSUbOnziHLzAdLryUwk0NzM79moR3c3A/XfsNUx5xYe3kJ3pd2PnqJNs
 zvFYI3Ab4k/6BJ3SLxc9SDEihqCa0QBArURfFyyqySSjKWiPCaVbW/X5BhRPHJChoK87
 GqcbsngW2wXl1lMUOHe0lnyZLMieWTbk3VueVGM0fv2jiPVWM/S8TGLne+QdPT34alxR
 EF30196919+2zrW1macunsc26teSJ1E5LnVyhox3M1rbYhTsqbeuASlEi+hiBH7BKJM2
 lh1Wj23PbCQdGX6rnkiTeMJSYloBDhnPu3SBGWOBhRkMZwoOAnHc9NX9L7ctuT4p36Mo
 y1TQ==
X-Gm-Message-State: AOAM532ALhXHvF9MfVOwc/bOYRSBBJnUamE7ZYG5x+4islv4vDYLCsc9
 S2o9P4cZkpZ4MUsB8O5CVMDVdGkpTDjAtmEdEUMgzZ/+cNc=
X-Google-Smtp-Source: ABdhPJzmcNSUMpsSPdejGXJCdtBB/qyJFYl9V/1qLEpcHIOj6CEfK+8Fw8pgC3exW3Q9UY22b/NJC8aGbecgGfPYmDU=
X-Received: by 2002:a37:5d5:: with SMTP id 204mr9294662qkf.17.1626433952397;
 Fri, 16 Jul 2021 04:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-3-jason@jlekstrand.net>
In-Reply-To: <20210715223900.1840576-3-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 12:12:03 +0100
Message-ID: <CAM0jSHO0Pauw157x5CRTvNitsurPUu-k_8VcVyzrJ9Q=UBY4dw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/gem: Refactor placement setup
 for i915_gem_object_create*
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Since we don't allow changing the set of regions after creation, we can
> make ext_set_placements() build up the region set directly in the
> create_ext and assign it to the object later.  This is similar to what
> we did for contexts with the proto-context only simpler because there's
> no funny object shuffling.  This will be used in the next patch to allow
> us to de-duplicate a bunch of code.  Also, since we know the maximum
> number of regions up-front, we can use a fixed-size temporary array for
> the regions.  This simplifies memory management a bit for this new
> delayed approach.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I think the plan was to have each extension directly hang/apply their
state on the vanilla/proto object, or at least that was the idea
behind: 357814f878f9 ("drm/i915: rework gem_create flow for upcoming
extensions"). A previous version looked similar to this IIRC.

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 75 +++++++++++++---------
>  1 file changed, 45 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 51f92e4b1a69d..391c8c4a12172 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -27,10 +27,13 @@ static u32 object_max_page_size(struct drm_i915_gem_object *obj)
>         return max_page_size;
>  }
>
> -static void object_set_placements(struct drm_i915_gem_object *obj,
> -                                 struct intel_memory_region **placements,
> -                                 unsigned int n_placements)
> +static int object_set_placements(struct drm_i915_gem_object *obj,
> +                                struct intel_memory_region **placements,
> +                                unsigned int n_placements)
>  {
> +       struct intel_memory_region **arr;
> +       unsigned int i;
> +
>         GEM_BUG_ON(!n_placements);
>
>         /*
> @@ -44,9 +47,20 @@ static void object_set_placements(struct drm_i915_gem_object *obj,
>                 obj->mm.placements = &i915->mm.regions[mr->id];
>                 obj->mm.n_placements = 1;
>         } else {
> -               obj->mm.placements = placements;
> +               arr = kmalloc_array(n_placements,
> +                                   sizeof(struct intel_memory_region *),
> +                                   GFP_KERNEL);
> +               if (!arr)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < n_placements; i++)
> +                       arr[i] = placements[i];
> +
> +               obj->mm.placements = arr;
>                 obj->mm.n_placements = n_placements;
>         }
> +
> +       return 0;
>  }
>
>  static int i915_gem_publish(struct drm_i915_gem_object *obj,
> @@ -148,7 +162,9 @@ i915_gem_dumb_create(struct drm_file *file,
>                 return -ENOMEM;
>
>         mr = intel_memory_region_by_type(to_i915(dev), mem_type);
> -       object_set_placements(obj, &mr, 1);
> +       ret = object_set_placements(obj, &mr, 1);
> +       if (ret)
> +               goto object_free;
>
>         ret = i915_gem_setup(obj, args->size);
>         if (ret)
> @@ -184,7 +200,9 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>                 return -ENOMEM;
>
>         mr = intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
> -       object_set_placements(obj, &mr, 1);
> +       ret = object_set_placements(obj, &mr, 1);
> +       if (ret)
> +               goto object_free;
>
>         ret = i915_gem_setup(obj, args->size);
>         if (ret)
> @@ -197,9 +215,12 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>         return ret;
>  }
>
> +#define MAX_N_PLACEMENTS = (INTEL_REGION_UNKNOWN + 1)

Unused?

> +
>  struct create_ext {
>         struct drm_i915_private *i915;
> -       struct drm_i915_gem_object *vanilla_object;
> +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
> +       unsigned int n_placements;
>  };
>
>  static void repr_placements(char *buf, size_t size,
> @@ -230,8 +251,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
>         struct drm_i915_private *i915 = ext_data->i915;
>         struct drm_i915_gem_memory_class_instance __user *uregions =
>                 u64_to_user_ptr(args->regions);
> -       struct drm_i915_gem_object *obj = ext_data->vanilla_object;
> -       struct intel_memory_region **placements;
> +       struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
>         u32 mask;
>         int i, ret = 0;
>
> @@ -245,6 +265,8 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
>                 ret = -EINVAL;
>         }
>
> +       BUILD_BUG_ON(ARRAY_SIZE(i915->mm.regions) != ARRAY_SIZE(placements));
> +       BUILD_BUG_ON(ARRAY_SIZE(ext_data->placements) != ARRAY_SIZE(placements));
>         if (args->num_regions > ARRAY_SIZE(i915->mm.regions)) {
>                 drm_dbg(&i915->drm, "num_regions is too large\n");
>                 ret = -EINVAL;
> @@ -253,12 +275,6 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
>         if (ret)
>                 return ret;
>
> -       placements = kmalloc_array(args->num_regions,
> -                                  sizeof(struct intel_memory_region *),
> -                                  GFP_KERNEL);
> -       if (!placements)
> -               return -ENOMEM;
> -
>         mask = 0;
>         for (i = 0; i < args->num_regions; i++) {
>                 struct drm_i915_gem_memory_class_instance region;
> @@ -293,14 +309,13 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
>                 ++uregions;
>         }
>
> -       if (obj->mm.placements) {
> +       if (ext_data->n_placements) {
>                 ret = -EINVAL;
>                 goto out_dump;
>         }
>
> -       object_set_placements(obj, placements, args->num_regions);
> -       if (args->num_regions == 1)
> -               kfree(placements);
> +       for (i = 0; i < args->num_regions; i++)
> +               ext_data->placements[i] = placements[i];

kfree(placements) is still in the error unwind?
