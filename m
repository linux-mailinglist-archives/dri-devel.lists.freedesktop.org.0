Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03B84A98A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 23:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B2610FD40;
	Mon,  5 Feb 2024 22:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6gxWfqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D9E10FD40;
 Mon,  5 Feb 2024 22:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707173247; x=1738709247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W89XqkhDwtoG6NESB3Ll1REY2YvJekDVakNvRBExAPA=;
 b=T6gxWfqp0/U/qUG4L81Vqrd+55HHnl/6XYdB/WuTsCq9pzQohjXLc6Zj
 NZmMztvrSuWbSEYHxEYxRAeNUlyl+IdHrlax/0oCmqZcoDqpJQprG3Wd+
 w3nQ/3wthoUqB6f7l20b5MWqZLbA58Tsl8ZwnZpLEaPag9YHVk5+Nty11
 EQ/q5QLIpo+MLVM4P0MpLnOUY8pfn6ASsIvqMKfHGoUKorJYzkTB9kzIH
 yC4gbYHrVXVqp7Rw1/IUQUXamX4oSA6CsxAm4HrFnIEPPnuwRoKIZ+srM
 t9wNaYkS5LD4NlbcYt2pcgqHp+d6Fv9QiTL2sVl5ElZVhCYqoZZ696+4G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="525862"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="525862"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 14:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="823990309"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="823990309"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Feb 2024 14:47:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 00:47:22 +0200
Date: Tue, 6 Feb 2024 00:47:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 11/19] drm/i915/dp: Add support for DP tunnel BW allocation
Message-ID: <ZcFlelbJ_GqCy2hx@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-12-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123102850.390126-12-imre.deak@intel.com>
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

On Tue, Jan 23, 2024 at 12:28:42PM +0200, Imre Deak wrote:
> +static int check_inherited_tunnel_state(struct intel_atomic_state *state,
> +					struct intel_dp *intel_dp,
> +					const struct intel_digital_connector_state *old_conn_state)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	const struct intel_connector *connector =
> +		to_intel_connector(old_conn_state->base.connector);
> +	struct intel_crtc *old_crtc;
> +	const struct intel_crtc_state *old_crtc_state;
> +
> +	/*
> +	 * If a BWA tunnel gets detected only after the corresponding
> +	 * connector got enabled already without a BWA tunnel, or a different
> +	 * BWA tunnel (which was removed meanwhile) the old CRTC state won't
> +	 * contain the state of the current tunnel. This tunnel still has a
> +	 * reserved BW, which needs to be released, add the state for such
> +	 * inherited tunnels separately only to this atomic state.
> +	 */
> +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return 0;
> +
> +	if (!old_conn_state->base.crtc)
> +		return 0;
> +
> +	old_crtc = to_intel_crtc(old_conn_state->base.crtc);
> +	old_crtc_state = intel_atomic_get_old_crtc_state(state, old_crtc);
> +
> +	if (!old_crtc_state->hw.active ||
> +	    old_crtc_state->dp_tunnel_ref.tunnel == intel_dp->tunnel)
> +		return 0;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s][CRTC:%d:%s] Adding state for inherited tunnel %p\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id,
> +		    connector->base.name,
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    old_crtc->base.base.id,
> +		    old_crtc->base.name,
> +		    intel_dp->tunnel);
> +
> +	return add_inherited_tunnel_state(state, intel_dp->tunnel, old_crtc);

I still strongly dislike this "tunnels are magically created by detect
behind our back" approach. IMO in an ideal world we'd only ever create the
tunnels during modeset/sanitize. What was the reason that didn't work again?
I think you explained it to me in person at least once already, but can't
remember anymore...

-- 
Ville Syrjälä
Intel
