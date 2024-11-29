Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CF9DE946
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC20510E4F6;
	Fri, 29 Nov 2024 15:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3CA810E4F6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:22:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04F4A12FC;
 Fri, 29 Nov 2024 07:22:41 -0800 (PST)
Received: from [10.57.92.242] (unknown [10.57.92.242])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E61CA3F66E;
 Fri, 29 Nov 2024 07:22:07 -0800 (PST)
Message-ID: <2967da8f-9a39-4109-b6f7-77307bd6094b@arm.com>
Date: Fri, 29 Nov 2024 15:21:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/panthor: Be robust against resume failures
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241128110255.3182366-5-boris.brezillon@collabora.com>
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

On 28/11/2024 11:02, Boris Brezillon wrote:
> When the runtime PM resume callback returns an error, it puts the device
> in a state where it can't be resumed anymore. Make sure we can recover
> from such transient failures by calling pm_runtime_set_suspended()
> explicitly after a pm_runtime_resume_and_get() failure.
> 
> v2:
> - Add a comment explaining potential races in
>   panthor_device_resume_and_get()

Thanks for the comment, see below.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  1 +
>  drivers/gpu/drm/panthor/panthor_device.h | 26 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  |  4 ++--
>  4 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index e3b22107b268..0362101ea896 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -500,6 +500,7 @@ int panthor_device_resume(struct device *dev)
>  
>  err_set_suspended:
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> +	atomic_set(&ptdev->pm.recovery_needed, 1);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 0e68f5a70d20..b6c4f25a5d6e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -9,6 +9,7 @@
>  #include <linux/atomic.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
>  
> @@ -180,6 +181,9 @@ struct panthor_device {
>  		 * is suspended.
>  		 */
>  		struct page *dummy_latest_flush;
> +
> +		/** @recovery_needed: True when a resume attempt failed. */
> +		atomic_t recovery_needed;
>  	} pm;
>  
>  	/** @profile_mask: User-set profiling flags for job accounting. */
> @@ -243,6 +247,28 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
>  int panthor_device_resume(struct device *dev);
>  int panthor_device_suspend(struct device *dev);
>  
> +static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
> +{
> +	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +
> +	/* If the resume failed, we need to clear the runtime_error, which
> +	 * can done by forcing the RPM state to suspended. If multiple
> +	 * threads called panthor_device_resume_and_get(), we only want
> +	 * one of them to update the state, hence the cmpxchg. Note that a
> +	 * thread might enter panthor_device_resume_and_get() and call
> +	 * pm_runtime_resume_and_get() after another thread had attempted
> +	 * to resume and failed. This means we will end up with an error
> +	 * without even attempting a resume ourselves. The only risk here
> +	 * is to report an error when the second resume attempt might have
> +	 * succeeded. Given resume errors are not expected, this is probably
> +	 * something we can live with.

I agree this is "something we can live with", and the comment at least
explains the logic here - so hopefully it won't confuse me in the
future. But it still seems like this is the wrong solution because we've
got a known race.

On the other hand it's a clear improvement over the broken state before
(and I'm afraid I don't have time at the moment to look at it in
detail), so feel free to merge it for now:

Acked-by: Steven Price <steven.price@arm.com>

> +	 */
> +	if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) == 1)
> +		pm_runtime_set_suspended(ptdev->base.dev);
> +
> +	return ret;
> +}
> +
>  enum drm_panthor_exception_type {
>  	DRM_PANTHOR_EXCEPTION_OK = 0x00,
>  	DRM_PANTHOR_EXCEPTION_TERMINATED = 0x04,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1498c97b4b85..b7a9adc918e3 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -763,7 +763,7 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
>  {
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	ret = panthor_device_resume_and_get(ptdev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 97ed5fe5a191..77b184c3fb0c 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2364,7 +2364,7 @@ static void tick_work(struct work_struct *work)
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return;
>  
> -	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	ret = panthor_device_resume_and_get(ptdev);
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		goto out_dev_exit;
>  
> @@ -3131,7 +3131,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		return dma_fence_get(job->done_fence);
>  	}
>  
> -	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	ret = panthor_device_resume_and_get(ptdev);
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		return ERR_PTR(ret);
>  

