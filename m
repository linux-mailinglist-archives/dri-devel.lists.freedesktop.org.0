Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255F21982A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 08:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AD76E9A5;
	Thu,  9 Jul 2020 06:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC366E9A5;
 Thu,  9 Jul 2020 06:01:10 +0000 (UTC)
IronPort-SDR: wBz6suYqZdfgvynU5zkNtC4i0bmy6WdKkdPU1AHVXCWK7eSysaPM3JVstK2MU0NEnLMtOnBcEM
 WT9VaZL4K2mg==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="147017495"
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="147017495"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 23:01:09 -0700
IronPort-SDR: qZbdFIyev7gInFNdNvZlM1CTTn1siqW7/DuCZboWIrRfxAeugtRdHqwKCsZafrcjB+33zxvAYT
 WLGyN6jbaPEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="314851554"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2020 23:01:00 -0700
Date: Thu, 9 Jul 2020 11:27:21 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v7 09/17] drm/i915: Don't fully disable HDCP on a port if
 multiple pipes are using it
Message-ID: <20200709055721.GB13481@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-10-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623155907.22961-10-sean@poorly.run>
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-23 at 11:58:59 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch is required for HDCP over MST. If a port is being used for
> multiple HDCP streams, we don't want to fully disable HDCP on a port if
> one of them is disabled. Instead, we just disable the HDCP signalling on
> that particular pipe and exit early. The last pipe to disable HDCP will
> also bring down HDCP on the port.
> 
> In order to achieve this, we need to keep a refcount in intel_digital_port
> and protect it using a new hdcp_mutex.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-8-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-9-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-9-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-9-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-9-sean@poorly.run #v5
> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-9-sean@poorly.run #v6
> 
> Changes in v2:
> -Move the toggle_signalling call into _intel_hdcp_disable so it's called from check_work
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -Change WARN_ON to drm_WARN_ON
> Changes in v6:
> -None
> Changes in v7:
> -Split minor intel_hdcp_disable refactor into separate patch (Ramalingam)
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  3 ++
>  .../drm/i915/display/intel_display_types.h    |  5 +++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  2 ++
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 33 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 ++
>  5 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 4153a0d1e07d..536299f902b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4884,6 +4884,9 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
>  	drm_encoder_init(&dev_priv->drm, &encoder->base, &intel_ddi_funcs,
>  			 DRM_MODE_ENCODER_TMDS, "DDI %c", port_name(port));
>  
> +	mutex_init(&intel_dig_port->hdcp_mutex);
> +	intel_dig_port->num_hdcp_streams = 0;
> +
>  	encoder->hotplug = intel_ddi_hotplug;
>  	encoder->compute_output_type = intel_ddi_compute_output_type;
>  	encoder->compute_config = intel_ddi_compute_config;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index fc0befd55420..1503403a808b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1410,6 +1410,11 @@ struct intel_digital_port {
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
> index d0fea51f5dec..d98e45a09c28 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -8276,6 +8276,8 @@ bool intel_dp_init(struct drm_i915_private *dev_priv,
>  	intel_encoder = &intel_dig_port->base;
>  	encoder = &intel_encoder->base;
>  
> +	mutex_init(&intel_dig_port->hdcp_mutex);
> +
>  	if (drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
>  			     &intel_dp_enc_funcs, DRM_MODE_ENCODER_TMDS,
>  			     "DP %c", port_name(port)))
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 16bf0fbe5f17..5679877c6b4c 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -801,6 +801,19 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
>  		    connector->base.name, connector->base.base.id);
>  
> +	/*
> +	 * If there are other connectors on this port using HDCP, don't disable
> +	 * it. Instead, toggle the HDCP signalling off on that particular
> +	 * connector/pipe and exit.
> +	 */
> +	if (intel_dig_port->num_hdcp_streams > 0) {
> +		ret = hdcp->shim->toggle_signalling(intel_dig_port,
> +						    cpu_transcoder, false);
Sean,

Toggling for DP SST was empty. For MST also HW spec doesn't say the bit
is applicable (This bit is ignored when not in HDMI or DVI modes.)

Is there anywhere you saw this is needed for MST?

Leaving this discussion for mst shim implementation patch 17/17, and considering
this function is dummy as it was for DP SST,

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> +		if (ret)
> +			DRM_ERROR("Failed to disable HDCP signalling\n");
> +		return ret;
> +	}
> +
>  	hdcp->hdcp_encrypted = false;
>  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
>  	if (intel_de_wait_for_clear(dev_priv,
> @@ -880,6 +893,8 @@ static struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
>  static void intel_hdcp_update_value(struct intel_connector *connector,
>  				    u64 value, bool update_property)
>  {
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  
>  	drm_WARN_ON(connector->base.dev, !mutex_is_locked(&hdcp->mutex));
> @@ -887,6 +902,15 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
>  	if (hdcp->value == value)
>  		return;
>  
> +	drm_WARN_ON(dev, !mutex_is_locked(&intel_dig_port->hdcp_mutex));
> +
> +	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		if (!drm_WARN_ON(dev, intel_dig_port->num_hdcp_streams == 0))
> +			intel_dig_port->num_hdcp_streams--;
> +	} else if (value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		intel_dig_port->num_hdcp_streams++;
> +	}
> +
>  	hdcp->value = value;
>  	if (update_property) {
>  		drm_connector_get(&connector->base);
> @@ -905,6 +929,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  	int ret = 0;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&intel_dig_port->hdcp_mutex);
> +
>  	cpu_transcoder = hdcp->cpu_transcoder;
>  
>  	/* Check_link valid only when HDCP1.4 is enabled */
> @@ -958,6 +984,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  	}
>  
>  out:
> +	mutex_unlock(&intel_dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
>  }
> @@ -2057,6 +2084,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  		      enum transcoder cpu_transcoder, u8 content_type)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
>  	int ret = -EINVAL;
> @@ -2065,6 +2093,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  		return -ENOENT;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&intel_dig_port->hdcp_mutex);
>  	drm_WARN_ON(&dev_priv->drm,
>  		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
>  	hdcp->content_type = content_type;
> @@ -2099,12 +2128,14 @@ int intel_hdcp_enable(struct intel_connector *connector,
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
> +	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret = 0;
>  
> @@ -2112,6 +2143,7 @@ int intel_hdcp_disable(struct intel_connector *connector)
>  		return -ENOENT;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&intel_dig_port->hdcp_mutex);
>  
>  	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
>  		goto out;
> @@ -2124,6 +2156,7 @@ int intel_hdcp_disable(struct intel_connector *connector)
>  		ret = _intel_hdcp_disable(connector);
>  
>  out:
> +	mutex_unlock(&intel_dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	cancel_delayed_work_sync(&hdcp->check_work);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index ab7bddf0dfdc..a59acfff456e 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3331,6 +3331,8 @@ void intel_hdmi_init(struct drm_i915_private *dev_priv,
>  
>  	intel_encoder = &intel_dig_port->base;
>  
> +	mutex_init(&intel_dig_port->hdcp_mutex);
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
