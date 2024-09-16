Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED28979E40
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2A210E321;
	Mon, 16 Sep 2024 09:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QCiRhUN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E110E321
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:18:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89ED75C5AB2;
 Mon, 16 Sep 2024 09:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5E0C4CEC4;
 Mon, 16 Sep 2024 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478310;
 bh=zEWR3VljhiLlA5posYMPNrB0uVTCKJ5HXlA8NqGoA7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QCiRhUN3XFWuXYljppL4ITBsTf5UvGs+TQtpjtRovnqMUhkAHvoUNH8auk2Ed9j/M
 rxorIWz/CLx4SeqJf15J1DM7/HAl4pQ+XlPMkfuwK0v+UYd99zPWAEne4425tg0dYC
 LsJkmZK8PhX+soEAyl3F5fiKjDrhQNX/4NExaVWe2vsb4aiQ12lKL1ZGC6qRAc2rXc
 mnEl8h14fysCWezqzR9qLkpXJdeWKl0XzP0iC6mJhcfng9gtdGLAoZGe41ylAm60EK
 ayXtTfO+UsePSvLcaSg6UDqvuZj8C2llhJREHdmyWiXqVzt2rUXa9U+yQK9Gk2vMia
 L/1d/qWiPR2hw==
Date: Mon, 16 Sep 2024 11:18:24 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Asahi Lina <lina@asahilina.net>, stable@vger.kernel.org,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/sched: Fix dynamic job-flow control race
Message-ID: <Zuf34Bg2B78FlKyh@pollux>
References: <20240913202301.16772-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913202301.16772-1-robdclark@gmail.com>
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

On Fri, Sep 13, 2024 at 01:23:01PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes a race condition reported here: https://github.com/AsahiLinux/linux/issues/309#issuecomment-2238968609
> 
> The whole premise of lockless access to a single-producer-single-
> consumer queue is that there is just a single producer and single
> consumer.  That means we can't call drm_sched_can_queue() (which is
> about queueing more work to the hw, not to the spsc queue) from
> anywhere other than the consumer (wq).
> 
> This call in the producer is just an optimization to avoid scheduling
> the consuming worker if it cannot yet queue more work to the hw.  It
> is safe to drop this optimization to avoid the race condition.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")
> Closes: https://github.com/AsahiLinux/linux/issues/309
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>  drivers/gpu/drm/scheduler/sched_main.c   | 7 ++-----
>  include/drm/gpu_scheduler.h              | 2 +-
>  3 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..567e5ace6d0c 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -380,7 +380,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup(entity->rq->sched, entity);
> +	drm_sched_wakeup(entity->rq->sched);
>  }
>  
>  /**
> @@ -612,7 +612,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup(entity->rq->sched, entity);
> +		drm_sched_wakeup(entity->rq->sched);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..6f27cab0b76d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1013,15 +1013,12 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>  /**
>   * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
>   * @sched: scheduler instance
> - * @entity: the scheduler entity
>   *
>   * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> -		      struct drm_sched_entity *entity)
> +void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>  {
> -	if (drm_sched_can_queue(sched, entity))
> -		drm_sched_run_job_queue(sched);
> +	drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fe8edb917360..9c437a057e5d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -574,7 +574,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  
>  void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched, struct drm_sched_entity *entity);
> +void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
> -- 
> 2.46.0
> 
