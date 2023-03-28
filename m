Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAC6CBA33
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 11:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BDE10E24D;
	Tue, 28 Mar 2023 09:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B065810E24D;
 Tue, 28 Mar 2023 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679994904; x=1711530904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vgqaubslCtnLY0skT/NizIF4CUEaszd8RVLqnwFpe4A=;
 b=nCkxEQ+0sZCDUTE4owjmNQZ8IlLti+530XSjJqx4gT+5QDgiSpwpBGwi
 Efv33sKChxj+HwxSTYR3dL0SvsdKrLhXZJc92VxUVZP0hn39ftxOi0N2p
 /eyL6cA4YmXFcF+JhOdw2MI1piO/2tdcC7Xedc0T88zEZSWLTRGeYR2xv
 KCN7JJ31r2IE3/UpLTfxoxK7qxEzwuV+ftnBLw7b22jGo4yfbxwhzDF2j
 yvvAEh4/V1n8gk/1EXWamEPDKD70eP1ArO8pOb90dEuU2FmkRW4fJKdo1
 3JR3J4uMRdhdv8kH0a+8tiZnek7dA54j1YpiIvC06H2zBoxjRC76ox3Is Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426780466"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="426780466"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 02:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683817509"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="683817509"
Received: from wheelerj-mobl.ger.corp.intel.com (HELO [10.213.213.242])
 ([10.213.213.242])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 02:14:44 -0700
Message-ID: <e06ab8d7-c293-296a-8065-6730f4c85cb2@linux.intel.com>
Date: Tue, 28 Mar 2023 10:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Disable PL1 power limit when
 loading GuC firmware
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
 <4760d41f-c237-9f97-eb32-5d2ab05eea20@intel.com>
 <87sfdtload.wl-ashutosh.dixit@intel.com> <ZCAyGzvnu5mwHMJg@intel.com>
 <87mt3yku5v.wl-ashutosh.dixit@intel.com> <ZCHWrf7v51Hu9EK8@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZCHWrf7v51Hu9EK8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/03/2023 18:47, Rodrigo Vivi wrote:
