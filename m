Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE800BBD27F
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 08:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A6F10E32D;
	Mon,  6 Oct 2025 06:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXGHMPWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DA310E32D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 06:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759733340; x=1791269340;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yTAZ+XReotE1tnBpSXOVt/G5ssUel+fR/M+ufDf6UyY=;
 b=aXGHMPWAPL9G1HVHKL3KgzYBkzVK9KPwXzhmqzIMjHnCBNLRnwGRlhlc
 PSCzaptYsMFYAOSzi0CZsXzy116RyvOlL0MoeF8OQfzDUkXkSQIgoat2c
 cFNo9/9V+sZd9QY8+t/YWlR2iIvuoGM0UVQY6cPtXAKMs1PTx7grGxovQ
 OmnYDKr7LYGEMv9j16ENmFDUXSpslQG4oCNVBeVk7Gna6PUZgxsbof7oh
 V3E3iKxLV98B/Ig7nkMLWXI76DUwnweLVjJbyK25lhZWg8eh82OZ0oHzI
 oNmBHo1gJ34nvMwr+bW6g6D1ghwoTm9FAvng2fJ8VU+y9X7Aie2QpgFTp A==;
X-CSE-ConnectionGUID: xEiWbDXAS7C+zDAVPUp71w==
X-CSE-MsgGUID: jeZ/bfGgQQS1ZmW6hJwu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61809486"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61809486"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 23:48:58 -0700
X-CSE-ConnectionGUID: /cfp81oKTjSynylQem+FLg==
X-CSE-MsgGUID: R4aYeEG5QAqugmpaQTBOpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179630933"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.162])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 23:48:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francesco Valla <francesco@valla.it>, Jocelyn Falempe
 <jfalempe@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Francesco
 Valla <francesco@valla.it>
