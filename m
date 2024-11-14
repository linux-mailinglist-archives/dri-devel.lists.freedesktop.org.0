Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3929C8813
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0E410E7E0;
	Thu, 14 Nov 2024 10:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 896A110E7DE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:51:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FE4A2BC2;
 Thu, 14 Nov 2024 02:51:31 -0800 (PST)
Received: from [10.1.26.55] (e122027.cambridge.arm.com [10.1.26.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F133F6A8;
 Thu, 14 Nov 2024 02:50:59 -0800 (PST)
Message-ID: <f7f15141-0c49-4eb4-a4e9-c8d8f22ff5d3@arm.com>
Date: Thu, 14 Nov 2024 10:50:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/panthor: Ignore devfreq_{suspend, resume}_device()
 failures
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241113154257.1971284-4-boris.brezillon@collabora.com>
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

On 13/11/2024 15:42, Boris Brezillon wrote:
> devfreq_{resume,suspend}_device() don't bother undoing the suspend_count
> modifications if something fails, so either it assumes failures are
> harmless, or it's super fragile/buggy. In either case it's not something
> we can address at the driver level, so let's just assume failures are
> harmless for now, like is done in panfrost.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

With the missing chunk from patch 2:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 12 ++++++------
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  4 ++--
>  drivers/gpu/drm/panthor/panthor_device.c  | 22 +++-------------------
>  3 files changed, 11 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 9d0f891b9b53..fadc2edb26fe 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -244,26 +244,26 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> -int panthor_devfreq_resume(struct panthor_device *ptdev)
> +void panthor_devfreq_resume(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  
>  	if (!pdevfreq->devfreq)
> -		return 0;
> +		return;
>  
>  	panthor_devfreq_reset(pdevfreq);
>  
> -	return devfreq_resume_device(pdevfreq->devfreq);
> +	drm_WARN_ON(&ptdev->base, devfreq_resume_device(pdevfreq->devfreq));
>  }
>  
> -int panthor_devfreq_suspend(struct panthor_device *ptdev)
> +void panthor_devfreq_suspend(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  
>  	if (!pdevfreq->devfreq)
> -		return 0;
> +		return;
>  
> -	return devfreq_suspend_device(pdevfreq->devfreq);
> +	drm_WARN_ON(&ptdev->base, devfreq_suspend_device(pdevfreq->devfreq));
>  }
>  
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index 83a5c9522493..b7631de695f7 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -12,8 +12,8 @@ struct panthor_devfreq;
>  
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>  
> -int panthor_devfreq_resume(struct panthor_device *ptdev);
> -int panthor_devfreq_suspend(struct panthor_device *ptdev);
> +void panthor_devfreq_resume(struct panthor_device *ptdev);
> +void panthor_devfreq_suspend(struct panthor_device *ptdev);
>  
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev);
>  void panthor_devfreq_record_idle(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 8b5d54b2bbb4..353f3aabef42 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -439,9 +439,7 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
>  
> -	ret = panthor_devfreq_resume(ptdev);
> -	if (ret)
> -		goto err_disable_coregroup_clk;
> +	panthor_devfreq_resume(ptdev);
>  
>  	if (panthor_device_is_initialized(ptdev) &&
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
> @@ -478,8 +476,6 @@ int panthor_device_resume(struct device *dev)
>  
>  err_suspend_devfreq:
>  	panthor_devfreq_suspend(ptdev);
> -
> -err_disable_coregroup_clk:
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  
>  err_disable_stacks_clk:
> @@ -496,7 +492,7 @@ int panthor_device_resume(struct device *dev)
>  int panthor_device_suspend(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> -	int ret, cookie;
> +	int cookie;
>  
>  	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
>  		return -EINVAL;
> @@ -528,19 +524,7 @@ int panthor_device_suspend(struct device *dev)
>  		drm_dev_exit(cookie);
>  	}
>  
> -	ret = panthor_devfreq_suspend(ptdev);
> -	if (ret) {
> -		if (panthor_device_is_initialized(ptdev) &&
> -		    drm_dev_enter(&ptdev->base, &cookie)) {
> -			panthor_gpu_resume(ptdev);
> -			panthor_mmu_resume(ptdev);
> -			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> -			panthor_sched_resume(ptdev);
> -			drm_dev_exit(cookie);
> -		}
> -
> -		goto err_set_active;
> -	}
> +	panthor_devfreq_suspend(ptdev);
>  
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  	clk_disable_unprepare(ptdev->clks.stacks);

