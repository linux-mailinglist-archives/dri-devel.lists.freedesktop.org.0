Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2696E7A86
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B0810E98F;
	Wed, 19 Apr 2023 13:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB5810E1B2;
 Wed, 19 Apr 2023 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681910492; x=1713446492;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DOvva7yo3ZnsbR5HmK6O4MbBhzHeQJJEvHErRwzyRKQ=;
 b=NdLfLHDrs3Xcoc5bBWkrR9cF336snM6GzivJqt1tcm5zaL/TLD3C0ned
 qmSrbgn0itnINpblswUWtY+HOQcZg2sTRdYZjMYysf2ebjpgK5Cs/iGjB
 /eqqTQQD6C709yYSLWVLwPI2clYODOucT2Q09rka//W4ckzxtUhoWx8ct
 iKPt0USbpMClniMFcSMjSa7GIrZtEXQQSFcQvdjjHl1i/rlL/vcdO4YEk
 2lX489B+bdtG+j75qBoaYKSQf4+aZBprNAgOX68nmIQU7FD+0LJxAFxWU
 Jkq4UmaG80TkTzaaABt8GwTKrPYBwMjylEAekmGxUWkveDUgmpyOz0+KF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431720888"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="431720888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="668942757"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="668942757"
Received: from halahusx-mobl.ger.corp.intel.com (HELO [10.213.223.36])
 ([10.213.223.36])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:21:29 -0700
Message-ID: <340d7a5f-0b38-3c40-77b8-ab825a7b5fef@linux.intel.com>
Date: Wed, 19 Apr 2023 14:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to
 complete
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
 <20230410223509.3593109-4-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230410223509.3593109-4-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/04/2023 23:35, Ashutosh Dixit wrote:
> Instead of erroring out when GuC reset is in progress, block waiting for
> GuC reset to complete which is a more reasonable uapi behavior.
> 
> v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
>   1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 9ab8971679fe3..8471a667dfc71 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -51,6 +51,7 @@ struct hwm_drvdata {
>   	char name[12];
>   	int gt_n;
>   	bool reset_in_progress;
> +	wait_queue_head_t waitq;
>   };
>   
>   struct i915_hwmon {
> @@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
>   static int
>   hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>   {
> +#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
> +
> +	int ret = 0, timeout = GUC_RESET_TIMEOUT;

Patch looks good to me apart that I am not sure what is the purpose of 
the timeout? This is just the sysfs write path or has more callers? If 
the former perhaps it would be better to just use interruptible 
everything (mutex and sleep) and wait for as long as it takes or until 
user presses Ctrl-C?

Regards,

Tvrtko

>   	struct i915_hwmon *hwmon = ddat->hwmon;
>   	intel_wakeref_t wakeref;
> -	int ret = 0;
> +	DEFINE_WAIT(wait);
>   	u32 nval;
>   
> -	mutex_lock(&hwmon->hwmon_lock);
> -	if (hwmon->ddat.reset_in_progress) {
> -		ret = -EAGAIN;
> -		goto unlock;
> +	/* Block waiting for GuC reset to complete when needed */
> +	for (;;) {
> +		mutex_lock(&hwmon->hwmon_lock);
> +
> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> +
> +		if (!hwmon->ddat.reset_in_progress)
> +			break;
> +
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
> +
> +		if (!timeout) {
> +			ret = -ETIME;
> +			break;
> +		}
> +
> +		mutex_unlock(&hwmon->hwmon_lock);
> +
> +		timeout = schedule_timeout(timeout);
>   	}
> +	finish_wait(&ddat->waitq, &wait);
> +	if (ret)
> +		goto unlock;
> +
>   	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
>   
>   	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
> @@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
>   	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
>   			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>   	hwmon->ddat.reset_in_progress = false;
> +	wake_up_all(&hwmon->ddat.waitq);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
> @@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	ddat->uncore = &i915->uncore;
>   	snprintf(ddat->name, sizeof(ddat->name), "i915");
>   	ddat->gt_n = -1;
> +	init_waitqueue_head(&ddat->waitq);
>   
>   	for_each_gt(gt, i915, i) {
>   		ddat_gt = hwmon->ddat_gt + i;
