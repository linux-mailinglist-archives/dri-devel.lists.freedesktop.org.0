Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4509C8815
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634F010E7E1;
	Thu, 14 Nov 2024 10:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F9A410E7E2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:51:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB971480;
 Thu, 14 Nov 2024 02:51:39 -0800 (PST)
Received: from [10.1.26.55] (e122027.cambridge.arm.com [10.1.26.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A4303F6A8;
 Thu, 14 Nov 2024 02:51:04 -0800 (PST)
Message-ID: <a832b15e-df52-4ccd-a57c-a959a12d94bb@arm.com>
Date: Thu, 14 Nov 2024 10:51:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/panthor: Fix the fast-reset logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241113154257.1971284-6-boris.brezillon@collabora.com>
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
> If we do a GPU soft-reset, that's no longer fast reset. This also means
> the slow reset fallback doesn't work because the MCU state is only reset
> after a GPU soft-reset.
> 
> Let's move the retry logic to panthor_device_resume() to issue a
> soft-reset between the fast and slow attempts, and patch
> panthor_gpu_suspend() to only power-off the L2 when a fast reset is
> requested.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

I also don't have a good way of testing this, but it looks right and it
doesn't blow up in the "normal" case, so:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 32 ++++++++++++----
>  drivers/gpu/drm/panthor/panthor_device.h | 11 ++++++
>  drivers/gpu/drm/panthor/panthor_fw.c     | 48 ++++--------------------
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 11 +++---
>  4 files changed, 49 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index d3276b936141..2b93c56e1319 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -417,6 +417,22 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>  	return 0;
>  }
>  
> +static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
> +{
> +	int ret;
> +
> +	panthor_gpu_resume(ptdev);
> +	panthor_mmu_resume(ptdev);
> +
> +	ret = panthor_fw_resume(ptdev);
> +	if (!ret)
> +		return 0;
> +
> +	panthor_mmu_suspend(ptdev);
> +	panthor_gpu_suspend(ptdev);
> +	return ret;
> +}
> +
>  int panthor_device_resume(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> @@ -443,16 +459,16 @@ int panthor_device_resume(struct device *dev)
>  
>  	if (panthor_device_is_initialized(ptdev) &&
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
> -		panthor_gpu_resume(ptdev);
> -		panthor_mmu_resume(ptdev);
> -		ret = panthor_fw_resume(ptdev);
> -		if (!drm_WARN_ON(&ptdev->base, ret)) {
> -			panthor_sched_resume(ptdev);
> -		} else {
> -			panthor_mmu_suspend(ptdev);
> -			panthor_gpu_suspend(ptdev);
> +		ret = panthor_device_resume_hw_components(ptdev);
> +		if (ret && ptdev->reset.fast) {
> +			drm_err(&ptdev->base, "Fast reset failed, trying a slow reset");
> +			ptdev->reset.fast = false;
> +			ret = panthor_device_resume_hw_components(ptdev);
>  		}
>  
> +		if (!ret)
> +			panthor_sched_resume(ptdev);
> +
>  		drm_dev_exit(cookie);
>  
>  		if (ret)
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index cc74e99e53f9..cab7ce740ce3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -157,6 +157,17 @@ struct panthor_device {
>  
>  		/** @pending: Set to true if a reset is pending. */
>  		atomic_t pending;
> +
> +		/**
> +		 * @fast: True if the post_reset logic can proceed with a fast reset.
> +		 *
> +		 * A fast reset is just a reset where the driver doesn't reload the FW sections.
> +		 *
> +		 * Any time the firmware is properly suspended, a fast reset can take place.
> +		 * On the other hand, if the halt operation failed, the driver will reload
> +		 * all FW sections to make sure we start from a fresh state.
> +		 */
> +		bool fast;
>  	} reset;
>  
>  	/** @pm: Power management related data. */
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index df74750cf1b7..b4fe0de547d1 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -263,17 +263,6 @@ struct panthor_fw {
>  	/** @booted: True is the FW is booted */
>  	bool booted;
>  
> -	/**
> -	 * @fast_reset: True if the post_reset logic can proceed with a fast reset.
> -	 *
> -	 * A fast reset is just a reset where the driver doesn't reload the FW sections.
> -	 *
> -	 * Any time the firmware is properly suspended, a fast reset can take place.
> -	 * On the other hand, if the halt operation failed, the driver will reload
> -	 * all sections to make sure we start from a fresh state.
> -	 */
> -	bool fast_reset;
> -
>  	/** @irq: Job irq data. */
>  	struct panthor_irq irq;
>  };
> @@ -1090,7 +1079,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  	/* Make sure we won't be woken up by a ping. */
>  	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
>  
> -	ptdev->fw->fast_reset = false;
> +	ptdev->reset.fast = false;
>  
>  	if (!on_hang) {
>  		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> @@ -1101,7 +1090,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
>  					status == MCU_STATUS_HALT, 10, 100000) &&
>  		    glb_iface->output->halt_status == PANTHOR_FW_HALT_OK) {
> -			ptdev->fw->fast_reset = true;
> +			ptdev->reset.fast = true;
>  		} else {
>  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
>  		}
> @@ -1131,41 +1120,20 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> -	/* If this is a fast reset, try to start the MCU without reloading
> -	 * the FW sections. If it fails, go for a full reset.
> -	 */
> -	if (ptdev->fw->fast_reset) {
> -		ret = panthor_fw_start(ptdev);
> -		if (!ret)
> -			goto out;
> -
> -		/* Forcibly reset the MCU and force a slow reset, so we get a
> -		 * fresh boot on the next panthor_fw_start() call.
> -		 */
> -		panthor_fw_stop(ptdev);
> -		ptdev->fw->fast_reset = false;
> -		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
> -
> -		ret = panthor_vm_flush_all(ptdev->fw->vm);
> -		if (ret) {
> -			drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS l2cache)");
> -			return ret;
> -		}
> -	}
> -
> -	/* Reload all sections, including RO ones. We're not supposed
> -	 * to end up here anyway, let's just assume the overhead of
> +	/* On a slow reset, reload all sections, including RO ones. We're not
> +	 * supposed to end up here anyway, let's just assume the overhead of
>  	 * reloading everything is acceptable.
>  	 */
> -	panthor_reload_fw_sections(ptdev, true);
> +	if (!ptdev->reset.fast)
> +		panthor_reload_fw_sections(ptdev, true);
>  
>  	ret = panthor_fw_start(ptdev);
>  	if (ret) {
> -		drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )");
> +		drm_err(&ptdev->base, "FW %s reset failed",
> +			ptdev->reset.fast ?  "fast" : "slow");
>  		return ret;
>  	}
>  
> -out:
>  	/* We must re-initialize the global interface even on fast-reset. */
>  	panthor_fw_init_global_iface(ptdev);
>  	return 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 27702bc62dd6..ce3b68124a0a 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -461,11 +461,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>   */
>  void panthor_gpu_suspend(struct panthor_device *ptdev)
>  {
> -	/*
> -	 * It may be preferable to simply power down the L2, but for now just
> -	 * soft-reset which will leave the L2 powered down.
> -	 */
> -	panthor_gpu_soft_reset(ptdev);
> +	/* On a fast reset, simply power down the L2. */
> +	if (!ptdev->reset.fast)
> +		panthor_gpu_soft_reset(ptdev);
> +	else
> +		panthor_gpu_power_off(ptdev, L2, 1, 20000);
> +
>  	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
>  }
>  

