Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00113C6AC5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 08:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DC56E039;
	Tue, 13 Jul 2021 06:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9276E037
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:50:54 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id h9so27588031oih.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 23:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b8lDM5VJGbqZhlRkcvbnGDphjz98NS0as6f1mCKaU7I=;
 b=HSNSUofRBz0kWxB6wdmLnLmV6nDg6y5Rr2iORIiS5hYBT3oFjxtOqbDyA+0W/gf3Df
 ba6GkjM6bvR7Brg/bRARjV8/zqrOUfhozWXnAL4tmz8ibbNy1EuCZmtKf2sYS/GKv5I0
 v0uSXe4HH+5OLJ9U1mRJ8gysbXkLvLZLNzI4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b8lDM5VJGbqZhlRkcvbnGDphjz98NS0as6f1mCKaU7I=;
 b=heht/94pTB71Wb9sbe2dusvtQHOHcjN+lEFojAbl2Cra1MB/h28gzNMwM1qLmQrijp
 LRHt0wfsVIVMPC/LxqPHQR/42Gfr4TNZCPQ8cUQLj3emJWgtt7/HNJxmoB2Y/6CRtc3j
 d5Rne/T4Jr4KUqpDHJfcKydMuxo1yt4o3e5GDdZRCGZap7O3JIA+hxuTnCPDREz5mhcg
 85l83TyqgZ5Yi2A4QRcWmpyTqjxz3wpjs3fF0avDMF8QznWjCgmWym6XTuHSEAN+lSJd
 KTb3LZnFMTMOBb6YeIl5zKLmhOQEhrxXqvrfpRwswfzk+BY34FB7yj3GJus/cNEWsDx6
 kdOQ==
X-Gm-Message-State: AOAM533AfsxzFJSuGiZAHL59l9ouJjzA3nx9BKbwv7i1GcfSmUATattm
 7fjUz29clo08rJB4bG14XWwxGHcWhLqC7oyWNRKpiw==
X-Google-Smtp-Source: ABdhPJwy0buaZM9zigqkPSPi36/H6WIicyhqoJYKehRSZRGWf8WOAmmmuiFlvQ82YqZR9DR8DwrY+VYL3c1tj86EKA8=
X-Received: by 2002:aca:4b55:: with SMTP id y82mr13296907oia.14.1626159053643; 
 Mon, 12 Jul 2021 23:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
In-Reply-To: <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 08:50:42 +0200
Message-ID: <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
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

On Tue, Jul 13, 2021 at 8:35 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 12.07.21 um 19:53 schrieb Daniel Vetter:
> > It might be good enough on x86 with just READ_ONCE, but the write side
> > should then at least be WRITE_ONCE because x86 has total store order.
> >
> > It's definitely not enough on arm.
> >
> > Fix this proplery, which means
> > - explain the need for the barrier in both places
> > - point at the other side in each comment
> >
> > Also pull out the !sched_list case as the first check, so that the
> > code flow is clearer.
> >
> > While at it sprinkle some comments around because it was very
> > non-obvious to me what's actually going on here and why.
> >
> > Note that we really need full barriers here, at first I thought
> > store-release and load-acquire on ->last_scheduled would be enough,
> > but we actually requiring ordering between that and the queue state.
> >
> > v2: Put smp_rmp() in the right place and fix up comment (Andrey)
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++-=
-
> >   1 file changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index f7347c284886..89e3f6eaf519 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(str=
uct drm_sched_entity *entity)
> >               dma_fence_set_error(&sched_job->s_fence->finished, -ECANC=
ELED);
> >
> >       dma_fence_put(entity->last_scheduled);
> > +
> >       entity->last_scheduled =3D dma_fence_get(&sched_job->s_fence->fin=
ished);
> >
> > +     /*
> > +      * If the queue is empty we allow drm_sched_entity_select_rq() to
> > +      * locklessly access ->last_scheduled. This only works if we set =
the
> > +      * pointer before we dequeue and if we a write barrier here.
> > +      */
> > +     smp_wmb();
> > +
>
> Again, conceptual those barriers should be part of the spsc_queue
> container and not externally.

That would be extremely unusual api. Let's assume that your queue is
very dumb, and protected by a simple lock. That's about the maximum
any user could expect.

But then you still need barriers here, because linux locks (spinlock,
mutex) are defined to be one-way barriers: Stuff that's inside is
guaranteed to be done insinde, but stuff outside of the locked region
can leak in. They're load-acquire/store-release barriers. So not good
enough.

You really need to have barriers here, and they really all need to be
documented properly. And yes that's a shit-ton of work in drm/sched,
because it's full of yolo lockless stuff.

The other case you could make is that this works like a wakeup queue,
or similar. The rules there are:
- wake_up (i.e. pushing something into the queue) is a store-release barrie=
r
- the waked up (i.e. popping an entry) is a load acquire barrier
Which is obviuosly needed because otherwise you don't have coherency
for the data queued up. And again not the barriers you're locking for
here.

Either way, we'd still need the comments, because it's still lockless
trickery, and every single one of that needs to have a comment on both
sides to explain what's going on.

Essentially replace spsc_queue with an llist underneath, and that's
the amount of barriers a data structure should provide. Anything else
is asking your datastructure to paper over bugs in your users.

This is similar to how atomic_t is by default completely unordered,
and users need to add barriers as needed, with comments. I think this
is all to make sure people don't just write lockless algorithms
because it's a cool idea, but are forced to think this all through.
Which seems to not have happened very consistently for drm/sched, so I
guess needs to be fixed.

I'm definitely not going to hide all that by making the spsc_queue
stuff provide random unjustified barriers just because that would
paper over drm/sched bugs. We need to fix the actual bugs, and
preferrable all of them. I've found a few, but I wasn't involved in
drm/sched thus far, so best I can do is discover them as we go.
-Daniel


> Regards,
> Christian.
>
> >       spsc_queue_pop(&entity->job_queue);
> >       return sched_job;
> >   }
> > @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> >       struct drm_gpu_scheduler *sched;
> >       struct drm_sched_rq *rq;
> >
> > -     if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
> > +     /* single possible engine and already selected */
> > +     if (!entity->sched_list)
> > +             return;
> > +
> > +     /* queue non-empty, stay on the same engine */
> > +     if (spsc_queue_count(&entity->job_queue))
> >               return;
> >
> > -     fence =3D READ_ONCE(entity->last_scheduled);
> > +     /*
> > +      * Only when the queue is empty are we guaranteed that the schedu=
ler
> > +      * thread cannot change ->last_scheduled. To enforce ordering we =
need
> > +      * a read barrier here. See drm_sched_entity_pop_job() for the ot=
her
> > +      * side.
> > +      */
> > +     smp_rmb();
> > +
> > +     fence =3D entity->last_scheduled;
> > +
> > +     /* stay on the same engine if the previous job hasn't finished */
> >       if (fence && !dma_fence_is_signaled(fence))
> >               return;
> >
>


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
