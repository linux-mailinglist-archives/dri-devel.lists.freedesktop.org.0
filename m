Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437633C1A2D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 21:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D416E990;
	Thu,  8 Jul 2021 19:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89E56E990
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 19:53:57 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id j65so3112346oih.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 12:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6gVz732TeLzAh3u/w29NhT4HzKDPkmcXR6VsrHgctQw=;
 b=HM1pSqrII40fXe/t97xpI2ResegZ8KFIMT4k7/EVAY3AtMh6CpCINeKZhiKRLMGCcE
 Y1FeRygYFvIe+dMqjdzEO0qlyRiVC/wpY/yWYIxvT5777EWn1VwoQ75FgA3xpfgWfdr/
 qrjPpfGggHTcTpJMhd0rDr28DVXaf7ywnRnxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6gVz732TeLzAh3u/w29NhT4HzKDPkmcXR6VsrHgctQw=;
 b=B+7ddCHWsN+UzfELudJ6Bx3U4oDPnRuY4Ti/fVumXufVmcQwQO/ZlFK2zx4v3sLjJ5
 yKoqZVMZe+dgH2P4S8GQ8dZvkh4ctkdVpXCDiHZhgXKZVeFND2ipOTDCuM3O0k+PyDe4
 Hxm0Kd2f+9A1zE6YRpWiJOdJ846XaRoZF5rGP4dPkOKKLD/aR+7EZdecmdG3E9OPHPJr
 m95VRlQxupXiuOlyvSoiIk3KAcIQ8Ym80vZtvvW1cdeKTBQLHT082oGmZhDhWh+XwmrQ
 YhMSe+JzNVKMech5YgKpsrZ7J7QeSIxv0tjyLQgtnLJfCh9S+6xwWzxx04+0tgRq9y98
 2chg==
X-Gm-Message-State: AOAM533B+87e958HSWN+VqM0aDE9+kdjYwP635OqO/sOlg25UR43Tgn0
 kW9FkIfGTTWkK7BfFRd5ID7IjR3oc9ijSx2U+JvUqQ==
X-Google-Smtp-Source: ABdhPJy7Hpe4TqC16iOiipZ9J62IOW7zBuQatN2fRr0jBxp0Ne4X62deA1glG6KaqWDKH8oTGiAwYYm3AkoihTtHFMM=
X-Received: by 2002:aca:f491:: with SMTP id
 s139mr18925339oih.128.1625774036971; 
 Thu, 08 Jul 2021 12:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
 <9cc93adc-0a93-a0d5-422b-a57fac9bd450@amd.com>
In-Reply-To: <9cc93adc-0a93-a0d5-422b-a57fac9bd450@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 8 Jul 2021 21:53:45 +0200
Message-ID: <CAKMK7uGov-z-YB41DqrsEV=vgy5hBAmeEeuPpCBsUMFnNpeOpA@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] drm/sched: Barriers are needed for
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

On Thu, Jul 8, 2021 at 8:56 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
> On 2021-07-08 1:37 p.m., Daniel Vetter wrote:
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
> > index 64d398166644..4e1124ed80e0 100644
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
> > +      * if the queue is empty we allow drm_sched_job_arm() to lockless=
ly
>
>
> Probably meant drm_sched_entity_select_rq here

Which is called from drm_sched_job_arm but yes. I'll switch it around.

> > +      * access ->last_scheduled. This only works if we set the pointer=
 before
> > +      * we dequeue and if we a write barrier here.
> > +      */
> > +     smp_wmb();
> > +
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
>
>
> Shouldn't smp_rmb be here in between ? Given the queue is empty we want t=
o
> be certain we are reading the most recent value of entity->last_scheduled

Yeah I had a load_acquire barrier here earlier and then put the
smp_rmb() on the wrong side. Will fix.
>
> Andrey
>
>
>
> >
> > -     fence =3D READ_ONCE(entity->last_scheduled);
> > +     fence =3D entity->last_scheduled;
> > +
> > +     /*
> > +      * Only when the queue is empty are we guaranteed the the schedul=
er
> > +      * thread cannot change ->last_scheduled. To enforce ordering we =
need
> > +      * a read barrier here. See drm_sched_entity_pop_job() for the ot=
her
> > +      * side.
> > +      */
> > +     smp_rmb();
> > +
> > +     /* stay on the same engine if the previous job hasn't finished */
> >       if (fence && !dma_fence_is_signaled(fence))
> >               return;
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
