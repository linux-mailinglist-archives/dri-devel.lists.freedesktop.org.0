Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF971280280
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DAE6E8AC;
	Thu,  1 Oct 2020 15:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF2C6E8AC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 15:22:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D15F329CD9A;
 Thu,  1 Oct 2020 16:22:36 +0100 (BST)
Date: Thu, 1 Oct 2020 17:22:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] panfrost: Fix job timeout handling
Message-ID: <20201001172231.51d45558@collabora.com>
In-Reply-To: <b51d154f-978d-3439-fbb3-e960378b53c0@arm.com>
References: <20201001140143.1058669-1-boris.brezillon@collabora.com>
 <b51d154f-978d-3439-fbb3-e960378b53c0@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Oct 2020 15:49:39 +0100
Steven Price <steven.price@arm.com> wrote:

> On 01/10/2020 15:01, Boris Brezillon wrote:
> > If more than two or more jobs end up timeout-ing concurrently, only one
> > of them (the one attached to the scheduler acquiring the lock) is fully
> > handled. The other one remains in a dangling state where it's no longer
> > part of the scheduling queue, but still blocks something in scheduler
> > thus leading to repetitive timeouts when new jobs are queued.
> > 
> > Let's make sure all bad jobs are properly handled by the thread acquiring
> > the lock.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> > Cc: <stable@vger.kernel.org>
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_job.c | 18 ++++++++++++++----
> >   1 file changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 30e7b7196dab..e87edca51d84 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -25,7 +25,7 @@
> >   
> >   struct panfrost_queue_state {
> >   	struct drm_gpu_scheduler sched;
> > -
> > +	struct drm_sched_job *bad;
> >   	u64 fence_context;
> >   	u64 emit_seqno;
> >   };
> > @@ -392,19 +392,29 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
> >   		job_read(pfdev, JS_TAIL_LO(js)),
> >   		sched_job);
> >   
> > +	/*
> > +	 * Collect the bad job here so it can be processed by the thread
> > +	 * acquiring the reset lock.
> > +	 */
> > +	pfdev->js->queue[js].bad = sched_job;
> > +
> >   	if (!mutex_trylock(&pfdev->reset_lock))
> >   		return;
> >   
> >   	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> >   		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
> >   
> > -		drm_sched_stop(sched, sched_job);
> >   		if (js != i)
> >   			/* Ensure any timeouts on other slots have finished */
> >   			cancel_delayed_work_sync(&sched->work_tdr);
> > -	}
> >   
> > -	drm_sched_increase_karma(sched_job);
> > +		drm_sched_stop(sched, pfdev->js->queue[i].bad);  
> 
> So I can see that the call to drm_sched_stop() needs to move below the 
> cancel_delayed_work_sync() to ensure that the update to queue->bad is 
> synchronised.

Exactly, and it probably deserves a comment :-).

> What I'm not so sure about is whether it's possible for 
> the scheduler to make progress between the 'cancel' and the 'stop' - 
> there is a reason I wrote it the other way round...

Hm, we should probably stop the queue on which the timeout happened
before acquiring the lock, this way we guarantee that nothing executes
on queues that reported a timeout until the reset actually happens.

That leaves queues on which no timeout was reported, and I wonder why
it'd be bad to let those continue executing jobs. Do you see any case
where that'd be a problem?

> 
> The hole for things to go round is clearly much smaller with this 
> change, but I'm not sure it's completely plugged. Am I missing something?
> 
> > +
> > +		if (pfdev->js->queue[i].bad)
> > +			drm_sched_increase_karma(pfdev->js->queue[i].bad);
> > +
> > +		pfdev->js->queue[i].bad = NULL;
> > +	}
> >   
> >   	spin_lock_irqsave(&pfdev->js->job_lock, flags);
> >   	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> >   
> 
> While we're on potential holes... some more context:
> 
> > 		if (pfdev->jobs[i]) {
> > 			pm_runtime_put_noidle(pfdev->dev);
> > 			panfrost_devfreq_record_idle(pfdev);
> > 			pfdev->jobs[i] = NULL;
> > 		}
> > 	}
> > 	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
> > 
> > 	panfrost_device_reset(pfdev);
> > 
> > 	for (i = 0; i < NUM_JOB_SLOTS; i++)
> > 		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
> > 
> > 	/* restart scheduler after GPU is usable again */
> > 	for (i = 0; i < NUM_JOB_SLOTS; i++)
> > 		drm_sched_start(&pfdev->js->queue[i].sched, true);
> > 
> > 	mutex_unlock(&pfdev->reset_lock);  
> 
> I'm wondering whether the mutex_unlock() should actually happen before 
> the drm_sched_start() - in the (admittedly very unlikely) case where a 
> timeout occurs before all the drm_sched_start() calls have completed 
> it's possible for the timeout to be completely missed because the mutex 
> is still held.

Oh, good catch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
