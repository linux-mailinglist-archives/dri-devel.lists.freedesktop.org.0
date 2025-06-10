Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6498AD3F53
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B83E10E5C4;
	Tue, 10 Jun 2025 16:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E961410E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:42:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E32BC14BF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:42:35 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 062FC3F673
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:42:54 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:42:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/arm/hdlcd: Replace struct simplefb_format with
 custom type
Message-ID: <aEhgi_5EMNZuN_T9@e110455-lin.cambridge.arm.com>
References: <20250610073027.322944-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610073027.322944-1-tzimmermann@suse.de>
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

On Tue, Jun 10, 2025 at 09:28:55AM +0200, Thomas Zimmermann wrote:
> Map DRM FourCC codes to pixel descriptions with an internal struct
> type. Avoid simplefb's struct simplefb_format, which is for parsing
> "simple-framebuffer" DT nodes. Drop the unsupported formats with
> alpha channel from the list.
> 
> The HDLCD drivers uses struct simplefb_format and its default
> initializer SIMPLEFB_FORMATS to map DRM_FORMAT_ constants to pixel
> descriptions. The simplefb helpers are for parsing "simple-framebuffer"
> DT nodes and should be avoided in other context. Therefore replace it
> in hdlcd with a custom struct type and pixel descriptions from
> PIXEL_FORMAT_ constants.
> 
> This change also removes including <linux/platform_data/simplefb.h>,
> which includes several unrelated headers, such as <linux/fb.h>.
> 
> v2:
> - drop unsupported alpha formats (Liviu)
> - keep original sorting of formats (Javier)
> - use anonymous type for supported_formats
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Are you happy to merge this yourself?

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> index 3cfefadc7c9d..806da0aaedf7 100644
> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> @@ -11,8 +11,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/of_graph.h>
> -#include <linux/platform_data/simplefb.h>
>  
> +#include <video/pixel_format.h>
>  #include <video/videomode.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -73,7 +73,17 @@ static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
>  	.disable_vblank = hdlcd_crtc_disable_vblank,
>  };
>  
> -static struct simplefb_format supported_formats[] = SIMPLEFB_FORMATS;
> +static const struct {
> +	u32 fourcc;
> +	struct pixel_format pixel;
> +} supported_formats[] = {
> +	{ DRM_FORMAT_RGB565, PIXEL_FORMAT_RGB565 },
> +	{ DRM_FORMAT_XRGB1555, PIXEL_FORMAT_XRGB1555 },
> +	{ DRM_FORMAT_RGB888, PIXEL_FORMAT_RGB888 },
> +	{ DRM_FORMAT_XRGB8888, PIXEL_FORMAT_XRGB8888 },
> +	{ DRM_FORMAT_XBGR8888, PIXEL_FORMAT_XBGR8888 },
> +	{ DRM_FORMAT_XRGB2101010, PIXEL_FORMAT_XRGB2101010},
> +};
>  
>  /*
>   * Setup the HDLCD registers for decoding the pixels out of the framebuffer
> @@ -83,15 +93,12 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
>  	unsigned int btpp;
>  	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
>  	const struct drm_framebuffer *fb = crtc->primary->state->fb;
> -	uint32_t pixel_format;
> -	struct simplefb_format *format = NULL;
> +	const struct pixel_format *format = NULL;
>  	int i;
>  
> -	pixel_format = fb->format->format;
> -
>  	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
> -		if (supported_formats[i].fourcc == pixel_format)
> -			format = &supported_formats[i];
> +		if (supported_formats[i].fourcc == fb->format->format)
> +			format = &supported_formats[i].pixel;
>  	}
>  
>  	if (WARN_ON(!format))
> -- 
> 2.49.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
