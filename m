Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51239BECF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325D26F64D;
	Fri,  4 Jun 2021 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6406F64A;
 Fri,  4 Jun 2021 17:31:12 +0000 (UTC)
IronPort-SDR: MgeBixsI15jMiIkRPMwEQkNb52Q3OBQpdIt/Ba7cK/1ax5xbUmDR9RhnLFbpb274hPj9KKIn2S
 vUrn+2O4YjaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="225654437"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="225654437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 10:30:59 -0700
IronPort-SDR: E6f8vel3p5Bo3KoNnpIKKX3N7n331JqiLdiBnwP8qXAgkaOWsthLpEHPipQE1fQ/cLpudqh2py
 spnGTxfVCyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="412432857"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Jun 2021 10:30:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Jun 2021 20:30:52 +0300
Date: Fri, 4 Jun 2021 20:30:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 4/4] drm/i915/display: Add handling for new "active bpc"
 property
Message-ID: <YLpjTMegcjT22vQE@intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-5-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210604171723.10276-5-wse@tuxedocomputers.com>
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
Cc: amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 07:17:23PM +0200, Werner Sembach wrote:
> This commits implements the "active bpc" drm property for the Intel GPU driver.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c      |  8 ++++++--
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  |  4 +++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
>  4 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 64e9107d70f7..f7898d9d7438 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10164,6 +10164,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>  	struct intel_crtc *crtc;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
>  	u64 put_domains[I915_MAX_PIPES] = {};
>  	intel_wakeref_t wakeref = 0;
>  	int i;
> @@ -10324,6 +10326,17 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  	}
>  	intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
>  
> +	/* Extract information from crtc to communicate it to userspace as connector properties */
> +	for_each_new_connector_in_state(&state->base, connector, new_conn_state, i) {
> +		struct drm_crtc *crtc = new_conn_state->crtc;
> +		if (crtc) {
> +			new_crtc_state = to_intel_crtc_state(drm_atomic_get_new_crtc_state(&state->base, crtc));

intel_atomic_get_new_crtc_state()

> +			new_conn_state->active_bpc = new_crtc_state->pipe_bpp / 3;
> +		}
> +		else
> +			new_conn_state->active_bpc = 0;
> +	}

This also seems too late. I think the whole thing should be
done somewhere around the normal swap_state() stuff.

> +
>  	/*
>  	 * Defer the cleanup of the old state to a separate worker to not
>  	 * impede the current task (userspace for blocking modesets) that
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 642c60f3d9b1..67826ba976ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4671,10 +4671,14 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
>  		intel_attach_force_audio_property(connector);
>  
>  	intel_attach_broadcast_rgb_property(connector);
> -	if (HAS_GMCH(dev_priv))
> +	if (HAS_GMCH(dev_priv)) {
>  		drm_connector_attach_max_bpc_property(connector, 6, 10);
> -	else if (DISPLAY_VER(dev_priv) >= 5)
> +		drm_connector_attach_active_bpc_property(connector, 6, 10);
> +	}
> +	else if (DISPLAY_VER(dev_priv) >= 5) {
>  		drm_connector_attach_max_bpc_property(connector, 6, 12);
> +		drm_connector_attach_active_bpc_property(connector, 6, 12);
> +	}
>  
>  	/* Register HDMI colorspace for case of lspcon */
>  	if (intel_bios_is_lspcon_present(dev_priv, port)) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 2daa3f67791e..5a1869dc2210 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -844,8 +844,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  	 */
>  	connector->max_bpc_property =
>  		intel_dp->attached_connector->base.max_bpc_property;
> -	if (connector->max_bpc_property)
> +	if (connector->max_bpc_property) {
>  		drm_connector_attach_max_bpc_property(connector, 6, 12);
> +		drm_connector_attach_active_bpc_property(connector, 6, 12);
> +	}
>  
>  	return connector;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index d69f0a6dc26d..8af78b27b6ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2463,8 +2463,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
>  		drm_object_attach_property(&connector->base,
>  			connector->dev->mode_config.hdr_output_metadata_property, 0);
>  
> -	if (!HAS_GMCH(dev_priv))
> +	if (!HAS_GMCH(dev_priv)) {
>  		drm_connector_attach_max_bpc_property(connector, 8, 12);
> +		drm_connector_attach_active_bpc_property(connector, 8, 12);
> +	}
>  }
>  
>  /*
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
