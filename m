Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB9A1D89E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33D910E556;
	Mon, 27 Jan 2025 14:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SXp+hZXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A04310E556
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737989058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWcGFbS8jS6v1/ci8rB7BLdrR7iQ0XxIg6CKGrZTecQ=;
 b=SXp+hZXvwpcDWVJ5aX1e0iomUwJddYo6+/b9TuYW7GyUg/EZRSUUexf2R7D0V0SSkUwo1/
 oQay9sXW8/FW2qn1EYdCNPjkz9KXC7by79ed3CoLufkXFGYmjror2U+Az0dYVeraKqdQNQ
 gUMKbrvUDBzglJS/h7MutwH4heD1Rpo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-gDV8ex9fMOOto4SO54crYw-1; Mon, 27 Jan 2025 09:44:17 -0500
X-MC-Unique: gDV8ex9fMOOto4SO54crYw-1
X-Mimecast-MFC-AGG-ID: gDV8ex9fMOOto4SO54crYw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361efc9dc6so24639995e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989055; x=1738593855;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zWcGFbS8jS6v1/ci8rB7BLdrR7iQ0XxIg6CKGrZTecQ=;
 b=hTdxqL4/JXntPpiIUiK/GrQGn0s7koVniv3i8dtBXIXbI1AO76E2pErtX/70EcDCjf
 WjU2u2PRDSJ8WKKzYiKCzTg9Ko3W1oh6UjLdrn9iC5U0EE720WS74XeyIiaTBFnq4DHJ
 lXF3co/Dh16MnKdZd/TTTu5ZSgiqsesm821soKOKfE4gviTHPg3UdfE0e7V7eiRQqodN
 leltZt8MFb1TKB+pdVpdAG7VLm4uZznMG2VGpA/DbcQjlzCDqGZ5DLX4AFWSan35Ed72
 x/lDdsQPcr05atCA1jUh2OkZtvOXWmrn8uQkJBYSycj57FFAxbKOS1ATsUZEoh1N15Nj
 U5sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWQvNwcgIeScvwfSHrFRob8BjFJuUMVGdWQn33z1781+4cW3/HQXHxkGA1oTRUeGjHZQ9RG/0fOEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo2AKGKu/nHsrD42fYAX5JMX0Jq41FIkzA3YP4Fr5uSbLqJiyC
 0Yx5WGz95ok6ld5hNcYoQwoIIf4eQ1izw1dFQZMxppB5jzPbBxvl8FF6rlK/VQWtKsA9PUY7t1M
 qBBCbizlrIc9ZNQt0eAi2u7p3Lx3igKG6UK3ZeYydyb29rAzvNBbVlsFoORLVgX30HQ==
X-Gm-Gg: ASbGncsQxadz/rQ0L5VADwMKE6RSQvPVHG9hzziHGYoEvVst/nZaPqSOkODRsaFZN4S
 wsv0z/rHtRlD4lmNIko3BpmO3n8WqOR/iIG7fKP+Oiy05sPyKugvyFbFiEapn18EqA8/DGNyDKM
 25apn3S9of61YR/hHiMBdkVtrYoGWkdogXoF/jgif6qOu6R/S0SJnLnyr5SlqtTpQ6oU1Cvo+6+
 z87IUmNPdm/sdt3pLlHrX9qGSr4OtAYPEt4EjHosjurFttacFXhC897ksoySiF4ZVc8Xj0X7p+R
 Neqi/uQ/KmQKQGxgzD/syAXk+jZWkO85uWjpdMyVT0BR
X-Received: by 2002:a05:600c:3b0f:b0:434:ffe3:bc7d with SMTP id
 5b1f17b1804b1-438913f01a1mr417808935e9.16.1737989054767; 
 Mon, 27 Jan 2025 06:44:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfmt13UwjxHCM0htkv0N1pXD4gLA+Qxeix5RN17ccQEyN7Qg1YILDmYalVBZBjISYRJ1bc+g==
