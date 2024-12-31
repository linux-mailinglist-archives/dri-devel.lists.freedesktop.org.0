Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B29FF0C1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 17:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9598510E698;
	Tue, 31 Dec 2024 16:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2YTlOMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD7E10E08F;
 Tue, 31 Dec 2024 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735663874; x=1767199874;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=iAe/viURDVQHjC2BaD++C6/uL/4ibps8YVWfHdQdxhw=;
 b=Y2YTlOMC7aHqGl95aegVvWk7lFbGYJoiamPBnEo4wAOSNOKJRANu4Z6T
 7snhvzf/ksQJPKtEsNSgKXQNAnFeE+D3EliP8dTrZ4++3v1uNgHkc8xbK
 hqlhsC6NaYDvTEBk6SIYvcZGZZ8rjPhXbJcOI9BEJQNllfIUc+36lD03Q
 axR7cWUiGLw0xpkrcdUGfs3Kkh6dLRbfvIMLeNaIC62xC7dl4ys6MEYBo
 QND8IcgqclzCeD5+coRcNwVmdGg45jKqkdKRxKh7xNR87TQMKEiQz5NzP
 PUZZT6BsSLfTjcLcm8YPBw6aVTqSAHQ6fPN4TKGO+LbDI33sRrERt+cpC g==;
X-CSE-ConnectionGUID: i+DfiXBqRiaV4jqxB2QK5g==
X-CSE-MsgGUID: IYu7RIgmSWyTWADTzRlI4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36165951"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36165951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:51:13 -0800
X-CSE-ConnectionGUID: ONrchEwXSqKUQ18ZkQKdjg==
X-CSE-MsgGUID: D6uNYdrNSA2cTsNeaHZPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="100943136"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:51:12 -0800
Date: Tue, 31 Dec 2024 18:52:03 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/16] drm/i915/ddi: initialize 128b/132b SST DP2
 VFREQ registers
Message-ID: <Z3QhMxIylsbgAN-2@ideak-desk.fi.intel.com>
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

Hm, not sure how this would work on HDMI (FRL), but to be sure shouldn't
this check that crtc_state is for a DP (SST) mode?

> +		const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +		u64 crtc_clock_hz = KHz(adjusted_mode->crtc_clock);
> +
> +		intel_de_write(display, TRANS_DP2_VFREQHIGH(cpu_transcoder),
> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz >> 24));
> +		intel_de_write(display, TRANS_DP2_VFREQLOW(cpu_transcoder),
> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
> +	}
> +
>  	intel_ddi_enable_transcoder_func(encoder, crtc_state);
>  
>  	/* Enable/Disable DP2.0 SDP split config before transcoder */
> -- 
> 2.39.5
> 
