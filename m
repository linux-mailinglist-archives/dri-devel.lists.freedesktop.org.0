Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75433768B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 16:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBCD6EDAC;
	Thu, 11 Mar 2021 15:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2CA6EDAC;
 Thu, 11 Mar 2021 15:09:27 +0000 (UTC)
IronPort-SDR: c///e+9CActNoxTbdlpmruOdEW7mh7X5v5bSNYgGyWGy+t16OjurP9tOadwyIU1p6XZNNJSJbf
 o/RLuiZM4AFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="186300170"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="186300170"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 07:09:27 -0800
IronPort-SDR: ZwPoRMVfiEXzVlmFUxumrG6I6W+Jy9IJwYybXSOuNIpC1+po6mh6YtrXJqddDAP1nf86ZNaDQS
 MqIsr8Wj4j1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="387039162"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 11 Mar 2021 07:09:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Mar 2021 17:09:22 +0200
Date: Thu, 11 Mar 2021 17:09:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/dp_link_training: Convert
 DRM_DEBUG_KMS to drm_dbg_kms
Message-ID: <YEoyoqXvHboRJ1AW@intel.com>
References: <20210310214845.29021-1-sean@poorly.run>
 <20210310214845.29021-2-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310214845.29021-2-sean@poorly.run>
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 04:47:57PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> =

> One instance of DRM_DEBUG_KMS was leftover in dp_link_training, convert
> it to the new shiny.
> =

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index ad02d493ec16..19ba7c7cbaab 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -26,12 +26,13 @@
>  #include "intel_dp_link_training.h"
>  =

>  static void
> -intel_dp_dump_link_status(const u8 link_status[DP_LINK_STATUS_SIZE])
> +intel_dp_dump_link_status(struct drm_device *drm,

I'd generally pass 'i915' rather than the drm_device to
any i915 specific function. But doesn't really matter here since
we just pass is straight through anyway.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +			  const u8 link_status[DP_LINK_STATUS_SIZE])
>  {
> -
> -	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x=
%x adj_req2_3:0x%x\n",
> -		      link_status[0], link_status[1], link_status[2],
> -		      link_status[3], link_status[4], link_status[5]);
> +	drm_dbg_kms(drm,
> +		    "ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_re=
q2_3:0x%x\n",
> +		    link_status[0], link_status[1], link_status[2],
> +		    link_status[3], link_status[4], link_status[5]);
>  }
>  =

>  static void intel_dp_reset_lttpr_count(struct intel_dp *intel_dp)
> @@ -642,7 +643,7 @@ intel_dp_link_training_channel_equalization(struct in=
tel_dp *intel_dp,
>  		/* Make sure clock is still ok */
>  		if (!drm_dp_clock_recovery_ok(link_status,
>  					      crtc_state->lane_count)) {
> -			intel_dp_dump_link_status(link_status);
> +			intel_dp_dump_link_status(&i915->drm, link_status);
>  			drm_dbg_kms(&i915->drm,
>  				    "Clock recovery check failed, cannot "
>  				    "continue channel equalization\n");
> @@ -669,7 +670,7 @@ intel_dp_link_training_channel_equalization(struct in=
tel_dp *intel_dp,
>  =

>  	/* Try 5 times, else fail and try at lower BW */
>  	if (tries =3D=3D 5) {
> -		intel_dp_dump_link_status(link_status);
> +		intel_dp_dump_link_status(&i915->drm, link_status);
>  		drm_dbg_kms(&i915->drm,
>  			    "Channel equalization failed 5 times\n");
>  	}
> -- =

> Sean Paul, Software Engineer, Google / Chromium OS
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
