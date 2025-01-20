Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C902A17112
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0101510E454;
	Mon, 20 Jan 2025 17:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IHKax2IR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A35F10E456;
 Mon, 20 Jan 2025 17:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2DBF5C5C46;
 Mon, 20 Jan 2025 17:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EE6C4CEE2;
 Mon, 20 Jan 2025 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737393229;
 bh=9Irfj8w69K/CcZ8InhLxan3TlxW7b+9v0OF7jiDvlZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHKax2IR0SukQTwEpwMzP8jGpYszH891WdwIkiYu1PCRvJH35gV0PYrRF2B5UYOul
 rj3ylu0JNOP1hET2+8BFn6AbSzAcCubh5vol5Kr4943j6rPIv2lffddnJi/9marGmS
 7KekewF1WWZU9L647ADP69wH4uo9TQk8XigtaWvoudcCFfSj0qr2qMLtfVEslHyODM
 6UakjpZx98jhsAvnBd+kB8YdtMNT/AsyOYNG59et4HvVn9JDiIJwXHlwrUU1jKV4vS
 5syGVZQ/8/sdQ0gbAp+SNiru63LwjN/QfnOa/SKraclOSGHl84bQQpLu+kQKIRnyH2
 dX3n7lNkroKew==
Date: Mon, 20 Jan 2025 18:13:44 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/4] drm/sched: Add job popping API
Message-ID: <Z46ESMfTh_FDm-eM@pollux>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
 <20250120165240.9105-2-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120165240.9105-2-tvrtko.ursulin@igalia.com>
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

On Mon, Jan 20, 2025 at 04:52:37PM +0000, Tvrtko Ursulin wrote:
> Idea is to add a helper for popping jobs from the entity with the goal
> of making amdgpu use it in the next patch. That way amdgpu will decouple
> itself a tiny bit more from scheduler implementation details.

I object to adding this function if it's *only* used for something that looks
like an abuse of the API by amdgpu. Let's not make that more convenient.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>  include/drm/gpu_scheduler.h              | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 69bcf0e99d57..7c0d266a89ef 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -255,7 +255,7 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  	/* The entity is guaranteed to not be used by the scheduler */
>  	prev = rcu_dereference_check(entity->last_scheduled, true);
>  	dma_fence_get(prev);
> -	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
> +	while ((job = __drm_sched_entity_pop_job(entity))) {
>  		struct drm_sched_fence *s_fence = job->s_fence;
>  
>  		dma_fence_get(&s_fence->finished);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a0ff08123f07..092242f2464f 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -611,6 +611,27 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>  int drm_sched_entity_error(struct drm_sched_entity *entity);
>  
> +/**
> + * __drm_sched_entity_pop_job - Low level helper for popping queued jobs
> + *
> + * @entity: scheduler entity
> + *
> + * Low level helper for popping queued jobs. Drivers should not use it.
> + *
> + * Returns the job dequeued or NULL.
> + */
> +static inline struct drm_sched_job *
> +__drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> +{
> +	struct spsc_node *node;
> +
> +	node = spsc_queue_pop(&entity->job_queue);
> +	if (!node)
> +		return NULL;
> +
> +	return container_of(node, struct drm_sched_job, queue_node);
> +}
> +
>  struct drm_sched_fence *drm_sched_fence_alloc(
>  	struct drm_sched_entity *s_entity, void *owner);
>  void drm_sched_fence_init(struct drm_sched_fence *fence,
> -- 
> 2.47.1
> 
