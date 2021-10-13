Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0D442CCCB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 23:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080016E103;
	Wed, 13 Oct 2021 21:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3BC6E103;
 Wed, 13 Oct 2021 21:26:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207657856"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="207657856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 14:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="460940518"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 13 Oct 2021 14:26:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 00:26:30 +0300
Date: Thu, 14 Oct 2021 00:26:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/dp: use new link training delay helpers
Message-ID: <YWdPBj9fGMh3MOS1@intel.com>
References: <20211012144321.5990-1-jani.nikula@intel.com>
 <20211012144321.5990-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012144321.5990-2-jani.nikula@intel.com>
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

On Tue, Oct 12, 2021 at 05:43:21PM +0300, Jani Nikula wrote:
> Use the new link training delay helpers, fixing the delays for
> 128b/132b.
> 
> For existing 8b/10b functionality, this will cause additional 1-byte
> DPCD reads for LTTPR delays instead of using the cached values. It's
> just too complicated to combine generic helpers with local caching in a
> sensible way.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I was just pondering if the extra DPCD reads might cause some grief for
some compliance test stuff. But I guess if that happens we could just
read them all at the very start of link training, or something.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  .../drm/i915/display/intel_dp_link_training.c | 38 +++++++------------
>  1 file changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 85676c953e0a..a72f2dc93718 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -683,15 +683,6 @@ intel_dp_prepare_link_train(struct intel_dp *intel_dp,
>  	return true;
>  }
>  
> -static void intel_dp_link_training_clock_recovery_delay(struct intel_dp *intel_dp,
> -							enum drm_dp_phy dp_phy)
> -{
> -	if (dp_phy == DP_PHY_DPRX)
> -		drm_dp_link_train_clock_recovery_delay(&intel_dp->aux, intel_dp->dpcd);
> -	else
> -		drm_dp_lttpr_link_train_clock_recovery_delay();
> -}
> -
>  static bool intel_dp_adjust_request_changed(const struct intel_crtc_state *crtc_state,
>  					    const u8 old_link_status[DP_LINK_STATUS_SIZE],
>  					    const u8 new_link_status[DP_LINK_STATUS_SIZE])
> @@ -750,6 +741,11 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  	bool max_vswing_reached = false;
>  	char phy_name[10];
> +	int delay_us;
> +
> +	delay_us = drm_dp_read_clock_recovery_delay(&intel_dp->aux,
> +						    intel_dp->dpcd, dp_phy,
> +						    intel_dp_is_uhbr(crtc_state));
>  
>  	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
>  
> @@ -777,7 +773,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
>  
>  	voltage_tries = 1;
>  	for (cr_tries = 0; cr_tries < max_cr_tries; ++cr_tries) {
> -		intel_dp_link_training_clock_recovery_delay(intel_dp, dp_phy);
> +		usleep_range(delay_us, 2 * delay_us);
>  
>  		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
>  						     link_status) < 0) {
> @@ -895,19 +891,6 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
>  	return DP_TRAINING_PATTERN_2;
>  }
>  
> -static void
> -intel_dp_link_training_channel_equalization_delay(struct intel_dp *intel_dp,
> -						  enum drm_dp_phy dp_phy)
> -{
> -	if (dp_phy == DP_PHY_DPRX) {
> -		drm_dp_link_train_channel_eq_delay(&intel_dp->aux, intel_dp->dpcd);
> -	} else {
> -		const u8 *phy_caps = intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
> -
> -		drm_dp_lttpr_link_train_channel_eq_delay(&intel_dp->aux, phy_caps);
> -	}
> -}
> -
>  /*
>   * Perform the link training channel equalization phase on the given DP PHY
>   * using one of training pattern 2, 3 or 4 depending on the source and
> @@ -925,6 +908,11 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  	bool channel_eq = false;
>  	char phy_name[10];
> +	int delay_us;
> +
> +	delay_us = drm_dp_read_channel_eq_delay(&intel_dp->aux,
> +						intel_dp->dpcd, dp_phy,
> +						intel_dp_is_uhbr(crtc_state));
>  
>  	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
>  
> @@ -944,8 +932,8 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
>  	}
>  
>  	for (tries = 0; tries < 5; tries++) {
> -		intel_dp_link_training_channel_equalization_delay(intel_dp,
> -								  dp_phy);
> +		usleep_range(delay_us, 2 * delay_us);
> +
>  		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
>  						     link_status) < 0) {
>  			drm_err(&i915->drm,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
