Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283BD3511CD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 11:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69846E3A0;
	Thu,  1 Apr 2021 09:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DEC6E104;
 Thu,  1 Apr 2021 09:19:09 +0000 (UTC)
IronPort-SDR: CyEiclTk453qnNukeoAZWDuIUE1ih9ZUYe1zGQSquXy169BHywBIaC7RlRI/xgNrQ8tYDJjI1i
 uP9+wkHTSqCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="253537127"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="253537127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:19:05 -0700
IronPort-SDR: I1RNBi7QrW7yECoEw7BkJOI1sF0c2LAzlehbxfz3KfDFwGrzcPULvK22EoaBbBrm527+B7XyQi
 +hof1o0FaKxg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="419114778"
Received: from chinchil-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.231.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:19:04 -0700
Date: Thu, 1 Apr 2021 05:19:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
Message-ID: <YGWQB+8gWgmZ/6Mg@intel.com>
References: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
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

On Wed, Mar 31, 2021 at 11:18:50AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> RC6 support cannot be simply established by looking at the static device
> HAS_RC6() flag. There are cases which disable RC6 at driver load time so
> use the status of those check when deciding whether to enumerate the rc6
> counter.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 41651ac255fa..a75cd1db320b 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -476,6 +476,8 @@ engine_event_status(struct intel_engine_cs *engine,
>  static int
>  config_status(struct drm_i915_private *i915, u64 config)
>  {
> +	struct intel_gt *gt = &i915->gt;
> +
>  	switch (config) {
>  	case I915_PMU_ACTUAL_FREQUENCY:
>  		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> @@ -489,7 +491,7 @@ config_status(struct drm_i915_private *i915, u64 config)
>  	case I915_PMU_INTERRUPTS:
>  		break;
>  	case I915_PMU_RC6_RESIDENCY:
> -		if (!HAS_RC6(i915))
> +		if (!gt->rc6.supported)

Is this really going to remove any confusion?
Right now it is there but with residency 0, but after this change the event is
not there anymore so I wonder if we are not just changing to a different kind
of confusion on users.

>  			return -ENODEV;

would a different return help somehow?

>  		break;
>  	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
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
