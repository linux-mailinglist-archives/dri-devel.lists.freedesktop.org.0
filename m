Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FBE829CE5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 15:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5B110E5F9;
	Wed, 10 Jan 2024 14:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7210E5F9;
 Wed, 10 Jan 2024 14:55:07 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd61dd39d9so26778341fa.2; 
 Wed, 10 Jan 2024 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704898506; x=1705503306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OgyR+ukWv0ZDFT7MD1S3e5qHTjIQxas4XOabhlAMc4=;
 b=B4UqzZv+HIdsjVNEkDainm0OZ9EFUMMBOpuiQhgdZEpUgvL5Sd+gLFp03Buh+8h1oi
 sv08ikEUEb0oGVQFD3We/+eK9l4CUsKeSEI4JHKCfZJrgz7aczUNMbP3iI9HiOC87PBx
 ZZdQeBLBGZd4NErrou6umdyOMgQ1A5O4yYwEwvgnjI5g8b+9HkepzOr4gMT6qBCpDxnb
 EWxg3n8JuaRlb9EkFOlq0IaqRCIJPWX7aKM63CVNzcIm7QGhnZNbIXBvlaijUXDphrCP
 ZO0J/vQqK9FqyxBqacoRqJHacgoOUlTTM8iprFHwCm0dwAEkBRUGd37ZYqahtrswCFLh
 JNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704898506; x=1705503306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OgyR+ukWv0ZDFT7MD1S3e5qHTjIQxas4XOabhlAMc4=;
 b=j+sKu3e4n+lmRtcioGsBITK5FzZoJOJafBErMW057jGSC8r/jaLnj0E9fgsdOLzAdD
 YEpoEK2/zwOVL3HaXaKsDmkxUjBHFYA9mrozBigDSVZkrPuoSaL+/9jMSif/9ctNB6Vl
 Kg3WnbzvMWIdGbCWPe95PCxk6t1jng3Z/Khaz4E1ag1LNazK14UEB491DiVAV4MynaYu
 1y4tJOuBuu9cJSO0unWYg8hRTleQwgxDlGqh1GHClbpIMnWnitDoYU2JN4q0F3EgftuK
 oZmf8EJh7lW34ef675StJ6PbCgcXabclKxY7QGhrb/2RQSKwyFO8aD3gXCh1CKJrVuAo
 6FzA==
X-Gm-Message-State: AOJu0YykBqKHRFFkQYsBhaOTUrMYw8Agv87BlrUC/pE738U2c7NeJPK7
 lGbcxCFLbWZEq6EP8NtvvaIiqfno4JIjvMUx4IM=
X-Google-Smtp-Source: AGHT+IH5zqO057mcocJ4I+GZxwLsrDWD8i7g35DwdFAwR9pfBQNmh3d7p+YMnEe0KuudH+4klSpSupj07kho3Jh0HfQ=
X-Received: by 2002:a2e:9dd8:0:b0:2cd:16fe:da17 with SMTP id
 x24-20020a2e9dd8000000b002cd16feda17mr609164ljj.71.1704898505430; Wed, 10 Jan
 2024 06:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20240109182218.193804-1-robdclark@gmail.com>
 <ZZ52YNc-TkeG7PZO@phenom.ffwll.local>
In-Reply-To: <ZZ52YNc-TkeG7PZO@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Jan 2024 06:54:53 -0800
Message-ID: <CAF6AEGusfKGou-=4y4CDd99x6TgJ1ZhAmnKwQJs1k6s8Bu07SQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/gpu: Push gpu lock down past runpm"
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
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

On Wed, Jan 10, 2024 at 2:50=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Jan 09, 2024 at 10:22:17AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This reverts commit abe2023b4cea192ab266b351fd38dc9dbd846df0.
> >
> > Changing the locking order means that scheduler/msm_job_run() can race
> > with the recovery kthread worker, with the result that the GPU gets an
> > extra runpm get when we are trying to power it off.  Leaving the GPU in
> > an unrecovered state.
>
> The recovery kthread is supposed to stop all the relevant schedulers,
> which should remove any possible race conditions. So unless there's more
> going on, or you have your own recovery kthread (don't, reuse the one fro=
m
> the scheduler with your own work items, that's why you can provide that)
> this looks like an incomplete/incorrect explanation ... ?
>
> Slightly confused

msm still uses it's own recovery, which pre-dates the scheduler
conversion.  At one point (a yr or two back?) I started looking at
integrating recovery w/ scheduler.. at the time I think you talked me
out of it, but I don't remember the reason

BR,
-R

> -Sima
>
> >
> > I'll need to come up with a different scheme for appeasing lockdep.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu.c        | 11 +++++------
> >  drivers/gpu/drm/msm/msm_ringbuffer.c |  7 +++++--
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 095390774f22..655002b21b0d 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -751,12 +751,14 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
> >       struct msm_ringbuffer *ring =3D submit->ring;
> >       unsigned long flags;
> >
> > -     pm_runtime_get_sync(&gpu->pdev->dev);
> > +     WARN_ON(!mutex_is_locked(&gpu->lock));
> >
> > -     mutex_lock(&gpu->lock);
> > +     pm_runtime_get_sync(&gpu->pdev->dev);
> >
> >       msm_gpu_hw_init(gpu);
> >
> > +     submit->seqno =3D submit->hw_fence->seqno;
> > +
> >       update_sw_cntrs(gpu);
> >
> >       /*
> > @@ -781,11 +783,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct ms=
m_gem_submit *submit)
> >       gpu->funcs->submit(gpu, submit);
> >       gpu->cur_ctx_seqno =3D submit->queue->ctx->seqno;
> >
> > -     hangcheck_timer_reset(gpu);
> > -
> > -     mutex_unlock(&gpu->lock);
> > -
> >       pm_runtime_put(&gpu->pdev->dev);
> > +     hangcheck_timer_reset(gpu);
> >  }
> >
> >  /*
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm=
/msm_ringbuffer.c
> > index e0ed27739449..548f5266a7d3 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -21,8 +21,6 @@ static struct dma_fence *msm_job_run(struct drm_sched=
_job *job)
> >
> >       msm_fence_init(submit->hw_fence, fctx);
> >
> > -     submit->seqno =3D submit->hw_fence->seqno;
> > -
> >       mutex_lock(&priv->lru.lock);
> >
> >       for (i =3D 0; i < submit->nr_bos; i++) {
> > @@ -35,8 +33,13 @@ static struct dma_fence *msm_job_run(struct drm_sche=
d_job *job)
> >
> >       mutex_unlock(&priv->lru.lock);
> >
> > +     /* TODO move submit path over to using a per-ring lock.. */
> > +     mutex_lock(&gpu->lock);
> > +
> >       msm_gpu_submit(gpu, submit);
> >
> > +     mutex_unlock(&gpu->lock);
> > +
> >       return dma_fence_get(submit->hw_fence);
> >  }
> >
> > --
> > 2.43.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
