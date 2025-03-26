Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE9A7131B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3CA10E677;
	Wed, 26 Mar 2025 08:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ioCdliIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095DA10E677
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTP8djB4QVRgx54hm+XjPf15PwLszN3j1/JhovU8y5o=;
 b=ioCdliIcbnZvSfv1aJx1I66Cb/jsWBOCxPGTkgVDjpLTOjG4ZT7miI3h6PU0vCv4Iiwz3C
 FZASmbZU+5Sl/QQHtKfyDk08eb2+Bf7Z2bEjDID7vTqOh2VJmxd8A31DmKBNbvxW3xSA03
 wwKXcjKrGSgf1LRPY+enKeTg8VQd98I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-PrvAffEoP2iXOXx1czA0Ew-1; Wed, 26 Mar 2025 04:53:46 -0400
X-MC-Unique: PrvAffEoP2iXOXx1czA0Ew-1
X-Mimecast-MFC-AGG-ID: PrvAffEoP2iXOXx1czA0Ew_1742979225
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3913f546dfdso3512095f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979225; x=1743584025;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OTP8djB4QVRgx54hm+XjPf15PwLszN3j1/JhovU8y5o=;
 b=UdlP0BTCZvVEXASxRxMiJS6PYhERU5vBkCvsoogm+xtMDRDHcFBE/wlv/Evm6AW0Vn
 f7H3JYqv0dDGMFuIcK3tV7Aevh61OOLBJ66MdCKdY00XGXnF+3AVH3W1iX/36jDdacYP
 BD2qBHKYCybk6LynXDhloUnEaUiO3I+TG/DfAbv5CbBhT4/QsMqBy0UC40OQCnTMJxNH
 BsqYWDQa3PMVusBa49zFiD1bfRCIBCzrAXTr7CWMZicgL+u3PZEo3QbismnGvyoZB99u
 YqX1Y2nJd/IjOHVXg+vlziKqK8yclxrgU1RfZmI27XuP68cncXhQbBuEC0dWs2ScQjU+
 O59w==
X-Gm-Message-State: AOJu0YwIquD69y6z+A3TDIVNpcVOsm1Dp43x8cePzt3SLpkJM2YaVG7N
 3b3a79xJkZ0qaMAyNulXywl4g1BU8rLwPbu2FLtLTVIuUceIXN7ckM8ODmciIP60NVlbQLA0tmw
 jEhFVYb2yIcNndgApUXx3ixxFZeggA2b/nvC1BEeKkaq17n58teGg3hWLjNiUiBwAog==
X-Gm-Gg: ASbGncvkmMxDz9n0YSv8nGkPUfncNi+8ac76QSfrqyma5RMf0QX9YI98bx7VTxXjR0W
 WqTb3ZIpEqxlEyl19ptnaC1orvDKOmFMVXIHtETEl/fSb61qG6i1b8s4I75WH+RwIk/sWZv3rvU
 MZ2LpJH6CAzm40X6xth2kJtRUmY/Se9AaudhvlEa1HIVfYTPOoKVLV6L6zD5C/gyKjk2FCAv5Gw
 ptmeUZoQg/cCXE/2KaYhtfhmEaqJA5yQ7OqNz1b2qfQvgcCYE/cnobpv75QPa8Mp3oNeukcVa+r
 oISJoCzU1fSDxCrHdyr4dLql1H5WjeJz8qNfLVSMd7ma5WlThJG76mw=
X-Received: by 2002:a05:6000:2a1:b0:390:e8e4:7e3e with SMTP id
 ffacd0b85a97d-3997f8f268fmr16897479f8f.6.1742979224717; 
 Wed, 26 Mar 2025 01:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+D1b2hrYQIWPUPFwpn4Pbibg2eOIx0/05ZkSMxRAxBafgo7ko2aKeFBsbFhdbwhP+RlQ/0A==
X-Received: by 2002:a05:6000:2a1:b0:390:e8e4:7e3e with SMTP id
 ffacd0b85a97d-3997f8f268fmr16897457f8f.6.1742979224247; 
 Wed, 26 Mar 2025 01:53:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f99540bsm16075991f8f.2.2025.03.26.01.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:53:43 -0700 (PDT)
