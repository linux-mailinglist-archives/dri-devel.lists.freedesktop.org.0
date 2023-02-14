Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FF695F1F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583F210E839;
	Tue, 14 Feb 2023 09:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630D610E842;
 Tue, 14 Feb 2023 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676366872; x=1707902872;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9ZX7AkkTgg6rmPCyohZ5FwOQx0WzKSZVl7gEyiPN/pQ=;
 b=apIRrWjUduDrqkhWM/o/kxKvbVYqOZqnlSfrwfW4U1lI5G/q+0hMGdBB
 sq+IVsX3zPtHL13EmXBJ2YhzYFs6Zw0puyHATEp1ehoNHn33g+B3UGpE1
 VMmCdDIAxZfurXnqX9v7dw0WqhzcATffgdkYIvUG35J49M9vvYZTqsX01
 p6FEILYDaboa3y4TyQIPzZ/BLEnqNPTYEzoIr4GontTTCwNNsPnBqZJQy
 bOHFRyE6BlkBqKoKD6LN21oMcu2oBXAdd1zMPdpJLzBDZQ2FEdKTrYcAj
 PaU6zeA6lMxKeIwq7n9oC32lXSLW8cWjX2wy5zwKHkey5M27Q4dGinYuX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329746551"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="329746551"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:27:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669104946"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="669104946"
Received: from skalyan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.13])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:27:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv3 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
In-Reply-To: <20230207052657.2917314-3-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120061600.1451088-1-arun.r.murthy@intel.com>
 <20230207052657.2917314-1-arun.r.murthy@intel.com>
 <20230207052657.2917314-3-arun.r.murthy@intel.com>
Date: Tue, 14 Feb 2023 11:27:47 +0200
Message-ID: <87edqstx4c.fsf@intel.com>
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

On Tue, 07 Feb 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
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

It's still in intel_dp_start_link_train()...?

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
