Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B441BBFB78B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD29E10E740;
	Wed, 22 Oct 2025 10:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07C0C10E740
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:53:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06EB1063;
 Wed, 22 Oct 2025 03:53:00 -0700 (PDT)
Received: from [10.57.33.187] (unknown [10.57.33.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470F63F59E;
 Wed, 22 Oct 2025 03:53:06 -0700 (PDT)
Message-ID: <993e72bc-be83-48f0-bac5-eb49079aab57@arm.com>
Date: Wed, 22 Oct 2025 11:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix UAF race between device unplug and FW
 event processing
To: Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022103014.1082629-1-ketil.johnsen@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251022103014.1082629-1-ketil.johnsen@arm.com>
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

On 22/10/2025 11:30, Ketil Johnsen wrote:
> The function panthor_fw_unplug() will free the FW memory sections.
> The problem is that there could still be pending FW events which are yet
> not handled at this point. process_fw_events_work() can in this case try
> to access said freed memory.
> 
> This fix introduces a destroyed state for the panthor_scheduler object,
> and we check for this before processing FW events.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> v2:
> - Followed Boris's advice and handle the race purely within the
>   scheduler block (by adding a destroyed state)
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0cc9055f4ee52..4996f987b8183 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -315,6 +315,13 @@ struct panthor_scheduler {
>  		 */
>  		struct list_head stopped_groups;
>  	} reset;
> +
> +	/**
> +	 * @destroyed: Scheduler object is (being) destroyed
> +	 *
> +	 * Normal scheduler operations should no longer take place.
> +	 */
> +	bool destroyed;
>  };
>  
>  /**
> @@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
>  	u32 events = atomic_xchg(&sched->fw_events, 0);
>  	struct panthor_device *ptdev = sched->ptdev;
>  
> -	mutex_lock(&sched->lock);
> +	guard(mutex)(&sched->lock);
> +
> +	if (sched->destroyed)
> +		return;
>  
>  	if (events & JOB_INT_GLOBAL_IF) {
>  		sched_process_global_irq_locked(ptdev);
> @@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
>  		sched_process_csg_irq_locked(ptdev, csg_id);
>  		events &= ~BIT(csg_id);
>  	}
> -
> -	mutex_unlock(&sched->lock);
>  }
>  
>  /**
> @@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>  	cancel_delayed_work_sync(&sched->tick_work);
>  
>  	mutex_lock(&sched->lock);
> +	sched->destroyed = true;
>  	if (sched->pm.has_ref) {
>  		pm_runtime_put(ptdev->base.dev);
>  		sched->pm.has_ref = false;

