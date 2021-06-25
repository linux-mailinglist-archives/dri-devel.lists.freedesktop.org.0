Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B413B4658
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 17:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809AB6EDF1;
	Fri, 25 Jun 2021 15:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E29046EDF0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 15:07:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EF9D1042;
 Fri, 25 Jun 2021 08:07:06 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD39D3F694;
 Fri, 25 Jun 2021 08:07:04 -0700 (PDT)
Subject: Re: [PATCH v3 01/15] drm/sched: Allow using a dedicated workqueue for
 the timeout/fault tdr
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b2f0a103-74dd-0e7d-cef9-6e672353aa3e@arm.com>
Date: Fri, 25 Jun 2021 16:07:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625133327.2598825-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2021 14:33, Boris Brezillon wrote:
> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
> reset. This leads to extra complexity when we need to synchronize timeout
> works with the reset work. One solution to address that is to have an
> ordered workqueue at the driver level that will be used by the different
> schedulers to queue their timeout work. Thanks to the serialization
> provided by the ordered workqueue we are guaranteed that timeout
> handlers are executed sequentially, and can thus easily reset the GPU
> from the timeout handler without extra synchronization.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

I feel like I'm missing something here - I can't see where
sched->timeout_wq is ever actually used in this series. There's clearly
no point passing it into the drm core if the drm core never accesses it.
AFAICT the changes are all in patch 9 and that doesn't depend on this one.

Steve

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  3 ++-
>  drivers/gpu/drm/lima/lima_sched.c         |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c   |  3 ++-
>  drivers/gpu/drm/scheduler/sched_main.c    |  6 +++++-
>  drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
>  include/drm/gpu_scheduler.h               |  5 ++++-
>  7 files changed, 21 insertions(+), 11 deletions(-)
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
> index c0a2f8f8d472..a937d0529944 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
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
> index 10225a0a35d0..d4cdc906709e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -269,6 +269,7 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> + * @timeout_wq: workqueue used to queue @work_tdr
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @thread: the kthread on which the scheduler which run.
> @@ -293,6 +294,7 @@ struct drm_gpu_scheduler {
>  	wait_queue_head_t		job_scheduled;
>  	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
> +	struct workqueue_struct		*timeout_wq;
>  	struct delayed_work		work_tdr;
>  	struct task_struct		*thread;
>  	struct list_head		pending_list;
> @@ -306,7 +308,8 @@ struct drm_gpu_scheduler {
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> -		   uint32_t hw_submission, unsigned hang_limit, long timeout,
> +		   uint32_t hw_submission, unsigned hang_limit,
> +		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
> 

