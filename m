Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879353FEF70
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6CE6E53E;
	Thu,  2 Sep 2021 14:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDE16E51B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:28:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1506483wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hZCB/ECgZExD91xtYKU6TE2ulgloDddyk+UQesxuiEE=;
 b=Dm+xRGeOlgoBljYYTo+HTdzdgFk0aVouSkACQxmNDsPVnzQZMKM0CrRSVB68dA/685
 0TVJzOwVSWug9yV3Bn5MkB9yVeijfzpJ0uREJmyA+FGfLOLREH8fVGdfsrmgx8ad+sbB
 RY5jA9lNN0nlvgR0ZcEr0oQvWUcDjph7LcVJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hZCB/ECgZExD91xtYKU6TE2ulgloDddyk+UQesxuiEE=;
 b=neTzk89oKPE4Lw74E8yXVvrFopc5Xo2Y5zCvcI/p44mwNoaKRYsV1iFU7rRcaBCmgv
 9n5TJOW/+I72F0QvTa23gVqptHc/cTmvf9PQ7wxgrDrrfee1AcCWs+lXxXIVYnJVy/1J
 LZrh0kDDIuwk6noDo3R3s6scmz+i0lp6ZaTKG/+oyl7ClyTDTY2J7nZj/yHFyf8WSzsK
 uUzzNTi0d8Y7qhf4SwLqzvkDVZY0OSFZwq16hJcCc2pOQrmkhQ4c7Z6odJKJqqJv4G2u
 I4nqY3EZA4LDSi0g3XhfyOElWU2yDOnxgeglfCNDc/GkIdAXEo12GcVYoQOSs8bzfsjE
 dI/Q==
X-Gm-Message-State: AOAM532gYfbkBLx/cPBfGj5fqeQjtW4bg9oBGiCs1IUY6SF8GkMa/9To
 T+O54fi/yzJh9y8fcLLZTxDXqg==
X-Google-Smtp-Source: ABdhPJy481+4o02H8XF6+13TAeY5GiO10trj29YGcGrzJFqUbsreIVzhsiEAMpig9DmiqUBcZX3/NA==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr3427590wmb.59.1630592889857;
 Thu, 02 Sep 2021 07:28:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n4sm1966070wri.78.2021.09.02.07.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:28:09 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:28:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>,
 Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "monk.liu" <monk.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YTDfd+ibZuxiispx@phenom.ffwll.local>
References: <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
 <YSdZDtXcjxE/SPpr@phenom.ffwll.local>
 <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
 <2ee688a4-338b-8180-1673-2fc73c7751ba@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ee688a4-338b-8180-1673-2fc73c7751ba@amd.com>
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

