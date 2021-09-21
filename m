Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBB9413794
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 18:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B989B96;
	Tue, 21 Sep 2021 16:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211089B96
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:31:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d21so40937547wra.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NN4RWDPMaBqUGv7iOYGgW4P2Ujbd6XLah0pmm7mUecA=;
 b=IcwFXES605BYGxztZGPyadGvDbgKvI23jES5jeHD1hMGLzTWxHHV2ndbOJwiQfR1Ll
 s0EEmlDVLGXBC9VDlGh8FHQdGidzCp1JwdS5fkHSFmpTxy16OFdzb0a3v2uwhWSMbmeN
 iH/c5OASRcdPzHwoDletr0dwH5jPijzRZuiWyUv2UFVlBgN4+opRenW2ejZ72n+mxTIp
 z+dBFbgq6h56Qt2QLklBDZgmqnAw4Draa3nYgrCHq7HCQX7zTWYi6chccpXyBNqT/Kd7
 +HXSTWP/fIAXOBB0zpSFNPhVkP81ZM7Q9diXkNt3mg/snaQ7UyRfNPaw/4P3l+kGi1O2
 NfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NN4RWDPMaBqUGv7iOYGgW4P2Ujbd6XLah0pmm7mUecA=;
 b=YxXnlkmtoWriIGEhMGg1Bh04C9cmM6oCGDK9Bf540nhhNc8GAjqzCDzr2xrvOPHmaK
 G0EnGlS/LIAhCyDCUALF3SNfkWyvO3D7Fccpf65xDWBq2LbCnSXOvOq9e30Bs70YIlu+
 jW963ElTbCpycoUkWvqnZnFgpzm66Jumrmshps9Gg5O959ym5PoCV2mR/iomT+DB2pUK
 hxPobNnuHoc9oEqfdenF0yODdQH1uoQFWo0n3lDDCbn/f4SkLJahD8FA/BKWdf2GLY5E
 QXj9TxvPDTLZFNzkthmZvKWhm48KXiR2uFq/P8KshqtXed1D7D90lbsjuQ0B4dpG00CC
 Ez+Q==
X-Gm-Message-State: AOAM530EHRxr8RKCpALllYaw7BfD2kOCfJvgAPY0VvjoGi63pDWfzm8a
 C10vq4lljOjTrGg6DnWaea7c3BMAnuwsVqYgzTM=
X-Google-Smtp-Source: ABdhPJxiajOecpApgnAO23u2XMOWoKConui4P/flCCr7Wm4uMkOV1vsTqmDZfpiv4FhkDAB0iy1nXj5LjSIT6srmmYo=
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr35595580wrn.251.1632241878757; 
 Tue, 21 Sep 2021 09:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <YTj2scNdCHAdF+cl@phenom.ffwll.local>
 <CAF6AEGvHQHbOP65jq53WEuJc9uxReOFMyXUN--JjjcB1FxHSCw@mail.gmail.com>
In-Reply-To: <CAF6AEGvHQHbOP65jq53WEuJc9uxReOFMyXUN--JjjcB1FxHSCw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Sep 2021 09:35:50 -0700
Message-ID: <CAF6AEGve2LN2Us56e15rZrec7xXHrBhGT9NuPaOiQeiWrACbLw@mail.gmail.com>
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

