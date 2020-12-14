Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C52D98E8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A9A6E159;
	Mon, 14 Dec 2020 13:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5C86E159;
 Mon, 14 Dec 2020 13:35:19 +0000 (UTC)
IronPort-SDR: 8kCD2LRIHFxWNSf5Yq5TAtqPR2i21BQoWvZsu6UtEfKM5aUipxfSNaas8jLYjaryEiYhxp+O6U
 q+WqmxT1oD9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="162453838"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="162453838"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:35:17 -0800
IronPort-SDR: QYP/8wGRvwoaT0YiifalLVuk23buoY2FN0Ze+zXlvykDdglMJRSithRD6KNGDfA4y7RouIHmqq
 8BCOMo8P4P8A==
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="381808873"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:35:13 -0800
Date: Mon, 14 Dec 2020 19:05:04 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v8 18/19] drm/i915/hdcp: Configure HDCP2.2 MST steram
 encryption status
Message-ID: <20201214133504.GC22687@intel.com>
References: <20201211134244.14588-1-anshuman.gupta@intel.com>
 <20201211134244.14588-19-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211134244.14588-19-anshuman.gupta@intel.com>
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

On 2020-12-11 at 19:12:43 +0530, Anshuman Gupta wrote:
> Authenticate and enable port encryption only once for
> an active HDCP 2.2 session, once port is authenticated
> and encrypted enable encryption for each stream that
> requires encryption on this port.
> 
> Similarly disable the stream encryption for each encrypted
> stream, once all encrypted stream encryption is disabled,
> disable the port HDCP encryption and deauthenticate the port.
> 
> v2:
> - Add connector details in drm_err. [Ram]
> - 's/port_auth/hdcp_auth_status'. [Ram]
> - Added a debug print for stream enc.
> v3:
> - uniformity for connector detail in DMESG. [Ram]
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> Tested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 51 ++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 2fd8b0453b1d..768a6218b9c4 100644
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
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
