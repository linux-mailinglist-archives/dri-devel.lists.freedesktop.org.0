Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77AA71310
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651E010E100;
	Wed, 26 Mar 2025 08:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ztcg6k7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040410E100
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKk3/HNlJdXfm99JNWhkxqw0WCqNCQON2b3ONLIsVvs=;
 b=Ztcg6k7PyalIklBrqGjdcRBixbKJA+aT4SGTa/xp0hnI8+L1kMJqgdSNM5mwvuDFffkhcz
 cdzohLJ03aW8eIYmmZAT8arcpVi6Q5cEGMxByWVc48cwgQYmfIcQFMQYKknpaxCEPSAxfC
 RttU+tlwPmMp9APN9oPbAUe7UPPKPJ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-tdan1JroOgmr1bbk2Qx5eQ-1; Wed, 26 Mar 2025 04:51:29 -0400
X-MC-Unique: tdan1JroOgmr1bbk2Qx5eQ-1
X-Mimecast-MFC-AGG-ID: tdan1JroOgmr1bbk2Qx5eQ_1742979089
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39131851046so2858596f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979088; x=1743583888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKk3/HNlJdXfm99JNWhkxqw0WCqNCQON2b3ONLIsVvs=;
 b=kDNUeB3tMtrCrZefQALwN6YOiBfd1BWADsZWQppQ5ZV+Z2tFEn6NfynqQzb+IXpJbY
 j3tLhFZnlNPrVexvGmLqzrSRwJkJI2kLF19Nv1/9i/DdiVt9gwzMIPFr2pIYbh/qsRub
 xInhuEpsfRTJuqQmn7/9P0pKA08CmgegxJfUw8u/bpRpDyJsQXeXi1KDW0iqG8T2Ij/q
 rLo78o0bb8ejd6zeoOFWKUR+OqloNTNfzjckXN+yaAwX5vJSRUFPGDT/wSH4kTdBvUyI
 M6udVFFrB4/dvtnLRlKop9cj/Ko804FDBo+GMt23qlpqLjbJVZ9aWG6054F7MjuyRil2
 s7zQ==
X-Gm-Message-State: AOJu0YwDowgB4gTk0sRmTQmbNk0h8awNGDKLI9W5MxGIcCA93/czCK4P
 iZzXr+m4NdiizdlnhUthHfgRnKm3CNouDPEZiHdlqq5GrQ2QjAIa7WT3YMKWDlRUe7MLpGGt5Xh
 1SV8eVwfZxpYxtSc0GouGV2CLL4az0nrnjsj1aoAYDUflHt5CEc7KYL/ksu4exiWX+A==
X-Gm-Gg: ASbGncvhIQtBCDKumkrKDcT+pTLoeTBUftOqBYoLMUimjiKqv+MpZjA6vbxjCEVzBrb
 N4c6NuOYFlgFoWMHXSrQRTuNFE3Ze50pPESpTJTZ6wTmTpKZQB1dWKWsVanpCkw1z/YkeyDSsCv
 HdQ9iEbWufkkTlXxElWKnrxB3tSMUbPnELkzGjfC94wxNUSjIKH8K3yZHzD6m6gi3YCtw+xPvGI
 +tfXSC/u57dNZTxoGt7e5rGtpEaja4PR/RDLhnJ9GIzTqGKkw+0qqdOKti/HKHjjUdEItGonoYX
 7ReMHeKhJ2ZZvaN0ea60uME5WvR6a+GXjlbYhEC0YtEky2Z3tDvfp/o=
X-Received: by 2002:a05:6000:1f86:b0:390:f394:6274 with SMTP id
 ffacd0b85a97d-3997f93cd81mr18348905f8f.52.1742979088402; 
 Wed, 26 Mar 2025 01:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvBeS2gtlLZHVtVEhDcWRhmboiCU4FmubMLLjuSBWVa3WMCsBzfEwU+0KKiefd4IHgVJH6bw==
X-Received: by 2002:a05:6000:1f86:b0:390:f394:6274 with SMTP id
 ffacd0b85a97d-3997f93cd81mr18348882f8f.52.1742979087958; 
 Wed, 26 Mar 2025 01:51:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f3328bsm225958805e9.1.2025.03.26.01.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:51:27 -0700 (PDT)
