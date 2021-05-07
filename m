Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588963768C7
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 18:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAF26EE80;
	Fri,  7 May 2021 16:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E372B6E05F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 16:29:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m9so9891444wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=i5gqYyRVGDKtMiP6DIRn730yK875UZBGjViO2hUlN30=;
 b=Molaaqd6GohdZzV9tXCoFdj5VFvUKpx2iyGB4kcHJdTr+OEQiDfvl92exGLek2BBd7
 FCZ9BPcPK6HgpVPGhS4wTnfnZxnhO7ytsiqBxcOgB7rdBPsyRa0jr3H9NJ33nrGdRui+
 7Tdq3nrRLN/BBLOh6dsQIPo35q5Ht+1z86F8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i5gqYyRVGDKtMiP6DIRn730yK875UZBGjViO2hUlN30=;
 b=BHLfjcWc447zi3XkL5L0Dxqa537xhcnb8TbbAzXtDTs8GDzuFuIZZuDlhEoIv1lM+b
 Hr91TETmHAZBuqQqeCzVkbs1hBMnWyD85QdVNAnNaoGgCaqE5TJQkLM9F/G9AlwSlRxm
 NKDSvzfdlx0AhVip0esshFESnZ2U1X/TbqRGltQzjrPHM9UN/avJ/VIwWqLAv1HTVD4B
 PeFEtA8UkcCBdX5i+UmYFfajclaOpS1e4rGeTmZFoPj/LpDTKFXJLvXKtkPGknGzh++u
 Em2BGCQ2csaXXTcrWKdG3x0LEt4VjWhi+N67UOE2m3bdMLHkCl9+RL4T0cvwN/hYYug9
 2xhA==
X-Gm-Message-State: AOAM532h4E87R76bMSqCYNvvNifmsVscCcE1a8a5GaSghMC5gaSGddfn
 9sTJ94iQg97cvsSscjTlPCpwAQ==
X-Google-Smtp-Source: ABdhPJzCoXyg/sKzN6Z3xNGDfY7Ya6xJX07aCIOt/3IDjdUxBfaeQ6kZEe2+EaftMEIX797yslaGbA==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr13246262wrt.220.1620404965628; 
 Fri, 07 May 2021 09:29:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x65sm16531820wmg.36.2021.05.07.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 09:29:25 -0700 (PDT)
Date: Fri, 7 May 2021 18:29:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
Message-ID: <YJVq4x4d81rY2GHB@phenom.ffwll.local>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
 <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
 <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
 <0c598888-d7d4-451a-3d4a-01c46ddda397@gmail.com>
 <a704880d-8e27-3cca-f42b-1320d39ac503@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a704880d-8e27-3cca-f42b-1320d39ac503@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com,
 linux-pci@vger.kernel.org, amd-gfx@lists.freedesktop.org, helgaas@kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alexander.Deucher@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 12:10:57PM -0400, Andrey Grodzovsky wrote:
> 
> 
> On 2021-04-30 2:47 a.m., Christian König wrote:
> > 
> > 
> > Am 29.04.21 um 19:06 schrieb Andrey Grodzovsky:
> > > 
> > > 
> > > On 2021-04-29 3:18 a.m., Christian König wrote:
> > > > I need to take another look at this part when I don't have a
> > > > massive headache any more.
> > > > 
> > > > Maybe split the patch set up into different parts, something like:
> > > > 1. Adding general infrastructure.
> > > > 2. Making sure all memory is unpolated.
> > > > 3. Job and fence handling
> > > 
> > > I am not sure you mean this patch here, maybe another one ?
> > > Also note you already RBed it.
> > 
> > No what I meant was to send out the patches before this one as #1 and #2.
> > 
> > That is the easier stuff which can easily go into the drm-misc-next or
> > amd-staging-drm-next branch.
> > 
> > The scheduler stuff certainly need to go into drm-misc-next.
> > 
> > Christian.
> 
> Got you. I am fine with it. What we have here is a working hot-unplug
> code but, one with potential use after free MMIO ranges frpom the zombie
> device. The followup patches after this patch are all about preventing
> this and so the patch-set up until this patch including, is functional
> on it's own. While it's necessary to solve the above issue, it's has
> complications as can be seen from the discussion with Daniel on later
> patch in this series. Still, in my opinion it's better to rollout some
> initial support to hot-unplug without use after free protection then
> having no support for hot-unplug at all. It will also make the merge
> work easier as I need to constantly rebase the patches on top latest
> kernel and solve new regressions.
> 
> Daniel - given the arguments above can you sound your opinion on this
> approach ?

