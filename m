Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D695F3D54EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 10:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2566E849;
	Mon, 26 Jul 2021 08:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7876E845;
 Mon, 26 Jul 2021 08:10:38 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id f22so7975284qke.10;
 Mon, 26 Jul 2021 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M2QXdMfgRz705RoCTb41lZT+4JPwzBLszxtkLZVS9Co=;
 b=Bmh0W2GyIombTeEzJokJfUcbOelFFJME7oOncnNJICjvwPJwZFNm3RBa6qmcAFQjoA
 rz2jJ7Vf/8wmALwNLnZ4D9NRI7pXvSDLd2nS+xKdQPhrD4LINbvuB/ETIpN1uNNL+lYk
 /zjGMaG+9kVNyuAUscnSjZ/0VxBv3L8N4DpycRYnW4Tvs6C4aYoV2SDMqifPzRK1yYhu
 vXETi5UgISIBmE5lIjsZ68IjTTyQJSovLPSJ1Tk+S5P9CEkad5rPMT2nGlNywYoo4+gd
 lJqm5BZSWAtgaZ2+AH/614BabOU8ZaI2rwS0rjBkT2ntPEwxq6AD9jBirLX5jYtA4NZ5
 9I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M2QXdMfgRz705RoCTb41lZT+4JPwzBLszxtkLZVS9Co=;
 b=AGcYNpqb2mp58WHsSUPnJASNxeZPUXq6+f0oZz3PbCbv6XMAcrYi/QuNyRf7Gf81un
 D7lQCReIY1GhLSO8KhKmJkCT6uP75V0vzh0TxZdR76duEXxbOoz3zt790vWz6CNVSEBa
 EXPJOKkdX/A8JwgB6pMscHMTZfBKxaHD4/sRKPGR1d/VXK58SIPnwrPptC+jM9QjRkzO
 CBmTLqXk/fkMArhQJEna0zpqj+fOzmGgxuxNP7YaauuKsXp/ZW0rt2wiVY+FjHcV4klp
 8SKcQfuTPlRd0cTbXFAp43PKV1uuiMol7wmv5/0j4AbNISvL773auThFH5jvad5VcFPc
 zQOg==
X-Gm-Message-State: AOAM533wqtTJR3jfJKUkQJxhUy/BY4JTf2x5rJxU4+d5c1Irdc6RSQa7
 qHNCLPoMDwwDsE3ftdZUuqka4yZUbEzVdFvq0e4=
X-Google-Smtp-Source: ABdhPJwWm33EZkK2B9khF2c55g5AHc14tnGCf9QkK8TmqHxnuot5WrEon9mYjvF56JG5LKTOoq9ivoxiIU3+HWGrd2Q=
X-Received: by 2002:a05:620a:b1b:: with SMTP id
 t27mr15942119qkg.460.1627287038063; 
 Mon, 26 Jul 2021 01:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <20210723172142.3273510-7-jason@jlekstrand.net>
In-Reply-To: <20210723172142.3273510-7-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 26 Jul 2021 09:10:12 +0100
Message-ID: <CAM0jSHMTfjCns3uG=LsJZRuz8eTaJRL2D7MSNG5mTmh3s=C1DA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 6/8] drm/i915/gem: Always call
 obj->ops->migrate unless can_migrate fails
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

On Fri, 23 Jul 2021 at 18:22, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Without TTM, we have no such hook so we exit early but this is fine
> because we use TTM on all LMEM platforms and, on integrated platforms,
> there is no real migration.  If we do have the hook, it's better to just
> let TTM handle the migration because it knows where things are actually
> placed.
>
> This fixes a bug where i915_gem_object_migrate fails to migrate newly
> created LMEM objects.  In that scenario, the object has obj->mm.region
> set to LMEM but TTM has it in SMEM because that's where all new objects
> are placed there prior to getting actual pages.  When we invoke
> i915_gem_object_migrate, it exits early because, from the point of view
> of the GEM object, it's already in LMEM and no migration is needed.
> Then, when we try to pin the pages, __i915_ttm_get_pages is called
> which, unaware of our failed attempt at a migration, places the object
> in SMEM.  This only happens on newly created objects because they have
> this weird state where TTM thinks they're in SMEM, GEM thinks they're in
> LMEM, and the reality is that they don't exist at all.
>
> It's better if GEM just always calls into TTM and let's TTM handle
> things.  That way the lies stay better contained.  Once the migration is
> complete, the object will have pages, obj->mm.region will be correct,
> and we're done lying.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Thanks for fixing this,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index d09bd9bdb38ac..9d3497e1235a0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -607,12 +607,15 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
>         mr = i915->mm.regions[id];
>         GEM_BUG_ON(!mr);
>
> -       if (obj->mm.region == mr)
> -               return 0;
> -
>         if (!i915_gem_object_can_migrate(obj, id))
>                 return -EINVAL;
>
> +       if (!obj->ops->migrate) {
> +               if (GEM_WARN_ON(obj->mm.region != mr))
> +                       return -EINVAL;
> +               return 0;
> +       }
> +
>         return obj->ops->migrate(obj, mr);
>  }
>
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
