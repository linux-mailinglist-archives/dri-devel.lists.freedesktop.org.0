Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1952A71313
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CB910E670;
	Wed, 26 Mar 2025 08:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WUQpqL83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13710E670
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKmdKlcEJgsK83Bp8QCKCodg1mkDOcYJ+IWyT1bv6gU=;
 b=WUQpqL83R1a8pGX9ymnYYhIHskgYuvR5u09Kbj7iNJgQwZn0yWZ3KXVN3Wv9O7OYsC2sMv
 UtIAv9OY+h+/cFTSHDLoswgy1wWGnnKmDFiucej3K50UxO6sPQahSNzaDxdcn6XAlZoyB/
 yvwEHw3Cjv27LDmprpemAU9mhDo06v8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-O4HeXI-0O1GJjfMfS3GMQQ-1; Wed, 26 Mar 2025 04:52:22 -0400
X-MC-Unique: O4HeXI-0O1GJjfMfS3GMQQ-1
X-Mimecast-MFC-AGG-ID: O4HeXI-0O1GJjfMfS3GMQQ_1742979141
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so56566335e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979141; x=1743583941;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKmdKlcEJgsK83Bp8QCKCodg1mkDOcYJ+IWyT1bv6gU=;
 b=pTe8us/yiA5AeChCKv4HcpVIRPWQdIxTxioTzLQd5STBHFbIetfQ0v4y1sKjzpDd2m
 ZdiqMlb9S81zy1u3ao+XE4PkAREZW4ixPabp34P3pdk1MijwLnjOiKqH1YQYnRRb6He4
 vFK+dyIhTLgaJa/iZVVoUvpWjcePnzsf2C4lDYKHfTo4woXp61O8Fz0dzJJJcvUgPXzY
 qIwwlczpqsX2+PbV10n92uvQbhF28WOVpG159xhvqa5uuwA3J1H7DcZgr7bYCzie86rL
 PLfQ2N9uof34UAHzNZpEPTDVxKfKwkejZKVXjUSpbQlQ9DoFeeaNP+KBj4syQEP5ZgLB
 nxcQ==
X-Gm-Message-State: AOJu0YzmQKVkC4T4AEyNpOgqYU1IHmfWRYOAqY2VriB9E8n2HDmdqOd4
 aaGuO1TJ4xomowKmzSiPkMahuW3A7sZXvisaEdJU5KJaQ3kfYk2EryNvSYsAMuNu3koCWmjX/u+
 FiF5XQX/1L3DkkRR4k0+wHH2SbNKXrXfzAnXdWHA7v8eOQC380m2qAKBshExqpbhodw==
X-Gm-Gg: ASbGncuRCIzOOrefpbNtr7iqybl0GK/m4XDV/abS2WpxJNXLoxqVofPEN7yAlCfULxp
 kX3S4cSEWGElOO1rhgDQBMJCi8rbL9XIsjMNP2kN18vKvNst0oJQvtbCuKKY5Ig8oW5rSDi+TcE
 Cwduxm/fjA7D9MLp9qYWW/ryHM9sMuQ7vH+MAfCnYhnPgOg8rdPtHw0A19MSA6FJCtAUnExLUGH
 WE77ACBcVELR2tQ4uggsRlinurJ/yfSURBvujbdIRNGvI9ewUQ7Gag62AZJbgZfyWQ0hEJleiax
 8/VNMOD8sRbSjtx6smkuTdy639RXmFnz+4vVYRyISNNID7IxyD8Pj40=
X-Received: by 2002:a5d:64af:0:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-3997f8f8c14mr18507283f8f.1.1742979140971; 
 Wed, 26 Mar 2025 01:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOWeQHW4ruMynybDDd2sE9l27iKN9MRLzOqlDJdF7phog2Gc9QsnpmknR6EYrGWwyf9e8m6A==
X-Received: by 2002:a5d:64af:0:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-3997f8f8c14mr18507258f8f.1.1742979140441; 
 Wed, 26 Mar 2025 01:52:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac3ce3dd1sm7657274f8f.88.2025.03.26.01.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:52:19 -0700 (PDT)
