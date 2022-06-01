Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D4539FB7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940CA10E716;
	Wed,  1 Jun 2022 08:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54C10E70C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:42:04 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id r65so1750405oia.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fch8miiNXQtzT5esDWMSLp6jvuPLbdpboVZYRBDw3iM=;
 b=a790koOHwgbM2d6R0MstdTvKDoX1u1nuztC1Jg63ZB71NVxPmlWOd0c9ldjwgPjl+V
 QeJKfzRwJP0YYOLA9klaiDqvCII0I5LuOF0qoURbJS3HTbs1mYLTmYLF7SkazmNCJ441
 sHWRe84j55zoBW7tK1sX228hKi5/GkjCOAXaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fch8miiNXQtzT5esDWMSLp6jvuPLbdpboVZYRBDw3iM=;
 b=r1O8j7X33AWBaFiXZZvD8vARldrbLJQaf7ar1M+QvgnXE9jO9nxaQZ+sg+j7N6pYWK
 5/efiVhAfV3jAGumdaNBqFYFt25hMTQW4xM9sGogJCKTRkNX12jJPb0IfgGeN7VPCUMI
 3N+Vh8v+0RcAZFXa93Od6aoyBi5e6460AUguZRKqmEn0piAo4f1AtBYDODJewIMJxoWW
 3xA798XGMRJ+tQkLAvqH0bmB5UEgMzYw0541qBP30Vlu/oGhGETiLRP55q8pJwGvSKdC
 TBge/12lHVAxtq0li37oYWG8esV0Ax+9MO/0HoeRwkp9VwyGNv+Y2BPdtUoYGlGXDkj0
 EhJA==
X-Gm-Message-State: AOAM533RlaFRigxWDH+JYi/wen6bk2t2iuLXd2+OVenj+C3CJGyoJicE
 hftyfbB1iYnoBmUqFvJM43GE0Wc9TlGsCC+Hn/k29A==
X-Google-Smtp-Source: ABdhPJyTaOkBp71bZohPt6Qepx7smTX6jSVXYqNw0yJTPhHC1muZr1Kr12004yr+Ctjk7CBmJsQ98PCeG30fIEse2Is=
X-Received: by 2002:a05:6808:f88:b0:32b:d10f:cc6b with SMTP id
 o8-20020a0568080f8800b0032bd10fcc6bmr12940485oiw.228.1654072923292; Wed, 01
 Jun 2022 01:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-2-bas@basnieuwenhuizen.nl>
 <a5078937-a4d1-eaeb-af1b-de0482c2c78e@amd.com>
In-Reply-To: <a5078937-a4d1-eaeb-af1b-de0482c2c78e@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 1 Jun 2022 10:41:52 +0200
Message-ID: <CAKMK7uG8n4tydDA7XUVpkGnZgcohwaEZmny2kCLYtSyJRYoyyA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] drm/ttm: Refactor num_shared into usage.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Jun 2022 at 10:02, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> > So that the driver can set some BOOKKEEP for explicit sync. Maybe
> > some of the existing places would already make sense for that, but
> > I targeted this for no functional changes.
>
> Well first of all NAK to that one since it will totally break cases
> which need to reserve more than one fence slot.

Quick reminder, we talked about this in the past. For many folks (not
you) NAK means "fuck off" and not "this wont work for the reasons I
just explained". Looks like the conversation is all on a good track in
the further replies, just figured I'll drop this again as a reminder
:-)

Maybe do an autocomplete in your mail editor which replaces NAK with
NAK (note: this means "fuck off" for many folks) so you can decide
whether that's really the message you want to send out to start the
morning. And in some rare case I do agree that just dropping a polite
"fuck off" is the right thing to make it clear what's up ...

Cheers, Daniel

