Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AD669086
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7B10E1E8;
	Fri, 13 Jan 2023 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19510E1E4;
 Fri, 13 Jan 2023 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673597959; x=1705133959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iT7RmMd1fDEijKpINqKWhxuTMZMzCaiWAJyZGjz4Tf4=;
 b=fqbLqeO7FcVG3m6jYZ7oW/2ywUp85oS1GV8VkVKajKlYgRmcn/IqRsJl
 Y9E3zyKMn3D175/Yl5F8mFWvFWjQhOS42ZbmwDIj3Rn2gT1U/437334Kw
 HbZAVz5kNmFL0OtUP3c3a465qjjimpFPtZk+f0FNG2is8cGVpCOe0iuZa
 aqfFuNsO6Z+9IFxK4xdvFIYNByXT9wi+d+0kZdVtkxKMOFP1h2GLY8lZz
 /IAuCUtVaQ8dtvetzQ3umuh6fmTGEclvIDMQPAQyd/2Ynvt31wOH/nhRL
 +EKMPYUybxezALn3aKYUsIoT+AD3ZN7yTU4+BYMprmc80U4uBJ2oO9pGE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="324004978"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="324004978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:19:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="782076465"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="782076465"
Received: from cbyrne6-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.27.177])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:19:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
In-Reply-To: <20230113043653.795183-2-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
 <20230113043653.795183-2-arun.r.murthy@intel.com>
Date: Fri, 13 Jan 2023 10:19:14 +0200
Message-ID: <87mt6mg83h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Enable SDP error detection configuration, this will set CRC16 in
> 128b/132b link layer.
> For DISPLAY13 a hardware bit31 in register VIDEO_DIP_CTL is added to
> enable/disable SDP CRC applicable for DP2.0 only, but the default value
> of this bit will enable CRC16 in 128b/132b hence skipping this write.
> Corrective actions on SDP corruption is yet to be defined.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h         |  1 +
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 30c55f980014..6096825a27ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -133,6 +133,7 @@ static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)
>  /* update sink rates from dpcd */
>  static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)

Based on the function name and comment, this function updates the
driver's idea of what rates the sink supports. A quick look at the code
confirms this.

It should be clear that this is not the place to add unrelated DPCD
writes.

>  {
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	static const int dp_rates[] = {
>  		162000, 270000, 540000, 810000
>  	};
> @@ -196,6 +197,18 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
>  			intel_dp->sink_rates[i++] = 1350000;
>  		if (uhbr_rates & DP_UHBR20)
>  			intel_dp->sink_rates[i++] = 2000000;
> +
> +		/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
> +		if (HAS_DP20(i915))
> +			drm_dp_dpcd_writeb(&intel_dp->aux,
> +					   DP_SDP_ERROR_DETECTION,
> +					   DP_SDP_CRC16_128B132B_EN);

HAS_DP20() means the source has DP 2.0 support.

We're in a branch where we can assume the sink also has DP 2.0
support. But at this point we're not sure we'll be using 128b/132b at
all.

I did not look this up in the spec, but I assume this bit is only
supposed to be set when we're actually using a 128b/132b link?

In which case, this should probably be enabled at some point when we're
enabling a 128b/132b link, and at that time the check to use is
intel_dp_is_uhbr(). UHBR and 128b/132b go hand-in-hand, and we won't use
UHBR unless both source and sink support it.

> +		/*
> +		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
> +		 * disable SDP CRC. This is applicable for DISPLAY 13. Default
> +		 * value of bit 31 is '0' hence discarging the write
> +		 */
> +		/* TODO: Corrective actions on SDP corruption yet to be defined */

The above might belong in the commit message, but I'm not sure about
their usefulness as comments.

>  	}
>  
>  	intel_dp->num_sink_rates = i;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 8b2cf980f323..77e265f59978 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2674,6 +2674,7 @@
>  #define   VIDEO_DIP_FREQ_2VSYNC		(2 << 16)
>  #define   VIDEO_DIP_FREQ_MASK		(3 << 16)
>  /* HSW and later: */
> +#define	  VIDEO_DISABLE_SDP_CRC		(1 << 31)

Please read the comment at the top of the file.

>  #define   VIDEO_DIP_ENABLE_DRM_GLK	(1 << 28)
>  #define   PSR_VSC_BIT_7_SET		(1 << 27)
>  #define   VSC_SELECT_MASK		(0x3 << 25)

-- 
Jani Nikula, Intel Open Source Graphics Center