> 
> +Daniel
> 
> On Mon, Mar 27, 2023 at 09:58:52AM -0700, Dixit, Ashutosh wrote:
>> On Sun, 26 Mar 2023 04:52:59 -0700, Rodrigo Vivi wrote:
>>>
>>
>> Hi Rodrigo,
>>
>>> On Fri, Mar 24, 2023 at 04:31:22PM -0700, Dixit, Ashutosh wrote:
>>>> On Fri, 24 Mar 2023 11:15:02 -0700, Belgaumkar, Vinay wrote:
>>>>>
>>>>
>>>> Hi Vinay,
>>>>
>>>> Thanks for the review. Comments inline below.
>>>>
>>>>> On 3/15/2023 8:59 PM, Ashutosh Dixit wrote:
>>>>>> On dGfx, the PL1 power limit being enabled and set to a low value results
>>>>>> in a low GPU operating freq. It also negates the freq raise operation which
>>>>>> is done before GuC firmware load. As a result GuC firmware load can time
>>>>>> out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
>>>>>> limit was enabled and set to a low value). Therefore disable the PL1 power
>>>>>> limit when allowed by HW when loading GuC firmware.
>>>>> v3 label missing in subject.
>>>>>>
>>>>>> v2:
>>>>>>    - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
>>>>>>    - Add hwm_power_max_restore to error return code path
>>>>>>
>>>>>> v3 (Jani N):
>>>>>>    - Add/remove explanatory comments
>>>>>>    - Function renames
>>>>>>    - Type corrections
>>>>>>    - Locking annotation
>>>>>>
>>>>>> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
>>>>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++
>>>>>>    drivers/gpu/drm/i915/i915_hwmon.c     | 39 +++++++++++++++++++++++++++
>>>>>>    drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
>>>>>>    3 files changed, 55 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>> index 4ccb4be4c9cba..aa8e35a5636a0 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>> @@ -18,6 +18,7 @@
>>>>>>    #include "intel_uc.h"
>>>>>>      #include "i915_drv.h"
>>>>>> +#include "i915_hwmon.h"
>>>>>>      static const struct intel_uc_ops uc_ops_off;
>>>>>>    static const struct intel_uc_ops uc_ops_on;
>>>>>> @@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>>>> 	struct intel_guc *guc = &uc->guc;
>>>>>> 	struct intel_huc *huc = &uc->huc;
>>>>>> 	int ret, attempts;
>>>>>> +	bool pl1en;
>>>>>
>>>>> Init to 'false' here
>>>>
>>>> See next comment.
>>>>
>>>>>
>>>>>
>>>>>> 		GEM_BUG_ON(!intel_uc_supports_guc(uc));
>>>>>> 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>>>>>> @@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>>>> 	else
>>>>>> 		attempts = 1;
>>>>>>    +	/* Disable a potentially low PL1 power limit to allow freq to be
>>>>>> raised */
>>>>>> +	i915_hwmon_power_max_disable(gt->i915, &pl1en);
>>>>>> +
>>>>>> 	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
>>>>>> 		while (attempts--) {
>>>>>> @@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>>>> 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>>>>> 	}
>>>>>>    +	i915_hwmon_power_max_restore(gt->i915, pl1en);
>>>>>> +
>>>>>> 	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
>>>>>> 	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
>>>>>>    @@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>>>> 	/* Return GT back to RPn */
>>>>>> 	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>>>>>    +	i915_hwmon_power_max_restore(gt->i915, pl1en);
>>>>>
>>>>> if (pl1en)
>>>>>
>>>>>      i915_hwmon_power_max_enable().
>>>>
>>>> IMO it's better not to have checks in the main __uc_init_hw() function (if
>>>> we do this we'll need to add 2 checks in __uc_init_hw()). If you really
>>>> want we could do something like this inside
>>>> i915_hwmon_power_max_disable/i915_hwmon_power_max_restore. But for now I
>>>> am not making any changes.
>>>>
>>>> (I can send a patch with the changes if you want to take a look but IMO it
>>>> will add more logic/code but without real benefits (it will save a rmw if
>>>> the limit was already disabled, but IMO this code is called so infrequently
>>>> (only during GuC resets) as to not have any significant impact)).
>>>>
>>>>>
>>>>>> +
>>>>>> 	__uc_sanitize(uc);
>>>>>> 		if (!ret) {
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
>>>>>> index ee63a8fd88fc1..769b5bda4d53f 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_hwmon.c
>>>>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>>>>>> @@ -444,6 +444,45 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>>>>>> 	}
>>>>>>    }
>>>>>>    +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool
>>>>>> *old)
>>>>> Shouldn't we call this i915_hwmon_package_pl1_disable()?
>>>>
>>>> I did think of using "pl1" in the function name but then decided to retain
>>>> "power_max" because other hwmon functions for PL1 limit also use
>>>> "power_max" (hwm_power_max_read/hwm_power_max_write) and currently
>>>> "hwmon_power_max" is mapped to the PL1 limit. So "power_max" is used to
>>>> show that all these functions deal with the PL1 power limit.
>>>>
>>>> There is a comment in __uc_init_hw() explaining "power_max" means the PL1
>>>> power limit.
>>>>
>>>>>> +	__acquires(i915->hwmon->hwmon_lock)
>>>>>> +{
>>>>>> +	struct i915_hwmon *hwmon = i915->hwmon;
>>>>>> +	intel_wakeref_t wakeref;
>>>>>> +	u32 r;
>>>>>> +
>>>>>> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
>>>>>> +		return;
>>>>>> +
>>>>>> +	/* Take mutex to prevent concurrent hwm_power_max_write */
>>>>>> +	mutex_lock(&hwmon->hwmon_lock);
>>>>>> +
>>>>>> +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
>>>>>> +		r = intel_uncore_rmw(hwmon->ddat.uncore,
>>>>>> +				     hwmon->rg.pkg_rapl_limit,
>>>>>> +				     PKG_PWR_LIM_1_EN, 0);
>>>>> Most of this code (lock and rmw parts) is already inside static void
>>>>> hwm_locked_with_pm_intel_uncore_rmw() , can we reuse that here?
>>>>
>>>> This was the case in v1 of the patch:
>>>>
>>>> https://patchwork.freedesktop.org/patch/526393/?series=115003&rev=1
>>>>
>>>> But now this cannot be done because if you notice we acquire the mutex in
>>>> i915_hwmon_power_max_disable() and release the mutex in
>>>> i915_hwmon_power_max_restore().
>>>>
>>>> I explained the reason why this the mutex is handled this way in my reply
>>>> to Jani Nikula here:
>>>>
>>>> https://patchwork.freedesktop.org/patch/526598/?series=115003&rev=2
>>>>
>>>> Quoting below:
>>>>
>>>> ```
>>>>>> +	/* hwmon_lock mutex is unlocked in hwm_power_max_restore */
>>>>>
>>>>> Not too happy about that... any better ideas?
>>>>
>>>> Afais, taking the mutex is the only fully correct solution (when we disable
>>>> the power limit, userspace can go re-enable it). Examples of partly
>>>> incorrect solutions (which don't take the mutex) include:
>>>>
>>>> a. Don't take the mutex, don't do anything, ignore any changes to the value
>>>>     if it has changed during GuC reset/fw load (just overwrite the changed
>>>>     value). Con: changed value is lost.
>>>>
>>>> b. Detect if the value has changed (the limit has been re-enabled) after we
>>>>     have disabled the limit and in that case skip restoring the value. But
>>>>     then someone can say why do we allow enabling the PL1 limit since we
>>>>     want to disable it.
>>>>
>>>> Both these are very unlikely scenarios so they might work. But I would
>>>> first like to explore if holding a mutex across GuC reset is prolebmatic
>>>> since that is /the/ correct solution. But if anyone comes up with a reason
>>>> why that cannot be done we can look at these other not completely correct
>>>> options.
>>>
>>> I see what you are doing and it looks indeed a very safe approach to ensure
>>> the pl1 won't be toggled by other paths while we need some guaranteed state
>>> here, or hw init fails badly.
>>>
>>> But in the end you are making your lock to protect the code from another path
>>> and not protecting the data itself. The data was already protected in the
>>> first version with the lock in the rmw.
>>
>> Sorry I am not really following. Daniel had mentioned this "protecting code
>> vs protecting data" but I am wondering how it is applicable in this
>> case. IMO here the data we are protecting is the register which we don't
>> want written to by userland while GuC load is in progress. To do that we
>> need to block the code path writing to register. So what we have here seems
>> to me to be the simplest and cleanest approach for solving this issue.
> 
> I believe your cases here is exactly what Daniel had mentioned as protecting
> code and not data. Well, in the end we are of course protecting data to be
> modified, but in your case you use that mutex to also protect the code path
> and avoid other calls while you are in this guc_init_path...
> 
> Please Daniel, correct me here if I got it wrong.
> 
> What I don't like here is that we lock from one function and keep that for a
> while and unlock from the other function. To protect the data itself in general
> we just need for a very minimal time while we are modifying the data itself.
> 
>>
>>> maybe we need to have some kind of a state check with other state-lock and
>>> then if we are in this forced state for init path, the request for the normal path
>>> ignores and move one,
>>
>> I don't see how this will *not* be racy...
> 
> maybe something like this?:
> 
> at power_max_disable:
> mutex_lock(data_lock);
> 
> mutex_lock(state_lock);
> state = in_use;
> mutex_unlock(state_lock);
> 
> mmio_rmw();
> mutex_unlock(data_lock);
> 
> 
> at power_max_restoration:
> 
> at power_max_disable:
> mutex_lock(data_lock);
> 
> mutex_lock(state_lock);
> state = available;
> mutex_unlock(state_lock);
> 
> mmio_rmw();
> mutex_unlock(data_lock);
> 
> at sysfs fn:
> 
> mutex_lock(data_lock);
> mutex_lock(state_lock);
> if (state == in_use) {
>     ret = -EAGAIN
>     goto out;
> }
> mutex_unlock(state_lock);
> 
> ....
> 
> out:
> 
> mutex_unlock(data_lock);

I agree holding the mutex across functions to cover the GuC init path is 
not the nicest pattern. Above looks a plausible improvement, although I 
don't know if EAGAIN is correct for hwmon, or if blocking is. Is 
something expected to be configuring those fields during boot and can it 
even handle EAGAIN?

One advantage of the solution from this patch I can see though is that I 
think it eliminates data races (restoring the stale value) with fw 
reload triggered by a potential full GPU reset happening in parallel to 
sysfs writes.

Another thing to check would be if the inversions between 
hwmon_lock->rpm_get and rpm_get->hwmon_lock are okay.

In fact, I am not sure rpm_get in this patch is needed? Seems to be 
running under paths which guarantee holding it already, if I am not 
missing something. If not needed then there is obviously no inversion in 
any way.

Regards,

Tvrtko

P.S.
Do some of the exiting mutex_lock need actually be 
mutex_lock_interruptible so sysfs reads/write can Ctrl-C, in theory at 
least.


>>> or maybe we queue some request...
>>
>> Queuing a request will not be enough (even if this is possible), the
>> request will need to wait to complete till GuC load completes. So we'll
>> have to complete the request when GuC load completes, similar to releasing
>> the mutex in the current patch. Looks like a much more complicated way of
>> doing what the mutex does very simply.
> 
> The wq would sleep/delay while state == in_use, then process the next request...
> 
>>
>> So:
>>
>> a. What is the real problem with the current implementation?
> 
> probably the big lock used to protect the state machinery...
> 
> but if other folks believe that we don't have an actual problem here
> and this big lock is acceptable as long as it has the annotation for
> the static analyzers, I'm okay to just let it go...
> 
> 
>>
>> b. What would be the correct solution for it? That is how, specifically,
>>     should we implement it?
> 
> state handling with separated lock from the data itself is my suggestion.
> 
>>
>> Some more guidance will be helpful if you think this patch has issues.
> 
> I hope Daniel and/or other i915 maintainers can jump here. Specially if
> I'm being to paranoid and the current patch is enough...
> 
>>
>> Thanks.
>> --
>> Ashutosh
>>
>>>> ```
>>>>
>>>>>> +
>>>>>> +	*old = !!(r & PKG_PWR_LIM_1_EN);
>>>>>> +}
>>>>>> +
>>>>>> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
>>>>>> +	__releases(i915->hwmon->hwmon_lock)
>>>>> We can just call this i915_hwmon_power_max_enable() and call whenever the
>>>>> old value was actually enabled. That way, we have proper mirror functions.
>>>>
>>>> As I explained that would mean adding two checks in the main __uc_init_hw()
>>>> function which I am trying to avoid. So we have disable/restore pair.
>>>>
>>>>>> +{
>>>>>> +	struct i915_hwmon *hwmon = i915->hwmon;
>>>>>> +	intel_wakeref_t wakeref;
>>>>>> +
>>>>>> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
>>>>>> +		return;
>>>>>> +
>>>>>> +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
>>>>>> +		intel_uncore_rmw(hwmon->ddat.uncore,
>>>>>> +				 hwmon->rg.pkg_rapl_limit,
>>>>>> +				 PKG_PWR_LIM_1_EN,
>>>>>> +				 old ? PKG_PWR_LIM_1_EN : 0);
>>>>>
>>>>> 3rd param should be 0 here, else we will end up clearing other bits.
>>>>
>>>> No see intel_uncore_rmw(), it will only clear the PKG_PWR_LIM_1_EN bit, so
>>>> the code here is correct. intel_uncore_rmw() does:
>>>>
>>>>          val = (old & ~clear) | set;
>>>>
>>>> So for now I am not making any changes, if you feel strongly about
>>>> something one way or another let me know. Anyway these comments should help
>>>> you understand the patch better so take a look and we can go from there.
>>>>
>>>> Thanks.
>>>> --
>>>> Ashutosh
>>>>
>>>>>> +
>>>>>> +	mutex_unlock(&hwmon->hwmon_lock);
>>>>>> +}
>>>>>> +
>>>>>>    static umode_t
>>>>>>    hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>>>>>>    {
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
>>>>>> index 7ca9cf2c34c96..0fcb7de844061 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_hwmon.h
>>>>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
>>>>>> @@ -7,14 +7,21 @@
>>>>>>    #ifndef __I915_HWMON_H__
>>>>>>    #define __I915_HWMON_H__
>>>>>>    +#include <linux/types.h>
>>>>>> +
>>>>>>    struct drm_i915_private;
>>>>>> +struct intel_gt;
>>>>>>      #if IS_REACHABLE(CONFIG_HWMON)
>>>>>>    void i915_hwmon_register(struct drm_i915_private *i915);
>>>>>>    void i915_hwmon_unregister(struct drm_i915_private *i915);
>>>>>> +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
>>>>>> +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
>>>>>>    #else
>>>>>>    static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>>>>>>    static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
>>>>>> +static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
>>>>>> +static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
>>>>>>    #endif
>>>>>>      #endif /* __I915_HWMON_H__ */
