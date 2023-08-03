Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3F76EF2B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 18:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3252E10E62A;
	Thu,  3 Aug 2023 16:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723D710E629;
 Thu,  3 Aug 2023 16:12:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso1973931e87.1; 
 Thu, 03 Aug 2023 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691079131; x=1691683931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zb5QRjoHiRuzsZWLd73Sa374ztuCT4nbt0PPC2deMs=;
 b=IECXfRuznXKzZj+BJjQGxqwsZ62iupa3DpbkEUgpMZ1HUFbBgw/fjin22AkmBd6H95
 HET12v6w5d67/cd9Kcv4C5jI6jbpM1xrOBTfNP5q4QJWq5Y75CYsrHQc2Vuk3i3Wf/5z
 VvvAxJqcXwrM4iLfRYtiFgfrWvZEgHtcgXOOrmRQIdmWjgxfgEEhv8WkmXbWhzChEeAQ
 nal8pR1KXF7aky2w3PIm4LSK48zv0NR5nF1WyzyFAzyFUjp0fiRMahSuL3FK072lU6M/
 CIG3zOnq5JiEt0zDJnLvCIPhBuu8EXjlbqiuau5VlIv/LKzbi6yG2BIKozjJ6LwO0Ae8
 Hq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691079131; x=1691683931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zb5QRjoHiRuzsZWLd73Sa374ztuCT4nbt0PPC2deMs=;
 b=bAunGw2CNIpiHpsXYsE87Q83F2h3LZ6RVQ4VvRXHDNRwjhy8NL7nmsbVa1aZEoyz6K
 nsYS5xOJCM0pxeft7o8T14qkRHTxkhCrJkcFdliUxYh9rvaXXz9Nr9WRyI3pEsItKnKz
 OOgzJnat5zlmJ5CID/g08elO6zyYNLo6fIDlItKfIfxOsRFFLdF4CernxkYh6srEKEKK
 MaHtLL2GhLBFTfzPWXh2GZxkY4vangOqS/WHAObCsao8+7D4OcqkMSNvfLLrG7dC4hFP
 3IFdnubEbBoz5nca0aihkm+NP3FXECQZr4GxadAdQylCwbn05i7TyY4xnzFxaEKggeb8
 n5Yg==
X-Gm-Message-State: ABy/qLaSCPOuU+8eOknbiC98MDk6IGDdPaKlP1zEYXcGh42GNzfLOOKu
 Uu9h8006k6neygMOT46qiC6fjceGNMuAvB1YEDI=
X-Google-Smtp-Source: APBJJlE6hc0hxsMRjK7BzAUaTf8+51w9X/uiFoKHoIqplR+Q1Op6ePeoqhNF8QJ1HrS75K3K0XUKtSEXHhbS8W2VTAc=
X-Received: by 2002:a19:6402:0:b0:4f8:7734:8dd2 with SMTP id
 y2-20020a196402000000b004f877348dd2mr6260938lfb.53.1691079131252; Thu, 03 Aug
 2023 09:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230802222158.11838-1-robdclark@gmail.com>
 <20230802222158.11838-5-robdclark@gmail.com>
 <ZMtnZgpv4TQtYybA@phenom.ffwll.local>
In-Reply-To: <ZMtnZgpv4TQtYybA@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Aug 2023 09:11:59 -0700
Message-ID: <CAF6AEGt=Z0BfbNEUSXrajUnadMkQKWPRsN3k6Ft0NWOfB5AdqQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm: Remove vma use tracking
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 1:38=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Wed, Aug 02, 2023 at 03:21:52PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This was not strictly necessary, as page unpinning (ie. shrinker) only
> > cares about the resv.  It did give us some extra sanity checking for
> > userspace controlled iova, and was useful to catch issues on kernel and
> > userspace side when enabling userspace iova.  But if userspace screws
> > this up, it just corrupts it's own gpu buffers and/or gets iova faults.
> > So we can just let userspace shoot it's own foot and drop the extra per=
-
> > buffer SUBMIT overhead.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> I did check a few things (like that the gem lru helpers have all the
> needed lockdep_assert_held) and I think aside from the optimization this
> is a nice semantic cleanup. Since iirc we've had a locking inversion
> discussion and the vma tracking here came up as a culprit. On the series:

