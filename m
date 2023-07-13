Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720F752BA6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 22:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5110E783;
	Thu, 13 Jul 2023 20:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB28310E1A5;
 Thu, 13 Jul 2023 20:28:23 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56352146799so875724eaf.3; 
 Thu, 13 Jul 2023 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689280102; x=1691872102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Np41xAxvHrQ2l3HEYE/iCG+BGK60W/bW25GsC4Ze4Ls=;
 b=MSOZe0a0TCNiUE1J9GHg7gzTxqtD93rIaEv8yH9dG0O3biRqgiRg7eVEoowZABHHq9
 WPOrK4heUc/FQ1PFbE447EoQylZgTAeAhOcMfLTg6I6p+p63MKGMJp03SLN6YkoiXii2
 eCSk1DD/kGt2YtnlpJyAz4rh2h59TrUMK4qdnnZMN1+7MpJCZcBxg6j7ai6VKjcbO5zH
 T3TAb7A2NBZfgknFehq4bMxPTZJlvOJVP1v6w3Sy+MwgLbeo2X3IQ9H1b0ufb18ECM6H
 praDapkx1KgxVKfbcukQLCGoRCqQ96Yt43GuxUxPu/5J3VviEp0bgly3ObOI06UyuMj4
 4UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689280102; x=1691872102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Np41xAxvHrQ2l3HEYE/iCG+BGK60W/bW25GsC4Ze4Ls=;
 b=g9psDO2OxWTGhO6GZVr7xFwM83kNkEQgvxD5njuiuuxe9/WaHxmk3Jw4Ui5KSVGTAQ
 H0pWumOYCpb5tH7aYCslTErs49qYDCmGRZh9mmEyMyO8voxfE+Amjsu2tCcfmxgkfT0Z
 +efgAl38J8bJMLTPfzdmxYclugMmPgaB1hevopWwclpIUr+MjUp3CRMBhZ+kqUIoaGh/
 0KxD6td0CYJtBZGlT9M+4qVr2PvPj3US+i17GMa24T6iC9cOtAGbYeU/MU1sdWtrTLYu
 gl5H0CUCr+b9Zi+AN/cxYaS1xUSxSdePkJ9pH383gw/wWBkPqivHWQhyh+N09EmWCUWZ
 oKBQ==
X-Gm-Message-State: ABy/qLb4H6Yl1F4blMFjC2a83Lz+J1o/+hqJxjt/UGW0sVADuTcaLhmM
 O/spP/biNRD4ub5tavxox/Z9tg6TUwkVlsyH8T8=
X-Google-Smtp-Source: APBJJlFkLJCu3on9g7cCOHvlsrVrWrUeXDOEar9Stl41UAiT2mkrQHSVSwVSH3Ime/iZEma7m4BFCC/oQF/XUe3AW/g=
X-Received: by 2002:a4a:2450:0:b0:560:ac0f:b87c with SMTP id
 v16-20020a4a2450000000b00560ac0fb87cmr2361812oov.8.1689280102445; Thu, 13 Jul
 2023 13:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712222523.7404-1-robdclark@gmail.com>
 <a7aa6e21-6f79-0029-5034-db368239980a@linaro.org>
In-Reply-To: <a7aa6e21-6f79-0029-5034-db368239980a@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Jul 2023 13:28:11 -0700
Message-ID: <CAF6AEGuua3BMY1S4OXxO66eoXchTCOcuFX3t163=d7f7YS2ygw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix hw_fence error path cleanup
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 1:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 13/07/2023 01:25, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In an error path where the submit is free'd without the job being run,
> > the hw_fence pointer is simply a kzalloc'd block of memory.  In this
> > case we should just kfree() it, rather than trying to decrement it's
> > reference count.  Fortunately we can tell that this is the case by
> > checking for a zero refcount, since if the job was run, the submit woul=
d
> > be holding a reference to the hw_fence.
> >
> > Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_fence.c      |  6 ++++++
> >   drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++++++++-
> >   2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_=
fence.c
> > index 96599ec3eb78..1a5d4f1c8b42 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -191,6 +191,12 @@ msm_fence_init(struct dma_fence *fence, struct msm=
_fence_context *fctx)
> >
> >       f->fctx =3D fctx;
> >
> > +     /*
> > +      * Until this point, the fence was just some pre-allocated memory=
,
> > +      * no-one should have taken a reference to it yet.
> > +      */
> > +     WARN_ON(kref_read(&fence->refcount));
>
> It this really correct to return a refcounted object with 0 refcount
> (I'm looking at submit_create() / msm_fence_alloc() )? Maybe it would be
> better to move dma_fence_get() to msm_fence_alloc() ? But don't
> immediately see, which one should be moved.

The issue is that we can't really initialize the fence until
msm_job_run(), when it is known what order the fence would be
signaled.  But we don't want to do any allocations in msm_job_run()
because that could trigger the shrinker, which could need to wait
until jobs complete to release memory, forming a deadlock.

BR,
-R

> > +
> >       dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
> >                      fctx->context, ++fctx->last_fence);
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index 3f1aa4de3b87..9d66498cdc04 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -86,7 +86,19 @@ void __msm_gem_submit_destroy(struct kref *kref)
> >       }
> >
> >       dma_fence_put(submit->user_fence);
> > -     dma_fence_put(submit->hw_fence);
> > +
> > +     /*
> > +      * If the submit is freed before msm_job_run(), then hw_fence is
> > +      * just some pre-allocated memory, not a reference counted fence.
> > +      * Once the job runs and the hw_fence is initialized, it will
> > +      * have a refcount of at least one, since the submit holds a ref
> > +      * to the hw_fence.
> > +      */
> > +     if (kref_read(&submit->hw_fence->refcount) =3D=3D 0) {
> > +             kfree(submit->hw_fence);
> > +     } else {
> > +             dma_fence_put(submit->hw_fence);
> > +     }
> >
> >       put_pid(submit->pid);
> >       msm_submitqueue_put(submit->queue);
>
> --
> With best wishes
> Dmitry
>
