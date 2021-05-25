Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC5C38FFA8
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 13:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3716E9EB;
	Tue, 25 May 2021 11:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440B66E9EB;
 Tue, 25 May 2021 11:00:36 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id h20so14400900qko.11;
 Tue, 25 May 2021 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fe0fFM0KlKEWL7dBBw0CbsRMF0mqBewf+9uT7Tvf0no=;
 b=k5nHMOP4YGDRkVlfhK4viAQqD2z3iWYje7M37KlmtcetRasDU8Zc7YZoDq+paQvTp6
 c7pY6/OXyxUr6kaeXDLUJQsiJwkCtSrhvNSx+PWdTHJIj3rO0CU6LdEbn5PCJ5RVRG32
 DZEqUneYgknqNeshe3qOnd5Ay0fS6keWOpOKL2ee7uOrVkXtV83kBsWPaE232U8THC6w
 aUJpohsfQGNDAgmWosfO4tulfx6u2UXetZDDWlMepYiG7WP0h/FIQnmpAX1iTR2WLrel
 CWYfDYaJjLHAmNn7rRbmJxJ0D81OIzUvSKPtKEtjCGXVk7Nr1sSCNo7yYx1nhrFedeWR
 itPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fe0fFM0KlKEWL7dBBw0CbsRMF0mqBewf+9uT7Tvf0no=;
 b=R78VLRYikG1UVqIzmgC1qcLCUBPfr2r7n3pAniB/DRYFt0Q93yuaAe2EgHJvYj6xKU
 Eo8HrpkotEBkcR6pYK3ILc6DcF1DSkQCQ1CwofY+lphnk164V1CCJRw2XaQd0B1aQZCT
 A3TAuwrjPWOQM6RT1DQ4wmBu3yniHeQUZ7iVx6XM1rEQlhz/ojk5vc8fZ+eaWNLqHhNu
 cZr9+Po3X4joiPhMamdx6DS67dxsqNMf+VZhghZ/jY6zV8gfvDwm/Am0vgiyclXneLMy
 yQs1t7A2hyLZBO270NMkQifYQHJuFTJCeWTgiTxkXKPEmAaNaAEtXPOYKw9rO6LrVpyR
 COVg==
X-Gm-Message-State: AOAM533Qhh6tR1Du/6PmIOhnagpUJcm4w7ovUuKmyimpi+mJRLn/QC4z
 Td7nt4tesy/XF3jLm3NYxMIoMn3HxqwUo8ThoHI=
X-Google-Smtp-Source: ABdhPJwjbqIUthbMkl55OvlRxYb0AhMibU0S590s/GFQNe35xpXKl9Ns1DOdBTp2rATk1YviQ8xrtB9EM4mOU3BcQPc=
X-Received: by 2002:a05:620a:b09:: with SMTP id
 t9mr36112672qkg.17.1621940435365; 
 Tue, 25 May 2021 04:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-10-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210521153253.518037-10-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 25 May 2021 12:00:08 +0100
