Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABDE70F6A8
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B71210E671;
	Wed, 24 May 2023 12:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CAC10E671;
 Wed, 24 May 2023 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684931927; x=1716467927;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rWo2fOrbGhSBD/MVs0Rpd7nBOGwqUcKhckx2t9vdeE8=;
 b=XzulcX200LksjmFZxmNfbD0tBYNrA43Rgj0rAYOqTEU79+knZi85m3sC
 ijmv4S1kqJlr6nwj2JRyt/mNCpqwlpZJc0Ax8vT0ABTzuFPFy3aUun353
 7pJmO6CmqaJn85EFC3NeAOHbzxfS0VNZ60sXMddrRFqBehkSbmtrue4wE
 mzT7FuDAExrrEqjADVv3b09j2cLYsvXhz6dgBzGte62qBjKbP0WxTx/yz
 WF3rOEJJZ7jUnLRcxScGY/XMHuOLdo8CKF5yAA1RO74m3JCeVIkZJmp3k
 HyH9g7DpeiHlsuQ3NU7aAKZ+9YHWI3f4nq9oRFYIq/t20mCyV1bNkBDaH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356772153"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356772153"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="707500876"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="707500876"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 24 May 2023 05:38:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 May 2023 15:38:42 +0300
Date: Wed, 24 May 2023 15:38:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH 12/13] drm/i915/dp: Get optimal link config to have best
 compressed bpp
Message-ID: <ZG4FUsgK7Acv_p-a@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-13-ankit.k.nautiyal@intel.com>
 <ZGNeYFSFzInncdQm@intel.com> <ZGNrq9lG85tkh2Ym@intel.com>
 <ZGyA7sqHZP7XKw3G@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGyA7sqHZP7XKw3G@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, anusha.srivatsa@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 12:01:34PM +0300, Lisovskiy, Stanislav wrote:
