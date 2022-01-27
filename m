Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36349DBE8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CC810E497;
	Thu, 27 Jan 2022 07:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C472010E3F7;
 Thu, 27 Jan 2022 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643269848; x=1674805848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DvlL4TMcZX+1FbKvqO85jU1skG0kRctY7B23UiYJy9s=;
 b=YCePIgu16+nB2I0k0kBP1jUwF/YBB1n++IXg9PcttX6cVW5GRTGxawf2
 9sHswqmYd+ZRDSd+bKD+91575qwhWWZbAWuijKb0OI5nqdW/K9GbLIeeS
 xc0PsgJrxtEiyn4RdLaZx2biRtRc2+hld44RZPEOOWYstSui+x6hPLZJg
 uZYY56AUrn07Srdfavy6E61l4kmAsgBWHlR4gspjGf8dIHpNeKtEcEuL2
 GWQmvtOZhxPOE24WSYh4WLFH0ERXDNKRbSTnhxAMScJ8lStnCh9BEif62
 Hllfd09vCIRB7EMcapoVK2P7hETOnYKdyI/2Fzq3xMVCNu18RDdb/9wO0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246556421"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="246556421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="521117074"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga007.jf.intel.com with SMTP; 26 Jan 2022 23:50:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 09:50:44 +0200
Date: Thu, 27 Jan 2022 09:50:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 6/8] drm/i915/dp: add 128b/132b support to link status
 checks
Message-ID: <YfJO1BD46L2oOrXH@intel.com>
References: <cover.1643130139.git.jani.nikula@intel.com>
 <adf22e5c64d4fd45a48086ec140663a83b30444d.1643130139.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adf22e5c64d4fd45a48086ec140663a83b30444d.1643130139.git.jani.nikula@intel.com>
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

On Tue, Jan 25, 2022 at 07:03:44PM +0200, Jani Nikula wrote:
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
> index 4d4579a301f6..80fedd0e6212 100644
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

That will only check the eq done bits. I think we want to keep the
symbol locked checks as well.

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
> index 8bb6a296f421..1e41a560204a 100644
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
