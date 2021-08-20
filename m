Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C844D3F3236
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 19:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BA66EAD7;
	Fri, 20 Aug 2021 17:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DCF6EAD7;
 Fri, 20 Aug 2021 17:26:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="302399556"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="302399556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 10:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="463445143"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 20 Aug 2021 10:26:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 20:26:14 +0300
Date: Fri, 20 Aug 2021 20:26:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Imre Deak <imre.deak@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <seanpaul@chromium.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/i915/dp: Use max params for panels < eDP 1.4
Message-ID: <YR/ltlF5jRTYzQ3F@intel.com>
References: <20210820075301.693099-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210820075301.693099-1-kai.heng.feng@canonical.com>
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

On Fri, Aug 20, 2021 at 03:52:59PM +0800, Kai-Heng Feng wrote:
> Users reported that after commit 2bbd6dba84d4 ("drm/i915: Try to use
> fast+narrow link on eDP again and fall back to the old max strategy on
> failure"), the screen starts to have wobbly effect.
> 
> Commit a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for
> everything") doesn't help either, that means the affected eDP 1.2 panels
> only work with max params.
> 
> So use max params for panels < eDP 1.4 as Windows does to solve the
> issue.
> 
> v3:
>  - Do the eDP rev check in intel_edp_init_dpcd()
> 
> v2:
>  - Check eDP 1.4 instead of DPCD 1.1 to apply max params
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3714
> Fixes: 2bbd6dba84d4 ("drm/i915: Try to use fast+narrow link on eDP again and fall back to the old max strategy on failure")
> Fixes: a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for everything")
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Slapped a cc:stable on it and pushed to drm-intel-next. Thanks.

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 75d4ebc669411..e0dbd35ae7bc0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2445,11 +2445,14 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  	 */
>  	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
>  			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) ==
> -			     sizeof(intel_dp->edp_dpcd))
> +			     sizeof(intel_dp->edp_dpcd)) {
>  		drm_dbg_kms(&dev_priv->drm, "eDP DPCD: %*ph\n",
>  			    (int)sizeof(intel_dp->edp_dpcd),
>  			    intel_dp->edp_dpcd);
>  
> +		intel_dp->use_max_params = intel_dp->edp_dpcd[0] < DP_EDP_14;
> +	}
> +
>  	/*
>  	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
>  	 * for SET_POWER_CAPABLE bit in intel_dp->edp_dpcd[1]
> -- 
> 2.32.0

-- 
Ville Syrjälä
Intel
