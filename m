Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F60D3FC7EC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C1C899AB;
	Tue, 31 Aug 2021 13:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A27289954
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:11:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q11so27608195wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NXSiHSF/O6ASQcBeyP4E41YwXaZJiR+NQCf8vo0r73M=;
 b=SbqpgbqgxppNY7bkAok7YEDIKxqjtSfVBNFgLhkMwNx31JtEDpXN9k1+LuCuFlUymB
 IuXayMs3wya5GyXAKm0z0+mQCr9+0k2x5iV4tLkO4WHZUjVx5Sk92mPmJntqfud8FR7a
 mF16JYbfwgrFOVkovbUx14mPMy90plxcavvP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NXSiHSF/O6ASQcBeyP4E41YwXaZJiR+NQCf8vo0r73M=;
 b=SXQUIZtHIt5eyqVQ/QbZBx3KVYvH4hBFt/YnOG1LcngGan9Wp6WXhqbL61eYhg4nOH
 o19pTUNsBK9Wwd3knWlpQtJsBP9q4KLqVoJn3bVSkyKTudJKGo9PeOi+h7dbATuj2109
 r17jb5KgpPeuWMLwlkI7EPK0OmMO1Hs3Jgt1LVjKwL9w6T5QlQR9xl7DI7TM28+YRFHS
 qLsSGMcpWlNxa+fRTb77ptijtryvm+S+Udksn2LSOiSAm3g1uP8GKbx4ALdp5rPsgNJB
 8t5cj5Dg37A8NVo5sc/MHCm06X77uxvgdXJehQKSz88Y2PvjMNTQa23R3TxK1TDc9610
 BCsg==
X-Gm-Message-State: AOAM533uGLvM2acO3faIHZefQjDAbummcxiGyxAnwvgeRBMkYBIQSu5i
 FDM/T25dIume0zdzhgdQnxqqig==
X-Google-Smtp-Source: ABdhPJxBAI9aWj1N1ynt6AwhWlXcBXSkCWd+0mSxlzXRmDNH6eYs8Msd0161nrssS6cqB1VtNCZwSQ==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr14663268wre.39.1630415498016; 
 Tue, 31 Aug 2021 06:11:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c24sm18275926wrb.57.2021.08.31.06.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:11:37 -0700 (PDT)
Date: Tue, 31 Aug 2021 15:11:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>,
 Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "monk.liu" <monk.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
 <YSdZDtXcjxE/SPpr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSdZDtXcjxE/SPpr@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Aug 26, 2021 at 11:04:14AM +0200, Daniel Vetter wrote:
