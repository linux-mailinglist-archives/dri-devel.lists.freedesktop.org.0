Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3670A11F
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 22:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512C10E586;
	Fri, 19 May 2023 20:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03210E584;
 Fri, 19 May 2023 20:56:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B1AB657D2;
 Fri, 19 May 2023 20:56:48 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 4B329C433D2;
 Fri, 19 May 2023 20:56:46 +0000 (UTC)
Date: Fri, 19 May 2023 16:56:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 3/4] drm/i915: Add helpers for managing rps
 thresholds
Message-ID: <ZGfijE0jawJnUg1s@rdvivi-mobl4>
References: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
 <20230428081457.857009-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428081457.857009-4-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 09:14:56AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In preparation for exposing via sysfs add helpers for managing rps
> thresholds.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 36 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.h |  4 ++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index a39eee444849..a5a7315f5ace 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2573,6 +2573,42 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
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
> +	*threshold = val;
> +	mutex_unlock(&rps->lock);
> +
> +	return 0;
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

Isn't this breaking compilation with the unused functions?

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
> 2.37.2
> 
