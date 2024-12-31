Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9549FF0BC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 17:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9BB10E696;
	Tue, 31 Dec 2024 16:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INDy/GWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72B810E691;
 Tue, 31 Dec 2024 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735663440; x=1767199440;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=PCz7YfRFuHgy6MhiC9UAfymNUSVdIrtDlvskOUKnZ6I=;
 b=INDy/GWFqbH8dnzKMl88jREPesXK/GVyOTr1HlmAOi4Gg9KSdd0Rfg0b
 uyklDS6jQtKBahxVqFsaMivZY5/X497iGgJJGgtYpWgIaJa6/n1tWu1pC
 4aEfAbiQGjpD6FLQ9xIl3vZQ85lNmMkc7sGWn7BOyIzAYLRXS2csklLNU
 VXZJO5mQyhBr06FossJ3dYTEmZ7TRr8I1BmIvxgUHp6e6h3R1v6/IySU7
 tvUSAxTd7xxeH6EAgVnjox+xlNjmoWq/5hLEHxDjuHJK8YSpjQb0YwvKB
 M3/ZKTlw6mQ31TRvBFWC1z0EtVgGnOA9K18Z3geJOOYwyw0WJ2h0o+2QY Q==;
X-CSE-ConnectionGUID: m3YP82LMQbqyCp+pg3ZeKQ==
X-CSE-MsgGUID: ItVCJ8jzQZO2/JF40uWwXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36100069"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36100069"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:43:59 -0800
X-CSE-ConnectionGUID: RaQmheItQfyC1QD7HcRFMw==
X-CSE-MsgGUID: k667hHMXTyCgRFM7deLFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105707674"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:43:58 -0800
Date: Tue, 31 Dec 2024 18:44:49 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/16] drm/i915/ddi: initialize 128b/132b SST DP2
 VFREQ registers
Message-ID: <Z3QfgU-djiiJRvki@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <38cfa6554f8249605a8af98353f64c6b53d1d106.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38cfa6554f8249605a8af98353f64c6b53d1d106.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:34:00PM +0200, Jani Nikula wrote:
> Write the DP2 specific VFREQ registers.
> 
> This is preparation for enabling 128b/132b SST. This path is not
> reachable yet.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 64528ff8856e..91e6cd91e91f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3467,8 +3467,20 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
>  {
>  	struct intel_display *display = to_intel_display(encoder);
>  	struct intel_crtc *pipe_crtc;
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>  	int i;
>  
> +	/* 128b/132b SST */
> +	if (intel_dp_is_uhbr(crtc_state)) {
> +		const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +		u64 crtc_clock_hz = KHz(adjusted_mode->crtc_clock);
> +
> +		intel_de_write(display, TRANS_DP2_VFREQHIGH(cpu_transcoder),
> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz >> 24));
> +		intel_de_write(display, TRANS_DP2_VFREQLOW(cpu_transcoder),
> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
> +	}
> +

Nit: This could be in a helper, used by the MST encoder as well. Either way:

Reviewed-by: Imre Deak <imre.deak@intel.com>

>  	intel_ddi_enable_transcoder_func(encoder, crtc_state);
>  
>  	/* Enable/Disable DP2.0 SDP split config before transcoder */
> -- 
> 2.39.5
> 
