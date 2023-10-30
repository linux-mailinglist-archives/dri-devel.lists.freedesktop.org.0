Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF1C7DBAFC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106DF10E2CC;
	Mon, 30 Oct 2023 13:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7E910E2C3;
 Mon, 30 Oct 2023 13:38:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507975d34e8so6462503e87.1; 
 Mon, 30 Oct 2023 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698673119; x=1699277919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XTY7Ceg2W761HSG7aGBRMEokR6cgjVhFDn1Z8HE4To=;
 b=ZZOfVJQPSBsf3wjC+N80yTAcgNFlMdwP1AHLv1IhG7t4DLn2j2rBXeBlXzJriHsrdz
 CcLXID9+HCZxFgAEykHvgK/ldZFSoqvPP+XXMrZRuEF3JmA6Vhf/8iG6wWiy5Vcz86qG
 7gmQuAD+2+LMWNVVCFkQdPW+WYWeF1Z3UBi58jWD84JWYdz3RUXWLo15fma6x9+grHli
 cE2oMD4kDZ3rBzdAHFYejRYscbbXM8HumVUyqeg8oHOFE1+4glo79iJpZRjCWeV8aDLV
 F/qNiE3wItf13K0Ga7eKO3vOzxskWyIvSLwYNzl7WRxmVw4HtxkaYG2eD1IZ+T4qDyio
 YG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698673119; x=1699277919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XTY7Ceg2W761HSG7aGBRMEokR6cgjVhFDn1Z8HE4To=;
 b=sabC8iHrlLxU5U5LVloreAOo5A2mdafMxm6WNjhghXPn6zsJDYvYhzA65qvZt5iwGj
 vR5Ccli3SRzeKainQsMWRSyFZxY/CP5HjgBn0SwbclmQJH3HJ2psszFEakY+u2kleX0D
 Jq8a5jvEFdHr3CbwCVz7H2j1U7faY9NN7OvZjkB8BeoeV7LhT9jPgqFtxKdAXzRzOrGg
 Vf224iaQP5JQy21/id4KooRFw9IX9Sq8mV5KGg11+AYlhdYxnr9u4rb6u+yz7GdU2fds
 W9VoWq47993SJZ0DU+LEHMUuhqH/GbrAuI/sI7XlbT9XiTWJCm7tuEhyUTWrIMe+8GV/
 fyQA==
X-Gm-Message-State: AOJu0YwqXPMUCKOtyuOA6g0Zp4FCp4cACy1QwgGgsSmloVcmt7fQgw9d
 kdpU7YdAv4MiYOK4IJ8kzrHQIvM8AzqrNO/Z1U0=
X-Google-Smtp-Source: AGHT+IHdElXWFmKYD1j9eSX3y4FD/cwV2Kl6WssGkJK7frmORyS1HkzDxkdhTKCzAef0BSodpHk6yj3z/NEtX5b7xY4=
X-Received: by 2002:a19:5513:0:b0:507:a8d1:6e57 with SMTP id
 n19-20020a195513000000b00507a8d16e57mr6903381lfe.40.1698673118796; Mon, 30
 Oct 2023 06:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-7-robdclark@gmail.com>
 <597b5bb3-ca75-4662-9904-12c4d8e9101a@amd.com>
In-Reply-To: <597b5bb3-ca75-4662-9904-12c4d8e9101a@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 30 Oct 2023 06:38:26 -0700
Message-ID: <CAF6AEGu1Z1k0bKrMZw4-RJSC-nbO=tuDOjQiPmi61_m_1nRCgA@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/exec: Pass in initial # of objects
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dong Chenchen <dongchenchen2@huawei.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, freedreno@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 1:05=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.10.23 um 18:58 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In cases where the # is known ahead of time, it is silly to do the tabl=
e
> > resize dance.
>
> Ah, yes that was my initial implementation as well, but I ditched that
> because nobody actually used it.
>
> One comment below.
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c |  4 ++--
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  4 ++--
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c |  4 ++--
> >   drivers/gpu/drm/drm_exec.c              | 15 ++++++++++++---
> >   drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  2 +-
> >   include/drm/drm_exec.h                  |  2 +-
> >   8 files changed, 22 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index efdb1c48f431..d27ca8f61929 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -65,7 +65,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_par=
ser *p,
> >       }
> >
> >       amdgpu_sync_create(&p->sync);
> > -     drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> > +     drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> >       return 0;
> >   }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_csa.c
> > index 720011019741..796fa6f1420b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> > @@ -70,7 +70,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev,=
 struct amdgpu_vm *vm,