Message-ID: <25419c5b-ad7c-4f35-9c01-fb196841e654@redhat.com>
Date: Wed, 26 Mar 2025 09:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/format-helper: Move helpers for pixel conversion
 to header file
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zoXtGxKUGhD8Ykzj44GSZU1Au56tvFTKUzSihUAy7n0_1742979089
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 25/03/2025 11:31, Thomas Zimmermann wrote:
> The DRM draw helpers contain format-conversion helpers that operate
> on individual pixels. Move them into an internal header file and adopt
> them as individual API. Update the draw code accordingly. The pixel
> helpers will also be useful for other format conversion helpers.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_draw.c            | 100 +++-------------------
>   drivers/gpu/drm/drm_format_internal.h | 119 ++++++++++++++++++++++++++
>   2 files changed, 130 insertions(+), 89 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_format_internal.h
> 
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> index cb2ad12bce57..d41f8ae1c148 100644
> --- a/drivers/gpu/drm/drm_draw.c
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -11,85 +11,7 @@
>   #include <drm/drm_fourcc.h>
>   
>   #include "drm_draw_internal.h"
> -
> -/*
> - * Conversions from xrgb8888
> - */
> -
> -static u16 convert_xrgb8888_to_rgb565(u32 pix)
> -{
> -	return ((pix & 0x00F80000) >> 8) |
> -	       ((pix & 0x0000FC00) >> 5) |
> -	       ((pix & 0x000000F8) >> 3);
> -}
> -
> -static u16 convert_xrgb8888_to_rgba5551(u32 pix)
> -{
> -	return ((pix & 0x00f80000) >> 8) |
> -	       ((pix & 0x0000f800) >> 5) |
> -	       ((pix & 0x000000f8) >> 2) |
> -	       BIT(0); /* set alpha bit */
> -}
> -
> -static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
> -{
> -	return ((pix & 0x00f80000) >> 9) |
> -	       ((pix & 0x0000f800) >> 6) |
> -	       ((pix & 0x000000f8) >> 3);
> -}
> -
> -static u16 convert_xrgb8888_to_argb1555(u32 pix)
> -{
> -	return BIT(15) | /* set alpha bit */
> -	       ((pix & 0x00f80000) >> 9) |
> -	       ((pix & 0x0000f800) >> 6) |
> -	       ((pix & 0x000000f8) >> 3);
> -}
> -
> -static u32 convert_xrgb8888_to_argb8888(u32 pix)
> -{
> -	return pix | GENMASK(31, 24); /* fill alpha bits */
> -}
> -
> -static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
> -{
> -	return ((pix & 0x00ff0000) >> 16) <<  0 |
> -	       ((pix & 0x0000ff00) >>  8) <<  8 |
> -	       ((pix & 0x000000ff) >>  0) << 16 |
> -	       ((pix & 0xff000000) >> 24) << 24;
> -}
> -
> -static u32 convert_xrgb8888_to_abgr8888(u32 pix)
> -{
> -	return ((pix & 0x00ff0000) >> 16) <<  0 |
> -	       ((pix & 0x0000ff00) >>  8) <<  8 |
> -	       ((pix & 0x000000ff) >>  0) << 16 |
> -	       GENMASK(31, 24); /* fill alpha bits */
> -}
> -
> -static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
> -{
> -	pix = ((pix & 0x000000FF) << 2) |
> -	      ((pix & 0x0000FF00) << 4) |
> -	      ((pix & 0x00FF0000) << 6);
> -	return pix | ((pix >> 8) & 0x00300C03);
> -}
> -
> -static u32 convert_xrgb8888_to_argb2101010(u32 pix)
> -{
> -	pix = ((pix & 0x000000FF) << 2) |
> -	      ((pix & 0x0000FF00) << 4) |
> -	      ((pix & 0x00FF0000) << 6);
> -	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> -}
> -
> -static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
> -{
> -	pix = ((pix & 0x00FF0000) >> 14) |
> -	      ((pix & 0x0000FF00) << 4) |
> -	      ((pix & 0x000000FF) << 22);
> -	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> -}
> +#include "drm_format_internal.h"
>   
>   /**
>    * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> @@ -104,28 +26,28 @@ u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
>   {
>   	switch (format) {
>   	case DRM_FORMAT_RGB565:
> -		return convert_xrgb8888_to_rgb565(color);
> +		return drm_pixel_xrgb8888_to_rgb565(color);
>   	case DRM_FORMAT_RGBA5551:
> -		return convert_xrgb8888_to_rgba5551(color);
> +		return drm_pixel_xrgb8888_to_rgba5551(color);
>   	case DRM_FORMAT_XRGB1555:
> -		return convert_xrgb8888_to_xrgb1555(color);
> +		return drm_pixel_xrgb8888_to_xrgb1555(color);
>   	case DRM_FORMAT_ARGB1555:
> -		return convert_xrgb8888_to_argb1555(color);
> +		return drm_pixel_xrgb8888_to_argb1555(color);
>   	case DRM_FORMAT_RGB888:
>   	case DRM_FORMAT_XRGB8888:
>   		return color;
>   	case DRM_FORMAT_ARGB8888:
> -		return convert_xrgb8888_to_argb8888(color);
> +		return drm_pixel_xrgb8888_to_argb8888(color);
>   	case DRM_FORMAT_XBGR8888:
> -		return convert_xrgb8888_to_xbgr8888(color);
> +		return drm_pixel_xrgb8888_to_xbgr8888(color);
>   	case DRM_FORMAT_ABGR8888:
> -		return convert_xrgb8888_to_abgr8888(color);
> +		return drm_pixel_xrgb8888_to_abgr8888(color);
>   	case DRM_FORMAT_XRGB2101010:
> -		return convert_xrgb8888_to_xrgb2101010(color);
> +		return drm_pixel_xrgb8888_to_xrgb2101010(color);
>   	case DRM_FORMAT_ARGB2101010:
> -		return convert_xrgb8888_to_argb2101010(color);
> +		return drm_pixel_xrgb8888_to_argb2101010(color);
>   	case DRM_FORMAT_ABGR2101010:
> -		return convert_xrgb8888_to_abgr2101010(color);
> +		return drm_pixel_xrgb8888_to_abgr2101010(color);
>   	default:
>   		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>   		return 0;
> diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
> new file mode 100644
> index 000000000000..5f82f0b9c8e8
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_format_internal.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +
> +#ifndef DRM_FORMAT_INTERNAL_H
> +#define DRM_FORMAT_INTERNAL_H
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +/*
> + * Each pixel-format conversion helper takes a raw pixel in a
> + * specific input format and returns a raw pixel in a specific
> + * output format. All pixels are in little-endian byte order.
> + *
> + * Function names are
> + *
> + *   drm_pixel_<input>_to_<output>_<algorithm>()
> + *
> + * where <input> and <output> refer to pixel formats. The
> + * <algorithm> is optional and hints to the method used for the
> + * conversion. Helpers with no algorithm given apply pixel-bit
> + * shifting.
> + *
> + * The argument type is u32. We expect this to be wide enough to
> + * hold all conversion input from 32-bit RGB to any output format.
> + * The Linux kernel should avoid format conversion for anything
> + * but XRGB8888 input data. Converting from other format can still
> + * be acceptable in some cases.
> + *
> + * The return type is u32. It is wide enough to hold all conversion
> + * output from XRGB8888. For output formats wider than 32 bit, a
> + * return type of u64 would be acceptable.
> + */
> +
> +/*
> + * Conversions from XRGB8888
> + */
> +
> +static inline u32 drm_pixel_xrgb8888_to_rgb565(u32 pix)
> +{
> +	return ((pix & 0x00f80000) >> 8) |
> +	       ((pix & 0x0000fc00) >> 5) |
> +	       ((pix & 0x000000f8) >> 3);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_rgbx5551(u32 pix)
> +{
> +	return ((pix & 0x00f80000) >> 8) |
> +	       ((pix & 0x0000f800) >> 5) |
> +	       ((pix & 0x000000f8) >> 2);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_rgba5551(u32 pix)
> +{
> +	return drm_pixel_xrgb8888_to_rgbx5551(pix) |
> +	       BIT(0); /* set alpha bit */
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_xrgb1555(u32 pix)
> +{
> +	return ((pix & 0x00f80000) >> 9) |
> +	       ((pix & 0x0000f800) >> 6) |
> +	       ((pix & 0x000000f8) >> 3);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_argb1555(u32 pix)
> +{
> +	return BIT(15) | /* set alpha bit */
> +	       drm_pixel_xrgb8888_to_xrgb1555(pix);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_argb8888(u32 pix)
> +{
> +	return GENMASK(31, 24) | /* fill alpha bits */
> +	       pix;
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_xbgr8888(u32 pix)
> +{
> +	return ((pix & 0xff000000)) | /* also copy filler bits */
> +	       ((pix & 0x00ff0000) >> 16) |
> +	       ((pix & 0x0000ff00)) |
> +	       ((pix & 0x000000ff) << 16);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_abgr8888(u32 pix)
> +{
> +	return GENMASK(31, 24) | /* fill alpha bits */
> +	       drm_pixel_xrgb8888_to_xbgr8888(pix);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_xrgb2101010(u32 pix)
> +{
> +	pix = ((pix & 0x000000ff) << 2) |
> +	      ((pix & 0x0000ff00) << 4) |
> +	      ((pix & 0x00ff0000) << 6);
> +	return pix | ((pix >> 8) & 0x00300c03);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_argb2101010(u32 pix)
> +{
> +	return GENMASK(31, 30) | /* set alpha bits */
> +	       drm_pixel_xrgb8888_to_xrgb2101010(pix);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_xbgr2101010(u32 pix)
> +{
> +	pix = ((pix & 0x00ff0000) >> 14) |
> +	      ((pix & 0x0000ff00) << 4) |
> +	      ((pix & 0x000000ff) << 22);
> +	return pix | ((pix >> 8) & 0x00300c03);
> +}
> +
> +static inline u32 drm_pixel_xrgb8888_to_abgr2101010(u32 pix)
> +{
> +	return GENMASK(31, 30) | /* set alpha bits */
> +	       drm_pixel_xrgb8888_to_xbgr2101010(pix);
> +}
> +
> +#endif

