Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C33ABDCB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 23:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC266E0B9;
	Thu, 17 Jun 2021 21:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530B16E0B9;
 Thu, 17 Jun 2021 21:09:14 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 f3-20020a0568301c23b029044ce5da4794so941990ote.11; 
 Thu, 17 Jun 2021 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T1t5ixBhfU+YgoATEdeETMrWXi3D+eheoYh3m8rilvs=;
 b=GTugJAszOvZK3WBgCPvu9lklVWmg9fUOhzLn/Adiqfqm2e4sUFtElsRcmnnmo0mbGE
 CYVivq1NOCOBBdHhTbqg29f1kNhm47yV+yP7Jc0YNALnyCCxoM/FQbvke7RrdRVnCi80
 gi+YK25ceqXEiZCcfIdCyEx2Y50CuHvbV4W6vaoDyfhTd/3TIoOKiRe9tkYe8i//PyWp
 U7dOIJn2Z5jjzCs02XtryTsHUqi3qawq9VZnZPYdqJa6lAXS1kR5LrIcmzzmenSDJG3x
 YsxsykhCd3/Rj078ljSq+qkPBTq9qFk4PL/vzIfJbBXq5h2c6heZgSdofpEYKPEWyEe0
 l+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T1t5ixBhfU+YgoATEdeETMrWXi3D+eheoYh3m8rilvs=;
 b=W68LXI3TTozI42IeLENVSXg5qU3Pe6TIwJLO3NrYtGCpgeo6IP1zFydmBql3iMNHx/
 zuBJB+OeXgQclWCHaV6h9SHwWxJ31K0ccwifJ34WZoG81YbP/dJHfhr6Z9eYUJUVQRag
 Kv2Havyfm6J4c1opCxav9dXm0BI8lBpAOD4VaVhfHPcJsfuSFwGcrGSTnFgcw5I7pWfn
 CwctO1yoGQ4aDyQ6tfqXaZ6He85CiKzIW29XShd/JW87N9I+ahD9XTS2bX26QQkGvsiU
 uywx/5GjT+4wiXaH4to9kjAVhHM94+HPgdiiBlwv8e/H33QkkVojghsCE/KeNQt0clbm
 xraA==
X-Gm-Message-State: AOAM531z5G2mdAVlaLHg+6+jxHQdHPfnezte4zJE7E6pJcVMG8Ea4ots
 M7iYBVfNSImnzJ0Ns/o4rhwx97D5EwljgF1Dij4=
X-Google-Smtp-Source: ABdhPJwi78AD8pVRr5taz6+b4kZzNSERcghLlPEpZIPhnSXAqohmaVxh1IfAuuQTJMhu9oj78BoXNeXJxB0MuObu+no=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr6339671otr.23.1623964153469; 
 Thu, 17 Jun 2021 14:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210614174536.5188-1-christian.koenig@amd.com>
 <20210614174536.5188-2-christian.koenig@amd.com>
