Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553EC3C5F3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA83910E94A;
	Thu,  6 Nov 2025 16:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 387E210E94A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:23:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26CEB12FC;
 Thu,  6 Nov 2025 08:23:21 -0800 (PST)
Received: from [10.57.72.2] (unknown [10.57.72.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 075243F66E;
 Thu,  6 Nov 2025 08:23:26 -0800 (PST)
Message-ID: <08c03b0b-79dc-4b4b-9c4d-81d188bc8f92@arm.com>
Date: Thu, 6 Nov 2025 16:23:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] drm/panthor: Fix immediate ticking on a disabled
 tick
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251106144656.1012274-6-boris.brezillon@collabora.com>
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
> We have a few path where we schedule the tick work immediately without
NIT: s/path/paths/> changing the resched_target. If the tick was
stopped, this would lead
> to a remaining_jiffies that's always > 0, and it wouldn't force a full
> tick in that case. Add extra checks to cover that case properly.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index b6489e9ba1f0..1eba56e7360d 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2358,8 +2358,12 @@ static void tick_work(struct work_struct *work)
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		goto out_dev_exit;
>  
> -	if (time_before64(now, sched->resched_target))
> +	if (sched->resched_target != U64_MAX &&
> +	    time_before64(now, sched->resched_target))
>  		remaining_jiffies = sched->resched_target - now;
> +	else if (sched->resched_target == U64_MAX &&
> +		 time_before64(now, sched->last_tick + sched->tick_period))
> +		remaining_jiffies = sched->last_tick + sched->tick_period - now;

I'm wondering if this would be cleaner with an extra variable (and a
comment):

   u64 resched_target = sched->resched_target;

   /* If the tick is stopped, calculate when the next tick would be */
   if (resched_target == U64_MAX)
	   resched_target = sched->last_tick + sched->tick_period;

   if (time_before64(now, resched_target)
	   remaining_jiffies = resched_target - now;

It at least avoids some repetition.

Thanks,
Steve

>  
>  	full_tick = remaining_jiffies == 0;
>  

