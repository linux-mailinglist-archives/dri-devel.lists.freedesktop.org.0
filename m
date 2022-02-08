Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA1B4ADBF6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5ADB10E1D6;
	Tue,  8 Feb 2022 15:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDECA10E189;
 Tue,  8 Feb 2022 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644332790; x=1675868790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kT8JlcLZYWMidyBtcQBlgk+KRM3ByWJPaAZy6Y2Ro1I=;
 b=mbvcaQ+ks2SD9TR65wH91UyUcnfK3rww8Dmqg6bCi1PX8rWjeaCNiTat
 Zogb3DcrzZrO2IyVtI9UUn3T/K20vCVbVYBz+zcvjwt/fNi26RFpMetrE
 yGg85lgWBJNRYJq3foPNuEfNL/Z0+eTaBsGHZzFxeKLGhIeURoijaFFaD
 jMxBkY9iysahFHwdNl17R0ef95XNjGd7h+Gun1hFmnQksTlG+I1zyOkYs
 FMB88BNBBsUGENTVJreZodFZ0G18V0Mu6htS/QEzcsofK9YTrC0dBqHDX
 U2ZY4i0LWGdiIOw2OSEZmnplwWGQ0dOOoWMXoNEhg+574cCaYF9GFHflp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229613814"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="229613814"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="499587448"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 08 Feb 2022 07:06:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 17:06:24 +0200
Date: Tue, 8 Feb 2022 17:06:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 6/8] drm/i915/dp: add 128b/132b support to link status
 checks
Message-ID: <YgKG8JFIKC6PRmMG@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
 <cec395d435679a290a1c35fcbfc54555101bfad1.1643878928.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cec395d435679a290a1c35fcbfc54555101bfad1.1643878928.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 11:03:55AM +0200, Jani Nikula wrote:
> Abstract link status check to a function that takes 128b/132b and 8b/10b
> into account, and use it. Also dump link status on failures.
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c       | 39 ++++++++++++++-----
>  .../drm/i915/display/intel_dp_link_training.c |  2 +-
>  .../drm/i915/display/intel_dp_link_training.h |  4 ++
>  3 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 146b83916005..8c5590f0409a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3628,6 +3628,32 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
>  			    "Could not write test response to sink\n");
>  }
>  
> +static bool intel_dp_link_ok(struct intel_dp *intel_dp,
> +			     u8 link_status[DP_LINK_STATUS_SIZE])
> +{
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> +	bool uhbr = intel_dp->link_rate >= 1000000;
> +	bool ok;
> +
> +	if (uhbr)
> +		ok = drm_dp_128b132b_lane_channel_eq_done(link_status,
> +							  intel_dp->lane_count);

I was pondering whether we need to check more of the bits here. I guess
time will tell.

Remainder of the series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +	else
> +		ok = drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
> +
> +	if (ok)
> +		return true;
> +
> +	intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +	drm_dbg_kms(&i915->drm,
> +		    "[ENCODER:%d:%s] %s link not ok, retraining\n",
> +		    encoder->base.base.id, encoder->base.name,
> +		    uhbr ? "128b/132b" : "8b/10b");
> +
> +	return false;
> +}
> +
>  static void
>  intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
>  {
> @@ -3658,14 +3684,7 @@ static bool intel_dp_mst_link_status(struct intel_dp *intel_dp)
>  		return false;
>  	}
>  
> -	if (!drm_dp_channel_eq_ok(link_status, intel_dp->lane_count)) {
> -		drm_dbg_kms(&i915->drm,
> -			    "[ENCODER:%d:%s] channel EQ not ok, retraining\n",
> -			    encoder->base.base.id, encoder->base.name);
> -		return false;
> -	}
> -
> -	return true;
> +	return intel_dp_link_ok(intel_dp, link_status);
>  }
>  
>  /**
> @@ -3779,8 +3798,8 @@ intel_dp_needs_link_retrain(struct intel_dp *intel_dp)
>  					intel_dp->lane_count))
>  		return false;
>  
> -	/* Retrain if Channel EQ or CR not ok */
> -	return !drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
> +	/* Retrain if link not ok */
> +	return !intel_dp_link_ok(intel_dp, link_status);
>  }
>  
>  static bool intel_dp_has_connector(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index cc2b82d9114c..0686da36c428 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -712,7 +712,7 @@ static bool intel_dp_adjust_request_changed(const struct intel_crtc_state *crtc_
>  	return false;
>  }
>  
> -static void
> +void
>  intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
>  			  const u8 link_status[DP_LINK_STATUS_SIZE])
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index dbfb15705aaa..dc1556b46b85 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -29,6 +29,10 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
>  void intel_dp_stop_link_train(struct intel_dp *intel_dp,
>  			      const struct intel_crtc_state *crtc_state);
>  
> +void
> +intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
> +			  const u8 link_status[DP_LINK_STATUS_SIZE]);
> +
>  /* Get the TPSx symbol type of the value programmed to DP_TRAINING_PATTERN_SET */
>  static inline u8 intel_dp_training_pattern_symbol(u8 pattern)
>  {
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
