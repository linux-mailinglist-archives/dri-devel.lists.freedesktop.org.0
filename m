Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDAE527F04
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 09:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A6210EA33;
	Mon, 16 May 2022 07:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D9010F114;
 Mon, 16 May 2022 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652687976; x=1684223976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=h5m6ZP+3YRXuwiL9FyNSQtRfp3h6KHcdxkqr30k1koM=;
 b=cT72fATXEBvdtr5MOYBtKXw1LOUKhJqOBRQM/8GdYKeOGGm4zf9PTOL0
 2JrFfmOU69MAFLaf/1vb8TtxOENcHJsxIXWeEuRdM1CsgRY2IuD6/Lx5R
 5HsUYHZ721HoIrOYyCRAv+cq+/TohUCIOVlalE4KwbnLG1IE4oey4sNz8
 RuCorsbl3YBasLEG5H4V0AMhN1unjKERxAqr8lodT7GM+NkUStX2FKXzA
 CzHhWABwRTTagCMQhUCB6vZBpsEZBuvtvbOtNRJqiwiMxMyXyLJYbUUUD
 OcFo3JThsdCAJTjaaTDCOHe7KyRA4z7PxydJsYyICsfwNVY15d/d+hrzA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="296021598"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="296021598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 00:59:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596405969"
Received: from jrozansk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.130.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 00:59:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
In-Reply-To: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
Date: Mon, 16 May 2022 10:59:29 +0300
Message-ID: <874k1pj4bi.fsf@intel.com>
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

On Sat, 14 May 2022, Vinay Belgaumkar <vinay.belgaumkar@intel.com> wrote:
> SLPC min/max frequency updates require H2G calls. We are seeing
> timeouts when GuC channel is backed up and it is unable to respond
> in a timely fashion causing warnings and affecting CI.
>
> This is seen when waitboosting happens during a stress test.
> this patch updates the waitboost path to use a non-blocking
> H2G call instead, which returns as soon as the message is
> successfully transmitted.
>
> v2: Use drm_notice to report any errors that might occur while
> sending the waitboost H2G request (Tvrtko)
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
>  1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 1db833da42df..e5e869c96262 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>  	return data->header.global_state;
>  }
>  
> +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
> +{
> +	u32 request[] = {

static const

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
>  static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>  {
>  	u32 request[] = {

Ditto here, and the whole gt/uc directory seems to have tons of these
u32 action/request array variables on stack, with the required
initialization, that could be in rodata.

Please fix all of them.

BR,
Jani.

> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>  	 */
>  
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
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
>  	}
>  
>  	return ret;
> @@ -222,6 +244,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>  static void slpc_boost_work(struct work_struct *work)
>  {
>  	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	int err;
>  
>  	/*
>  	 * Raise min freq to boost. It's possible that
> @@ -231,8 +255,12 @@ static void slpc_boost_work(struct work_struct *work)
>  	 */
>  	mutex_lock(&slpc->lock);
>  	if (atomic_read(&slpc->num_waiters)) {
> -		slpc_force_min_freq(slpc, slpc->boost_freq);
> -		slpc->num_boosts++;
> +		err = slpc_force_min_freq(slpc, slpc->boost_freq);
> +		if (!err)
> +			slpc->num_boosts++;
> +		else
> +			drm_notice(&i915->drm, "Failed to send waitboost request (%d)\n",
> +				   err);
>  	}
>  	mutex_unlock(&slpc->lock);
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
