Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD994594E4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 19:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E4D89CB5;
	Mon, 22 Nov 2021 18:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA1689CB5;
 Mon, 22 Nov 2021 18:44:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="295661008"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="295661008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 10:44:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="509076929"
Received: from calebjia-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.255.37.192])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 10:44:03 -0800
Date: Mon, 22 Nov 2021 13:44:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/gt: Improve "race-to-idle" at low frequencies
Message-ID: <YZvk8HDtluq0i5e5@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
 <20211117224955.28999-4-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117224955.28999-4-vinay.belgaumkar@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 02:49:55PM -0800, Vinay Belgaumkar wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> While the power consumption is proportional to the frequency, there is
> also a static draw for active gates. The longer we are able to powergate
> (rc6), the lower the static draw. Thus there is a sweetspot in the
> frequency/power curve where we run at higher frequency in order to sleep
> longer, aka race-to-idle. This is more evident at lower frequencies, so
> let's look to bump the frequency if we think we will benefit by sleeping
> longer at the higher frequency and so conserving power.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Please let's not increase the complexity here, unless we have a very good
and documented reason.

Before trying to implement anything smart like this in the driver I'd like
to see data, power and performance results in different platforms and with
different workloads.

Thanks,
Rodrigo.

> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 31 ++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 3675ac93ded0..6af3231982af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -63,6 +63,22 @@ static void set(struct intel_uncore *uncore, i915_reg_t reg, u32 val)
>  	intel_uncore_write_fw(uncore, reg, val);
>  }
>  
> +static bool race_to_idle(struct intel_rps *rps, u64 busy, u64 dt)
> +{
> +	unsigned int this = rps->cur_freq;
> +	unsigned int next = rps->cur_freq + 1;
> +	u64 next_dt = next * max(busy, dt);
> +
> +	/*
> +	 * Compare estimated time spent in rc6 at the next power bin. If
> +	 * we expect to sleep longer than the estimated increased power
> +	 * cost of running at a higher frequency, it will be reduced power
> +	 * consumption overall.
> +	 */
> +	return (((next_dt - this * busy) >> 10) * this * this >
> +		((next_dt - next * busy) >> 10) * next * next);
> +}
> +
>  static void rps_timer(struct timer_list *t)
>  {
>  	struct intel_rps *rps = from_timer(rps, t, timer);
> @@ -133,7 +149,7 @@ static void rps_timer(struct timer_list *t)
>  			if (!max_busy[i])
>  				break;
>  
> -			busy += div_u64(max_busy[i], 1 << i);
> +			busy += max_busy[i] >> i;
>  		}
>  		GT_TRACE(rps_to_gt(rps),
>  			 "busy:%lld [%d%%], max:[%lld, %lld, %lld], interval:%d\n",
> @@ -141,13 +157,18 @@ static void rps_timer(struct timer_list *t)
>  			 max_busy[0], max_busy[1], max_busy[2],
>  			 rps->pm_interval);
>  
> -		if (100 * busy > rps->power.up_threshold * dt &&
> -		    rps->cur_freq < rps->max_freq_softlimit) {
> +		if (rps->cur_freq < rps->max_freq_softlimit &&
> +		    race_to_idle(rps, max_busy[0], dt)) {
> +			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
> +			rps->pm_interval = 1;
> +			schedule_work(&rps->work);
> +		} else if (rps->cur_freq < rps->max_freq_softlimit &&
> +			   100 * busy > rps->power.up_threshold * dt) {
>  			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
>  			rps->pm_interval = 1;
>  			schedule_work(&rps->work);
> -		} else if (100 * busy < rps->power.down_threshold * dt &&
> -			   rps->cur_freq > rps->min_freq_softlimit) {
> +		} else if (rps->cur_freq > rps->min_freq_softlimit &&
> +			   100 * busy < rps->power.down_threshold * dt) {
>  			rps->pm_iir |= GEN6_PM_RP_DOWN_THRESHOLD;
>  			rps->pm_interval = 1;
>  			schedule_work(&rps->work);
> -- 
> 2.34.0
> 
