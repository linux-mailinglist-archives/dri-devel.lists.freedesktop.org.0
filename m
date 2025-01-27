Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C09EA1D64D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 13:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8810E3BB;
	Mon, 27 Jan 2025 12:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IwPJuTeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D947110E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 12:59:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9802A5C53D7;
 Mon, 27 Jan 2025 12:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD72C4CED2;
 Mon, 27 Jan 2025 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737982785;
 bh=ppFjk8LOf96wO2GfvBgwKK+jksyqZGpwOq7G6KF0lwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwPJuTeABzNiFbEHNI/Po+8XuaqoTrOyh9w34U08QAUxTRc7OYAD4CcLK458PVm49
 m1ii2IYuQ1rfuAuraq7S0YyIKL+lWzg/VIfL4zOrgiVWV6CQioCe521JaCEn325MoI
 RLeYTswlB55xCkkiwfe3Slp599aQyyy+xjTGxzYteckMuvKopyi2EWiNuwQXVx6iDY
 7YkfpPCg/aRMMDUASKo6YqZonRnkc2iIkS5l0rRegjG5GRqzDQflajKDqWJM+wnewa
 e+s6Ab7VrcjjuTN31ITcQnkGTat+l2FmXj/DNDWbaqWWdAnSKFqFe56uqIYWKveI6X
 46detohoDa4yA==
Date: Mon, 27 Jan 2025 13:59:39 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 3/3] drm/sched: Update timedout_job()'s documentation
Message-ID: <Z5eDOzypN_6vcvzm@pollux>
References: <20250121151544.44949-2-phasta@kernel.org>
 <20250121151544.44949-6-phasta@kernel.org>
 <Z5OHKHZRBed_bxF6@pollux>
 <1da78171e9bb5c533bfc5ddb232d81a6a531de10.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1da78171e9bb5c533bfc5ddb232d81a6a531de10.camel@redhat.com>
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

