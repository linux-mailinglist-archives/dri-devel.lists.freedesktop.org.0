Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8D70C182
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941210E34D;
	Mon, 22 May 2023 14:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E782510E346;
 Mon, 22 May 2023 14:52:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 378856100A;
 Mon, 22 May 2023 14:52:59 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id A6E3AC433EF;
 Mon, 22 May 2023 14:52:56 +0000 (UTC)
Date: Mon, 22 May 2023 10:52:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915: Add helpers for managing rps thresholds
Message-ID: <ZGuBxuQSBWE6lEY9@rdvivi-mobl4>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
 <20230522115928.588793-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522115928.588793-3-tvrtko.ursulin@linux.intel.com>
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

On Mon, May 22, 2023 at 12:59:27PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In preparation for exposing via sysfs add helpers for managing rps
> thresholds.
> 
> v2:
>  * Force sw and hw re-programming on threshold change.

it makes sense now.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 54 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.h |  4 +++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 333abc8f7ecb..afde601a6111 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -16,7 +16,9 @@
>  #include "intel_gt.h"
>  #include "intel_gt_clock_utils.h"
>  #include "intel_gt_irq.h"
> +#include "intel_gt_pm.h"
>  #include "intel_gt_pm_irq.h"
> +#include "intel_gt_print.h"
>  #include "intel_gt_regs.h"
>  #include "intel_mchbar_regs.h"
>  #include "intel_pcode.h"
> @@ -2574,6 +2576,58 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
>  		return set_min_freq(rps, val);
>  }
>  
> +u8 intel_rps_get_up_threshold(struct intel_rps *rps)
> +{
> +	return rps->power.up_threshold;
> +}
> +
> +static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
> +{
> +	int ret;
> +
> +	if (val > 100)
> +		return -EINVAL;
> +
> +	ret = mutex_lock_interruptible(&rps->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (*threshold == val)
> +		goto out_unlock;
> +
> +	*threshold = val;
> +
> +	/* Force reset. */
> +	rps->last_freq = -1;
> +	mutex_lock(&rps->power.mutex);
> +	rps->power.mode = -1;
> +	mutex_unlock(&rps->power.mutex);
> +
> +	intel_rps_set(rps, clamp(rps->cur_freq,
> +				 rps->min_freq_softlimit,
> +				 rps->max_freq_softlimit));
> +
> +out_unlock:
> +	mutex_unlock(&rps->lock);
> +
> +	return ret;
> +}
> +
> +int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold)
> +{
> +	return rps_set_threshold(rps, &rps->power.up_threshold, threshold);
> +}
> +
> +u8 intel_rps_get_down_threshold(struct intel_rps *rps)
> +{
> +	return rps->power.down_threshold;
> +}
> +
> +int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold)
> +{
> +	return rps_set_threshold(rps, &rps->power.down_threshold, threshold);
> +}
> +
>  static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
>  {
>  	struct intel_uncore *uncore = rps_to_uncore(rps);
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index a3fa987aa91f..92fb01f5a452 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -37,6 +37,10 @@ void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
>  
>  int intel_gpu_freq(struct intel_rps *rps, int val);
>  int intel_freq_opcode(struct intel_rps *rps, int val);
> +u8 intel_rps_get_up_threshold(struct intel_rps *rps);
> +int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold);
> +u8 intel_rps_get_down_threshold(struct intel_rps *rps);
> +int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold);
>  u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
>  u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
>  u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
> -- 
> 2.39.2
> 