> >       struct drm_exec exec;
> >       int r;
> >
> > -     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> > +     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> >       drm_exec_until_all_locked(&exec) {
> >               r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> >               if (likely(!r))
> > @@ -110,7 +110,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *a=
dev, struct amdgpu_vm *vm,
> >       struct drm_exec exec;
> >       int r;
> >
> > -     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> > +     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> >       drm_exec_until_all_locked(&exec) {
> >               r =3D amdgpu_vm_lock_pd(vm, &exec, 0);
> >               if (likely(!r))
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gem.c
> > index ca4d2d430e28..16f1715148ad 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -203,7 +203,7 @@ static void amdgpu_gem_object_close(struct drm_gem_=
object *obj,
> >       struct drm_exec exec;
> >       long r;
> >
> > -     drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
> > +     drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
> >       drm_exec_until_all_locked(&exec) {
> >               r =3D drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
> >               drm_exec_retry_on_contention(&exec);
> > @@ -739,7 +739,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, voi=
d *data,
> >       }
> >
> >       drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> > -                   DRM_EXEC_IGNORE_DUPLICATES);
> > +                   DRM_EXEC_IGNORE_DUPLICATES, 0);
> >       drm_exec_until_all_locked(&exec) {
> >               if (gobj) {
> >                       r =3D drm_exec_lock_obj(&exec, gobj);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_mes.c
> > index b6015157763a..3c351941701e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > @@ -1105,7 +1105,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_de=
vice *adev,
> >
> >       amdgpu_sync_create(&sync);
> >
> > -     drm_exec_init(&exec, 0);
> > +     drm_exec_init(&exec, 0, 0);
> >       drm_exec_until_all_locked(&exec) {
> >               r =3D drm_exec_lock_obj(&exec,
> >                                     &ctx_data->meta_data_obj->tbo.base)=
;
> > @@ -1176,7 +1176,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_=
device *adev,
> >       struct drm_exec exec;
> >       long r;
> >
> > -     drm_exec_init(&exec, 0);
> > +     drm_exec_init(&exec, 0, 0);
> >       drm_exec_until_all_locked(&exec) {
> >               r =3D drm_exec_lock_obj(&exec,
> >                                     &ctx_data->meta_data_obj->tbo.base)=
;
> > diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> > index 5d2809de4517..27d11c20d148 100644
> > --- a/drivers/gpu/drm/drm_exec.c
> > +++ b/drivers/gpu/drm/drm_exec.c
> > @@ -69,16 +69,25 @@ static void drm_exec_unlock_all(struct drm_exec *ex=
ec)
> >    * drm_exec_init - initialize a drm_exec object
> >    * @exec: the drm_exec object to initialize
> >    * @flags: controls locking behavior, see DRM_EXEC_* defines
> > + * @nr: the initial # of objects
> >    *
> >    * Initialize the object and make sure that we can track locked objec=
ts.
> > + *
> > + * If nr is non-zero then it is used as the initial objects table size=
.
> > + * In either case, the table will grow (be re-allocated) on demand.
> >    */
> > -void drm_exec_init(struct drm_exec *exec, uint32_t flags)
> > +void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr)
> >   {
> > +     size_t sz =3D PAGE_SIZE;
> > +
> > +     if (nr)
> > +             sz =3D (size_t)nr * sizeof(void *);
> > +
> >       exec->flags =3D flags;
> > -     exec->objects =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
> > +     exec->objects =3D kmalloc(sz, GFP_KERNEL);
>
> Please use k*v*malloc() here since we can't predict how large that will b=
e.

or __GFP_NOWARN?  If userspace (or kasan) is cheeky and asks for ~0
objects, we should probably just fail?

BR,
-R

> With that fixed the patch is Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.
>
> Regards,
> Christian.
>
> >
> >       /* If allocation here fails, just delay that till the first use *=
/
> > -     exec->max_objects =3D exec->objects ? PAGE_SIZE / sizeof(void *) =
: 0;
> > +     exec->max_objects =3D exec->objects ? sz / sizeof(void *) : 0;
> >       exec->num_objects =3D 0;
> >       exec->contended =3D DRM_EXEC_DUMMY;
> >       exec->prelocked =3D NULL;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/n=
ouveau/nouveau_exec.c
> > index 19024ce21fbb..f5930cc0b3fb 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> > @@ -103,7 +103,7 @@ nouveau_exec_job_submit(struct nouveau_job *job)
> >
> >       nouveau_uvmm_lock(uvmm);
> >       drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> > -                         DRM_EXEC_IGNORE_DUPLICATES);
> > +                         DRM_EXEC_IGNORE_DUPLICATES, 0);
> >       drm_exec_until_all_locked(exec) {
> >               struct drm_gpuva *va;
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> > index aae780e4a4aa..3a9331a1c830 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -1288,7 +1288,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *=
job)
> >       }
> >
> >       drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> > -                         DRM_EXEC_IGNORE_DUPLICATES);
> > +                         DRM_EXEC_IGNORE_DUPLICATES, 0);
> >       drm_exec_until_all_locked(exec) {
> >               list_for_each_op(op, &bind_job->ops) {
> >                       struct drm_gpuva_op *va_op;
> > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > index b5bf0b6da791..f1a66c048721 100644
> > --- a/include/drm/drm_exec.h
> > +++ b/include/drm/drm_exec.h
> > @@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm=
_exec *exec)
> >       return !!exec->contended;
> >   }
> >
> > -void drm_exec_init(struct drm_exec *exec, uint32_t flags);
> > +void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr)=
;
> >   void drm_exec_fini(struct drm_exec *exec);
> >   bool drm_exec_cleanup(struct drm_exec *exec);
> >   int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *o=
bj);
>
