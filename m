Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383167CF54
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A66D10E137;
	Thu, 26 Jan 2023 15:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9389110E137;
 Thu, 26 Jan 2023 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674745782; x=1706281782;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3Q710a4bqKm8pegZyHRFEOiSZ9RbPCWOZqnH7KZaWgc=;
 b=S98T6GVLM79oB0fNF6IQMMDQg7xuEENJc2EBeSFopmYT59oMLSOUwxrw
 Iab+53ZR5t2jRZq3wftqlx/3cHtmgrfB8XiAq4/29ZdhHqsAns/tPGZLh
 nCe+t4hlk+5G2VVWmLy9tlupATfe0FnWtVXVEbZIcH2nOLeRNnM7gcfr7
 QgkUANGK7+tuSOYRvOFRRXCWIwos5BqZujXMuAhhQD01Mor9SIxINFglm
 GfuP/f0aEH+gap9JZhb/fKF4hYyxp0Cp4VuJW/yeAnistwT3bbN7zpbp4
 hDb+vWb9zntUF/931MdZX/zEjb1Tp9+oLSWyAT3N/scKOQgarqfE6iWjw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328099508"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="328099508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 07:00:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="771164157"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="771164157"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 07:00:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b
 link layer
In-Reply-To: <20230120061600.1451088-3-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120061600.1451088-1-arun.r.murthy@intel.com>
 <20230120061600.1451088-3-arun.r.murthy@intel.com>
Date: Thu, 26 Jan 2023 17:00:14 +0200
Message-ID: <875yct5ojl.fsf@intel.com>
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

On Fri, 20 Jan 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Enable SDP error detection configuration, this will set CRC16 in
> 128b/132b link layer.
> For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
> added to enable/disable SDP CRC applicable for DP2.0 only, but the
> default value of this bit will enable CRC16 in 128b/132b hence
> skipping this write.
> Corrective actions on SDP corruption is yet to be defined.
>
> v2: Moved the CRC enable to link training init(Jani N)

Yeah, well, I said where this doesn't belong, and I don't think it
really belongs here either. :(

It has nothing to do with link training or intel_dp_start_link_train().

Alas, I'm not really sure what the right place is, I just know this
isn't it. The specs don't give us any clues. The DP specs says
absolutely nothing about when this could or should be written.

*Maybe* in intel_ddi_pre_enable() or intel_mst_pre_enable_dp()? Before
sending any SDPs.


BR,
Jani.

>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 3d3efcf02011..7064e465423b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1453,4 +1453,16 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
>  
>  	if (!passed)
>  		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
> +
> +	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
> +	if (intel_dp_is_uhbr(crtc_state) && passed)
> +		drm_dp_dpcd_writeb(&intel_dp->aux,
> +				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
> +				   DP_SDP_CRC16_128B132B_EN);
> +		/*
> +		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
> +		 * disable SDP CRC. This is applicable for Display version 13.
> +		 * Default value of bit 31 is '0' hence discarding the write
> +		 */
> +		/* TODO: Corrective actions on SDP corruption yet to be defined */
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
