Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73EF3F1615
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4946E851;
	Thu, 19 Aug 2021 09:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07756E895
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:24:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q10so8035470wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fF+plrzMmtdtCOpsAfHEwwaDGTnVyq/F1F7wYHnL++A=;
 b=CPq5uR96cvyKFpVf3TMgFqlU12k/mJ1Nb1C5462L/Kn0bd5XyPli1xtF1Yh//Zhmf8
 TRO1+8YuRO53S6vCzZYMOA0+JlaBO3IljLbcuZ3xbHHUnLTTziczNAMm8GRJj6aF4i6/
 zdpk/C8nFOz3V3NykQF/xPET5/IH9XHVhsPcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fF+plrzMmtdtCOpsAfHEwwaDGTnVyq/F1F7wYHnL++A=;
 b=IqiAiDjQtM7Vxqd2WaR5RLXC/OK1+4uX9hH4ml52tNRoAt6w8oFx8kjYq28ajLfeii
 9EmIqCEG4CZEV4Xb02snD0U8oy0y/K9hFrpNUNOlu4nlgKsXwZBKZCj26MLTcyYcQWWh
 RZVl7DAZmm8qFIoZ2SSpDzFj0OHbiriQJPb3PdSx0btaxG4O0lncWHpBYo29iZ96896K
 XPRGps5rb7AGjK2RvF5Nqm/VM22IAciq2rILILCQ/zuHayvVssOQDEqywIiOwomlici1
 PSgpv8hZoCh4TRH6xkbAA98Zwm5BqIDAvIuuOmpmttLze2c7DZe2nQhwW7HbfZV8c3Rv
 HCAA==
X-Gm-Message-State: AOAM53127dhPDTX3DJEr3tZ59iFCjij+aXZflTobvy1HGCLbm0dZs0BO
 ZRZ4ftq8Qi4YKAi/WvQnl9AzFQ==
X-Google-Smtp-Source: ABdhPJzMQfrmOdy52rv2PLH90Pld26W8Y0yk32z0gBjqsFfIqXQOJzg6io2N2Us/RZHhzXB2Xh6npA==
X-Received: by 2002:adf:e389:: with SMTP id e9mr2601276wrm.304.1629365054441; 
 Thu, 19 Aug 2021 02:24:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b12sm2867438wrx.72.2021.08.19.02.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:24:13 -0700 (PDT)
Date: Thu, 19 Aug 2021 11:24:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Liu, Monk" <Monk.Liu@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YR4jO/LUiKkWnPOZ@phenom.ffwll.local>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <BL1PR12MB5269D5E7E2DEAA23C61A6C4E84C09@BL1PR12MB5269.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5269D5E7E2DEAA23C61A6C4E84C09@BL1PR12MB5269.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 19, 2021 at 03:01:26AM +0000, Liu, Monk wrote:
> [AMD Official Use Only]
> 
> Hi Andrey and Daniel
> 
> We worked for a really long time on this new feature to AMD that finally
> can pick up the bad job from all timedout ones, and the change in
> scheduler (get/put fence in drm_sched_job_timedout, and remove the bad
> job delete and put back) is the last piece for us.
> 
> While we understand and realized that after the "bad job list node
> delete logic" being removed from job_timedout,  there will be race
> issues introduced if vendor's job_timeout calback is accessing the bad
> job  in parallel of scheduler doing "sched->ops->free_job(leanup_job)".
> 
> And to not introduce impact at all on those vendors I'd like to proposal
> a very simple change (which introduced a new bool member for scheduler
> to indicate if the del/put-back logic is needed or not) , check  patch
> here below:

If everyone operates like that then the shared code becomes a massive mess
of incompatible options and unmaintainable. I don't think that's a good
path forward.
-Daniel

> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 47ea468..5e0bdc4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -495,6 +495,8 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>  		return r;
>  	}
>  
> +	ring->sched.keep_bad_job = true;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de2..e7ac384 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  {
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_job *job;
> +	struct dma_fence *f = NULL;
>  
>  	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>  
> @@ -328,7 +329,11 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>  		 * is parked at which point it's safe.
>  		 */
> -		list_del_init(&job->list);
> +		if (sched->keep_bad_job == false)
> +			list_del_init(&job->list);
> +		else
> +			f = dma_fence_get(job->s_fence->parent);//get parent fence here to prevent hw_fence dropping to zero due to sched-main's cleanup_jobs, for amdgpu once parent fence drop to zero the sched_job will be kfree-ed 
> +
>  		spin_unlock(&sched->job_list_lock);
>  
>  		job->sched->ops->timedout_job(job);
> @@ -341,6 +346,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  			job->sched->ops->free_job(job);
>  			sched->free_guilty = false;
>  		}
> +
> +		dma_fence_put(f);
>  	} else {
>  		spin_unlock(&sched->job_list_lock);
>  	}
> @@ -396,7 +403,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>  	 * now until the scheduler thread is unparked.
>  	 */
> -	if (bad && bad->sched == sched)
> +	if (bad && bad->sched == sched && sched->keep_bad_job == false)
>  		/*
>  		 * Add at the head of the queue to reflect it was the earliest
>  		 * job extracted.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 4ea8606..5f9a640 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -301,6 +301,7 @@ struct drm_gpu_scheduler {
>  	atomic_t                        _score;
>  	bool				ready;
>  	bool				free_guilty;
> +	bool keep_bad_job;
>  };
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
> 
> 
> Thanks 
> 
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
> 
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch> 
> Sent: Wednesday, August 18, 2021 10:43 PM
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Liu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
> 
> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > 
> > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > 
> > > > > + dri-devel
> > > > > 
> > > > > Since scheduler is a shared component, please add dri-devel on 
> > > > > all scheduler patches.
> > > > > 
> > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > > > > [Why]
> > > > > > for bailing job, this commit will delete it from pending list 
> > > > > > thus the bailing job will never have a chance to be 
> > > > > > resubmitted even in advance tdr mode.
> > > > > > 
> > > > > > [How]
> > > > > > after embeded hw_fence into amdgpu_job is done, the race 
> > > > > > condition that this commit tries to work around is completely 
> > > > > > solved.So revert this commit.
> > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > v2:
> > > > > > add dma_fence_get/put() around timedout_job to avoid 
> > > > > > concurrent delete during processing timedout_job
> > > > > > 
> > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > > > > >    1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
> > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > >    {
> > > > > >           struct drm_gpu_scheduler *sched;
> > > > > >           struct drm_sched_job *job;
> > > > > > +       struct dma_fence *fence;
> > > > > >           enum drm_gpu_sched_stat status = 
> > > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > 
> > > > > >           sched = container_of(work, struct drm_gpu_scheduler, 
> > > > > > work_tdr.work); @@ -325,11 +326,10 @@ static void 
> > > > > > drm_sched_job_timedout(struct work_struct *work)
> > > > > > 
> > > > > >           if (job) {
> > > > > >                   /*
> > > > > > -                * Remove the bad job so it cannot be freed by concurrent
> > > > > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > -                * is parked at which point it's safe.
> > > > > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > > > > +                * processing timedout_job
> > > > > >                    */
> > > > > > -               list_del_init(&job->list);
> > > > > > +               fence = dma_fence_get(job->s_fence->parent);
> > > > 
> > > > While this is true for amdgpu, it has no meaning for other drivers 
> > > > for whom we haven't done the refactoring of embedding HW fence 
> > > > (parent) into the job structure.
> > > > In fact thinking
> > > > about it, unless you do the HW fence embedding for all the drivers 
> > > > using the scheduler you cannot revert this patch or you will just 
> > > > break them.
> > > btw, why did you do that embedding? I do still have my patches with 
> > > dma_fence annotations floating around, but my idea at least was to 
> > > fix that issue with a mempool, not with embeddeding. What was the 
> > > motivation for embedding the wh fence?
> > > -Daniel
> > 
> > 
> > The motivation was 2 fold, avoid memory allocation during jobs 
> > submissions (HW fence allocation) because as Christian explained this 
> > leads to deadlock with mm code during evictions due to memory pressure 
> > (Christian can clarify if I messed
> 
> Yeah that's the exact same thing I've chased with my dma_fence annotations, but thus far zero to none interested in getting it sorted. I think it'd be good to have some cross-driver agreement on how this should be solved before someone just charges ahead ...
> 
> > this explanation). Second is to exactly revert this patch because 
> > while it solved the issue described in the patch it created another 
> > with drivers who baildc out early during TDR handling for various 
> > reason and the job would just leak because it was already removed form 
> > pending list.
> 
> Can't we reinsert it before we restart the scheduler thread? It might need a separate list for that due to the lockless queue tricks. Or am I thinking about the wrong kind of "we lost the job"?
> -Danile
> 
> > 
> > Andrey
> > 
> > 
> > > 
> > > 
> > > > Andrey
> > > > 
> > > > 
> > > > > >                   spin_unlock(&sched->job_list_lock);
> > > > > > 
> > > > > >                   status = job->sched->ops->timedout_job(job);
> > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > >                           job->sched->ops->free_job(job);
> > > > > >                           sched->free_guilty = false;
> > > > > >                   }
> > > > > > +               dma_fence_put(fence);
> > > > > >           } else {
> > > > > >                   spin_unlock(&sched->job_list_lock);
> > > > > >           }
> > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct 
> > > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > 
> > > > > >           kthread_park(sched->thread);
> > > > > > 
> > > > > > -       /*
> > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > -        * bad job at this point - we parked (waited for) any in progress
> > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > -        * now until the scheduler thread is unparked.
> > > > > > -        */
> > > > > > -       if (bad && bad->sched == sched)
> > > > > > -               /*
> > > > > > -                * Add at the head of the queue to reflect it was the earliest
> > > > > > -                * job extracted.
> > > > > > -                */
> > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > -
> > > > > >           /*
> > > > > >            * Iterate the job list from later to  earlier one and either deactive
> > > > > >            * their HW callbacks or remove them from pending 
> > > > > > list if they already
> > > > > > --
> > > > > > 2.25.1
> > > > > > 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cmonk.liu%40amd.com%7C8ddd8838028242eb82c708d9625678cf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637648945806335873%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=uFdAwQH6yWm%2FC%2FdDeG8wXKNsOqI7dSQRGO9NbKkjYyU%3D&amp;reserved=0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
