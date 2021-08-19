Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836C3F1E5B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 18:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D796E9A7;
	Thu, 19 Aug 2021 16:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2BA6E9A7;
 Thu, 19 Aug 2021 16:51:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="213476815"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="213476815"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 09:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="506158658"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 19 Aug 2021 09:51:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 19:51:35 +0300
Date: Thu, 19 Aug 2021 19:51:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, manasi.d.navare@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/17] drm/dp: add DP 2.0 UHBR link rate and bw code
 conversions
Message-ID: <YR6MF0H+crPQR82T@intel.com>
References: <cover.1629310010.git.jani.nikula@intel.com>
 <f51b67be0aa963ee2d4a2edeb7a070fd3254200b.1629310010.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f51b67be0aa963ee2d4a2edeb7a070fd3254200b.1629310010.git.jani.nikula@intel.com>
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

On Wed, Aug 18, 2021 at 09:10:36PM +0300, Jani Nikula wrote:
> The bw code equals link_rate / 0.27 Gbps only for 8b/10b link
> rates. Handle DP 2.0 UHBR rates as special cases, though this is not
> pretty.

Ugh. So if I'm reading the spec right the behaviour of this
register now changes dynamically depending on the state of
some other bit in another register?

> 
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 6d0f2c447f3b..9b2a2961fca8 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -207,15 +207,33 @@ EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
>  
>  u8 drm_dp_link_rate_to_bw_code(int link_rate)
>  {
> -	/* Spec says link_bw = link_rate / 0.27Gbps */
> -	return link_rate / 27000;
> +	switch (link_rate) {
> +	case 1000000:
> +		return DP_LINK_BW_10;
> +	case 1350000:
> +		return DP_LINK_BW_13_5;
> +	case 2000000:
> +		return DP_LINK_BW_20;
> +	default:
> +		/* Spec says link_bw = link_rate / 0.27Gbps */
> +		return link_rate / 27000;
> +	}
>  }
>  EXPORT_SYMBOL(drm_dp_link_rate_to_bw_code);
>  
>  int drm_dp_bw_code_to_link_rate(u8 link_bw)
>  {
> -	/* Spec says link_rate = link_bw * 0.27Gbps */
> -	return link_bw * 27000;
> +	switch (link_bw) {
> +	case DP_LINK_BW_10:
> +		return 1000000;
> +	case DP_LINK_BW_13_5:
> +		return 1350000;
> +	case DP_LINK_BW_20:
> +		return 2000000;
> +	default:
> +		/* Spec says link_rate = link_bw * 0.27Gbps */
> +		return link_bw * 27000;
> +	}
>  }
>  EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
>  
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