Subject: Re: [PATCH 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
In-Reply-To: <20251005-drm_draw_conv_check-v1-1-9c814d9362f6@valla.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
 <20251005-drm_draw_conv_check-v1-1-9c814d9362f6@valla.it>
Date: Mon, 06 Oct 2025 09:48:51 +0300
Message-ID: <a669b2ee89865e9150efd38e181cdc838c2ac522@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, 05 Oct 2025, Francesco Valla <francesco@valla.it> wrote:
> Add drm_draw_can_convert_from_xrgb8888() function that can be used to
> determine if a XRGB8888 color can be converted to the specified format.
>
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/gpu/drm/drm_draw.c          | 84 +++++++++++++++++++++++++++----------
>  drivers/gpu/drm/drm_draw_internal.h |  2 +
>  2 files changed, 63 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..2641026a103d3b28cab9f5d378604b0604520fe4 100644
> --- a/drivers/gpu/drm/drm_draw.c
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -15,45 +15,83 @@
>  #include "drm_draw_internal.h"
>  #include "drm_format_internal.h"
>  
> -/**
> - * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> - * @color: input color, in xrgb8888 format
> - * @format: output format
> - *
> - * Returns:
> - * Color in the format specified, casted to u32.
> - * Or 0 if the format is not supported.
> - */
> -u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
> +static int __drm_draw_color_from_xrgb8888(u32 color, u32 format, u32 *out_color)

Is there any reason to change the return value of this function and
return the result via out_color? It already returns 0 if the format is
not supported. If there's a reason, it needs to be in the commit
message.

>  {
>  	switch (format) {
>  	case DRM_FORMAT_RGB565:
> -		return drm_pixel_xrgb8888_to_rgb565(color);
> +		*out_color = drm_pixel_xrgb8888_to_rgb565(color);
> +		break;
>  	case DRM_FORMAT_RGBA5551:
> -		return drm_pixel_xrgb8888_to_rgba5551(color);
> +		*out_color = drm_pixel_xrgb8888_to_rgba5551(color);
> +		break;
>  	case DRM_FORMAT_XRGB1555:
> -		return drm_pixel_xrgb8888_to_xrgb1555(color);
> +		*out_color = drm_pixel_xrgb8888_to_xrgb1555(color);
> +		break;
>  	case DRM_FORMAT_ARGB1555:
> -		return drm_pixel_xrgb8888_to_argb1555(color);
> +		*out_color = drm_pixel_xrgb8888_to_argb1555(color);
> +		break;
>  	case DRM_FORMAT_RGB888:
> +		fallthrough;

That's not necessary for back to back case labels. Please don't add it.

>  	case DRM_FORMAT_XRGB8888:
> -		return color;
> +		*out_color = color;
> +		break;
>  	case DRM_FORMAT_ARGB8888:
> -		return drm_pixel_xrgb8888_to_argb8888(color);
> +		*out_color = drm_pixel_xrgb8888_to_argb8888(color);
> +		break;
>  	case DRM_FORMAT_XBGR8888:
> -		return drm_pixel_xrgb8888_to_xbgr8888(color);
> +		*out_color = drm_pixel_xrgb8888_to_xbgr8888(color);
> +		break;
>  	case DRM_FORMAT_ABGR8888:
> -		return drm_pixel_xrgb8888_to_abgr8888(color);
> +		*out_color = drm_pixel_xrgb8888_to_abgr8888(color);
> +		break;
>  	case DRM_FORMAT_XRGB2101010:
> -		return drm_pixel_xrgb8888_to_xrgb2101010(color);
> +		*out_color = drm_pixel_xrgb8888_to_xrgb2101010(color);
> +		break;
>  	case DRM_FORMAT_ARGB2101010:
> -		return drm_pixel_xrgb8888_to_argb2101010(color);
> +		*out_color = drm_pixel_xrgb8888_to_argb2101010(color);
> +		break;
>  	case DRM_FORMAT_ABGR2101010:
> -		return drm_pixel_xrgb8888_to_abgr2101010(color);
> +		*out_color = drm_pixel_xrgb8888_to_abgr2101010(color);
> +		break;
>  	default:
> -		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
> -		return 0;
> +		return -1;

Please don't use -1 as a generic error code. -1 is -EPERM.

>  	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_draw_can_convert_from_xrgb8888 - check if xrgb8888 can be converted to the desired format
> + * @format: format
> + *
> + * Returns:
> + * True if XRGB8888 can be converted to the specified format, false otherwise.
> + */
> +bool drm_draw_can_convert_from_xrgb8888(u32 format)
> +{
> +	u32 out_color;
> +
> +	return __drm_draw_color_from_xrgb8888(0, format, &out_color) == 0;
> +}
> +EXPORT_SYMBOL(drm_draw_can_convert_from_xrgb8888);
> +
> +/**
> + * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> + * @color: input color, in xrgb8888 format
> + * @format: output format
> + *
> + * Returns:
> + * Color in the format specified, casted to u32.
> + * Or 0 if the format is not supported.
> + */
> +u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
> +{
> +	u32 out_color = 0;
> +
> +	if (__drm_draw_color_from_xrgb8888(color, format, &out_color))
> +		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
> +
> +	return out_color;
>  }
>  EXPORT_SYMBOL(drm_draw_color_from_xrgb8888);
>  
> diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
> index f121ee7339dc11537f677c833f0ee94fe0e799cd..2ab4cb341df94fc4173dd6f5e7a512bdcfa5e55c 100644
> --- a/drivers/gpu/drm/drm_draw_internal.h
> +++ b/drivers/gpu/drm/drm_draw_internal.h
> @@ -24,6 +24,8 @@ static inline const u8 *drm_draw_get_char_bitmap(const struct font_desc *font,
>  	return font->data + (c * font->height) * font_pitch;
>  }
>  
> +bool drm_draw_can_convert_from_xrgb8888(u32 format);
> +
>  u32 drm_draw_color_from_xrgb8888(u32 color, u32 format);
>  
>  void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,

-- 
Jani Nikula, Intel
