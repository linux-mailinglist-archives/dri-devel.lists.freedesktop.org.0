Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3969872E7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 13:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E167610EABB;
	Thu, 26 Sep 2024 11:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgQIh1yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C44D10EABB;
 Thu, 26 Sep 2024 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727350603; x=1758886603;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fHmYhOAmYa508Jm4yd6j89kvwHkQ+TbtMfwycE9dsHw=;
 b=XgQIh1yu63Kuumq6KcAgRNuTKizzDFZTvQB6pTtvRZAPjHzC/NhQaA46
 kD/2Nt7DSdy1cyT4bCMAt2a+WLd3e/dQEQFpsMvvAOrrkwUQEIwfwx+Zd
 OFORTG1rrdE2XrRC5BRHm1KnC7nAwxYulVW71Rexz8wOSr1mubY9L5cs7
 peVfzv0Cm3hD+fDZgjHJDgHAPrAPMZza72aBVkxTsr5+bUoc8fLEVfpZF
 wirAiN9H3ahR3DFSMgs0Rw5ZcOXZXtdxbTV4EH09QNTZEVs8E5ClFqEGt
 qfVmjxwTUwXL8tMT6JsMz4H9EMnwYrHlqf852IPANGRVkWxopZXKiA0fd g==;
X-CSE-ConnectionGUID: 21h68YPcRgOjxn48e/DPnw==
X-CSE-MsgGUID: h7wNLuWVQbKd0imCBry9NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25909217"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="25909217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:36:37 -0700
X-CSE-ConnectionGUID: OF0SFb4CTNeLg+IWLALe1Q==
X-CSE-MsgGUID: vHqYSLSyT86pLvfGX93fFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76485613"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:36:34 -0700
Date: Thu, 26 Sep 2024 14:37:01 +0300
From: Imre Deak <imre.deak@intel.com>
To: Benjamin Hoefs <bendhoefs@gmail.com>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i915: Fix HBLANK Expansion Quirk Causing Modeset Failure
 on Dell WD19TB Dock at 3440x1440@100Hz
Message-ID: <ZvVHXbK2Swxpjehy@ideak-desk.fi.intel.com>
References: <20240926002533.10153-2-bendhoefs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926002533.10153-2-bendhoefs@gmail.com>
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

On Wed, Sep 25, 2024 at 07:25:34PM -0500, Benjamin Hoefs wrote:
> Hello,
> 
> I am using a Dell WD19TB dock with a 3440x1440 monitor. Using it at
> 100Hz used to work but recently I tried it again and discovered it no longer
> did, specifically the modeset seems to silently fail with no error message in
> userspace utilities like kscreen-doctor and xrandr and no output in dmesg.
> I found the problematic commit using git bisect to be
> 55eaef164174480df6827edeac15620f3cbcd52b "Handle the Synaptics HBlank
> expansion quirk".
> 
> I found the issue to be the hblank_expasion_quirk_needs_dsc function which uses
> the following comparison in the current kernel tree:
> 
> if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
> 	return false;
> 
> with hblank_limit being earlier set as
> 
> int hblank_limit = is_uhbr_sink ? 500 : 300;
> 
> However, my monitor's HBLANK period in the 3440x1440@100Hz mode is
> exactly 300 ns as verified by this printk immediately before the
> problematic comparison.
> 
> printk(KERN_INFO "Hello, kernel world! %i\n",
> 	mode_hblank_period_ns(adjusted_mode));
> [   38.429839] Hello, kernel world! 300
> 
> With the attached change the modeset works as expected at 100Hz. Would it be
> acceptable to modify the comparison from > to >= here?
> 
> I'll do my best to provide any additional details you may need although
> that printk and '=' sign is the only kernel code I've written, so my best may
> not be great :).
> 
> Signed-off-by: Benjamin D. Hoefs <bendhoefs@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 15541932b809..052c5a67df93 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -446,7 +446,7 @@ hblank_expansion_quirk_needs_dsc(const struct intel_connector *connector,
>  	if (is_uhbr_sink && !drm_dp_is_uhbr_rate(limits->max_rate))
>  		return false;
>  
> -	if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
> +	if (mode_hblank_period_ns(adjusted_mode) >= hblank_limit)
>  		return false;

Disabling DSC this way could make another mode with the same hblank
period not work. This mode would require DSC in any case if there is a
link BW limitation, so would need to check why DSC is failing. Could you
open a ticket at:

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/new

attaching a dmesg log booting with drm.debug=0x15e?

Thanks,
Imre

>  
>  	return true;
> -- 
> 2.46.2
> 
