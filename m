Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3C976B19
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D258810EB99;
	Thu, 12 Sep 2024 13:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GECLxCVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7246010EB99
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vk/vxmiptkTyZjQC5kv+Hkhkh06TlKOUUYD1+NVlG7Q=;
 b=GECLxCVTaoLGWhkz/StWp579wm1iKTqXj1waoMemUUOvPTi2ocblbP5xVFBB2VkrTjrIiL
 YPDETzEkrzc315vvf2Ucso04gPbOYrWgn+pDLY0wgfBRz9D9njhrq0GY8tAT390uk6xJgp
 7cUDOEe0Vjy2vAwllp2sTQVVQHzDYRg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-vsFXKxHUM7eBdjFkNBroMg-1; Thu, 12 Sep 2024 09:49:03 -0400
X-MC-Unique: vsFXKxHUM7eBdjFkNBroMg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb0b0514bso7689705e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148942; x=1726753742;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vk/vxmiptkTyZjQC5kv+Hkhkh06TlKOUUYD1+NVlG7Q=;
 b=ZXupb3+x/k/Zf20Hqhliw91w3F+0cO4+ZQN1eddBLuowg+VVgzrAAfsO++u5LMRnwi
 kXY+Q1Qp0Bf/cM8Nid9KM41SKkDbrbpEB4pocbozcuIzLj0yxF4ucNtZD4hIhn+EyN9m
 nh3BrhSewPEIdo6rIDLiVdPVkvTsvnfyPULzsdv/7RSN4olz89b/uOAol4LFB39+N2P4
 6W89gZsme6CGLKAhkD3p7q3oFK+wBpGvvxLR5pnPnTypTIhL7yI6J0X1LtBgs+H3DZzQ
 qgPiUA74xmzN4BS3zMUj5C8Cw6zzVZM0jqIAfKFoOcYhyFHM2i4FXi6uzELV9qVc06VD
 6ICw==
X-Gm-Message-State: AOJu0YyOyLP0C1oEGAYmv6/PE33Ome01MqcbMb7VfC8uIY/vHmZko7PB
 G9kELDu3HZTBI+qg/vCpVDdfObpWRO9YxQ9jmtlz6vVE/tFbB0ejlTqE52atORtOqvMCmqdqik3
 l8TSuOOc7xDJ+H5Zty5ar26Cj1oJwALDCj6MJ2aJ/hE9ozzjFDbDNRUb0cX0Rzx4fHw==
X-Received: by 2002:a05:600c:19ce:b0:42c:b4f2:7c30 with SMTP id
 5b1f17b1804b1-42cdb56ae9bmr20815575e9.23.1726148941682; 
 Thu, 12 Sep 2024 06:49:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJvAAxFG5NmsrETSoEyEqWe/rtBMSSwNyqZpc/SQ+3/ljOOwaczc0UCsXGyZk1Se1/pl2Ahw==
X-Received: by 2002:a05:600c:19ce:b0:42c:b4f2:7c30 with SMTP id
 5b1f17b1804b1-42cdb56ae9bmr20815355e9.23.1726148941235; 
 Thu, 12 Sep 2024 06:49:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca8cebd35sm191011565e9.0.2024.09.12.06.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:49:00 -0700 (PDT)
Message-ID: <1a49ef55-e42d-4bd4-9609-80269162c9d7@redhat.com>
Date: Thu, 12 Sep 2024 15:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/ast: Respect return value from CRTC init
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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

On 11/09/2024 13:51, Thomas Zimmermann wrote:
> Return an error if CRTC initialization fails.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 784e8ac0e668..f90fade5d681 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1396,7 +1396,9 @@ int ast_mode_config_init(struct ast_device *ast)
>   	if (ret)
>   		return ret;
>   
> -	ast_crtc_init(dev);
> +	ret = ast_crtc_init(dev);
> +	if (ret)
> +		return ret;
>   
>   	switch (ast->tx_chip) {
>   	case AST_TX_NONE:

