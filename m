Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9632D70C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 08:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C849F6EC65;
	Fri, 11 Dec 2020 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3789ED3;
 Fri, 11 Dec 2020 07:24:37 +0000 (UTC)
IronPort-SDR: ncdA5nfqfAMvQBfW7Sn8t8jYV1DXF0FNkgkDHg82NHZguOIZukiwND5Wn7ZOChzJdO3Z81n5sR
 pgCJT4C1r5aA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="171827815"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="171827815"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 23:24:36 -0800
IronPort-SDR: pZgPJk+elSFw+5OggAoWq/5PVtW3FOloDS8m9M+3kWtISGZBG7/apLpGAbsnBdtrH4VqFGGQRv
 vRcU82ArElhg==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="484962849"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 23:24:33 -0800
Date: Fri, 11 Dec 2020 12:54:21 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v7 18/18] drm/i915/hdcp: Enable HDCP 2.2 MST support
Message-ID: <20201211072421.GF1297@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
 <20201210062640.11783-19-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210062640.11783-19-anshuman.gupta@intel.com>
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
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 uma.shankar@intel.com, seanpaul@chromium.org, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-10 at 11:56:40 +0530, Anshuman Gupta wrote:
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
Like in the previous patch (for 1.4 MST?) split this patch into 2. one
for configuring the stream encryptions status for 2.2 another one for
enabling the HDCP2.2 MST support.

Ram
> v2:
> - Add connector details in drm_err. [Ram]
> - 's/port_auth/hdcp_auth_status'. [Ram]
> - Added a debug print for stream enc.
> v3:
> - uniformity for connector detail in DMESG. [Ram]
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Tested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 53 ++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 65dd39b44688..4b221c298835 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1700,6 +1700,36 @@ static int hdcp2_authenticate_sink(struct intel_connector *connector)
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
> +		drm_err(&dev_priv->drm, "[%s:%d] HDCP 2.2 Link is not encrypted\n",
> +			connector->base.name, connector->base.base.id);
> +		return -EPERM;
> +	}
> +
> +	if (hdcp->shim->stream_2_2_encryption) {
> +		ret = hdcp->shim->stream_2_2_encryption(connector, true);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "[%s:%d] Failed to enable HDCP 2.2 stream enc\n",
> +				connector->base.name, connector->base.base.id);
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 2.2 transcoder: %s stream encrypted\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
> +
> +	return ret;
> +}
> +
>  static int hdcp2_enable_encryption(struct intel_connector *connector)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -1838,7 +1868,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  			drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
>  	}
>  
> -	if (!ret) {
> +	if (!ret && !dig_port->hdcp_auth_status) {
>  		/*
>  		 * Ensuring the required 200mSec min time interval between
>  		 * Session Key Exchange and encryption.
> @@ -1853,6 +1883,8 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
>  		}
>  	}
>  
> +	ret = hdcp2_enable_stream_encryption(connector);
> +
>  	return ret;
>  }
>  
> @@ -1898,11 +1930,26 @@ static int _intel_hdcp2_disable(struct intel_connector *connector)
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
> +	struct intel_hdcp *hdcp = &connector->hdcp;
>  	int ret;
>  
>  	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
>  		    connector->base.name, connector->base.base.id);
>  
> +	if (hdcp->shim->stream_2_2_encryption) {
> +		ret = hdcp->shim->stream_2_2_encryption(connector, false);
> +		if (ret) {
> +			drm_err(&i915->drm, "[%s:%d] Failed to disable HDCP 2.2 stream enc\n",
> +				connector->base.name, connector->base.base.id);
> +			return ret;
> +		}
> +		drm_dbg_kms(&i915->drm, "HDCP 2.2 transcoder: %s stream encryption disabled\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
> +
> +	if (dig_port->num_hdcp_streams > 0)
> +		return ret;
> +
>  	ret = hdcp2_disable_encryption(connector);
>  
>  	if (hdcp2_deauthenticate_port(connector) < 0)
> @@ -1926,6 +1973,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  	int ret = 0;
>  
>  	mutex_lock(&hdcp->mutex);
> +	mutex_lock(&dig_port->hdcp_mutex);
>  	cpu_transcoder = hdcp->cpu_transcoder;
>  
>  	/* hdcp2_check_link is expected only when HDCP2.2 is Enabled */
> @@ -2003,6 +2051,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  	}
>  
>  out:
> +	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
>  }
> @@ -2184,7 +2233,7 @@ int intel_hdcp_init(struct intel_connector *connector,
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
