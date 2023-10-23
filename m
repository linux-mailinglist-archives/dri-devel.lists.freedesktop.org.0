Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2797D3938
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469D889B78;
	Mon, 23 Oct 2023 14:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA0389B78;
 Mon, 23 Oct 2023 14:22:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F4FC6606F51;
 Mon, 23 Oct 2023 15:22:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698070939;
 bh=UwfXtPSbAc1uNYhlzs5WI+PdsHRZTDnY2ZglgBhyeH8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GwZqQbjKY3dL/0BxlYZlAarmAQ8clbNHWgsOZ9IXyftFDy1dVbYB63xUF61ZnZA2s
 kLyRIEdYBXhRBXCsp+rZUN8pqs8WdI3BZrfonx9RYJajFgRGe31FWMFXrIUL7t2XJl
 LAS2ll833RsxPvCWDF4Iv8gMMQhvfTjw8J0rYSplXEBnWKDj5TMSwSs5BAM8sUE12X
 n/ULuSWqdDcioFcgCCzC72Z5r9TwMj7/OWVvmKq1SPYO0tJfgDulPKKIXSnsWwnycJ
 LASUIHQPjGrptjqltDYQ+swGZHJRTaqCin8jyY3Yz7Re3M3ncTO/pApzz6YqIIsL69
 a0kGMTV9Nw9mw==
Date: Mon, 23 Oct 2023 16:22:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Message-ID: <20231023162216.132adc58@collabora.com>
In-Reply-To: <ZTZ7BR5/QDbgnNwi@DUT025-TGLU.fm.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
 <20231023141606.3dd53c39@collabora.com>
 <20231023143937.66f31eee@collabora.com>
 <ZTZ7BR5/QDbgnNwi@DUT025-TGLU.fm.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 13:54:13 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> On Mon, Oct 23, 2023 at 02:39:37PM +0200, Boris Brezillon wrote:
> > On Mon, 23 Oct 2023 14:16:06 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> > > Hi,
> > > 
> > > On Tue, 17 Oct 2023 08:09:56 -0700
> > > Matthew Brost <matthew.brost@intel.com> wrote:
> > >   
> > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > +{
> > > > +	struct drm_gpu_scheduler *sched =
> > > > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > +	struct drm_sched_entity *entity;
> > > > +	struct dma_fence *fence;
> > > > +	struct drm_sched_fence *s_fence;
> > > > +	struct drm_sched_job *sched_job;
> > > > +	int r;
> > > >  
> > > > -		atomic_inc(&sched->hw_rq_count);
> > > > -		drm_sched_job_begin(sched_job);
> > > > +	if (READ_ONCE(sched->pause_submit))
> > > > +		return;
> > > > +
> > > > +	entity = drm_sched_select_entity(sched, true);
> > > > +	if (!entity)
> > > > +		return;
> > > >  
> > > > -		trace_drm_run_job(sched_job, entity);
> > > > -		fence = sched->ops->run_job(sched_job);
> > > > +	sched_job = drm_sched_entity_pop_job(entity);
> > > > +	if (!sched_job) {
> > > >  		complete_all(&entity->entity_idle);
> > > > -		drm_sched_fence_scheduled(s_fence, fence);
> > > > +		return;	/* No more work */
> > > > +	}
> > > >  
> > > > -		if (!IS_ERR_OR_NULL(fence)) {
> > > > -			/* Drop for original kref_init of the fence */
> > > > -			dma_fence_put(fence);
> > > > +	s_fence = sched_job->s_fence;
> > > >  
> > > > -			r = dma_fence_add_callback(fence, &sched_job->cb,
> > > > -						   drm_sched_job_done_cb);
> > > > -			if (r == -ENOENT)
> > > > -				drm_sched_job_done(sched_job, fence->error);
> > > > -			else if (r)
> > > > -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > > > -					  r);
> > > > -		} else {
> > > > -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > > -					   PTR_ERR(fence) : 0);
> > > > -		}
> > > > +	atomic_inc(&sched->hw_rq_count);
> > > > +	drm_sched_job_begin(sched_job);
> > > >  
> > > > -		wake_up(&sched->job_scheduled);
> > > > +	trace_drm_run_job(sched_job, entity);
> > > > +	fence = sched->ops->run_job(sched_job);
> > > > +	complete_all(&entity->entity_idle);
> > > > +	drm_sched_fence_scheduled(s_fence, fence);
> > > > +
> > > > +	if (!IS_ERR_OR_NULL(fence)) {
> > > > +		/* Drop for original kref_init of the fence */
> > > > +		dma_fence_put(fence);
> > > > +
> > > > +		r = dma_fence_add_callback(fence, &sched_job->cb,
> > > > +					   drm_sched_job_done_cb);
> > > > +		if (r == -ENOENT)
> > > > +			drm_sched_job_done(sched_job, fence->error);
> > > > +		else if (r)
> > > > +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > > > +	} else {
> > > > +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > > +				   PTR_ERR(fence) : 0);
> > > >  	}    
> > > 
> > > Just ran into a race condition when using a non-ordered workqueue
> > > for drm_sched:
> > > 
> > > thread A							thread B
> > > 
> > > drm_sched_run_job_work()			
> > >   drm_sched_job_begin()
> > >     // inserts jobA in pending_list
> > > 
> > > 								drm_sched_free_job_work()
> > > 								  drm_sched_get_cleanup_job()
> > > 								    // check first job in pending list
> > > 								    // if s_fence->parent == NULL, consider
> > > 								    // for cleanup  
> > > 								  ->free_job(jobA)    
> > > 								    drm_sched_job_cleanup()
> > > 								      // set sched_job->s_fence = NULL
> > >   
> > >     ->run_job()    
> > >     drm_sched_fence_scheduled()  
> > 
> > Correction: the NULL pointer deref happens in drm_sched_job_done()
> > (when the driver returns an error directly) not in
> > drm_sched_fence_scheduled(), but the problem remains the same.
> > 
> >   
> 
> Trying to understand this. I don't see how drm_sched_get_cleanup_job can
> return a job until dma_fence_is_signaled(&job->s_fence->finished) is
> true. That fence is no signaled until drm_sched_fence_finished(s_fence,
> result); called in drm_sched_job_done().
> 
> What am I missing here?

Uh, my bad. I was trying to backport panthor (and all its deps) to a 6.1
kernel, and the condition in drm_sched_get_cleanup_job() is different
there:

        if (job && (!job->s_fence->parent ||
                    dma_fence_is_signaled(job->s_fence->parent))) {
		// pick this job for cleanup
	}

Sorry for the noise.
