Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C3A86255
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1BD10EC04;
	Fri, 11 Apr 2025 15:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 794B310EC07
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:51:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C9E1063;
 Fri, 11 Apr 2025 08:51:56 -0700 (PDT)
Received: from [10.1.28.19] (e122027.cambridge.arm.com [10.1.28.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8562C3F694;
 Fri, 11 Apr 2025 08:51:54 -0700 (PDT)
Message-ID: <3a5306c8-df44-430a-a24e-72d71b2dc8c1@arm.com>
Date: Fri, 11 Apr 2025 16:51:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panthor: Make the timeout per-queue instead of
 per-job
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250410125734.1005532-1-ashley.smith@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250410125734.1005532-1-ashley.smith@collabora.com>
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

Hi Ashley,

On 10/04/2025 13:57, Ashley Smith wrote:
> The timeout logic provided by drm_sched leads to races when we try
> to suspend it while the drm_sched workqueue queues more jobs. Let's
> overhaul the timeout handling in panthor to have our own delayed work
> that's resumed/suspended when a group is resumed/suspended. When an
> actual timeout occurs, we call drm_sched_fault() to report it
> through drm_sched, still. But otherwise, the drm_sched timeout is
> disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> how we protect modifications on the timer.
> 
> One issue seems to be when we call drm_sched_suspend_timeout() from
> both queue_run_job() and tick_work() which could lead to races due to
> drm_sched_suspend_timeout() not having a lock. Another issue seems to
> be in queue_run_job() if the group is not scheduled, we suspend the
> timeout again which undoes what drm_sched_job_begin() did when calling
> drm_sched_start_timeout(). So the timeout does not reset when a job
> is finished.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Daniel Stone <daniels@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 244 +++++++++++++++++-------
>  1 file changed, 177 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 446ec780eb4a..32f5a75bc4f6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c

[...]

> @@ -2727,8 +2784,17 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  			 * automatically terminate all active groups, so let's
>  			 * force the state to halted here.
>  			 */
> -			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
> +			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
>  				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
> +
> +				/* Reset the queue slots manually if the termination
> +				* request failed.
> +				*/
> +				for (i = 0; i < group->queue_count; i++) {
> +					if (group->queues[i])
> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}

So this seems to be the only change from v2 (a changelog can be
helpful!). And I'm not convinced it belongs in this patch? It's not just
"[making] the timeout per-queue instead of per-job".

I haven't dug through the details, but I think this belongs in a
separate patch.

Thanks,
Steve

