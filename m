Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FF3511F9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 11:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5996EC7F;
	Thu,  1 Apr 2021 09:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117A6E3AA;
 Thu,  1 Apr 2021 09:25:44 +0000 (UTC)
IronPort-SDR: nc7gzgDgaE3oJ1xQdVVrTvomoB47kNm6QxdtD3cB0+K7wVpzTsZrFjiO3UDMB8YFkWJsmDhuT7
 8JIf4CN1qDHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="179735902"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="179735902"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:25:43 -0700
IronPort-SDR: rKOci5kcALQY+8rFb4D8ZydtHeBIf62uHmMHKyuZSqI7LwOb9CYZYpi3CDbN7hzoHxAtpeTh8z
 NDkUb4QcEqRw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="610849035"
Received: from chinchil-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.231.48])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:25:41 -0700
Date: Thu, 1 Apr 2021 05:25:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Do not report 100% RC6 if not
 supported
Message-ID: <YGWRk7CkotrB4XMG@intel.com>
References: <20210330150637.2547762-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330150637.2547762-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org,
 Eero T Tamminen <eero.t.tamminen@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 04:06:37PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> We use GT parked status to estimate RC6 while not in use, however if RC6
> is not supported to start with that does not work very well and produces a
> false 100% RC6 readout.

oh! I had missed this one...

> 
> Fix by not advancing the estimated RC6 counter when feature is not
> supported.

either this or the other proposal, consider both as

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I prefer this, but I don't have strong opinions on which one.
you (or Eero) pick one...

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 1fe699e30113 ("drm/i915/pmu: Fix sleep under atomic in RC6 readout")
> Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 41651ac255fa..02fe0d22c470 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -191,7 +191,10 @@ static u64 get_rc6(struct intel_gt *gt)
>  		 * on top of the last known real value, as the approximated RC6
>  		 * counter value.
>  		 */
> -		val = ktime_since_raw(pmu->sleep_last);
> +		if (gt->rc6.supported)
> +			val = ktime_since_raw(pmu->sleep_last);
> +		else
> +			val = 0;
>  		val += pmu->sample[__I915_SAMPLE_RC6].cur;
>  	}
>  
> -- 
> 2.27.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
