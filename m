Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1011E289
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3C66E4A2;
	Fri, 13 Dec 2019 11:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35606E4A2;
 Fri, 13 Dec 2019 11:11:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 03:11:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="414254853"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2019 03:11:22 -0800
Date: Fri, 13 Dec 2019 16:40:33 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 07/12] drm/i915: Protect workers against disappearing
 connectors
Message-ID: <20191213111033.GF3829@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-8-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-8-sean@poorly.run>
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

On 2019-12-12 at 14:02:25 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds some protection against connectors being destroyed
> before the HDCP workers are finished.
> 
> For check_work, we do a synchronous cancel after the connector is
> unregistered which will ensure that it is finished before destruction.
> 
> In the case of prop_work, we can't do a synchronous wait since it needs
> to take connection_mutex which could cause deadlock. Instead, we'll take
> a reference on the connector when scheduling prop_work and give it up
> once we're done.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Will there be an instance where prop_work is scheduled but before
execution cancelled from the queue itself? This will leak the connector
reference.

Atleast hdcp stack is not requesting for such action. So Looks good to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Changes in v2:
> - Added to the set
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 38 ++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 798e7e1a19fc..c79dca2c74d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -863,8 +863,10 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
>  		return;
>  
>  	hdcp->value = value;
> -	if (update_property)
> +	if (update_property) {
> +		drm_connector_get(&connector->base);
>  		schedule_work(&hdcp->prop_work);
> +	}
>  }
>  
>  /* Implements Part 3 of the HDCP authorization procedure */
> @@ -954,6 +956,8 @@ static void intel_hdcp_prop_work(struct work_struct *work)
>  
>  	mutex_unlock(&hdcp->mutex);
>  	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	drm_connector_put(&connector->base);
>  }
>  
>  bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
> @@ -1802,6 +1806,9 @@ static void intel_hdcp_check_work(struct work_struct *work)
>  					       check_work);
>  	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
>  
> +	if (drm_connector_is_unregistered(&connector->base))
> +		return;
> +
>  	if (!intel_hdcp2_check_link(connector))
>  		schedule_delayed_work(&hdcp->check_work,
>  				      DRM_HDCP2_CHECK_PERIOD_MS);
> @@ -2076,12 +2083,33 @@ void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
>  
>  void intel_hdcp_cleanup(struct intel_connector *connector)
>  {
> -	if (!connector->hdcp.shim)
> +	struct intel_hdcp *hdcp = &connector->hdcp;
> +
> +	if (!hdcp->shim)
>  		return;
>  
> -	mutex_lock(&connector->hdcp.mutex);
> -	kfree(connector->hdcp.port_data.streams);
> -	mutex_unlock(&connector->hdcp.mutex);
> +	WARN_ON(!drm_connector_is_unregistered(&connector->base));
> +
> +	/*
> +	 * Now that the connector is unregistered, check_work won't be run, but
> +	 * cancel any outstanding instances of it
> +	 */
> +	cancel_delayed_work_sync(&hdcp->check_work);
> +
> +	/*
> +	 * We don't cancel prop_work in the same way as check_work since it
> +	 * requires connection_mutex which could be held while calling this
> +	 * function. Instead, we rely on the connector references grabbed before
> +	 * scheduling prop_work to ensure the connector is alive when prop_work
> +	 * is run. So if we're in the destroy path (which is where this
> +	 * function should be called), we're "guaranteed" that prop_work is not
> +	 * active (tl;dr This Should Never Happen).
> +	 */
> +	WARN_ON(work_pending(&hdcp->prop_work));
> +
> +	mutex_lock(&hdcp->mutex);
> +	kfree(hdcp->port_data.streams);
> +	mutex_unlock(&hdcp->mutex);
>  }
>  
>  void intel_hdcp_atomic_check(struct drm_connector *connector,
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
