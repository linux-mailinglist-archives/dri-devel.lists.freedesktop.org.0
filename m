Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081067723E5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414B810E09B;
	Mon,  7 Aug 2023 12:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD08710E09B;
 Mon,  7 Aug 2023 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691411231; x=1722947231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HXsI5QDhUQgFyRazXW9MikAEA9FemyZ0TDGodAk1XOc=;
 b=US+QtSCguCPSDRC15a4kl2yfDSqT/xePVxwhboAUvsglwPjaEBdTBWln
 JRMueMu5qqpN5WnlAVQhbyqyqjpUv6rLhMzcP6eAmwB8hCdJJzQYvZ5tA
 PpA0MzlcHAb5i5K8h2EM6RqLOcPMLMnqutWlDTgevlYoaQ6eZRhU2kU1+
 HZLT7WADwX3zU/yzK+a51458u8BN8hx8a4fQ1GxPKgE0UgtemHC3cyo6N
 1yUHZICFG61a0nBO0cxgFLLA3K//Q8VqdMxFs9piaDy2AYsSXtjgrxOr0
 skvLrgxnj64/FsQiZ3yXqSj+PpoOL8Cmix1OEdzmSa882BoDPbGIzV6Sp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="373280974"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="373280974"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="845007061"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="845007061"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:27:09 -0700
Date: Mon, 7 Aug 2023 15:27:06 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 19/20] drm/i915/dp: Check src/sink compressed bpp limit
 for edp
Message-ID: <ZNDjGuErT6RIqNIR@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-20-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-20-ankit.k.nautiyal@intel.com>
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

On Fri, Jul 28, 2023 at 09:41:49AM +0530, Ankit Nautiyal wrote:
> Use checks for src and sink limits before computing compressed bpp for
> eDP.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 9b71934e662e..0299b378ba6e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2032,6 +2032,8 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	int pipe_bpp, forced_bpp;
> +	int dsc_src_min_bpp, dsc_sink_min_bpp, dsc_min_bpp;
> +	int dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
>  
>  	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
>  
> @@ -2049,9 +2051,21 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  	}
>  	pipe_config->port_clock = limits->max_rate;
>  	pipe_config->lane_count = limits->max_lane_count;
> -	pipe_config->dsc.compressed_bpp =
> -		min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
> -		      pipe_bpp);
> +
> +	dsc_src_min_bpp = dsc_src_min_compressed_bpp();
> +	dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(pipe_config);
> +	dsc_min_bpp = max(dsc_src_min_bpp, dsc_sink_min_bpp);
> +
> +	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
> +	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(intel_dp,
> +								pipe_config,
> +								pipe_bpp / 3);
> +	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
> +
> +	/* Compressed BPP should be less than the Input DSC bpp */
> +	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
> +
> +	pipe_config->dsc.compressed_bpp = max(dsc_min_bpp, dsc_max_bpp);
>  
>  	pipe_config->pipe_bpp = pipe_bpp;
>  
> -- 
> 2.40.1
> 
