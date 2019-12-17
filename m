Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53312354A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 19:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B86E07F;
	Tue, 17 Dec 2019 18:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB696E07F;
 Tue, 17 Dec 2019 18:56:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4AF822003E;
 Tue, 17 Dec 2019 19:56:32 +0100 (CET)
Date: Tue, 17 Dec 2019 19:56:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 3/8] drm/fb-helper: convert to drm device based logging
Message-ID: <20191217185631.GB30809@ravnborg.org>
References: <20191210123050.8799-1-jani.nikula@intel.com>
 <20191210123050.8799-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210123050.8799-3-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=fy8YIJQpmuL0Cm4RHZsA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani.

On Tue, Dec 10, 2019 at 02:30:45PM +0200, Jani Nikula wrote:
> Prefer drm_dbg_kms(), drm_info(), and drm_err() over all other
> logging. This is about KMS so switch to the KMS category while at it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 36 ++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index fb9bff0f4581..f8e905192608 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -191,6 +191,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
>  {
>  	struct drm_fb_helper *helper = info->par;
>  	struct drm_client_dev *client = &helper->client;
> +	struct drm_device *dev = helper->dev;
>  	struct drm_crtc *crtc;
>  	const struct drm_crtc_helper_funcs *funcs;
>  	struct drm_mode_set *mode_set;
> @@ -209,7 +210,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
>  			continue;
>  
>  		if (!fb) {
> -			DRM_ERROR("no fb to restore??\n");
> +			drm_err(dev, "no fb to restore?\n");

>  			continue;
>  		}
>  
> @@ -1248,12 +1249,13 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  {
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_framebuffer *fb = fb_helper->fb;
> +	struct drm_device *dev = fb_helper->dev;
>  
>  	if (in_dbg_master())
>  		return -EINVAL;
>  
>  	if (var->pixclock != 0) {
> -		DRM_DEBUG("fbdev emulation doesn't support changing the pixel clock, value of pixclock is ignored\n");
> +		drm_dbg_kms(dev, "fbdev emulation doesn't support changing the pixel clock, value of pixclock is ignored\n");
>  		var->pixclock = 0;
>  	}
>  
> @@ -1268,7 +1270,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  	if (var->bits_per_pixel != fb->format->cpp[0] * 8 ||
>  	    var->xres > fb->width || var->yres > fb->height ||
>  	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
> -		DRM_DEBUG("fb requested width/height/bpp can't fit in current fb "
> +		drm_dbg_kms(dev, "fb requested width/height/bpp can't fit in current fb "
>  			  "request %dx%d-%d (virtual %dx%d) > %dx%d-%d\n",
>  			  var->xres, var->yres, var->bits_per_pixel,
>  			  var->xres_virtual, var->yres_virtual,
> @@ -1295,7 +1297,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>  	 * so reject all pixel format changing requests.
>  	 */
>  	if (!drm_fb_pixel_format_equal(var, &info->var)) {
> -		DRM_DEBUG("fbdev emulation doesn't support changing the pixel format\n");
> +		drm_dbg_kms(dev, "fbdev emulation doesn't support changing the pixel format\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1320,7 +1322,7 @@ int drm_fb_helper_set_par(struct fb_info *info)
>  		return -EBUSY;
>  
>  	if (var->pixclock != 0) {
> -		DRM_ERROR("PIXEL CLOCK SET\n");
> +		drm_err(fb_helper->dev, "PIXEL CLOCK SET\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1430,6 +1432,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  					 int preferred_bpp)
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
>  	int ret = 0;
>  	int crtc_count = 0;
>  	struct drm_connector_list_iter conn_iter;
> @@ -1493,7 +1496,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  		struct drm_plane *plane = crtc->primary;
>  		int j;
>  
> -		DRM_DEBUG("test CRTC %u primary plane\n", drm_crtc_index(crtc));
> +		drm_dbg_kms(dev, "test CRTC %u primary plane\n", drm_crtc_index(crtc));
>  
>  		for (j = 0; j < plane->format_count; j++) {
>  			const struct drm_format_info *fmt;
> @@ -1526,7 +1529,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  		}
>  	}
>  	if (sizes.surface_depth != best_depth && best_depth) {
> -		DRM_INFO("requested bpp %d, scaled depth down to %d",
> +		drm_info(dev, "requested bpp %d, scaled depth down to %d",
>  			 sizes.surface_bpp, best_depth);
>  		sizes.surface_depth = best_depth;
>  	}
> @@ -1574,7 +1577,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  	mutex_unlock(&client->modeset_mutex);
>  
>  	if (crtc_count == 0 || sizes.fb_width == -1 || sizes.fb_height == -1) {
> -		DRM_INFO("Cannot find any crtc or sizes\n");
> +		drm_info(dev, "Cannot find any crtc or sizes\n");
>  
>  		/* First time: disable all crtc's.. */
>  		if (!fb_helper->deferred_setup)
> @@ -1889,7 +1892,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  
>  	drm_master_internal_release(fb_helper->dev);
>  
> -	DRM_DEBUG_KMS("\n");
> +	drm_dbg_kms(fb_helper->dev, "\n");
>  
>  	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
>  	drm_setup_crtcs_fb(fb_helper);
> @@ -2026,15 +2029,16 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  				       struct drm_fb_helper_surface_size *sizes)
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
>  	struct drm_client_buffer *buffer;
>  	struct drm_framebuffer *fb;
>  	struct fb_info *fbi;
>  	u32 format;
>  	void *vaddr;
>  
> -	DRM_DEBUG_KMS("surface width(%d), height(%d) and bpp(%d)\n",
> -		      sizes->surface_width, sizes->surface_height,
> -		      sizes->surface_bpp);
> +	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> +		    sizes->surface_width, sizes->surface_height,
> +		    sizes->surface_bpp);
>  
>  	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
>  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
> @@ -2118,7 +2122,7 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  		return drm_fb_helper_hotplug_event(dev->fb_helper);
>  
>  	if (!dev->mode_config.num_connector) {
> -		DRM_DEV_DEBUG(dev->dev, "No connectors found, will not create framebuffer!\n");
> +		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
>  		return 0;
>  	}
>  
> @@ -2143,7 +2147,7 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	fb_helper->dev = NULL;
>  	fb_helper->fbdev = NULL;
>  
> -	DRM_DEV_ERROR(dev->dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
> +	drm_err(dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
>  
>  	return ret;
>  }
> @@ -2200,7 +2204,7 @@ int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
>  	if (ret) {
>  		kfree(fb_helper);
> -		DRM_DEV_ERROR(dev->dev, "Failed to register client: %d\n", ret);
> +		drm_err(dev, "Failed to register client: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -2212,7 +2216,7 @@ int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  
>  	ret = drm_fbdev_client_hotplug(&fb_helper->client);
>  	if (ret)
> -		DRM_DEV_DEBUG(dev->dev, "client hotplug ret=%d\n", ret);
> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>  
>  	drm_client_register(&fb_helper->client);
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
