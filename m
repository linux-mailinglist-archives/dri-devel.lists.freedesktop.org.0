Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4AC3C55A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B087C10E92C;
	Thu,  6 Nov 2025 16:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A92F610E92C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:18:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A18D12FC;
 Thu,  6 Nov 2025 08:18:08 -0800 (PST)
Received: from [10.57.72.2] (unknown [10.57.72.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C2A03F66E;
 Thu,  6 Nov 2025 08:18:14 -0800 (PST)
Message-ID: <13225a8e-f049-4e78-8630-748decb1be9d@arm.com>
Date: Thu, 6 Nov 2025 16:18:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] drm/panthor: Fix the group priority rotation logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251106144656.1012274-4-boris.brezillon@collabora.com>
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
> It's the group item that's supposed to be inserted before other_group,
> not the other way around.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks correct to me (but then I think I thought that about the old
code... ;) ).

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 46 +++++++++++++++----------
>  1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 94514d464e64..69cc1b4c23f2 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1960,31 +1960,22 @@ tick_ctx_pick_groups_from_list(const struct panthor_scheduler *sched,
>  static void
>  tick_ctx_insert_old_group(struct panthor_scheduler *sched,
>  			  struct panthor_sched_tick_ctx *ctx,
> -			  struct panthor_group *group,
> -			  bool full_tick)
> +			  struct panthor_group *group)
>  {
>  	struct panthor_csg_slot *csg_slot = &sched->csg_slots[group->csg_id];
>  	struct panthor_group *other_group;
>  
> -	if (!full_tick) {
> -		list_add_tail(&group->run_node, &ctx->old_groups[group->priority]);
> -		return;
> -	}
> -
> -	/* Rotate to make sure groups with lower CSG slot
> -	 * priorities have a chance to get a higher CSG slot
> -	 * priority next time they get picked. This priority
> -	 * has an impact on resource request ordering, so it's
> -	 * important to make sure we don't let one group starve
> -	 * all other groups with the same group priority.
> -	 */
> +	/* Class groups in descending priority order so we can easily rotate. */
>  	list_for_each_entry(other_group,
>  			    &ctx->old_groups[csg_slot->group->priority],
>  			    run_node) {
>  		struct panthor_csg_slot *other_csg_slot = &sched->csg_slots[other_group->csg_id];
>  
> -		if (other_csg_slot->priority > csg_slot->priority) {
> -			list_add_tail(&csg_slot->group->run_node, &other_group->run_node);
> +		/* Our group has a higher prio than the one we're testing against,
> +		 * place it just before.
> +		 */
> +		if (csg_slot->priority > other_csg_slot->priority) {
> +			list_add_tail(&group->run_node, &other_group->run_node);
>  			return;
>  		}
>  	}
> @@ -2033,7 +2024,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
>  				group->fatal_queues |= GENMASK(group->queue_count - 1, 0);
>  		}
>  
> -		tick_ctx_insert_old_group(sched, ctx, group, full_tick);
> +		tick_ctx_insert_old_group(sched, ctx, group);
>  		csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, i,
>  					csg_iface->output->ack ^ CSG_STATUS_UPDATE,
>  					CSG_STATUS_UPDATE);
> @@ -2399,9 +2390,28 @@ static void tick_work(struct work_struct *work)
>  	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1;
>  	     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
>  	     prio--) {
> +		struct panthor_group *old_highest_prio_group =
> +			list_first_entry_or_null(&ctx.old_groups[prio],
> +						 struct panthor_group, run_node);
> +
> +		/* Pull out the group with the highest prio for rotation. */
> +		if (old_highest_prio_group)
> +			list_del(&old_highest_prio_group->run_node);
> +
> +		/* Re-insert old active groups so they get a chance to run with higher prio. */
> +		tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], true, true);
> +
> +		/* Fill the remaining slots with runnable groups. */
>  		tick_ctx_pick_groups_from_list(sched, &ctx, &sched->groups.runnable[prio],
>  					       true, false);
> -		tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], true, true);
> +
> +		/* Re-insert the old group with the highest prio, and give it a chance to be
> +		 * scheduled again (but with a lower prio) if there's room left.
> +		 */
> +		if (old_highest_prio_group) {
> +			list_add_tail(&old_highest_prio_group->run_node, &ctx.old_groups[prio]);
> +			tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], true, true);
> +		}
>  	}
>  
>  	/* If we have free CSG slots left, pick idle groups */