> On Thu, Aug 19, 2021 at 11:25:09AM -0400, Andrey Grodzovsky wrote:
> > 
> > On 2021-08-19 5:30 a.m., Daniel Vetter wrote:
> > > On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
> > > > On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > > > > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > > > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > > > > > 
> > > > > > > > > + dri-devel
> > > > > > > > > 
> > > > > > > > > Since scheduler is a shared component, please add dri-devel on all
> > > > > > > > > scheduler patches.
> > > > > > > > > 
> > > > > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > > > > > > > > [Why]
> > > > > > > > > > for bailing job, this commit will delete it from pending list thus the
> > > > > > > > > > bailing job will never have a chance to be resubmitted even in advance
> > > > > > > > > > tdr mode.
> > > > > > > > > > 
> > > > > > > > > > [How]
> > > > > > > > > > after embeded hw_fence into amdgpu_job is done, the race condition that
> > > > > > > > > > this commit tries to work around is completely solved.So revert this
> > > > > > > > > > commit.
> > > > > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > > > > v2:
> > > > > > > > > > add dma_fence_get/put() around timedout_job to avoid concurrent delete
> > > > > > > > > > during processing timedout_job
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > > > > ---
> > > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > > > > > > > > >      1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > >      {
> > > > > > > > > >             struct drm_gpu_scheduler *sched;
> > > > > > > > > >             struct drm_sched_job *job;
> > > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > > >             enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > > > > > 
> > > > > > > > > >             sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > > > > > > > > > @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > 
> > > > > > > > > >             if (job) {
> > > > > > > > > >                     /*
> > > > > > > > > > -                * Remove the bad job so it cannot be freed by concurrent
> > > > > > > > > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > > > > > -                * is parked at which point it's safe.
> > > > > > > > > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > > > > > > > > +                * processing timedout_job
> > > > > > > > > >                      */
> > > > > > > > > > -               list_del_init(&job->list);
> > > > > > > > > > +               fence = dma_fence_get(job->s_fence->parent);
> > > > > > > > While this is true for amdgpu, it has no meaning for other drivers for whom
> > > > > > > > we haven't
> > > > > > > > done the refactoring of embedding HW fence (parent) into the job structure.
> > > > > > > > In fact thinking
> > > > > > > > about it, unless you do the HW fence embedding for all the drivers using the
> > > > > > > > scheduler you cannot
> > > > > > > > revert this patch or you will just break them.
> > > > > > > btw, why did you do that embedding? I do still have my patches with
> > > > > > > dma_fence annotations floating around, but my idea at least was to fix
> > > > > > > that issue with a mempool, not with embeddeding. What was the motivation
> > > > > > > for embedding the wh fence?
> > > > > > > -Daniel
> > > > > > The motivation was 2 fold, avoid memory allocation during jobs submissions
> > > > > > (HW fence allocation) because as Christian explained this leads to deadlock
> > > > > > with
> > > > > > mm code during evictions due to memory pressure (Christian can clarify if I
> > > > > > messed
> > > > > Yeah that's the exact same thing I've chased with my dma_fence
> > > > > annotations, but thus far zero to none interested in getting it sorted. I
> > > > > think it'd be good to have some cross-driver agreement on how this should
> > > > > be solved before someone just charges ahead ...
> > > > > 
> > > > > > this explanation). Second is to exactly revert this patch because while it
> > > > > > solved the issue
> > > > > > described in the patch it created another with drivers who baildc out early
> > > > > > during TDR handling
> > > > > > for various reason and the job would just leak because it was already
> > > > > > removed form pending list.
> > > > > Can't we reinsert it before we restart the scheduler thread? It might need
> > > > > a separate list for that due to the lockless queue tricks. Or am I
> > > > > thinking about the wrong kind of "we lost the job"?
> > > > > -Danile
> > > > 
> > > > If you look at the original patch it would reinsert it even earlier - right
> > > > after stopping the  SW scheduler thread, and even then it was to late for
> > > > some drivers as they would decide to return back from their TDR handler even
> > > > before that. It is solvable but in an ugly way as far as I see, you need to
> > > > require each driver in his code to put the job back in the list if they do
> > > > it before reaching the place where scheduler framework does it. Kind of
> > > > spaghetti code seems to me.
> > > Hm yeah I didn't realize this all happens before we stop the scheduler
> > > thread.
> > > 
> > > Why can't we stop the scheduler thread first, so that there's guaranteed
> > > no race? I've recently had a lot of discussions with panfrost folks about
> > > their reset that spawns across engines, and without stopping the scheduler
> > > thread first before you touch anything it's just plain impossible.
> > 
> > 
> > Talked with Christian on that, for each TDR we actually stop all the
> > schedulers for all the rings and not only the hanged ring since
> > ASIC reset will impact all the rings anyway. So we cannot allow
> > other timeout handlers for other rings run in parallel to ours
> > as they will stop/restart the threads we just stopped and rely
> > on them being stopped. So it's all done with device wide lock
> > inside the amdgpu tTDR handler. Only inside the locked
> > section then we may stop/restart the scheduler threads.
> > Christian also mentioned that you proposed at some point
> > to serialize all TDR handling into single threading for all rings - this
> > seems
> > like something that could be used - we then don't need any
> > locking against TDR handlers from other rings and then we may
> > stop the scheduler thread as first step
> > 
> > 
> > > 
> > > I'm also still not understanding what exactly you guys have done,
> > > can someone please dig out the the amdgpu patches that motivate all this
> > > maybe that's clearer? A full explanation would still be good since I've
> > > only started in scheduler stuff.
> > 
> > 
> > https://gitlab.freedesktop.org/agd5f/linux/-/commit/de7515d43659f852590645a688f8d493e4a18141
> 
> Uh, it would have been really good if this was discussed a bit wider
> beforehand. Now we have rather diverging approaches to this. Also would be
> really good to resurrect the dma_fence annotations too.
> 
> Can you guys pls spend a bit of time on this? Shouldn't be to hard to type
> up rfc conversion patches for the other drivers.

Ping for this. Currently the hw fence is returned from the ->run_job
callback, and that's not great design.

If we embed it, then I think it should start existing latest from
drm_sched_job_arm. Maybe not yet initialized, but at least allocated. So
the right thing to do here is to have the hw fence as a pointer in
struct drm_sched_job. And check in drm_sched_job_arm() that it's at least
allocated.

Otherwise we're just diverging across drivers and tempting them to do the
wrong thing with the current ->run_job callback interface.

Can you guys look into this?
-Daniel

> > > Another thing I recently pondered for tdr races looking at i915 code is
> > > whether the tdr should first block the completion fence for that job. My
> > > motivation is to have a race-free error capture (if the completion races
> > > then we might start evicting memory and everything goes boom), but maybe
> > > that helps here too. Some kind of atomic "block this fence from
> > > completing thing.
> > > 
> > > Or I'm I completely guessing in the wrong direction?
> > 
> > 
> > I think we already do it here - https://elixir.bootlin.com/linux/v5.14-rc1/source/drivers/gpu/drm/scheduler/sched_main.c#L410
> 
> Ah yes this works becase drm/sched has separate hw fence from the logical
> job fence.
> -Daniel
> 
> > 
> > Andrey
> > 
> > 
> > > -Daniel
> > > 
> > > > Andrey
> > > > 
> > > > 
> > > > > > Andrey
> > > > > > 
> > > > > > 
> > > > > > > > Andrey
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > >                     spin_unlock(&sched->job_list_lock);
> > > > > > > > > > 
> > > > > > > > > >                     status = job->sched->ops->timedout_job(job);
> > > > > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > >                             job->sched->ops->free_job(job);
> > > > > > > > > >                             sched->free_guilty = false;
> > > > > > > > > >                     }
> > > > > > > > > > +               dma_fence_put(fence);
> > > > > > > > > >             } else {
> > > > > > > > > >                     spin_unlock(&sched->job_list_lock);
> > > > > > > > > >             }
> > > > > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > > > > 
> > > > > > > > > >             kthread_park(sched->thread);
> > > > > > > > > > 
> > > > > > > > > > -       /*
> > > > > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > > > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > > > > > -        * bad job at this point - we parked (waited for) any in progress
> > > > > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > > > > -        */
> > > > > > > > > > -       if (bad && bad->sched == sched)
> > > > > > > > > > -               /*
> > > > > > > > > > -                * Add at the head of the queue to reflect it was the earliest
> > > > > > > > > > -                * job extracted.
> > > > > > > > > > -                */
> > > > > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > > > > -
> > > > > > > > > >             /*
> > > > > > > > > >              * Iterate the job list from later to  earlier one and either deactive
> > > > > > > > > >              * their HW callbacks or remove them from pending list if they already
> > > > > > > > > > --
> > > > > > > > > > 2.25.1
> > > > > > > > > > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
