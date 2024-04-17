Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31408A8253
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F75D11342A;
	Wed, 17 Apr 2024 11:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvGoOKn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A25610F440;
 Wed, 17 Apr 2024 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713354462; x=1744890462;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=5O/UY6KKSSFkCoHiliCdx69CPIb+bCc6pWrtePdxBu8=;
 b=SvGoOKn9UCDawvapaVObs5aETu2UwUN4ql8e8myVha1n7y0R1PHrDd0U
 PTzwsmr4odwrqZW2cJLs32cFsxMBuowe658POQWIbHdPV3r7cG70JDnDA
 1qJj2ER5O+K2fZ6eNLC4p6vCpVKJI1jYcssCeBOe4M6TFfK27/nRV0hKZ
 ZR542ofLKd0rdgPmIcQ9GSuEMRbSkqzEwSgJgBy3pa6rsAYdFd4ZzmhDH
 sFYPd4mirDXssufOdzlceYmj9mkkVMjlkAfmWjZq4slLimvQiiJ+5On69
 tI6Z8OEqF7lqgxeSdoREw8KDAhSpvjFb7wznKRfB2a2YblZJzi7wmVtYm g==;
X-CSE-ConnectionGUID: ELh/h6NaRdCaOeOSHRRsdw==
X-CSE-MsgGUID: So8et1cCRjCWJJ00TQ3tKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12679736"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="12679736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:47:41 -0700
X-CSE-ConnectionGUID: Ku2L2GNQRfqHzQ665pN3YQ==
X-CSE-MsgGUID: Q6h4EmPXRJO/RefYOaRfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23193554"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:46:23 -0700
Date: Wed, 17 Apr 2024 14:46:56 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: Re: [PATCH v2 11/11] drm/i915/dp_mst: Enable HBLANK expansion quirk
 for UHBR rates
Message-ID: <Zh+2sLqFQ//J8m3W@ideak-desk.fi.intel.com>
References: <20240416221010.376865-1-imre.deak@intel.com>
 <20240416221010.376865-12-imre.deak@intel.com>
 <87y19cxr8j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y19cxr8j.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 17, 2024 at 12:39:40PM +0300, Jani Nikula wrote:
> On Wed, 17 Apr 2024, Imre Deak <imre.deak@intel.com> wrote:
> > Enabling the 5k@60Hz uncompressed mode on the MediaTek/Dell U3224KBA
> > monitor results in a blank screen, at least on MTL platforms on UHBR
> > link rates with some (<30) uncompressed bpp values. Enabling compression
> > fixes the problem, so do that for now. Windows enables DSC always if the
> > sink supports it and forcing it to enable the mode without compression
> > leads to the same problem above (which suggests a panel issue with
> > uncompressed mode).
> >
> > The same 5k mode on non-UHBR link rates is not affected and lower
> > resolution modes are not affected either. The problem is similar to the
> > one fixed by the HBLANK expansion quirk on Synaptics hubs, with the
> > difference that the problematic mode has a longer HBLANK duration. Also
> > the monitor doesn't report supporting HBLANK expansion; either its
> > internal MST hub does the expansion internally - similarly to the
> > Synaptics hub - or the issue has another root cause, but still related
> > to the mode's short HBLANK duration. Enable the quirk for the monitor
> > adjusting the detection for the above differences.
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c     |  2 ++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 22 +++++++++++++++++----
> >  2 files changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 023907da98581..79a615667aab1 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2281,6 +2281,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
> >  	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
> >  	/* Synaptics DP1.4 MST hubs require DSC for some modes on which it applies HBLANK expansion. */
> >  	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
> > +	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */
> > +	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
> >  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
> >  	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
> >  };
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index fb5e167c3c659..71b01f7631919 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -421,15 +421,22 @@ static int mode_hblank_period_ns(const struct drm_display_mode *mode)
> >  
> >  static bool
> >  hblank_expansion_quirk_needs_dsc(const struct intel_connector *connector,
> > -				 const struct intel_crtc_state *crtc_state)
> > +				 const struct intel_crtc_state *crtc_state,
> > +				 const struct link_config_limits *limits)
> >  {
> >  	const struct drm_display_mode *adjusted_mode =
> >  		&crtc_state->hw.adjusted_mode;
> > +	bool is_uhbr_sink = connector->mst_port &&
> > +			    drm_dp_uhbr_channel_coding_supported(connector->mst_port->dpcd);
> 
> Why do you combine connector->mst_port to "is uhbr sink"? I think it's
> confusing.

It is a way to get the DPCD of the root port, to determine if it
supports UHBR.

> > +	int hblank_limit = is_uhbr_sink ? 500 : 300;
> >  
> >  	if (!connector->dp.dsc_hblank_expansion_quirk)
> >  		return false;
> >  
> > -	if (mode_hblank_period_ns(adjusted_mode) > 300)
> > +	if (is_uhbr_sink && !drm_dp_is_uhbr_rate(limits->max_rate))
> 
> I'm not saying that's not correct, but I find that condition a bit
> surprising. "This does not apply to sinks capable of 128b/132b, but not
> running at UHBR."
> 
> IOW, this applies to sinks not capable of 128b/132b, and sinks capable
> of 128b/132b and running at UHBR.

Yes, on the particular monitor I tested and enabled the quirk for - DELL
U3224KBA - all the modes work fine in decompressed mode on non-UHBR link
rates, so it remains possible to enable those modes without DSC on non-UHBR
link rates.

> A head scratcher.
> 
> > +		return false;
> > +
> > +	if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
> >  		return false;
> >  
> >  	return true;
> > @@ -445,7 +452,7 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
> >  	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> >  	int min_bpp_x16 = limits->link.min_bpp_x16;
> >  
> > -	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state))
> > +	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state, limits))
> >  		return true;
> >  
> >  	if (!dsc) {
> > @@ -1604,7 +1611,14 @@ static bool detect_dsc_hblank_expansion_quirk(const struct intel_connector *conn
> >  			      DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC))
> >  		return false;
> >  
> > -	if (!(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
> > +	/*
> > +	 * UHBR (MST sink) devices requiring this quirk doesn't advertise the
> 
> What are you trying to say with "UHBR (MST sink)"? We've (read: I) have
> been confused by this in the past, and casually equating UHBR and MST
> isn't helping.

"MST sink" above is a distinction vs. the MST hubs the quirk is also
enabled for, the latter ones setting the HBLANK expansion cap flag,
while the former one doesn't.

> BR,
> Jani.
> 
> 
> > +	 * HBLANK expansion support. Presuming that they perform HBLANK
> > +	 * expansion internally, or are affected by this issue on modes with a
> > +	 * short HBLANK for other reasons.
> > +	 */
> > +	if (!drm_dp_uhbr_channel_coding_supported(dpcd) &&
> > +	    !(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
> >  		return false;
> >  
> >  	drm_dbg_kms(&i915->drm,
> 
> -- 
> Jani Nikula, Intel
