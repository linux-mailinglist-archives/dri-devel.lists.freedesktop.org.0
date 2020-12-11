Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762A2D7036
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 07:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E66EC52;
	Fri, 11 Dec 2020 06:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB66EC52;
 Fri, 11 Dec 2020 06:33:04 +0000 (UTC)
IronPort-SDR: 4XUQtOnA9fdTdZGpZ3iYZ7N78Ile9J2Gj4icayxSu8GJxRpzEI0tB3cP7WYNBLjaCcA32m4w6N
 tFP0O9JDqzhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="238489316"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="238489316"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 22:33:03 -0800
IronPort-SDR: wYsahniDSTiEBA54kLxabVS6x9QJnnYvMMjDmAvKWjhwv7L9dPVCBWciN9ENU5FnyzW+/psJIw
 ghkLtzYPXr+Q==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="374045165"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 22:33:01 -0800
Date: Fri, 11 Dec 2020 12:02:49 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v7 08/18] drm/i915/hdcp: Enable HDCP 1.4 stream encryption
Message-ID: <20201211063247.GB1297@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
 <20201210062640.11783-9-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210062640.11783-9-anshuman.gupta@intel.com>
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

On 2020-12-10 at 11:56:30 +0530, Anshuman Gupta wrote:
> Enable HDCP 1.4 DP MST stream encryption.
IMHO tile of "Configure HDCP1.4 MST steram encryption status" would suit
more.

But i leave that to your call.
> 
> Enable stream encryption once encryption is enabled on
> the DP transport driving the link for each stream which
> has requested encryption.
> 
> Disable stream encryption for each stream that no longer
> requires encryption before disabling HDCP encryption on
> the link.
> 
> v2:
> - Added debug print for stream encryption.
> - Disable the hdcp on port after disabling last stream
>   encryption.
> v3:
> - Cosmetic change, removed the value less comment. [Uma]
> v4:
> - Split the Gen12 HDCP enablement patch. [Ram]
> - Add connector details in drm_err.
> v5:
> - uniformity for connector detail in DMESG. [Ram]
> - comments improvement. [Ram]
> 

Patch LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Tested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 38 +++++++++++++++--------
>  1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 6e6465b4ecfa..fce444d69521 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -766,10 +766,17 @@ static int intel_hdcp_auth(struct intel_connector *connector)
>  		return -ETIMEDOUT;
>  	}
>  
> -	/*
> -	 * XXX: If we have MST-connected devices, we need to enable encryption
> -	 * on those as well.
> -	 */
> +	/* DP MST Auth Part 1 Step 2.a and Step 2.b */
> +	if (shim->stream_encryption) {
> +		ret = shim->stream_encryption(connector, true);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "[%s:%d] Failed to enable HDCP 1.4 stream enc\n",
> +				connector->base.name, connector->base.base.id);
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encrypted\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
>  
>  	if (repeater_present)
>  		return intel_hdcp_auth_downstream(connector);
> @@ -791,18 +798,23 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
>  		    connector->base.name, connector->base.base.id);
>  
> +	if (hdcp->shim->stream_encryption) {
> +		ret = hdcp->shim->stream_encryption(connector, false);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "[%s:%d] Failed to disable HDCP 1.4 stream enc\n",
> +				connector->base.name, connector->base.base.id);
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encryption disabled\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
> +
>  	/*
> -	 * If there are other connectors on this port using HDCP, don't disable
> -	 * it. Instead, toggle the HDCP signalling off on that particular
> -	 * connector/pipe and exit.
> +	 * If there are other connectors on this port using HDCP, don't disable it
> +	 * until it disabled HDCP encryption for all connectors in MST topology.
>  	 */
> -	if (dig_port->num_hdcp_streams > 0) {
> -		ret = hdcp->shim->toggle_signalling(dig_port,
> -						    cpu_transcoder, false);
> -		if (ret)
> -			DRM_ERROR("Failed to disable HDCP signalling\n");
> +	if (dig_port->num_hdcp_streams > 0)
>  		return ret;
> -	}
>  
>  	hdcp->hdcp_encrypted = false;
>  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
