Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525843E637
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 18:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981406E083;
	Thu, 28 Oct 2021 16:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08A96E083
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 16:37:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217630796"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="217630796"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 09:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="636265080"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 28 Oct 2021 09:37:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Oct 2021 19:37:22 +0300
Date: Thu, 28 Oct 2021 19:37:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] i915/display/dp: send a more fine-grained
 link-status uevent
Message-ID: <YXrRwhDHOSbuUIPC@intel.com>
References: <20211018084707.32253-1-contact@emersion.fr>
 <20211018084707.32253-7-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018084707.32253-7-contact@emersion.fr>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 08:47:31AM +0000, Simon Ser wrote:
> When link-status changes, send a hotplug uevent which contains the
> connector ID. That way, user-space can more easily figure out that
> only this connector has been updated.
> 
> Changes in v4: avoid sending two uevents (Ville)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 04175f359fd6..8b81a709d33b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5263,7 +5263,7 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
>  					       DRM_MODE_LINK_STATUS_BAD);
>  	mutex_unlock(&connector->dev->mode_config.mutex);
>  	/* Send Hotplug uevent so userspace can reprobe */
> -	drm_kms_helper_hotplug_event(connector->dev);
> +	drm_kms_helper_connector_hotplug_event(connector);
>  }
>  
>  bool
> -- 
> 2.33.1
> 

-- 
Ville Syrjälä
Intel
