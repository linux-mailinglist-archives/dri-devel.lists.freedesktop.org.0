Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4304AEDC9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E47310E679;
	Wed,  9 Feb 2022 09:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29EB10E660;
 Wed,  9 Feb 2022 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644398256; x=1675934256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bI9jE3UCp/K/cFyRnKt5ukkSaDgeXlu8v0cUPzcZZ6Q=;
 b=l4400tznDWj/uxBMM1QmD67tLDUiRUnUqML6iKVci9VkSHPWZkjS1hpT
 BHD6AccxQ8cVPNkOQX24ZI84JHaBt7r00I/oBLIpM1T3LBc9DnQ4dxbmk
 K7+TbTL/IGgTa7sx8Q8d3+8EKUskmJUOjLx6cbIJP8+XlkuO46/iIjo79
 GqgvGE/62jalC+t21AS6QeBJ3+nRbYrQv7lralK1FF4fnY0AUAqhSZfpI
 ilpS6K7oOfunQ0WFHmTeSUNXNSFGoQZ73Tya/FZQgPy3PQcobHs2tiU3l
 vNhYysp/s3bDOVkzg7pXYLxKiT/64XR5TL1MRdUTbh98A6ziGcJhG3+QF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249110121"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="249110121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="678459009"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 09 Feb 2022 01:17:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 11:17:30 +0200
Date: Wed, 9 Feb 2022 11:17:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 6/8] drm/i915/dp: add 128b/132b support to link status
 checks
Message-ID: <YgOGqmEigGnYIK8f@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
 <cec395d435679a290a1c35fcbfc54555101bfad1.1643878928.git.jani.nikula@intel.com>
 <YgKG8JFIKC6PRmMG@intel.com> <87sfsspfsa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sfsspfsa.fsf@intel.com>
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

On Wed, Feb 09, 2022 at 11:09:41AM +0200, Jani Nikula wrote:
> On Tue, 08 Feb 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Feb 03, 2022 at 11:03:55AM +0200, Jani Nikula wrote:
> >> Abstract link status check to a function that takes 128b/132b and 8b/10b
> >> into account, and use it. Also dump link status on failures.
> >> 
> >> Cc: Uma Shankar <uma.shankar@intel.com>
> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_dp.c       | 39 ++++++++++++++-----
> >>  .../drm/i915/display/intel_dp_link_training.c |  2 +-
> >>  .../drm/i915/display/intel_dp_link_training.h |  4 ++
> >>  3 files changed, 34 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >> index 146b83916005..8c5590f0409a 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -3628,6 +3628,32 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
> >>  			    "Could not write test response to sink\n");
> >>  }
> >>  
> >> +static bool intel_dp_link_ok(struct intel_dp *intel_dp,
> >> +			     u8 link_status[DP_LINK_STATUS_SIZE])
> >> +{
> >> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> >> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> >> +	bool uhbr = intel_dp->link_rate >= 1000000;
> >> +	bool ok;
> >> +
> >> +	if (uhbr)
> >> +		ok = drm_dp_128b132b_lane_channel_eq_done(link_status,
> >> +							  intel_dp->lane_count);
> >
> > I was pondering whether we need to check more of the bits here. I guess
> > time will tell.
> >
> > Remainder of the series is
> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Just to be on the safe side, does this cover patches 2 and 4 too?

Yeah, pretty sure I read through all of them.

> 
> And thanks for all the reviews so far, much appreciated!
>
> BR,
> Jani.
> 
> 
> >
> >> +	else
> >> +		ok = drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
> >> +
> >> +	if (ok)
> >> +		return true;
> >> +
> >> +	intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> >> +	drm_dbg_kms(&i915->drm,
> >> +		    "[ENCODER:%d:%s] %s link not ok, retraining\n",
> >> +		    encoder->base.base.id, encoder->base.name,
> >> +		    uhbr ? "128b/132b" : "8b/10b");
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  static void
> >>  intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
> >>  {
> >> @@ -3658,14 +3684,7 @@ static bool intel_dp_mst_link_status(struct intel_dp *intel_dp)
> >>  		return false;
> >>  	}
> >>  
> >> -	if (!drm_dp_channel_eq_ok(link_status, intel_dp->lane_count)) {
> >> -		drm_dbg_kms(&i915->drm,
> >> -			    "[ENCODER:%d:%s] channel EQ not ok, retraining\n",
> >> -			    encoder->base.base.id, encoder->base.name);
> >> -		return false;
> >> -	}
> >> -
> >> -	return true;
> >> +	return intel_dp_link_ok(intel_dp, link_status);
> >>  }
> >>  
> >>  /**
> >> @@ -3779,8 +3798,8 @@ intel_dp_needs_link_retrain(struct intel_dp *intel_dp)
> >>  					intel_dp->lane_count))
> >>  		return false;
> >>  
> >> -	/* Retrain if Channel EQ or CR not ok */
> >> -	return !drm_dp_channel_eq_ok(link_status, intel_dp->lane_count);
> >> +	/* Retrain if link not ok */
> >> +	return !intel_dp_link_ok(intel_dp, link_status);
> >>  }
> >>  
> >>  static bool intel_dp_has_connector(struct intel_dp *intel_dp,
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> >> index cc2b82d9114c..0686da36c428 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> >> @@ -712,7 +712,7 @@ static bool intel_dp_adjust_request_changed(const struct intel_crtc_state *crtc_
> >>  	return false;
> >>  }
> >>  
> >> -static void
> >> +void
> >>  intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
> >>  			  const u8 link_status[DP_LINK_STATUS_SIZE])
> >>  {
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> >> index dbfb15705aaa..dc1556b46b85 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> >> @@ -29,6 +29,10 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
> >>  void intel_dp_stop_link_train(struct intel_dp *intel_dp,
> >>  			      const struct intel_crtc_state *crtc_state);
> >>  
> >> +void
> >> +intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
> >> +			  const u8 link_status[DP_LINK_STATUS_SIZE]);
> >> +
> >>  /* Get the TPSx symbol type of the value programmed to DP_TRAINING_PATTERN_SET */
> >>  static inline u8 intel_dp_training_pattern_symbol(u8 pattern)
> >>  {
> >> -- 
> >> 2.30.2
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