On Mon, Jan 27, 2025 at 01:32:40PM +0100, Philipp Stanner wrote:
> On Fri, 2025-01-24 at 13:27 +0100, Danilo Krummrich wrote:
> > On Tue, Jan 21, 2025 at 04:15:46PM +0100, Philipp Stanner wrote:
> > > drm_sched_backend_ops.timedout_job()'s documentation is outdated.
> > > It
> > > mentions the deprecated function drm_sched_resubmit_job().
> > > Furthermore,
> > > it does not point out the important distinction between hardware
> > > and
> > > firmware schedulers.
> > > 
> > > Since firmware schedulers tyipically only use one entity per
> > > scheduler,
> > > timeout handling is significantly more simple because the entity
> > > the
> > > faulted job came from can just be killed without affecting innocent
> > > processes.
> > > 
> > > Update the documentation with that distinction and other details.
> > > 
> > > Reformat the docstring to work to a unified style with the other
> > > handles.
> > > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >  include/drm/gpu_scheduler.h | 82 ++++++++++++++++++++++-----------
> > > ----
> > >  1 file changed, 49 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index cf40fdb55541..4806740b9023 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -394,8 +394,14 @@ static inline bool
> > > drm_sched_invalidate_job(struct drm_sched_job *s_job,
> > >  }
> > >  
> > >  enum drm_gpu_sched_stat {
> > > -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > > +	/* Reserve 0 */
> > > +	DRM_GPU_SCHED_STAT_NONE,
> > > +
> > > +	/* Operation succeeded */
> > >  	DRM_GPU_SCHED_STAT_NOMINAL,
> > > +
> > > +	/* Failure because dev is no longer available, for example
> > > because
> > > +	 * it was unplugged. */
> > >  	DRM_GPU_SCHED_STAT_ENODEV,
> > >  };
> > >  
> > > @@ -447,43 +453,53 @@ struct drm_sched_backend_ops {
> > >  	 * @timedout_job: Called when a job has taken too long to
> > > execute,
> > >  	 * to trigger GPU recovery.
> > >  	 *
> > > -	 * This method is called in a workqueue context.
> > 
> > Why remove this line?
> 
> I felt its surplus. All the functions here are callbacks that are
> invoked by "the scheduler". I thought that's all the driver really
> needs to know. Why should it care about the wq context?

Yes, I think we should even be more clear and say which workqueue it's scheduled
on. The fact that this runs in the context of workqueues is not transpararent to
users. It's even that the exact workqueue to use is specified in
drm_sched_init().

It's a good hint for drivers in terms of dma-fence handling.

> 
> Also, it's the only function for which the context is mentioned. If we
> keep it here, we should probably provide it everywhere else, too.

Sounds good.

> 
> > 
> > > +	 * @sched_job: The job that has timed out
> > >  	 *
> > > -	 * Drivers typically issue a reset to recover from GPU
> > > hangs, and this
> > > -	 * procedure usually follows the following workflow:
> > > +	 * Returns: A drm_gpu_sched_stat enum.
> > 
> > Maybe "The status of the scheduler, defined by &drm_gpu_sched_stat".
> > 
> > I think you forgot to add the corresponding parts in the
> > documentation of
> > drm_gpu_sched_stat.
> 
> What do you mean, precisely? I added information to that enum. You mean
> that I should add that that enum is a return type for this callback
> here?

You did add information to &drm_gpu_sched_stat, but no kernel doc comments you
can actually refer to.

> 
> > 
> > >  	 *
> > > -	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > > park the
> > > -	 *    scheduler thread and cancel the timeout work,
> > > guaranteeing that
> > > -	 *    nothing is queued while we reset the hardware queue
> > > -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> > > -	 * 3. Issue a GPU reset (driver-specific)
> > > -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> > > -	 * 5. Restart the scheduler using drm_sched_start(). At
> > > that point, new
> > > -	 *    jobs can be queued, and the scheduler thread is
> > > unblocked
> > > +	 * Drivers typically issue a reset to recover from GPU
> > > hangs.
> > > +	 * This procedure looks very different depending on
> > > whether a firmware
> > > +	 * or a hardware scheduler is being used.
> > > +	 *
> > > +	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one
> > > scheduler, and
> > 
> > Why pseudo? It's still a real ring buffer.
> > 
> > > +	 * each scheduler has one entity. Hence, you typically
> > > follow those
> > > +	 * steps:
> > 
> > Maybe better "Hence, the steps taken typically look as follows:".
> > 
> > > +	 *
> > > +	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > > pause the
> > > +	 *    scheduler workqueues and cancel the timeout work,
> > > guaranteeing
> > > +	 *    that nothing is queued while we remove the ring.
> > 
> > "while the ring is removed"
> > 
> > > +	 * 2. Remove the ring. In most (all?) cases the firmware
> > > will make sure
> > 
> > At least I don't know about other cases and I also don't think it'd
> > make a lot
> > of sense if it'd be different. But of course there's no rule
> > preventing people
> > to implement things weirdly.
> 
> Seems like we can then use an absolute phrase here and who really wants
> to do weird things won't be stopped by that anyways :]
> 
> > 
> > > +	 *    that the corresponding parts of the hardware are
> > > resetted, and that
> > > +	 *    other rings are not impacted.
> > > +	 * 3. Kill the entity the faulted job stems from, and the
> > > associated
> > 
> > There can only be one entity in this case, so you can drop "the
> > faulted job
> > stems from".
> > 
> > > +	 *    scheduler.
> > > +	 *
> > > +	 *
> > > +	 * For a HARDWARE SCHEDULER, each ring also has one
> > > scheduler, but each
> > > +	 * scheduler is typically associated with many entities.
> > > This implies
> > 
> > What about "each scheduler can be scheduling one or more entities"?
> > 
> > > +	 * that all entities associated with the affected
> > > scheduler cannot be
> > 
> > I think you want to say that not all entites can be torn down, rather
> > than none
> > of them can be torn down.
> > 
> > > +	 * torn down, because this would effectively also kill
> > > innocent
> > > +	 * userspace processes which did not submit faulty jobs
> > > (for example).
> > 
> > This is phrased ambiguously, "kill userspace processs" typically
> > means something
> > different than you mean in this context.
> 
> then let's say "down, because this would also affect users that did not
> provide faulty jobs through their entities.", ack?

Sounds good.

> 
> 
> Danke,
> P.
> 
> > 
> > > +	 *
> > > +	 * Consequently, the procedure to recover with a hardware
> > > scheduler
> > > +	 * should look like this:
> > > +	 *
> > > +	 * 1. Stop all schedulers impacted by the reset using
> > > drm_sched_stop().
> > > +	 * 2. Figure out to which entity the faulted job belongs
> > > to.
> > > +	 * 3. Kill that entity.
> > 
> > I'd combine the two steps: "2. Kill the entity the faulty job
> > originates from".
> > 
> > > +	 * 4. Issue a GPU reset on all faulty rings (driver-
> > > specific).
> > > +	 * 5. Re-submit jobs on all schedulers impacted by re-
> > > submitting them to
> > > +	 *    the entities which are still alive.
> > > +	 * 6. Restart all schedulers that were stopped in step #1
> > > using
> > > +	 *    drm_sched_start().
> > >  	 *
> > >  	 * Note that some GPUs have distinct hardware queues but
> > > need to reset
> > >  	 * the GPU globally, which requires extra synchronization
> > > between the
> > > -	 * timeout handler of the different &drm_gpu_scheduler.
> > > One way to
> > > -	 * achieve this synchronization is to create an ordered
> > > workqueue
> > > -	 * (using alloc_ordered_workqueue()) at the driver level,
> > > and pass this
> > > -	 * queue to drm_sched_init(), to guarantee that timeout
> > > handlers are
> > > -	 * executed sequentially. The above workflow needs to be
> > > slightly
> > > -	 * adjusted in that case:
> > > -	 *
> > > -	 * 1. Stop all schedulers impacted by the reset using
> > > drm_sched_stop()
> > > -	 * 2. Try to gracefully stop non-faulty jobs on all queues
> > > impacted by
> > > -	 *    the reset (optional)
> > > -	 * 3. Issue a GPU reset on all faulty queues (driver-
> > > specific)
> > > -	 * 4. Re-submit jobs on all schedulers impacted by the
> > > reset using
> > > -	 *    drm_sched_resubmit_jobs()
> > > -	 * 5. Restart all schedulers that were stopped in step #1
> > > using
> > > -	 *    drm_sched_start()
> > > -	 *
> > > -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > > -	 * and the underlying driver has started or completed
> > > recovery.
> > > -	 *
> > > -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > > longer
> > > -	 * available, i.e. has been unplugged.
> > > +	 * timeout handlers of different schedulers. One way to
> > > achieve this
> > > +	 * synchronization is to create an ordered workqueue
> > > (using
> > > +	 * alloc_ordered_workqueue()) at the driver level, and
> > > pass this queue
> > > +	 * as drm_sched_init()'s @timeout_wq parameter. This will
> > > guarantee
> > > +	 * that timeout handlers are executed sequentially.
> > >  	 */
> > >  	enum drm_gpu_sched_stat (*timedout_job)(struct
> > > drm_sched_job *sched_job);
> > >  
> > > -- 
> > > 2.47.1
> > > 
> 