Message-ID: <183d0dd3-dfeb-4138-8ddc-841603d53830@redhat.com>
Date: Wed, 26 Mar 2025 09:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/format-helper: Add generic conversion to 32-bit
 formats
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XGtmWN0t345CalJNqf7ZFP3MgrjtKfDETclFCr4FmqY_1742979141
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
> Add drm_fb_xfrm_line_32to32() to implement conversion from 32-bit
> pixels to 32-bit pixels. The pixel-conversion is specified by the
> given callback parameter. Mark the helper as always_inline to avoid
> overhead from function calls.
> 
> Then implement all existing line-conversion functions with the new
> generic call and the respective pixel-conversion helper.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c | 84 +++++++----------------------
>   1 file changed, 19 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 01d3ab307ac3..abd18c23cfbb 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -20,6 +20,8 @@
>   #include <drm/drm_print.h>
>   #include <drm/drm_rect.h>
>   
> +#include "drm_format_internal.h"
> +
>   /**
>    * drm_format_conv_state_init - Initialize format-conversion state
>    * @state: The state to initialize
> @@ -244,6 +246,18 @@ static int drm_fb_xfrm(struct iosys_map *dst,
>   				     xfrm_line);
>   }
>   
> +static __always_inline void drm_fb_xfrm_line_32to32(void *dbuf, const void *sbuf,
> +						    unsigned int pixels,
> +						    u32 (*xfrm_pixel)(u32))
> +{
> +	__le32 *dbuf32 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	const __le32 *send32 = sbuf32 + pixels;
> +
> +	while (sbuf32 < send32)
> +		*dbuf32++ = cpu_to_le32(xfrm_pixel(le32_to_cpup(sbuf32++)));
> +}
> +
>   /**
>    * drm_fb_memcpy - Copy clip buffer
>    * @dst: Array of destination buffers
> @@ -755,16 +769,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
>   
>   static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le32 *dbuf32 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		pix |= GENMASK(31, 24); /* fill alpha bits */
> -		dbuf32[x] = cpu_to_le32(pix);
> -	}
> +	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_argb8888);
>   }
>   
>   /**
> @@ -804,19 +809,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
>   
>   static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le32 *dbuf32 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
> -		      ((pix & 0x0000ff00) >>  8) <<  8 |
> -		      ((pix & 0x000000ff) >>  0) << 16 |
> -		      GENMASK(31, 24); /* fill alpha bits */
> -		*dbuf32++ = cpu_to_le32(pix);
> -	}
> +	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_abgr8888);
>   }
>   
>   static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> @@ -835,19 +828,7 @@ static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned in
>   
>   static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le32 *dbuf32 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
> -		      ((pix & 0x0000ff00) >>  8) <<  8 |
> -		      ((pix & 0x000000ff) >>  0) << 16 |
> -		      ((pix & 0xff000000) >> 24) << 24;
> -		*dbuf32++ = cpu_to_le32(pix);
> -	}
> +	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xbgr8888);
>   }
>   
>   static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> @@ -866,20 +847,7 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
>   
>   static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le32 *dbuf32 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 val32;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val32 = ((pix & 0x000000FF) << 2) |
> -			((pix & 0x0000FF00) << 4) |
> -			((pix & 0x00FF0000) << 6);
> -		pix = val32 | ((val32 >> 8) & 0x00300C03);
> -		*dbuf32++ = cpu_to_le32(pix);
> -	}
> +	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xrgb2101010);
>   }
>   
>   /**
> @@ -920,21 +888,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
>   
>   static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> -	__le32 *dbuf32 = dbuf;
> -	const __le32 *sbuf32 = sbuf;
> -	unsigned int x;
> -	u32 val32;
> -	u32 pix;
> -
> -	for (x = 0; x < pixels; x++) {
> -		pix = le32_to_cpu(sbuf32[x]);
> -		val32 = ((pix & 0x000000ff) << 2) |
> -			((pix & 0x0000ff00) << 4) |
> -			((pix & 0x00ff0000) << 6);
> -		pix = GENMASK(31, 30) | /* set alpha bits */
> -		      val32 | ((val32 >> 8) & 0x00300c03);
> -		*dbuf32++ = cpu_to_le32(pix);
> -	}
> +	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_argb2101010);
>   }
>   
>   /**

