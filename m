Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A442088B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 11:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42F6E193;
	Mon,  4 Oct 2021 09:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5E76E193
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 09:41:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311562532"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="311562532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 02:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="566951911"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 04 Oct 2021 02:41:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 12:41:00 +0300
Date: Mon, 4 Oct 2021 12:41:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: Re: [PATCH 15/16] Revert "drm/i915: cleanup:
 drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"
Message-ID: <YVrMLNa/oaP2+ZWx@intel.com>
References: <20211002154542.15800-1-sean@poorly.run>
 <20211002154542.15800-15-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002154542.15800-15-sean@poorly.run>
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

On Sat, Oct 02, 2021 at 11:45:41AM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This reverts commit 399190e70816886e2bca1f3f3bc3d9c544af88e7.
> 
> This patchset breaks on intel platforms and was previously NACK'd by
> Ville.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Fernando Ramos <greenfoo@u92.eu>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Yeah, best to try again from the start I think.

For the series
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 2bf01416d656..134a6acbd8fb 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -43,7 +43,6 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
> -#include <drm/drm_drv.h>
>  
>  #include "display/intel_audio.h"
>  #include "display/intel_crt.h"
> @@ -13477,13 +13476,22 @@ void intel_display_resume(struct drm_device *dev)
>  	if (state)
>  		state->acquire_ctx = &ctx;
>  
> -	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> +	drm_modeset_acquire_init(&ctx, 0);
>  
> -	ret = __intel_display_resume(dev, state, &ctx);
> +	while (1) {
> +		ret = drm_modeset_lock_all_ctx(dev, &ctx);
> +		if (ret != -EDEADLK)
> +			break;
>  
> -	intel_enable_ipc(dev_priv);
> +		drm_modeset_backoff(&ctx);
> +	}
> +
> +	if (!ret)
> +		ret = __intel_display_resume(dev, state, &ctx);
>  
> -	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +	intel_enable_ipc(dev_priv);
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
>  
>  	if (ret)
>  		drm_err(&dev_priv->drm,
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS

-- 
Ville Syrjälä
Intel
