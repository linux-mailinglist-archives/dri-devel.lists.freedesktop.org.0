Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5904B29A1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B67C10EA8D;
	Fri, 11 Feb 2022 16:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0805610EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644595514; x=1676131514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pTgOuzm7jCaTfwCYp5a9jm8xnylwK40ORkaUjtK0E8Y=;
 b=KfNVTOF8NlIXXyYF/FAYudjz6WCDrOwEyiiMSIbTauT595fDvvly6qwb
 gtt8KHX5eNGHQrK8wCcvV8+nJj7XtRhtXtMSj6sMo8u7eQu40N1DcCkBi
 zHYM6+Ipv8NJgqdn1SOOWsEWs2EJ4rDU/Ks5jgObLg/W6d9twOoAAe0PO
 Qvj/JU5mmimy8fm9xVtXkhrRpwASoVXmL25Y3bm98Jt1KPGvElHotvA62
 C4RYkvymL4zQV3hO7RixnMfMGsBCPrj/OqRUtEqk96er7iX5sTma+ZMCn
 c2Vyw694nKpMlt0uEjjB4q46rjZDQkmgBJhq85LcUwmuTVUzQR0rIiA4x w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="310493463"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="310493463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:05:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="500817793"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:05:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIYP6-003Uy5-Hr; Fri, 11 Feb 2022 18:04:12 +0200
Date: Fri, 11 Feb 2022 18:04:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
Message-ID: <YgaI/Kz8hl1Nut+V@smile.fi.intel.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
 <20220211143358.3112958-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211143358.3112958-3-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 03:33:54PM +0100, Javier Martinez Canillas wrote:
> Add support to convert from XR24 to reversed monochrome for drivers that
> control monochromatic display panels, that only have 1 bit per pixel.
> 
> The function does a line-by-line conversion doing an intermediate step
> first from XR24 to 8-bit grayscale and then to reversed monochrome.
> 
> The drm_fb_gray8_to_mono_reversed_line() helper was based on code from
> drivers/gpu/drm/tiny/repaper.c driver.


I believe there is enough room for (micro-)optimizations (like moving out
invariant conditionals from the loop), but since it's almost a direct copy
of the existing code let's improve it later on.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 
> Changes in v5:
> - Use drm_WARN_ON* macros instead of deprecated ones (Thomas Zimmermann)
> 
> Changes in v4:
> - Rename end_offset to end_len (Thomas Zimmermann)
> - Warn once if dst_pitch is not a multiple of 8 (Thomas Zimmermann)
> - Drop drm_fb_gray8_to_mono_reversed() that's not used (Thomas Zimmermann)
> - Allocate single buffer for both copy cma memory and gray8 (Thomas Zimmermann)
> - Add Thomas Zimmermann Reviewed-by tag to patch adding XR24 -> mono helper.
> 
> Changes in v3:
> - Also add a drm_fb_xrgb8888_to_mono_reversed() helper (Thomas Zimmermann)
> - Split lines copy to drm_fb_gray8_to_mono_reversed_line() (Thomas Zimmermann)
> - Handle case where the source buffer is not aligned to 8 (Thomas Zimmermann)
> 
>  drivers/gpu/drm/drm_format_helper.c | 110 ++++++++++++++++++++++++++++
>  include/drm/drm_format_helper.h     |   4 +
>  2 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b981712623d3..bc0f49773868 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -12,9 +12,11 @@
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  
> +#include <drm/drm_device.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_rect.h>
>  
>  static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
> @@ -591,3 +593,111 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>  	return -EINVAL;
>  }
>  EXPORT_SYMBOL(drm_fb_blit_toio);
> +
> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
> +					       unsigned int start_offset, unsigned int end_len)
> +{
> +	unsigned int xb, i;
> +
> +	for (xb = 0; xb < pixels; xb++) {
> +		unsigned int start = 0, end = 8;
> +		u8 byte = 0x00;

> +		if (xb == 0 && start_offset)
> +			start = start_offset;

Just to point out again, this is 100% invariant and may be moved out.

> +		if (xb == pixels - 1 && end_len)
> +			end = end_len;

This one almost, can be moved out after refactoring.

> +		for (i = start; i < end; i++) {
> +			unsigned int x = xb * 8 + i;
> +
> +			byte >>= 1;
> +			if (src[x] >> 7)
> +				byte |= BIT(7);
> +		}
> +		*dst++ = byte;
> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
> + * @dst: reversed monochrome destination buffer
> + * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> + * @src: XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + *
> + * DRM doesn't have native monochrome support.
> + * Such drivers can announce the commonly supported XR24 format to userspace
> + * and use this function to convert to the native format.
> + *
> + * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
> + * then the result is converted from grayscale to reversed monohrome.
> + */
> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
> +				      const struct drm_framebuffer *fb, const struct drm_rect *clip)
> +{
> +	unsigned int linepixels = drm_rect_width(clip);
> +	unsigned int lines = clip->y2 - clip->y1;
> +	unsigned int cpp = fb->format->cpp[0];
> +	unsigned int len_src32 = linepixels * cpp;
> +	struct drm_device *dev = fb->dev;
> +	unsigned int start_offset, end_len;
> +	unsigned int y;
> +	u8 *mono = dst, *gray8;
> +	u32 *src32;
> +
> +	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
> +		return;
> +
> +	/*
> +	 * The reversed mono destination buffer contains 1 bit per pixel
> +	 * and destination scanlines have to be in multiple of 8 pixels.
> +	 */
> +	if (!dst_pitch)
> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
> +
> +	drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> +
> +	/*
> +	 * The cma memory is write-combined so reads are uncached.
> +	 * Speed up by fetching one line at a time.
> +	 *
> +	 * Also, format conversion from XR24 to reversed monochrome
> +	 * are done line-by-line but are converted to 8-bit grayscale
> +	 * as an intermediate step.
> +	 *
> +	 * Allocate a buffer to be used for both copying from the cma
> +	 * memory and to store the intermediate grayscale line pixels.
> +	 */
> +	src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
> +	if (!src32)
> +		return;
> +
> +	gray8 = (u8 *)src32 + len_src32;
> +
> +	/*
> +	 * For damage handling, it is possible that only parts of the source
> +	 * buffer is copied and this could lead to start and end pixels that
> +	 * are not aligned to multiple of 8.
> +	 *
> +	 * Calculate if the start and end pixels are not aligned and set the
> +	 * offsets for the reversed mono line conversion function to adjust.
> +	 */
> +	start_offset = clip->x1 % 8;
> +	end_len = clip->x2 % 8;
> +
> +	vaddr += clip_offset(clip, fb->pitches[0], cpp);
> +	for (y = 0; y < lines; y++) {
> +		src32 = memcpy(src32, vaddr, len_src32);
> +		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
> +		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
> +						   start_offset, end_len);
> +		vaddr += fb->pitches[0];
> +		mono += dst_pitch;
> +	}
> +
> +	kfree(src32);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index b30ed5de0a33..0b0937c0b2f6 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -43,4 +43,8 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>  		     const void *vmap, const struct drm_framebuffer *fb,
>  		     const struct drm_rect *rect);
>  
> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
> +				      const struct drm_framebuffer *fb,
> +				      const struct drm_rect *clip);
> +
>  #endif /* __LINUX_DRM_FORMAT_HELPER_H */
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


