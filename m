Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876362A95E2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 12:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3466EA8C;
	Fri,  6 Nov 2020 11:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2646EA82;
 Fri,  6 Nov 2020 11:58:01 +0000 (UTC)
IronPort-SDR: ygPGpiIqQa43YjFw7tT0htiezjLgP8hwaq7WhDEeGddn1GneZFpITiqFCICvebecCtu7B+M8pZ
 azTHQLVmcPyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="149387195"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="149387195"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 03:58:00 -0800
IronPort-SDR: vSlELBnEzDGbWltzkA/cfYvoCF/VwjYd4LYJtRIghbcjjqM5moZNfm2DR6fj6iBSL7W+9c8wDw
 81jOA+qdSScQ==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="321568907"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 03:57:57 -0800
Date: Fri, 6 Nov 2020 17:28:42 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 16/16] drm/i915/hdcp: Enable HDCP 2.2 MST support
Message-ID: <20201106115842.GC13128@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-17-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-17-anshuman.gupta@intel.com>
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

On 2020-10-27 at 22:12:08 +0530, Anshuman Gupta wrote:
> Enable HDCP 2.2 over DP MST.
> Authenticate and enable port encryption only once for
> an active HDCP 2.2 session, once port is authenticated
> and encrypted enable encryption for each stream that
> requires encryption on this port.
> 
> Similarly disable the stream encryption for each encrypted
> stream, once all encrypted stream encryption is disabled,
> disable the port HDCP encryption and deauthenticate the port.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 46 ++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 87f7aaf3a319..71fd01bf63a6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1693,6 +1693,32 @@ static int hdcp2_authenticate_sink(struct intel_connector *connector)
>  	return ret;
>  }
>  
> +static int hdcp2_enable_stream_encryption(struct intel_connector *connector)
> +{
> +	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_hdcp *hdcp = &connector->hdcp;
> +	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
> +	enum port port = dig_port->base.port;
> +	int ret = 0;
> +
> +	if (!(intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
> +			    LINK_ENCRYPTION_STATUS)) {
> +		drm_err(&dev_priv->drm, "HDCP 2.2 Link is not encrypted\n");
Provide the connector details in err.
> +		return -EPERM;
> +	}
> +
> +	if (hdcp->shim->stream_2_2_encryption) {
> +		ret = hdcp->shim->stream_2_2_encryption(dig_port, true);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "Failed to enable HDCP 2.2 stream enc\n");
connector details.
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int hdcp2_enable_encryption(struct intel_connector *connector)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -1831,7 +1857,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  			drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
>  	}
>  
> -	if (!ret) {
> +	if (!ret && !dig_port->port_auth) {
>  		/*
>  		 * Ensuring the required 200mSec min time interval between
>  		 * Session Key Exchange and encryption.
> @@ -1846,6 +1872,8 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  		}
>  	}
>  
> +	ret = hdcp2_enable_stream_encryption(connector);
> +
>  	return ret;
>  }
>  
> @@ -1891,11 +1919,23 @@ static int _intel_hdcp2_disable(struct intel_connector *connector)
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct hdcp_port_data *data = &dig_port->port_data;
> +	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret;
>  
>  	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
>  		    connector->base.name, connector->base.base.id);
>  
> +	if (hdcp->shim->stream_2_2_encryption) {
> +		ret = hdcp->shim->stream_2_2_encryption(dig_port, false);
> +		if (ret) {
> +			drm_err(&i915->drm, "Failed to disable HDCP 2.2 stream enc\n");
connector details in err.

-Ram
> +			return ret;
> +		}
> +	}
> +
> +	if (dig_port->num_hdcp_streams > 0)
> +		return ret;
> +
>  	ret = hdcp2_disable_encryption(connector);
>  
>  	if (hdcp2_deauthenticate_port(connector) < 0)
> @@ -1919,6 +1959,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  	int ret = 0;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&dig_port->hdcp_mutex);
>  	cpu_transcoder = hdcp->cpu_transcoder;
>  
>  	/* hdcp2_check_link is expected only when HDCP2.2 is Enabled */
> @@ -1996,6 +2037,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  	}
>  
>  out:
> +	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
>  }
> @@ -2177,7 +2219,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  	if (!shim)
>  		return -EINVAL;
>  
> -	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> +	if (is_hdcp2_supported(dev_priv))
>  		intel_hdcp2_init(connector, dig_port, shim);
>  
>  	ret =
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
