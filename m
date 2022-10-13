Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41405FE183
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E4010E100;
	Thu, 13 Oct 2022 18:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B0B10E100;
 Thu, 13 Oct 2022 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665686485; x=1697222485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ujJwNfSbR5lHBwqlsjGZUY3hU5CIU6bR4SmBX1t/sTc=;
 b=Qw5U2k/xImAn9tpRKqsS9IpNMA5NlnUvIbBqegkRy753VpJ4Ag48awWg
 lCdD2uvu5gwwym5f+YPrztNtMjl2PZCH0msdF3+mWIWc/oSC/1WCacx9X
 C8Amoj6vWnAvQ9ieVlXK0Vl+VLFDBE3XO8SDmz3mjNIbJr254mGZPQE4U
 3frcuPfU7bymcDNKrNlcEJHikTK96k/ngquFXJxeEnhaCkEqSTRSwEVLY
 uvuOGhU/WLHJVETzYneGoz5bdsxhI+fAic3wevNw1bHbeyCx9G44jlpyW
 daa0/hNp3neOVlOF39u2zVsVpO5G+Zh0PoL1xrtTmfQM+EbcpBO52xLGq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="369358519"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="369358519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 11:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="731990306"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="731990306"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 13 Oct 2022 11:41:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Oct 2022 21:41:21 +0300
Date: Thu, 13 Oct 2022 21:41:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 01/15] drm/i915/hdmi: do dual mode detect only if connected
Message-ID: <Y0hb0VOaYZk5TptS@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <20fb913a93c60fd24fc51b441ccea7bc75e82dd1.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20fb913a93c60fd24fc51b441ccea7bc75e82dd1.1665496046.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 04:49:35PM +0300, Jani Nikula wrote:
> For normal connector detect, there's really no point in trying dual mode
> detect if the connector is disconnected. We can simplify the detect
> sequence by skipping it. Since intel_hdmi_dp_dual_mode_detect() is only
> called when EDID is present, we can drop the has_edid parameter.
> 
> The functional effect is speeding up disconnected connector detection
> ever so slightly, and, combined with firmware EDID, also stop logging
> about assuming dual mode adaptor.
> 
> It's a bit subtle, but this will also skip dual mode detect if the
> connector is force connected and a) there's no EDID of any kind, normal
> or override/firmare or b) there's EDID but it does not indicate
> digital. These are corner cases no matter what, and arguably forcing
> should not be limited by dual mode detect.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 93519fb23d9d..a332eaac86cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2355,7 +2355,7 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
>  }
>  
>  static void
> -intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
> +intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->dev);
>  	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
> @@ -2371,16 +2371,13 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector, bool has_edid)
>  	 * CONFIG1 pin, but no such luck on our hardware.
>  	 *
>  	 * The only method left to us is to check the VBT to see
> -	 * if the port is a dual mode capable DP port. But let's
> -	 * only do that when we sucesfully read the EDID, to avoid
> -	 * confusing log messages about DP dual mode adaptors when
> -	 * there's nothing connected to the port.
> +	 * if the port is a dual mode capable DP port.
>  	 */
>  	if (type == DRM_DP_DUAL_MODE_UNKNOWN) {
>  		/* An overridden EDID imply that we want this port for testing.
>  		 * Make sure not to set limits for that port.
>  		 */
> -		if (has_edid && !connector->override_edid &&
> +		if (!connector->override_edid &&
>  		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
>  			drm_dbg_kms(&dev_priv->drm,
>  				    "Assuming DP dual mode adaptor presence based on VBT\n");
> @@ -2435,18 +2432,18 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  		intel_gmbus_force_bit(i2c, false);
>  	}
>  
> -	intel_hdmi_dp_dual_mode_detect(connector, edid != NULL);
> -
> -	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
> -
>  	to_intel_connector(connector)->detect_edid = edid;
>  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {

We didn't have this digital input thing before. What happens with
HDMI->VGA dongles for example?

Hmm. This whole thing might already be broken on those. I suspect
I've only used my HDMI->VGA dongle on LSPCON machines, so never
noticed this. Need to go plug that thing into a native HDMI port...

>  		intel_hdmi->has_audio = drm_detect_monitor_audio(edid);
>  		intel_hdmi->has_hdmi_sink = drm_detect_hdmi_monitor(edid);
>  
> +		intel_hdmi_dp_dual_mode_detect(connector);
> +
>  		connected = true;
>  	}
>  
> +	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
> +
>  	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier, edid);
>  
>  	return connected;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
