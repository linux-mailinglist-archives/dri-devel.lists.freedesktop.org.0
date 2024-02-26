Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD886739B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2285510F0C5;
	Mon, 26 Feb 2024 11:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h62UodvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2811910E6E3;
 Mon, 26 Feb 2024 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708947721; x=1740483721;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K/SeQ7Nsg3xJ1YJ4m7ul9KvS2HFKMxCmESzdd0yeiHs=;
 b=h62UodvSlAxwuLNLjrE0PBuCfwpIji6TxeghnUIE6kZb4SI0h69wWhOz
 I05Wu0ArtuDang5eEwmj42I/A5/7axVluBLRVqqjG/F8/C7yrVGbIq3jm
 4tMCI+yvZlpe4J/xgkDQ0cEVliKMHlBsX9l6nH5dNJfeHiwmjDY8APTgM
 uFYslaJ6GZNps1OBvzXhinYSksteQDik/nxkIQMA4xENJT/kEa8nSmL4s
 j+esJazpgIerVgVD8zEyu9hxswKJdtgqBRLRM7N74q9i5Li9c0MvvulYV
 5iGC4ZcS3JtjmP0Qffb0M62xrwEMDSNiwlQ3MfvLZ2eLgIazr0WBbJBPJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3096975"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3096975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11202409"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:41:59 -0800
Date: Mon, 26 Feb 2024 13:42:22 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/21] drm/i915/dp: Add support for DP tunnel BW
 allocation
Message-ID: <Zdx5HjBdI0B+6XvJ@ideak-desk.fi.intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-13-imre.deak@intel.com>
 <ZdkQJSuyiyVOyDtf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdkQJSuyiyVOyDtf@intel.com>
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

On Fri, Feb 23, 2024 at 11:37:41PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 20, 2024 at 11:18:32PM +0200, Imre Deak wrote:
> > +static void queue_retry_work(struct intel_atomic_state *state,
> > +			     struct drm_dp_tunnel *tunnel,
> > +			     const struct intel_crtc_state *crtc_state)
> > +{
> > +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> > +	struct intel_encoder *encoder;
> > +
> > +	encoder = intel_get_crtc_new_encoder(state, crtc_state);
> 
> I was pondering what happens if we have no encoder here?

That is when the crtc is disabled.

> But I guess crtc_state->tunnel_ref.tunnel should be NULL in
> that case and so we should not end up here.

Yes, in case crtc is disabled tunnel should be NULL, so
queue_retry_work() is not called.

> > +
> > +	if (!intel_digital_port_connected(encoder))
> > +		return;
> > +
> > +	drm_dbg_kms(&i915->drm,
> > +		    "[DPTUN %s][ENCODER:%d:%s] BW allocation failed on a connected sink\n",
> > +		    drm_dp_tunnel_name(tunnel),
> > +		    encoder->base.base.id,
> > +		    encoder->base.name);
> > +
> > +	intel_dp_queue_modeset_retry_for_link(state, encoder, crtc_state);
> > +}
> > +
> 
> -- 
> Ville Syrjälä
> Intel
