Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E1A0B5FB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 12:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7ED10E64E;
	Mon, 13 Jan 2025 11:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GvrSSJMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEE010E64E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 11:46:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01ACFA40F22;
 Mon, 13 Jan 2025 11:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6834C4CEDD;
 Mon, 13 Jan 2025 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736768791;
 bh=e4v0A94YQr67qclr/vVcz4wCL38MmJkXidTHTViGUzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvrSSJMNJPVE6vn3kqVwW+Yc37WkSyvT9dVfA6epKneP/tKeJLzfRDYRVO+T+gcCr
 0Ccmm7ruHeaqiQnUQuDRbwxU8FnY14UPQQ6nyuiQZJlHLhAss/gyE7X3otUKMKz37x
 7PGggB0SwFOnt6m1Vgibs2fukiIt+aDsPeus85KaKlFMKs28iQNfcfsNU1OGqAMWap
 QRlF/jfoTq0dM3vuzx4kVeJkWOzrEraexf6o1UyPoe+epPq/eUWbz6PvgcoHWY5Oeh
 eSFKTvTiLWniFFPOEvYrrxhT/49M9XpqAwjituH6648qGbtN1HKJ/qgfmEr4ZpBGHv
 AycALBU4V/qrA==
Date: Mon, 13 Jan 2025 12:46:26 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/3] drm/sched: Update timedout_job()'s documentation
Message-ID: <Z4T9Eq9lMPlmLUYk@pollux.localdomain>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-6-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109133710.39404-6-phasta@kernel.org>
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

