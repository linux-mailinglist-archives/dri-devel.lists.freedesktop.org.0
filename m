Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4F6D91E6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FAB10EB37;
	Thu,  6 Apr 2023 08:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541B210EB37
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:44:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso127403866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680770689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6xD/oYoQmuVCYYubj5pYyTF5ZwsHVOlBiTynaZ7UdEo=;
 b=lcbb76ASGT9XunpGIKRHlL1NPUWe0RRcE7vN4hvsN2AHoEgTP/z0CWxD9QokJhrbbT
 50m9X0ayvwxJXw2ss/DFCMVGbZRpXiWK26LuwCSrA0i6TU971igU0ayFB6yoJKj66R/Y
 ffo4+hkTjhOMw1X/oXy0///sj/3o6sFrwLmww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680770689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6xD/oYoQmuVCYYubj5pYyTF5ZwsHVOlBiTynaZ7UdEo=;
 b=B41grzpFkpOEAcZs/xrU8gqa4m1ZsTVa1E8TSvaz6oFKkr1BPz7PKWnNUMKD4W4yv2
 MTOTWjh7Qk0XIQUVjd4F0PlG3/I1kenqxag6m2z8vkDld5EI523Si5mEhi14uu4mjgNb
 lwr/B5vUdnAZPju41VTAQDQXP2V0MqPiquNpulN+Rn4KDLJ1FjSIm+KOBZ/QoFBKne/V
 xmcfhjmwJRygsqDmembR2A/sfw8yp1tYq0DeQjOdUHp5K0s9sZbrq1C1Lka+Epj1w4OM
 jRvbwiGD1N9cJBdPZB48d/HV1kBTr6PQcoOfckhmNZVw4lpnSdFvJxtvTtmyRR7NLfc7
 /25Q==
X-Gm-Message-State: AAQBX9fhax/UqxmiwhIbDMlXPe/7VgwXSAh92yBDUZ7serdiq2aWb6iV
 tdViPtecioFnrC0dN/eR6Fr2nQ==
X-Google-Smtp-Source: AKy350ao3Soq7NyBpEE8Islj/4luT04kQkrbekAL/uoxDlAdQ7a6fvIRUFarl1zcrCtbql5vi7w7zw==
X-Received: by 2002:a17:906:2216:b0:947:bff2:1c2d with SMTP id
 s22-20020a170906221600b00947bff21c2dmr5786279ejs.3.1680770689396; 
 Thu, 06 Apr 2023 01:44:49 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 z5-20020a170906074500b00930569e6910sm530809ejb.16.2023.04.06.01.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:44:49 -0700 (PDT)
Date: Thu, 6 Apr 2023 10:44:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Message-ID: <ZC6Gf+vl5Jem44Fw@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Asahi Lina <lina@asahilina.net>,
 Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, asahi@lists.linux.dev
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
 <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 asahi@lists.linux.dev, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:29:57AM +0200, Christian König wrote:
> Am 05.04.23 um 18:34 schrieb Asahi Lina:
> > A signaled scheduler fence can outlive its scheduler, since fences are
> > independently reference counted.
> 
> Well that is actually not correct. Schedulers are supposed to stay around
> until the hw they have been driving is no longer present.
> 
> E.g. the reference was scheduler_fence->hw_fence->driver->scheduler.
> 
> Your use case is now completely different to that and this won't work any
> more.

This is why I'm a bit a broken record suggesting that for the fw scheduler
case, where we have drm_sched_entity:drm_scheduler 1:1 and created at
runtime, we really should rework the interface exposed to drivers:

- drm_scheduler stays the thing that's per-engine and stays around for as
  long as the driver

- We split out a drm_sched_internal, which is either tied to drm_scheduler
  (ringbuffer scheduler mode) or drm_sched_entity (fw ctx scheduling
  mode).

- drm/sched internals are updated to dtrt in all these cases. And there's
  a lot, stuff like drm_sched_job is quite tricky if each driver needs to
  protect against concurrent ctx/entity creation/destruction, and I really
  don't like the idea that drivers hand-roll this kind of tricky state
  transition code that's used in the exceptional tdr/gpu/fw-death
  situation all themselves.
 
> This here might just be the first case where that breaks.

Yeah I expect there's going to be a solid stream of these, and we're just
going to random-walk in circles if this effort doesn't come with at least
some amount of design.

Thus far no one really comment on the above plan though, so I'm not sure
what the consensu plan is among all the various fw-scheduling driver
efforts ...
-Daniel

> 
> Regards,
> Christian.
> 
> >   Therefore, we can't reference the
> > scheduler in the get_timeline_name() implementation.
> > 
> > Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
> > dma-bufs reference fences from GPU schedulers that no longer exist.
> > 
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
> >   drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
> >   include/drm/gpu_scheduler.h              | 5 +++++
> >   3 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 15d04a0ec623..8b3b949b2ce8 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -368,7 +368,12 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >   		/*
> >   		 * Fence is from the same scheduler, only need to wait for
> > -		 * it to be scheduled
> > +		 * it to be scheduled.
> > +		 *
> > +		 * Note: s_fence->sched could have been freed and reallocated
> > +		 * as another scheduler. This false positive case is okay, as if
> > +		 * the old scheduler was freed all of its jobs must have
> > +		 * signaled their completion fences.
> >   		 */
> >   		fence = dma_fence_get(&s_fence->scheduled);
> >   		dma_fence_put(entity->dependency);
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 7fd869520ef2..33b145dfa38c 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -66,7 +66,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
> >   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
> >   {
> >   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > -	return (const char *)fence->sched->name;
> > +	return (const char *)fence->sched_name;
> >   }
> >   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> > @@ -168,6 +168,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> >   	unsigned seq;
> >   	fence->sched = entity->rq->sched;
> > +	strlcpy(fence->sched_name, entity->rq->sched->name,
> > +		sizeof(fence->sched_name));
> >   	seq = atomic_inc_return(&entity->fence_seq);
> >   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >   		       &fence->lock, entity->fence_context, seq);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 9db9e5e504ee..49f019731891 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -295,6 +295,11 @@ struct drm_sched_fence {
> >            * @lock: the lock used by the scheduled and the finished fences.
> >            */
> >   	spinlock_t			lock;
> > +        /**
> > +         * @sched_name: the name of the scheduler that owns this fence. We
> > +         * keep a copy here since fences can outlive their scheduler.
> > +         */
> > +	char sched_name[16];
> >           /**
> >            * @owner: job owner for debugging
> >            */
> > 
> > ---
> > base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> > change-id: 20230406-scheduler-uaf-1-994ec34cac93
> > 
> > Thank you,
> > ~~ Lina
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
