Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965088473BC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B016B10F0A6;
	Fri,  2 Feb 2024 15:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPru2gmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BB510F0A3;
 Fri,  2 Feb 2024 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706889256; x=1738425256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fSG/s64TgbfpY1knUf2oxn5oceIQ0xI1dLGP47qZ9B4=;
 b=IPru2gmxhSW5sxUf3zAfHHYK3Oqa9MuiMjNVJTy8TbM8ZXEJnZgbvzX0
 SXssqhk9YPD1kOc4IWQkzrBbxkoQfjNAjdYLht85hF58qDzBtIX1tA1b1
 5WHuu/Z9+2gkrOzFioY6KDkj4nwg/abl6dBGKrWxLIPJ8RKlEo6/XME60
 fKN1P2QGGASCMfUoBIXiJDJjXi6MypaFhI3uqgVdSzlneIwI9m0E81Uud
 h1TzELteY/vv5dlS2mdxFZnUPCYEwkS5+RD1QV4qy68+0lvuy2eD20mox
 WD1fn7PSqczanUgMt3ODu3ePJprj0sJaIrSYcUDXVHDuODLKPhAqbUTje Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="358914"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="358914"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823242283"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823242283"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 07:54:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Feb 2024 17:54:12 +0200
Date: Fri, 2 Feb 2024 17:54:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 4/4] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Message-ID: <Zb0QJGZ0RE-5KBQb@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
 <a2c9faf86b5d93013fdd0be9bf3d6ba6228f0a8f.1706882591.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2c9faf86b5d93013fdd0be9bf3d6ba6228f0a8f.1706882591.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 02, 2024 at 04:05:34PM +0200, Jani Nikula wrote:
> If the sink supports 128b/132b and single-stream sideband messaging,
> enable MST mode.
> 
> With this, the topology manager will still write DP_MSTM_CTRL, which
> should be ignored by the sink. In the future,
> drm_dp_mst_topology_mgr_set_mst() bool mst_state parameter should
> probably be turned into an enum drm_dp_mst_mode mst_mode parameter.

Rather I'd say the topology manager should stop concerning itself
with the MST enable bit and just frob the sideband enable bit.
The MST enable bit should be configured at modeset time to
reflect whether we're about to transmit in MST or SST mode.

> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4dd9c50226d1..16130e87dc23 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4020,7 +4020,9 @@ static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
>  
>  	intel_dp->is_mst = i915->display.params.enable_dp_mst &&
>  		intel_dp_mst_source_support(intel_dp) &&
> -		sink_mst_mode == DP_MST_CAPABLE;
> +		(sink_mst_mode == DP_MST_CAPABLE ||
> +		 (sink_mst_mode == DP_MST_SIDEBAND_MSG &&
> +		  intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B));
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
