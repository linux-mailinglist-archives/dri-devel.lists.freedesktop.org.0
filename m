Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D792740F813
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271AC6EC6A;
	Fri, 17 Sep 2021 12:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AC26EC6A;
 Fri, 17 Sep 2021 12:40:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="220904918"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="220904918"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="554625953"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 17 Sep 2021 05:40:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 15:40:35 +0300
Date: Fri, 17 Sep 2021 15:40:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 01/13] drm/dp: add DP 2.0 UHBR link rate and bw code
 conversions
Message-ID: <YUSMwx5T8FamQt6R@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <cab4edda8834d6b4db610fabb5e1f1f18ae33c2c.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cab4edda8834d6b4db610fabb5e1f1f18ae33c2c.1631191763.git.jani.nikula@intel.com>
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

On Thu, Sep 09, 2021 at 03:51:53PM +0300, Jani Nikula wrote:
> The bw code equals link_rate / 0.27 Gbps only for 8b/10b link
> rates. Handle DP 2.0 UHBR rates as special cases, though this is not
> pretty.
> 
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

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
> 2.30.2

-- 
Ville Syrjälä
Intel
