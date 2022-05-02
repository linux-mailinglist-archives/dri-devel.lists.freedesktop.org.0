Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43343517412
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B812B10ECF0;
	Mon,  2 May 2022 16:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F1210EB94
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:17:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1555C474;
 Mon,  2 May 2022 18:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651508239;
 bh=c+lFCqqrxYQkBT4Dk1RtT/1nSh3E7EO4tZr2yzZYmYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6VHAMn3IuCnmDyXupcm1VxxL/fCaJsfOpOk0BF0ok1Be+zl9cuHuaV22sUgCMHKI
 PMCTsRA/pWv3s+s2mjByj5GDWvJGUkQ+3/NZp/TYckr7YjPguUgoH4gG3sL0jj5GVU
 vSiid340Eer6gfojKpc20F0j1AM1OLozPtI9WYA4=
Date: Mon, 2 May 2022 19:17:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Message-ID: <YnAEDlikr+d8cvy4@pendragon.ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220502153900.408522-4-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

Thank you for the patch.

On Mon, May 02, 2022 at 05:39:00PM +0200, Javier Martinez Canillas wrote:
> Indicate to fbdev subsystem that the registered framebuffer is provided by
> the system firmware, so that it can handle accordingly. For example, would
> unregister the FB devices if asked to remove the conflicting framebuffers.
> 
> Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
> Drivers can use this to indicate the FB helper initialization that the FB
> registered is provided by the firmware, so it can be configured as such.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/drm_fb_helper.c  |  9 +++++++++
>  drivers/gpu/drm/tiny/simpledrm.c |  2 +-
>  include/drm/drm_fb_helper.h      | 10 ++++++++++
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index fd0084ad77c3..775e47c5de1f 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
>  		/* don't leak any physical addresses to userspace */
>  		info->flags |= FBINFO_HIDE_SMEM_START;
>  
> +	/* Indicate that the framebuffer is provided by the firmware */
> +	if (fb_helper->firmware)
> +		info->flags |= FBINFO_MISC_FIRMWARE;
> +
>  	/* Need to drop locks to avoid recursive deadlock in
>  	 * register_framebuffer. This is ok because the only thing left to do is
>  	 * register the fbdev emulation instance in kernel_fb_helper_list. */
> @@ -2512,6 +2516,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>   *
>   * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>   *   @dev->mode_config.preferred_depth is used instead.
> + * * DRM_FB_FW: if the framebuffer for the device is provided by the
> + *   system firmware.
>   *
>   * This function sets up generic fbdev emulation for drivers that supports
>   * dumb buffers with a virtual address and that can be mmap'ed.
> @@ -2538,6 +2544,7 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
>  {
>  	struct drm_fb_helper *fb_helper;
>  	unsigned int preferred_bpp = DRM_FB_GET_OPTION(DRM_FB_BPP, options);
> +	bool firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);
>  	int ret;
>  
>  	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
> @@ -2570,6 +2577,8 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
>  		preferred_bpp = 32;
>  	fb_helper->preferred_bpp = preferred_bpp;
>  
> +	fb_helper->firmware = firmware;

I'd get rid of the local variable and write

	fb_helper->firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	ret = drm_fbdev_client_hotplug(&fb_helper->client);
>  	if (ret)
>  		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index f5b8e864a5cd..5dcc21ea6180 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -901,7 +901,7 @@ static int simpledrm_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	drm_fbdev_generic_setup(dev, 0);
> +	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 740f87560102..77a72d55308d 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -44,6 +44,7 @@ enum mode_set_atomic {
>  };
>  
>  #define DRM_FB_BPP_MASK GENMASK(7, 0)
> +#define DRM_FB_FW_MASK GENMASK(8, 8)
>  
>  /* Using the GNU statement expression extension */
>  #define DRM_FB_OPTION(option, value)				\
> @@ -197,6 +198,15 @@ struct drm_fb_helper {
>  	 * See also: @deferred_setup
>  	 */
>  	int preferred_bpp;
> +
> +	/**
> +	 * @firmware:
> +	 *
> +	 * Set if the driver indicates to the FB helper initialization that the
> +	 * framebuffer for the device being registered is provided by firmware,
> +	 * so that it can pass this on when registering the framebuffer device.
> +	 */
> +	bool firmware;
>  };
>  
>  static inline struct drm_fb_helper *

-- 
Regards,

Laurent Pinchart