On Thu, Jan 09, 2025 at 02:37:12PM +0100, Philipp Stanner wrote:
> drm_sched_backend_ops.timedout_job()'s documentation is outdated. It
> mentions the deprecated function drm_sched_resubmit_job(). Furthermore,
> it does not point out the important distinction between hardware and
> firmware schedulers.
> 
> Since firmware schedulers tyipically only use one entity per scheduler,
> timeout handling is significantly more simple because the entity the
> faulted job came from can just be killed without affecting innocent
> processes.
> 
> Update the documentation with that distinction and other details.
> 
> Reformat the docstring to work to a unified style with the other
> handles.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  include/drm/gpu_scheduler.h | 83 +++++++++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 31 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index c4e65f9f7f22..380b8840c591 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -445,43 +445,64 @@ struct drm_sched_backend_ops {
>  	 * @timedout_job: Called when a job has taken too long to execute,
>  	 * to trigger GPU recovery.
>  	 *
> -	 * This method is called in a workqueue context.
> +	 * @sched_job: The job that has timed out
>  	 *
> -	 * Drivers typically issue a reset to recover from GPU hangs, and this
> -	 * procedure usually follows the following workflow:
> +	 * Returns:
> +	 * - DRM_GPU_SCHED_STAT_NOMINAL, on success, i.e., if the underlying
> +	 *   driver has started or completed recovery.
> +	 * - DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> +	 *   available, i.e., has been unplugged.

Maybe it'd be better to document this at the enum level and add a link.

>  	 *
> -	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
> -	 *    scheduler thread and cancel the timeout work, guaranteeing that
> -	 *    nothing is queued while we reset the hardware queue
> -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> -	 * 3. Issue a GPU reset (driver-specific)
> -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> +	 * Drivers typically issue a reset to recover from GPU hangs.
> +	 * This procedure looks very different depending on whether a firmware
> +	 * or a hardware scheduler is being used.
> +	 *
> +	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one scheduler, and
> +	 * each scheduler (typically) has one entity. Hence, you typically

I think you can remove the first "typically" here. I don't think that for a
firmware scheduler we ever have something else than a 1:1 relation, besides that
having something else than a 1:1 relation (whatever that would be) would likely
be a contradiction to the statement above.

> +	 * follow those steps:
> +	 *
> +	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
> +	 *    scheduler workqueues and cancel the timeout work, guaranteeing
> +	 *    that nothing is queued while we reset the hardware queue.

Rather reset / remove the software queue / ring.

(Besides: I think we should also define a distinct terminology, sometimes "queue"
refers to the ring buffer, sometimes it refers to the entity, etc. At least we
should be consequent within this commit, and then fix the rest.)

> +	 * 2. Try to gracefully stop non-faulty jobs (optional).
> +	 * TODO: RFC ^ Folks, should we remove this step? What does it even mean
> +	 * precisely to "stop" those jobs? Is that even helpful to userspace in
> +	 * any way?

I think this means to prevent unrelated queues / jobs from being impacted by the
subsequent GPU reset.

So, this is likely not applicable here, see below.

> +	 * 3. Issue a GPU reset (driver-specific).

I'm not entirely sure it really applies to all GPUs that feature a FW scheduler,
but I'd expect that the FW takes care of resetting the corresponding HW
(including preventing impact on other FW rings) if the faulty FW ring is removed
by the driver.

> +	 * 4. Kill the entity the faulted job stems from, and the associated
> +	 *    scheduler.
>  	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> -	 *    jobs can be queued, and the scheduler thread is unblocked
> +	 *    jobs can be queued, and the scheduler workqueues awake again.

How can we start the scheduler again after we've killed it? I think the most
likely scenario is that the FW ring (including the scheduler structures) is
removed entirely and simply re-created. So, I think we can probably remove 5.

> +	 *
> +	 * For a HARDWARE SCHEDULER, each ring also has one scheduler, but each
> +	 * scheduler typically has many attached entities. This implies that you

Maybe better "associated". For the second sentence, I'd rephrase it, e.g. "This
implies that all entities associated with the affected scheduler can't be torn
down, because [...]".

> +	 * cannot tear down all entities associated with the affected scheduler,
> +	 * because this would effectively also kill innocent userspace processes
> +	 * which did not submit faulty jobs (for example).
> +	 *
> +	 * Consequently, the procedure to recover with a hardware scheduler
> +	 * should look like this:
> +	 *
> +	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
> +	 * 2. Figure out to which entity the faulted job belongs.

"belongs to"

> +	 * 3. Try to gracefully stop non-faulty jobs (optional).
> +	 * TODO: RFC ^ Folks, should we remove this step? What does it even mean
> +	 * precisely to "stop" those jobs? Is that even helpful to userspace in
> +	 * any way?

See above.

> +	 * 4. Kill that entity.
> +	 * 5. Issue a GPU reset on all faulty rings (driver-specific).
> +	 * 6. Re-submit jobs on all schedulers impacted by re-submitting them to
> +	 *    the entities which are still alive.
> +	 * 7. Restart all schedulers that were stopped in step #1 using
> +	 *    drm_sched_start().
>  	 *
>  	 * Note that some GPUs have distinct hardware queues but need to reset
>  	 * the GPU globally, which requires extra synchronization between the
> -	 * timeout handler of the different &drm_gpu_scheduler. One way to
> -	 * achieve this synchronization is to create an ordered workqueue
> -	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
> -	 * queue to drm_sched_init(), to guarantee that timeout handlers are
> -	 * executed sequentially. The above workflow needs to be slightly
> -	 * adjusted in that case:
> -	 *
> -	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
> -	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
> -	 *    the reset (optional)
> -	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> -	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> -	 *    drm_sched_resubmit_jobs()
> -	 * 5. Restart all schedulers that were stopped in step #1 using
> -	 *    drm_sched_start()
> -	 *
> -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> -	 * and the underlying driver has started or completed recovery.
> -	 *
> -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> -	 * available, i.e. has been unplugged.
> +	 * timeout handlers of different schedulers. One way to achieve this
> +	 * synchronization is to create an ordered workqueue (using
> +	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
> +	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
> +	 * that timeout handlers are executed sequentially.
>  	 */
>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.47.1
> 
