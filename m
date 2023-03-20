Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C45396C22C0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7B310E65E;
	Mon, 20 Mar 2023 20:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AEE10E65E;
 Mon, 20 Mar 2023 20:32:54 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bf30so3118451oib.12;
 Mon, 20 Mar 2023 13:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679344373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PtNLjV7iuzWid1kzKLl77sk4WYUZ8FOv4+N6gzs8sI=;
 b=HeqJeprrNl5/vk7X1eAw7lmrGamJCZjLBSnMVH3QHjezjvIoMR73/Wq8ZzqKOkFB5N
 atRxNwUb3cHURFE7latn17tFQ8yLJkHprLyjdp9Vydlntu+0A5EHB2rJyKtrS1+1y81I
 ukl33H9vCwntemYpjEToqC/v5hhPXFuEq8ZaBA9NaY0FOUXxqpLwP7C1O9cdG1B1DSRC
 PXqRrgbikK/KHC2NlWdIWC9Wmq/rASHk5jI+K7czu3cPa4UzKrykhI9QBV8WWZAtlPPO
 bK9sT7n00/rWO8dSAo1TPubS2mnScaGxD4le5Sb3lmSymjIEnMRn4O6kvifzG6r0IGoz
 oEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679344373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PtNLjV7iuzWid1kzKLl77sk4WYUZ8FOv4+N6gzs8sI=;
 b=ixLJR0RfaYtvb1txp+rEMmp0C0VhzN4z/llVOYYzQxexABmZUmq3RBMXKMVHopjJod
 3+tjDgItPiODvZwFqVPVPgq8Qd5HnyfLanXWQQ6YQFtw8scvFWiPmz86gPh4dm31x41A
 Fu/xZ6uqFipCmIhT5zSmNIHIz4Saw6tcxajsgs2zLX/1NxcbU4W/CrhZnCQl852MrbQ+
 B5elhwXGTWqy1K8wNRaX/R35HAUsLvNmfs2A51YtGoH6zXpUpe8L3aafqO/bVQfAmC0t
 82vKHBkGJ5aU/hGyk5KgQmd6IyJtFI6PD3uXt8TUEmCOCsBs0Dq4Et35+8o8U5Wfyec8
 nAiw==
X-Gm-Message-State: AO0yUKVyra6PDxPdNapwPKzQSK2SZ4FV0EjqgI0ySd2WQtfRmRtgKW1h
 80by2vkgwUIbV5z8N4PQ/qw88Cn3uO5BPuxkhwM=
X-Google-Smtp-Source: AK7set+Z8dm+jxrjXl9udF5iuBLZsy2vXRBn1hk4Q0LgCSqrniaiZyZA8FUks4Jf+kvfsz6lfqPFa4aG1yMoSgx//Zc=
X-Received: by 2002:aca:1009:0:b0:384:1cf9:912e with SMTP id
 9-20020aca1009000000b003841cf9912emr445842oiq.5.1679344373225; Mon, 20 Mar
 2023 13:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230320144356.803762-1-robdclark@gmail.com>
 <20230320144356.803762-2-robdclark@gmail.com>
 <25bd9a77-a703-6eb6-e142-5da9e54754a0@amd.com>
In-Reply-To: <25bd9a77-a703-6eb6-e142-5da9e54754a0@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Mar 2023 13:32:41 -0700
Message-ID: <CAF6AEGuhkEy-RebX76wT+MVYvsArDKmHsqcBcdE95p2bW_zfGg@mail.gmail.com>
Subject: Re: [PATCH v2 01/23] drm/msm: Pre-allocate hw_fence
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 9:52=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 20.03.23 um 15:43 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Avoid allocating memory in job_run() by pre-allocating the hw_fence.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_fence.c      | 12 +++++++++---
> >   drivers/gpu/drm/msm/msm_fence.h      |  3 ++-
> >   drivers/gpu/drm/msm/msm_gem_submit.c |  7 +++++++
> >   drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
> >   4 files changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_=
fence.c
> > index 56641408ea74..bab3d84f1686 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -99,7 +99,7 @@ static const struct dma_fence_ops msm_fence_ops =3D {
> >   };
> >
> >   struct dma_fence *
> > -msm_fence_alloc(struct msm_fence_context *fctx)
> > +msm_fence_alloc(void)
> >   {
> >       struct msm_fence *f;
> >
> > @@ -107,10 +107,16 @@ msm_fence_alloc(struct msm_fence_context *fctx)
> >       if (!f)
> >               return ERR_PTR(-ENOMEM);
> >
> > +     return &f->base;
> > +}
> > +
> > +void
> > +msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx=
)
> > +{
> > +     struct msm_fence *f =3D to_msm_fence(fence);
> > +
> >       f->fctx =3D fctx;
> >
> >       dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
> >                      fctx->context, ++fctx->last_fence);
> > -
> > -     return &f->base;
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_=
fence.h
> > index 7f1798c54cd1..f913fa22d8fe 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.h
> > +++ b/drivers/gpu/drm/msm/msm_fence.h
> > @@ -61,7 +61,8 @@ void msm_fence_context_free(struct msm_fence_context =
*fctx);
> >   bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fen=
ce);
> >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)=
;
> >
> > -struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
> > +struct dma_fence * msm_fence_alloc(void);
> > +void msm_fence_init(struct dma_fence *fence, struct msm_fence_context =
*fctx);
> >
> >   static inline bool
> >   fence_before(uint32_t a, uint32_t b)
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index be4bf77103cd..2570c018b0cb 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -41,6 +41,13 @@ static struct msm_gem_submit *submit_create(struct d=
rm_device *dev,
> >       if (!submit)
> >               return ERR_PTR(-ENOMEM);
> >
> > +     submit->hw_fence =3D msm_fence_alloc();
> > +     if (IS_ERR(submit->hw_fence)) {
> > +             ret =3D PTR_ERR(submit->hw_fence);
> > +             kfree(submit);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> >       ret =3D drm_sched_job_init(&submit->base, queue->entity, queue);
> >       if (ret) {
> >               kfree(submit);
>
> You probably need some error handling here or otherwise leak
> submit->hw_fence.

ah, right.. thx

BR,
-R

> Apart from that looks good to me.
>
> Christian.
>
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm=
/msm_ringbuffer.c
> > index 57a8e9564540..a62b45e5a8c3 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched=
_job *job)
> >       struct msm_gpu *gpu =3D submit->gpu;
> >       int i;
> >
> > -     submit->hw_fence =3D msm_fence_alloc(fctx);
> > +     msm_fence_init(submit->hw_fence, fctx);
> >
> >       for (i =3D 0; i < submit->nr_bos; i++) {
> >               struct drm_gem_object *obj =3D &submit->bos[i].obj->base;
>
