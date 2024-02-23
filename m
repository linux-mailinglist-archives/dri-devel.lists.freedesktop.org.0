Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CA861F1C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7AA10ECE3;
	Fri, 23 Feb 2024 21:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYHEDzcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0910ECCC;
 Fri, 23 Feb 2024 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708724265; x=1740260265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/giLLeHjRFf0PUfUhFFTenUsU3HCL7WGjn6fIPishto=;
 b=BYHEDzcN2NiUibTwa4v4qee7ilUX7Q1H2UUVnCSzQpQvuMUeN3KKPy/g
 QaTmSwHQd7KjA/Sh3UB6BORRpKXE8lVd26cv64FfadvlH2DXyhTywvnii
 7I0JRm8UkF0SgejQbxS5tyHkb6uVTz97seuYpf70v9C3U9DWIVGPD5rlD
 WfwA967HB/Yw1+Fbup7Ilt11GmSMX+012WVQKI7iyC9sC6D+Ylea+Gh6Z
 4gXVstxgkidTfT8pN3sYyOoJnOsKuMCvxdwOuDVrGlmrZQu0mllmZKI1h
 L9CipHFML0eERnxlxnYWi23eP4cbQWmGuiRi2WeLnJthZJgyqAFZHX9mv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6878548"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6878548"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 13:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="827767909"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="827767909"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 23 Feb 2024 13:37:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Feb 2024 23:37:41 +0200
Date: Fri, 23 Feb 2024 23:37:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/21] drm/i915/dp: Add support for DP tunnel BW
 allocation
Message-ID: <ZdkQJSuyiyVOyDtf@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-13-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220211841.448846-13-imre.deak@intel.com>
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

On Tue, Feb 20, 2024 at 11:18:32PM +0200, Imre Deak wrote:
> +static void queue_retry_work(struct intel_atomic_state *state,
> +			     struct drm_dp_tunnel *tunnel,
> +			     const struct intel_crtc_state *crtc_state)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	struct intel_encoder *encoder;
> +
> +	encoder = intel_get_crtc_new_encoder(state, crtc_state);

I was pondering what happens if we have no encoder here?
But I guess crtc_state->tunnel_ref.tunnel should be NULL in
that case and so we should not end up here.

> +
> +	if (!intel_digital_port_connected(encoder))
> +		return;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][ENCODER:%d:%s] BW allocation failed on a connected sink\n",
> +		    drm_dp_tunnel_name(tunnel),
> +		    encoder->base.base.id,
> +		    encoder->base.name);
> +
> +	intel_dp_queue_modeset_retry_for_link(state, encoder, crtc_state);
> +}
> +

-- 
Ville Syrjälä
Intel