>
> Also as discussed with Daniel we don't want to use BOOKKEEP for implicit
> sync. We should instead use READ for that.
>
> BOOKKEEP is for stuff userspace should never be aware of, e.g. like page
> table updates and KFD eviction fences.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 10 +++++-----
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            |  8 +++-----
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c           |  2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c           |  6 +++---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |  3 +--
> >   drivers/gpu/drm/amd/amdkfd/kfd_svm.c              |  2 +-
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
> >   drivers/gpu/drm/qxl/qxl_release.c                 |  2 +-
> >   drivers/gpu/drm/radeon/radeon_cs.c                |  5 +++--
> >   drivers/gpu/drm/radeon/radeon_gem.c               |  2 +-
> >   drivers/gpu/drm/radeon/radeon_vm.c                |  4 ++--
> >   drivers/gpu/drm/ttm/ttm_execbuf_util.c            |  5 ++---
> >   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c          | 10 +++++-----
> >   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c        |  2 +-
> >   include/drm/ttm/ttm_execbuf_util.h                |  3 ++-
> >   16 files changed, 33 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > index a4955ef76cfc..a790a089e829 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > @@ -774,7 +774,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_m=
em *mem,
> >       struct amdgpu_bo *bo =3D mem->bo;
> >
> >       INIT_LIST_HEAD(&entry->head);
> > -     entry->num_shared =3D 1;
> > +     entry->usage =3D DMA_RESV_USAGE_READ;
> >       entry->bo =3D &bo->tbo;
> >       mutex_lock(&process_info->lock);
> >       if (userptr)
> > @@ -918,7 +918,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
> >
> >       ctx->kfd_bo.priority =3D 0;
> >       ctx->kfd_bo.tv.bo =3D &bo->tbo;
> > -     ctx->kfd_bo.tv.num_shared =3D 1;
> > +     ctx->kfd_bo.tv.usage =3D DMA_RESV_USAGE_READ;
> >       list_add(&ctx->kfd_bo.tv.head, &ctx->list);
> >
> >       amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
> > @@ -981,7 +981,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *=
mem,
> >
> >       ctx->kfd_bo.priority =3D 0;
> >       ctx->kfd_bo.tv.bo =3D &bo->tbo;
> > -     ctx->kfd_bo.tv.num_shared =3D 1;
> > +     ctx->kfd_bo.tv.usage =3D DMA_RESV_USAGE_READ;
> >       list_add(&ctx->kfd_bo.tv.head, &ctx->list);
> >
> >       i =3D 0;
> > @@ -2218,7 +2218,7 @@ static int validate_invalid_user_pages(struct amd=
kfd_process_info *process_info)
> >                           validate_list.head) {
> >               list_add_tail(&mem->resv_list.head, &resv_list);
> >               mem->resv_list.bo =3D mem->validate_list.bo;
> > -             mem->resv_list.num_shared =3D mem->validate_list.num_shar=
ed;
> > +             mem->resv_list.usage =3D mem->validate_list.usage;
> >       }
> >
> >       /* Reserve all BOs and page tables for validation */
> > @@ -2417,7 +2417,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void =
*info, struct dma_fence **ef)
> >
> >               list_add_tail(&mem->resv_list.head, &ctx.list);
> >               mem->resv_list.bo =3D mem->validate_list.bo;
> > -             mem->resv_list.num_shared =3D mem->validate_list.num_shar=
ed;
> > +             mem->resv_list.usage =3D mem->validate_list.usage;
> >       }
> >
> >       ret =3D ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index 60ca14afb879..2ae1c0d9d33a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -55,8 +55,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_c=
s_parser *p,
> >       bo =3D amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
> >       p->uf_entry.priority =3D 0;
> >       p->uf_entry.tv.bo =3D &bo->tbo;
> > -     /* One for TTM and two for the CS job */
> > -     p->uf_entry.tv.num_shared =3D 3;
> > +     p->uf_entry.tv.usage =3D DMA_RESV_USAGE_READ;
> >
> >       drm_gem_object_put(gobj);
> >
> > @@ -519,9 +518,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pa=
rser *p,
> >                       return r;
> >       }
> >
> > -     /* One for TTM and one for the CS job */
> >       amdgpu_bo_list_for_each_entry(e, p->bo_list)
> > -             e->tv.num_shared =3D 2;
> > +             e->tv.usage =3D DMA_RESV_USAGE_READ;
> >
> >       amdgpu_bo_list_get_list(p->bo_list, &p->validated);
> >
> > @@ -1261,7 +1259,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> >
> >       /* Make sure all BOs are remembered as writers */
> >       amdgpu_bo_list_for_each_entry(e, p->bo_list)
> > -             e->tv.num_shared =3D 0;
> > +             e->tv.usage =3D DMA_RESV_USAGE_WRITE;
> >
> >       ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
> >       mutex_unlock(&p->adev->notifier_lock);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_csa.c
> > index c6d4d41c4393..71277257d94d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev,=
 struct amdgpu_vm *vm,
