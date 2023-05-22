Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374270C17B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78A610E347;
	Mon, 22 May 2023 14:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8470C10E346;
 Mon, 22 May 2023 14:52:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5AC66100A;
 Mon, 22 May 2023 14:52:12 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 777CAC433EF;
 Mon, 22 May 2023 14:52:10 +0000 (UTC)
Date: Mon, 22 May 2023 10:52:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915: Move setting of rps thresholds to init
Message-ID: <ZGuBl3YcAOAU3NCg@rdvivi-mobl4>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 12:59:25PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Since 36d516be867c ("drm/i915/gt: Switch to manual evaluation of RPS")
> thresholds are invariant so lets move their setting to init time.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index e68a99205599..791097eb9bfd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -671,7 +671,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
>  {
>  	struct intel_gt *gt = rps_to_gt(rps);
>  	struct intel_uncore *uncore = gt->uncore;
> -	u32 threshold_up = 0, threshold_down = 0; /* in % */
>  	u32 ei_up = 0, ei_down = 0;
>  
>  	lockdep_assert_held(&rps->power.mutex);
> @@ -679,9 +678,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
>  	if (new_power == rps->power.mode)
>  		return;
>  
> -	threshold_up = 95;
> -	threshold_down = 85;
> -
>  	/* Note the units here are not exactly 1us, but 1280ns. */
>  	switch (new_power) {
>  	case LOW_POWER:
> @@ -708,17 +704,22 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
>  
>  	GT_TRACE(gt,
>  		 "changing power mode [%d], up %d%% @ %dus, down %d%% @ %dus\n",
> -		 new_power, threshold_up, ei_up, threshold_down, ei_down);
> +		 new_power,
> +		 rps->power.up_threshold, ei_up,
> +		 rps->power.down_threshold, ei_down);
>  
>  	set(uncore, GEN6_RP_UP_EI,
>  	    intel_gt_ns_to_pm_interval(gt, ei_up * 1000));
>  	set(uncore, GEN6_RP_UP_THRESHOLD,
> -	    intel_gt_ns_to_pm_interval(gt, ei_up * threshold_up * 10));
> +	    intel_gt_ns_to_pm_interval(gt,
> +				       ei_up * rps->power.up_threshold * 10));
>  
>  	set(uncore, GEN6_RP_DOWN_EI,
>  	    intel_gt_ns_to_pm_interval(gt, ei_down * 1000));
>  	set(uncore, GEN6_RP_DOWN_THRESHOLD,
> -	    intel_gt_ns_to_pm_interval(gt, ei_down * threshold_down * 10));
> +	    intel_gt_ns_to_pm_interval(gt,
> +				       ei_down *
> +				       rps->power.down_threshold * 10));
>  
>  	set(uncore, GEN6_RP_CONTROL,
>  	    (GRAPHICS_VER(gt->i915) > 9 ? 0 : GEN6_RP_MEDIA_TURBO) |
> @@ -730,8 +731,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
>  
>  skip_hw_write:
>  	rps->power.mode = new_power;
> -	rps->power.up_threshold = threshold_up;
> -	rps->power.down_threshold = threshold_down;
>  }
>  
>  static void gen6_rps_set_thresholds(struct intel_rps *rps, u8 val)
> @@ -1557,10 +1556,12 @@ void intel_rps_enable(struct intel_rps *rps)
>  		return;
>  
>  	GT_TRACE(rps_to_gt(rps),
> -		 "min:%x, max:%x, freq:[%d, %d]\n",
> +		 "min:%x, max:%x, freq:[%d, %d], thresholds:[%u, %u]\n",
>  		 rps->min_freq, rps->max_freq,
>  		 intel_gpu_freq(rps, rps->min_freq),
> -		 intel_gpu_freq(rps, rps->max_freq));
> +		 intel_gpu_freq(rps, rps->max_freq),
> +		 rps->power.up_threshold,
> +		 rps->power.down_threshold);
>  
>  	GEM_BUG_ON(rps->max_freq < rps->min_freq);
>  	GEM_BUG_ON(rps->idle_freq > rps->max_freq);
> @@ -2013,6 +2014,10 @@ void intel_rps_init(struct intel_rps *rps)
>  		}
>  	}
>  
> +	/* Set default thresholds in % */
> +	rps->power.up_threshold = 95;
> +	rps->power.down_threshold = 85;
> +
>  	/* Finally allow us to boost to max by default */
>  	rps->boost_freq = rps->max_freq;
>  	rps->idle_freq = rps->min_freq;
> -- 
> 2.39.2
> 
