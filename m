Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD270CE80
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 01:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C44B10E2C6;
	Mon, 22 May 2023 23:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434710E01F;
 Mon, 22 May 2023 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684796973; x=1716332973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qZCdktHDDIwiTfpHPE9b633UhQZsnR3JFJ4ddi91wOo=;
 b=BPcPrUdWKXrVst7dtpjPmmUZcbx2RtImjBG7pEwmlJSMP5W9+aEsCRR+
 52JqwM+q9N0idGtE1LcMi4o9vsDFphodb76bZUsn38/PYG8vhh/pPsHwp
 PB30KBMoY5eMnsP308vUwYeT/WJO/vaa44Tn7F8wX3XSe9tOdbfe87qxE
 VJj/2mL1iykB1K5LNSuUPFZFQNv0elijJGm/vlViLlcLrJJaXEDc6/m2X
 i5wdEB/VwXm8FpSxHNelY5npwDsUUyTGn/ffkd9gkGdFraLM9+61i3NJ/
 XmGlqv4m8J3ykPUjmGbyhf5QVeTCRFTi6rsaUDVFpDYp7KeCDaiOAh/iR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="350578153"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="350578153"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 16:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697792934"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="697792934"
Received: from baumgarp-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.129])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 16:09:30 -0700
Date: Tue, 23 May 2023 01:09:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Add helpers for managing rps
 thresholds
Message-ID: <ZGv2J0t5XtMnYaXt@ashyti-mobl2.lan>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, May 22, 2023 at 12:59:27PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In preparation for exposing via sysfs add helpers for managing rps
> thresholds.
> 
> v2:
>  * Force sw and hw re-programming on threshold change.
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

why are you resetting here?

Andi
