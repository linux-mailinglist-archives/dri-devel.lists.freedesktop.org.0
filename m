Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A67D3635
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 14:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AC210E1D0;
	Mon, 23 Oct 2023 12:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4AF10E1D0;
 Mon, 23 Oct 2023 12:16:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 531D6660576C;
 Mon, 23 Oct 2023 13:16:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698063369;
 bh=NG9alYNAxHewP4jJwK1KCWkHEcd91zuPAus7pKBBYkU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TH2c8BY4ncQ/CUFjxoUQOLvIqMvWIPbxfpOtydjmYC3IVxliVy1XcI3XaT0gsrVOg
 NMTlCsfpK7sg8aN1LZFZD2z1uEMEcSTjGPlLuuNgpDxJsoAX3oxBbwPXBKkKJLC4Dl
 iiHN3N8xkxXSRpfO1Rldia2MtbgVX6TcvlwBFeg4KH6aR2TZAxfKOkpvGcbgmaVGxK
 KrFZbNlZRY8uyV/MkShqiDyDSk52APy7Hgf+G1edv0xHxfXPN3bkHc45S1agZgwj4G
 hVmmZTqTCfU0XIfu2nMM7smpGpVyRGPBP02xKV2oBQ53/eKP5tpMBLW1xEjJOhpxTD
 xUJ0KsM8IxDKg==
Date: Mon, 23 Oct 2023 14:16:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Message-ID: <20231023141606.3dd53c39@collabora.com>
In-Reply-To: <20231017150958.838613-6-matthew.brost@intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 17 Oct 2023 08:09:56 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
> +	int r;
>  
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
> +
> +	entity = drm_sched_select_entity(sched, true);
> +	if (!entity)
> +		return;
>  
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
>  		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +		return;	/* No more work */
> +	}
>  
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	s_fence = sched_job->s_fence;
>  
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
>  
> -		wake_up(&sched->job_scheduled);
> +	trace_drm_run_job(sched_job, entity);
> +	fence = sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
> +
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
> +
> +		r = dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r == -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>  	}

Just ran into a race condition when using a non-ordered workqueue
for drm_sched:

thread A							thread B

drm_sched_run_job_work()			
  drm_sched_job_begin()
    // inserts jobA in pending_list

								drm_sched_free_job_work()
								  drm_sched_get_cleanup_job()
								    // check first job in pending list
								    // if s_fence->parent == NULL, consider
								    // for cleanup
								  ->free_job(jobA)
								    drm_sched_job_cleanup()
								      // set sched_job->s_fence = NULL

    ->run_job()
    drm_sched_fence_scheduled()
      // sched_job->s_fence->parent = parent_fence
      // BOOM => NULL pointer deref

For now, I'll just use a dedicated ordered wq, but if we claim
multi-threaded workqueues are supported, this is probably worth fixing.
I know there's been some discussions about when the timeout should be
started, and the job insertion in the pending_list is kinda related.
If we want this insertion to happen before ->run_job() is called, we
need a way to flag when a job is inserted, but not fully submitted yet.

Regards,

Boris
