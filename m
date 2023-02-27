Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE726A3ED7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A7D10E39D;
	Mon, 27 Feb 2023 09:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBECE10E39D;
 Mon, 27 Feb 2023 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677491803; x=1709027803;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9RTDZF+4wOriTd8bad/dHoXs2QIpvznMTebkDcRjnK4=;
 b=bsbrlahD8GaRY9mwqQYGGvkGRnu47IfqCQloQYwhZvLcekSpxg2jKvLn
 3XOTsaLk9AprpBBGkMOe4RDj6T/h2Nq9RalJHF+uo2FFznxCIUlUWR9Iu
 ZfX6E5BkBeCpk+Pog1xFQgR4rC4WlI5wHJFMHwQO3bAJSwsk93fJK7m3A
 v8eyI7L2HZvioQTsWcfbbijBycOkSWux5hiTJtAycAqC+Ud/vf+TFrvOq
 sWohPe8oUJeGaRYq/p/ekFIfAP6bhu126A1EUTBlv7HtkP94JYcvnpkEQ
 618qUpB4U4kykdwQLULcMQkvsAhj13beDH9lEHhM3MPY94S/sSJI3ZV2t w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="317623230"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="317623230"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:56:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="797556429"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="797556429"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:56:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b
 link layer
In-Reply-To: <20230214093459.3617293-3-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230214093459.3617293-1-arun.r.murthy@intel.com>
 <20230214093459.3617293-3-arun.r.murthy@intel.com>
Date: Mon, 27 Feb 2023 11:56:37 +0200
Message-ID: <87fsar2zze.fsf@intel.com>
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

On Tue, 14 Feb 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Enable SDP error detection configuration, this will set CRC16 in
> 128b/132b link layer.
> For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
> added to enable/disable SDP CRC applicable for DP2.0 only, but the
> default value of this bit will enable CRC16 in 128b/132b hence
> skipping this write.
> Corrective actions on SDP corruption is yet to be defined.
>
> v2: Moved the CRC enable to link training init(Jani N)
> v3: Moved crc enable to ddi pre enable <Jani N>
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 254559abedfb..fa995341614d 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2330,6 +2330,18 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  				 crtc_state->port_clock,
>  				 crtc_state->lane_count);
>  
> +	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
> +	if (intel_dp_is_uhbr(crtc_state))
> +		drm_dp_dpcd_writeb(&intel_dp->aux,
> +				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
> +				   DP_SDP_CRC16_128B132B_EN);
> +		/*
> +		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
> +		 * disable SDP CRC. This is applicable for Display version 13.
> +		 * Default value of bit 31 is '0' hence discarding the write
> +		 */
> +		/* TODO: Corrective actions on SDP corruption yet to be defined */
> +

So yeah, I told you to do this in this function. But look at the
surroundings, does it look like a direct drm_dp_dpcd_writeb() call fits
here?

tgl_ddi_pre_enable_dp() is a function that calls functions, and doesn't
bother with any details. No register or DPCD reads or writes.

Sure, it's a matter of style, and I hate to feel like I'm pushing you
around with this. But the above really needs to be in a separate
function when it's done in tgl_ddi_pre_enable_dp().

It'll also help with placing the comments. You can have *one* block
comment above the function with all the details, TODO notes and
everything, indented at the top level. (Above, the comments are indented
as if they were within a {} block.)

BR,
Jani.




>  	/*
>  	 * We only configure what the register value will be here.  Actual
>  	 * enabling happens during link training farther down.

-- 
Jani Nikula, Intel Open Source Graphics Center
