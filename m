Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94011E28E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746226E4AB;
	Fri, 13 Dec 2019 11:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5D06E4AB;
 Fri, 13 Dec 2019 11:12:35 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 03:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="415609675"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2019 03:12:31 -0800
Date: Fri, 13 Dec 2019 16:41:44 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 06/12] drm/i915: Factor out hdcp->value assignments
Message-ID: <20191213111144.GG3829@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-7-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-7-sean@poorly.run>
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

On 2019-12-12 at 14:02:24 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This is a bit of housecleaning for a future patch. Instead of sprinkling
> hdcp->value assignments and prop_work scheduling everywhere, introduce a
> function to do it for us.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-7-sean@poorly.run #v1
LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Changes in v2:
> -None
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 67 ++++++++++++++++-------
>  1 file changed, 46 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index f8d56d3b2ddb..798e7e1a19fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -852,6 +852,21 @@ struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
>  	return container_of(hdcp, struct intel_connector, hdcp);
>  }
>  
> +static void intel_hdcp_update_value(struct intel_connector *connector,
> +				    u64 value, bool update_property)
> +{
> +	struct intel_hdcp *hdcp = &connector->hdcp;
> +
> +	WARN_ON(!mutex_is_locked(&hdcp->mutex));
> +
> +	if (hdcp->value == value)
> +		return;
> +
> +	hdcp->value = value;
> +	if (update_property)
> +		schedule_work(&hdcp->prop_work);
> +}
> +
>  /* Implements Part 3 of the HDCP authorization procedure */
>  static int intel_hdcp_check_link(struct intel_connector *connector)
>  {
> @@ -878,15 +893,16 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  			  I915_READ(HDCP_STATUS(dev_priv, cpu_transcoder,
>  						port)));
>  		ret = -ENXIO;
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +					true);
>  		goto out;
>  	}
>  
>  	if (hdcp->shim->check_link(intel_dig_port)) {
>  		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> -			schedule_work(&hdcp->prop_work);
> +			intel_hdcp_update_value(connector,
> +				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
>  		}
>  		goto out;
>  	}
> @@ -897,16 +913,18 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
>  	ret = _intel_hdcp_disable(connector);
>  	if (ret) {
>  		DRM_ERROR("Failed to disable hdcp (%d)\n", ret);
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +					true);
>  		goto out;
>  	}
>  
>  	ret = _intel_hdcp_enable(connector);
>  	if (ret) {
>  		DRM_ERROR("Failed to enable hdcp (%d)\n", ret);
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +					true);
>  		goto out;
>  	}
>  
> @@ -1716,16 +1734,18 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  			  I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder,
>  						 port)));
>  		ret = -ENXIO;
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +					true);
>  		goto out;
>  	}
>  
>  	ret = hdcp->shim->check_2_2_link(intel_dig_port);
>  	if (ret == HDCP_LINK_PROTECTED) {
>  		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> -			schedule_work(&hdcp->prop_work);
> +			intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_ENABLED,
> +					true);
>  		}
>  		goto out;
>  	}
> @@ -1737,8 +1757,9 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  		DRM_DEBUG_KMS("HDCP2.2 Downstream topology change\n");
>  		ret = hdcp2_authenticate_repeater_topology(connector);
>  		if (!ret) {
> -			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> -			schedule_work(&hdcp->prop_work);
> +			intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_ENABLED,
> +					true);
>  			goto out;
>  		}
>  		DRM_DEBUG_KMS("[%s:%d] Repeater topology auth failed.(%d)\n",
> @@ -1753,8 +1774,8 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  	if (ret) {
>  		DRM_ERROR("[%s:%d] Failed to disable hdcp2.2 (%d)\n",
>  			  connector->base.name, connector->base.base.id, ret);
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +				DRM_MODE_CONTENT_PROTECTION_DESIRED, true);
>  		goto out;
>  	}
>  
> @@ -1763,8 +1784,9 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
>  		DRM_DEBUG_KMS("[%s:%d] Failed to enable hdcp2.2 (%d)\n",
>  			      connector->base.name, connector->base.base.id,
>  			      ret);
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +					true);
>  		goto out;
>  	}
>  
> @@ -2004,8 +2026,9 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  
>  	if (!ret) {
>  		schedule_delayed_work(&hdcp->check_work, check_link_interval);
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> -		schedule_work(&hdcp->prop_work);
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_ENABLED,
> +					true);
>  	}
>  
>  	mutex_unlock(&hdcp->mutex);
> @@ -2023,7 +2046,9 @@ int intel_hdcp_disable(struct intel_connector *connector)
>  	mutex_lock(&hdcp->mutex);
>  
>  	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		hdcp->value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +		intel_hdcp_update_value(connector,
> +					DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
> +					false);
>  		if (hdcp->hdcp2_encrypted)
>  			ret = _intel_hdcp2_disable(connector);
>  		else if (hdcp->hdcp_encrypted)
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