Message-ID: <db8e5b0f-47c9-4765-8b1d-b13f25aca4b7@redhat.com>
Date: Wed, 26 Mar 2025 09:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/format-helper: Add generic conversion to 16-bit
 formats
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r8pHqySfgK0Os3e_LNBPJlE6eyZUZHd9M4OEhEq2UrE_1742979225
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
> Add drm_fb_xfrm_line_32to16() to implement conversion from 32-bit
> pixels to 16-bit pixels. The pixel-conversion is specified by the
> given callback parameter. Mark the helper as always_inline to avoid
> overhead from function calls.
> 
> Then implement all existing line-conversion functions with the new
> generic call and the respective pixel-conversion helper. There's one
> pixel-conversion helper that swaps output bytes. It is for gud and
> requires refactoring, so don't move it into the header file.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c   | 118 +++++---------------------
>   drivers/gpu/drm/drm_format_internal.h |  12 +++
>   2 files changed, 34 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 5a2fe3d685a2..aecf55c1fc6b 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -246,6 +246,18 @@ static int drm_fb_xfrm(struct iosys_map *dst,
>   				     xfrm_line);
>   }
>   
> +static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf,
> +						    unsigned int pixels,
> +						    u32 (*xfrm_pixel)(u32))
> +{
> +	__le16 *dbuf16 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	const __le32 *send32 = sbuf32 + pixels;
> +
> +	while (sbuf32 < send32)
> +		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
> +}
> +
>   static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf,
>   						    unsigned int pixels,
>   						    u32 (*xfrm_pixel)(u32))
> @@ -448,38 +460,19 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>   
>   static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le16 *dbuf16 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u16 val16;
> -	u32 pix;
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb565);
> +}
>   
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val16 = ((pix & 0x00F80000) >> 8) |
> -			((pix & 0x0000FC00) >> 5) |
> -			((pix & 0x000000F8) >> 3);
> -		dbuf16[x] = cpu_to_le16(val16);
> -	}
> +static __always_inline u32 drm_xrgb8888_to_rgb565_swab(u32 pix)
> +{
> +	return swab16(drm_pixel_xrgb8888_to_rgb565(pix));
>   }
>   
>   /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
>   static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>   						unsigned int pixels)
>   {
> -	__le16 *dbuf16 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u16 val16;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val16 = ((pix & 0x00F80000) >> 8) |
> -			((pix & 0x0000FC00) >> 5) |
> -			((pix & 0x000000F8) >> 3);
> -		dbuf16[x] = cpu_to_le16(swab16(val16));
> -	}
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_xrgb8888_to_rgb565_swab);
>   }
>   
>   /**
> @@ -526,19 +519,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>   
>   static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le16 *dbuf16 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u16 val16;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val16 = ((pix & 0x00f80000) >> 9) |
> -			((pix & 0x0000f800) >> 6) |
> -			((pix & 0x000000f8) >> 3);
> -		dbuf16[x] = cpu_to_le16(val16);
> -	}
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xrgb1555);
>   }
>   
>   /**
> @@ -578,20 +559,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
>   
>   static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le16 *dbuf16 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u16 val16;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val16 = BIT(15) | /* set alpha bit */
> -			((pix & 0x00f80000) >> 9) |
> -			((pix & 0x0000f800) >> 6) |
> -			((pix & 0x000000f8) >> 3);
> -		dbuf16[x] = cpu_to_le16(val16);
> -	}
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_argb1555);
>   }
>   
>   /**
> @@ -631,20 +599,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
>   
>   static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le16 *dbuf16 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u16 val16;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val16 = ((pix & 0x00f80000) >> 8) |
> -			((pix & 0x0000f800) >> 5) |
> -			((pix & 0x000000f8) >> 2) |
> -			BIT(0); /* set alpha bit */
> -		dbuf16[x] = cpu_to_le16(val16);
> -	}
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgba5551);
>   }
>   
>   /**
> @@ -980,36 +935,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>   
>   static void drm_fb_argb8888_to_argb4444_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	unsigned int pixels2 = pixels & ~GENMASK_ULL(0, 0);
> -	__le32 *dbuf32 = dbuf;
> -	__le16 *dbuf16 = dbuf + pixels2 * sizeof(*dbuf16);
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 val32;
> -	u16 val16;
> -	u32 pix[2];
> -
> -	for (x = 0; x < pixels2; x += 2, ++dbuf32) {
> -		pix[0] = le32_to_cpu(sbuf32[x]);
> -		pix[1] = le32_to_cpu(sbuf32[x + 1]);
> -		val32 = ((pix[0] & 0xf0000000) >> 16) |
> -			((pix[0] & 0x00f00000) >> 12) |
> -			((pix[0] & 0x0000f000) >> 8) |
> -			((pix[0] & 0x000000f0) >> 4) |
> -			((pix[1] & 0xf0000000) >> 0) |
> -			((pix[1] & 0x00f00000) << 4) |
> -			((pix[1] & 0x0000f000) << 8) |
> -			((pix[1] & 0x000000f0) << 12);
> -		*dbuf32 = cpu_to_le32(val32);
> -	}
> -	for (; x < pixels; x++) {
> -		pix[0] = le32_to_cpu(sbuf32[x]);
> -		val16 = ((pix[0] & 0xf0000000) >> 16) |
> -			((pix[0] & 0x00f00000) >> 12) |
> -			((pix[0] & 0x0000f000) >> 8) |
> -			((pix[0] & 0x000000f0) >> 4);
> -		dbuf16[x] = cpu_to_le16(val16);
> -	}
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_argb8888_to_argb4444);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
> index e7fcf260a914..4f20b63cb6f6 100644
> --- a/drivers/gpu/drm/drm_format_internal.h
> +++ b/drivers/gpu/drm/drm_format_internal.h
> @@ -128,4 +128,16 @@ static inline u32 drm_pixel_xrgb8888_to_abgr2101010(u32 pix)
>   	       drm_pixel_xrgb8888_to_xbgr2101010(pix);
>   }
>   
> +/*
> + * Conversion from ARGB8888
> + */
> +
> +static inline u32 drm_pixel_argb8888_to_argb4444(u32 pix)
> +{
> +	return ((pix & 0xf0000000) >> 16) |
> +	       ((pix & 0x00f00000) >> 12) |
> +	       ((pix & 0x0000f000) >> 8) |
> +	       ((pix & 0x000000f0) >> 4);
> +}
> +
>   #endif

