Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06E63F06BE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC39B6E7E2;
	Wed, 18 Aug 2021 14:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD96E7E2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:32:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u16so3871384wrn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t4sTAcDqBDcWFj4htptkztn49ubBMDjeaUxf+Wy+QRg=;
 b=CZWNYgeak+LD+0vSD+JiSQ7ENI/fM4nE3asYPShLhCh/qWXdAghqSwy8g3h/3h2uYS
 dtuKcMDVwddNxxxCG1AvIm5QK/DLWt/55+fG+vUuZVUbIuiOafXb6Hu4LwoqofbTWftV
 fqAcy+0NWBfpjojfgA8+VqW+RnxdegH6qmjmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t4sTAcDqBDcWFj4htptkztn49ubBMDjeaUxf+Wy+QRg=;
 b=SWqaQkogSk2zxgGDNJwvSOC4DWD9dhumBPQSMguDhDVPziwb++x7PmlnkgKCC5yu0V
 kwD8HKMJ1Esuz9+vxNJjODLCWBup2o6UUvmxBbh/22Z5xkIex/FqEMzDQ/5IK/VFp4zz
 43867A0wp9/hn/MaS2Qt6DANx/N34JA0sg1jT8jXDECI7pGo8Zptg28gMpd3JBhpqnkq
 ZZXclL1nc26TC1SdeQM2dneAJbCnvEnLqwGZ9HM4Q9Z/SN2XzVQWIMWxQP0RthVC26e4
 9V78qIeWjMv8L/mUPUJw4EDsbqogA5GKuGp/yhyymxITDTXJH3q8VafNRsXWlk+I+YDP
 5pMQ==
X-Gm-Message-State: AOAM531JFGiHVif+28Bzx89pnMRVeh+ASDOJXRLxMDwtj5tIeL2HRGbb
 v9qax7mmdmUmxW9J8m8/eRPMaA==
X-Google-Smtp-Source: ABdhPJwed6jxWL+aPITvjqESCFOZ14PV/WuvvQhfh/EfFtxTW4e1KC85UZyLbvU76PuxrFPMZed9Wg==
X-Received: by 2002:a05:6000:10c5:: with SMTP id
 b5mr11137758wrx.298.1629297136674; 
 Wed, 18 Aug 2021 07:32:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u6sm6018351wrp.83.2021.08.18.07.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:32:16 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:32:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "monk.liu" <monk.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
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

On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> 
> > + dri-devel
> > 
> > Since scheduler is a shared component, please add dri-devel on all
> > scheduler patches.
> > 
> > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > [Why]
> > > for bailing job, this commit will delete it from pending list thus the
> > > bailing job will never have a chance to be resubmitted even in advance
> > > tdr mode.
> > > 
> > > [How]
> > > after embeded hw_fence into amdgpu_job is done, the race condition that
> > > this commit tries to work around is completely solved.So revert this
> > > commit.
> > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > v2:
> > > add dma_fence_get/put() around timedout_job to avoid concurrent delete
> > > during processing timedout_job
> > > 
> > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > >   1 file changed, 5 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index a2a953693b45..f9b9b3aefc4a 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > >   {
> > >          struct drm_gpu_scheduler *sched;
> > >          struct drm_sched_job *job;
> > > +       struct dma_fence *fence;
> > >          enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> > > 
> > >          sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > > @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > 
> > >          if (job) {
> > >                  /*
> > > -                * Remove the bad job so it cannot be freed by concurrent
> > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > -                * is parked at which point it's safe.
> > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > +                * processing timedout_job
> > >                   */
> > > -               list_del_init(&job->list);
> > > +               fence = dma_fence_get(job->s_fence->parent);
> 
> 
> While this is true for amdgpu, it has no meaning for other drivers for whom
> we haven't
> done the refactoring of embedding HW fence (parent) into the job structure.
> In fact thinking
> about it, unless you do the HW fence embedding for all the drivers using the
> scheduler you cannot
> revert this patch or you will just break them.

btw, why did you do that embedding? I do still have my patches with
dma_fence annotations floating around, but my idea at least was to fix
that issue with a mempool, not with embeddeding. What was the motivation
for embedding the wh fence?
-Daniel


> 
> Andrey
> 
> 
> > >                  spin_unlock(&sched->job_list_lock);
> > > 
> > >                  status = job->sched->ops->timedout_job(job);
> > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > >                          job->sched->ops->free_job(job);
> > >                          sched->free_guilty = false;
> > >                  }
> > > +               dma_fence_put(fence);
> > >          } else {
> > >                  spin_unlock(&sched->job_list_lock);
> > >          }
> > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > 
> > >          kthread_park(sched->thread);
> > > 
> > > -       /*
> > > -        * Reinsert back the bad job here - now it's safe as
> > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > -        * bad job at this point - we parked (waited for) any in progress
> > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > -        * now until the scheduler thread is unparked.
> > > -        */
> > > -       if (bad && bad->sched == sched)
> > > -               /*
> > > -                * Add at the head of the queue to reflect it was the earliest
> > > -                * job extracted.
> > > -                */
> > > -               list_add(&bad->list, &sched->pending_list);
> > > -
> > >          /*
> > >           * Iterate the job list from later to  earlier one and either deactive
> > >           * their HW callbacks or remove them from pending list if they already
> > > --
> > > 2.25.1
> > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