> >       INIT_LIST_HEAD(&list);
> >       INIT_LIST_HEAD(&csa_tv.head);
> >       csa_tv.bo =3D &bo->tbo;
> > -     csa_tv.num_shared =3D 1;
> > +     csa_tv.usage =3D DMA_RESV_USAGE_READ;
> >
> >       list_add(&csa_tv.head, &list);
> >       amdgpu_vm_get_pd_bo(vm, &list, &pd);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gem.c
> > index 84a53758e18e..7483411229f4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_=
object *obj,
> >       INIT_LIST_HEAD(&duplicates);
> >
> >       tv.bo =3D &bo->tbo;
> > -     tv.num_shared =3D 2;
> > +     tv.usage =3D DMA_RESV_USAGE_READ;
> >       list_add(&tv.head, &list);
> >
> >       amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
> > @@ -731,9 +731,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, voi=
d *data,
> >               abo =3D gem_to_amdgpu_bo(gobj);
> >               tv.bo =3D &abo->tbo;
> >               if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> > -                     tv.num_shared =3D 1;
> > +                     tv.usage =3D DMA_RESV_USAGE_READ;
> >               else
> > -                     tv.num_shared =3D 0;
> > +                     tv.usage =3D DMA_RESV_USAGE_WRITE;
> >               list_add(&tv.head, &list);
> >       } else {
> >               gobj =3D NULL;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vkms.c
> > index 5224d9a39737..f670d8473993 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > @@ -319,7 +319,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane =
*plane,
> >       INIT_LIST_HEAD(&list);
> >
> >       tv.bo =3D &rbo->tbo;
> > -     tv.num_shared =3D 1;
> > +     tv.usage =3D DMA_RESV_USAGE_READ;
> >       list_add(&tv.head, &list);
> >
> >       r =3D ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 15184153e2b9..515be19ab279 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -633,8 +633,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
> >   {
> >       entry->priority =3D 0;
> >       entry->tv.bo =3D &vm->root.bo->tbo;
> > -     /* Two for VM updates, one for TTM and one for the CS job */
> > -     entry->tv.num_shared =3D 4;
> > +     entry->tv.usage =3D DMA_RESV_USAGE_READ;
> >       entry->user_pages =3D NULL;
> >       list_add(&entry->tv.head, validated);
> >   }
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_svm.c
> > index b3fc3e958227..af844b636778 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > @@ -1395,7 +1395,7 @@ static int svm_range_reserve_bos(struct svm_valid=
ate_context *ctx)
> >               vm =3D drm_priv_to_vm(pdd->drm_priv);
> >
> >               ctx->tv[gpuidx].bo =3D &vm->root.bo->tbo;
> > -             ctx->tv[gpuidx].num_shared =3D 4;
> > +             ctx->tv[gpuidx].usage =3D DMA_RESV_USAGE_READ;
> >               list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
> >       }
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 73423b805b54..851b7844b084 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7601,7 +7601,7 @@ static int dm_plane_helper_prepare_fb(struct drm_=
plane *plane,
> >       INIT_LIST_HEAD(&list);
> >
> >       tv.bo =3D &rbo->tbo;
> > -     tv.num_shared =3D 1;
> > +     tv.usage =3D DMA_RESV_USAGE_READ;
> >       list_add(&tv.head, &list);
> >
> >       r =3D ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> > diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qx=
l_release.c
> > index 368d26da0d6a..689e35192070 100644
> > --- a/drivers/gpu/drm/qxl/qxl_release.c
> > +++ b/drivers/gpu/drm/qxl/qxl_release.c
> > @@ -183,7 +183,7 @@ int qxl_release_list_add(struct qxl_release *releas=
e, struct qxl_bo *bo)
> >
> >       qxl_bo_ref(bo);
> >       entry->tv.bo =3D &bo->tbo;
> > -     entry->tv.num_shared =3D 0;
> > +     entry->tv.usage =3D DMA_RESV_USAGE_WRITE;
> >       list_add_tail(&entry->tv.head, &release->bos);
> >       return 0;
> >   }
> > diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeo=
n/radeon_cs.c
> > index 446f7bae54c4..30afe0c62dd9 100644
> > --- a/drivers/gpu/drm/radeon/radeon_cs.c
> > +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> > @@ -183,7 +183,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs=
_parser *p)
> >               }
> >
> >               p->relocs[i].tv.bo =3D &p->relocs[i].robj->tbo;
> > -             p->relocs[i].tv.num_shared =3D !r->write_domain;
> > +             p->relocs[i].tv.usage =3D
> > +                     r->write_domain ? DMA_RESV_USAGE_WRITE : DMA_RESV=
_USAGE_READ;
> >
> >               radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
> >                                     priority);
> > @@ -258,7 +259,7 @@ static int radeon_cs_sync_rings(struct radeon_cs_pa=
rser *p)
> >
> >               resv =3D reloc->robj->tbo.base.resv;
> >               r =3D radeon_sync_resv(p->rdev, &p->ib.sync, resv,
> > -                                  reloc->tv.num_shared);
> > +                                  reloc->tv.usage !=3D DMA_RESV_USAGE_=
WRITE);
> >               if (r)
> >                       return r;
> >       }
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rade=
on/radeon_gem.c
> > index 8c01a7f0e027..eae47c709f5d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -635,7 +635,7 @@ static void radeon_gem_va_update_vm(struct radeon_d=
evice *rdev,
> >       INIT_LIST_HEAD(&list);
> >
> >       tv.bo =3D &bo_va->bo->tbo;
> > -     tv.num_shared =3D 1;
> > +     tv.usage =3D DMA_RESV_USAGE_READ;
> >       list_add(&tv.head, &list);
> >
> >       vm_bos =3D radeon_vm_get_bos(rdev, bo_va->vm, &list);
> > diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeo=
n/radeon_vm.c
> > index 987cabbf1318..702627b48dae 100644
> > --- a/drivers/gpu/drm/radeon/radeon_vm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> > @@ -143,7 +143,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct rad=
eon_device *rdev,
> >       list[0].preferred_domains =3D RADEON_GEM_DOMAIN_VRAM;
> >       list[0].allowed_domains =3D RADEON_GEM_DOMAIN_VRAM;
> >       list[0].tv.bo =3D &vm->page_directory->tbo;
> > -     list[0].tv.num_shared =3D 1;
> > +     list[0].tv.usage =3D DMA_RESV_USAGE_READ;
> >       list[0].tiling_flags =3D 0;
> >       list_add(&list[0].tv.head, head);
> >
> > @@ -155,7 +155,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct rad=
eon_device *rdev,
> >               list[idx].preferred_domains =3D RADEON_GEM_DOMAIN_VRAM;
> >               list[idx].allowed_domains =3D RADEON_GEM_DOMAIN_VRAM;
> >               list[idx].tv.bo =3D &list[idx].robj->tbo;
> > -             list[idx].tv.num_shared =3D 1;
> > +             list[idx].tv.usage =3D DMA_RESV_USAGE_READ;
> >               list[idx].tiling_flags =3D 0;
> >               list_add(&list[idx++].tv.head, head);
> >       }
> > diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/t=
tm/ttm_execbuf_util.c
> > index 0eb995d25df1..c39d8e5ac271 100644
> > --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> > @@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *t=
icket,
> >                       continue;
> >               }
> >
> > -             num_fences =3D min(entry->num_shared, 1u);
> > +             num_fences =3D entry->usage <=3D DMA_RESV_USAGE_WRITE ? 0=
u : 1u;
> >               if (!ret) {
> >                       ret =3D dma_resv_reserve_fences(bo->base.resv,
> >                                                     num_fences);
> > @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_=
ctx *ticket,
> >       list_for_each_entry(entry, list, head) {
> >               struct ttm_buffer_object *bo =3D entry->bo;
> >
> > -             dma_resv_add_fence(bo->base.resv, fence, entry->num_share=
d ?
> > -                                DMA_RESV_USAGE_READ : DMA_RESV_USAGE_W=
RITE);
> > +             dma_resv_add_fence(bo->base.resv, fence, entry->usage);
> >               ttm_bo_move_to_lru_tail_unlocked(bo);
> >               dma_resv_unlock(bo->base.resv);
> >       }
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_resource.c
> > index c6d02c98a19a..58dfff7d6c76 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > @@ -130,7 +130,7 @@ static void vmw_resource_release(struct kref *kref)
> >                       struct ttm_validate_buffer val_buf;
> >
> >                       val_buf.bo =3D bo;
> > -                     val_buf.num_shared =3D 0;
> > +                     val_buf.usage =3D DMA_RESV_USAGE_WRITE;
> >                       res->func->unbind(res, false, &val_buf);
> >               }
> >               res->backup_dirty =3D false;
> > @@ -552,7 +552,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ti=
cket,
> >       INIT_LIST_HEAD(&val_list);
> >       ttm_bo_get(&res->backup->base);
> >       val_buf->bo =3D &res->backup->base;
> > -     val_buf->num_shared =3D 0;
> > +     val_buf->usage =3D DMA_RESV_USAGE_WRITE;
> >       list_add_tail(&val_buf->head, &val_list);
> >       ret =3D ttm_eu_reserve_buffers(ticket, &val_list, interruptible, =
NULL);
> >       if (unlikely(ret !=3D 0))
> > @@ -657,7 +657,7 @@ static int vmw_resource_do_evict(struct ww_acquire_=
ctx *ticket,
> >       BUG_ON(!func->may_evict);
> >
> >       val_buf.bo =3D NULL;
> > -     val_buf.num_shared =3D 0;
> > +     val_buf.usage =3D DMA_RESV_USAGE_WRITE;
> >       ret =3D vmw_resource_check_buffer(ticket, res, interruptible, &va=
l_buf);
> >       if (unlikely(ret !=3D 0))
> >               return ret;
> > @@ -708,7 +708,7 @@ int vmw_resource_validate(struct vmw_resource *res,=
 bool intr,
> >               return 0;
> >
> >       val_buf.bo =3D NULL;
> > -     val_buf.num_shared =3D 0;
> > +     val_buf.usage =3D DMA_RESV_USAGE_WRITE;
> >       if (res->backup)
> >               val_buf.bo =3D &res->backup->base;
> >       do {
> > @@ -777,7 +777,7 @@ void vmw_resource_unbind_list(struct vmw_buffer_obj=
ect *vbo)
> >   {
> >       struct ttm_validate_buffer val_buf =3D {
> >               .bo =3D &vbo->base,
> > -             .num_shared =3D 0
> > +             .usage =3D DMA_RESV_USAGE_WRITE
> >       };
> >
> >       dma_resv_assert_held(vbo->base.base.resv);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_validation.c
> > index f46891012be3..0476ba498321 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> > @@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct vmw_validation_con=
text *ctx,
> >               val_buf->bo =3D ttm_bo_get_unless_zero(&vbo->base);
> >               if (!val_buf->bo)
> >                       return -ESRCH;
> > -             val_buf->num_shared =3D 0;
> > +             val_buf->usage =3D DMA_RESV_USAGE_WRITE;
> >               list_add_tail(&val_buf->head, &ctx->bo_list);
> >               bo_node->as_mob =3D as_mob;
> >               bo_node->cpu_blit =3D cpu_blit;
> > diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_e=
xecbuf_util.h
> > index a99d7fdf2964..851961a06c27 100644
> > --- a/include/drm/ttm/ttm_execbuf_util.h
> > +++ b/include/drm/ttm/ttm_execbuf_util.h
> > @@ -31,6 +31,7 @@
> >   #ifndef _TTM_EXECBUF_UTIL_H_
> >   #define _TTM_EXECBUF_UTIL_H_
> >
> > +#include <linux/dma-resv.h>
> >   #include <linux/list.h>
> >
> >   #include "ttm_bo_api.h"
> > @@ -46,7 +47,7 @@
> >   struct ttm_validate_buffer {
> >       struct list_head head;
> >       struct ttm_buffer_object *bo;
> > -     unsigned int num_shared;
> > +     enum dma_resv_usage usage;
> >   };
> >
> >   /**
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
