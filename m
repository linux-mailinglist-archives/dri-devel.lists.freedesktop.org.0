Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE088C3C6B0
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE1110E94F;
	Thu,  6 Nov 2025 16:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F05710E94C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:29:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14E11516;
 Thu,  6 Nov 2025 08:29:43 -0800 (PST)
Received: from [10.57.72.2] (unknown [10.57.72.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A74A3F66E;
 Thu,  6 Nov 2025 08:29:49 -0800 (PST)
Message-ID: <50a6bd19-d8a7-4db5-b7c2-c4f0f52b6372@arm.com>
Date: Thu, 6 Nov 2025 16:29:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] drm/panthor: Fix the logic that decides when to
 stop ticking
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-7-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251106144656.1012274-7-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/11/2025 14:46, Boris Brezillon wrote:
> When we have multiple active groups with the same priority, we need to
> keep ticking for the priority rotation to take place. If we don't do
> that, we might starve slots with lower priorities.
> 
> It's annoying to deal with that in tick_ctx_update_resched_target(),
> so let's add a ::stop_tick field to the tick context which is
> initialized to true, and downgraded to false as soon as we detect
> something that requires to tick to happen. This way we can complement
> the current logic with extra conditions if needed.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 36 ++++++++++++-------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 1eba56e7360d..7b164228af7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1882,6 +1882,7 @@ struct panthor_sched_tick_ctx {
>  	struct panthor_vm *vms[MAX_CS_PER_CSG];
>  	u32 as_count;
>  	bool immediate_tick;
> +	bool stop_tick;
>  	u32 csg_upd_failed_mask;
>  };
>  
> @@ -1941,10 +1942,17 @@ tick_ctx_pick_groups_from_list(const struct panthor_scheduler *sched,
>  		if (!owned_by_tick_ctx)
>  			group_get(group);
>  
> -		list_move_tail(&group->run_node, &ctx->groups[group->priority]);
>  		ctx->group_count++;
> +
> +		/* If we have more than one active group with the same priority,
> +		 * we need to keep ticking to rotate the CSG priority.
> +		 */
>  		if (group_is_idle(group))
>  			ctx->idle_group_count++;
> +		else if (!list_empty(&ctx->groups[group->priority]))
> +			ctx->stop_tick = false;
> +
> +		list_move_tail(&group->run_node, &ctx->groups[group->priority]);
>  
>  		if (i == ctx->as_count)
>  			ctx->vms[ctx->as_count++] = group->vm;
> @@ -1996,6 +2004,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
>  	memset(ctx, 0, sizeof(*ctx));
>  	csgs_upd_ctx_init(&upd_ctx);
>  
> +	ctx->stop_tick = true;
>  	ctx->min_priority = PANTHOR_CSG_PRIORITY_COUNT;
>  	for (i = 0; i < ARRAY_SIZE(ctx->groups); i++) {
>  		INIT_LIST_HEAD(&ctx->groups[i]);
> @@ -2308,32 +2317,21 @@ static u64
>  tick_ctx_update_resched_target(struct panthor_scheduler *sched,
>  			       const struct panthor_sched_tick_ctx *ctx)
>  {
> -	/* We had space left, no need to reschedule until some external event happens. */
> -	if (!tick_ctx_is_full(sched, ctx))
> -		goto no_tick;
> +	u64 resched_target;
>  
> -	/* If idle groups were scheduled, no need to wake up until some external
> -	 * event happens (group unblocked, new job submitted, ...).
> -	 */
> -	if (ctx->idle_group_count)
> +	if (ctx->stop_tick)
>  		goto no_tick;
>  
>  	if (drm_WARN_ON(&sched->ptdev->base, ctx->min_priority >= PANTHOR_CSG_PRIORITY_COUNT))
>  		goto no_tick;
>  
> -	/* If there are groups of the same priority waiting, we need to
> -	 * keep the scheduler ticking, otherwise, we'll just wait for
> -	 * new groups with higher priority to be queued.
> -	 */
> -	if (!list_empty(&sched->groups.runnable[ctx->min_priority])) {
> -		u64 resched_target = sched->last_tick + sched->tick_period;
> +	resched_target = sched->last_tick + sched->tick_period;
>  
> -		if (time_before64(sched->resched_target, sched->last_tick) ||
> -		    time_before64(resched_target, sched->resched_target))
> -			sched->resched_target = resched_target;
> +	if (time_before64(sched->resched_target, sched->last_tick) ||
> +	    time_before64(resched_target, sched->resched_target))
> +		sched->resched_target = resched_target;
>  
> -		return sched->resched_target - sched->last_tick;
> -	}
> +	return sched->resched_target - sched->last_tick;
>  
>  no_tick:
>  	sched->resched_target = U64_MAX;

