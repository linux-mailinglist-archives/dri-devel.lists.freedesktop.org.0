Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6123C201F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 09:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F766E9C7;
	Fri,  9 Jul 2021 07:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC83C6E9C7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:40:51 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u11so11222959oiv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8bhsFUO69iuV07cQJ2ssyZKt/x0LWfOEI39FZQi0ksY=;
 b=D8pReIZyfO8pTn+Pey0ICsRwKXfdp/h1AOulR3xe/b8/UA2fzA2ijirenNtLAPSRXp
 aTIs8vN3VULqkDApGE0/+oZDyLPUOjvMTbJSsgL4KOKBAOSf3C9jFggo5IBIN41pvdpH
 H8uY+1LhU2UchmPcEa440AMge0uqQEMYFArwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8bhsFUO69iuV07cQJ2ssyZKt/x0LWfOEI39FZQi0ksY=;
 b=h4yzTbIzuArtYoBVKwtiCB7Ub9SkpPac/7gnMX/xcWu7KQhAY2x1jbbsyKkVtSOx69
 49tU5+C71DE8vcqdFeRkg28yV+qvNT8ZNs250UDmrceix3oSV0ZMsXVf1WGXGi9U8NHF
 2yaEPqVGfEcaewLQojC8QnLvSH09oUHvOHMuguAZV2nAFy1qO6BsIkqsQfkkbTFN3i27
 /SyJX8o5HuLhFsnizpkc7CiuWAuUlyOGcp7XsZRe2klk5sJ8AZ8PXd7fNIakk2BjYU42
 EPGB9aE5Gr3FMill7Yh3TjaLQlPQ2E6ar6I/ZmfloSztk8lUKxYXJMGezfbKdBRQquH8
 kuUg==
X-Gm-Message-State: AOAM532zYNxkPmOef1MWJkhk+hLCueXQ5aPC1jWFJljPu46mSauYX/d7
 ZjJosGNOZckn3olOqAPb9SX1c+AzBbab4Wt/OgXNBQ==
X-Google-Smtp-Source: ABdhPJzJg+Hi4VukkWJZSO5MNKrkvmAUDLoAeabDpqwzzKeq0/uV9lDGQXbEvkn9yOwzZcDaqdpWH0iqu3ULnUUDDcY=
X-Received: by 2002:aca:4b55:: with SMTP id y82mr2361204oia.14.1625816451045; 
 Fri, 09 Jul 2021 00:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
 <20210708215439.4093557-1-daniel.vetter@ffwll.ch>
 <14149638-6cc7-5281-c6b6-d6d08d13713f@amd.com>
In-Reply-To: <14149638-6cc7-5281-c6b6-d6d08d13713f@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Jul 2021 09:40:39 +0200
Message-ID: <CAKMK7uFYEhtqHr53rE=Utv+J3zwc2Q9-nFzo0hqEnZ3nUr=qUw@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Barriers are needed for entity->last_scheduled
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

On Fri, Jul 9, 2021 at 8:58 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
>
>
> Am 08.07.21 um 23:54 schrieb Daniel Vetter:
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
> > index 64d398166644..6366006c0fcf 100644
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
> That whole stuff needs to be inside the spsc queue, not outside.
>
> Otherwise drm_sched_entity_is_idle() won't work either and cause a lot
> of trouble during process tear down.

Nah, that just means you need another 2 comments with their barrier to
explain how things are serialized there against entity->stopped. The
queue only needs to provide store-release and load-acquire barriers
from a functional pov, if you assumie more then that's very strange.
We need barriers in the other direction here (I haven't looked at what
entity_is_idle) needs.

This is why the first rule of lockless algorithms is "don't", and the
second one is to very painstaikingly document every barrier necessary
with
- explanation what it synchronizes and why
- and a pointer to where the other side of the barrier is in the code
(there always has to be one, barrier on one side does nothing)
-Daniel

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


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
