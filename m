Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88103B6FB2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 10:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76A6E82D;
	Tue, 29 Jun 2021 08:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C8D6E842
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 08:50:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b3so24797742wrm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+yiIOgwbvQpB2Q12dgqlNE/GMp/v5EgcCFxjn571hoI=;
 b=dzy+mGcWhmO/Sk83xCDm7XXuZvvzkyUuZ2DB/+PH17ZUlH3Uwx/en9SV4kShOOIWtF
 gx0wVd+WZZhekuIsZOhHCVB9mKxtlWrimztJvkdU7MnOfcbrcBZBNKQgUMEfVdL20bm4
 viupyilLq3ULwbvYRoJMBCub1kSfrT+zb/6pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+yiIOgwbvQpB2Q12dgqlNE/GMp/v5EgcCFxjn571hoI=;
 b=JP00BoqvoKkci0fFGfIGikbXs34a1Tr+6b+WvVhe2C00q7p7KlCgm7nkuKRvt81lV5
 aIeEO/6oFjQMU6VC6/PeClCWEvN7RYFMXMR+JdWndJVUI4BHElfTW719q1txJfxZJzCo
 Ok4ESwRpwFWMgoeR38JpE93Sak00VC04At61bzxIzEyGARYKO7IEASrC+iZTSVmXmm2q
 OrbaokE+U0dX9ABxZ7mvbHto9CHDRKpRpz7FPVHVwX87dqb6uFudXofFgOwrqoZL2Bjs
 W3aIhn/5EnD/pIlqCsBFGkCO0Yk4SiOx67yGzcx8tzp8iJTmAX/0OB7HRXDE3qbuy0Jx
 8n/A==
X-Gm-Message-State: AOAM531WrRSkPbcfR95KOJGAu+t3rLWrhfdQVR8hH/z/S+kZEi8lHP3b
 25ROeloEWNEB27Q/uaaur3yveQ==
X-Google-Smtp-Source: ABdhPJxUpsDUnQXvKs6SY4vg0AYrSy05csorhRlTUkoqOVfeBLb9yvAdIB0iAVi4HnOXvoROKnOylw==
X-Received: by 2002:adf:e4c8:: with SMTP id v8mr32357086wrm.143.1624956638504; 
 Tue, 29 Jun 2021 01:50:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm14210951wms.20.2021.06.29.01.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 01:50:38 -0700 (PDT)
Date: Tue, 29 Jun 2021 10:50:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue
 for the timeout/fault tdr
Message-ID: <YNre3JOtQvvoQWBI@phenom.ffwll.local>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210629073510.2764391-3-boris.brezillon@collabora.com>
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
Cc: Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 09:34:56AM +0200, Boris Brezillon wrote:
> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
> reset. This leads to extra complexity when we need to synchronize timeout
> works with the reset work. One solution to address that is to have an
> ordered workqueue at the driver level that will be used by the different
> schedulers to queue their timeout work. Thanks to the serialization
> provided by the ordered workqueue we are guaranteed that timeout
> handlers are executed sequentially, and can thus easily reset the GPU
> from the timeout handler without extra synchronization.
> 
> v5:
> * Add a new paragraph to the timedout_job() method
> 
> v3:
> * New patch
> 
> v4:
> * Actually use the timeout_wq to queue the timeout work
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also since I'm occasionally blinded by my own pride, add suggested-by: me?
I did spend quite a bit pondering how to untangle your various lockdep
splats in the trd handler :-)

