Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F47A21C22
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BBD10E058;
	Wed, 29 Jan 2025 11:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HpzpSGQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E8610E058
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738150050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAUNjQf+cYCuuB475nDasLUlIdK2/qlSlFPYkAcDSrE=;
 b=HpzpSGQgKR881jzsjmGccZ3mVOm1bpDN+kFFuZRwuhAayG+PjYIHN91O8Jn9lfLjjmhKZZ
 0C0U6D7nKGKItDUh5SNtJwcQv7+snOCLqzgBD0ZOm4C76+4pehCqkfOKcTC4JRlmy0DZDf
 QsPrvIVZdYgblnBI5GROmxftnI7j5gw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-2zfSQTO-P12cOIUaDLl1vA-1; Wed, 29 Jan 2025 06:27:28 -0500
X-MC-Unique: 2zfSQTO-P12cOIUaDLl1vA-1
X-Mimecast-MFC-AGG-ID: 2zfSQTO-P12cOIUaDLl1vA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-436225d4389so2887835e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738150047; x=1738754847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wAUNjQf+cYCuuB475nDasLUlIdK2/qlSlFPYkAcDSrE=;
 b=a2qzoLFqzNCSsIpYN22Plv2UbSasVhwyCayCn4uis9oOYcZvCwm1akPeKLUMPfiKYX
 cKTQdNCdn/hxU0xpH9aCNPqM4GkUuA3hqwCYdJj34ncZPhAijZD0DUo9DOldrl36gOeZ
 +a326nEsUQ6yYECUugDOeYJzYezmADP2ld2+Tr3CqhH7XclwmmqoRBoWb8vLyA2Z6mb8
 nbzuZNnk5d0/CMSEOIuzGXXQySU80GaDOQ3KvJ0iyABACdZ4BTmH3USmDrs4h3fQMcGz
 dfb7/m4HSbswFZbirQQnt03O33zaecD/lZklcctNIcAQkklUwc6tAzyIXxkQcuUpDIZC
 /rFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5nxog8oRw1qoddurSrG76eikij4KuQ/eO6qdzqI39y1Aud+0PWLXzgkMHAY3ujxz3VGBPsKdVxro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCYpCDZykKHpFcQe+P1323bwT6K+KOvqOxtif9YzAut05r/ou/
 Cy4Szs8n/GLe1ReH/mG2tR0shjGsbRJcstpqnbSJ3jmpF+PTtUiclldW7/sKNGuJKCemdcPoSXF
 56DtHE46KCkW6+GuNrWzshrse7mDozdEaqpALGoBcCe3vVnC2/VGtqu0RyAGXxDau0w==
X-Gm-Gg: ASbGncsrLYEJqHvTwic5zVf0ACa6wEE1b2sT2aDuNH2z4SLmEbf8xdAKToBPosTceMa
 xnmr/XR4AH8WExJwOWIbvGrbZ5KbHF51e5Hho2+dqMRa8INOv7IpbNZ9BA3PFdGR+/4Qk9u3yqf
 +WplwwX60ohRxcVtdooRFkl+guhihe1gO8paIUxbNsgv6GB6J4lhWmhOjmp6hBQiiwTxeD0vK3z
 lCBHe1FQrtmnohoUuVlwO6TAlJOi8UYZp2RNt+GWzR5UM6GCkaQtWNnnDTnJYkGBOgbLRdAODmN
 FiXOPVASErGsBkuRQoBoZexXVm2NuSeMR4mLiFNCrlo9
X-Received: by 2002:a05:600c:3ca5:b0:434:e69c:d338 with SMTP id
 5b1f17b1804b1-438dbe8e43bmr22919185e9.5.1738150047567; 
 Wed, 29 Jan 2025 03:27:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVn8swbauiN3+19rK9CgLhlBR3sc7/gMYKsqJ/O21LSxpN73+deVR0v+q85AYVw8SKwRsqJg==
X-Received: by 2002:a05:600c:3ca5:b0:434:e69c:d338 with SMTP id
 5b1f17b1804b1-438dbe8e43bmr22918945e9.5.1738150047177; 
 Wed, 29 Jan 2025 03:27:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81a39sm19093585e9.35.2025.01.29.03.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:27:26 -0800 (PST)
Message-ID: <b824e913-0d2f-4a09-b1fa-da89375b47e4@redhat.com>
Date: Wed, 29 Jan 2025 12:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] drm/ast: astdp: Look up mode index from table
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250129095840.20629-1-tzimmermann@suse.de>
 <20250129095840.20629-15-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250129095840.20629-15-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cUnDEMG_8G27Kod59aVh3lk-OghyHFS-i0T4_PwXK2E_1738150048
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

