Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E342E16B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114F6EC1E;
	Thu, 14 Oct 2021 18:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188E16EC1E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:36:32 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id a6a30231-2d1d-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:36:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E7335194B6A;
 Thu, 14 Oct 2021 20:36:38 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:36:29 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
Subject: Re: [PATCH v3 2/7] drm/kmb: Limit supported mode to 1080p
Message-ID: <YWh4rfaBc3h/0ROG@ravnborg.org>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-2-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013233632.471892-2-anitha.chrisanthus@intel.com>
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

On Wed, Oct 13, 2021 at 04:36:27PM -0700, Anitha Chrisanthus wrote:
> KMB only supports single resolution(1080p), this commit checks for
> 1920x1080x60 or 1920x1080x59 in crtc_mode_valid.
> Also, modes with vfp < 4 are not supported in KMB display. This change
> prunes display modes with vfp < 4.
> 
> v2: added vfp check
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>

This looks wrong. I assume it Edmund also did some development work so
you should also add:
Co-developed-by: Edmund Dea <edmund.j.dea@intel.com>

One nit below. With these nits fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/kmb/kmb_crtc.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_drv.h  | 13 ++++++++++---
>  2 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
> index 44327bc629ca..08a45e813db7 100644
> --- a/drivers/gpu/drm/kmb/kmb_crtc.c
> +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> @@ -185,11 +185,45 @@ static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
>  
> +static enum drm_mode_status
> +		kmb_crtc_mode_valid(struct drm_crtc *crtc,
> +				    const struct drm_display_mode *mode)
> +{
> +	int refresh;
> +	struct drm_device *dev = crtc->dev;
> +	int vfp = mode->vsync_start - mode->vdisplay;
> +
> +	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
> +		drm_dbg(dev, "height = %d less than %d",
> +			mode->vdisplay, KMB_CRTC_MAX_HEIGHT);
> +		return MODE_BAD_VVALUE;
> +	}
> +	if (mode->hdisplay < KMB_CRTC_MAX_WIDTH) {
> +		drm_dbg(dev, "width = %d less than %d",
> +			mode->hdisplay, KMB_CRTC_MAX_WIDTH);
> +		return MODE_BAD_HVALUE;
> +	}
> +	refresh = drm_mode_vrefresh(mode);
> +	if (refresh < KMB_MIN_VREFRESH || refresh > KMB_MAX_VREFRESH) {
> +		drm_dbg(dev, "refresh = %d less than %d or greater than %d",
> +			refresh, KMB_MIN_VREFRESH, KMB_MAX_VREFRESH);
> +		return MODE_BAD;
> +	}
> +
> +	if (vfp < KMB_CRTC_MIN_VFP) {
> +		drm_dbg(dev, "vfp = %d less than %d", vfp, KMB_CRTC_MIN_VFP);
> +		return MODE_BAD;
> +	}
> +
> +	return MODE_OK;
> +}
> +
>  static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs = {
>  	.atomic_begin = kmb_crtc_atomic_begin,
>  	.atomic_enable = kmb_crtc_atomic_enable,
>  	.atomic_disable = kmb_crtc_atomic_disable,
>  	.atomic_flush = kmb_crtc_atomic_flush,
> +	.mode_valid = kmb_crtc_mode_valid,
>  };
>  
>  int kmb_setup_crtc(struct drm_device *drm)
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
> index 69a62e2d03ff..d297218869e8 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.h
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -18,13 +18,20 @@
>  
>  #define DRIVER_DATE			"20210223"
>  #define DRIVER_MAJOR			1
> -#define DRIVER_MINOR			1
> -
> +#define DRIVER_MINOR			2
This change looks un-related.

> +
> +/* Platform definitions */
> +#define KMB_CRTC_MIN_VFP		4
> +#define KMB_CRTC_MAX_WIDTH		1920 /* max width in pixels */
> +#define KMB_CRTC_MAX_HEIGHT		1080 /* max height in pixels */
> +#define KMB_CRTC_MIN_WIDTH		1920
> +#define KMB_CRTC_MIN_HEIGHT		1080
>  #define KMB_FB_MAX_WIDTH		1920
>  #define KMB_FB_MAX_HEIGHT		1080
>  #define KMB_FB_MIN_WIDTH		1
>  #define KMB_FB_MIN_HEIGHT		1
> -
> +#define KMB_MIN_VREFRESH		59    /*vertical refresh in Hz */
> +#define KMB_MAX_VREFRESH		60    /*vertical refresh in Hz */
>  #define KMB_LCD_DEFAULT_CLK		200000000
>  #define KMB_SYS_CLK_MHZ			500
>  
> -- 
> 2.25.1