On Tue, Aug 31, 2021 at 02:24:52PM -0400, Andrey Grodzovsky wrote:
> 
> On 2021-08-31 9:11 a.m., Daniel Vetter wrote:
> > On Thu, Aug 26, 2021 at 11:04:14AM +0200, Daniel Vetter wrote:
> > > On Thu, Aug 19, 2021 at 11:25:09AM -0400, Andrey Grodzovsky wrote:
> > > > On 2021-08-19 5:30 a.m., Daniel Vetter wrote:
> > > > > On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
> > > > > > On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > > > > > > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > > > > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > > > > > > > 
> > > > > > > > > > > + dri-devel
> > > > > > > > > > > 
> > > > > > > > > > > Since scheduler is a shared component, please add dri-devel on all
> > > > > > > > > > > scheduler patches.
> > > > > > > > > > > 
> > > > > > > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > > > > > > > > > > [Why]
> > > > > > > > > > > > for bailing job, this commit will delete it from pending list thus the
> > > > > > > > > > > > bailing job will never have a chance to be resubmitted even in advance
> > > > > > > > > > > > tdr mode.
> > > > > > > > > > > > 
> > > > > > > > > > > > [How]
> > > > > > > > > > > > after embeded hw_fence into amdgpu_job is done, the race condition that
> > > > > > > > > > > > this commit tries to work around is completely solved.So revert this
> > > > > > > > > > > > commit.
> > > > > > > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > > > > > > v2:
> > > > > > > > > > > > add dma_fence_get/put() around timedout_job to avoid concurrent delete
> > > > > > > > > > > > during processing timedout_job
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >       drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > > > > > > > > > > >       1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > > > > > > > 
> > > > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > > >       {
> > > > > > > > > > > >              struct drm_gpu_scheduler *sched;
> > > > > > > > > > > >              struct drm_sched_job *job;
> > > > > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > > > > >              enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > > > > > > > 
> > > > > > > > > > > >              sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > > > > > > > > > > > @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > > > 
> > > > > > > > > > > >              if (job) {
> > > > > > > > > > > >                      /*
> > > > > > > > > > > > -                * Remove the bad job so it cannot be freed by concurrent
> > > > > > > > > > > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > > > > > > > -                * is parked at which point it's safe.
> > > > > > > > > > > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > > > > > > > > > > +                * processing timedout_job
> > > > > > > > > > > >                       */
> > > > > > > > > > > > -               list_del_init(&job->list);
> > > > > > > > > > > > +               fence = dma_fence_get(job->s_fence->parent);
> > > > > > > > > > While this is true for amdgpu, it has no meaning for other drivers for whom
> > > > > > > > > > we haven't
> > > > > > > > > > done the refactoring of embedding HW fence (parent) into the job structure.
> > > > > > > > > > In fact thinking
> > > > > > > > > > about it, unless you do the HW fence embedding for all the drivers using the
> > > > > > > > > > scheduler you cannot
> > > > > > > > > > revert this patch or you will just break them.
> > > > > > > > > btw, why did you do that embedding? I do still have my patches with
> > > > > > > > > dma_fence annotations floating around, but my idea at least was to fix
> > > > > > > > > that issue with a mempool, not with embeddeding. What was the motivation
> > > > > > > > > for embedding the wh fence?
> > > > > > > > > -Daniel
> > > > > > > > The motivation was 2 fold, avoid memory allocation during jobs submissions
> > > > > > > > (HW fence allocation) because as Christian explained this leads to deadlock
> > > > > > > > with
> > > > > > > > mm code during evictions due to memory pressure (Christian can clarify if I
> > > > > > > > messed
> > > > > > > Yeah that's the exact same thing I've chased with my dma_fence
> > > > > > > annotations, but thus far zero to none interested in getting it sorted. I
> > > > > > > think it'd be good to have some cross-driver agreement on how this should
> > > > > > > be solved before someone just charges ahead ...
> > > > > > > 
> > > > > > > > this explanation). Second is to exactly revert this patch because while it
> > > > > > > > solved the issue
> > > > > > > > described in the patch it created another with drivers who baildc out early
> > > > > > > > during TDR handling
> > > > > > > > for various reason and the job would just leak because it was already
> > > > > > > > removed form pending list.
> > > > > > > Can't we reinsert it before we restart the scheduler thread? It might need
> > > > > > > a separate list for that due to the lockless queue tricks. Or am I
> > > > > > > thinking about the wrong kind of "we lost the job"?
> > > > > > > -Danile
> > > > > > If you look at the original patch it would reinsert it even earlier - right
> > > > > > after stopping the  SW scheduler thread, and even then it was to late for
> > > > > > some drivers as they would decide to return back from their TDR handler even
> > > > > > before that. It is solvable but in an ugly way as far as I see, you need to
> > > > > > require each driver in his code to put the job back in the list if they do
> > > > > > it before reaching the place where scheduler framework does it. Kind of
> > > > > > spaghetti code seems to me.
> > > > > Hm yeah I didn't realize this all happens before we stop the scheduler
> > > > > thread.
> > > > > 
> > > > > Why can't we stop the scheduler thread first, so that there's guaranteed
> > > > > no race? I've recently had a lot of discussions with panfrost folks about
> > > > > their reset that spawns across engines, and without stopping the scheduler
> > > > > thread first before you touch anything it's just plain impossible.
> > > > 
> > > > Talked with Christian on that, for each TDR we actually stop all the
> > > > schedulers for all the rings and not only the hanged ring since
> > > > ASIC reset will impact all the rings anyway. So we cannot allow
> > > > other timeout handlers for other rings run in parallel to ours
> > > > as they will stop/restart the threads we just stopped and rely
> > > > on them being stopped. So it's all done with device wide lock
> > > > inside the amdgpu tTDR handler. Only inside the locked
> > > > section then we may stop/restart the scheduler threads.
> > > > Christian also mentioned that you proposed at some point
> > > > to serialize all TDR handling into single threading for all rings - this
> > > > seems
> > > > like something that could be used - we then don't need any
> > > > locking against TDR handlers from other rings and then we may
> > > > stop the scheduler thread as first step
> > > > 
> > > > 
> > > > > I'm also still not understanding what exactly you guys have done,
> > > > > can someone please dig out the the amdgpu patches that motivate all this
> > > > > maybe that's clearer? A full explanation would still be good since I've
> > > > > only started in scheduler stuff.
> > > > 
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux%2F-%2Fcommit%2Fde7515d43659f852590645a688f8d493e4a18141&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C94e4badd78c04cb74ad208d96c80debd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660123033001546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=itjKBNUdOAyze1%2FOWJtBD7ed%2B8PBbB28QbJEddkc98w%3D&amp;reserved=0
> > > Uh, it would have been really good if this was discussed a bit wider
> > > beforehand. Now we have rather diverging approaches to this. Also would be
> > > really good to resurrect the dma_fence annotations too.
> > > 
> > > Can you guys pls spend a bit of time on this? Shouldn't be to hard to type
> > > up rfc conversion patches for the other drivers.
> > Ping for this. Currently the hw fence is returned from the ->run_job
> > callback, and that's not great design.
> 
> 
> What's the problem you see there ?

For one, all other drivers work like that, and it's not great to be
inconsistent. And it allows that inconsistent/wrong pattern to continue.

Second I'm not even sure you can embed the hw fence, because there's this
job restarting going on. Which at least thus far allocated a new hw fence.
So this needs considerations.

> > If we embed it, then I think it should start existing latest from
> > drm_sched_job_arm. Maybe not yet initialized, but at least allocated. So
> > the right thing to do here is to have the hw fence as a pointer in
> > struct drm_sched_job. And check in drm_sched_job_arm() that it's at least
> > allocated.
> 
> 
> Why we need to allocate the HW fence if it's embedded within a job struct ?

the hw fence is a refcounted struct, and the drm_sched_job is a different
struct. And we didn't have a dri-devel discussion about whether it's
correct to conflate these two lifetimes, amdgpu folks simply hacked
something together.

> > Otherwise we're just diverging across drivers and tempting them to do the
> > wrong thing with the current ->run_job callback interface.
> 
> 
> Maybe we should switch from embedding in driver level job struct as it's now
> to drm_sched_job and just leave the fence initialization to driver specific
> code ?

Maybe? Like I've not been involved in these discussion ont he amd side at
all, I'm just noticing that we do have a now rather inconsistently used
inteface across drivers. Which is no good.
-Daniel

> 
> Andrey
> 
> 
> > 
> > Can you guys look into this?
> > -Daniel
> > 
> > > > > Another thing I recently pondered for tdr races looking at i915 code is
> > > > > whether the tdr should first block the completion fence for that job. My
> > > > > motivation is to have a race-free error capture (if the completion races
> > > > > then we might start evicting memory and everything goes boom), but maybe
> > > > > that helps here too. Some kind of atomic "block this fence from
> > > > > completing thing.
> > > > > 
> > > > > Or I'm I completely guessing in the wrong direction?
> > > > 
> > > > I think we already do it here - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.14-rc1%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fscheduler%2Fsched_main.c%23L410&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C94e4badd78c04cb74ad208d96c80debd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660123033001546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Maya0Mk1sAliheOv7fCM8bTC7qTOp74Agt1u67kYCJw%3D&amp;reserved=0
> > > Ah yes this works becase drm/sched has separate hw fence from the logical
> > > job fence.
> > > -Daniel
> > > 
> > > > Andrey
> > > > 
> > > > 
> > > > > -Daniel
> > > > > 
> > > > > > Andrey
> > > > > > 
> > > > > > 
> > > > > > > > Andrey
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > > Andrey
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > >                      spin_unlock(&sched->job_list_lock);
> > > > > > > > > > > > 
> > > > > > > > > > > >                      status = job->sched->ops->timedout_job(job);
> > > > > > > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > > >                              job->sched->ops->free_job(job);
> > > > > > > > > > > >                              sched->free_guilty = false;
> > > > > > > > > > > >                      }
> > > > > > > > > > > > +               dma_fence_put(fence);
> > > > > > > > > > > >              } else {
> > > > > > > > > > > >                      spin_unlock(&sched->job_list_lock);
> > > > > > > > > > > >              }
> > > > > > > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > > > > > > 
> > > > > > > > > > > >              kthread_park(sched->thread);
> > > > > > > > > > > > 
> > > > > > > > > > > > -       /*
> > > > > > > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > > > > > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > > > > > > > -        * bad job at this point - we parked (waited for) any in progress
> > > > > > > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > > > > > > -        */
> > > > > > > > > > > > -       if (bad && bad->sched == sched)
> > > > > > > > > > > > -               /*
> > > > > > > > > > > > -                * Add at the head of the queue to reflect it was the earliest
> > > > > > > > > > > > -                * job extracted.
> > > > > > > > > > > > -                */
> > > > > > > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > > > > > > -
> > > > > > > > > > > >              /*
> > > > > > > > > > > >               * Iterate the job list from later to  earlier one and either deactive
> > > > > > > > > > > >               * their HW callbacks or remove them from pending list if they already
> > > > > > > > > > > > --
> > > > > > > > > > > > 2.25.1
> > > > > > > > > > > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C94e4badd78c04cb74ad208d96c80debd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660123033001546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=r7EGQcWGcRinVxmD%2F%2FIFA8WgRpYNnt7feQseD92U6kc%3D&amp;reserved=0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
