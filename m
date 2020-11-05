Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FC2A83A6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AF86EDBB;
	Thu,  5 Nov 2020 16:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6EF6EDBB;
 Thu,  5 Nov 2020 16:38:32 +0000 (UTC)
IronPort-SDR: IMK5AEpXtVeO/Issueo+/kR1Q1cy+fArG9JXB1KJfareaBcpA6hKbqfWl6c/4Z1byZ1svJiu1i
 5suLDlM5VZNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="169523907"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="169523907"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:38:31 -0800
IronPort-SDR: CIyp/cIa4rLqElY3veaJYuiv6JWdizO4fe1rqx4Fyn1A53hrWFtZpN1pV71rc3OFDyN5Jlr4sK
 03N0rP91k6bw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="326084376"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:38:28 -0800
Date: Thu, 5 Nov 2020 22:09:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 08/16] drm/i915/hdcp: Pass dig_port to intel_hdcp_init
Message-ID: <20201105163912.GL3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-9-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-9-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 at 22:12:00 +0530, Anshuman Gupta wrote:
> Pass dig_port as an argument to intel_hdcp_init()
> and intel_hdcp2_init().
> This will be required for HDCP 2.2 stream encryption.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c |  4 ++--
>  drivers/gpu/drm/i915/display/intel_hdcp.c    | 12 +++++++-----
>  drivers/gpu/drm/i915/display/intel_hdcp.h    |  4 +++-
>  drivers/gpu/drm/i915/display/intel_hdmi.c    |  2 +-
>  4 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 6dcbfaffd2c5..591b68e5de48 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -751,10 +751,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *dig_port,
>  		return 0;
>  
>  	if (intel_connector->mst_port)
> -		return intel_hdcp_init(intel_connector, port,
> +		return intel_hdcp_init(intel_connector, dig_port,
cant we retrieve the dig_port from connector?

-Ram
>  				       &intel_dp_mst_hdcp_shim);
>  	else if (!intel_dp_is_edp(intel_dp))
> -		return intel_hdcp_init(intel_connector, port,
> +		return intel_hdcp_init(intel_connector, dig_port,
>  				       &intel_dp_hdcp_shim);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 937af4aeaac2..b0f47687bc59 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1982,12 +1982,13 @@ static enum mei_fw_tc intel_get_mei_fw_tc(enum transcoder cpu_transcoder)
>  }
>  
>  static int initialize_hdcp_port_data(struct intel_connector *connector,
> -				     enum port port,
> +				     struct intel_digital_port *dig_port,
>  				     const struct intel_hdcp_shim *shim)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	struct hdcp_port_data *data = &hdcp->port_data;
> +	enum port port = dig_port->base.port;
>  
>  	if (INTEL_GEN(dev_priv) < 12)
>  		data->fw_ddi = intel_get_mei_fw_ddi_index(port);
> @@ -2060,14 +2061,15 @@ void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
>  	}
>  }
>  
> -static void intel_hdcp2_init(struct intel_connector *connector, enum port port,
> +static void intel_hdcp2_init(struct intel_connector *connector,
> +			     struct intel_digital_port *dig_port,
>  			     const struct intel_hdcp_shim *shim)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret;
>  
> -	ret = initialize_hdcp_port_data(connector, port, shim);
> +	ret = initialize_hdcp_port_data(connector, dig_port, shim);
>  	if (ret) {
>  		drm_dbg_kms(&i915->drm, "Mei hdcp data init failed\n");
>  		return;
> @@ -2077,7 +2079,7 @@ static void intel_hdcp2_init(struct intel_connector *connector, enum port port,
>  }
>  
>  int intel_hdcp_init(struct intel_connector *connector,
> -		    enum port port,
> +		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *shim)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> @@ -2088,7 +2090,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  		return -EINVAL;
>  
>  	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> -		intel_hdcp2_init(connector, port, shim);
> +		intel_hdcp2_init(connector, dig_port, shim);
>  
>  	ret =
>  	drm_connector_attach_content_protection_property(&connector->base,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index b912a3a0f5b8..8f53b0c7fe5c 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -18,13 +18,15 @@ struct intel_connector;
>  struct intel_crtc_state;
>  struct intel_encoder;
>  struct intel_hdcp_shim;
> +struct intel_digital_port;
>  enum port;
>  enum transcoder;
>  
>  void intel_hdcp_atomic_check(struct drm_connector *connector,
>  			     struct drm_connector_state *old_state,
>  			     struct drm_connector_state *new_state);
> -int intel_hdcp_init(struct intel_connector *connector, enum port port,
> +int intel_hdcp_init(struct intel_connector *connector,
> +		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *hdcp_shim);
>  int intel_hdcp_enable(struct intel_connector *connector,
>  		      const struct intel_crtc_state *pipe_config, u8 content_type);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index f58469226694..0788de04711b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3302,7 +3302,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
>  	intel_hdmi->attached_connector = intel_connector;
>  
>  	if (is_hdcp_supported(dev_priv, port)) {
> -		int ret = intel_hdcp_init(intel_connector, port,
> +		int ret = intel_hdcp_init(intel_connector, dig_port,
>  					  &intel_hdmi_hdcp_shim);
>  		if (ret)
>  			drm_dbg_kms(&dev_priv->drm,
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