On Tue, Sep 21, 2021 at 8:57 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Sep 8, 2021 at 10:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Sep 03, 2021 at 11:47:55AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > As the finished fence is the one that is exposed to userspace, and
> > > therefore the one that other operations, like atomic update, would
> > > block on, we need to propagate the deadline from from the finished
> > > fence to the actual hw fence.
> > >
> > > v2: Split into drm_sched_fence_set_parent() (ckoenig)
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
> > >  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> > >  include/drm/gpu_scheduler.h             |  8 ++++++
> > >  3 files changed, 43 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > > index bcea035cf4c6..4fc41a71d1c7 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> > >       dma_fence_put(&fence->scheduled);
> > >  }
> > >
> > > +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> > > +                                               ktime_t deadline)
> > > +{
> > > +     struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&fence->lock, flags);
> > > +
> > > +     /* If we already have an earlier deadline, keep it: */
> > > +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> > > +         ktime_before(fence->deadline, deadline)) {
> > > +             spin_unlock_irqrestore(&fence->lock, flags);
> > > +             return;
> > > +     }
> > > +
> > > +     fence->deadline = deadline;
> > > +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> > > +
> > > +     spin_unlock_irqrestore(&fence->lock, flags);
> > > +
> > > +     if (fence->parent)
> > > +             dma_fence_set_deadline(fence->parent, deadline);
> > > +}
> > > +
> > >  static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> > >       .get_driver_name = drm_sched_fence_get_driver_name,
> > >       .get_timeline_name = drm_sched_fence_get_timeline_name,
> > > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> > >       .get_driver_name = drm_sched_fence_get_driver_name,
> > >       .get_timeline_name = drm_sched_fence_get_timeline_name,
> > >       .release = drm_sched_fence_release_finished,
> > > +     .set_deadline = drm_sched_fence_set_deadline_finished,
> > >  };
> > >
> > >  struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > > @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > >  }
> > >  EXPORT_SYMBOL(to_drm_sched_fence);
> > >
> > > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > > +                             struct dma_fence *fence)
> > > +{
> > > +     s_fence->parent = dma_fence_get(fence);
> > > +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > > +                  &s_fence->finished.flags))
> >
> > Don't you need the spinlock here too to avoid races? test_bit is very
> > unordered, so guarantees nothing. Spinlock would need to be both around
> > ->parent = and the test_bit.
> >
> > Entirely aside, but there's discussions going on to preallocate the hw
> > fence somehow. If we do that we could make the deadline forwarding
> > lockless here. Having a spinlock just to set the parent is a bit annoying
> > ...
> >
> > Alternative is that you do this locklessly with barriers and a _lot_ of
> > comments. Would be good to benchmark whether the overhead matters though
> > first.
>
> So, my thinking is that very few (well no) guarantees are made to the
> fence implementor that their ->set_deadline() is not called multiple
> times, from multiple threads, etc.  And no guarantee that a later
> deadline is set after an earlier deadline has been set.  It is all up
> to the set_deadline() implementation to deal with these cases.
>
> So that means we just need the appropriate barrier-fu to ensure
> another thread calling drm_sched_fence_set_deadline_finished() sees
> fence->parent set before the test_bit.  It could mean that the backend
> implementation sees the same deadline set twice, but that is fine.
>

something like:

-----
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
b/drivers/gpu/drm/scheduler/sched_fence.c
index 4fc41a71d1c7..7f2af6d1777c 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -132,6 +132,7 @@ static void
drm_sched_fence_set_deadline_finished(struct dma_fence *f,
    ktime_t deadline)
 {
  struct drm_sched_fence *fence = to_drm_sched_fence(f);
+ struct dma_fence *parent;
  unsigned long flags;

  spin_lock_irqsave(&fence->lock, flags);
@@ -148,8 +149,9 @@ static void
drm_sched_fence_set_deadline_finished(struct dma_fence *f,

  spin_unlock_irqrestore(&fence->lock, flags);

- if (fence->parent)
- dma_fence_set_deadline(fence->parent, deadline);
+ parent = smp_load_acquire(&fence->parent);
+ if (parent)
+ dma_fence_set_deadline(parent, deadline);
 }

 static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
@@ -180,7 +182,7 @@ EXPORT_SYMBOL(to_drm_sched_fence);
 void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
  struct dma_fence *fence)
 {
- s_fence->parent = dma_fence_get(fence);
+ smp_store_release(&s_fence->parent, dma_fence_get(fence));
  if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
       &s_fence->finished.flags))
  dma_fence_set_deadline(fence, s_fence->deadline);
-----

BR,
-R