> On Tue, May 16, 2023 at 02:40:27PM +0300, Ville Syrjälä wrote:
> > On Tue, May 16, 2023 at 01:43:44PM +0300, Lisovskiy, Stanislav wrote:
> > > On Fri, May 12, 2023 at 11:54:16AM +0530, Ankit Nautiyal wrote:
> > > > Currently, we take the max lane, rate and pipe bpp, to get the maximum
> > > > compressed bpp possible. We then set the output bpp to this value.
> > > > This patch provides support to have max bpp, min rate and min lanes,
> > > > that can support the min compressed bpp.
> > > > 
> > > > v2:
> > > > -Avoid ending up with compressed bpp, same as pipe bpp. (Stan)
> > > > -Fix the checks for limits->max/min_bpp while iterating over list of
> > > >  valid DSC bpcs. (Stan)
> > > > 
> > > > v3:
> > > > -Refactor the code to have pipe bpp/compressed bpp computation and slice
> > > > count calculation separately for different cases.
> > > > 
> > > > v4:
> > > > -Separate the pipe_bpp calculation for eDP and DP.
> > > > 
> > > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_dp.c | 305 +++++++++++++++++++-----
> > > >  1 file changed, 245 insertions(+), 60 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > index 39e2bf3d738d..578320220c9a 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > @@ -1642,6 +1642,209 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
> > > >  	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
> > > >  }
> > > >  
> > > > +static bool is_dsc_bw_sufficient(int link_rate, int lane_count, int compressed_bpp,
> > > > +				 const struct drm_display_mode *adjusted_mode)
> > > > +{
> > > > +	int mode_rate = intel_dp_link_required(adjusted_mode->crtc_clock, compressed_bpp);
> > > > +	int link_avail = intel_dp_max_data_rate(link_rate, lane_count);
> > > > +
> > > > +	return mode_rate <= link_avail;
> > > > +}
> > > > +
> > > > +static int dsc_compute_link_config(struct intel_dp *intel_dp,
> > > > +				   struct intel_crtc_state *pipe_config,
> > > > +				   struct link_config_limits *limits,
> > > > +				   int pipe_bpp,
> > > > +				   u16 compressed_bpp,
> > > > +				   int timeslots)
> > > > +{
> > > > +	const struct drm_display_mode *adjusted_mode =
> > > > +		&pipe_config->hw.adjusted_mode;
> > > > +	int link_rate, lane_count;
> > > > +	int dsc_max_bpp;
> > > > +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> > > > +	int i;
> > > > +
> > > > +	for (i = 0; i < intel_dp->num_common_rates; i++) {
> > > > +		link_rate = intel_dp_common_rate(intel_dp, i);
> > > > +		if (link_rate < limits->min_rate || link_rate > limits->max_rate)
> > > > +			continue;
> > > > +
> > > > +		for (lane_count = limits->min_lane_count;
> > > > +		     lane_count <= limits->max_lane_count;
> > > > +		     lane_count <<= 1) {
> > > > +			dsc_max_bpp = intel_dp_dsc_get_max_compressed_bpp(dev_priv,
> > > > +									  link_rate,
> > > > +									  lane_count,
> > > > +									  adjusted_mode->crtc_clock,
> > > > +									  adjusted_mode->crtc_hdisplay,
> > > > +									  pipe_config->bigjoiner_pipes,
> > > > +									  pipe_config->output_format,
> > > > +									  pipe_bpp, timeslots);
> > > > +			/*
> > > > +			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
> > > > +			 * supported PPS value can be 63.9375 and with the further
> > > > +			 * mention that bpp should be programmed double the target bpp
> > > > +			 * restricting our target bpp to be 31.9375 at max
> > > > +			 */
> > > > +			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
> > > > +				dsc_max_bpp = min_t(u16, dsc_max_bpp, 31);
> > > > +
> > > > +			if (compressed_bpp > dsc_max_bpp)
> > > > +				continue;
> > > > +
> > > > +			if (!is_dsc_bw_sufficient(link_rate, lane_count,
> > > > +						  compressed_bpp, adjusted_mode))
> > > > +				continue;
> > > > +
> > > > +			pipe_config->lane_count = lane_count;
> > > > +			pipe_config->port_clock = link_rate;
> > > > +
> > > > +			return 0;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > > +static
> > > > +u16 intel_dp_dsc_max_sink_compressed_bppx16(struct intel_dp *intel_dp,
> > > > +					    struct intel_crtc_state *pipe_config,
> > > > +					    int bpc)
> > > > +{
> > > > +	u16 max_bppx16 = drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd);
> > > > +
> > > > +	if (max_bppx16)
> > > > +		return max_bppx16;
> > > > +	/*
> > > > +	 * If support not given in DPCD 67h, 68h use the Maximum Allowed bit rate
> > > > +	 * values as given in spec Table 2-157 DP v2.0
> > > > +	 */
> > > > +	switch (pipe_config->output_format) {
> > > > +	case INTEL_OUTPUT_FORMAT_RGB:
> > > > +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> > > > +		return (3 * bpc) << 4;
> > > > +	case INTEL_OUTPUT_FORMAT_YCBCR420:
> > > > +		return (3 * (bpc / 2)) << 4;
> > > > +	default:
> > > > +		MISSING_CASE(pipe_config->output_format);
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static u16 intel_dp_dsc_min_compressed_bppx16(struct intel_crtc_state *pipe_config)
> > > > +{
> > > > +	switch (pipe_config->output_format) {
> > > > +	case INTEL_OUTPUT_FORMAT_RGB:
> > > > +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> > > > +		return 8 << 4;
> > > > +	case INTEL_OUTPUT_FORMAT_YCBCR420:
> > > > +		return 6 << 4;
> > > > +	default:
> > > > +		MISSING_CASE(pipe_config->output_format);
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
> > > > +				      struct intel_crtc_state *pipe_config,
> > > > +				      struct link_config_limits *limits,
> > > > +				      int pipe_bpp,
> > > > +				      int timeslots)
> > > > +{
> > > > +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> > > > +	u16 compressed_bpp;
> > > > +	int dsc_min_bpp, dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
> > > > +	int ret;
> > > > +
> > > > +	dsc_min_bpp = max(intel_dp_dsc_min_compressed_bppx16(pipe_config) >> 4, 8);
> > > > +	if (DISPLAY_VER(dev_priv) <= 12)
> > > > +		dsc_src_max_bpp = 23;
> > > > +	else
> > > > +		dsc_src_max_bpp = 27;
> > > 
> > > I would may be added some comment about what are those "23/27" numbers or
> > > may be even created some self-explanatory #define constants for those.
> > 
> > I dislike defines like that. They are single use so don't actually
> > do anything in terms of avoiding typoes and other accidental
> > mismatches, and people always seem put them in some random place
> > (eg. top of file) so then it takes extra work to find them.
> 
> Ah come on, even my primitive mcedit with ctags plugin can track it :))
> However my point is that anything is better than just hard-coded magic
> numbers, which is proven antipattern.

It's still a magic number whether you hide it behind a define or not.

> Also you never know if it is a single or multiple use,

If you use it multiple times then you aren't using the function
correctly.

> I think it should be
> either defined as a constant or as a define, which is self explanatory.

No more self explanatory than a function. Once you have the
function the define is entirely redundant.

> 
> > 
> > The best approach IMO is to just use functions with good names.
> > Eg. in this case we could just have a full set of clear functions:
> > dsc_{sink,source}_{min,max}_bpp() or something along those line.
> 
> ..which still doesn't explain, why it is 23 there, why it is 27, who sets those
> numbers, which spec and so on.

Neither does a define. All a define will do is say that for platform
X return define Y which is defined as Z. Returning Z directly is less
convoluted and just as helpful in figuring out where the numbers came
from. If it's hard to figure out where the number came from then you
can add a comment to indicate where it is specified.

-- 
Ville Syrjälä
Intel
