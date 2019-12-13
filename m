Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB611E314
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3C36E511;
	Fri, 13 Dec 2019 11:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDD16E511;
 Fri, 13 Dec 2019 11:59:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 03:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="239273372"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2019 03:59:12 -0800
Date: Fri, 13 Dec 2019 17:28:25 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 08/12] drm/i915: Don't fully disable HDCP on a port if
 multiple pipes are using it
Message-ID: <20191213115825.GH3829@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-9-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-9-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-12 at 14:02:26 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch is required for HDCP over MST. If a port is being used for
> multiple HDCP streams, we don't want to fully disable HDCP on a port if
> one of them is disabled. Instead, we just disable the HDCP signalling on
> that particular pipe and exit early. The last pipe to disable HDCP will
> also bring down HDCP on the port.
Sean,

We have a complication here. till ICL this will work as the HDCP
instance is port based. But from TGL, HDCP is transcoder based.

We need to handle MST HDCP enable and disable differently for <=gen11 and >gen11.
> 
> In order to achieve this, we need to keep a refcount in intel_digital_port
> and protect it using a new hdcp_mutex.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-8-sean@poorly.run #v1
> 
> Changes in v2:
> - Move the toggle_signalling call into _intel_hdcp_disable so it's called from check_work
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  3 ++
>  .../drm/i915/display/intel_display_types.h    |  5 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 52 +++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +
>  5 files changed, 55 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bbdaa6d1deec..ea8dd8dbc445 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4788,6 +4788,9 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
>  
>  	encoder = &intel_dig_port->base;
>  
> +	mutex_init(&intel_dig_port->hdcp_mutex);
> +	intel_dig_port->num_hdcp_streams = 0;
> +
>  	drm_encoder_init(&dev_priv->drm, &encoder->base, &intel_ddi_funcs,
>  			 DRM_MODE_ENCODER_TMDS, "DDI %c", port_name(port));
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 687768a913f6..8e98840fc597 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1354,6 +1354,11 @@ struct intel_digital_port {
>  	enum phy_fia tc_phy_fia;
>  	u8 tc_phy_fia_idx;
>  
> +	/* protects num_hdcp_streams reference count */
> +	struct mutex hdcp_mutex;
> +	/* the number of pipes using HDCP signalling out of this port */
> +	unsigned int num_hdcp_streams;
> +
>  	void (*write_infoframe)(struct intel_encoder *encoder,
>  				const struct intel_crtc_state *crtc_state,
>  				unsigned int type,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c1a228b5f879..155067657e23 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7580,6 +7580,8 @@ bool intel_dp_init(struct drm_i915_private *dev_priv,
>  	intel_encoder = &intel_dig_port->base;
>  	encoder = &intel_encoder->base;
>  
> +	mutex_init(&intel_dig_port->hdcp_mutex);
its initialized at ddi_init itself.
> +
>  	if (drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
>  			     &intel_dp_enc_funcs, DRM_MODE_ENCODER_TMDS,
>  			     "DP %c", port_name(port)))
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index c79dca2c74d1..fbbd4da7c491 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -779,6 +779,19 @@ static int _intel_
hdcp_disable(struct intel_connector *connector)
>  	DRM_DEBUG_KMS("[%s:%d] HDCP is being disabled...\n",
>  		      connector->base.name, connector->base.base.id);
>  
> +	/*
> +	 * If there are other connectors on this port using HDCP, don't disable
> +	 * it. Instead, toggle the HDCP signalling off on that particular
> +	 * connector/pipe and exit.
> +	 */
> +	if (intel_dig_port->num_hdcp_streams > 0) {
> +		ret = hdcp->shim->toggle_signalling(intel_dig_port,
> +						    cpu_transcoder, false);
> +		if (ret)
> +			DRM_ERROR("Failed to disable HDCP signalling\n");
> +		return ret;
> +	}
This wont work for TGL+, where HDCP instance is transcoder based. we
need to disable the HDCP per stream for TGL+
> +
>  	hdcp->hdcp_encrypted = false;
>  	I915_WRITE(HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
>  	if (intel_de_wait_for_clear(dev_priv,
> @@ -855,6 +868,7 @@ struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
>  static void intel_hdcp_update_value(struct intel_connector *connector,
>  				    u64 value, bool update_property)
>  {
> +	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  
>  	WARN_ON(!mutex_is_locked(&hdcp->mutex));
> @@ -862,6 +876,15 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
>  	if (hdcp->value == value)
>  		return;
>  
> +	WARN_ON(!mutex_is_locked(&intel_dig_port->hdcp_mutex));
> +
> +	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		if (!WARN_ON(intel_dig_port->num_hdcp_streams == 0))
> +			intel_dig_port->num_hdcp_streams--;
> +	} else if (value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		intel_dig_port->num_hdcp_streams++;
> +	}
> +
>  	hdcp->value = value;
>  	if (update_property) {
>  		drm_connector_get(&connector->base);
> @@ -880,6 +903,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  	int ret = 0;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&intel_dig_port->hdcp_mutex);
> +
>  	cpu_transcoder = hdcp->cpu_transcoder;
>  
>  	/* Check_link valid only when HDCP1.4 is enabled */
> @@ -931,6 +956,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  	}
>  
>  out:
> +	mutex_unlock(&intel_dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
>  }
> @@ -1996,6 +2022,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  		      enum transcoder cpu_transcoder, u8 content_type)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
>  	int ret = -EINVAL;
> @@ -2004,6 +2031,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  		return -ENOENT;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&intel_dig_port->hdcp_mutex);
>  	WARN_ON(hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
>  	hdcp->content_type = content_type;
>  
> @@ -2038,12 +2066,14 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  					true);
>  	}
>  
> +	mutex_unlock(&intel_dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
>  }
>  
>  int intel_hdcp_disable(struct intel_connector *connector)
>  {
> +	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret = 0;
>  
> @@ -2051,17 +2081,21 @@ int intel_hdcp_disable(struct intel_connector *connector)
>  		return -ENOENT;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&intel_dig_port->hdcp_mutex);
>  
> -	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		intel_hdcp_update_value(connector,
> -					DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
> -					false);
> -		if (hdcp->hdcp2_encrypted)
> -			ret = _intel_hdcp2_disable(connector);
> -		else if (hdcp->hdcp_encrypted)
> -			ret = _intel_hdcp_disable(connector);
> -	}
> +	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> +		goto out;
> +
> +	intel_hdcp_update_value(connector,
> +				DRM_MODE_CONTENT_PROTECTION_UNDESIRED, false);
>  
> +	if (hdcp->hdcp2_encrypted)
> +		ret = _intel_hdcp2_disable(connector);
> +	else if (hdcp->hdcp_encrypted)
> +		ret = _intel_hdcp_disable(connector);
> +
> +out:
> +	mutex_unlock(&intel_dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	cancel_delayed_work_sync(&hdcp->check_work);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 5066efadca85..905b188782ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3247,6 +3247,8 @@ void intel_hdmi_init(struct drm_i915_private *dev_priv,
>  
>  	intel_encoder = &intel_dig_port->base;
>  
> +	mutex_init(&intel_dig_port->hdcp_mutex);
its initialized at ddi_init itself.

-Ram
> +
>  	drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
>  			 &intel_hdmi_enc_funcs, DRM_MODE_ENCODER_TMDS,
>  			 "HDMI %c", port_name(port));
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
