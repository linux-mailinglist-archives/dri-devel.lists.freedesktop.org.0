Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CD3F8410
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 10:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02E6E57A;
	Thu, 26 Aug 2021 08:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54B6E57A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 08:59:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u9so3816298wrg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RaHTrFvascTYtpAU+P4MaCCF8VtzmkB130UoUkXR+cE=;
 b=fori7wshU3Yb9vl6xpRCpiVGccZdg+2vdNbd1UziTYY7LtRyUYfynJULylRU5BzBbD
 MlUwijA3fQ00h+vSZCRsRjfo9pUtgc5jlg9I8s0bAhWQK4YrqEL3/LgdbRD2iaBr7fud
 QrXhFMWoKX4ghHr2pzFFgA7/TGh5SEm3dMdGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RaHTrFvascTYtpAU+P4MaCCF8VtzmkB130UoUkXR+cE=;
 b=A69XQ//yHZQmhBpAx3eMx3q9tO0tC0RcHYvy2GFSBO+JJs73HkRh6gJp53vnyZglYW
 t/Ww7sM/29ttoHOoiRmyBNc2jzk1h/wpDhq8kCQxx+Q22oxbP5LVkxRtRf7ivjrNLCEP
 8SRyxRzruc8u8ngjVAaD2s3rw1/Txz5+vFUr8N7gldYC0gPxFWH/8LTK35oPXmg9eVtz
 pH+LJ3Act7Vfwoi6q4T8hjBkLDsFyRotqugak/svCPZ5YhZsGz81SzldhQkGKlr7VVRQ
 bm74DOEU4Q/bjWLxb9CTm3Hx9+rXgQsNCyCjPGXr4rcwJttvagh/1WmyLb6KjgFJAOet
 ETWQ==
X-Gm-Message-State: AOAM531iiWDRgeEokHHjnRzoPgAr+XICHBlQThWxU6SEcgdOWSX3RItx
 //APptkdSC1ScKIxNIio0hvU4A==
X-Google-Smtp-Source: ABdhPJy/ey9hz5ZD255t/T5LxEecH3/875IXD5J6hAG6idy97MYqvL7CPSouhUttHwHz1UzwvFlOsg==
X-Received: by 2002:a05:6000:259:: with SMTP id
 m25mr2644341wrz.53.1629968343451; 
 Thu, 26 Aug 2021 01:59:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j7sm7637544wmi.37.2021.08.26.01.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 01:59:02 -0700 (PDT)
Date: Thu, 26 Aug 2021 10:59:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YSdX1VanmoiTdUAx@phenom.ffwll.local>
References: <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
 <ede7948c-3365-d98c-464b-6c3356b914b8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ede7948c-3365-d98c-464b-6c3356b914b8@amd.com>
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

On Fri, Aug 20, 2021 at 09:20:42AM +0200, Christian König wrote:
> No, that perfectly works for me.
> 
> The problem we used to have with this approach was that we potentially have
> multiple timeouts at the same time.
> 
> But when we serialize the timeout handling by using a single workqueue as
> suggested by Daniel now as well then that isn't an issue any more.

Sorry I got massively burried in everything, catching up. Iirc there's a
special function for parking schedulers (which panfrost now uses to handle
its cross-engine reset), would be good to use that.

And yeah if your reset code is potentially spawning across engines I think
you need a single workqueue to make sure stuff doesn't go boom. Tbh might
be best to check out what panfrost has done and ask panfrost folks for an
ack on your approach.
-Daniel

