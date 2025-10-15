Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E6BDD280
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CF10E741;
	Wed, 15 Oct 2025 07:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdnSf2X1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBE810E262
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760513979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9mzBaSG1ymUZW4j7v8Uap9BTxNpS6prV1CapjmX+dQ=;
 b=fdnSf2X1WtSAgvvbeBmMTw/EggLfPcpGTynsp+6qHa97ebDg7KO3MmlxagsthBtMnBUYwp
 amZkq4FjSJ+AhOOYaeuYgC8BlQVvnDrZ12o1msubMpvdDauonLg8RmudmmxFVooaLmK2v4
 YWvJoJaPoKexbL4UyleW8jZznMdz4gE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-0hAxtgl7PHCCr0LDVJsLKQ-1; Wed, 15 Oct 2025 03:39:35 -0400
X-MC-Unique: 0hAxtgl7PHCCr0LDVJsLKQ-1
X-Mimecast-MFC-AGG-ID: 0hAxtgl7PHCCr0LDVJsLKQ_1760513974
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3f030846a41so4358188f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760513974; x=1761118774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9mzBaSG1ymUZW4j7v8Uap9BTxNpS6prV1CapjmX+dQ=;
 b=jqQH4usgybKMTWfDXtISq7bSlFGeLFCmVBbqDOu7iG1ewqP6HGiCpATsAn37eXMuXa
 twK6jFRPYlXt7J0wdjRLdzRnnJIHV5f0643ndwHLSigR0r2aFidmUSYnKSjdp8RPbT3Z
 3VuNey+L9Kxpvc4JOc4nEgPIj8gtge05WmIi5NmvvXj9bH184gcoXZbsgpcKr3i+3+sy
 ClYI12Zts9WZlRr49r5Zbt3Hw9XYYP2Pcwkq8PNztddQcYoz2X9SDN1lVLJLor4dozDO
 cV6uhAz/g1hK496BSMfhScPBumpDuHRSye5veZkcvqnU4ZK6Rg584VM99gBE4h/jWEv2
 p0nQ==
X-Gm-Message-State: AOJu0YwUO67ZxS+4klduzouPPiMlFmGZXmEjMUdn6prUjNmJK57PI5b+
 vLh9NaknH5izXNT0SEJ/cwKWXlp/IvUUDQ/qDcfy8043Vv07Bt7HYTzBn5qBW1KvI4r8oYdQiWI
 peLE0r4YoGYYnIZ73eyBogYwaNSuzwc4cBz13p4ri8G/NGX2vKWz6PFFTgnmKM9itpottOLq1wy
 dkIA==
X-Gm-Gg: ASbGncsYuU/4mNtIBsy8NMM/OaJIzSlkqzJgzp2b4RFR8IUuuTqeYMLz6EGGwzoeYa/
 UP7ww3J3tM71baQjHybQCpgRvsnN5SEaUu9CnzLeNC00m9hcKgYy2wB3gpCTbUkSwwN6SCRJFUZ
 vHuhM3WR1AdRNg4+zzp3OG2hGTj8Siqv1ZCw1gtkm0mh/KwtihMPsPPXlwNTcxqqgDTajbOTZds
 jxx88bVbw3kyVd8B277ul8A8Dz7OC5hxvvMUwCjuLwpdavEHdms+jNaMii5yTkUtLGilaHyA23F
 7HgqOmkRyl3Kl0LisVEVZz7mi70Qk4nJpEOrH68wKAeoSEtGo7n26Ng5PHEQzOh42WIbsgEYmyb
 q03GQ
X-Received: by 2002:a05:600c:8586:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-46fab89b7abmr164581735e9.34.1760513974283; 
 Wed, 15 Oct 2025 00:39:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMcAsDbQx0qDg/8QUAJOASON1OERYluoiMz5ii+dtcdthx8c6ZL7HWlOcBtR2Zy/YKw6Ew7Q==
X-Received: by 2002:a05:600c:8586:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-46fab89b7abmr164581645e9.34.1760513973938; 
 Wed, 15 Oct 2025 00:39:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e1024sm27419889f8f.42.2025.10.15.00.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:39:33 -0700 (PDT)
Message-ID: <13f1e073-8333-4dc8-adf6-54261e1a0fe0@redhat.com>
Date: Wed, 15 Oct 2025 09:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
 <20251014-drm_draw_conv_check-v2-1-05bef3eb06fb@valla.it>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251014-drm_draw_conv_check-v2-1-05bef3eb06fb@valla.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FcXumYxvMSnUyN8vX4_600Slws8ggGBmD3ybIeUyWgQ_1760513974
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

On 14/10/2025 22:08, Francesco Valla wrote:
> Add drm_draw_can_convert_from_xrgb8888() function that can be used to
> determine if a XRGB8888 color can be converted to the specified format.

Thanks for the v2, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   drivers/gpu/drm/drm_draw.c          | 29 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_draw_internal.h |  2 ++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..ccdd6b16e73fc01d58f45759cf3824be7aac155b 100644
> --- a/drivers/gpu/drm/drm_draw.c
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -15,6 +15,35 @@
>   #include "drm_draw_internal.h"
>   #include "drm_format_internal.h"
>   
> +/**
> + * drm_draw_can_convert_from_xrgb8888 - check if xrgb8888 can be converted to the desired format
> + * @format: format
> + *
> + * Returns:
> + * True if XRGB8888 can be converted to the specified format, false otherwise.
> + */
> +bool drm_draw_can_convert_from_xrgb8888(u32 format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_RGBA5551:
> +	case DRM_FORMAT_XRGB1555:
> +	case DRM_FORMAT_ARGB1555:
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_XRGB2101010:
> +	case DRM_FORMAT_ARGB2101010:
> +	case DRM_FORMAT_ABGR2101010:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_draw_can_convert_from_xrgb8888);
> +
>   /**
>    * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
>    * @color: input color, in xrgb8888 format
> diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
> index f121ee7339dc11537f677c833f0ee94fe0e799cd..2ab4cb341df94fc4173dd6f5e7a512bdcfa5e55c 100644
> --- a/drivers/gpu/drm/drm_draw_internal.h
> +++ b/drivers/gpu/drm/drm_draw_internal.h
> @@ -24,6 +24,8 @@ static inline const u8 *drm_draw_get_char_bitmap(const struct font_desc *font,
>   	return font->data + (c * font->height) * font_pitch;
>   }
>   
> +bool drm_draw_can_convert_from_xrgb8888(u32 format);
> +
>   u32 drm_draw_color_from_xrgb8888(u32 color, u32 format);
>   
>   void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,
> 

