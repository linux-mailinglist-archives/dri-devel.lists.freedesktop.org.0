Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E58AB30D6
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BF810E2F3;
	Mon, 12 May 2025 07:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J8/bilQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740F910E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:54:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D8E14A1B9;
 Mon, 12 May 2025 07:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1292C4CEE7;
 Mon, 12 May 2025 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747036468;
 bh=S9rI6yp7oFpqb8bVVKe34bLmuYVqayegry1xf0k01FU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8/bilQmfHIBlJ0YqsiTvc5StxD3doZp8DUt/LgRNE9wqQhyD3jLhiEIbjMCw1blQ
 LIoktXpMDfUNQpjHw/tcWHnrQ5apF0HKtK9krktDqpuPeSIRzykn3vXaAosqUrCdq7
 QDHot0Gn3jHw2rXK+VJwgerNgQ0qLj5VgNXNYi0wv3LRBlbj+7mji9lfBfW3yVHsGi
 TFvB4Bx2uZMRF6TDexpwDdkRVYmOpFNYtNzDZO5DTBf1oeuSaMZIMhRTFKCpUrvRpd
 AXhSgyAiugopf1DrjqgFApS3sFthXEdBgarbxoUCQC7rNR2nhGC0VEe5Ae4kZYQdn5
 V4w8mGbtksZjg==
Date: Mon, 12 May 2025 09:54:23 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
Message-ID: <aCGpLxb4WQMPXjmZ@pollux>
References: <20250509212936.490048-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509212936.490048-1-robdclark@gmail.com>
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

On Fri, May 09, 2025 at 02:29:36PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The fence can outlive the sched, so it is not safe to dereference the
> sched in drm_sched_fence_get_timeline_name()
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
>  include/drm/gpu_scheduler.h             | 11 +++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index e971528504a5..4e529c3ba6d4 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>  static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>  {
>  	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return fence->name;
>  }
>  
>  static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>  	unsigned seq;
>  
>  	fence->sched = entity->rq->sched;
> +	fence->name  = fence->sched->name;

This requires sched->name to be a string in the .(ro)data section of the binary,
or a string that the driver only ever frees after all fences of this scheduler
have been freed.

Are we sure that those rules are documented and honored by existing drivers?

Otherwise, we might just fix one bug and create a more subtle one instead. :(

>  	seq = atomic_inc_return(&entity->fence_seq);
>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>  		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0ae108f6fcaf..d830ffe083f1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -295,6 +295,9 @@ struct drm_sched_fence {
>          /**
>           * @sched: the scheduler instance to which the job having this struct
>           * belongs to.
> +         *
> +         * Some care must be taken as to where the sched is derefed, as the
> +         * fence can outlive the sched.
>           */
>  	struct drm_gpu_scheduler	*sched;
>          /**
> @@ -305,6 +308,14 @@ struct drm_sched_fence {
>           * @owner: job owner for debugging
>           */
>  	void				*owner;
> +
> +	/**
> +	 * @name: the timeline name
> +	 *
> +	 * This comes from the @sched, but since the fence can outlive the
> +	 * sched, we need to keep our own copy.

It's our own copy of the pointer, not our own copy of the string. I think we
should be clear about that.

> +	 */
> +	const char			*name;
>  };
