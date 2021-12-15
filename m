Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97DF4759F5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6421910E86E;
	Wed, 15 Dec 2021 13:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502710E86E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:50:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226510337"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226510337"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 05:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="482393961"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 15 Dec 2021 05:50:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Dec 2021 15:50:29 +0200
Date: Wed, 15 Dec 2021 15:50:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 02/14] drm/edid: Rename
 drm_hdmi_avi_infoframe_colorspace to _colorimetry
Message-ID: <YbnypVBnehElJTVI@intel.com>
References: <20211215124406.340180-1-maxime@cerno.tech>
 <20211215124406.340180-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215124406.340180-3-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Werner Sembach <wse@tuxedocomputers.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 01:43:54PM +0100, Maxime Ripard wrote:
> The drm_hdmi_avi_infoframe_colorspace() function actually sets the
> colorimetry and extended_colorimetry fields in the hdmi_avi_infoframe
> structure with DRM_MODE_COLORIMETRY_* values.
> 
> To make things worse, the hdmi_avi_infoframe structure also has a
> colorspace field used to signal whether an RGB or YUV output is being
> used.
> 
> Let's remove the inconsistency and allow for the colorspace usage by
> renaming the function.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sadly we can't rename the property itself.

> ---
>  drivers/gpu/drm/drm_edid.c                  | 8 ++++----
>  drivers/gpu/drm/i915/display/intel_hdmi.c   | 2 +-
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c              | 2 +-
>  include/drm/drm_edid.h                      | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e57d1b8cdaaa..dec7aecfc655 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5890,13 +5890,13 @@ static const u32 hdmi_colorimetry_val[] = {
>  #undef ACE
>  
>  /**
> - * drm_hdmi_avi_infoframe_colorspace() - fill the HDMI AVI infoframe
> - *                                       colorspace information
> + * drm_hdmi_avi_infoframe_colorimetry() - fill the HDMI AVI infoframe
> + *                                       colorimetry information
>   * @frame: HDMI AVI infoframe
>   * @conn_state: connector state
>   */
>  void
> -drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
> +drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
>  				  const struct drm_connector_state *conn_state)
>  {
>  	u32 colorimetry_val;
> @@ -5915,7 +5915,7 @@ drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
>  	frame->extended_colorimetry = (colorimetry_val >> 2) &
>  					EXTENDED_COLORIMETRY_MASK;
>  }
> -EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorspace);
> +EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorimetry);
>  
>  /**
>   * drm_hdmi_avi_infoframe_quant_range() - fill the HDMI AVI infoframe
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 3b5b9e7b05b7..96e508ddc4af 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -730,7 +730,7 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
>  	else
>  		frame->colorspace = HDMI_COLORSPACE_RGB;
>  
> -	drm_hdmi_avi_infoframe_colorspace(frame, conn_state);
> +	drm_hdmi_avi_infoframe_colorimetry(frame, conn_state);
>  
>  	/* nonsense combination */
>  	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index 05d2d750fa53..092a925c6cf5 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -537,7 +537,7 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
>  		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
>  
>  	/* Set the Colorspace as per the HDMI spec */
> -	drm_hdmi_avi_infoframe_colorspace(&frame.avi, conn_state);
> +	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, conn_state);
>  
>  	/* nonsense combination */
>  	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 053fbaf765ca..be39e55ae113 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -502,7 +502,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
>  					   vc4_encoder->limited_rgb_range ?
>  					   HDMI_QUANTIZATION_RANGE_LIMITED :
>  					   HDMI_QUANTIZATION_RANGE_FULL);
> -	drm_hdmi_avi_infoframe_colorspace(&frame.avi, cstate);
> +	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
>  	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
>  
>  	vc4_hdmi_write_infoframe(encoder, &frame);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 18f6c700f6d0..144c495b99c4 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -401,8 +401,8 @@ drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
>  					    const struct drm_display_mode *mode);
>  
>  void
> -drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
> -				  const struct drm_connector_state *conn_state);
> +drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
> +				   const struct drm_connector_state *conn_state);
>  
>  void
>  drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
> -- 
> 2.33.1

-- 
Ville Syrjälä
Intel