X-Received: by 2002:a05:600c:3b0f:b0:434:ffe3:bc7d with SMTP id
 5b1f17b1804b1-438913f01a1mr417808685e9.16.1737989054376; 
 Mon, 27 Jan 2025 06:44:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4295sm11505943f8f.91.2025.01.27.06.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:44:13 -0800 (PST)
Message-ID: <70ce45a7-7663-473d-8b95-d08f00ce3c42@redhat.com>
Date: Mon, 27 Jan 2025 15:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] drm/ast: Always validate H/V sync flags
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: in9_4bZUXypR9hjae2XIFekwZQmek7dM99cBQIDXvsM_1737989055
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> The ast driver matches DRM display modes against an internal list of
> modes supported by the VBIOS. Matching H/V sync flags between modes is
> preferred, but optional. If sync flags are not matching, the driver
> would program the VBIOS settings to hardware and let the display handle
> the difference.
> 
> DRM modes are generated from attached displays or standard mode lines.
> Therefore differences to the VBIOS modes are not just cosmetical, but
> signal possible incompatibility with the display hardware.
> 
> Hence make matching H/V sync flags mandatory. If the VBIOS does not
> support a certain mode, we should report it as unsupported. Note that
> the VBIOS mode tables all appear to refer to standard modes.
> 
> (If sync flags really make no difference to the VBIOS, the ast driver
> shouldn't match them in the first place.)

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
-- 

Jocelyn

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++--------------------
>   1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index fca625518a873..48b46dc3a618e 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -113,8 +113,8 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   {
>   	u32 refresh_rate_index = 0, refresh_rate;
>   	const struct ast_vbios_enhtable *best = NULL;
> +	const struct ast_vbios_enhtable *loop;
>   	u32 hborder, vborder;
> -	bool check_sync;
>   
>   	switch (format->cpp[0] * 8) {
>   	case 8:
> @@ -176,36 +176,27 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   	}
>   
>   	refresh_rate = drm_mode_vrefresh(mode);
> -	check_sync = vbios_mode->enh_table->flags & WideScreenMode;
> -
> -	while (1) {
> -		const struct ast_vbios_enhtable *loop = vbios_mode->enh_table;
> -
> -		while (loop->refresh_rate != 0xff) {
> -			if ((check_sync) &&
> -			    (((mode->flags & DRM_MODE_FLAG_NVSYNC)  &&
> -			      (loop->flags & PVSync))  ||
> -			     ((mode->flags & DRM_MODE_FLAG_PVSYNC)  &&
> -			      (loop->flags & NVSync))  ||
> -			     ((mode->flags & DRM_MODE_FLAG_NHSYNC)  &&
> -			      (loop->flags & PHSync))  ||
> -			     ((mode->flags & DRM_MODE_FLAG_PHSYNC)  &&
> -			      (loop->flags & NHSync)))) {
> -				loop++;
> -				continue;
> -			}
> -			if (loop->refresh_rate <= refresh_rate
> -			    && (!best || loop->refresh_rate > best->refresh_rate))
> -				best = loop;
> +
> +	loop = vbios_mode->enh_table;
> +
> +	while (loop->refresh_rate != 0xff) {
> +		if (((mode->flags & DRM_MODE_FLAG_NVSYNC) && (loop->flags & PVSync))  ||
> +		    ((mode->flags & DRM_MODE_FLAG_PVSYNC) && (loop->flags & NVSync))  ||
> +		    ((mode->flags & DRM_MODE_FLAG_NHSYNC) && (loop->flags & PHSync))  ||
> +		    ((mode->flags & DRM_MODE_FLAG_PHSYNC) && (loop->flags & NHSync))) {
>   			loop++;
> +			continue;
>   		}
> -		if (best || !check_sync)
> -			break;
> -		check_sync = 0;
> +		if (loop->refresh_rate <= refresh_rate &&
> +		    (!best || loop->refresh_rate > best->refresh_rate))
> +			best = loop;
> +		loop++;
>   	}
>   
> -	if (best)
> -		vbios_mode->enh_table = best;
> +	if (!best)
> +		return false;
> +
> +	vbios_mode->enh_table = best;
>   
>   	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
>   	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;

