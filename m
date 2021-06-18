Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6AB3AC93A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 12:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310CE6E9E9;
	Fri, 18 Jun 2021 10:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9CD6E9E9;
 Fri, 18 Jun 2021 10:54:23 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id j184so9866899qkd.6;
 Fri, 18 Jun 2021 03:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3L64G0kZpQX4YOzIs8AaNkLWGlymR+LDLduTHLv/7oI=;
 b=LRT9Ni6IvWt1RFSE9GrGTjhQNb/7OzlS6XmLy0gsxkgAtXg1+D0DHYa3c6glBoWhEs
 pwS1lSSH/LUAaMXfjnqvHN0eAfUzIQo/Ervfr5DsT/GaCh97JPeuC8tp+W0FYOTwm17k
 JjWwLTXnsIHo0XAFbRVDaOSihOg/LcY54bPiHkxZ6ZvROZou/+kQupoHCvhHCEFXX5sx
 aEP791JIavQ/kIyC846J/y1bTba5T6KifkjpcGfgzhqFDrSH6CaayLtLmdr24c05Cwip
 0QGmeLKyUeUou0jrnBmhkeJ9+A0T5xtpCtF+KtnvTn56jZXZlcqob7xG/UDCNbkBzd71
 mIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3L64G0kZpQX4YOzIs8AaNkLWGlymR+LDLduTHLv/7oI=;
 b=bHbkgoo98M/zBeOObGF19gX2tJe8lxXlcfinL1+1K1M9xtZqJTW5Oquesb9b7++uDI
 SOC/oTiwmTlekJdqqWP33b4grsw6BUhZVzePaR3u4GOxa0qysZV8uXLYwpsZuquUS1UG
 tqA17JFQTWVa7VtG1YSgu7saxaqI3DeEl/AzM4dQyu5Y9bAMsaBm641eMk88n5yHnXGy
 w0XsELeumY6YHND/3Su1K6IA+YYw4H/9o1UnPAeiHrcNNFBHxlsEMaxSNWBC6+oFKpi5
 YGcrVXWhBto0BaPVn3xei2ry54QrQMn1OW0uDDuJRNzdPBCB/2qAHAw0FsS1dqc+YG9O
 O/NA==
X-Gm-Message-State: AOAM532Bo18iaLT2AcFGWWphHRnuntpRpRmWX+C+hdERmpdfvnqdBttl
 2MTBQq8s4NU0Ncigbm5X9Bv7fPuW4XSqli0xKMA=
X-Google-Smtp-Source: ABdhPJx/+fXCAkRo8jFKYAAprplG8ODTdsX5WjBSPjVHxSu+A3bwfoRtMhLAno/XhW50ewUfUeqGFYt1lePWxGfuVS8=
X-Received: by 2002:a05:620a:919:: with SMTP id
 v25mr8405704qkv.327.1624013662065; 
 Fri, 18 Jun 2021 03:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210618083117.158081-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210618083117.158081-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 18 Jun 2021 11:53:55 +0100
Message-ID: <CAM0jSHMLmWGfVQEZu9R__SGsAAjfPMSOHxgyXf8veYVxOOa8Mw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: Fix incorrect assumptions about
 ttm_bo_validate() semantics
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Jun 2021 at 09:31, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> We have assumed that if the current placement was not the requested
> placement, but instead one of the busy placements, a TTM move would have
> been triggered. That is not the case.
>
> So when we initially place LMEM objects in "Limbo", (that is system
> placement without any pages allocated), to be able to defer clearing
> objects until first get_pages(), the first get_pages() would happily keep
> objects in system memory if that is one of the allowed placements. And
> since we don't yet support i915 GEM system memory from TTM, everything
> breaks apart.
>
> So make sure we try the requested placement first, if no eviction is
> needed. If that fails, retry with all allowed placements also allowing
> evictions. Also make sure we handle TTM failure codes correctly.
>
> Also temporarily (until we support i915 GEM system on TTM), restrict
> allowed placements to the requested placement to avoid things falling
> apart should LMEM be full.
>
> Fixes: 38f28c0695c0 ("drm/i915/ttm: Calculate the object placement at get=
_pages time)
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 61 +++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index df46535cca47..4bb0440f693c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -64,6 +64,30 @@ static struct ttm_placement i915_sys_placement =3D {
>         .busy_placement =3D &sys_placement_flags,
>  };
>
> +static int i915_ttm_err_to_gem(int err)
> +{
> +       /* Fastpath */
> +       if (likely(!err))
> +               return 0;
> +
> +       switch (err) {
> +       case -EBUSY:
> +               /*
> +                * TTM likes to convert -EDEADLK to -EBUSY, and wants us =
to
> +                * restart the operation, since we don't record the conte=
nding
> +                * lock. We use -EAGAIN to restart.
> +                */
> +               return -EAGAIN;
> +       case -ENOSPC:
> +               /* Memory type / region is full, and we can't evict. */
> +               return -ENXIO;

ttm system will return -ENOMEM right?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +       default:
> +               break;
> +       }
> +
> +       return err;
> +}
> +
>  static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
>
>  static enum ttm_caching
> @@ -522,15 +546,46 @@ static int i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj)
>         struct sg_table *st;
>         struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
>         struct ttm_placement placement;
> +       int real_num_busy;
>         int ret;
>
>         GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
>
>         /* Move to the requested placement. */
>         i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> +
> +       /*
> +        * For now we support LMEM only with TTM.
> +        * TODO: Remove with system support
> +        */
> +       GEM_BUG_ON(requested.mem_type < I915_PL_LMEM0 ||
> +                  busy[0].mem_type < I915_PL_LMEM0);
> +
> +       /* First try only the requested placement. No eviction. */
> +       real_num_busy =3D fetch_and_zero(&placement.num_busy_placement);
>         ret =3D ttm_bo_validate(bo, &placement, &ctx);
> -       if (ret)
> -               return ret =3D=3D -ENOSPC ? -ENXIO : ret;
> +       if (ret) {
> +               ret =3D i915_ttm_err_to_gem(ret);
> +               /*
> +                * Anything that wants to restart the operation gets to
> +                * do that.
> +                */
> +               if (ret =3D=3D -EDEADLK || ret =3D=3D -EINTR || ret =3D=
=3D -ERESTARTSYS ||
> +                   ret =3D=3D -EAGAIN)
> +                       return ret;
> +
> +               /* TODO: Remove this when we support system as TTM. */
> +               real_num_busy =3D 1;
> +
> +               /*
> +                * If the initial attempt fails, allow all accepted place=
ments,
> +                * evicting if necessary.
> +                */
> +               placement.num_busy_placement =3D real_num_busy;
> +               ret =3D ttm_bo_validate(bo, &placement, &ctx);
> +               if (ret)
> +                       return i915_ttm_err_to_gem(ret);
> +       }
>
>         /* Object either has a page vector or is an iomem object */
>         st =3D bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io=
_st;
> @@ -741,5 +796,5 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>                 obj->ttm.created =3D true;
>
>         /* i915 wants -ENXIO when out of memory region space. */
> -       return (ret =3D=3D -ENOSPC) ? -ENXIO : ret;
> +       return i915_ttm_err_to_gem(ret);
>  }
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