In-Reply-To: <20210614174536.5188-2-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Jun 2021 17:09:02 -0400
Message-ID: <CADnq5_OMZZomJvpNzpA=kXgvDWAM538kYVUFnrnXhYO4Gne17Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: rework dma_resv handling v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 1:45 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Drop the workaround and instead implement a better solution.
>
> Basically we are now chaining all submissions using a dma_fence_chain
> container and adding them as exclusive fence to the dma_resv object.
>
> This way other drivers can still sync to the single exclusive fence
> while amdgpu only sync to fences from different processes.
>
> v3: add the shared fence first before the exclusive one
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 62 ++++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
>  6 files changed, 55 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_bo_list.h
> index a130e766cbdb..c905a4cfc173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -34,6 +34,7 @@ struct amdgpu_fpriv;
>  struct amdgpu_bo_list_entry {
>         struct ttm_validate_buffer      tv;
>         struct amdgpu_bo_va             *bo_va;
> +       struct dma_fence_chain          *chain;
>         uint32_t                        priority;
>         struct page                     **user_pages;
>         bool                            user_invalidated;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 9ce649a1a8d3..25655414e9c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -572,6 +572,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
ser *p,
>                 goto out;
>         }
>
> +       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +               struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
> +
> +               e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> +
> +               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo))=
 {
> +                       e->chain =3D dma_fence_chain_alloc();
> +                       if (!e->chain) {
> +                               r =3D -ENOMEM;
> +                               goto error_validate;
> +                       }
> +               }
> +       }
> +
>         amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_thresh=
old,
>                                           &p->bytes_moved_vis_threshold);
>         p->bytes_moved =3D 0;
> @@ -599,15 +613,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
ser *p,
>         gws =3D p->bo_list->gws_obj;
>         oa =3D p->bo_list->oa_obj;
>
> -       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -               struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
> -
> -               /* Make sure we use the exclusive slot for shared BOs */
> -               if (bo->prime_shared_count)
> -                       e->tv.num_shared =3D 0;
> -               e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> -       }
> -
>         if (gds) {
>                 p->job->gds_base =3D amdgpu_bo_gpu_offset(gds) >> PAGE_SH=
IFT;
>                 p->job->gds_size =3D amdgpu_bo_size(gds) >> PAGE_SHIFT;
> @@ -629,8 +634,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
ser *p,
>         }
>
>  error_validate:
> -       if (r)
> +       if (r) {
> +               amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +                       dma_fence_chain_free(e->chain);
> +                       e->chain =3D NULL;
> +               }
>                 ttm_eu_backoff_reservation(&p->ticket, &p->validated);
> +       }
>  out:
>         return r;
>  }
> @@ -670,9 +680,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_p=
arser *parser, int error,
>  {
>         unsigned i;
>
> -       if (error && backoff)
> +       if (error && backoff) {
> +               struct amdgpu_bo_list_entry *e;
> +
> +               amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
> +                       dma_fence_chain_free(e->chain);
> +                       e->chain =3D NULL;
> +               }
> +
>                 ttm_eu_backoff_reservation(&parser->ticket,
>                                            &parser->validated);
> +       }
>
>         for (i =3D 0; i < parser->num_post_deps; i++) {
>                 drm_syncobj_put(parser->post_deps[i].syncobj);
> @@ -1245,6 +1263,28 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parse=
r *p,
>
>         amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>
> +       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +               struct dma_resv *resv =3D e->tv.bo->base.resv;
> +               struct dma_fence_chain *chain =3D e->chain;
> +
> +               if (!chain)
> +                       continue;
> +
> +               /*
> +                * Work around dma_resv shortcommings by wrapping up the
> +                * submission in a dma_fence_chain and add it as exclusiv=
e
> +                * fence, but first add the submission as shared fence to=
 make
> +                * sure that shared fences never signal before the exclus=
ive
> +                * one.
> +                */
> +               dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
> +                                    dma_fence_get(p->fence), 1);
> +
> +               dma_resv_add_shared_fence(resv, p->fence);
> +               rcu_assign_pointer(resv->fence_excl, &chain->base);
> +               e->chain =3D NULL;
> +       }
> +
>         ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>         mutex_unlock(&p->adev->notifier_lock);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index c3053b83b80c..23219fc3b28c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -42,48 +42,6 @@
>  #include <linux/pci-p2pdma.h>
>  #include <linux/pm_runtime.h>
>
> -static int
> -__dma_resv_make_exclusive(struct dma_resv *obj)
> -{
> -       struct dma_fence **fences;
> -       unsigned int count;
> -       int r;
> -
> -       if (!dma_resv_shared_list(obj)) /* no shared fences to convert */
> -               return 0;
> -
> -       r =3D dma_resv_get_fences(obj, NULL, &count, &fences);
> -       if (r)
> -               return r;
> -
> -       if (count =3D=3D 0) {
> -               /* Now that was unexpected. */
> -       } else if (count =3D=3D 1) {
> -               dma_resv_add_excl_fence(obj, fences[0]);
> -               dma_fence_put(fences[0]);
> -               kfree(fences);
> -       } else {
> -               struct dma_fence_array *array;
> -
> -               array =3D dma_fence_array_create(count, fences,
> -                                              dma_fence_context_alloc(1)=
, 0,
> -                                              false);
> -               if (!array)
> -                       goto err_fences_put;
> -
> -               dma_resv_add_excl_fence(obj, &array->base);
> -               dma_fence_put(&array->base);
> -       }
> -
> -       return 0;
> -
> -err_fences_put:
> -       while (count--)
> -               dma_fence_put(fences[count]);
> -       kfree(fences);
> -       return -ENOMEM;
> -}
> -
>  /**
>   * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
>   *
> @@ -110,24 +68,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmab=
uf,
>         if (r < 0)
>                 goto out;
>
> -       r =3D amdgpu_bo_reserve(bo, false);
> -       if (unlikely(r !=3D 0))
> -               goto out;
> -
> -       /*
> -        * We only create shared fences for internal use, but importers
> -        * of the dmabuf rely on exclusive fences for implicitly
> -        * tracking write hazards. As any of the current fences may
> -        * correspond to a write, we need to convert all existing
> -        * fences on the reservation object into a single exclusive
> -        * fence.
> -        */
> -       r =3D __dma_resv_make_exclusive(bo->tbo.base.resv);
> -       if (r)
> -               goto out;
> -
> -       bo->prime_shared_count++;
> -       amdgpu_bo_unreserve(bo);
>         return 0;
>
>  out:
> @@ -150,9 +90,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmab=
uf,
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
>         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
>
> -       if (attach->dev->driver !=3D adev->dev->driver && bo->prime_share=
d_count)
> -               bo->prime_shared_count--;
> -
>         pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>         pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>  }
> @@ -406,8 +343,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, str=
uct dma_buf *dma_buf)
>         bo =3D gem_to_amdgpu_bo(gobj);
>         bo->allowed_domains =3D AMDGPU_GEM_DOMAIN_GTT;
>         bo->preferred_domains =3D AMDGPU_GEM_DOMAIN_GTT;
> -       if (dma_buf->ops !=3D &amdgpu_dmabuf_ops)
> -               bo->prime_shared_count =3D 1;
>
>         dma_resv_unlock(resv);
>         return gobj;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 9cf4beaf646c..0780e8d18992 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -829,7 +829,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void =
*data,
>                 break;
>         }
>         case AMDGPU_GEM_OP_SET_PLACEMENT:
> -               if (robj->prime_shared_count && (args->value & AMDGPU_GEM=
_DOMAIN_VRAM)) {
> +               if (robj->tbo.base.import_attach &&
> +                   args->value & AMDGPU_GEM_DOMAIN_VRAM) {
>                         r =3D -EINVAL;
>                         amdgpu_bo_unreserve(robj);
>                         break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index b7a2070d90af..d13490975ac3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -892,7 +892,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u3=
2 domain,
>                 return -EINVAL;
>
>         /* A shared bo cannot be migrated to VRAM */
> -       if (bo->prime_shared_count || bo->tbo.base.import_attach) {
> +       if (bo->tbo.base.import_attach) {
>                 if (domain & AMDGPU_GEM_DOMAIN_GTT)
>                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
>                 else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.h
> index 126df03a7066..c03dfd298f45 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -99,7 +99,6 @@ struct amdgpu_bo {
>         struct ttm_buffer_object        tbo;
>         struct ttm_bo_kmap_obj          kmap;
>         u64                             flags;
> -       unsigned                        prime_shared_count;
>         /* per VM structure for page tables and with virtual addresses */
>         struct amdgpu_vm_bo_base        *vm_bo;
>         /* Constant after initialization */
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
