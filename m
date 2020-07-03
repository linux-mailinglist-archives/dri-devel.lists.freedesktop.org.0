Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CC213990
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 13:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640186EB5C;
	Fri,  3 Jul 2020 11:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99A26EB5C;
 Fri,  3 Jul 2020 11:47:37 +0000 (UTC)
IronPort-SDR: ACPfc4qi6w2eEgkId7VCVHTgLzaxgmuBRKvxfQwIWZSbfJJ59pjyzsn7AqTONZyqbJa2g5GJy4
 kYEveyJwB+zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="145267434"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="145267434"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2020 04:47:37 -0700
IronPort-SDR: XnojOUXL4IwR6t3woKXYl3DvsPxu/ThYmAtQzKycV3zMNliNZuoEi4qODSWnujvUFCf8vqOudJ
 ReGd5Xg2ScAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="296191029"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by orsmga002.jf.intel.com with ESMTP; 03 Jul 2020 04:47:35 -0700
Date: Fri, 3 Jul 2020 17:06:04 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH v7 08/17] drm/i915: Clean up intel_hdcp_disable
Message-ID: <20200703113603.GJ15183@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-9-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623155907.22961-9-sean@poorly.run>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-23 at 21:28:58 +0530, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add an out label and un-indent hdcp disable in preparation for
> hdcp_mutex. No functional changes
LGTM
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
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
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
