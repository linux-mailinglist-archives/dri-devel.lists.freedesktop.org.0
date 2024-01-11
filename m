Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384A82B07B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A162110E967;
	Thu, 11 Jan 2024 14:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3710E952
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:19:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5578cb9645bso1484908a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 06:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704982751; x=1705587551; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xSSxh+RPIUMZKMpTsr13zKkvmGosyi4C4sKFagTsfmM=;
 b=P3QPDU5/yQnL83vk+PKIIogP1n9xnj9jcpVnymcYtEIXGlE+vStppLwRlcw6DQaVOJ
 xwaZycvPS2iZWruohMCReD1s0GaNvQIgnTMPaOL0Xart0Qbu3E/n9ZPnw83R9JmtlC/J
 Lq9NY1jURduTAwjB8hBTS1RV/N4Ofq+Q5LFys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704982751; x=1705587551;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSSxh+RPIUMZKMpTsr13zKkvmGosyi4C4sKFagTsfmM=;
 b=nZTaFpAuDAmqa++MVzi6FNu/3Kk0aYkh8OXLyakHekPq1yeLG0c+8B1RWstQPu4r5F
 R5g/qsYvkMa+/OLxHsPZ1oq7n4QAQu9dXYrlTGD7gaMAttGflkk9QX3nArmG5uxX+FkQ
 4CXyL5+9lPgrzAgOaG5YiXRBoDPFDt/a6DqodA+eDs09vhJGpUsanyICUIxiPBVSH0EF
 s8sATRCYgJLFS8EH2Ehpwh6/bl7RN7BU74xNU3s5ketT69fVJA6KbsU0m+DoiVqeaRnO
 FfEJzhxnTsYCyVogZlDm7EGU3vzdzM+HDjJsEY9RCKazImydlj7S9wJQCcp6VolKAg4S
 MNSg==
X-Gm-Message-State: AOJu0Yx9X5KwxczzM1V5nz7xkJpb3Vrl9dejQEbmBy5ipkmC9w7kThlT
 00Jt5Sn5f/YBteGXSWyF6tSoL9H/divRbg==
X-Google-Smtp-Source: AGHT+IGQ8fkDdCLHmesvwOHSP1dlFaJi+Z27VHbTiwHplTSFM3BRzT5PNoP5kBL6v+Aokke4yw99vQ==
X-Received: by 2002:a17:907:96a1:b0:a26:d233:80b0 with SMTP id
 hd33-20020a17090796a100b00a26d23380b0mr1600615ejc.0.1704982750749; 
 Thu, 11 Jan 2024 06:19:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 mb3-20020a170906eb0300b00a28956cf75esm629228ejb.130.2024.01.11.06.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 06:19:10 -0800 (PST)
Date: Thu, 11 Jan 2024 15:19:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/gpu: Push gpu lock down past runpm"
Message-ID: <ZZ_43N6OtvgClc8Y@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240109182218.193804-1-robdclark@gmail.com>
 <ZZ52YNc-TkeG7PZO@phenom.ffwll.local>
 <CAF6AEGusfKGou-=4y4CDd99x6TgJ1ZhAmnKwQJs1k6s8Bu07SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGusfKGou-=4y4CDd99x6TgJ1ZhAmnKwQJs1k6s8Bu07SQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 06:54:53AM -0800, Rob Clark wrote:
> On Wed, Jan 10, 2024 at 2:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Jan 09, 2024 at 10:22:17AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This reverts commit abe2023b4cea192ab266b351fd38dc9dbd846df0.
> > >
> > > Changing the locking order means that scheduler/msm_job_run() can race
> > > with the recovery kthread worker, with the result that the GPU gets an
> > > extra runpm get when we are trying to power it off.  Leaving the GPU in
> > > an unrecovered state.
> >
> > The recovery kthread is supposed to stop all the relevant schedulers,
> > which should remove any possible race conditions. So unless there's more
> > going on, or you have your own recovery kthread (don't, reuse the one from
> > the scheduler with your own work items, that's why you can provide that)
> > this looks like an incomplete/incorrect explanation ... ?
> >
> > Slightly confused
> 
> msm still uses it's own recovery, which pre-dates the scheduler
> conversion.  At one point (a yr or two back?) I started looking at
> integrating recovery w/ scheduler.. at the time I think you talked me
> out of it, but I don't remember the reason

hm ... most scheduler discussions I remember was around the "allocate your
own workqueue and hand that to scheduler to avoid races/deadlocks". Which
iirc Boris implemented a while ago. Once you have that workqueue you can
then also process any other error condition on there with the exact same
locking design (like hw error or page faults or whatever), not just
drm/sched tdr.

I don't remember anything else that ever came up at least at a fundamental
level ...

So if that discussion was older than 78efe21b6f8e ("drm/sched: Allow using
a dedicated workqueue for the timeout/fault tdr") you should be covered.
Fingers crossed :-)

Meanwhile if you do not use drm/sched tdr at all then doing the exact same
design but just on your own workqueue should also work. The critical thing
is really only:
- have one single-thread workqueue for all gpu recover
- bracket each handler in there with drm_sched_stop/start for all affected
  engines

No more races!

Cheers, Sima

> 
> BR,
> -R
> 
> > -Sima
> >
> > >
> > > I'll need to come up with a different scheme for appeasing lockdep.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gpu.c        | 11 +++++------
> > >  drivers/gpu/drm/msm/msm_ringbuffer.c |  7 +++++--
> > >  2 files changed, 10 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > index 095390774f22..655002b21b0d 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -751,12 +751,14 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > >       struct msm_ringbuffer *ring = submit->ring;
> > >       unsigned long flags;
> > >
> > > -     pm_runtime_get_sync(&gpu->pdev->dev);
> > > +     WARN_ON(!mutex_is_locked(&gpu->lock));
> > >
> > > -     mutex_lock(&gpu->lock);
> > > +     pm_runtime_get_sync(&gpu->pdev->dev);
> > >
> > >       msm_gpu_hw_init(gpu);
> > >
> > > +     submit->seqno = submit->hw_fence->seqno;
> > > +
> > >       update_sw_cntrs(gpu);
> > >
> > >       /*
> > > @@ -781,11 +783,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > >       gpu->funcs->submit(gpu, submit);
> > >       gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
> > >
> > > -     hangcheck_timer_reset(gpu);
> > > -
> > > -     mutex_unlock(&gpu->lock);
> > > -
> > >       pm_runtime_put(&gpu->pdev->dev);
> > > +     hangcheck_timer_reset(gpu);
> > >  }
> > >
> > >  /*
> > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > index e0ed27739449..548f5266a7d3 100644
> > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > @@ -21,8 +21,6 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
> > >
> > >       msm_fence_init(submit->hw_fence, fctx);
> > >
> > > -     submit->seqno = submit->hw_fence->seqno;
> > > -
> > >       mutex_lock(&priv->lru.lock);
> > >
> > >       for (i = 0; i < submit->nr_bos; i++) {
> > > @@ -35,8 +33,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
> > >
> > >       mutex_unlock(&priv->lru.lock);
> > >
> > > +     /* TODO move submit path over to using a per-ring lock.. */
> > > +     mutex_lock(&gpu->lock);
> > > +
> > >       msm_gpu_submit(gpu, submit);
> > >
> > > +     mutex_unlock(&gpu->lock);
> > > +
> > >       return dma_fence_get(submit->hw_fence);
> > >  }
> > >
> > > --
> > > 2.43.0
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
