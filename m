Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A803C7530
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C71892CC;
	Tue, 13 Jul 2021 16:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A15892CC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:45:23 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s23so14517891oij.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vTrNMBsBymixZ+2SWW7s0Dyab4l7kAYkkX81V7y19k8=;
 b=jGtRtQuRDf5OkPgP38g2k7JIVHou8KNcPhiytqRyJHbTJ4HqnYeIoblglFUClZQir1
 TQJK0HTRJThBaVNBxqojMtO0RPmJh42BWHWqv1Aryx3bPLavMFhoNW8bgJA6Z/MdH6FN
 y2QE98ttf/EONc1aMqJer5vWaXlnxznZl3Lk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vTrNMBsBymixZ+2SWW7s0Dyab4l7kAYkkX81V7y19k8=;
 b=ky4g6rnNOyfAOB4+mDsCIc8X8fV4qsrHJbeb1ya1N+hRoENRx94FA8kshT0TV+9TnK
 Qiq1w7rwz7Hdahra/FSBnA/6h4zbeJ4ENC8EO0dhrKXvyq9QPlEL9TqrzeCS98GjAWFd
 I58NjS8MpoMknV/v4R9elbpWVGj0CcACZ7shQGPaeE/yHesG4+AyMj008IinCabOgldw
 Zezo9Gi9ShIx5V9axUl4H1/TJdcLWmtJVzYKE00QpSBme4zAY16Bn1YIrixw/f2Pk2xa
 AVCC5YNDXxxIj3fhRT+krbog9xjeD/N4/6UAj/tV2QnSWonStV6k8p/CewwDfuwn1zP3
 FLsA==
X-Gm-Message-State: AOAM530D0bCfamGWVbjE3+AvUYZ3fhMVu0dGekO7LgP1Opfsvm7wDQMQ
 wAOlklmZxzA38JGwSptN8z3MeEfTZeZQaMUJ8PAL9Q==
X-Google-Smtp-Source: ABdhPJwzUpAiAiFDoSE3VI9uU3dkpqRdgAniRh9W0G02mryZ7ZsNIBt4fzQNSl+HqYpds+6+98l3EwFbmI7NzEezkaA=
X-Received: by 2002:aca:3085:: with SMTP id w127mr197188oiw.101.1626194722981; 
 Tue, 13 Jul 2021 09:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
 <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
 <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
 <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
 <ecd94ad4-9788-3cf1-87e4-52c37e813439@amd.com>
