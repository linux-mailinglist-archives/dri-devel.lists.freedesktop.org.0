Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5B21BFC2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531316ED29;
	Fri, 10 Jul 2020 22:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E93F6ED24;
 Fri, 10 Jul 2020 22:24:57 +0000 (UTC)
IronPort-SDR: XKx9BmHj01jAu2x9Ppu6Tzs02mSaWT0Gl4Y0yglwdWF4hiiu8TZ7qPaSb3beKPDX4cgaotpNvK
 zWhOsRlYgfkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="136496964"
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="136496964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 15:24:56 -0700
IronPort-SDR: QTrIxQ9gFItrcLdTgCaiZz6+5IqtsmFMfnikhpSabdxGcjxuYy3sTOz0Mx24WUt/rjZyPzOLqo
 rqrfhd+yurAg==
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="269197913"
Received: from ideak-desk.fi.intel.com ([10.237.68.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 15:24:53 -0700
Date: Sat, 11 Jul 2020 01:24:47 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 2/2] drm/i915/mst: filter out the display mode exceed
 sink's capability
Message-ID: <20200710222447.GB29318@ideak-desk.fi.intel.com>
References: <20200710193144.94751-1-lyude@redhat.com>
 <20200710193144.94751-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710193144.94751-3-lyude@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: Cooper Chiou <cooper.chiou@intel.com>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 03:31:44PM -0400, Lyude Paul wrote:
> From: Lee Shawn C <shawn.c.lee@intel.com>
> 
> So far, max dot clock rate for MST mode rely on physcial
> bandwidth limitation. It would caused compatibility issue
> if source display resolution exceed MST hub output ability.
> 
> For example, source DUT had DP 1.2 output capability.
> And MST docking just support HDMI 1.4 spec. When a HDMI 2.0
> monitor connected. Source would retrieve EDID from external
> and get max resolution 4k@60fps. DP 1.2 can support 4K@60fps
> because it did not surpass DP physical bandwidth limitation.
> Do modeset to 4k@60fps, source output display data but MST
> docking can't output HDMI properly due to this resolution
> already over HDMI 1.4 spec.
> 
> Refer to commit <fcf463807596> ("drm/dp_mst: Use full_pbn
> instead of available_pbn for bandwidth checks").
> Source driver should refer to full_pbn to evaluate sink
> output capability. And filter out the resolution surpass
> sink output limitation.
> 
> Changes since v1:
> * Using mgr->base.lock to protect full_pbn.
> Changes since v2:
> * Add ctx lock.
> Changes since v3:
> * s/intel_dp_mst_mode_clock_exceed_pbn_bandwidth/
>   intel_dp_mst_mode_clock_exceeds_pbn_bw/
> * Use the new drm_connector_helper_funcs.mode_valid_ctx to properly pipe
>   down the drm_modeset_acquire_ctx that the probe helpers are using, so
>   we can safely grab &mgr->base.lock without deadlocking
> Changes since v4:
> * Move drm_dp_calc_pbn_mode(mode->clock, bpp, false) > port->full_pbn
>   check
> * Fix the bpp we use in drm_dp_calc_pbn_mode()
> * Drop leftover (!mgr) check
> * Don't check for if full_pbn is unset. To be clear - it _can_ be unset,
>   but if it is then it's certainly a bug in DRM or a non-compliant sink
>   as full_pbn should always be populated by the time we call
>   ->mode_valid_ctx.
>   We should workaround non-compliant sinks with full_pbn=0, but that
>   should happen in the DP MST helpers so we can estimate the full_pbn
>   value as best we can.

I guess when the connector gets unplugged full_pbn would also get reset
but pruning all modes in that case is ok.

> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Co-developed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-and-tested-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 55 ++++++++++++++-------
>  1 file changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index bdc19b04b2c10..a2d91a4997001 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -639,39 +639,60 @@ static int intel_dp_mst_get_modes(struct drm_connector *connector)
>  	return intel_dp_mst_get_ddc_modes(connector);
>  }
>  
> -static enum drm_mode_status
> -intel_dp_mst_mode_valid(struct drm_connector *connector,
> -			struct drm_display_mode *mode)
> +static int
> +intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
> +			    struct drm_display_mode *mode,
> +			    struct drm_modeset_acquire_ctx *ctx,
> +			    enum drm_mode_status *status)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->dev);
>  	struct intel_connector *intel_connector = to_intel_connector(connector);
>  	struct intel_dp *intel_dp = intel_connector->mst_port;
> +	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
> +	struct drm_dp_mst_port *port = intel_connector->port;
> +	const int min_bpp = 18;
>  	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
>  	int max_rate, mode_rate, max_lanes, max_link_clock;
> +	int ret;
>  
> -	if (drm_connector_is_unregistered(connector))
> -		return MODE_ERROR;
> +	if (drm_connector_is_unregistered(connector)) {
> +		*status = MODE_ERROR;
> +		return 0;
> +	}
>  
> -	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> -		return MODE_NO_DBLESCAN;
> +	if (mode->flags & DRM_MODE_FLAG_DBLSCAN) {
> +		*status = MODE_NO_DBLESCAN;
> +		return 0;
> +	}
>  
>  	max_link_clock = intel_dp_max_link_rate(intel_dp);
>  	max_lanes = intel_dp_max_lane_count(intel_dp);
>  
>  	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
> -	mode_rate = intel_dp_link_required(mode->clock, 18);
> +	mode_rate = intel_dp_link_required(mode->clock, min_bpp);
>  
> -	/* TODO - validate mode against available PBN for link */
> -	if (mode->clock < 10000)
> -		return MODE_CLOCK_LOW;
> +	ret = drm_modeset_lock(&mgr->base.lock, ctx);
> +	if (ret)
> +		return ret;
>  
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		return MODE_H_ILLEGAL;
> +	if (mode_rate > max_rate || mode->clock > max_dotclk ||
> +	    drm_dp_calc_pbn_mode(mode->clock, min_bpp, false) > port->full_pbn) {
> +		*status = MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +
> +	if (mode->clock < 10000) {
> +		*status = MODE_CLOCK_LOW;
> +		return 0;
> +	}
>  
> -	if (mode_rate > max_rate || mode->clock > max_dotclk)
> -		return MODE_CLOCK_HIGH;
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK) {
> +		*status = MODE_H_ILLEGAL;
> +		return 0;
> +	}
>  
> -	return intel_mode_valid_max_plane_size(dev_priv, mode);
> +	*status = intel_mode_valid_max_plane_size(dev_priv, mode);
> +	return 0;
>  }
>  
>  static struct drm_encoder *intel_mst_atomic_best_encoder(struct drm_connector *connector,
> @@ -700,7 +721,7 @@ intel_dp_mst_detect(struct drm_connector *connector,
>  
>  static const struct drm_connector_helper_funcs intel_dp_mst_connector_helper_funcs = {
>  	.get_modes = intel_dp_mst_get_modes,
> -	.mode_valid = intel_dp_mst_mode_valid,
> +	.mode_valid_ctx = intel_dp_mst_mode_valid_ctx,
>  	.atomic_best_encoder = intel_mst_atomic_best_encoder,
>  	.atomic_check = intel_dp_mst_atomic_check,
>  	.detect_ctx = intel_dp_mst_detect,
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
