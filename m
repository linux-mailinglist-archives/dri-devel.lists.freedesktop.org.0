Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAE642536
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 09:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198E410E18C;
	Mon,  5 Dec 2022 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAC110E172;
 Mon,  5 Dec 2022 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670230700; x=1701766700;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j9AiPRbcmVKoeJhFyxNWx6LY6GICpkzkKhIzQMQtLMw=;
 b=CjpHx8RjXdDGOjSYtWH2jNLnsommhiw6x2EiISCTeMz39G8FgjYMOcMt
 SAuaAe4w7SU0fKtw87LWrfzfiaehtQ6meo+qsG4StZsTx8s+r2nwlmwEk
 MB12yYvuUAX/EMqHUm4FXNnHFUoLcWvWDwgEUetllbOJUV8RUnD97nmVH
 6x6jebRXpU9u2C6sonrrMIBJee4ngqeDQzAG37vnaIG6ayAFiFTPTve20
 9pnWgGOnXzOyyQHkHhZofMXObRbM7/kmc2YpJnRUpBq8ucyskAI8VJN40
 OGA61AKFQwQI3pS7mEcDG8dZzXsfaP9HaxRW0C0dhjEkvCxMZsEc8iRff A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="303916526"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="303916526"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:58:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="596130771"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="596130771"
Received: from naumanha-mobl.ger.corp.intel.com (HELO [10.213.231.131])
 ([10.213.231.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:58:18 -0800
Message-ID: <c5eca2f1-0ac6-fd0b-a9ef-d590ccf5d1e0@linux.intel.com>
Date: Mon, 5 Dec 2022 08:58:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl: Add hardware-level lock
 for steering
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-5-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221128233014.4000136-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/11/2022 23:30, Matt Roper wrote:
> Starting with MTL, the driver needs to not only protect the steering
> control register from simultaneous software accesses, but also protect
> against races with hardware/firmware agents.  The hardware provides a
> dedicated locking mechanism to support this via the MTL_STEER_SEMAPHORE
> register.  Reading the register acts as a 'trylock' operation; the read
> will return 0x1 if the lock is acquired or 0x0 if something else is
> already holding the lock; once acquired, writing 0x1 to the register
> will release the lock.
> 
> We'll continue to grab the software lock as well, just so lockdep can
> track our locking; assuming the hardware lock is behaving properly,
> there should never be any contention on the software lock in this case.
> 
> v2:
>   - Extend hardware semaphore timeout and add a taint for CI if it ever
>     happens (this would imply misbehaving hardware/firmware).  (Mika)
>   - Add "MTL_" prefix to new steering semaphore register.  (Mika)
> 
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c  | 38 ++++++++++++++++++++++---
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>   2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index aa070ae57f11..087e4ac5b68d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -347,10 +347,9 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>    * @flags: storage to save IRQ flags to
>    *
>    * Performs locking to protect the steering for the duration of an MCR
> - * operation.  Depending on the platform, this may be a software lock
> - * (gt->mcr_lock) or a hardware lock (i.e., a register that synchronizes
> - * access not only for the driver, but also for external hardware and
> - * firmware agents).
> + * operation.  On MTL and beyond, a hardware lock will also be taken to
> + * serialize access not only for the driver, but also for external hardware and
> + * firmware agents.
>    *
>    * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
>    *          function is called, although it may be acquired after this
> @@ -359,12 +358,40 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>   void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>   {
>   	unsigned long __flags;
> +	int err = 0;
>   
>   	lockdep_assert_not_held(&gt->uncore->lock);
>   
> +	/*
> +	 * Starting with MTL, we need to coordinate not only with other
> +	 * driver threads, but also with hardware/firmware agents.  A dedicated
> +	 * locking register is used.
> +	 */
> +	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> +		err = wait_for(intel_uncore_read_fw(gt->uncore,
> +						    MTL_STEER_SEMAPHORE) == 0x1, 100);
> +

If two i915 threads enter here what happens? (Given hw locking is done 
before the spinlock.)

Regards,

Tvrtko

> +	/*
> +	 * Even on platforms with a hardware lock, we'll continue to grab
> +	 * a software spinlock too for lockdep purposes.  If the hardware lock
> +	 * was already acquired, there should never be contention on the
> +	 * software lock.
> +	 */
>   	spin_lock_irqsave(&gt->mcr_lock, __flags);
>   
>   	*flags = __flags;
> +
> +	/*
> +	 * In theory we should never fail to acquire the HW semaphore; this
> +	 * would indicate some hardware/firmware is misbehaving and not
> +	 * releasing it properly.
> +	 */
> +	if (err == -ETIMEDOUT) {
> +		drm_err_ratelimited(&gt->i915->drm,
> +				    "GT%u hardware MCR steering semaphore timed out",
> +				    gt->info.id);
> +		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> +	}
>   }
>   
>   /**
> @@ -379,6 +406,9 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>   void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>   {
>   	spin_unlock_irqrestore(&gt->mcr_lock, flags);
> +
> +	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 784152548472..1618d46cb8c7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -67,6 +67,7 @@
>   #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
>   
>   #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> +#define MTL_STEER_SEMAPHORE			_MMIO(0xfd0)
>   #define MTL_MCR_SELECTOR			_MMIO(0xfd4)
>   #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>   #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
