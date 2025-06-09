Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D7AD1B52
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 12:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A4D10E055;
	Mon,  9 Jun 2025 10:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9810E040
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 10:17:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 164661515
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 03:16:54 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B46B63F673
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 03:17:12 -0700 (PDT)
Date: Mon, 9 Jun 2025 11:17:09 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/arm/hdlcd: Replace struct simplefb_format with
 custom type
Message-ID: <aEa0pQJ9FFhJgWkR@e110455-lin.cambridge.arm.com>
References: <20250527094336.73524-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527094336.73524-1-tzimmermann@suse.de>
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

On Tue, May 27, 2025 at 11:42:57AM +0200, Thomas Zimmermann wrote:
> Map DRM FourCC codes to pixel descriptions with internal type struct
> hdlcd_format. Reorder formats by preference. Avoid simplefb's struct
> simplefb_format, which is for parsing "simple-framebuffer" DT nodes.
> 
> The HDLCD drivers uses struct simplefb_format and its default
> initializer SIMPLEFB_FORMATS to map DRM_FORMAT_ constants to pixel
> descriptions. The simplefb helpers are for parsing "simple-framebuffer"
> DT nodes and should be avoided in other context. Therefore replace
> it in hdlcd with the custom type struct hdlcd_format and the pixel
> descriptions from PIXEL_FORMAT_ constants.
> 
> Plane formats exported to userspace are roughly sorted as preferred
> by hardware and/or driver. SIMPLEFB_FORMATS currently puts 16-bit
> formats to the top of the list. Changing to struct hdlcd_format
> allows for reordering the format list. 32-bit formats are now the
> preferred ones.
> 
> This change also removes including <linux/platform_data/simplefb.h>,
> which includes several unrelated headers, such as <linux/fb.h>.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c | 32 +++++++++++++++++++++++---------
>  include/video/pixel_format.h     | 15 +++++++++++++++
>  2 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> index 3cfefadc7c9d..6fabe65ec0a2 100644
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
> @@ -28,6 +28,25 @@
>  #include "hdlcd_drv.h"
>  #include "hdlcd_regs.h"
>  
> +struct hdlcd_format {
> +	u32 fourcc;
> +	struct pixel_format pixel;
> +};
> +
> +static const struct hdlcd_format supported_formats[] = {
> +	{ DRM_FORMAT_XRGB8888, PIXEL_FORMAT_XRGB8888 },
> +	{ DRM_FORMAT_ARGB8888, PIXEL_FORMAT_ARGB8888 },
> +	{ DRM_FORMAT_XBGR8888, PIXEL_FORMAT_XBGR8888 },
> +	{ DRM_FORMAT_ABGR8888, PIXEL_FORMAT_ABGR8888 },
> +	{ DRM_FORMAT_XRGB2101010, PIXEL_FORMAT_XRGB2101010},
> +	{ DRM_FORMAT_ARGB2101010, PIXEL_FORMAT_ARGB2101010},
> +	{ DRM_FORMAT_RGB565, PIXEL_FORMAT_RGB565 },
> +	{ DRM_FORMAT_RGBA5551, PIXEL_FORMAT_RGBA5551 },
> +	{ DRM_FORMAT_XRGB1555, PIXEL_FORMAT_XRGB1555 },
> +	{ DRM_FORMAT_ARGB1555, PIXEL_FORMAT_ARGB1555 },
> +	{ DRM_FORMAT_RGB888, PIXEL_FORMAT_RGB888 },
> +};
> +
>  /*
>   * The HDLCD controller is a dumb RGB streamer that gets connected to
>   * a single HDMI transmitter or in the case of the ARM Models it gets
> @@ -73,8 +92,6 @@ static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
>  	.disable_vblank = hdlcd_crtc_disable_vblank,
>  };
>  
> -static struct simplefb_format supported_formats[] = SIMPLEFB_FORMATS;

Sorry, I was on holiday when you've sent the patch and it fell to the bottom of the pile.


When I did the initial patch for HDLCD using the SIMPLEFB_FORMATS was convenient as I
didn't had to type all the "supported" formats, even if the one carrying the alpha
channel were ignored (HDLCD only has one plane). If we're going to move the supported
formats in this file I would suggest trimming it down to remove all the alpha-channel
formats as they are pointless to list as supported. If there is no other user of the
formats added in pixel_format.h then that should slim down the patch considerably.

Best regards,
Liviu

> -
>  /*
>   * Setup the HDLCD registers for decoding the pixels out of the framebuffer
>   */
> @@ -83,15 +100,12 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
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
> diff --git a/include/video/pixel_format.h b/include/video/pixel_format.h
> index b5104b2a3a13..5ad2386e2014 100644
> --- a/include/video/pixel_format.h
> +++ b/include/video/pixel_format.h
> @@ -23,6 +23,12 @@ struct pixel_format {
>  #define PIXEL_FORMAT_XRGB1555 \
>  	{ 16, false, { .alpha = {0, 0}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
>  
> +#define PIXEL_FORMAT_ARGB1555 \
> +	{ 16, false, { .alpha = {15, 1}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
> +
> +#define PIXEL_FORMAT_RGBA5551 \
> +	{ 16, false, { .alpha = {0, 1}, .red = {11, 5}, .green = {6, 5}, .blue = {1, 5} } }
> +
>  #define PIXEL_FORMAT_RGB565 \
>  	{ 16, false, { .alpha = {0, 0}, .red = {11, 5}, .green = {5, 6}, .blue = {0, 5} } }
>  
> @@ -32,10 +38,19 @@ struct pixel_format {
>  #define PIXEL_FORMAT_XRGB8888 \
>  	{ 32, false, { .alpha = {0, 0}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
>  
> +#define PIXEL_FORMAT_ARGB8888 \
> +	{ 32, false, { .alpha = {24, 8}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
> +
>  #define PIXEL_FORMAT_XBGR8888 \
>  	{ 32, false, { .alpha = {0, 0}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
>  
> +#define PIXEL_FORMAT_ABGR8888 \
> +	{ 32, false, { .alpha = {24, 8}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
> +
>  #define PIXEL_FORMAT_XRGB2101010 \
>  	{ 32, false, { .alpha = {0, 0}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
>  
> +#define PIXEL_FORMAT_ARGB2101010 \
> +	{ 32, false, { .alpha = {30, 1}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
> +
>  #endif
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
