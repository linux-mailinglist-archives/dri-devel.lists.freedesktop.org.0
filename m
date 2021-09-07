Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A140255E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9AE89D60;
	Tue,  7 Sep 2021 08:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01AE89D60
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:47:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u16so13260433wrn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=J1bW2zzm3LOhsGIx8ue0HgQEq5zUFkyTu5jGF/lhJqQ=;
 b=lRrh7nNjj3DiNV463M5MkC6+yPv0IL5rZJ8mpfSjx8KQKD+FUYh3zdVVySOI8GtvJ7
 mI/cQzymqfcPr3SYUUH6ANDSsOwBA69nR/YhxDPFNk0XDaBCnlGxrXKq7n45IX+Ou52z
 Be8L6fZ3L9t+FUIckfDZoiMYe2JNsPRsaQhbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J1bW2zzm3LOhsGIx8ue0HgQEq5zUFkyTu5jGF/lhJqQ=;
 b=DN2omPZSgR5SCEBQg1q3mAagxhoSIdVf2nDVvIRZfEzJUUZzHD+diOcKfxP3KXZNsc
 XM01LPri4774HBSJriF0jGHDk4hJkUJjVW03OMnXptTYhG+g9l2kX3uoJr7rlM8cZvdc
 veDaaxxdZOg94cX3/BP7C2urw8wwZBYrBs5ChcqthJNSif8kOoP+Pfcl6tmcehNEZPAP
 NKUdL53RgyiBiy2NCTU6cUZsbJKh/pZLvfFePs11TYwcbQpol47s8TpgIQSb+6d28+rh
 Oysbmdyq2y+Or4auYztcgF2402SeIx+KlOyvhSfGq77VoYwu7kaGS7jlnEIxMLqHo+u8
 XGdQ==
X-Gm-Message-State: AOAM533XY8YY8Z+45amumq19qbf9WIYfY7PcgUYkeK4AN1VBnghaX2XM
 7h5PdoHc/PClMkFOmDk3KSJ8/A==
X-Google-Smtp-Source: ABdhPJyhZqjua9O5sKKugZrr261wONTNsxXlIOyOsPmK8tCZ4emx/W1gr0aQOQ/i3payey8y0cQv7g==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr17185128wro.379.1631004427241; 
 Tue, 07 Sep 2021 01:47:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q4sm10479175wra.43.2021.09.07.01.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:47:06 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:47:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>,
 Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "monk.liu" <monk.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YTcnCOwUvZQWwv9p@phenom.ffwll.local>
References: <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
 <YSdZDtXcjxE/SPpr@phenom.ffwll.local>
 <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
 <2ee688a4-338b-8180-1673-2fc73c7751ba@amd.com>
 <YTDfd+ibZuxiispx@phenom.ffwll.local>
 <d06a45d2-7ac0-fc76-c4d7-e4094936e900@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d06a45d2-7ac0-fc76-c4d7-e4094936e900@amd.com>
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