Cheers, Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  3 ++-
>  drivers/gpu/drm/lima/lima_sched.c         |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c   |  3 ++-
>  drivers/gpu/drm/scheduler/sched_main.c    | 14 +++++++++-----
>  drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
>  include/drm/gpu_scheduler.h               | 23 ++++++++++++++++++++++-
>  7 files changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 47ea46859618..532636ea20bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -488,7 +488,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>  
>  	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>  			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, sched_score, ring->name);
> +			   timeout, NULL, sched_score, ring->name);
>  	if (r) {
>  		DRM_ERROR("Failed to create scheduler on ring %s.\n",
>  			  ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 19826e504efc..feb6da1b6ceb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -190,7 +190,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  
>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> -			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev));
> +			     msecs_to_jiffies(500), NULL, NULL,
> +			     dev_name(gpu->dev));
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ecf3267334ff..dba8329937a3 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -508,7 +508,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>  
>  	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> -			      lima_job_hang_limit, msecs_to_jiffies(timeout),
> +			      lima_job_hang_limit,
> +			      msecs_to_jiffies(timeout), NULL,
>  			      NULL, name);
>  }
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 682f2161b999..8ff79fd49577 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -626,7 +626,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
>  				     &panfrost_sched_ops,
> -				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> +				     1, 0,
> +				     msecs_to_jiffies(JOB_TIMEOUT_MS), NULL,
>  				     NULL, "pan_js");
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c0a2f8f8d472..3e180f0d4305 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -232,7 +232,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>  {
>  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>  	    !list_empty(&sched->pending_list))
> -		schedule_delayed_work(&sched->work_tdr, sched->timeout);
> +		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>  }
>  
>  /**
> @@ -244,7 +244,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   */
>  void drm_sched_fault(struct drm_gpu_scheduler *sched)
>  {
> -	mod_delayed_work(system_wq, &sched->work_tdr, 0);
> +	mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>  }
>  EXPORT_SYMBOL(drm_sched_fault);
>  
> @@ -270,7 +270,7 @@ unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched)
>  	 * Modify the timeout to an arbitrarily large value. This also prevents
>  	 * the timeout to be restarted when new submissions arrive
>  	 */
> -	if (mod_delayed_work(system_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
> +	if (mod_delayed_work(sched->timeout_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
>  			&& time_after(sched_timeout, now))
>  		return sched_timeout - now;
>  	else
> @@ -294,7 +294,7 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>  	if (list_empty(&sched->pending_list))
>  		cancel_delayed_work(&sched->work_tdr);
>  	else
> -		mod_delayed_work(system_wq, &sched->work_tdr, remaining);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, remaining);
>  
>  	spin_unlock(&sched->job_list_lock);
>  }
> @@ -837,6 +837,8 @@ static int drm_sched_main(void *param)
>   * @hw_submission: number of hw submissions that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> + *		used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
>   *
> @@ -844,7 +846,8 @@ static int drm_sched_main(void *param)
>   */
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> -		   unsigned hw_submission, unsigned hang_limit, long timeout,
> +		   unsigned hw_submission, unsigned hang_limit,
> +		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name)
>  {
>  	int i, ret;
> @@ -852,6 +855,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
>  	sched->timeout = timeout;
> +	sched->timeout_wq = timeout_wq ? : system_wq;
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 8992480c88fa..a39bdd5cfc4f 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -402,7 +402,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>  			     &v3d_bin_sched_ops,
>  			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms),
> +			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_bin");
>  	if (ret) {
>  		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
> @@ -412,7 +412,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>  			     &v3d_render_sched_ops,
>  			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms),
> +			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_render");
>  	if (ret) {
>  		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
> @@ -424,7 +424,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>  			     &v3d_tfu_sched_ops,
>  			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms),
> +			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_tfu");
>  	if (ret) {
>  		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
> @@ -437,7 +437,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
>  				     &v3d_csd_sched_ops,
>  				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms),
> +				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_csd");
>  		if (ret) {
>  			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
> @@ -449,7 +449,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>  				     &v3d_cache_clean_sched_ops,
>  				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms),
> +				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_cache_clean");
>  		if (ret) {
>  			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 65700511e074..9c41904ffd83 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -253,6 +253,24 @@ struct drm_sched_backend_ops {
>  	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
>  	 *    jobs can be queued, and the scheduler thread is unblocked
>  	 *
> +	 * Note that some GPUs have distinct hardware queues but need to reset
> +	 * the GPU globally, which requires extra synchronization between the
> +	 * timeout handler of the different &drm_gpu_scheduler. One way to
> +	 * achieve this synchronization is to create an ordered workqueue
> +	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
> +	 * queue to drm_sched_init(), to guarantee that timeout handlers are
> +	 * executed sequentially. The above workflow needs to be slightly
> +	 * adjusted in that case:
> +	 *
> +	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
> +	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
> +	 *    the reset (optional)
> +	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> +	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> +	 *    drm_sched_resubmit_jobs()
> +	 * 5. Restart all schedulers that were stopped in step #1 using
> +	 *    drm_sched_start()
> +	 *
>  	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
>  	 * and the underlying driver has started or completed recovery.
>  	 *
> @@ -283,6 +301,7 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> + * @timeout_wq: workqueue used to queue @work_tdr
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @thread: the kthread on which the scheduler which run.
> @@ -307,6 +326,7 @@ struct drm_gpu_scheduler {
>  	wait_queue_head_t		job_scheduled;
>  	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
> +	struct workqueue_struct		*timeout_wq;
>  	struct delayed_work		work_tdr;
>  	struct task_struct		*thread;
>  	struct list_head		pending_list;
> @@ -320,7 +340,8 @@ struct drm_gpu_scheduler {
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> -		   uint32_t hw_submission, unsigned hang_limit, long timeout,
> +		   uint32_t hw_submission, unsigned hang_limit,
> +		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
