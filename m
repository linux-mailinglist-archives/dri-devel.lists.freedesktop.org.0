Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348B4D9C66
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5682D89CC4;
	Tue, 15 Mar 2022 13:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0789CC4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647351566; x=1678887566;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3NwXXEWXbHmt2Xfr/YsBFfwVwFs0lw1bJ2gTY6AcMOs=;
 b=YBaPrv14IuxzV1zluUtg7fFFqVox9/WdKtjm10GEeEOuvg9tqCfJZjN+
 g/66ct9aHIEqajnUuTD3F2Xa2cAZlKPC+BB3XknbHbthtRUyi+qa+dGwu
 sN2djAvP5s30JhSZuDL7MsOnBqdVWS2iTb1H3dmhHbb3+dB+aWw8eBC32
 yN+oiIown8zOCq6jcTkoxcfqRrAZ1qMWXq+uerslaq9asE66cVMNKMKwS
 lTXr4j3bEjklrwj66FNB/saDo612prWl1L3ESLmKxyD3avVxTbrJdj368
 IiAMF6l2SrMMY9nx4vk5RWw2dB7XQuVuJ6k2xsJHLAbLEevoSb81qWV6b A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="253861423"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="253861423"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:39:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="498016584"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:39:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nU7Nq-000HhE-BR; Tue, 15 Mar 2022 15:38:42 +0200
Date: Tue, 15 Mar 2022 15:38:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/5] drm/format-helper: Fix XRGB888 to monochrome
 conversion
Message-ID: <YjCW4uykfYdkNUTI@smile.fi.intel.com>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-3-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315110707.628166-3-geert@linux-m68k.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 12:07:04PM +0100, Geert Uytterhoeven wrote:
> The conversion functions drm_fb_xrgb8888_to_mono() and
> drm_fb_gray8_to_mono_line() do not behave correctly when the
> horizontal boundaries of the clip rectangle are not multiples of 8:
>   a. When x1 % 8 != 0, the calculated pitch is not correct,
>   b. When x2 % 8 != 0, the pixel data for the last byte is wrong.
> 
> Simplify the code and fix (a) by:
>   1. Removing start_offset, and always storing the first pixel in the
>      first bit of the monochrome destination buffer.
>      Drivers that require the first pixel in a byte to be located at an
>      x-coordinate that is a multiple of 8 can always align the clip
>      rectangle before calling drm_fb_xrgb8888_to_mono().
>      Note that:
>        - The ssd130x driver does not need the alignment, as the
> 	 monochrome buffer is a temporary format,
>        - The repaper driver always updates the full screen, so the clip
> 	 rectangle is always aligned.
>   2. Passing the number of pixels to drm_fb_gray8_to_mono_line(),
>      instead of the number of bytes, and the number of pixels in the
>      last byte.
> 
> Fix (b) by explicitly setting the target bit, instead of always setting
> bit 7 and shifting the value in each loop iteration.
> 
> Remove the bogus pitch check, which operates on bytes instead of pixels,
> and triggers when e.g. flashing the cursor on a text console with a font
> that is 8 pixels wide.
> 
> Drop the confusing comment about scanlines, as a pitch in bytes always
> contains a multiple of 8 pixels.
> 
> While at it, use the drm_rect_height() helper instead of open-coding the
> same operation.
> 
> Update the comments accordingly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

See comment below.

> Fixes: bcf8b616deb87941 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> I tried hard to fix this in small steps, but everything was no
> intertangled that this turned out to be unfeasible.
> 
> Note that making these changes does not introduce regressions in the
> ssd130x driver, as the latter is broken for x1 != 0 or y1 != 0 anyway.
> ---
>  drivers/gpu/drm/drm_format_helper.c | 56 ++++++++++-------------------
>  1 file changed, 18 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b68aa857c6514529..0d7cae921ed1134f 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -594,27 +594,16 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>  }
>  EXPORT_SYMBOL(drm_fb_blit_toio);
>  
> -static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels,
> -				      unsigned int start_offset, unsigned int end_len)
> -{
> -	unsigned int xb, i;
> -
> -	for (xb = 0; xb < pixels; xb++) {
> -		unsigned int start = 0, end = 8;
> -		u8 byte = 0x00;
> -
> -		if (xb == 0 && start_offset)
> -			start = start_offset;
>  
> -		if (xb == pixels - 1 && end_len)
> -			end = end_len;
> -
> -		for (i = start; i < end; i++) {
> -			unsigned int x = xb * 8 + i;
> +static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels)
> +{
> +	while (pixels) {
> +		unsigned int i, bits = min(pixels, 8U);
> +		u8 byte = 0;
>  
> -			byte >>= 1;
> -			if (src[x] >> 7)
> -				byte |= BIT(7);
> +		for (i = 0; i < bits; i++, pixels--) {
> +			if (*src++ & BIT(7))
> +				byte |= BIT(i);
>  		}
>  		*dst++ = byte;
>  	}
> @@ -634,16 +623,22 @@ static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixel
>   *
>   * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
>   * then the result is converted from grayscale to monochrome.
> + *
> + * The first pixel (upper left corner of the clip rectangle) will be converted
> + * and copied to the first bit (LSB) in the first byte of the monochrome
> + * destination buffer.
> + * If the caller requires that the first pixel in a byte must be located at an
> + * x-coordinate that is a multiple of 8, then the caller must take care itself
> + * of supplying a suitable clip rectangle.
>   */
>  void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vaddr,
>  			     const struct drm_framebuffer *fb, const struct drm_rect *clip)
>  {
>  	unsigned int linepixels = drm_rect_width(clip);
> -	unsigned int lines = clip->y2 - clip->y1;
> +	unsigned int lines = drm_rect_height(clip);
>  	unsigned int cpp = fb->format->cpp[0];
>  	unsigned int len_src32 = linepixels * cpp;
>  	struct drm_device *dev = fb->dev;
> -	unsigned int start_offset, end_len;
>  	unsigned int y;
>  	u8 *mono = dst, *gray8;
>  	u32 *src32;
> @@ -652,14 +647,11 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
>  		return;
>  
>  	/*
> -	 * The mono destination buffer contains 1 bit per pixel and
> -	 * destination scanlines have to be in multiple of 8 pixels.
> +	 * The mono destination buffer contains 1 bit per pixel
>  	 */

Now it's one-line comment.

>  	if (!dst_pitch)
>  		dst_pitch = DIV_ROUND_UP(linepixels, 8);
>  
> -	drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> -
>  	/*
>  	 * The cma memory is write-combined so reads are uncached.
>  	 * Speed up by fetching one line at a time.
> @@ -677,23 +669,11 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
>  
>  	gray8 = (u8 *)src32 + len_src32;
>  
> -	/*
> -	 * For damage handling, it is possible that only parts of the source
> -	 * buffer is copied and this could lead to start and end pixels that
> -	 * are not aligned to multiple of 8.
> -	 *
> -	 * Calculate if the start and end pixels are not aligned and set the
> -	 * offsets for the mono line conversion function to adjust.
> -	 */
> -	start_offset = clip->x1 % 8;
> -	end_len = clip->x2 % 8;
> -
>  	vaddr += clip_offset(clip, fb->pitches[0], cpp);
>  	for (y = 0; y < lines; y++) {
>  		src32 = memcpy(src32, vaddr, len_src32);
>  		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);

> -		drm_fb_gray8_to_mono_line(mono, gray8, dst_pitch, start_offset,
> -					  end_len);
> +		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);

Yep, with previously being on one line here will be less churn.

>  		vaddr += fb->pitches[0];
>  		mono += dst_pitch;
>  	}
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