In-Reply-To: <ecd94ad4-9788-3cf1-87e4-52c37e813439@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 18:45:11 +0200
Message-ID: <CAKMK7uEQWniuGGENjdnXpKh22hAJQe0TiQTbw1=2vXvUGyivcw@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 6:11 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
> On 2021-07-13 5:10 a.m., Daniel Vetter wrote:
> > On Tue, Jul 13, 2021 at 9:25 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 13.07.21 um 08:50 schrieb Daniel Vetter:
> >>> On Tue, Jul 13, 2021 at 8:35 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 12.07.21 um 19:53 schrieb Daniel Vetter:
> >>>>> It might be good enough on x86 with just READ_ONCE, but the write s=
ide
> >>>>> should then at least be WRITE_ONCE because x86 has total store orde=
r.
> >>>>>
> >>>>> It's definitely not enough on arm.
> >>>>>
> >>>>> Fix this proplery, which means
> >>>>> - explain the need for the barrier in both places
> >>>>> - point at the other side in each comment
> >>>>>
> >>>>> Also pull out the !sched_list case as the first check, so that the
> >>>>> code flow is clearer.
> >>>>>
> >>>>> While at it sprinkle some comments around because it was very
> >>>>> non-obvious to me what's actually going on here and why.
> >>>>>
> >>>>> Note that we really need full barriers here, at first I thought
> >>>>> store-release and load-acquire on ->last_scheduled would be enough,
> >>>>> but we actually requiring ordering between that and the queue state=
.
> >>>>>
> >>>>> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
> >>>>>
> >>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>> Cc: Steven Price <steven.price@arm.com>
> >>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>>>> Cc: Lee Jones <lee.jones@linaro.org>
> >>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 27 +++++++++++++++++=
+++++--
> >>>>>     1 file changed, 25 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu=
/drm/scheduler/sched_entity.c
> >>>>> index f7347c284886..89e3f6eaf519 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >>>>> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job=
(struct drm_sched_entity *entity)
> >>>>>                 dma_fence_set_error(&sched_job->s_fence->finished, =
-ECANCELED);
> >>>>>
> >>>>>         dma_fence_put(entity->last_scheduled);
> >>>>> +
> >>>>>         entity->last_scheduled =3D dma_fence_get(&sched_job->s_fenc=
e->finished);
> >>>>>
> >>>>> +     /*
> >>>>> +      * If the queue is empty we allow drm_sched_entity_select_rq(=
) to
> >>>>> +      * locklessly access ->last_scheduled. This only works if we =
set the
> >>>>> +      * pointer before we dequeue and if we a write barrier here.
> >>>>> +      */
> >>>>> +     smp_wmb();
> >>>>> +
> >>>> Again, conceptual those barriers should be part of the spsc_queue
> >>>> container and not externally.
> >>> That would be extremely unusual api. Let's assume that your queue is
> >>> very dumb, and protected by a simple lock. That's about the maximum
> >>> any user could expect.
> >>>
> >>> But then you still need barriers here, because linux locks (spinlock,
> >>> mutex) are defined to be one-way barriers: Stuff that's inside is
> >>> guaranteed to be done insinde, but stuff outside of the locked region
> >>> can leak in. They're load-acquire/store-release barriers. So not good
> >>> enough.
> >>>
> >>> You really need to have barriers here, and they really all need to be
> >>> documented properly. And yes that's a shit-ton of work in drm/sched,
> >>> because it's full of yolo lockless stuff.
> >>>
> >>> The other case you could make is that this works like a wakeup queue,
> >>> or similar. The rules there are:
> >>> - wake_up (i.e. pushing something into the queue) is a store-release =
barrier
> >>> - the waked up (i.e. popping an entry) is a load acquire barrier
> >>> Which is obviuosly needed because otherwise you don't have coherency
> >>> for the data queued up. And again not the barriers you're locking for
> >>> here.
> >> Exactly that was the idea, yes.
> >>
> >>> Either way, we'd still need the comments, because it's still lockless
> >>> trickery, and every single one of that needs to have a comment on bot=
h
> >>> sides to explain what's going on.
> >>>
> >>> Essentially replace spsc_queue with an llist underneath, and that's
> >>> the amount of barriers a data structure should provide. Anything else
> >>> is asking your datastructure to paper over bugs in your users.
> >>>
> >>> This is similar to how atomic_t is by default completely unordered,
> >>> and users need to add barriers as needed, with comments.
> >> My main problem is as always that kernel atomics work different than
> >> userspace atomics.
> >>
> >>> I think this is all to make sure people don't just write lockless alg=
orithms
> >>> because it's a cool idea, but are forced to think this all through.
> >>> Which seems to not have happened very consistently for drm/sched, so =
I
> >>> guess needs to be fixed.
> >> Well at least initially that was all perfectly thought through. The
> >> problem is nobody is really maintaining that stuff.
> >>
> >>> I'm definitely not going to hide all that by making the spsc_queue
> >>> stuff provide random unjustified barriers just because that would
> >>> paper over drm/sched bugs. We need to fix the actual bugs, and
> >>> preferrable all of them. I've found a few, but I wasn't involved in
> >>> drm/sched thus far, so best I can do is discover them as we go.
> >> I don't think that those are random unjustified barriers at all and it
> >> sounds like you didn't grip what I said here.
> >>
> >> See the spsc queue must have the following semantics:
> >>
> >> 1. When you pop a job all changes made before you push the job must be
> >> visible.
> > This is the standard barriers that also wake-up queues have, it's just
> > store-release+load-acquire.
> >
> >> 2. When the queue becomes empty all the changes made before you pop th=
e
> >> last job must be visible.
> > This is very much non-standard for a queue. I guess you could make
> > that part of the spsc_queue api between pop and is_empty (really we
> > shouldn't expose the _count() function for this), but that's all very
> > clever.
> >
> > I think having explicit barriers in the code, with comments, is much
> > more robust. Because it forces you to think about all this, and
> > document it properly. Because there's also lockless stuff like
> > drm_sched.ready, which doesn't look at all like it's ordered somehow.
>
>
> At least for amdgpu, after drm_sched_fini is called (setting sched.ready
> =3D false)
> we call amdgpu_fence_wait_empty to ensure all in progress jobs are done.
> Seems to me at least, this should guarantee that all in flight consumers
> of sched.ready (those who still see sched.ready =3D=3D true) are finished=
 while
> all later consumers will see sched.ready =3D=3D fakle and will bail out.
>
> On second thought there is a gap between checking for sched.ready and
> inserting
> the HW fence for the new job so this might still be a bug... Looks like
> we need to check for
> sched.ready after inserting the HW fence  and for this we will need
> barrier or locking.

Yeah, and at that point I think it's good to split up drm_sched.ready
from a new thing for when the hw died, like drm_sched.wedged or
.hw_death or similar, so that we can tell them apart. Trying to submit
a job to a non-ready scheduler is a driver bug and should WARN, while
submitting a job to a dead scheduler should probably result in -EIO
being returned to userspace (instead of the current -ENOENT, assuming
I haven't missed a errno remapping code somewhere in amdgpu).

Also, then you could do a drm_sched_die() or similar function which
combines setting the hw_died with the right barriers and cleaning up
all the jobs.

Wrt the fundamental race: I think that's not fixeable easily, so maybe
the scheduler thread also needs to handle this and immediately fail
these jobs by setting all fences to -EIO and completing them, without
even calling into the driver. If you try to catch this synchronously I
think it would require some kind of locking in push_job, plus failure
handling, which would be a) slow and b) real ugly in the driver code.
Just accepting that some jobs can slip through and letting the
scheduler thread clean them up is I think cleaner.

