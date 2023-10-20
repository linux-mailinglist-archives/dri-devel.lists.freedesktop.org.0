Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870E7D0F3D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 13:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEA110E0D7;
	Fri, 20 Oct 2023 11:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D9210E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697802986; x=1729338986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vi9gcdOQuJ1GYgeD/cHE3m8BjhJ1VRk6bqcKI13kyEE=;
 b=CUoqn4K/Fmv0dZfvckACLaWO8MBgNcN6q9oW6BVxYj+o+yLxw33qUyXS
 huWOavSHinB+7vs2bQsbyxWAMQ96jC36q1iOcpUt4Be+ljw4apkl05M+a
 wykwCD9PCNwgpOzUntMhxr8Y8iBCsRFg5XpMUXXg7Tf48RW2f6mLtuecP
 YjpXELztptji3IPufrOsRPu/OwM7odZuF1XwiWR7TfYVZxL0VKuGdQqtR
 R+wO2xUNltIAVi96Z6dNB4ZuIkc2ZvNsGeUYiQjI9tDpQh2zxZDU5p9zM
 kSgm3VYou2Yx3JtyGEOyrUq/YbZ7NJjYswW8rGBiEymNtzf+2m2VXj2y6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366712040"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="366712040"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 04:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848058201"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848058201"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by FMSMGA003.fm.intel.com with SMTP; 20 Oct 2023 04:56:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Oct 2023 14:56:21 +0300
Date: Fri, 20 Oct 2023 14:56:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: extract closefb logic in separate function
Message-ID: <ZTJq5R4GvLEE85Yb@intel.com>
References: <20231020101926.145327-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020101926.145327-1-contact@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Dennis Filder <d.filder@web.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 10:19:38AM +0000, Simon Ser wrote:
> drm_mode_rmfb performs two operations: drop the FB from the
> file_priv->fbs list, and make sure the FB is no longer used on a
> plane.
> 
> In the next commit an IOCTL which only does so former will be
> introduced, so let's split it into a separate function.
> 
> No functional change, only refactoring.
> 
> v2: no change
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Dennis Filder <d.filder@web.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Daniel Stone <daniels@collabora.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 51 +++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index d3ba0698b84b..62306196808c 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -394,6 +394,31 @@ static void drm_mode_rmfb_work_fn(struct work_struct *w)
>  	}
>  }
>  
> +static int drm_mode_closefb(struct drm_framebuffer *fb,
> +			    struct drm_file *file_priv)
> +{
> +	struct drm_framebuffer *fbl = NULL;

The initialization confused me a bit. Made me expect this to
get used somehow after the loop has finished. But now I see
it's entirely redundant, and was already there in the original.

> +	bool found = false;
> +
> +	mutex_lock(&file_priv->fbs_lock);
> +	list_for_each_entry(fbl, &file_priv->fbs, filp_head)
> +		if (fb == fbl)
> +			found = true;
> +
> +	if (!found) {
> +		mutex_unlock(&file_priv->fbs_lock);
> +		return -ENOENT;
> +	}
> +
> +	list_del_init(&fb->filp_head);
> +	mutex_unlock(&file_priv->fbs_lock);
> +
> +	/* Drop the reference that was stored in the fbs list */
> +	drm_framebuffer_put(fb);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_mode_rmfb - remove an FB from the configuration
>   * @dev: drm device
> @@ -411,8 +436,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
>  		  struct drm_file *file_priv)
>  {
>  	struct drm_framebuffer *fb = NULL;

This initialization also looks redundant.

Could drop them already in this patch I think, or as a followup.

> -	struct drm_framebuffer *fbl = NULL;
> -	int found = 0;
> +	int ret;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
> @@ -421,23 +445,14 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
>  	if (!fb)
>  		return -ENOENT;
>  
> -	mutex_lock(&file_priv->fbs_lock);
> -	list_for_each_entry(fbl, &file_priv->fbs, filp_head)
> -		if (fb == fbl)
> -			found = 1;
> -	if (!found) {
> -		mutex_unlock(&file_priv->fbs_lock);
> -		goto fail_unref;
> +	ret = drm_mode_closefb(fb, file_priv);
> +	if (ret != 0) {
> +		drm_framebuffer_put(fb);
> +		return ret;
>  	}
>  
> -	list_del_init(&fb->filp_head);
> -	mutex_unlock(&file_priv->fbs_lock);
> -
> -	/* drop the reference we picked up in framebuffer lookup */
> -	drm_framebuffer_put(fb);
> -
>  	/*
> -	 * we now own the reference that was stored in the fbs list
> +	 * We now own the reference we picked up in drm_framebuffer_lookup.

I think it should be fairly obvious that you own the reference
from any lookup, so this part of the comment feels redundant now.

Anyways, the patch looks correct to me
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  	 *
>  	 * drm_framebuffer_remove may fail with -EINTR on pending signals,
>  	 * so run this in a separate stack as there's no way to correctly
> @@ -457,10 +472,6 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
>  		drm_framebuffer_put(fb);
>  
>  	return 0;
> -
> -fail_unref:
> -	drm_framebuffer_put(fb);
> -	return -ENOENT;
>  }
>  
>  int drm_mode_rmfb_ioctl(struct drm_device *dev,
> -- 
> 2.42.0
> 

-- 
Ville Syrjälä
Intel
