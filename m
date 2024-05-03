Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EAC8BA9C9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BC310FA70;
	Fri,  3 May 2024 09:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04ADA10FA70
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:22:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E296B2F4;
 Fri,  3 May 2024 02:22:43 -0700 (PDT)
Received: from [10.1.39.22] (e122027.cambridge.arm.com [10.1.39.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 859043F73F;
 Fri,  3 May 2024 02:22:17 -0700 (PDT)
Message-ID: <5eef9d94-d2d3-4e28-8ce7-2ebaa96fd1bb@arm.com>
Date: Fri, 3 May 2024 10:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/panthor: Call panthor_sched_post_reset() even if
 the reset failed
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
 <20240502183813.1612017-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502183813.1612017-5-boris.brezillon@collabora.com>
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

On 02/05/2024 19:38, Boris Brezillon wrote:
> We need to undo what was done in panthor_sched_pre_reset() even if the
> reset failed. We just flag all previously running groups as terminated
> when that happens to unblock things.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Seems reasonable, although I hope this case doesn't happen in practice ;)

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  7 +------
>  drivers/gpu/drm/panthor/panthor_sched.c  | 19 ++++++++++++++-----
>  drivers/gpu/drm/panthor/panthor_sched.h  |  2 +-
>  3 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 4c5b54e7abb7..4082c8f2951d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -129,13 +129,8 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	panthor_gpu_l2_power_on(ptdev);
>  	panthor_mmu_post_reset(ptdev);
>  	ret = panthor_fw_post_reset(ptdev);
> -	if (ret)
> -		goto out_dev_exit;
> -
>  	atomic_set(&ptdev->reset.pending, 0);
> -	panthor_sched_post_reset(ptdev);
> -
> -out_dev_exit:
> +	panthor_sched_post_reset(ptdev, ret != 0);
>  	drm_dev_exit(cookie);
>  
>  	if (ret) {
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 6ea094b00cf9..fc43ff62c77d 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2728,15 +2728,22 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
>  	mutex_unlock(&sched->reset.lock);
>  }
>  
> -void panthor_sched_post_reset(struct panthor_device *ptdev)
> +void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
>  {
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_group *group, *group_tmp;
>  
>  	mutex_lock(&sched->reset.lock);
>  
> -	list_for_each_entry_safe(group, group_tmp, &sched->reset.stopped_groups, run_node)
> +	list_for_each_entry_safe(group, group_tmp, &sched->reset.stopped_groups, run_node) {
> +		/* Consider all previously running group as terminated if the
> +		 * reset failed.
> +		 */
> +		if (reset_failed)
> +			group->state = PANTHOR_CS_GROUP_TERMINATED;
> +
>  		panthor_group_start(group);
> +	}
>  
>  	/* We're done resetting the GPU, clear the reset.in_progress bit so we can
>  	 * kick the scheduler.
> @@ -2744,9 +2751,11 @@ void panthor_sched_post_reset(struct panthor_device *ptdev)
>  	atomic_set(&sched->reset.in_progress, false);
>  	mutex_unlock(&sched->reset.lock);
>  
> -	sched_queue_delayed_work(sched, tick, 0);
> -
> -	sched_queue_work(sched, sync_upd);
> +	/* No need to queue a tick and update syncs if the reset failed. */
> +	if (!reset_failed) {
> +		sched_queue_delayed_work(sched, tick, 0);
> +		sched_queue_work(sched, sync_upd);
> +	}
>  }
>  
>  static void group_sync_upd_work(struct work_struct *work)
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index 66438b1f331f..3a30d2328b30 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -40,7 +40,7 @@ void panthor_group_pool_destroy(struct panthor_file *pfile);
>  int panthor_sched_init(struct panthor_device *ptdev);
>  void panthor_sched_unplug(struct panthor_device *ptdev);
>  void panthor_sched_pre_reset(struct panthor_device *ptdev);
> -void panthor_sched_post_reset(struct panthor_device *ptdev);
> +void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed);
>  void panthor_sched_suspend(struct panthor_device *ptdev);
>  void panthor_sched_resume(struct panthor_device *ptdev);
>  

