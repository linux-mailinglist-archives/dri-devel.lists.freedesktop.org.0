Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47CC3551DC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 13:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3E86E823;
	Tue,  6 Apr 2021 11:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A756E823;
 Tue,  6 Apr 2021 11:20:04 +0000 (UTC)
IronPort-SDR: HBrLdmaoNoin1l+np3SqVFUKuNkoB5vvRl+Oe1Qamg9VyF676s/lI/nFuwXxm5Vw3D9w3hF6ke
 nt/QPEXbPTAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="180584641"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="180584641"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 04:20:02 -0700
IronPort-SDR: 2zEgQUX8lvk54ra4kvYp+1zgBQE1FgS4FJKsZJBPlGvTpTXDiDbhkboW7QubLGvKGgiVqfyLrq
 PZfezKN8cd/Q==
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="414731685"
Received: from rloka-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.31.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 04:20:00 -0700
Date: Tue, 6 Apr 2021 14:19:56 +0300
From: Andi Shyti <andi.shyti@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Do not report 100% RC6 if not
 supported
Message-ID: <YGxD3HZEZ1hoV7gj@intel.intel>
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

Hi Tvrtko,

> We use GT parked status to estimate RC6 while not in use, however if RC6
> is not supported to start with that does not work very well and produces a
> false 100% RC6 readout.
> 
> Fix by not advancing the estimated RC6 counter when feature is not
> supported.
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

if rc6 is not supported, why are we here?

Did you mean rc6.enabled ?

Andi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
