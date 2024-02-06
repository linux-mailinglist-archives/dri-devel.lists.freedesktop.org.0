Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9584B409
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 12:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2079112B04;
	Tue,  6 Feb 2024 11:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xp2ytvYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9AF112B04;
 Tue,  6 Feb 2024 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707220683; x=1738756683;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CXNHx6ojWkF6hiBohsH1QU3LwYWg5nIKgaam2KHUH3U=;
 b=Xp2ytvYs5jp6s4QAUl5rjSuhXEiMcJ59czDrs8T7jFAA4g2K74ApyjZ3
 9mo2licZlvTaxviGVuPKhbIVDOxqWCHDQa0n9Q7m0MzQFJlXFvUWasGiI
 F2jX7TXN8ajGc8MZK9pXcGnIv9V2cI/9N/qBrDHypJ7mwczxFwK2pmJMt
 IjvZsY/sErVsTbN7XP/IOxEp72q/93bad/opRgFxd4vNMuNyA38MR7qAQ
 KCRk6ZAHNav6e5v+4jZYudpdqhS6iLn/d+NiTDnF0OnYUPe2bsuimOEZK
 4a7f/EsmgRwtx0uk296ULWzILS+o239WnoQ/aPYFEtkG4/C9A7GL+TtAa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="3689104"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="3689104"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 03:57:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1345648"
Received: from johnypau-mobl1.ger.corp.intel.com (HELO
 ideak-desk.fi.intel.com) ([10.251.218.188])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 03:57:58 -0800
Date: Tue, 6 Feb 2024 13:58:14 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 11/19] drm/i915/dp: Add support for DP tunnel BW allocation
Message-ID: <ZcIcCd1/nNX89Mr3@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-12-imre.deak@intel.com>
 <ZcFlelbJ_GqCy2hx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcFlelbJ_GqCy2hx@intel.com>
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

On Tue, Feb 06, 2024 at 12:47:22AM +0200, Ville Syrjälä wrote:
> On Tue, Jan 23, 2024 at 12:28:42PM +0200, Imre Deak wrote:
> > +static int check_inherited_tunnel_state(struct intel_atomic_state *state,
> > +					struct intel_dp *intel_dp,
> > +					const struct intel_digital_connector_state *old_conn_state)
> > +{
> > +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> > +	const struct intel_connector *connector =
> > +		to_intel_connector(old_conn_state->base.connector);
> > +	struct intel_crtc *old_crtc;
> > +	const struct intel_crtc_state *old_crtc_state;
> > +
> > +	/*
> > +	 * If a BWA tunnel gets detected only after the corresponding
> > +	 * connector got enabled already without a BWA tunnel, or a different
> > +	 * BWA tunnel (which was removed meanwhile) the old CRTC state won't
> > +	 * contain the state of the current tunnel. This tunnel still has a
> > +	 * reserved BW, which needs to be released, add the state for such
> > +	 * inherited tunnels separately only to this atomic state.
> > +	 */
> > +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> > +		return 0;
> > +
> > +	if (!old_conn_state->base.crtc)
> > +		return 0;
> > +
> > +	old_crtc = to_intel_crtc(old_conn_state->base.crtc);
> > +	old_crtc_state = intel_atomic_get_old_crtc_state(state, old_crtc);
> > +
> > +	if (!old_crtc_state->hw.active ||
> > +	    old_crtc_state->dp_tunnel_ref.tunnel == intel_dp->tunnel)
> > +		return 0;
> > +
> > +	drm_dbg_kms(&i915->drm,
> > +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s][CRTC:%d:%s] Adding state for inherited tunnel %p\n",
> > +		    drm_dp_tunnel_name(intel_dp->tunnel),
> > +		    connector->base.base.id,
> > +		    connector->base.name,
> > +		    encoder->base.base.id,
> > +		    encoder->base.name,
> > +		    old_crtc->base.base.id,
> > +		    old_crtc->base.name,
> > +		    intel_dp->tunnel);
> > +
> > +	return add_inherited_tunnel_state(state, intel_dp->tunnel, old_crtc);
> 
> I still strongly dislike this "tunnels are magically created by detect
> behind our back" approach. IMO in an ideal world we'd only ever create the
> tunnels during modeset/sanitize. What was the reason that didn't work again?
> I think you explained it to me in person at least once already, but can't
> remember anymore...

The tunnel information, describing which group the tunnel belongs to and
so how much BW it can use is needed already during detect time: to
filter the connectors' mode list during connector probing and to
pass/fail an atomic check of connectors that go through a tunnel/group
based on the modes the connectors use, the BW these require vs. the
available BW of the tunnel group.

The atomic state for the tunnel - with the required BW through it - is
only created/added during a modeset.

> -- 
> Ville Syrjälä
> Intel
