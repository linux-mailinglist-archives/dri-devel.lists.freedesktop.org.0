Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC8527F15
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2F210F833;
	Mon, 16 May 2022 08:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87D410F833;
 Mon, 16 May 2022 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652688058; x=1684224058;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aCem5Y6rAUvXmJSX7iIEr8KbYNvsE0Wf27Yzce+omu4=;
 b=Q7Oyxnw4h8zFRpfMBFJDFYnYEEMNb9EFuy8lO2f00UkABJ8s9icuHKr3
 55fx0kgeN8NlzSuJl8dN+Vx0r2CzvUNs2aoBa+oDq23iCgupd+fyrBOQr
 4ZiCgXRBMKsBZH63NIv2yGzNnjyyUtnbNr+Wo3F4FicGLUIw/yLUSfGaq
 aQ+/NmaKpypLxPlYX57z/fSEadm8fde+l2z/znu3lcjATVz1yALDm7kSa
 lJ4JJm1WiyL0OagizetKkttJ7sJ2bY3eJeG7zZCRUUlL9a3rRy0evgUsN
 s9tZE/R8q7WOdGQ5BsLsk+350mdRL7PGtwoE4IEX34OSDlCGRG4EdGa8x A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="269586926"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="269586926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:00:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596406738"
Received: from jrozansk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.130.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:00:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
In-Reply-To: <874k1pj4bi.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <874k1pj4bi.fsf@intel.com>
Date: Mon, 16 May 2022 11:00:52 +0300
Message-ID: <871qwtj497.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 May 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Sat, 14 May 2022, Vinay Belgaumkar <vinay.belgaumkar@intel.com> wrote:
>> SLPC min/max frequency updates require H2G calls. We are seeing
>> timeouts when GuC channel is backed up and it is unable to respond
>> in a timely fashion causing warnings and affecting CI.
>>
>> This is seen when waitboosting happens during a stress test.
>> this patch updates the waitboost path to use a non-blocking
>> H2G call instead, which returns as soon as the message is
>> successfully transmitted.
>>
>> v2: Use drm_notice to report any errors that might occur while
>> sending the waitboost H2G request (Tvrtko)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
>>  1 file changed, 36 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 1db833da42df..e5e869c96262 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>  	return data->header.global_state;
>>  }
>>  
>> +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
>> +{
>> +	u32 request[] = {
>
> static const

*sigh*

-ENOCOFFEE, please ignore the mail.

BR,
Jani.


>
>> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +		id,
>> +		value,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_set_param_nb(guc, id, value);
>> +}
>> +
>>  static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>  {
>>  	u32 request[] = {
>
> Ditto here, and the whole gt/uc directory seems to have tons of these
> u32 action/request array variables on stack, with the required
> initialization, that could be in rodata.
>
> Please fix all of them.
>
> BR,
> Jani.
>
>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>  	 */
>>  
>>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> -		ret = slpc_set_param(slpc,
>> -				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -				     freq);
>> -		if (ret)
>> -			i915_probe_error(i915, "Unable to force min freq to %u: %d",
>> -					 freq, ret);
>> +		/* Non-blocking request will avoid stalls */
>> +		ret = slpc_set_param_nb(slpc,
>> +					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +					freq);
>>  	}
>>  
>>  	return ret;
>> @@ -222,6 +244,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>  static void slpc_boost_work(struct work_struct *work)
>>  {
>>  	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	int err;
>>  
>>  	/*
>>  	 * Raise min freq to boost. It's possible that
>> @@ -231,8 +255,12 @@ static void slpc_boost_work(struct work_struct *work)
>>  	 */
>>  	mutex_lock(&slpc->lock);
>>  	if (atomic_read(&slpc->num_waiters)) {
>> -		slpc_force_min_freq(slpc, slpc->boost_freq);
>> -		slpc->num_boosts++;
>> +		err = slpc_force_min_freq(slpc, slpc->boost_freq);
>> +		if (!err)
>> +			slpc->num_boosts++;
>> +		else
>> +			drm_notice(&i915->drm, "Failed to send waitboost request (%d)\n",
>> +				   err);
>>  	}
>>  	mutex_unlock(&slpc->lock);
>>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