On Thu, Sep 02, 2021 at 11:36:34AM -0400, Andrey Grodzovsky wrote:
> 
> On 2021-09-02 10:28 a.m., Daniel Vetter wrote:
> > On Tue, Aug 31, 2021 at 02:24:52PM -0400, Andrey Grodzovsky wrote:
> > > On 2021-08-31 9:11 a.m., Daniel Vetter wrote:
> > > > On Thu, Aug 26, 2021 at 11:04:14AM +0200, Daniel Vetter wrote:
> > > > > On Thu, Aug 19, 2021 at 11:25:09AM -0400, Andrey Grodzovsky wrote:
> > > > > > On 2021-08-19 5:30 a.m., Daniel Vetter wrote:
> > > > > > > On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > > > > > > > > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > > > > > > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > > + dri-devel
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Since scheduler is a shared component, please add dri-devel on all
> > > > > > > > > > > > > scheduler patches.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > > > > > > > > > > > > [Why]
> > > > > > > > > > > > > > for bailing job, this commit will delete it from pending list thus the
> > > > > > > > > > > > > > bailing job will never have a chance to be resubmitted even in advance
> > > > > > > > > > > > > > tdr mode.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > [How]
> > > > > > > > > > > > > > after embeded hw_fence into amdgpu_job is done, the race condition that
> > > > > > > > > > > > > > this commit tries to work around is completely solved.So revert this
> > > > > > > > > > > > > > commit.
> > > > > > > > > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > > > > > > > > v2:
> > > > > > > > > > > > > > add dma_fence_get/put() around timedout_job to avoid concurrent delete
> > > > > > > > > > > > > > during processing timedout_job
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > >        drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > > > > > > > > > > > > >        1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > > > > >        {
> > > > > > > > > > > > > >               struct drm_gpu_scheduler *sched;
> > > > > > > > > > > > > >               struct drm_sched_job *job;
> > > > > > > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > > > > > > >               enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >               sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > > > > > > > > > > > > > @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >               if (job) {
> > > > > > > > > > > > > >                       /*
> > > > > > > > > > > > > > -                * Remove the bad job so it cannot be freed by concurrent
> > > > > > > > > > > > > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > > > > > > > > > -                * is parked at which point it's safe.
> > > > > > > > > > > > > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > > > > > > > > > > > > +                * processing timedout_job
> > > > > > > > > > > > > >                        */
> > > > > > > > > > > > > > -               list_del_init(&job->list);
> > > > > > > > > > > > > > +               fence = dma_fence_get(job->s_fence->parent);
> > > > > > > > > > > > While this is true for amdgpu, it has no meaning for other drivers for whom
> > > > > > > > > > > > we haven't
> > > > > > > > > > > > done the refactoring of embedding HW fence (parent) into the job structure.
> > > > > > > > > > > > In fact thinking
> > > > > > > > > > > > about it, unless you do the HW fence embedding for all the drivers using the
> > > > > > > > > > > > scheduler you cannot
> > > > > > > > > > > > revert this patch or you will just break them.
> > > > > > > > > > > btw, why did you do that embedding? I do still have my patches with
> > > > > > > > > > > dma_fence annotations floating around, but my idea at least was to fix
> > > > > > > > > > > that issue with a mempool, not with embeddeding. What was the motivation
> > > > > > > > > > > for embedding the wh fence?
> > > > > > > > > > > -Daniel
> > > > > > > > > > The motivation was 2 fold, avoid memory allocation during jobs submissions
> > > > > > > > > > (HW fence allocation) because as Christian explained this leads to deadlock
> > > > > > > > > > with
> > > > > > > > > > mm code during evictions due to memory pressure (Christian can clarify if I
> > > > > > > > > > messed
> > > > > > > > > Yeah that's the exact same thing I've chased with my dma_fence
> > > > > > > > > annotations, but thus far zero to none interested in getting it sorted. I
> > > > > > > > > think it'd be good to have some cross-driver agreement on how this should
> > > > > > > > > be solved before someone just charges ahead ...
> > > > > > > > > 
> > > > > > > > > > this explanation). Second is to exactly revert this patch because while it
> > > > > > > > > > solved the issue
> > > > > > > > > > described in the patch it created another with drivers who baildc out early
> > > > > > > > > > during TDR handling
> > > > > > > > > > for various reason and the job would just leak because it was already
> > > > > > > > > > removed form pending list.
> > > > > > > > > Can't we reinsert it before we restart the scheduler thread? It might need
> > > > > > > > > a separate list for that due to the lockless queue tricks. Or am I
> > > > > > > > > thinking about the wrong kind of "we lost the job"?
> > > > > > > > > -Danile
> > > > > > > > If you look at the original patch it would reinsert it even earlier - right
> > > > > > > > after stopping the  SW scheduler thread, and even then it was to late for
> > > > > > > > some drivers as they would decide to return back from their TDR handler even
> > > > > > > > before that. It is solvable but in an ugly way as far as I see, you need to
> > > > > > > > require each driver in his code to put the job back in the list if they do
> > > > > > > > it before reaching the place where scheduler framework does it. Kind of
> > > > > > > > spaghetti code seems to me.
> > > > > > > Hm yeah I didn't realize this all happens before we stop the scheduler
> > > > > > > thread.
> > > > > > > 
> > > > > > > Why can't we stop the scheduler thread first, so that there's guaranteed
> > > > > > > no race? I've recently had a lot of discussions with panfrost folks about
> > > > > > > their reset that spawns across engines, and without stopping the scheduler
> > > > > > > thread first before you touch anything it's just plain impossible.
> > > > > > Talked with Christian on that, for each TDR we actually stop all the
> > > > > > schedulers for all the rings and not only the hanged ring since
> > > > > > ASIC reset will impact all the rings anyway. So we cannot allow
> > > > > > other timeout handlers for other rings run in parallel to ours
> > > > > > as they will stop/restart the threads we just stopped and rely
> > > > > > on them being stopped. So it's all done with device wide lock
> > > > > > inside the amdgpu tTDR handler. Only inside the locked
> > > > > > section then we may stop/restart the scheduler threads.
> > > > > > Christian also mentioned that you proposed at some point
> > > > > > to serialize all TDR handling into single threading for all rings - this
> > > > > > seems
> > > > > > like something that could be used - we then don't need any
> > > > > > locking against TDR handlers from other rings and then we may
> > > > > > stop the scheduler thread as first step
> > > > > > 
> > > > > > 
> > > > > > > I'm also still not understanding what exactly you guys have done,
> > > > > > > can someone please dig out the the amdgpu patches that motivate all this
> > > > > > > maybe that's clearer? A full explanation would still be good since I've
> > > > > > > only started in scheduler stuff.
> > > > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux%2F-%2Fcommit%2Fde7515d43659f852590645a688f8d493e4a18141&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca5d9bacd4415453ba6c308d96e1de455%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661896953391179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=T3WC4%2B3BcWBy9gnjCMLRJjPM%2BWXfmN4GfR2Ojn8P3qc%3D&amp;reserved=0
> > > > > Uh, it would have been really good if this was discussed a bit wider
> > > > > beforehand. Now we have rather diverging approaches to this. Also would be
> > > > > really good to resurrect the dma_fence annotations too.
> > > > > 
> > > > > Can you guys pls spend a bit of time on this? Shouldn't be to hard to type
> > > > > up rfc conversion patches for the other drivers.
> > > > Ping for this. Currently the hw fence is returned from the ->run_job
> > > > callback, and that's not great design.
> > > 
> > > What's the problem you see there ?
> > For one, all other drivers work like that, and it's not great to be
> > inconsistent. And it allows that inconsistent/wrong pattern to continue.
> > 
> > Second I'm not even sure you can embed the hw fence, because there's this
> > job restarting going on. Which at least thus far allocated a new hw fence.
> > So this needs considerations.
> 
> 
> There is a solution to this at least at the amdgou level, see here -
> https://www.spinics.net/lists/amd-gfx/msg66614.html So we would
> reset the embedded fence seqno for this purpose (see amdgpu_fence_emit).

I think stuff like this really should be lifted into standard behaviour. I
have no idea whether this is doable across the board in all drivers, and
having incompatible solutions here without understanding the constraints
across drivers is no good at all.

> > > > If we embed it, then I think it should start existing latest from
> > > > drm_sched_job_arm. Maybe not yet initialized, but at least allocated. So
> > > > the right thing to do here is to have the hw fence as a pointer in
> > > > struct drm_sched_job. And check in drm_sched_job_arm() that it's at least
> > > > allocated.
> > > 
> > > Why we need to allocate the HW fence if it's embedded within a job struct ?
> > the hw fence is a refcounted struct, and the drm_sched_job is a different
> > struct. And we didn't have a dri-devel discussion about whether it's
> > correct to conflate these two lifetimes, amdgpu folks simply hacked
> > something together.
> 
> 
> Obviously scheduler level changes must be discussed at dri-devel forum
> level.
> What happened here and as Monk already mentioned - we had internal
> discussion
> about how to fix the problem in the header of this thread - avoiding
> accessing feed job
> from TDR handler without the current hack in place of removal and back
> insertion
> into pending list. It's there we we came up (I think Christian first
> mentioned this) with the
> idea of embedding the HW fence into amdgpu job - both for avoiding memory
> allocations
> but also - because this allows to use the HW fence's recounting as a
> solution to the above
> problem by simply grabbing a reference to the next fence in the pending list
> as a first step
> in the TDR handler. What we didn't take into account at the time is that
> indeed this change
> cannot be limited to amdgpu level - this we noticed much later during final
> code reviews.

Not sure where this fell through cracks, but imo at least changing where
the hw fence is allocated is a very fundamental change, and latest then
you should have discussed this on dri-devel.

But even the tdr races would probably have been good to start on
dri-devel. Now it looks like Monk&team have lost 6 months for nothing.
-Daniel


> 
> Andrey
> 
> 
> > 
> > > > Otherwise we're just diverging across drivers and tempting them to do the
> > > > wrong thing with the current ->run_job callback interface.
> > > 
> > > Maybe we should switch from embedding in driver level job struct as it's now
> > > to drm_sched_job and just leave the fence initialization to driver specific
> > > code ?
> > Maybe? Like I've not been involved in these discussion ont he amd side at
> > all, I'm just noticing that we do have a now rather inconsistently used
> > inteface across drivers. Which is no good.
> > -Daniel
> > 
> > > Andrey
> > > 
> > > 
> > > > Can you guys look into this?
> > > > -Daniel
> > > > 
> > > > > > > Another thing I recently pondered for tdr races looking at i915 code is
> > > > > > > whether the tdr should first block the completion fence for that job. My
> > > > > > > motivation is to have a race-free error capture (if the completion races
> > > > > > > then we might start evicting memory and everything goes boom), but maybe
> > > > > > > that helps here too. Some kind of atomic "block this fence from
> > > > > > > completing thing.
> > > > > > > 
> > > > > > > Or I'm I completely guessing in the wrong direction?
> > > > > > I think we already do it here - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.14-rc1%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fscheduler%2Fsched_main.c%23L410&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca5d9bacd4415453ba6c308d96e1de455%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661896953391179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1xqr4XCqY%2FCYJjAzT3GI8MyBi15tJQmOt6sB79COsmc%3D&amp;reserved=0
> > > > > Ah yes this works becase drm/sched has separate hw fence from the logical
> > > > > job fence.
> > > > > -Daniel
> > > > > 
> > > > > > Andrey
> > > > > > 
> > > > > > 
> > > > > > > -Daniel
> > > > > > > 
> > > > > > > > Andrey
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > > Andrey
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > > Andrey
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > > >                       spin_unlock(&sched->job_list_lock);
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >                       status = job->sched->ops->timedout_job(job);
> > > > > > > > > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > > > > > > >                               job->sched->ops->free_job(job);
> > > > > > > > > > > > > >                               sched->free_guilty = false;
> > > > > > > > > > > > > >                       }
> > > > > > > > > > > > > > +               dma_fence_put(fence);
> > > > > > > > > > > > > >               } else {
> > > > > > > > > > > > > >                       spin_unlock(&sched->job_list_lock);
> > > > > > > > > > > > > >               }
> > > > > > > > > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >               kthread_park(sched->thread);
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > -       /*
> > > > > > > > > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > > > > > > > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > > > > > > > > > -        * bad job at this point - we parked (waited for) any in progress
> > > > > > > > > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > > > > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > > > > > > > > -        */
> > > > > > > > > > > > > > -       if (bad && bad->sched == sched)
> > > > > > > > > > > > > > -               /*
> > > > > > > > > > > > > > -                * Add at the head of the queue to reflect it was the earliest
> > > > > > > > > > > > > > -                * job extracted.
> > > > > > > > > > > > > > -                */
> > > > > > > > > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > > > > > > > > -
> > > > > > > > > > > > > >               /*
> > > > > > > > > > > > > >                * Iterate the job list from later to  earlier one and either deactive
> > > > > > > > > > > > > >                * their HW callbacks or remove them from pending list if they already
> > > > > > > > > > > > > > --
> > > > > > > > > > > > > > 2.25.1
> > > > > > > > > > > > > > 
> > > > > -- 
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca5d9bacd4415453ba6c308d96e1de455%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661896953391179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=4V%2Fri%2B3gnISZfC6HOUxR1Z8dIkseE9dT1EqiXsTuVi8%3D&amp;reserved=0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
