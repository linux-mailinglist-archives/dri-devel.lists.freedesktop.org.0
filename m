Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B5A0793A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110F310EDFE;
	Thu,  9 Jan 2025 14:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="az+nXds1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC6E10EDFE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:30:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA0B65C5B03;
 Thu,  9 Jan 2025 14:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923C6C4CED3;
 Thu,  9 Jan 2025 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736433031;
 bh=noVcV6bVvOQXtSZUecX4gEi6hrcPaEtichTA7lxE4Eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=az+nXds1m148ysZHmY486DStXjZLUw2NhY8yt5AB9l1LbNSIiSDYA621jWD/zURBG
 iqgArl1zUCCupz5d0yCBrXY3az7PBLnI1yXT2DcGN32lDkNOW5r1miwy8uH0l4fCGf
 Li4pYnatrlkp9GR63UbXBovTETWSks1VoFa3To+ZyV7i2vfV/b3Zo8KvbnThFf06m8
 lIPCK9oRBsUr/IsWBO+yzWXzjbKnaTC8/pRcea2ffOhcU7Hi8qzA1+Ms0sxYrrmwXZ
 DjBu5CPhmhF8T3h206aawjRpbEq9/18Y/XgX33FKv2JugOUVGICynZvIgTSKWwNvuh
 DwgbbEb07DH7A==
Date: Thu, 9 Jan 2025 15:30:25 +0100
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
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
Message-ID: <Z3_dgYGOSfLUcI0J@pollux>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109133710.39404-4-phasta@kernel.org>
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

On Thu, Jan 09, 2025 at 02:37:10PM +0100, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> That fence is signalled by the driver once the hardware completed the
> associated job. The scheduler does not increment the reference count on
> that fence, but implicitly expects to inherit this fence from run_job().
> 
> This is relatively subtle and prone to misunderstandings.
> 
> This implies that, to keep a reference for itself, a driver needs to
> call dma_fence_get() in addition to dma_fence_init() in that callback.
> 
> It's further complicated by the fact that the scheduler even decrements
> the refcount in drm_sched_run_job_work() since it created a new
> reference in drm_sched_fence_scheduled(). It does, however, still use
> its pointer to the fence after calling dma_fence_put() - which is safe
> because of the aforementioned new reference, but actually still violates
> the refcounting rules.
> 
> Improve the explanatory comment for that decrement.
> 
> Move the call to dma_fence_put() to the position behind the last usage
> of the fence.
> 
> Document the necessity to increment the reference count in
> drm_sched_backend_ops.run_job().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>  include/drm/gpu_scheduler.h            | 19 +++++++++++++++----
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..5f46c01eb01e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  	drm_sched_fence_scheduled(s_fence, fence);
>  
>  	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> -
>  		r = dma_fence_add_callback(fence, &sched_job->cb,
>  					   drm_sched_job_done_cb);
>  		if (r == -ENOENT)
>  			drm_sched_job_done(sched_job, fence->error);
>  		else if (r)
>  			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +
> +		/*
> +		 * s_fence took a new reference to fence in the call to
> +		 * drm_sched_fence_scheduled() above. The reference passed by

I think mentioning that in this context is a bit misleading. The reason we can
put the fence here, is because we stop using the local fence pointer we have a
reference for (from run_job()).

This has nothing to do with the fact that drm_sched_fence_scheduled() took its
own reference when it stored a copy of this fence pointer in a separate data
structure.

With that fixed,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> +		 * run_job() above is now not needed any longer. Drop it.
> +		 */
> +		dma_fence_put(fence);
>  	} else {
>  		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>  				   PTR_ERR(fence) : 0);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..d5cd2a78f27c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
>  					 struct drm_sched_entity *s_entity);
>  
>  	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved. This may be called multiple times, if
> +	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> +	 * try it again.
> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * Returns: dma_fence the driver must signal once the hardware has
> +	 *	completed the job ("hardware fence").
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra
> +	 * dma_fence_get() on it. Consequently, this callback must take a
> +	 * reference for the scheduler, and additional ones for the driver's
> +	 * respective needs.
>  	 */
>  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.47.1
> 
