Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFA413B9B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 22:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854FA6E828;
	Tue, 21 Sep 2021 20:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4C26E81B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 20:43:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g16so516869wrb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 13:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vzul5yRUTLnHnOFCPcV81LXr/cWjLmxcbgzbaqAyg2Q=;
 b=DfMqsjFu4rmv9zRca1muvx9wsyw2EbVBr6ny1oBxt1bcKPUp7FPjUtz4f+yo1nq/QB
 5oZ0icfpG+NJtN1PJfRvo6W+0dOQ75L87PElAZIZHa2R3h6uvZQg/x9BClkKBBl1xiGz
 Ne+4CjR7YoHqoAxR/0cNoYmv6KlPs/3L5sVr6zBHZ8wkgubqQFSgPjmJKJtuj8cuxoF2
 fdsgcNUQTWjw9GKL85XgPRV9A+UxrODMqHHWQ+SCGLM3yLK5WRJi1mC7FgvfnTVmbNOI
 s/hG6H15AjA/cW/oGcMs/ODTZFNn+fHpyAJgQvVhMY/WEYWZrLtYkPfIrhRnW4chhXk2
 VKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vzul5yRUTLnHnOFCPcV81LXr/cWjLmxcbgzbaqAyg2Q=;
 b=148oWaBhWGGVRTMvq+Xs2FjqQlY0kz7FBjEqxyxFiWqP+HpRkWqRhruDfV7t068e2u
 JIOCwK4FjCDM2uClbpL6Xkkt63cZrGm8p9Rjn4ZCiFnRSCSxRVnefCvO4t4YNO17dnvC
 54X/kqcP9TrGdkHEAPYXS3SabZJe/TZTHLnuZlNEVqFice8aLqlebWVN0yMaTGMMC2nM
 WxsFpNgSSUleEDijh0HHgegcqgOpgb9KWiWSO/c4TG2QwILJMuixhSiF/bJN30VEn4yP
 N5nu81SSmiJ+/HuAooXKR40kezMOzDrBlIJd2PYLZoeHxIQi75QssR/pzt6dSBJlpn9/
 +UWA==
X-Gm-Message-State: AOAM531dOTmacuh6oXaKeJjHGHEUo5FxSJSUdk9EfDLSKClS0covmbQ3
 iGPJTjT6wlhqjLhkKW1GV1pxuqSTtrLFSPw6VXo=
X-Google-Smtp-Source: ABdhPJwXr+FcsaUpYHcf+fiajcJ2f81yXEvIkiUrlPNounb9B/ygtBabRL/E+IeBxGJCFWajVvJwV1C/Ahm+6Htv+0g=
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr6806280wme.127.1632256997110; 
 Tue, 21 Sep 2021 13:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <101628ea-23c9-4bc0-5abc-a5b71b0fccc1@amd.com>
In-Reply-To: <101628ea-23c9-4bc0-5abc-a5b71b0fccc1@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Sep 2021 13:47:49 -0700
Message-ID: <CAF6AEGt+jiJLaTDVnnVrZm-766OhPfj9wESJxP-FrX3S_c67gQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>, 
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

On Tue, Sep 21, 2021 at 1:09 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> On 2021-09-03 2:47 p.m., Rob Clark wrote:
>
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
> >   drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
> >   drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> >   include/drm/gpu_scheduler.h             |  8 ++++++
> >   3 files changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index bcea035cf4c6..4fc41a71d1c7 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> >       dma_fence_put(&fence->scheduled);
> >   }
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
> >   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> >       .get_driver_name = drm_sched_fence_get_driver_name,
> >       .get_timeline_name = drm_sched_fence_get_timeline_name,
> > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> >       .get_driver_name = drm_sched_fence_get_driver_name,
> >       .get_timeline_name = drm_sched_fence_get_timeline_name,
> >       .release = drm_sched_fence_release_finished,
> > +     .set_deadline = drm_sched_fence_set_deadline_finished,
> >   };
> >
> >   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> >   }
> >   EXPORT_SYMBOL(to_drm_sched_fence);
> >
> > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > +                             struct dma_fence *fence)
> > +{
> > +     s_fence->parent = dma_fence_get(fence);
> > +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > +                  &s_fence->finished.flags))
> > +             dma_fence_set_deadline(fence, s_fence->deadline);
>
>
> I believe above you should pass be s_fence->finished to
> dma_fence_set_deadline
> instead it fence which is the HW fence itself.

Hmm, unless this has changed recently with some patches I don't have,
s_fence->parent is the one signalled by hw, so it is the one we want
to set the deadline on

BR,
-R

> Andrey
>
>
> > +}
> > +
> >   struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> >                                             void *owner)
> >   {
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
> >            */
> >       struct dma_fence                finished;
> >
> > +     /**
> > +      * @deadline: deadline set on &drm_sched_fence.finished which
> > +      * potentially needs to be propagated to &drm_sched_fence.parent
> > +      */
> > +     ktime_t                         deadline;
> > +
> >           /**
> >            * @parent: the fence returned by &drm_sched_backend_ops.run_job
> >            * when scheduling the job on hardware. We signal the
> > @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >                                  enum drm_sched_priority priority);
> >   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >
> > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > +                             struct dma_fence *fence);
> >   struct drm_sched_fence *drm_sched_fence_alloc(
> >       struct drm_sched_entity *s_entity, void *owner);
> >   void drm_sched_fence_init(struct drm_sched_fence *fence,