I'm all for incrementally landing this, because it's really hard and
tricky. We might need to go back to some of the decisions, or clarify
things more, or more headaches and pondering how to fix all the parts
that works best to make sure there's no nasty races right across hotunplug
if you're unlucky enough.

But yeah better aim for something and then readjust than bikeshed forever
out of tree.

Cheers, Daniel

> 
> Andrey
> > 
> > > 
> > > Andrey
> > > 
> > > > 
> > > > Christian.
> > > > 
> > > > Am 28.04.21 um 17:11 schrieb Andrey Grodzovsky:
> > > > > Problem: If scheduler is already stopped by the time sched_entity
> > > > > is released and entity's job_queue not empty I encountred
> > > > > a hang in drm_sched_entity_flush. This is because
> > > > > drm_sched_entity_is_idle
> > > > > never becomes false.
> > > > > 
> > > > > Fix: In drm_sched_fini detach all sched_entities from the
> > > > > scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
> > > > > Also wakeup all those processes stuck in sched_entity flushing
> > > > > as the scheduler main thread which wakes them up is stopped by now.
> > > > > 
> > > > > v2:
> > > > > Reverse order of drm_sched_rq_remove_entity and marking
> > > > > s_entity as stopped to prevent reinserion back to rq due
> > > > > to race.
> > > > > 
> > > > > v3:
> > > > > Drop drm_sched_rq_remove_entity, only modify entity->stopped
> > > > > and check for it in drm_sched_entity_is_idle
> > > > > 
> > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > > ---
> > > > >   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
> > > > >   drivers/gpu/drm/scheduler/sched_main.c   | 24
> > > > > ++++++++++++++++++++++++
> > > > >   2 files changed, 26 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > index f0790e9471d1..cb58f692dad9 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > @@ -116,7 +116,8 @@ static bool
> > > > > drm_sched_entity_is_idle(struct drm_sched_entity *entity)
> > > > >       rmb(); /* for list_empty to work without lock */
> > > > >       if (list_empty(&entity->list) ||
> > > > > -        spsc_queue_count(&entity->job_queue) == 0)
> > > > > +        spsc_queue_count(&entity->job_queue) == 0 ||
> > > > > +        entity->stopped)
> > > > >           return true;
> > > > >       return false;
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 908b0b56032d..ba087354d0a8 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -897,9 +897,33 @@ EXPORT_SYMBOL(drm_sched_init);
> > > > >    */
> > > > >   void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > > > >   {
> > > > > +    struct drm_sched_entity *s_entity;
> > > > > +    int i;
> > > > > +
> > > > >       if (sched->thread)
> > > > >           kthread_stop(sched->thread);
> > > > > +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >=
> > > > > DRM_SCHED_PRIORITY_MIN; i--) {
> > > > > +        struct drm_sched_rq *rq = &sched->sched_rq[i];
> > > > > +
> > > > > +        if (!rq)
> > > > > +            continue;
> > > > > +
> > > > > +        spin_lock(&rq->lock);
> > > > > +        list_for_each_entry(s_entity, &rq->entities, list)
> > > > > +            /*
> > > > > +             * Prevents reinsertion and marks job_queue as idle,
> > > > > +             * it will removed from rq in drm_sched_entity_fini
> > > > > +             * eventually
> > > > > +             */
> > > > > +            s_entity->stopped = true;
> > > > > +        spin_unlock(&rq->lock);
> > > > > +
> > > > > +    }
> > > > > +
> > > > > +    /* Wakeup everyone stuck in drm_sched_entity_flush for
> > > > > this scheduler */
> > > > > +    wake_up_all(&sched->job_scheduled);
> > > > > +
> > > > >       /* Confirm no work left behind accessing device structures */
> > > > >       cancel_delayed_work_sync(&sched->work_tdr);
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