Message-ID: <CAM0jSHO59Kr534HC-i816yRMJ22-XNN-AHwdoSFtK5KBiD99=g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 09/12] drm/ttm: Document and optimize
 ttm_bo_pipeline_gutting()
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 May 2021 at 16:33, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> If the bo is idle when calling ttm_bo_pipeline_gutting(), we unnecessaril=
y
> create a ghost object and push it out to delayed destroy.
> Fix this by adding a path for idle, and document the function.
>
> Also avoid having the bo end up in a bad state vulnerable to user-space
> triggered kernel BUGs if the call to ttm_tt_create() fails.
>
> Finally reuse ttm_bo_pipeline_gutting() in ttm_bo_evict().
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      | 20 ++++++------
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 52 ++++++++++++++++++++++++++++---
>  drivers/gpu/drm/ttm/ttm_tt.c      |  5 +++
>  include/drm/ttm/ttm_tt.h          | 10 ++++++
>  4 files changed, 73 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ca1b098b6a56..a8fa3375b8aa 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -501,10 +501,15 @@ static int ttm_bo_evict(struct ttm_buffer_object *b=
o,
>         bdev->funcs->evict_flags(bo, &placement);
>
>         if (!placement.num_placement && !placement.num_busy_placement) {
> -               ttm_bo_wait(bo, false, false);
> +               ret =3D ttm_bo_wait(bo, true, false);
> +               if (ret)
> +                       return ret;
>
> -               ttm_bo_cleanup_memtype_use(bo);
> -               return ttm_tt_create(bo, false);
> +               /*
> +                * Since we've already synced, this frees backing store
> +                * immediately.
> +                */
> +               return ttm_bo_pipeline_gutting(bo);
>         }
>
>         ret =3D ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
> @@ -974,13 +979,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>         /*
>          * Remove the backing store if no placement is given.
>          */
> -       if (!placement->num_placement && !placement->num_busy_placement) =
{
> -               ret =3D ttm_bo_pipeline_gutting(bo);
> -               if (ret)
> -                       return ret;
> -
> -               return ttm_tt_create(bo, false);
> -       }
> +       if (!placement->num_placement && !placement->num_busy_placement)
> +               return ttm_bo_pipeline_gutting(bo);
>
>         /*
>          * Check whether we need to move buffer.
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 4a7d3d672f9a..7fa9b3a852eb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -585,26 +585,70 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_obj=
ect *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>
> +/**
> + * ttm_bo_pipeline_gutting - purge the contents of a bo
> + * @bo: The buffer object
> + *
> + * Purge the contents of a bo, async if the bo is not idle.
> + * After a successful call, the bo is left unpopulated in
> + * system placement. The function may wait uninterruptible
> + * for idle on OOM.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
>  int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  {
>         static const struct ttm_place sys_mem =3D { .mem_type =3D TTM_PL_=
SYSTEM };
>         struct ttm_buffer_object *ghost;
> +       struct ttm_tt *ttm;
>         int ret;
>
> -       ret =3D ttm_buffer_object_transfer(bo, &ghost);
> +       /* If already idle, no need for ghost object dance. */
> +       ret =3D ttm_bo_wait(bo, false, true);
> +       if (ret !=3D -EBUSY) {
> +               if (!bo->ttm) {
> +                       ret =3D ttm_tt_create(bo, true);

Why do we now unconditionally add clearing? Below also.

> +                       if (ret)
> +                               return ret;
> +               } else {
> +                       ttm_tt_unpopulate(bo->bdev, bo->ttm);
> +                       if (bo->type =3D=3D ttm_bo_type_device)
> +                               ttm_tt_mark_for_clear(bo->ttm);
> +               }
> +               ttm_resource_free(bo, &bo->mem);
> +               ttm_resource_alloc(bo, &sys_mem, &bo->mem);
> +
> +               return 0;
> +       }
> +
> +       /*
> +        * We need an unpopulated ttm_tt after giving our current one,
> +        * if any, to the ghost object. And we can't afford to fail
> +        * creating one *after* the operation.
> +        */
> +
> +       ttm =3D bo->ttm;
> +       bo->ttm =3D NULL;
> +       ret =3D ttm_tt_create(bo, true);
> +       swap(bo->ttm, ttm);
>         if (ret)
>                 return ret;
>
> +       ret =3D ttm_buffer_object_transfer(bo, &ghost);
> +       if (ret) {
> +               ttm_tt_destroy(bo->bdev, ttm);
> +               return ret;
> +       }
> +
>         ret =3D dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
>         /* Last resort, wait for the BO to be idle when we are OOM */
>         if (ret)
>                 ttm_bo_wait(bo, false, false);
>
> -       ttm_resource_alloc(bo, &sys_mem, &bo->mem);
> -       bo->ttm =3D NULL;
> -
>         dma_resv_unlock(&ghost->base._resv);
>         ttm_bo_put(ghost);
> +       bo->ttm =3D ttm;
> +       ttm_resource_alloc(bo, &sys_mem, &bo->mem);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 0e41227116b1..913b330a234b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -134,6 +134,11 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, =
struct ttm_tt *ttm)
>  }
>  EXPORT_SYMBOL(ttm_tt_destroy_common);
>
> +void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
> +{
> +       ttm->page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
> +}
> +
>  void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>         bdev->funcs->ttm_tt_destroy(bdev, ttm);
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 3102059db726..daa9c4cf48bb 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -170,6 +170,16 @@ int ttm_tt_populate(struct ttm_device *bdev, struct =
ttm_tt *ttm, struct ttm_oper
>   */
>  void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>
> +/**
> + * ttm_tt_mark_for_clear - Mark pages for clearing on populate.
> + *
> + * @ttm: Pointer to the ttm_tt structure
> + *
> + * Marks pages for clearing so that the next time the page vector is
> + * populated, the pages will be cleared.
> + */
> +void ttm_tt_mark_for_clear(struct ttm_tt *ttm);
> +
>  void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pa=
ges);
>
>  struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *ite=
r_tt,
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
