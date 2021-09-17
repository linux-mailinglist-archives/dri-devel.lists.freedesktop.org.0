Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321540F824
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179B06EC6F;
	Fri, 17 Sep 2021 12:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126389E5B;
 Fri, 17 Sep 2021 12:41:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="245185418"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="245185418"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 05:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="472268386"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 17 Sep 2021 05:41:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 15:41:45 +0300
Date: Fri, 17 Sep 2021 15:41:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 06/13] drm/i915/dp: add helper for checking for UHBR
 link rate
Message-ID: <YUSNCSQjzWjr62WV@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <fe9a222ad900da797c989de9f7fa13928d2c9861.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe9a222ad900da797c989de9f7fa13928d2c9861.1631191763.git.jani.nikula@intel.com>
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

On Thu, Sep 09, 2021 at 03:51:58PM +0300, Jani Nikula wrote:
> Helpful abstraction to avoid duplication.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 ++++++
>  drivers/gpu/drm/i915/display/intel_dp.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index d28bd8c4a8a5..d189d95e4450 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -115,6 +115,12 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
>  static void intel_dp_unset_edid(struct intel_dp *intel_dp);
>  static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
>  
> +/* Is link rate UHBR and thus 128b/132b? */
> +bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
> +{
> +	return crtc_state->port_clock >= 1000000;
> +}
> +
>  /* update sink rates from dpcd */
>  static void intel_dp_set_sink_rates(struct intel_dp *intel_dp)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index a28fff286c21..94b568704b22 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -58,6 +58,7 @@ int intel_dp_compute_config(struct intel_encoder *encoder,
>  			    struct intel_crtc_state *pipe_config,
>  			    struct drm_connector_state *conn_state);
>  bool intel_dp_is_edp(struct intel_dp *intel_dp);
> +bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
>  bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port port);
>  enum irqreturn intel_dp_hpd_pulse(struct intel_digital_port *dig_port,
>  				  bool long_hpd);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
