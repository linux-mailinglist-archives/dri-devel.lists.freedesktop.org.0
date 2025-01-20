Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F19A1712B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4774310E089;
	Mon, 20 Jan 2025 17:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sNZUDvAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AE110E069;
 Mon, 20 Jan 2025 17:18:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DF875C5D59;
 Mon, 20 Jan 2025 17:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283B4C4CEDD;
 Mon, 20 Jan 2025 17:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737393479;
 bh=7UvFMIGMwdtuX5wHCGv0mAgnStO1x3T5gJDiuiDjDUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sNZUDvAW+aHPoDtC/vvBtroMWLKqxbDoaMkYlKPgoEaO8eHTvD/0jf8DLWgHQbGAM
 KuqKquXsI7N+hgtVYz4hjovE4vDyOM85k9mWUAUcLaO8RfP3e9UGP/IyohIZKXrSZO
 Si+MvjoX5DZnkTNRBe5UEtGdoPbPWJowBtYhLJMqfIlJWrzgDltHpk15W+hIK4BgMC
 rwMWvFXOALz1cSAZrvaT/tg8vcOEe6tJlqfHtvH4+CoLiqzyT5fIJ6UypDSFcYzXz8
 YjX0BPAltOlhJvkuwVlvzIEg0mVZWIeeIeSMKU6/wdXcSxiMkOKIOcIZr5EjwNRxqK
 eYf+NhdUZQgcg==
Date: Mon, 20 Jan 2025 18:17:55 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 3/4] drm/sched: Remove to_drm_sched_job internal helper
Message-ID: <Z46FQw2swGX4yD5i@pollux>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
 <20250120165240.9105-4-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120165240.9105-4-tvrtko.ursulin@igalia.com>
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

On Mon, Jan 20, 2025 at 04:52:39PM +0000, Tvrtko Ursulin wrote:
> The code assumes queue node is the first element in struct
> drm_sched_job.

I'd add that this assumption lies in doing the NULL check after the
container_of(). Without saying that, it might not be that obvious.

> Since this is not documented it can be very fragile so lets
> just remove the internal helper and explicitly check for "nothing
> dequeued", before converting the node to a sched job.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 18 +++++++++---------
>  drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 7c0d266a89ef..8992bb432ec6 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -30,9 +30,6 @@
>  
>  #include "gpu_scheduler_trace.h"
>  
> -#define to_drm_sched_job(sched_job)		\
> -		container_of((sched_job), struct drm_sched_job, queue_node)
> -
>  /**
>   * drm_sched_entity_init - Init a context entity used by scheduler when
>   * submit to HW ring.
> @@ -476,11 +473,14 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *sched_job;
> +	struct spsc_node *node;
>  
> -	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -	if (!sched_job)
> +	node = spsc_queue_peek(&entity->job_queue);
> +	if (!node)
>  		return NULL;
>  
> +	sched_job = container_of(node, typeof(*sched_job), queue_node);

So, here you have this pattern for a valid used case and even twice. I think you
should add drm_sched_entity_peek_job() instead and document what the
preconditions are to be allowed to peek given it's an spsc queue.

> +
>  	while ((entity->dependency =
>  			drm_sched_job_dependency(sched_job, entity))) {
>  		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
> @@ -511,10 +511,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * the timestamp of the next job, if any.
>  	 */
>  	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> -		struct drm_sched_job *next;
> -
> -		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -		if (next) {
> +		node = spsc_queue_peek(&entity->job_queue);
> +		if (node) {
> +			struct drm_sched_job *next =
> +				container_of(node, typeof(*next), queue_node);
>  			struct drm_sched_rq *rq;
>  
>  			spin_lock(&entity->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a48be16ab84f..66eee6372253 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,9 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
>  };
>  #endif
>  
> -#define to_drm_sched_job(sched_job)		\
> -		container_of((sched_job), struct drm_sched_job, queue_node)
> -
>  int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>  
>  /**
> @@ -122,11 +119,14 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>  				struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *s_job;
> +	struct spsc_node *node;
>  
> -	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -	if (!s_job)
> +	node = spsc_queue_peek(&entity->job_queue);
> +	if (!node)
>  		return false;
>  
> +	s_job = container_of(node, typeof(*s_job), queue_node);
> +
>  	/* If a job exceeds the credit limit, truncate it to the credit limit
>  	 * itself to guarantee forward progress.
>  	 */
> -- 
> 2.47.1
> 
