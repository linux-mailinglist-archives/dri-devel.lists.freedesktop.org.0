Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C451BEF5
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5170010FD93;
	Thu,  5 May 2022 12:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7500E10FD93;
 Thu,  5 May 2022 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651752785; x=1683288785;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IcVNuSM0HtFS1IeizY68qLnpo68xvwjuLdweqiApt2M=;
 b=QzyUdcTtTSRhAbJRMujTENM/u+a5Q7suSf64ZYVbb3er3eNMGe+gZadJ
 ZtUhvSst2dWr1v7fAniZq7jl/d620W3X0DeY4Pgusj45MLMQAg26QzCt3
 yoywLUFH/wxFO/s6yr8ZjKCI2+g0s8xs9DVU9dqboY8E35ieANrCqLtDu
 xcrv9FOW4YaYX2SGWc5cDp35F1hxEPjq50oUs9HOmvBhgtZVSQuQ9THp9
 5iuj5k0QO9q6wN3CEhmbvJah1ro0jkf6vKmlFmuerU45nfmAmV8gkSU9u
 A73ZAbM8aC+6UrBKUaDq+l0HUFxM6Gfhk1EJiQD4pTgiqvqxwNj2cfEjR Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="265684929"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="265684929"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 05:13:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="517482123"
Received: from mrbroom-mobl.ger.corp.intel.com (HELO [10.213.206.41])
 ([10.213.206.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 05:13:03 -0700
Message-ID: <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
Date: Thu, 5 May 2022 13:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/05/2022 06:40, Vinay Belgaumkar wrote:
> SLPC min/max frequency updates require H2G calls. We are seeing
> timeouts when GuC channel is backed up and it is unable to respond
> in a timely fashion causing warnings and affecting CI.

Is it the "Unable to force min freq" error? Do you have a link to the 
GitLab issue to add to commit message?

> This is seen when waitboosting happens during a stress test.
> this patch updates the waitboost path to use a non-blocking
> H2G call instead, which returns as soon as the message is
> successfully transmitted.

AFAIU with this approach, when CT channel is congested, you instead 
achieve silent dropping of the waitboost request, right?

It sounds like a potentially important feedback from the field to lose 
so easily. How about you added drm_notice to the worker when it fails?

Or simply a "one line patch" to replace i915_probe_error (!?) with 
drm_notice and keep the blocking behavior. (I have no idea what is the 
typical time to drain the CT buffer, and so to decide whether waiting or 
dropping makes more sense for effectiveness of waitboosting.)

Or since the congestion /should not/ happen in production, then the 
argument is why complicate with more code, in which case going with one 
line patch is an easy way forward?

Regards,

Tvrtko

> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 ++++++++++++++++-----
>   1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 1db833da42df..c852f73cf521 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>   	return data->header.global_state;
>   }
>   
> +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
> +{
> +	u32 request[] = {
> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
> +		id,
> +		value,
> +	};
> +	int ret;
> +
> +	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +
> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
> +
> +	return guc_action_slpc_set_param_nb(guc, id, value);
> +}
> +
>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>   {
>   	u32 request[] = {
> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>   	 */
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> -		ret = slpc_set_param(slpc,
> -				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> -				     freq);
> -		if (ret)
> -			i915_probe_error(i915, "Unable to force min freq to %u: %d",
> -					 freq, ret);
> +		/* Non-blocking request will avoid stalls */
> +		ret = slpc_set_param_nb(slpc,
> +					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +					freq);
>   	}
>   
>   	return ret;
> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct *work)
>   	 */
>   	mutex_lock(&slpc->lock);
>   	if (atomic_read(&slpc->num_waiters)) {
> -		slpc_force_min_freq(slpc, slpc->boost_freq);
> -		slpc->num_boosts++;
> +		if (!slpc_force_min_freq(slpc, slpc->boost_freq))
> +			slpc->num_boosts++;
>   	}
>   	mutex_unlock(&slpc->lock);
>   }
