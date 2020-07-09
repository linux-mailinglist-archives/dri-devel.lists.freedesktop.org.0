Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB093219814
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 07:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662276E999;
	Thu,  9 Jul 2020 05:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782D96E3D2;
 Thu,  9 Jul 2020 05:44:34 +0000 (UTC)
IronPort-SDR: KfSyM1Puq55ywNwrbHYioOcuJNkK37phFOeEClJ7mDqxhnX/7gsqLsdKvuI9HHQt0Auifxu1oS
 AYxouZwzfYKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="212857001"
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="212857001"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 22:44:33 -0700
IronPort-SDR: SRmx2DrZC4r1LyrVeXQJDPw3jNAiE6AMzSOZC6BYnP7SPQxULYIvVtLfwN7OhIXVOtVqepbg+U
 SVE8PpBqqIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="314844988"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2020 22:44:30 -0700
Date: Thu, 9 Jul 2020 11:10:51 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v7 08/17] drm/i915: Clean up intel_hdcp_disable
Message-ID: <20200709054051.GA13481@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-9-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623155907.22961-9-sean@poorly.run>
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

On 2020-06-23 at 11:58:58 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add an out label and un-indent hdcp disable in preparation for
> hdcp_mutex. No functional changes
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-9-sean@poorly.run #v6
> 
> Changes in v7:
> -Split into separate patch (Ramalingam)
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 62cab3aea745..16bf0fbe5f17 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2113,16 +2113,17 @@ int intel_hdcp_disable(struct intel_connector *connector)
>  
>  	mutex_lock(&hdcp->mutex);
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
>  
> +	intel_hdcp_update_value(connector,
> +				DRM_MODE_CONTENT_PROTECTION_UNDESIRED, false);
> +	if (hdcp->hdcp2_encrypted)
> +		ret = _intel_hdcp2_disable(connector);
> +	else if (hdcp->hdcp_encrypted)
> +		ret = _intel_hdcp_disable(connector);
> +
> +out:
>  	mutex_unlock(&hdcp->mutex);
>  	cancel_delayed_work_sync(&hdcp->check_work);
>  	return ret;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
