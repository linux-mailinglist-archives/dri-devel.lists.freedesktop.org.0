Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A8217B9A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 01:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420D6E181;
	Tue,  7 Jul 2020 23:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D5A6E181;
 Tue,  7 Jul 2020 23:12:37 +0000 (UTC)
IronPort-SDR: 6nvFpUnpy3DOmUFXzoGIfNR1y/hcFiUdnvKWncPrM2dQmwKKkvEcodPhs4sTkzqVUVjcYj6PaP
 4E7cTWZrvd0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147714265"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147714265"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 16:12:36 -0700
IronPort-SDR: BTtvrTuI7Rq/6kKI1tRiK0WsR/JhgkaBU0FlPiow27t0jKe11+R3Qyo1VIiwfgZxJLP4zTQsFV
 FnYJJDW1+gdg==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="427637462"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 16:12:34 -0700
Date: Wed, 8 Jul 2020 02:12:29 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/mst: filter out the display
 mode exceed sink's capability
Message-ID: <20200707231229.GB22747@ideak-desk.fi.intel.com>
References: <20200526182313.4005-1-lyude@redhat.com>
 <20200526182313.4005-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526182313.4005-3-lyude@redhat.com>
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
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 02:23:10PM -0400, Lyude Paul wrote:
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
> v2: Using mgr->base.lock to protect full_pbn.
> v3: Add ctx lock.
> v4:
> * s/intel_dp_mst_mode_clock_exceed_pbn_bandwidth/
>   intel_dp_mst_mode_clock_exceeds_pbn_bw/
> * Use the new drm_connector_helper_funcs.mode_valid_ctx to properly pipe
>   down the drm_modeset_acquire_ctx that the probe helpers are using, so
>   we can safely grab &mgr->base.lock without deadlocking
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Co-developed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 39 ++++++++++++++++++---
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index d18b406f2a7d2..cf052095ad785 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -610,15 +610,42 @@ static int intel_dp_mst_get_modes(struct drm_connector *connector)
>  	return intel_dp_mst_get_ddc_modes(connector);
>  }
>  
> +static int
> +intel_dp_mst_mode_clock_exceeds_pbn_bw(struct drm_connector *connector,
> +				       struct drm_modeset_acquire_ctx *ctx,
> +				       int clock, int bpp)
> +{
> +	struct intel_connector *intel_connector = to_intel_connector(connector);
> +	struct intel_dp *intel_dp = intel_connector->mst_port;
> +	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
> +	struct drm_dp_mst_port *port = (to_intel_connector(connector))->port;

					intel_connector

> +	int ret = MODE_OK;
> +
> +	if (!mgr)

As a NULL check this would be bogus, but also connector->mst_port and so
mst_mgr too should be always non-NULL?

> +		return ret;
> +
> +	ret = drm_modeset_lock(&mgr->base.lock, ctx);
> +	if (ret == -EDEADLK)
> +		return ret;
> +
> +	if (port->full_pbn &&

How could full_pbn be unset?

> +	    drm_dp_calc_pbn_mode(clock, bpp, false) > port->full_pbn)
> +		ret = MODE_CLOCK_HIGH;
> +
> +	return ret;
> +}
> +
>  static enum drm_mode_status
> -intel_dp_mst_mode_valid(struct drm_connector *connector,
> -			struct drm_display_mode *mode)
> +intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
> +			    struct drm_display_mode *mode,
> +			    struct drm_modeset_acquire_ctx *ctx)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->dev);
>  	struct intel_connector *intel_connector = to_intel_connector(connector);
>  	struct intel_dp *intel_dp = intel_connector->mst_port;
>  	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
>  	int max_rate, mode_rate, max_lanes, max_link_clock;
> +	int ret;
>  
>  	if (drm_connector_is_unregistered(connector))
>  		return MODE_ERROR;
> @@ -632,7 +659,11 @@ intel_dp_mst_mode_valid(struct drm_connector *connector,
>  	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
>  	mode_rate = intel_dp_link_required(mode->clock, 18);
>  
> -	/* TODO - validate mode against available PBN for link */
> +	ret = intel_dp_mst_mode_clock_exceeds_pbn_bw(connector, ctx,
> +						     mode->clock, 24);

Why 24 bpp and not 18?

Nit: could be checked after max_rate/max_dotclk for consistency.

> +	if (ret != MODE_OK)
> +		return ret;
> +
>  	if (mode->clock < 10000)
>  		return MODE_CLOCK_LOW;
>  
> @@ -671,7 +702,7 @@ intel_dp_mst_detect(struct drm_connector *connector,
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
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
