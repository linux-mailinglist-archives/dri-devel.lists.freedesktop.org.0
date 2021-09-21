Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E311E4136A7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 17:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5846EA64;
	Tue, 21 Sep 2021 15:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDE66EA5B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:53:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q26so40576359wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d4eQmrNAVl39PalM5fwhXxM88NUL3ePE+A2JPS57N4w=;
 b=ef8rubMr6Nid+b3nkLu3G1Xd64Haez5FeHv5/hc8yJNu74Pu1zy1pWRBfBYcj9PJgq
 EPrIQkk0QpsYERNoGBHdcH1D7To3hyddndsUvirsRB78UetcnoVk01S5a8ve9WPpT5pd
 a4YXbk/j6oXyIn39LnUp76KDyGpfz/BU1Ftkm6WiWJwLnTDH1E17TZ7LGmldJFGRGXuU
 Af7R8sYG6mdl7xC1PzilwjdypS95czOs+X8tOS63E1npNUHjDvB6TCNANML6BQLL1WgI
 3KcJtDliJmanMlELMDX98rK6h5zyEvBKK3upePRBffH8WfOZeq4MlF/ol/tw5xbzd02k
 4AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d4eQmrNAVl39PalM5fwhXxM88NUL3ePE+A2JPS57N4w=;
 b=Tn5AiFeCyja0HO1YTwvcJYN7d12kKnaKj0pew0dDLphcauqlABZCXHXS3L1oO3py4m
 sc7ekEwl6fEkiEOGVk1+Sey7oTR6Qem7CeCgdqdlbsxH0Yef5q1ppp8XyAQ/4S6KmZAM
 lNaDfScsWu2NyDiGI+Z8gXnqsc0AExLPFFVb3XAhQ5XDyD6uPUES1jiUYMqy6b7d3PNZ
 N3CoqC/QcCOR1V78oVTMMHAJvGvQvSHy71qVqb2A4L8syPcaU5F5s3CJLjR1S7MKjlvx
 1WXzAeWNdQWXE8nkzOpPKyeCSyuWIKoBYTs87pEJhCAAa5GbOCxOk7ByvALvJLx2szzD
 xnFg==
X-Gm-Message-State: AOAM530mZ/c+2C++lR0icSU1SqHMx/7bWWlDxCiWUb7pCL/+qHGRe0cL
 Sz0cFL8ss1P1xWes+EhCiOSl6ML0E+T5WJII9e0=
X-Google-Smtp-Source: ABdhPJxa8WEFU1tumRmQJ7/8JtnY18IcnRj9pLNairKRoGtyxhlxZkDIP69UhdnWh8W/D79PWE9EzVdOF2+YEYoXlrU=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr5441796wmq.151.1632239579021; 
 Tue, 21 Sep 2021 08:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <YTj2scNdCHAdF+cl@phenom.ffwll.local>
In-Reply-To: <YTj2scNdCHAdF+cl@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Sep 2021 08:57:30 -0700
Message-ID: <CAF6AEGvHQHbOP65jq53WEuJc9uxReOFMyXUN--JjjcB1FxHSCw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>, 
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jack Zhang <Jack.Zhang1@amd.com>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 8, 2021 at 10:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Sep 03, 2021 at 11:47:55AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > As the finished fence is the one that is exposed to userspace, and
> > therefore the one that other operations, like atomic update, would
> > block on, we need to propagate the deadline from from the finished
> > fence to the actual hw fence.
> >
> > v2: Split into drm_sched_fence_set_parent() (ckoenig)
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
> >  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> >  include/drm/gpu_scheduler.h             |  8 ++++++
> >  3 files changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index bcea035cf4c6..4fc41a71d1c7 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> >       dma_fence_put(&fence->scheduled);
> >  }
> >
> > +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> > +                                               ktime_t deadline)
> > +{
> > +     struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&fence->lock, flags);
> > +
> > +     /* If we already have an earlier deadline, keep it: */
> > +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> > +         ktime_before(fence->deadline, deadline)) {
> > +             spin_unlock_irqrestore(&fence->lock, flags);
> > +             return;
> > +     }
> > +
> > +     fence->deadline = deadline;
> > +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> > +
> > +     spin_unlock_irqrestore(&fence->lock, flags);
> > +
> > +     if (fence->parent)
> > +             dma_fence_set_deadline(fence->parent, deadline);
> > +}
> > +
> >  static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> >       .get_driver_name = drm_sched_fence_get_driver_name,
> >       .get_timeline_name = drm_sched_fence_get_timeline_name,
> > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> >       .get_driver_name = drm_sched_fence_get_driver_name,
> >       .get_timeline_name = drm_sched_fence_get_timeline_name,
> >       .release = drm_sched_fence_release_finished,
> > +     .set_deadline = drm_sched_fence_set_deadline_finished,
> >  };
> >
> >  struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> >  }
> >  EXPORT_SYMBOL(to_drm_sched_fence);
> >
> > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > +                             struct dma_fence *fence)
> > +{
> > +     s_fence->parent = dma_fence_get(fence);
> > +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > +                  &s_fence->finished.flags))
>
> Don't you need the spinlock here too to avoid races? test_bit is very
> unordered, so guarantees nothing. Spinlock would need to be both around
> ->parent = and the test_bit.
>
> Entirely aside, but there's discussions going on to preallocate the hw
> fence somehow. If we do that we could make the deadline forwarding
> lockless here. Having a spinlock just to set the parent is a bit annoying
> ...
>
> Alternative is that you do this locklessly with barriers and a _lot_ of
> comments. Would be good to benchmark whether the overhead matters though
> first.

So, my thinking is that very few (well no) guarantees are made to the
fence implementor that their ->set_deadline() is not called multiple
times, from multiple threads, etc.  And no guarantee that a later
deadline is set after an earlier deadline has been set.  It is all up
to the set_deadline() implementation to deal with these cases.

So that means we just need the appropriate barrier-fu to ensure
another thread calling drm_sched_fence_set_deadline_finished() sees
fence->parent set before the test_bit.  It could mean that the backend
implementation sees the same deadline set twice, but that is fine.

BR,
-R

> -Daniel
>
> > +             dma_fence_set_deadline(fence, s_fence->deadline);
> > +}
> > +
> >  struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> >                                             void *owner)
> >  {
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 595e47ff7d06..27bf0ac0625f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
> >               drm_sched_fence_scheduled(s_fence);
> >
> >               if (!IS_ERR_OR_NULL(fence)) {
> > -                     s_fence->parent = dma_fence_get(fence);
> > +                     drm_sched_fence_set_parent(s_fence, fence);
> >                       r = dma_fence_add_callback(fence, &sched_job->cb,
> >                                                  drm_sched_job_done_cb);
> >                       if (r == -ENOENT)
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 7f77a455722c..158ddd662469 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -238,6 +238,12 @@ struct drm_sched_fence {
> >           */
> >       struct dma_fence                finished;
> >
> > +     /**
> > +      * @deadline: deadline set on &drm_sched_fence.finished which
> > +      * potentially needs to be propagated to &drm_sched_fence.parent
> > +      */
> > +     ktime_t                         deadline;
> > +
> >          /**
> >           * @parent: the fence returned by &drm_sched_backend_ops.run_job
> >           * when scheduling the job on hardware. We signal the
> > @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >                                  enum drm_sched_priority priority);
> >  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > +                             struct dma_fence *fence);
> >  struct drm_sched_fence *drm_sched_fence_alloc(
> >       struct drm_sched_entity *s_entity, void *owner);
> >  void drm_sched_fence_init(struct drm_sched_fence *fence,
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