yup, I try to make sure there are sufficient locking asserts when it
comes to gem stuff ;-)

There shouldn't have been any locking inversion with the vma lock (no
other locks acquired under it) but it was hurting cpu overhead.  The
big remaining locking headache for me is run-pm / pm-qos

BR,
-R

> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c        |  9 +---
> >  drivers/gpu/drm/msm/msm_gem.h        | 12 +----
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 14 ++----
> >  drivers/gpu/drm/msm/msm_gem_vma.c    | 67 +---------------------------
> >  drivers/gpu/drm/msm/msm_ringbuffer.c |  3 +-
> >  5 files changed, 9 insertions(+), 96 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 1c81ff6115ac..ce1ed0f9ad2d 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -607,9 +607,6 @@ static int clear_iova(struct drm_gem_object *obj,
> >       if (!vma)
> >               return 0;
> >
> > -     if (msm_gem_vma_inuse(vma))
> > -             return -EBUSY;
> > -
> >       msm_gem_vma_purge(vma);
> >       msm_gem_vma_close(vma);
> >       del_vma(vma);
> > @@ -660,7 +657,6 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
> >       msm_gem_lock(obj);
> >       vma =3D lookup_vma(obj, aspace);
> >       if (!GEM_WARN_ON(!vma)) {
> > -             msm_gem_vma_unpin(vma);
> >               msm_gem_unpin_locked(obj);
> >       }
> >       msm_gem_unlock(obj);
> > @@ -991,11 +987,10 @@ void msm_gem_describe(struct drm_gem_object *obj,=
 struct seq_file *m,
> >                       } else {
> >                               name =3D comm =3D NULL;
> >                       }
> > -                     seq_printf(m, " [%s%s%s: aspace=3D%p, %08llx,%s,i=
nuse=3D%d]",
> > +                     seq_printf(m, " [%s%s%s: aspace=3D%p, %08llx,%s]"=
,
> >                               name, comm ? ":" : "", comm ? comm : "",
> >                               vma->aspace, vma->iova,
> > -                             vma->mapped ? "mapped" : "unmapped",
> > -                             msm_gem_vma_inuse(vma));
> > +                             vma->mapped ? "mapped" : "unmapped");
> >                       kfree(comm);
> >               }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index 2ddd896aac68..8ddef5443140 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -59,24 +59,16 @@ struct msm_fence_context;
> >
> >  struct msm_gem_vma {
> >       struct drm_mm_node node;
> > -     spinlock_t lock;
> >       uint64_t iova;
> >       struct msm_gem_address_space *aspace;
> >       struct list_head list;    /* node in msm_gem_object::vmas */
> >       bool mapped;
> > -     int inuse;
> > -     uint32_t fence_mask;
> > -     uint32_t fence[MSM_GPU_MAX_RINGS];
> > -     struct msm_fence_context *fctx[MSM_GPU_MAX_RINGS];
> >  };
> >
> >  struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspa=
ce);
> >  int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
> >               u64 range_start, u64 range_end);
> > -bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
> >  void msm_gem_vma_purge(struct msm_gem_vma *vma);
> > -void msm_gem_vma_unpin(struct msm_gem_vma *vma);
> > -void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fenc=
e_context *fctx);
> >  int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table=
 *sgt, int size);
