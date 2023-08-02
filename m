Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630376CBFB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 13:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531C210E081;
	Wed,  2 Aug 2023 11:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B2710E06D;
 Wed,  2 Aug 2023 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690976836; x=1722512836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=llfKhWRmhYSi+e2c9yf3k7fqDaNJGj/fhpZbpwB+X9s=;
 b=LO/tMyPaHMuKLkEqUtnqRw+Ge358abvG6YKGakVTz/Rz2xd08bqE9UG2
 LwgCUOsLrq5kGdk0UbxMpMg2rsPYuaZ5z1MyXtni2cK3lQsYLMhnXiHY6
 on6qWFmr3w6VEdbN0vtwmCJeyTxe13h4hqv3P8k3xO5b6oO4aJLR7Vtti
 o3aHpdzHxDv2yRGdcSa1Z0VC9QeeFcLfOXATw3rMjtu5SdDX9pDmQAJv0
 RibTwKWUMPzHp77Y8qh69nyMBPLXugVNC2BuFYItRzR497Bb/1aqxOmPy
 TN1srXyyLP1aWVtmqi93p64liFqqXcnFEucKmt8rjMX+d5i/KEhaHRyo5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359599108"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="359599108"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 04:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="729078490"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="729078490"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 04:47:14 -0700
Date: Wed, 2 Aug 2023 14:47:10 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 09/20] drm/i915/dp: Avoid forcing DSC BPC for MST case
Message-ID: <ZMpCPj40hQIvVuWM@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-10-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-10-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:41:39AM +0530, Ankit Nautiyal wrote:
> For MST the bpc is hardcoded to 8, and pipe bpp to 24.
> So avoid forcing DSC bpc for MST case.
> 
> v2: Warn and ignore the debug flag than to bail out. (Jani)
> 
> v3: Fix dbg message to mention forced bpc instead of bpp.
> 
> v4: Fix checkpatch longline warning.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  5 +++++
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c5d2e6f538ed..7ec8a478e000 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1697,14 +1697,14 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
>  		return -EINVAL;
>  
> -	if (compute_pipe_bpp)
> +	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
> +		pipe_bpp = intel_dp->force_dsc_bpc * 3;
> +		drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
> +			    intel_dp->force_dsc_bpc);
> +	} else if (compute_pipe_bpp) {
>  		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
> -	else
> +	} else {
>  		pipe_bpp = pipe_config->pipe_bpp;
> -
> -	if (intel_dp->force_dsc_bpc) {
> -		pipe_bpp = intel_dp->force_dsc_bpc * 3;
> -		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
>  	}
>  
>  	/* Min Input BPC for ICL+ is 8 */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 1f00713fb1ad..dff4717edbd0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -361,6 +361,11 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  	/* enable compression if the mode doesn't fit available BW */
>  	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
>  	if (ret || intel_dp->force_dsc_en) {
> +		/*
> +		 * FIXME: As bpc is hardcoded to 8, as mentioned above,
> +		 * WARN and ignore the debug flag force_dsc_bpc for now.
> +		 */
> +		drm_WARN(&dev_priv->drm, intel_dp->force_dsc_bpc, "Cannot Force BPC for MST\n");
>  		/*
>  		 * Try to get at least some timeslots and then see, if
>  		 * we can fit there with DSC.

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> -- 
> 2.40.1
> 
