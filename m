Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C584220A2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801096EB36;
	Tue,  5 Oct 2021 08:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C7B6EB36;
 Tue,  5 Oct 2021 08:23:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="205807463"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="205807463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 01:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="457985768"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 05 Oct 2021 01:23:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 11:23:55 +0300
Date: Tue, 5 Oct 2021 11:23:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/dp: add drm_dp_phy_name() for getting DP PHY name
Message-ID: <YVwLm+Akrbx9ZAG/@intel.com>
References: <20211005081053.13729-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005081053.13729-1-jani.nikula@intel.com>
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

On Tue, Oct 05, 2021 at 11:10:52AM +0300, Jani Nikula wrote:
> Add a helper for getting the DP PHY name. In the interest of caller
> simplicity and to avoid allocations and passing in of buffers, duplicate
> the const strings to return. It's a minor penalty to pay for simplicity
> in all the call sites.

Yeah, the on stack extra buffer is getting a bit annoying, especially
with the calls multiplying like rabbits in my recent patches.

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 21 +++++++++++++++++++++
>  include/drm/drm_dp_helper.h     |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 4d0d1e8e51fa..f1d03b5a4bab 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -197,6 +197,27 @@ void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
>  
> +const char *drm_dp_phy_name(enum drm_dp_phy dp_phy)
> +{
> +	static const char * const phy_names[] = {
> +		[DP_PHY_DPRX] = "DPRX",
> +		[DP_PHY_LTTPR1] = "LTTPR 1",
> +		[DP_PHY_LTTPR2] = "LTTPR 2",
> +		[DP_PHY_LTTPR3] = "LTTPR 3",
> +		[DP_PHY_LTTPR4] = "LTTPR 4",
> +		[DP_PHY_LTTPR5] = "LTTPR 5",
> +		[DP_PHY_LTTPR6] = "LTTPR 6",
> +		[DP_PHY_LTTPR7] = "LTTPR 7",
> +		[DP_PHY_LTTPR8] = "LTTPR 8",
> +	};
> +
> +	if (dp_phy < 0 || dp_phy >= ARRAY_SIZE(phy_names))
> +		return "<INVALID DP PHY>";
> +
> +	return phy_names[dp_phy];
> +}
> +EXPORT_SYMBOL(drm_dp_phy_name);
> +
>  void drm_dp_lttpr_link_train_clock_recovery_delay(void)
>  {
>  	usleep_range(100, 200);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index b52df4db3e8f..c873e6349b41 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -2115,6 +2115,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
>  				const struct drm_dp_desc *desc);
>  int drm_dp_read_sink_count(struct drm_dp_aux *aux);
>  
> +const char *drm_dp_phy_name(enum drm_dp_phy dp_phy);
> +
>  int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
>  				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>  int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
