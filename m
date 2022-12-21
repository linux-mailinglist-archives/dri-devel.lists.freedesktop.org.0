Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD586533A1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AFE10E460;
	Wed, 21 Dec 2022 15:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5810E463
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:47:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h16so15309272wrz.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czXJ/HrW2homsuHKuiwsuf7SXD5dr8Z73kLIwSlA0sk=;
 b=rnGw/tT6TXDqcRNdM5zEsdTyaAeyTFFg20fGNSCrBWfr4EXqZY1uF2eXUwz7MuLN29
 8l6+FAhIA/gzyu7EEA/bbBCL6BHCrUTu470+/EwMOhF/NuVBE7sqwmDkt0MNZwpKdHm3
 zSnH/4UkbvCNk6f2WPGawyE6WAmOcmKwvDx+sFHKohxR0Q+4sQt3zN4RLnoPTou1JYIg
 isqOi5nLDykIu9uaiNuyGc568HTSLNO4C6r1qGar55PJa7+Z7oJIPlMk2sTEsuq/M1RV
 V537pzaPpZFM+kXFQgL2rQ8cCmPwk9Ij9gBN1mHf2Bg0csrJEUD0P0LDbd/OWajG5oAe
 7WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czXJ/HrW2homsuHKuiwsuf7SXD5dr8Z73kLIwSlA0sk=;
 b=jOc4ecRq0Eb0qFIXmaNMeRmCMSv9K5qPuqPpQieFN5QUqog4XD+8Asfjol0miV1p/J
 7vnDYOUx+VHNzIxXU9x49XLn9QaQyvDlTsFO1DL7SDxaBZpKTyyH84xTV/Y0FEhafq/9
 N+M7mX2X5MbJLFokSZ6KuwhTY6a5+mBS9hDGgM6GClbDan0oUO/99R5TCyMZV+Gv2Ku9
 A+bkmBbd27cWD+TPtBFBxMkFxfgNjSC4I9aZK2H94ivld5YR43GZR6lIixPcOjFQw+20
 kiTMrLWOLyKOpRY4Cv6hAAtn8ZgfFJ5DUwLME8W6pYWC/tjG4jmjwOZSPSq0KY81uS2G
 gHRw==
X-Gm-Message-State: AFqh2kq790RVLugYX5Ec/PBBWbm2tAd/HEy47kgvzwr3Ch+tPTUrXnUX
 nruLD6cWBJsYwn7DdKoS4zvs0OOx6bNbS9ZJk75ERA==
X-Google-Smtp-Source: AMrXdXsifGoL7val/Ogkzq0C/A/T5kfNQdzpPRAd0AxqoSQrs4GQ1DVq5PSSZovm+GglJZCwwGP0kId2GAnOFA7H1RY=
X-Received: by 2002:a5d:624b:0:b0:242:4c45:d32d with SMTP id
 m11-20020a5d624b000000b002424c45d32dmr53837wrv.428.1671637662928; Wed, 21 Dec
 2022 07:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-11-christian.koenig@amd.com>
 <CAHbf0-GPVQ4tRgtOLUkP8TW4T9+XGuQQQ70h-DoW9GhspWCa=w@mail.gmail.com>
In-Reply-To: <CAHbf0-GPVQ4tRgtOLUkP8TW4T9+XGuQQQ70h-DoW9GhspWCa=w@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 21 Dec 2022 15:47:31 +0000
Message-ID: <CAHbf0-HBua0Pu-dcGJ4mgsAr-2-nFxt2+NG1ZeaDZhfuEytbtg@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: use scheduler depenencies for CS
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
Cc: luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://gitlab.freedesktop.org/drm/amd/-/issues/2309