> 
> Regards,
> Christian.
> 
> Am 20.08.21 um 09:12 schrieb Liu, Monk:
> > [AMD Official Use Only]
> > 
> > @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
> > Do you have any concern on the kthread_park() approach ?
> > 
> > Theoretically speaking sched_main shall run there exclusively with job_timeout since they both touches jobs, and stop scheduler during job_timeout won't impact performance since in that scenario
> > There was already something wrong/stuck on that ring/scheduler
> > 
> > Thanks
> > 
> > ------------------------------------------
> > Monk Liu | Cloud-GPU Core team
> > ------------------------------------------
> > 
> > -----Original Message-----
> > From: Liu, Monk
> > Sent: Thursday, August 19, 2021 6:26 PM
> > To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
> > 
> > [AMD Official Use Only]
> > 
> > Hi Daniel
> > 
> > > > Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
> > Yeah we had this though as well in our mind.
> > 
> > Our second approach is to call ktrhead_stop() in job_timedout() routine so that  the "bad" job is guaranteed to be used without scheduler's touching or freeing, Check this sample patch one as well please:
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a2a9536..50a49cb 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >          sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> >          /* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> > +       kthread_park(sched->thread);
> >          spin_lock(&sched->job_list_lock);
> >          job = list_first_entry_or_null(&sched->pending_list,
> >                                         struct drm_sched_job, list);
> >          if (job) {
> > -               /*
> > -                * Remove the bad job so it cannot be freed by concurrent
> > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > -                * is parked at which point it's safe.
> > -                */
> > -               list_del_init(&job->list);
> >                  spin_unlock(&sched->job_list_lock);
> >                  status = job->sched->ops->timedout_job(job);
> > @@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >          } else {
> >                  spin_unlock(&sched->job_list_lock);
> >          }
> > +       kthread_unpark(sched->thread);
> >          if (status != DRM_GPU_SCHED_STAT_ENODEV) {
> >                  spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >          kthread_park(sched->thread);
> >          /*
> > -        * Reinsert back the bad job here - now it's safe as
> > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > -        * bad job at this point - we parked (waited for) any in progress
> > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > -        * now until the scheduler thread is unparked.
> > -        */
> > -       if (bad && bad->sched == sched)
> > -               /*
> > -                * Add at the head of the queue to reflect it was the earliest
> > -                * job extracted.
> > -                */
> > -               list_add(&bad->list, &sched->pending_list);
> > -
> > -       /*
> >           * Iterate the job list from later to  earlier one and either deactive
> >           * their HW callbacks or remove them from pending list if they already
> >           * signaled.
> > 
> > 
> > Thanks
> > 
> > ------------------------------------------
> > Monk Liu | Cloud-GPU Core team
> > ------------------------------------------
> > 
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Thursday, August 19, 2021 5:31 PM
> > To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Liu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
> > 
> > On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
> > > On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > > > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > > > > 
> > > > > > > > + dri-devel
> > > > > > > > 
> > > > > > > > Since scheduler is a shared component, please add dri-devel
> > > > > > > > on all scheduler patches.
> > > > > > > > 
> > > > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > > > > > > > [Why]
> > > > > > > > > for bailing job, this commit will delete it from pending
> > > > > > > > > list thus the bailing job will never have a chance to be
> > > > > > > > > resubmitted even in advance tdr mode.
> > > > > > > > > 
> > > > > > > > > [How]
> > > > > > > > > after embeded hw_fence into amdgpu_job is done, the race
> > > > > > > > > condition that this commit tries to work around is
> > > > > > > > > completely solved.So revert this commit.
> > > > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > > > v2:
> > > > > > > > > add dma_fence_get/put() around timedout_job to avoid
> > > > > > > > > concurrent delete during processing timedout_job
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > > > > > > > >      1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > >      {
> > > > > > > > >             struct drm_gpu_scheduler *sched;
> > > > > > > > >             struct drm_sched_job *job;
> > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > >             enum drm_gpu_sched_stat status =
> > > > > > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > > > > 
> > > > > > > > >             sched = container_of(work, struct
> > > > > > > > > drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@
> > > > > > > > > static void drm_sched_job_timedout(struct work_struct
> > > > > > > > > *work)
> > > > > > > > > 
> > > > > > > > >             if (job) {
> > > > > > > > >                     /*
> > > > > > > > > -                * Remove the bad job so it cannot be freed by concurrent
> > > > > > > > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > > > > -                * is parked at which point it's safe.
> > > > > > > > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > > > > > > > +                * processing timedout_job
> > > > > > > > >                      */
> > > > > > > > > -               list_del_init(&job->list);
> > > > > > > > > +               fence =
> > > > > > > > > + dma_fence_get(job->s_fence->parent);
> > > > > > > While this is true for amdgpu, it has no meaning for other
> > > > > > > drivers for whom we haven't done the refactoring of embedding
> > > > > > > HW fence (parent) into the job structure.
> > > > > > > In fact thinking
> > > > > > > about it, unless you do the HW fence embedding for all the
> > > > > > > drivers using the scheduler you cannot revert this patch or
> > > > > > > you will just break them.
> > > > > > btw, why did you do that embedding? I do still have my patches
> > > > > > with dma_fence annotations floating around, but my idea at least
> > > > > > was to fix that issue with a mempool, not with embeddeding. What
> > > > > > was the motivation for embedding the wh fence?
> > > > > > -Daniel
> > > > > The motivation was 2 fold, avoid memory allocation during jobs
> > > > > submissions (HW fence allocation) because as Christian explained
> > > > > this leads to deadlock with mm code during evictions due to memory
> > > > > pressure (Christian can clarify if I messed
> > > > Yeah that's the exact same thing I've chased with my dma_fence
> > > > annotations, but thus far zero to none interested in getting it
> > > > sorted. I think it'd be good to have some cross-driver agreement on
> > > > how this should be solved before someone just charges ahead ...
> > > > 
> > > > > this explanation). Second is to exactly revert this patch because
> > > > > while it solved the issue described in the patch it created
> > > > > another with drivers who baildc out early during TDR handling for
> > > > > various reason and the job would just leak because it was already
> > > > > removed form pending list.
> > > > Can't we reinsert it before we restart the scheduler thread? It
> > > > might need a separate list for that due to the lockless queue
> > > > tricks. Or am I thinking about the wrong kind of "we lost the job"?
> > > > -Danile
> > > 
> > > If you look at the original patch it would reinsert it even earlier -
> > > right after stopping the  SW scheduler thread, and even then it was to
> > > late for some drivers as they would decide to return back from their
> > > TDR handler even before that. It is solvable but in an ugly way as far
> > > as I see, you need to require each driver in his code to put the job
> > > back in the list if they do it before reaching the place where
> > > scheduler framework does it. Kind of spaghetti code seems to me.
> > Hm yeah I didn't realize this all happens before we stop the scheduler thread.
> > 
> > Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
> > 
> > I'm also still not understanding what exactly you guys have done, can someone please dig out the the amdgpu patches that motivate all this maybe that's clearer? A full explanation would still be good since I've only started in scheduler stuff.
> > 
> > Another thing I recently pondered for tdr races looking at i915 code is whether the tdr should first block the completion fence for that job. My motivation is to have a race-free error capture (if the completion races then we might start evicting memory and everything goes boom), but maybe that helps here too. Some kind of atomic "block this fence from completing thing.
> > 
> > Or I'm I completely guessing in the wrong direction?
> > -Daniel
> > 
> > > Andrey
> > > 
> > > 
> > > > > Andrey
> > > > > 
> > > > > 
> > > > > > > Andrey
> > > > > > > 
> > > > > > > 
> > > > > > > > >                     spin_unlock(&sched->job_list_lock);
> > > > > > > > > 
> > > > > > > > >                     status =
> > > > > > > > > job->sched->ops->timedout_job(job);
> > > > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > >                             job->sched->ops->free_job(job);
> > > > > > > > >                             sched->free_guilty = false;
> > > > > > > > >                     }
> > > > > > > > > +               dma_fence_put(fence);
> > > > > > > > >             } else {
> > > > > > > > >                     spin_unlock(&sched->job_list_lock);
> > > > > > > > >             }
> > > > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct
> > > > > > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > > > 
> > > > > > > > >             kthread_park(sched->thread);
> > > > > > > > > 
> > > > > > > > > -       /*
> > > > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > > > > -        * bad job at this point - we parked (waited for) any in progress
> > > > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > > > -        */
> > > > > > > > > -       if (bad && bad->sched == sched)
> > > > > > > > > -               /*
> > > > > > > > > -                * Add at the head of the queue to reflect it was the earliest
> > > > > > > > > -                * job extracted.
> > > > > > > > > -                */
> > > > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > > > -
> > > > > > > > >             /*
> > > > > > > > >              * Iterate the job list from later to  earlier one and either deactive
> > > > > > > > >              * their HW callbacks or remove them from
> > > > > > > > > pending list if they already
> > > > > > > > > --
> > > > > > > > > 2.25.1
> > > > > > > > > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508d962f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50PCMsvwyY%3D&amp;reserved=0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
