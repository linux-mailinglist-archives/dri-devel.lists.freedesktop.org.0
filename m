Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3853C6CE6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 11:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD3D89DEA;
	Tue, 13 Jul 2021 09:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D05189DEA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 09:10:12 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id h9so27919764oih.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 02:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nWFZM3/Fd498xYi/NS6bAEMYCbl7QML6DyivQTp/sV0=;
 b=hfkmcHL6Zp08WVE+ecLEDgZcQo/JXziHSDX2ZVGNalK275PCThHNzlraweUnXZwbVB
 DTp4fDhrNyyBVLylo1TXKMiEi5O9x9p57AXa0DCNwLTVwOK6kfL2MggBJYxxq29z3J3X
 9sKbQwju4rcTjCjYqzcaEVlOba0Vy5Cgpkx7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nWFZM3/Fd498xYi/NS6bAEMYCbl7QML6DyivQTp/sV0=;
 b=oamgZU/+U2Hf65IoBwMnaN8qjP4Z5oku6dshla56F60/0K3sUidu5NuiKiGz32UZcU
 M8pN7aTC6KHaN9Bg/sMwCah9VlU3qM0ZNwpYKbOrOHuUdGciQQ4aB6n7sFINe/Viwd1T
 izazxBABcr5WBFIRsSrtJfbuTIq7QKRwU7f9+frnDHzQw9/eYgOQuCnfD02ya9bM7qa+
 TmPhK/uU7pU4odhKorau2h7j6biAH5Y0bkJxAMx3ptPqPdnOaR8Pz6U2EZDVXJgLMVaJ
 JuAVq+gzgNvN0aOCNkXTCUkEEA5FTK8+VA1hctXKRdyRoZbRGL5HoXqodccaGEgQECi3
 UH2Q==
X-Gm-Message-State: AOAM531Ke5lAEwcnJizS6JqZupKeNMkVpcOB0E8rgfWZ2eV1DYVON+ft
 Xzgepktb+bF+CVyPG0kR+KwRVKIs7RCfKeJdCsLTaw==
X-Google-Smtp-Source: ABdhPJwxd0a2gHUhQe5j3n2+9L7w0s7E41ayASkRMd32FuI7AUCPINKXiWxJTzCTbOFuBg/1zBWsCDmJ5ljAVtR363g=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr272688oig.14.1626167411714; 
 Tue, 13 Jul 2021 02:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
 <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
 <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
In-Reply-To: <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 11:10:00 +0200
Message-ID: <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 9:25 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 13.07.21 um 08:50 schrieb Daniel Vetter:
> > On Tue, Jul 13, 2021 at 8:35 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 12.07.21 um 19:53 schrieb Daniel Vetter:
> >>> It might be good enough on x86 with just READ_ONCE, but the write sid=
e
> >>> should then at least be WRITE_ONCE because x86 has total store order.
> >>>
> >>> It's definitely not enough on arm.
> >>>
> >>> Fix this proplery, which means
> >>> - explain the need for the barrier in both places
> >>> - point at the other side in each comment
> >>>
> >>> Also pull out the !sched_list case as the first check, so that the
> >>> code flow is clearer.
> >>>
> >>> While at it sprinkle some comments around because it was very
> >>> non-obvious to me what's actually going on here and why.
> >>>
> >>> Note that we really need full barriers here, at first I thought
> >>> store-release and load-acquire on ->last_scheduled would be enough,
> >>> but we actually requiring ordering between that and the queue state.
> >>>
> >>> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
> >>>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Steven Price <steven.price@arm.com>
> >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Lee Jones <lee.jones@linaro.org>
> >>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>>    drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++=
++--
> >>>    1 file changed, 25 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> >>> index f7347c284886..89e3f6eaf519 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >>> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(s=
truct drm_sched_entity *entity)
> >>>                dma_fence_set_error(&sched_job->s_fence->finished, -EC=
ANCELED);
> >>>
> >>>        dma_fence_put(entity->last_scheduled);
> >>> +
> >>>        entity->last_scheduled =3D dma_fence_get(&sched_job->s_fence->=
finished);
> >>>
> >>> +     /*
> >>> +      * If the queue is empty we allow drm_sched_entity_select_rq() =
to
> >>> +      * locklessly access ->last_scheduled. This only works if we se=
t the
> >>> +      * pointer before we dequeue and if we a write barrier here.
> >>> +      */
> >>> +     smp_wmb();
> >>> +
> >> Again, conceptual those barriers should be part of the spsc_queue
> >> container and not externally.
> > That would be extremely unusual api. Let's assume that your queue is
> > very dumb, and protected by a simple lock. That's about the maximum
> > any user could expect.
> >
> > But then you still need barriers here, because linux locks (spinlock,
> > mutex) are defined to be one-way barriers: Stuff that's inside is
> > guaranteed to be done insinde, but stuff outside of the locked region
> > can leak in. They're load-acquire/store-release barriers. So not good
> > enough.
> >
> > You really need to have barriers here, and they really all need to be
> > documented properly. And yes that's a shit-ton of work in drm/sched,
> > because it's full of yolo lockless stuff.
> >
> > The other case you could make is that this works like a wakeup queue,
> > or similar. The rules there are:
> > - wake_up (i.e. pushing something into the queue) is a store-release ba=
rrier
> > - the waked up (i.e. popping an entry) is a load acquire barrier
> > Which is obviuosly needed because otherwise you don't have coherency
> > for the data queued up. And again not the barriers you're locking for
> > here.
>
> Exactly that was the idea, yes.
>
> > Either way, we'd still need the comments, because it's still lockless
> > trickery, and every single one of that needs to have a comment on both
> > sides to explain what's going on.
> >
> > Essentially replace spsc_queue with an llist underneath, and that's
> > the amount of barriers a data structure should provide. Anything else
> > is asking your datastructure to paper over bugs in your users.
> >
> > This is similar to how atomic_t is by default completely unordered,
> > and users need to add barriers as needed, with comments.
>
> My main problem is as always that kernel atomics work different than
> userspace atomics.
>
> > I think this is all to make sure people don't just write lockless algor=
ithms
> > because it's a cool idea, but are forced to think this all through.
> > Which seems to not have happened very consistently for drm/sched, so I
> > guess needs to be fixed.
>
> Well at least initially that was all perfectly thought through. The
> problem is nobody is really maintaining that stuff.
>
> > I'm definitely not going to hide all that by making the spsc_queue
> > stuff provide random unjustified barriers just because that would
> > paper over drm/sched bugs. We need to fix the actual bugs, and
> > preferrable all of them. I've found a few, but I wasn't involved in
> > drm/sched thus far, so best I can do is discover them as we go.
>
> I don't think that those are random unjustified barriers at all and it
> sounds like you didn't grip what I said here.
>
> See the spsc queue must have the following semantics:
>
> 1. When you pop a job all changes made before you push the job must be
> visible.