On Wed, 21 Dec 2022 at 15:34, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> On Fri, 14 Oct 2022 at 09:47, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Entirely remove the sync obj in the job.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
> >  4 files changed, 13 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index d45b86bcf7fa..0528c2b1db6e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -426,7 +426,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_=
cs_parser *p,
> >                         dma_fence_put(old);
> >                 }
> >
> > -               r =3D amdgpu_sync_fence(&p->gang_leader->sync, fence);
> > +               r =3D amdgpu_sync_fence(&p->sync, fence);
> >                 dma_fence_put(fence);
> >                 if (r)
> >                         return r;
> > @@ -448,7 +448,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amd=
gpu_cs_parser *p,
> >                 return r;
> >         }
> >
> > -       r =3D amdgpu_sync_fence(&p->gang_leader->sync, fence);
> > +       r =3D amdgpu_sync_fence(&p->sync, fence);
> >         if (r)
> >                 goto error;
> >
> > @@ -1108,7 +1108,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs=
_parser *p)
> >         if (r)
> >                 return r;
> >
> > -       r =3D amdgpu_sync_fence(&job->sync, fpriv->prt_va->last_pt_upda=
te);
> > +       r =3D amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update=
);
> >         if (r)
> >                 return r;
> >
> > @@ -1119,7 +1119,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs=
_parser *p)
> >                 if (r)
> >                         return r;
> >
> > -               r =3D amdgpu_sync_fence(&job->sync, bo_va->last_pt_upda=
te);
> > +               r =3D amdgpu_sync_fence(&p->sync, bo_va->last_pt_update=
);
> >                 if (r)
> >                         return r;
> >         }
> > @@ -1138,7 +1138,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs=
_parser *p)
> >                 if (r)
> >                         return r;
> >
> > -               r =3D amdgpu_sync_fence(&job->sync, bo_va->last_pt_upda=
te);
> > +               r =3D amdgpu_sync_fence(&p->sync, bo_va->last_pt_update=
);
> >                 if (r)
> >                         return r;
> >         }
> > @@ -1151,7 +1151,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs=
_parser *p)
> >         if (r)
> >                 return r;
> >
> > -       r =3D amdgpu_sync_fence(&job->sync, vm->last_update);
> > +       r =3D amdgpu_sync_fence(&p->sync, vm->last_update);
> >         if (r)
> >                 return r;
> >
> > @@ -1183,7 +1183,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs=
_parser *p)
> >  static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
> >  {
> >         struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
> > -       struct amdgpu_job *leader =3D p->gang_leader;
> >         struct amdgpu_bo_list_entry *e;
> >         unsigned int i;
> >         int r;
> > @@ -1195,14 +1194,14 @@ static int amdgpu_cs_sync_rings(struct amdgpu_c=
s_parser *p)
> >
> >                 sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> >                         AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
> > -               r =3D amdgpu_sync_resv(p->adev, &leader->sync, resv, sy=
nc_mode,
> > +               r =3D amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mo=
de,
> >                                      &fpriv->vm);
> >                 if (r)
> >                         return r;
> >         }
> >
> > -       for (i =3D 0; i < p->gang_size - 1; ++i) {
> > -               r =3D amdgpu_sync_clone(&leader->sync, &p->jobs[i]->syn=
c);
> > +       for (i =3D 0; i < p->gang_size; ++i) {
> > +               r =3D amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
> >                 if (r)
> >                         return r;
> >         }
> > @@ -1248,7 +1247,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_pars=
er *p,
> >                 struct dma_fence *fence;
> >
> >                 fence =3D &p->jobs[i]->base.s_fence->scheduled;
> > -               r =3D amdgpu_sync_fence(&leader->sync, fence);
> > +               r =3D drm_sched_job_add_dependency(&leader->base, fence=
);
> >                 if (r)
> >                         goto error_cleanup;
> >         }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.h
> > index cbaa19b2b8a3..207e801c24ed 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> > @@ -75,6 +75,8 @@ struct amdgpu_cs_parser {
> >
> >         unsigned                        num_post_deps;
> >         struct amdgpu_cs_post_dep       *post_deps;
> > +
> > +       struct amdgpu_sync              sync;
> >  };
> >
> >  int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index ba98d65835b4..b8494c3b3b8a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -106,7 +106,6 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, st=
ruct amdgpu_vm *vm,
> >         (*job)->base.sched =3D &adev->rings[0]->sched;
> >         (*job)->vm =3D vm;
> >
> > -       amdgpu_sync_create(&(*job)->sync);
> >         amdgpu_sync_create(&(*job)->explicit_sync);
> >         (*job)->vram_lost_counter =3D atomic_read(&adev->vram_lost_coun=
ter);
> >         (*job)->vm_pd_addr =3D AMDGPU_BO_INVALID_OFFSET;
> > @@ -174,9 +173,7 @@ static void amdgpu_job_free_cb(struct drm_sched_job=
 *s_job)