If userspace then goes ahead and closes the ctx before all the jobs
are cleaned up we can handle that with the normal drm_sched_entity
cleanup logic. Which would be another reason to split normal cleanup
from hw death.
-Daniel

> Andrey
>
> >
> > E.g. there's also an rmb(); in drm_sched_entity_is_idle(), which
> > - probably should be an smp_rmb()
> > - really should document what it actually synchronizes against, and
> > the lack of an smp_wmb() somewhere else indicates it's probably
> > busted. You always need two barriers.
> >
> >> Otherwise I completely agree with you that the whole scheduler doesn't
> >> work at all and we need to add tons of external barriers.
> > Imo that's what we need to do. And the most important part for
> > maintainability is to properly document thing with comments, and the
> > most important part in that comment is pointing at the other side of a
> > barrier (since a barrier on one side only orders nothing).
> >
> > Also, on x86 almost nothing here matters, because both rmb() and wmb()
> > are no-op. Aside from the compiler barrier, which tends to not be the
> > biggest issue. Only mb() does anything, because x86 is only allowed to
> > reorder reads ahead of writes.
> >
> > So in practice it's not quite as big a disaster, imo the big thing
> > here is maintainability of all these tricks just not being documented.
> > -Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>         spsc_queue_pop(&entity->job_queue);
> >>>>>         return sched_job;
> >>>>>     }
> >>>>> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sc=
hed_entity *entity)
> >>>>>         struct drm_gpu_scheduler *sched;
> >>>>>         struct drm_sched_rq *rq;
> >>>>>
> >>>>> -     if (spsc_queue_count(&entity->job_queue) || !entity->sched_li=
st)
> >>>>> +     /* single possible engine and already selected */
> >>>>> +     if (!entity->sched_list)
> >>>>> +             return;
> >>>>> +
> >>>>> +     /* queue non-empty, stay on the same engine */
> >>>>> +     if (spsc_queue_count(&entity->job_queue))
> >>>>>                 return;
> >>>>>
> >>>>> -     fence =3D READ_ONCE(entity->last_scheduled);
> >>>>> +     /*
> >>>>> +      * Only when the queue is empty are we guaranteed that the sc=
heduler
> >>>>> +      * thread cannot change ->last_scheduled. To enforce ordering=
 we need
> >>>>> +      * a read barrier here. See drm_sched_entity_pop_job() for th=
e other
> >>>>> +      * side.
> >>>>> +      */
> >>>>> +     smp_rmb();
> >>>>> +
> >>>>> +     fence =3D entity->last_scheduled;
> >>>>> +
> >>>>> +     /* stay on the same engine if the previous job hasn't finishe=
d */
> >>>>>         if (fence && !dma_fence_is_signaled(fence))
> >>>>>                 return;
> >>>>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fbl=
og.ffwll.ch%2F&amp;data=3D04%7C01%7Candrey.grodzovsky%40amd.com%7C24488ad19=
56a4a54b0ab08d945de0552%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617=
642160395692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Du%2Fpm%2BsmTT%2Bdb8NvEah%2B=
JHj22l8sRfhgo1gvO%2FnYLvhg%3D&amp;reserved=3D0
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
