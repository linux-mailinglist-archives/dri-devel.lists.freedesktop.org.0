Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E3BB6AD2
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 14:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C2A10E076;
	Fri,  3 Oct 2025 12:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iLODcttI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3E810E076
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759495690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abOFXlVOsAnsDhhRvwRDxbQbFD2KxrGohKy2z4xStxQ=;
 b=iLODcttIHvcsoNCyR5smqjvgGvxuSm//7rHmOY6rmA+2IIin3xA52WlnzEqejoyi3bfWX1
 Rb5wHRIIgpQmAZwr2vXth5bBYY0CDkttEzRkNrHVuA+v4+7Q/06p00Z+B2vYL6y6SVZy/Z
 MTLNR8dMM8Kq8yH010LnayIWMh6OddQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-DmiPczHCMfyCwRNELER3Eg-1; Fri, 03 Oct 2025 08:48:08 -0400
X-MC-Unique: DmiPczHCMfyCwRNELER3Eg-1
X-Mimecast-MFC-AGG-ID: DmiPczHCMfyCwRNELER3Eg_1759495687
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e3af78819so9486735e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 05:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759495687; x=1760100487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=abOFXlVOsAnsDhhRvwRDxbQbFD2KxrGohKy2z4xStxQ=;
 b=aZBEEAFP9C4s8RXufa5or1m/2aWr7WPLS3ehYYcqxxHNH5E8U9PvGg4fOsTrjkWmwe
 CubfhCDixsCNmdFGxgMMFh2KIXowhjVmcVg+6T2yBAnAU5wPZkkuA/P3lJuxZ6hBraD3
 SOKL0VkpmfYMjm7VjJYeja5hfmCkCGR7dr/kGGYEbpDmK7PI34osG6IFywVcIkosMa1C
 jQOstaY7YyZ6v55KWMqvHwdZiOuJApOhxVAutjZp6ZaS48D7R98Fg9GeYMs/7u4Evjgk
 lBGrjmNb3gS3hp+UaFXXuZ+h0y4as/INw/5AbBy3Dsn+JAyuHhS9YPp9Pdz25h2SuUpA
 1l8A==
X-Gm-Message-State: AOJu0Yx8U/p3wCxwlrltrvbLX2JoaBIIiX+KNL+VBEEuK2u3mJIzW03j
 jJ0Dp6GLBPL0hfXhPBozd2xxZbYq8EIFroMferMthEGLZ6N8tKJxjR49ymymjnv7fDvkQ1RstMb
 6UEyAJ9T0cYPSv53Cm67VpjYXlTgGACl7oL9mj26ppX0dmnWOKuULRXRebxfqWkicNQ5dmQ==
X-Gm-Gg: ASbGncsQkeByFojb1BNb+spHC93icBUOktsR0oSbYojkQ4la7h453Kn7M7EGjDfcynM
 wSvNtxaEkolCZplO6tACM4r4fh4Eq7wZK4kmTt9ySTyM8nlZg2/gro8y2BgZ0cczgx8IfgptC93
 vcjykrMy1HnN2llscYSyniAKgf4RmBBzPfiN5iEIeUkITtU+GAHyFsNQUTHhqoPksmD2tu0djEW
 iTJRoOq8q8Lqz/VKxsf13mZnoPuKNLTmCrtbOQGXRkOXoJexoyk4DL9wCQBU/g3JykrvvbU3gqI
 3afjBnqDrpQVuX7/m9cvgb9zXifW6yM3SHzt9U4KvqHXv5zpuoDLFc2YCE0mtSxq3BvMLBIjk4i
 Zm207FzmpJw==
X-Received: by 2002:a05:600c:46cf:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-46e71151b43mr21787255e9.31.1759495687375; 
 Fri, 03 Oct 2025 05:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9DbUHceDY8z1q6O4kWeaJAo3ePV1gD/11rMzSARC8qCSa2CqMo/zyDL0nSycvtSJ152kLKQ==
X-Received: by 2002:a05:600c:46cf:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-46e71151b43mr21787095e9.31.1759495686995; 
 Fri, 03 Oct 2025 05:48:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b7e37sm125640635e9.1.2025.10.03.05.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 05:48:06 -0700 (PDT)
Message-ID: <70cbbf88-7c1e-44f4-8091-ee76944d2f6b@redhat.com>
Date: Fri, 3 Oct 2025 14:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/draw: fix color truncation in drm_draw_fill24
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oMNn9M55DyO5RYB7c139efk8exk4Yyk2eb-edmTNies_1759495687
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

On 10/3/25 12:33, Francesco Valla wrote:
> The color parameter passed to drm_draw_fill24() was truncated to 16
> bits, leading to an incorrect color drawn to the target iosys_map.
> Fix this behavior, widening the parameter to 32 bits.
> 
Oh, you're right, my mistake.
Did you find this by using a 24bit hardware, or by looking at the code?

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Best regards,

-- 

Jocelyn

> Fixes: 31fa2c1ca0b2 ("drm/panic: Move drawing functions to drm_draw")
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   drivers/gpu/drm/drm_draw.c          | 2 +-
>   drivers/gpu/drm/drm_draw_internal.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..5b956229c82fb6e232e3342705a226c8e14c8568 100644
> --- a/drivers/gpu/drm/drm_draw.c
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -127,7 +127,7 @@ EXPORT_SYMBOL(drm_draw_fill16);
>   
>   void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
>   		     unsigned int height, unsigned int width,
> -		     u16 color)
> +		     u32 color)
>   {
>   	unsigned int y, x;
>   
> diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
> index f121ee7339dc11537f677c833f0ee94fe0e799cd..20cb404e23ea6263b535ea2b81b25f84c37be8a2 100644
> --- a/drivers/gpu/drm/drm_draw_internal.h
> +++ b/drivers/gpu/drm/drm_draw_internal.h
> @@ -47,7 +47,7 @@ void drm_draw_fill16(struct iosys_map *dmap, unsigned int dpitch,
>   
>   void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
>   		     unsigned int height, unsigned int width,
> -		     u16 color);
> +		     u32 color);
>   
>   void drm_draw_fill32(struct iosys_map *dmap, unsigned int dpitch,
>   		     unsigned int height, unsigned int width,
> 
> ---
> base-commit: e406d57be7bd2a4e73ea512c1ae36a40a44e499e
> change-id: 20251003-drm_draw_fill24_fix-ea52d32a933d
> 
> Best regards,

