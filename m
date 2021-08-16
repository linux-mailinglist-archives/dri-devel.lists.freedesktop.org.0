Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F423EDB26
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 18:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898C89F8E;
	Mon, 16 Aug 2021 16:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3059189F8E;
 Mon, 16 Aug 2021 16:42:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="279637450"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279637450"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 09:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="519724593"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 16 Aug 2021 09:42:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Aug 2021 19:42:30 +0300
Date: Mon, 16 Aug 2021 19:42:30 +0300
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/dp: Use max params for older panels
Message-ID: <YRqVdjxMv3R+XbF+@intel.com>
References: <20210804152408.584823-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210804152408.584823-1-kai.heng.feng@canonical.com>
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

On Wed, Aug 04, 2021 at 11:24:02PM +0800, Kai-Heng Feng wrote:
> Users reported that after commit 2bbd6dba84d4 ("drm/i915: Try to use
> fast+narrow link on eDP again and fall back to the old max strategy on
> failure"), the screen starts to have wobbly effect.
> 
> Commit a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for
> everything") doesn't help either, that means the affected panels only
> work with max params.

Unfortunate that the link training apparently passes with the bad
params and thus the automagic use_max_params fallback doesn't kick in
:(

> 
> The panels are all DP 1.1 ones, so apply max params to them to resolve
> the issue.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3714
> Fixes: 2bbd6dba84d4 ("drm/i915: Try to use fast+narrow link on eDP again and fall back to the old max strategy on failure")
> Fixes: a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for everything")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 75d4ebc669411..e64bab4b016e1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1330,14 +1330,16 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>  	limits.min_bpp = intel_dp_min_bpp(pipe_config->output_format);
>  	limits.max_bpp = intel_dp_max_bpp(intel_dp, pipe_config);
>  
> -	if (intel_dp->use_max_params) {
> +	if (intel_dp->use_max_params ||
> +	    intel_dp->dpcd[DP_DPCD_REV] <= DP_DPCD_REV_11) {

IIRC Windows uses the optimal link rate only for EPD_REV>=1.4.
We should probably do the same the minimize future headaches.

>  		/*
>  		 * Use the maximum clock and number of lanes the eDP panel
>  		 * advertizes being capable of in case the initial fast
> -		 * optimal params failed us. The panels are generally
> -		 * designed to support only a single clock and lane
> -		 * configuration, and typically on older panels these
> -		 * values correspond to the native resolution of the panel.
> +		 * optimal params failed us or the panel is DP 1.1 or earlier.
> +		 * The panels are generally designed to support only a single
> +		 * clock and lane configuration, and typically on older panels
> +		 * these values correspond to the native resolution of the
> +		 * panel.
>  		 */
>  		limits.min_lane_count = limits.max_lane_count;
>  		limits.min_clock = limits.max_clock;
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