> >
> >         drm_sched_job_cleanup(s_job);
> >
> > -       amdgpu_sync_free(&job->sync);
> >         amdgpu_sync_free(&job->explicit_sync);
> > -
> >         dma_fence_put(&job->hw_fence);
> >  }
> >
> > @@ -202,7 +199,6 @@ void amdgpu_job_free(struct amdgpu_job *job)
> >                 drm_sched_job_cleanup(&job->base);
> >
> >         amdgpu_job_free_resources(job);
> > -       amdgpu_sync_free(&job->sync);
> >         amdgpu_sync_free(&job->explicit_sync);
> >         if (job->gang_submit !=3D &job->base.s_fence->scheduled)
> >                 dma_fence_put(job->gang_submit);
> > @@ -246,10 +242,9 @@ amdgpu_job_dependency(struct drm_sched_job *sched_=
job,
> >  {
> >         struct amdgpu_ring *ring =3D to_amdgpu_ring(s_entity->rq->sched=
);
> >         struct amdgpu_job *job =3D to_amdgpu_job(sched_job);
> > -       struct dma_fence *fence;
> > +       struct dma_fence *fence =3D NULL;
> >         int r;
> >
> > -       fence =3D amdgpu_sync_get_fence(&job->sync);
> >         while (fence =3D=3D NULL && job->vm && !job->vmid) {
> >                 r =3D amdgpu_vmid_grab(job->vm, ring, job, &fence);
> >                 if (r)
> > @@ -273,8 +268,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_=
sched_job *sched_job)
> >         job =3D to_amdgpu_job(sched_job);
> >         finished =3D &job->base.s_fence->finished;
> >
> > -       BUG_ON(amdgpu_sync_peek_fence(&job->sync, NULL));
> > -
> >         trace_amdgpu_sched_run_job(job);
> >
> >         /* Skip job if VRAM is lost and never resubmit gangs */
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.h
> > index 9c10b9bd0084..6558839fda03 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > @@ -47,7 +47,6 @@ enum amdgpu_ib_pool_type;
> >  struct amdgpu_job {
> >         struct drm_sched_job    base;
> >         struct amdgpu_vm        *vm;
> > -       struct amdgpu_sync      sync;
> >         struct amdgpu_sync      explicit_sync;
> >         struct dma_fence        hw_fence;
> >         struct dma_fence        *gang_submit;
> > --
> > 2.25.1
> >
>
> Hi, I've been testing the Mesh shader benchmark in GravityMark and
> I've bisected my laptop freezing up and rebooting, to this commit
>
> 1728baa7e4e60054bf13dd9b1212d133cbd53b3f is the first bad commit
> commit 1728baa7e4e60054bf13dd9b1212d133cbd53b3f
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Thu Sep 29 14:04:01 2022 +0200
>
>    drm/amdgpu: use scheduler dependencies for CS
>
>    Entirely remove the sync obj in the job.
>
>    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>    Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>    Link: https://patchwork.freedesktop.org/patch/msgid/20221014084641.128=
280-11-christian.koenig@amd.com
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
> drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
> drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
> 4 files changed, 13 insertions(+), 20 deletions(-)
>
> This is on a prime system 6800M with the latest mesa
>
> I tried reverting this patch however it didn't revert cleanly, and my
> attempt doesn't work and only partially freezes up the system
>
> Would you like me to open a bug for this on
> https://gitlab.freedesktop.org/drm/amd/-/issues ?
>
> Cheers
>
> Mike
