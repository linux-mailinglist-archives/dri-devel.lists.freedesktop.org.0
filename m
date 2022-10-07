Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BF25F7571
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 10:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C01910E43B;
	Fri,  7 Oct 2022 08:44:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805C10E43B;
 Fri,  7 Oct 2022 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665132283; x=1696668283;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N5Lr0+uqWlNLpaeGrrTRE4bTIN4yc5OuiyjFRP7fERM=;
 b=S+kSUB5h/CUUYnFxw6N7xCHQuMRhkUIaw9NCzXWtQkirscHGHabY8vRV
 db5acvllpWMWn1Nu7JV0OvFpf5Xg7LeHHmjEAwH64BGZ4/HB+Qs6FErV8
 oneCEP7NDjsvGlADGBgHjJTMpAgUsVnnQOgAj9Oh/vCMNx06qxWakb9uv
 XRh+FffqRZ3D+QQ0KjcBQo8Q8/L1V6uQ2IifCli2sEr4dRnQiOp+cUYnr
 tU/QaCWUNb0jH3WyBupdHxWSx3MFIV0IG41q+X9yhMJAbawqYsQOs3WA6
 jnxV4upT8D13R4l4bqEQnotOgBtBu9a2qOTTi6wPDNCYQTJNoOt1XGuHx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="389979242"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="389979242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 01:44:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767507660"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="767507660"
Received: from agrennax-mobl1.ger.corp.intel.com (HELO [10.213.197.230])
 ([10.213.197.230])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 01:44:42 -0700
Message-ID: <c40f26ac-05e4-cb8d-8cd6-3354d8ce56bf@linux.intel.com>
Date: Fri, 7 Oct 2022 09:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v5 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
 <20221006213813.1563435-4-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221006213813.1563435-4-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/10/2022 22:38, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Compute workloads are inherently not pre-emptible for long periods on
> current hardware. As a workaround for this, the pre-emption timeout
> for compute capable engines was disabled. This is undesirable with GuC
> submission as it prevents per engine reset of hung contexts. Hence the
> next patch will re-enable the timeout but bumped up by an order of
> magnitude.
> 
> However, the heartbeat might not respect that. Depending upon current
> activity, a pre-emption to the heartbeat pulse might not even be
> attempted until the last heartbeat period. Which means that only one
> period is granted for the pre-emption to occur. With the aforesaid
> bump, the pre-emption timeout could be significantly larger than this
> heartbeat period.
> 
> So adjust the heartbeat code to take the pre-emption timeout into
> account. When it reaches the final (high priority) period, it now
> ensures the delay before hitting reset is bigger than the pre-emption
> timeout.
> 
> v2: Fix for selftests which adjust the heartbeat period manually.
> v3: Add FIXME comment about selftests. Add extra FIXME comment and
> drm_notices when setting heartbeat to a non-default value (review
> feedback from Tvrtko)
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index a3698f611f457..9a527e1f5be65 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -22,9 +22,37 @@
>   
>   static bool next_heartbeat(struct intel_engine_cs *engine)
>   {
> +	struct i915_request *rq;
>   	long delay;
>   
>   	delay = READ_ONCE(engine->props.heartbeat_interval_ms);
> +
> +	rq = engine->heartbeat.systole;
> +
> +	/*
> +	 * FIXME: The final period extension is disabled if the period has been
> +	 * modified from the default. This is to prevent issues with certain
> +	 * selftests which override the value and expect specific behaviour.
> +	 * Once the selftests have been updated to either cope with variable
> +	 * heartbeat periods (or to override the pre-emption timeout as well,
> +	 * or just to add a selftest specific override of the extension), the
> +	 * generic override can be removed.
> +	 */
> +	if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
> +	    delay == engine->defaults.heartbeat_interval_ms) {
> +		long longer;
> +
> +		/*
> +		 * The final try is at the highest priority possible. Up until now
> +		 * a pre-emption might not even have been attempted. So make sure
> +		 * this last attempt allows enough time for a pre-emption to occur.
> +		 */
> +		longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
> +		longer = intel_clamp_heartbeat_interval_ms(engine, longer);
> +		if (longer > delay)
> +			delay = longer;
> +	}
> +
>   	if (!delay)
>   		return false;
>   
> @@ -288,6 +316,17 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
>   	if (!delay && !intel_engine_has_preempt_reset(engine))
>   		return -ENODEV;
>   
> +	/* FIXME: Remove together with equally marked hack in next_heartbeat. */
> +	if (delay != engine->defaults.heartbeat_interval_ms &&
> +	    delay < 2 * engine->props.preempt_timeout_ms) {
> +		if (intel_engine_uses_guc(engine))
> +			drm_notice(&engine->i915->drm, "%s heartbeat interval adjusted to a non-default value which may downgrade individual engine resets to full GPU resets!\n",
> +				   engine->name);
> +		else
> +			drm_notice(&engine->i915->drm, "%s heartbeat interval adjusted to a non-default value which may cause engine resets to target innocent contexts!\n",
> +				   engine->name);
> +	}
> +
>   	intel_engine_pm_get(engine);
>   
>   	err = mutex_lock_interruptible(&ce->timeline->mutex);

LGTM - hope it is agreeable to you too.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

