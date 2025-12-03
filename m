Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD0C9E856
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104910E764;
	Wed,  3 Dec 2025 09:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 53C9B10E760
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:40:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9369E1477
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 01:40:22 -0800 (PST)
Received: from [10.2.10.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 B2A493F59E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 01:40:29 -0800 (PST)
Date: Wed, 3 Dec 2025 09:40:02 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ashley.smith@collabora.com
Subject: Re: [PATCH v2] drm/panthor: fix queue_reset_timeout_locked
Message-ID: <aTAFcgs1GiX566io@e142607>
References: <20251202213102.3197965-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202213102.3197965-1-olvaffe@gmail.com>
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

On Tue, Dec 02, 2025 at 01:31:02PM -0800, Chia-I Wu wrote:
> queue_check_job_completion calls queue_reset_timeout_locked to reset the
> timeout when progress is made. We want the reset to happen when the
> timeout is running, not when it is suspended.
> 
> Fixes: 345c5b7cc0f85 ("drm/panthor: Make the timeout per-queue instead of per-job")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> ---
> v2: reset queue->timeout.remaining when suspended (Boris)
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 26 +++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 389d508b3848e..95ae42168ce18 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1052,18 +1052,6 @@ group_is_idle(struct panthor_group *group)
>  	return hweight32(inactive_queues) == group->queue_count;
>  }
>  
> -static void
> -queue_reset_timeout_locked(struct panthor_queue *queue)
> -{
> -	lockdep_assert_held(&queue->fence_ctx.lock);
> -
> -	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT) {
> -		mod_delayed_work(queue->scheduler.timeout_wq,
> -				 &queue->timeout.work,
> -				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> -	}
> -}
> -
>  static bool
>  group_can_run(struct panthor_group *group)
>  {
> @@ -1080,6 +1068,20 @@ queue_timeout_is_suspended(struct panthor_queue *queue)
>  	return queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT;
>  }
>  
> +static void
> +queue_reset_timeout_locked(struct panthor_queue *queue)
> +{
> +	lockdep_assert_held(&queue->fence_ctx.lock);
> +
> +	if (queue_timeout_is_suspended(queue)) {
> +		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +	} else {
> +		mod_delayed_work(queue->scheduler.timeout_wq,
> +				 &queue->timeout.work,
> +				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> +	}
> +}
> +
>  static void
>  queue_suspend_timeout_locked(struct panthor_queue *queue)
>  {
> -- 
> 2.52.0.158.g65b55ccf14-goog
> 