On 29/01/2025 10:55, Thomas Zimmermann wrote:
> Replace the large switch statement with a look-up table when selecting
> the mode index. Makes the code easier to read. The table is sorted by
> resolutions; if run-time overhead from traversal becomes significant,
> binary search would be a possible optimization.
> 
> The mode index requires a refresh-rate index to be added or subtracted,
> which still requires a minimal switch.
> 
I think there is a problem in the mode_index/refresh_index calculation, 
see below:


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 116 +++++++++++++++++------------------
>   1 file changed, 55 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index e1ca012e639be..70fa754432bca 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -14,80 +14,74 @@
>   #include "ast_drv.h"
>   #include "ast_vbios.h"
>   
> +struct ast_astdp_mode_index_table_entry {
> +	unsigned int hdisplay;
> +	unsigned int vdisplay;
> +	unsigned int mode_index;
> +};
> +
> +/* FIXME: Do refresh rate and flags actually matter? */
> +static const struct ast_astdp_mode_index_table_entry ast_astdp_mode_index_table[] = {
> +	{  320,  240, ASTDP_320x240_60 },
> +	{  400,  300, ASTDP_400x300_60 },
> +	{  512,  384, ASTDP_512x384_60 },
> +	{  640,  480, ASTDP_640x480_60 },
> +	{  800,  600, ASTDP_800x600_56 },
> +	{ 1024,  768, ASTDP_1024x768_60 },
> +	{ 1152,  864, ASTDP_1152x864_75 },
> +	{ 1280,  800, ASTDP_1280x800_60_RB },
> +	{ 1280, 1024, ASTDP_1280x1024_60 },
> +	{ 1360,  768, ASTDP_1366x768_60 }, // same as 1366x786
> +	{ 1366,  768, ASTDP_1366x768_60 },
> +	{ 1440,  900, ASTDP_1440x900_60_RB },
> +	{ 1600,  900, ASTDP_1600x900_60_RB },
> +	{ 1600, 1200, ASTDP_1600x1200_60 },
> +	{ 1680, 1050, ASTDP_1680x1050_60_RB },
> +	{ 1920, 1080, ASTDP_1920x1080_60 },
> +	{ 1920, 1200, ASTDP_1920x1200_60 },
> +	{ 0 }
> +};
> +
> +static int __ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdisplay)
> +{
> +	const struct ast_astdp_mode_index_table_entry *entry = ast_astdp_mode_index_table;
> +
> +	while (entry->hdisplay && entry->vdisplay) {
> +		if (entry->hdisplay == hdisplay && entry->vdisplay == vdisplay)
> +			return entry->mode_index;
> +		++entry;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>   static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable *vmode)
>   {
> +	int mode_index;
>   	u8 refresh_rate_index;
>   
> +	mode_index = __ast_astdp_get_mode_index(vmode->hde, vmode->vde);
> +	if (mode_index < 0)
> +		return mode_index;
> +
>   	if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255)
>   		return -EINVAL;
> -
>   	refresh_rate_index = vmode->refresh_rate_index - 1;
>   
> -	switch (vmode->hde) {
> -	case 320:
> -		if (vmode->vde == 240)
> -			return ASTDP_320x240_60;
> -		break;
> -	case 400:
> -		if (vmode->vde == 300)
> -			return ASTDP_400x300_60;
> -		break;
> -	case 512:
> -		if (vmode->vde == 384)
> -			return ASTDP_512x384_60;
> -		break;
> -	case 640:
> -		if (vmode->vde == 480)
> -			return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
> -		break;
> -	case 800:
> -		if (vmode->vde == 600)
> -			return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
> -		break;
> -	case 1024:
> -		if (vmode->vde == 768)
> -			return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
> -		break;
> -	case 1152:
> -		if (vmode->vde == 864)
> -			return ASTDP_1152x864_75;
> -		break;
> -	case 1280:
> -		if (vmode->vde == 800)
> -			return (u8)(ASTDP_1280x800_60_RB - (u8)refresh_rate_index);
> -		if (vmode->vde == 1024)
> -			return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
> -		break;
> -	case 1360:
> -	case 1366:
> -		if (vmode->vde == 768)
> -			return ASTDP_1366x768_60;
> -		break;
> -	case 1440:
> -		if (vmode->vde == 900)
> -			return (u8)(ASTDP_1440x900_60_RB - (u8)refresh_rate_index);
> -		break;
> -	case 1600:
> -		if (vmode->vde == 900)
> -			return (u8)(ASTDP_1600x900_60_RB - (u8)refresh_rate_index);
> -		if (vmode->vde == 1200)

> -		break;
> -	case 1680:
> -		if (vmode->vde == 1050)
> -			return (u8)(ASTDP_1680x1050_60_RB - (u8)refresh_rate_index);
> -		break;
> -	case 1920:
> -		if (vmode->vde == 1080)
> -			return ASTDP_1920x1080_60;
> -		if (vmode->vde == 1200)
> -			return ASTDP_1920x1200_60;
> +	/* FIXME: Why are we doing this? */
> +	switch (mode_index) {
> +	case ASTDP_1280x800_60_RB:
> +	case ASTDP_1440x900_60_RB:
> +	case ASTDP_1600x900_60_RB:
> +	case ASTDP_1680x1050_60_RB:
> +		mode_index = (u8)(mode_index - (u8)refresh_rate_index);
>   		break;
I think you should add this to do the same as before:

	case ASTDP_640x480_60:
	case ASTDP_800x600_56:
	case ASTDP_1024x768_60:
	case ASTDP_1280x1024_60:
		mode_index = (u8)(mode_index + (u8)refresh_rate_index);
   		break;
	default:
		break;

>   	default:
> +		mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>   		break;
>   	}
>   
> -	return -EINVAL;
> +	return mode_index;
>   }
>   
>   static bool ast_astdp_is_connected(struct ast_device *ast)