> >  void msm_gem_vma_close(struct msm_gem_vma *vma);
> >
> > @@ -298,15 +290,13 @@ struct msm_gem_submit {
> >  /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
> >  #define BO_VALID     0x8000  /* is current addr in cmdstream correct/v=
alid? */
> >  #define BO_LOCKED    0x4000  /* obj lock is held */
> > -#define BO_OBJ_PINNED        0x2000  /* obj (pages) is pinned and on a=
ctive list */
> > -#define BO_VMA_PINNED        0x1000  /* vma (virtual address) is pinne=
d */
> > +#define BO_PINNED    0x2000  /* obj (pages) is pinned and on active li=
st */
> >               uint32_t flags;
> >               union {
> >                       struct drm_gem_object *obj;
> >                       uint32_t handle;
> >               };
> >               uint64_t iova;
> > -             struct msm_gem_vma *vma;
> >       } bos[];
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index b17561ebd518..5f90cc8e7b7f 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -261,10 +261,7 @@ static void submit_cleanup_bo(struct msm_gem_submi=
t *submit, int i,
> >        */
> >       submit->bos[i].flags &=3D ~cleanup_flags;
> >
> > -     if (flags & BO_VMA_PINNED)
> > -             msm_gem_vma_unpin(submit->bos[i].vma);
> > -
> > -     if (flags & BO_OBJ_PINNED)
> > +     if (flags & BO_PINNED)
> >               msm_gem_unpin_locked(obj);
> >
> >       if (flags & BO_LOCKED)
> > @@ -273,7 +270,7 @@ static void submit_cleanup_bo(struct msm_gem_submit=
 *submit, int i,
> >
> >  static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int =
i)
> >  {
> > -     unsigned cleanup_flags =3D BO_VMA_PINNED | BO_OBJ_PINNED | BO_LOC=
KED;
> > +     unsigned cleanup_flags =3D BO_PINNED | BO_LOCKED;
> >       submit_cleanup_bo(submit, i, cleanup_flags);
> >
> >       if (!(submit->bos[i].flags & BO_VALID))
> > @@ -404,9 +401,6 @@ static int submit_pin_objects(struct msm_gem_submit=
 *submit)
> >               if (ret)
> >                       break;
> >
> > -             submit->bos[i].flags |=3D BO_VMA_PINNED;
> > -             submit->bos[i].vma =3D vma;
> > -
> >               if (vma->iova =3D=3D submit->bos[i].iova) {
> >                       submit->bos[i].flags |=3D BO_VALID;
> >               } else {
> > @@ -420,7 +414,7 @@ static int submit_pin_objects(struct msm_gem_submit=
 *submit)
> >       mutex_lock(&priv->lru.lock);
> >       for (i =3D 0; i < submit->nr_bos; i++) {
> >               msm_gem_pin_obj_locked(submit->bos[i].obj);
> > -             submit->bos[i].flags |=3D BO_OBJ_PINNED;
> > +             submit->bos[i].flags |=3D BO_PINNED;
> >       }
> >       mutex_unlock(&priv->lru.lock);
> >
> > @@ -547,7 +541,7 @@ static void submit_cleanup(struct msm_gem_submit *s=
ubmit, bool error)
> >       unsigned i;
> >
> >       if (error)
> > -             cleanup_flags |=3D BO_VMA_PINNED | BO_OBJ_PINNED;
> > +             cleanup_flags |=3D BO_PINNED;
> >
> >       for (i =3D 0; i < submit->nr_bos; i++) {
> >               struct drm_gem_object *obj =3D submit->bos[i].obj;
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> > index 98287ed99960..11e842dda73c 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -38,41 +38,12 @@ msm_gem_address_space_get(struct msm_gem_address_sp=
ace *aspace)
> >       return aspace;
> >  }
> >
> > -bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
> > -{
> > -     bool ret =3D true;
> > -
> > -     spin_lock(&vma->lock);
> > -
> > -     if (vma->inuse > 0)
> > -             goto out;
> > -
> > -     while (vma->fence_mask) {
> > -             unsigned idx =3D ffs(vma->fence_mask) - 1;
> > -
> > -             if (!msm_fence_completed(vma->fctx[idx], vma->fence[idx])=
)
> > -                     goto out;
> > -
> > -             vma->fence_mask &=3D ~BIT(idx);
> > -     }
> > -
> > -     ret =3D false;
> > -
> > -out:
> > -     spin_unlock(&vma->lock);
> > -
> > -     return ret;
> > -}
> > -
> >  /* Actually unmap memory for the vma */
> >  void msm_gem_vma_purge(struct msm_gem_vma *vma)
> >  {
> >       struct msm_gem_address_space *aspace =3D vma->aspace;
> >       unsigned size =3D vma->node.size;
> >
> > -     /* Print a message if we try to purge a vma in use */
> > -     GEM_WARN_ON(msm_gem_vma_inuse(vma));
> > -
> >       /* Don't do anything if the memory isn't mapped */
> >       if (!vma->mapped)
> >               return;
> > @@ -82,33 +53,6 @@ void msm_gem_vma_purge(struct msm_gem_vma *vma)
> >       vma->mapped =3D false;
> >  }
> >
> > -static void vma_unpin_locked(struct msm_gem_vma *vma)
> > -{
> > -     if (GEM_WARN_ON(!vma->inuse))
> > -             return;
> > -     if (!GEM_WARN_ON(!vma->iova))
> > -             vma->inuse--;
> > -}
> > -
> > -/* Remove reference counts for the mapping */
> > -void msm_gem_vma_unpin(struct msm_gem_vma *vma)
> > -{
> > -     spin_lock(&vma->lock);
> > -     vma_unpin_locked(vma);
> > -     spin_unlock(&vma->lock);
> > -}
> > -
> > -/* Replace pin reference with fence: */
> > -void msm_gem_vma_unpin_fenced(struct msm_gem_vma *vma, struct msm_fenc=
e_context *fctx)
> > -{
> > -     spin_lock(&vma->lock);
> > -     vma->fctx[fctx->index] =3D fctx;
> > -     vma->fence[fctx->index] =3D fctx->last_fence;
> > -     vma->fence_mask |=3D BIT(fctx->index);
> > -     vma_unpin_locked(vma);
> > -     spin_unlock(&vma->lock);
> > -}
> > -
> >  /* Map and pin vma: */
> >  int
> >  msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
> > @@ -120,11 +64,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
> >       if (GEM_WARN_ON(!vma->iova))
> >               return -EINVAL;
> >
> > -     /* Increase the usage counter */
> > -     spin_lock(&vma->lock);
> > -     vma->inuse++;
> > -     spin_unlock(&vma->lock);
> > -
> >       if (vma->mapped)
> >               return 0;
> >
> > @@ -146,9 +85,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
> >
> >       if (ret) {
> >               vma->mapped =3D false;
> > -             spin_lock(&vma->lock);
> > -             vma->inuse--;
> > -             spin_unlock(&vma->lock);
> >       }
> >
> >       return ret;
> > @@ -159,7 +95,7 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
> >  {
> >       struct msm_gem_address_space *aspace =3D vma->aspace;
> >
> > -     GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped);
> > +     GEM_WARN_ON(vma->mapped);
> >
> >       spin_lock(&aspace->lock);
> >       if (vma->iova)
> > @@ -179,7 +115,6 @@ struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_=
address_space *aspace)
> >       if (!vma)
> >               return NULL;
> >
> > -     spin_lock_init(&vma->lock);
> >       vma->aspace =3D aspace;
> >
> >       return vma;
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm=
/msm_ringbuffer.c
> > index 6fa427d2992e..7f5e0a961bba 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -26,9 +26,8 @@ static struct dma_fence *msm_job_run(struct drm_sched=
_job *job)
> >       for (i =3D 0; i < submit->nr_bos; i++) {
> >               struct drm_gem_object *obj =3D submit->bos[i].obj;
> >
> > -             msm_gem_vma_unpin_fenced(submit->bos[i].vma, fctx);
> >               msm_gem_unpin_active(obj);
> > -             submit->bos[i].flags &=3D ~(BO_VMA_PINNED | BO_OBJ_PINNED=
);
> > +             submit->bos[i].flags &=3D ~BO_PINNED;
> >       }
> >
> >       mutex_unlock(&priv->lru.lock);
> > --
> > 2.41.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
