Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83416E8BEF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3E410EBCE;
	Thu, 20 Apr 2023 07:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A4510EBCE;
 Thu, 20 Apr 2023 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681977451; x=1713513451;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=115pCNugrh4BzYcYtVmPg4LHJghcH5jLOElQhf2IUUI=;
 b=SbcwXu/XE49cIemyGowiGxKad/89qFgDSE9NK6LIX+aStSEAY83zqehb
 1/bV99jv8rK39PYCckAlH3gHKPQhzKfwAbZBWUnlw3S+lJcCygEBU6miv
 swsu8WxAlkVfUoskWFPp+/TCSY11RJaT1yJ4WOzL11dNBdoVxa1pPZevO
 FYZNwSQ8WSsBU733BxkbsONAbEmWKjpdAB+Bd2UzbT2pDBm4PQyXEp9IF
 qMd0+eyX0jCtUV6sijBS0PmXFp2AQxzWckiQdMV6aXojYpL8bSwVWqrUo
 5YBL18zmPwVZdMW0zgoFGRef9hgixinfKGnE/5IyUpMWdBq7aReedWpM+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410903638"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="410903638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 00:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722280666"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; d="scan'208";a="722280666"
Received: from gbyrne6x-mobl1.ger.corp.intel.com (HELO [10.213.221.188])
 ([10.213.221.188])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 00:57:26 -0700
Message-ID: <852cfbbe-25be-ec23-e182-8e81f2f0e98a@linux.intel.com>
Date: Thu, 20 Apr 2023 08:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to
 complete
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
 <20230410223509.3593109-4-ashutosh.dixit@intel.com>
 <340d7a5f-0b38-3c40-77b8-ab825a7b5fef@linux.intel.com>
 <871qkfo74r.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <871qkfo74r.wl-ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/04/2023 23:10, Dixit, Ashutosh wrote:
> On Wed, 19 Apr 2023 06:21:27 -0700, Tvrtko Ursulin wrote:
>>
> 
> Hi Tvrtko,
> 
>> On 10/04/2023 23:35, Ashutosh Dixit wrote:
>>> Instead of erroring out when GuC reset is in progress, block waiting for
>>> GuC reset to complete which is a more reasonable uapi behavior.
>>>
>>> v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
>>>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
>>>    1 file changed, 33 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
>>> index 9ab8971679fe3..8471a667dfc71 100644
>>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>>> @@ -51,6 +51,7 @@ struct hwm_drvdata {
>>> 	char name[12];
>>> 	int gt_n;
>>> 	bool reset_in_progress;
>>> +	wait_queue_head_t waitq;
>>>    };
>>>      struct i915_hwmon {
>>> @@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
>>>    static int
>>>    hwm_power_max_write(struct hwm_drvdata *ddat, long val)
>>>    {
>>> +#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
>>> +
>>> +	int ret = 0, timeout = GUC_RESET_TIMEOUT;
>>
>> Patch looks good to me
> 
> Great, thanks :)
> 
>> apart that I am not sure what is the purpose of the timeout? This is just
>> the sysfs write path or has more callers?
> 
> It is just the sysfs path, but the sysfs is accessed also by the oneAPI
> stack (Level 0). In the initial version I also didn't have the timeout
> thinking that the app can send a signal to the blocked thread to unblock
> it. I introduced the timeout after Rodrigo brought it up and I am now
> thinking maybe it's better to have the timeout in the driver since the app
> has no knowledge of how long GuC resets can take. But I can remove it if
> you think it's not needed.

Maybe I am missing something but I don't get why we would need to 
provide a timeout facility in sysfs? If the library writes here to 
configure something it already has to expect a blocking write by the 
nature of a a write(2) and sysfs contract. It can take long for any 
reason so I hope we are not guaranteeing some latency number to someone? 
Or the concern is just about things getting stuck? In which case I think 
Ctrl-C is the answer because ETIME is not even listed as an errno for 
write(2).

>> If the
>> former perhaps it would be better to just use interruptible everything
>> (mutex and sleep) and wait for as long as it takes or until user presses
>> Ctrl-C?
> 
> Now we are not holding the mutexes for long, just long enough do register
> rmw's. So not holding the mutex across GuC reset as we were
> originally. Therefore I am thinking mutex_lock_interruptible is not needed?
> The sleep is already interruptible (TASK_INTERRUPTIBLE).

Ah yes, you are right.

Regards,

Tvrtko

> Anyway please let me know if you think we need to change anything.
> 
> Thanks.
> --
> Ashutosh
> 
>>> 	struct i915_hwmon *hwmon = ddat->hwmon;
>>> 	intel_wakeref_t wakeref;
>>> -	int ret = 0;
>>> +	DEFINE_WAIT(wait);
>>> 	u32 nval;
>>>    -	mutex_lock(&hwmon->hwmon_lock);
>>> -	if (hwmon->ddat.reset_in_progress) {
>>> -		ret = -EAGAIN;
>>> -		goto unlock;
>>> +	/* Block waiting for GuC reset to complete when needed */
>>> +	for (;;) {
>>> +		mutex_lock(&hwmon->hwmon_lock);
>>> +
>>> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
>>> +
>>> +		if (!hwmon->ddat.reset_in_progress)
>>> +			break;
>>> +
>>> +		if (signal_pending(current)) {
>>> +			ret = -EINTR;
>>> +			break;
>>> +		}
>>> +
>>> +		if (!timeout) {
>>> +			ret = -ETIME;
>>> +			break;
>>> +		}
>>> +
>>> +		mutex_unlock(&hwmon->hwmon_lock);
>>> +
>>> +		timeout = schedule_timeout(timeout);
>>> 	}
>>> +	finish_wait(&ddat->waitq, &wait);
>>> +	if (ret)
>>> +		goto unlock;
>>> +
>>> 	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
>>> 		/* Disable PL1 limit and verify, because the limit cannot be
>>> disabled on all platforms */
>>> @@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
>>> 	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
>>> 			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>>> 	hwmon->ddat.reset_in_progress = false;
>>> +	wake_up_all(&hwmon->ddat.waitq);
>>> 		mutex_unlock(&hwmon->hwmon_lock);
>>>    }
>>> @@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>>> 	ddat->uncore = &i915->uncore;
>>> 	snprintf(ddat->name, sizeof(ddat->name), "i915");
>>> 	ddat->gt_n = -1;
>>> +	init_waitqueue_head(&ddat->waitq);
>>> 		for_each_gt(gt, i915, i) {
>>> 		ddat_gt = hwmon->ddat_gt + i;
