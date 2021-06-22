Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732F3B0094
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AFE6E0F7;
	Tue, 22 Jun 2021 09:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06C76E0F7;
 Tue, 22 Jun 2021 09:44:34 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id q64so31478609qke.7;
 Tue, 22 Jun 2021 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pNxxKfZLfVLg4XC6djnWj2VNlNbQrX2kWG1kWvz9lU8=;
 b=XQl2m3A663C9SZFGk+fIHl0O5/ojb6SVdH2P+0s4U6PvWBESd7NQdjzgjGpWRUEaPt
 GpWDwgLUBKZSXvHpccxDlwEfMHo3pD5M+NOZG36RxDDQSImEX2t3tzb69ocJvV7wkV3I
 47e/D8dBO4l5KPuObK20ULx4/TZ+GtFBtEPIvGP+Af8GJoB7op7ZPYrHKmtOvNzUxp2Q
 zKu1/kwYH9rSLI45P0tYMWeq0iHSbKI3u5wpDHMTxVjJPzANxx92EQPZI4chIKkq+1Lh
 DJ3nSly/KXqBPMLj5qmYNuKR5qfwIgs2MQnAWS68vA2rPDNotrPmyfLur2opT9vOdO1t
 zRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pNxxKfZLfVLg4XC6djnWj2VNlNbQrX2kWG1kWvz9lU8=;
 b=mhZiJo8Yfjd8A5eKy+slQED3JRxaziLV9cL96i9F6xJE4N8zIPdaLQC4nw/3wybUOl
 jsqWJzADyHHHhdTe5pySNZaPjrEFpqyuDMJU+hOePyCd7R344SWRpx6quDAzsfLy1KB6
 FlUKLxAxY44qm1Y4X7kutr88ndrAy5yFEJ7bJWQ/Bor0cvocXix6shOWSJu1AssOrn6s
 F3EhMYOSSfcO/ncYAG52AqPREOPWzLLtx5b5N5iQV5vy+zYbLthSAKCwaLV7uoz52WQZ
 2kvcwYb5JZIoTqBpOq+8REkfYuMvs0VPpfp4LWKFbSCuqyu2Zvfnxh///2nZmV1M11rd
 EZCg==
X-Gm-Message-State: AOAM530s1LWAd7+X/+6pEIz04AvCqzCoZrukckNMmP6+7m4PX1QG2VBW
 d6lZQcCnaa3rZQWewQGiml8SSyNCQvKJe5vSRyNHvxLgOe5GMQ==
X-Google-Smtp-Source: ABdhPJxG2rdp8hzFyVCfepjI7blg5hqGQdfZzr5O4K3rINaKsPXMtsHz1Oa0MWsNnXKEfh5ZtpSd17vOZhu1+dfQFxI=
X-Received: by 2002:a05:620a:919:: with SMTP id
 v25mr3091688qkv.327.1624355073596; 
 Tue, 22 Jun 2021 02:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
 <20210622093418.153400-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210622093418.153400-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 22 Jun 2021 10:44:07 +0100
Message-ID: <CAM0jSHMWG4tGSHDGzuKw+qC5D-PoXzfDJa_QCdwpn=p20fkC4Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 2/3] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
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

On Tue, 22 Jun 2021 at 10:34, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> After a TTM move or object init we need to update the i915 gem flags and
> caching settings to reflect the new placement. Currently caching settings
> are not changed during the lifetime of an object, although that might
> change moving forward if we run into performance issues or issues with
> WC system page allocations.
> Also introduce gpu_binds_iomem() and cpu_maps_iomem() to clean up the
> various ways we previously used to detect this.
> Finally, initialize the TTM object reserved to be able to update
> flags and caching before anyone else gets hold of the object.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
> v6:
> - Rebase on accelerated ttm moves.
> ---

<snip>

> @@ -775,14 +845,13 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
>         i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, fla=
gs);
>         i915_gem_object_init_memory_region(obj, mem);
>         i915_gem_object_make_unshrinkable(obj);
> -       obj->read_domains =3D I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> -       obj->mem_flags |=3D I915_BO_FLAG_IOMEM;
> -       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_N=
OWARN);
>         mutex_init(&obj->ttm.get_io_page.lock);
>         bo_type =3D (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_devic=
e :
>                 ttm_bo_type_kernel;
>
> +       obj->base.vma_node.driver_private =3D i915_gem_to_ttm(obj);
> +
>         /*
>          * If this function fails, it will call the destructor, but
>          * our caller still owns the object. So no freeing in the
> @@ -790,14 +859,16 @@ int __i915_gem_ttm_object_init(struct intel_memory_=
region *mem,
>          * Similarly, in delayed_destroy, we can't call ttm_bo_put()
>          * until successful initialization.
>          */
> -       obj->base.vma_node.driver_private =3D i915_gem_to_ttm(obj);
> -       ret =3D ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> -                         bo_type, &i915_sys_placement,
> -                         mem->min_page_size >> PAGE_SHIFT,
> -                         true, NULL, NULL, i915_ttm_bo_destroy);
> -       if (!ret)
> -               obj->ttm.created =3D true;
> -
> -       /* i915 wants -ENXIO when out of memory region space. */
> -       return i915_ttm_err_to_gem(ret);
> +       ret =3D ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), s=
ize,
> +                                  bo_type, &i915_sys_placement, 1,

mem->min_page_size >> PAGE_SHIFT? Although just realised that looks
iffy since it only considers the current region, when it should
consider all future placements. I wonder if it makes sense to make
page_alignment part of ttm_place? Anyway, it doesn't matter for this
series.

> +                                  &ctx, NULL, NULL, i915_ttm_bo_destroy)=
;
> +       if (ret)
> +               return i915_ttm_err_to_gem(ret);
> +
> +       obj->ttm.created =3D true;
> +       i915_ttm_adjust_domains_after_move(obj);
> +       i915_ttm_adjust_gem_after_move(obj);
> +       i915_gem_object_unlock(obj);
> +
> +       return 0;
>  }
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
