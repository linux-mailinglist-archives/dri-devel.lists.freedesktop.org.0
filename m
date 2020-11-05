Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C12A826A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 16:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52066EDB4;
	Thu,  5 Nov 2020 15:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0836EDB4;
 Thu,  5 Nov 2020 15:41:10 +0000 (UTC)
IronPort-SDR: T82EvSE/XXPSMgJKGatowvrAHCvXrVcEhT7SniewNzp4vUm4YMixAobdtq4lLpi+O9d65zHvK7
 pkcbWnWjocpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="166810304"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="166810304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 07:41:10 -0800
IronPort-SDR: BaGxfF7BPoDPAQE9/Q4KdJxo+kLWdk8dyGBCkciXF7TCWLElCO1E/3LDdL4HVzatIKnCh7ykde
 ApJrUlWhbldA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="306548706"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 07:41:07 -0800
Date: Thu, 5 Nov 2020 21:11:52 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 07/16] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST
 support
Message-ID: <20201105154151.GH3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-8-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-8-anshuman.gupta@intel.com>
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

On 2020-10-27 at 22:11:59 +0530, Anshuman Gupta wrote:
> Enable HDCP 1.4 over DP MST for Gen12.
> This also enable the stream encryption support for
> older generations, which was missing earlier.
It will be nice to have them in separate patches.

-Ram
> 
> v2:
> - Added debug print for stream encryption.
> - Disable the hdcp on port after disabling last stream
>   encryption.
> v3:
> - Cosmetic change, removed the value less comment. [Uma]
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++---
>  drivers/gpu/drm/i915/display/intel_hdcp.c   | 43 ++++++++++++++-------
>  2 files changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 16865b200062..f00e12fc83e8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -826,13 +826,9 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  	intel_attach_force_audio_property(connector);
>  	intel_attach_broadcast_rgb_property(connector);
>  
> -
> -	/* TODO: Figure out how to make HDCP work on GEN12+ */
> -	if (INTEL_GEN(dev_priv) < 12) {
> -		ret = intel_dp_init_hdcp(dig_port, intel_connector);
> -		if (ret)
> -			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> -	}
> +	ret = intel_dp_init_hdcp(dig_port, intel_connector);
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "HDCP init failed, skipping.\n");
>  
>  	/*
>  	 * Reuse the prop from the SST connector because we're
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 0322a83c151d..937af4aeaac2 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -612,7 +612,12 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
>  	return ret;
>  }
>  
> -/* Implements Part 1 of the HDCP authorization procedure */
> +/*
> + * Implements Part 1 of the HDCP authorization procedure.
> + * Authentication Part 1 steps for Multi-stream DisplayPort.
> + * Step 1. Auth Part 1 sequence on the driving MST Trasport Link.
> + * Step 2. Enable encryption for each stream that requires encryption.
> + */
>  static int intel_hdcp_auth(struct intel_connector *connector)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -766,10 +771,16 @@ static int intel_hdcp_auth(struct intel_connector *connector)
>  		return -ETIMEDOUT;
>  	}
>  
> -	/*
> -	 * XXX: If we have MST-connected devices, we need to enable encryption
> -	 * on those as well.
> -	 */
> +	/* DP MST Auth Part 1 Step 2.a and Step 2.b */
> +	if (shim->stream_encryption) {
> +		ret = shim->stream_encryption(dig_port, true);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "Failed to enable HDCP 1.4 stream enc\n");
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 tras %s stream encrypted\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
>  
>  	if (repeater_present)
>  		return intel_hdcp_auth_downstream(connector);
> @@ -791,18 +802,22 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
>  		    connector->base.name, connector->base.base.id);
>  
> +	if (hdcp->shim->stream_encryption) {
> +		ret = hdcp->shim->stream_encryption(dig_port, false);
> +		if (ret) {
> +			drm_err(&dev_priv->drm, "Failed to disable HDCP 1.4 stream enc\n");
> +			return ret;
> +		}
> +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 trans %s stream encryption disabled\n",
> +			    transcoder_name(hdcp->stream_transcoder));
> +	}
> +
>  	/*
> -	 * If there are other connectors on this port using HDCP, don't disable
> -	 * it. Instead, toggle the HDCP signalling off on that particular
> -	 * connector/pipe and exit.
> +	 * If there are other connectors on this port using HDCP, don't disable it.
> +	 * Repeat steps 1-2 for each stream that no longer requires encryption.
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
