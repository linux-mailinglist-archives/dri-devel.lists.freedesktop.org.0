Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE0C3C7FE
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B571910E954;
	Thu,  6 Nov 2025 16:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2E5910E954
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:39:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666B91516;
 Thu,  6 Nov 2025 08:39:09 -0800 (PST)
Received: from [10.57.72.2] (unknown [10.57.72.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07B7E3F66E;
 Thu,  6 Nov 2025 08:39:15 -0800 (PST)
Message-ID: <730fe6c8-a651-4f1a-b8a4-0d17986687ff@arm.com>
Date: Thu, 6 Nov 2025 16:39:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] drm/panthor: Make sure we resume the tick when new
 jobs are submitted
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-8-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251106144656.1012274-8-boris.brezillon@collabora.com>
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
> If the group is already assigned a slot but was idle before this job
> submission, we need to make sure the priority rotation happens in the
> future. Extract the existing logic living in group_schedule_locked()
> and call this new sched_resume_tick() helper from the "group is
> assigned a slot" path.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 43 +++++++++++++++++++------
>  1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 7b164228af7b..923816397751 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2541,14 +2541,33 @@ static void sync_upd_work(struct work_struct *work)
>  		sched_queue_delayed_work(sched, tick, 0);
>  }
>  
> +static void sched_resume_tick(struct panthor_device *ptdev)
> +{
> +	struct panthor_scheduler *sched = ptdev->scheduler;
> +	u64 delay_jiffies, now;
> +
> +	drm_WARN_ON(&ptdev->base, sched->resched_target != U64_MAX);
> +
> +	/* Scheduler tick was off, recalculate the resched_target based on the
> +	 * last tick event, and queue the scheduler work.
> +	 */
> +	now = get_jiffies_64();
> +	sched->resched_target = sched->last_tick + sched->tick_period;
> +	if (sched->used_csg_slot_count == sched->csg_slot_count &&
> +	    time_before64(now, sched->resched_target))
> +		delay_jiffies = min_t(unsigned long, sched->resched_target - now, ULONG_MAX);
> +	else
> +		delay_jiffies = 0;
> +
> +	sched_queue_delayed_work(sched, tick, delay_jiffies);
> +}
> +
>  static void group_schedule_locked(struct panthor_group *group, u32 queue_mask)
>  {
>  	struct panthor_device *ptdev = group->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct list_head *queue = &sched->groups.runnable[group->priority];
> -	u64 delay_jiffies = 0;
>  	bool was_idle;
> -	u64 now;
>  
>  	if (!group_can_run(group))
>  		return;
> @@ -2593,13 +2612,7 @@ static void group_schedule_locked(struct panthor_group *group, u32 queue_mask)
>  	/* Scheduler tick was off, recalculate the resched_target based on the
>  	 * last tick event, and queue the scheduler work.
>  	 */
> -	now = get_jiffies_64();
> -	sched->resched_target = sched->last_tick + sched->tick_period;
> -	if (sched->used_csg_slot_count == sched->csg_slot_count &&
> -	    time_before64(now, sched->resched_target))
> -		delay_jiffies = min_t(unsigned long, sched->resched_target - now, ULONG_MAX);
> -
> -	sched_queue_delayed_work(sched, tick, delay_jiffies);
> +	sched_resume_tick(ptdev);
>  }
>  
>  static void queue_stop(struct panthor_queue *queue,
> @@ -3200,6 +3213,18 @@ queue_run_job(struct drm_sched_job *sched_job)
>  
>  		group_schedule_locked(group, BIT(job->queue_idx));
>  	} else {
> +		u32 queue_mask = BIT(job->queue_idx);
> +		bool resume_tick = group_is_idle(group) &&
> +				   (group->idle_queues & queue_mask) &&
> +				   !(group->blocked_queues & queue_mask) &&
> +				   sched->resched_target == U64_MAX;
> +
> +		/* We just added something to the queue, so it's no longer idle. */
> +		group->idle_queues &= ~BIT(job->queue_idx);
> +
> +		if (resume_tick)
> +			sched_resume_tick(ptdev);
> +
>  		gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
>  		if (!sched->pm.has_ref &&
>  		    !(group->blocked_queues & BIT(job->queue_idx))) {