This is the standard barriers that also wake-up queues have, it's just
store-release+load-acquire.

> 2. When the queue becomes empty all the changes made before you pop the
> last job must be visible.

This is very much non-standard for a queue. I guess you could make
that part of the spsc_queue api between pop and is_empty (really we
shouldn't expose the _count() function for this), but that's all very
clever.

I think having explicit barriers in the code, with comments, is much
more robust. Because it forces you to think about all this, and
document it properly. Because there's also lockless stuff like
drm_sched.ready, which doesn't look at all like it's ordered somehow.

E.g. there's also an rmb(); in drm_sched_entity_is_idle(), which
- probably should be an smp_rmb()
- really should document what it actually synchronizes against, and
the lack of an smp_wmb() somewhere else indicates it's probably
busted. You always need two barriers.

> Otherwise I completely agree with you that the whole scheduler doesn't
> work at all and we need to add tons of external barriers.

Imo that's what we need to do. And the most important part for
maintainability is to properly document thing with comments, and the
most important part in that comment is pointing at the other side of a
barrier (since a barrier on one side only orders nothing).

Also, on x86 almost nothing here matters, because both rmb() and wmb()
are no-op. Aside from the compiler barrier, which tends to not be the
biggest issue. Only mb() does anything, because x86 is only allowed to
reorder reads ahead of writes.

So in practice it's not quite as big a disaster, imo the big thing
here is maintainability of all these tricks just not being documented.
-Daniel

> Regards,
> Christian.
>
> > -Daniel
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>>        spsc_queue_pop(&entity->job_queue);
> >>>        return sched_job;
> >>>    }
> >>> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sche=
d_entity *entity)
> >>>        struct drm_gpu_scheduler *sched;
> >>>        struct drm_sched_rq *rq;
> >>>
> >>> -     if (spsc_queue_count(&entity->job_queue) || !entity->sched_list=
)
> >>> +     /* single possible engine and already selected */
> >>> +     if (!entity->sched_list)
> >>> +             return;
> >>> +
> >>> +     /* queue non-empty, stay on the same engine */
> >>> +     if (spsc_queue_count(&entity->job_queue))
> >>>                return;
> >>>
> >>> -     fence =3D READ_ONCE(entity->last_scheduled);
> >>> +     /*
> >>> +      * Only when the queue is empty are we guaranteed that the sche=
duler
> >>> +      * thread cannot change ->last_scheduled. To enforce ordering w=
e need
> >>> +      * a read barrier here. See drm_sched_entity_pop_job() for the =
other
> >>> +      * side.
> >>> +      */
> >>> +     smp_rmb();
> >>> +
> >>> +     fence =3D entity->last_scheduled;
> >>> +
> >>> +     /* stay on the same engine if the previous job hasn't finished =
*/
> >>>        if (fence && !dma_fence_is_signaled(fence))
> >>>                return;
> >>>
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog=
.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Ce06013b14cfc=
49e3e10f08d945ca8f73%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617558=
577952913%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DyKAIrzyRRh1AoGM%2BQXyrwd4psTvy=
O%2Bcn8961PbcJmpQ%3D&amp;reserved=3D0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
