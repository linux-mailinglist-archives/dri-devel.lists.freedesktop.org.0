Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18304B2982
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 16:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039AE10E1EB;
	Fri, 11 Feb 2022 15:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302C10E1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644595185; x=1676131185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RDag2sLQw7yjw60O76iuryrZarkSSGzwMGlkJnfbYWw=;
 b=g+EjcY7yz/8vHggD2L12o6c+s8JkOkY89a9u4bTLt3/8raKChW//4Zwq
 Fa77ld2ixvA0ujBQTklYK1GfrYBYLg44Wit2p/dZ+nzJW95LBiBRhXA4/
 H8ZfQ8lw4QnCqhx1i3aPTLJs9RsE9Bc/LffF1/v8tNEgXhTVfouOzhVHT
 4cIHfheAwJze5s+7L4VYwzfMiRs8NhqnWmAp99pkgpRj0gCvsVmPSPP0a
 xHX9QSHGiZJC/yTbwmescWhlsGmLuCMyEjfQ5MTNe7Atp3f8k0WNP7xD5
 pqxSKr9AaqRfBwVMFP1BjYKb69S1/r3mrv24NhQ7ZPhAPILsczew9sfQe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249961653"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="249961653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:59:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="602407145"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:59:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIYJo-003Usa-NZ; Fri, 11 Feb 2022 17:58:44 +0200
Date: Fri, 11 Feb 2022 17:58:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgaHtHZws8GOUPAk@smile.fi.intel.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
 <20220211143358.3112958-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211143358.3112958-2-javierm@redhat.com>
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

On Fri, Feb 11, 2022 at 03:33:53PM +0100, Javier Martinez Canillas wrote:
> Pull the per-line conversion logic into a separate helper function.
> 
> This will allow to do line-by-line conversion in other helpers that
> convert to a gray8 format.

for-loop vs. while-loop is not critical, so
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 
> Changes in v5:
> - Add Thomas Zimmermann's Reviewed-by to patch #1.
> 
> Changes in v3:
> - Add a drm_fb_xrgb8888_to_gray8_line() helper function (Thomas Zimmermann)
> 
>  drivers/gpu/drm/drm_format_helper.c | 31 ++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 0f28dd2bdd72..b981712623d3 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -464,6 +464,21 @@ void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst,
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
>  
> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
> +{
> +	unsigned int x;
> +
> +	for (x = 0; x < pixels; x++) {
> +		u8 r = (*src & 0x00ff0000) >> 16;
> +		u8 g = (*src & 0x0000ff00) >> 8;
> +		u8 b =  *src & 0x000000ff;
> +
> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> +		*dst++ = (3 * r + 6 * g + b) / 10;
> +		src++;
> +	}
> +}
> +
>  /**
>   * drm_fb_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
>   * @dst: 8-bit grayscale destination buffer
> @@ -484,8 +499,9 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
>  void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
>  			      const struct drm_framebuffer *fb, const struct drm_rect *clip)
>  {
> -	unsigned int len = (clip->x2 - clip->x1) * sizeof(u32);
> -	unsigned int x, y;
> +	unsigned int linepixels = clip->x2 - clip->x1;
> +	unsigned int len = linepixels * sizeof(u32);
> +	unsigned int y;
>  	void *buf;
>  	u8 *dst8;
>  	u32 *src32;
> @@ -508,16 +524,7 @@ void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vad
>  	for (y = clip->y1; y < clip->y2; y++) {
>  		dst8 = dst;
>  		src32 = memcpy(buf, vaddr, len);
> -		for (x = clip->x1; x < clip->x2; x++) {
> -			u8 r = (*src32 & 0x00ff0000) >> 16;
> -			u8 g = (*src32 & 0x0000ff00) >> 8;
> -			u8 b =  *src32 & 0x000000ff;
> -
> -			/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> -			*dst8++ = (3 * r + 6 * g + b) / 10;
> -			src32++;
> -		}
> -
> +		drm_fb_xrgb8888_to_gray8_line(dst8, src32, linepixels);
>  		vaddr += fb->pitches[0];
>  		dst += dst_pitch;
>  	}
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


