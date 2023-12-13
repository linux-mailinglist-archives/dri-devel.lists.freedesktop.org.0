Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4975811538
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF8710E2A7;
	Wed, 13 Dec 2023 14:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA84A10E2A7;
 Wed, 13 Dec 2023 14:50:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c46d6784eso31848525e9.3; 
 Wed, 13 Dec 2023 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702479038; x=1703083838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fu9F/kPRn2KNHEsN5XqRXHcLTAjS5PBXA2PgoOzdIX8=;
 b=MrdVAGrQLyb+KIunH+jJkLuGd8H20bJkL2vrALy6UHojqMJR/5eyE/GdSpeWepeSNV
 IVHDmRDMJ4J+PIcXAHUgWoFJLB7n4HR5M9WG8C0jIMHv5N8l2P4lVhQQkhpKhCB4BTlQ
 ZYTK3XlhKKUw9ZVEF1+0HPpbUiDjOo4DYdW9QBGBYAJk6vbNsmRI9JsMBIxtl0OgMrRV
 Nm4bSW7pVZ2Oy8OBQ5o93/zrdUT9e7+mlTnI8ReBsGsxJiLweJ/Lw2PFZhMhF2gauy+O
 vCyG38TYQKoGZP5ExgwcUTmL5erz6i0rindhxWY1otpbzBD2lVxov4Pd5uiXbUbsd9kb
 XHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702479038; x=1703083838;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fu9F/kPRn2KNHEsN5XqRXHcLTAjS5PBXA2PgoOzdIX8=;
 b=gu0xg/G2PnkiVqDn4ynvcdGwQk/HiWmDaGzdgbtPY+lTnr4bHJMrbH4u4iu9+Mpim8
 JecpNAuY+hHfUZBp7KtNcDPYTHlJDpnZ3lY9BgbGi7ZVUKMk3PpargScP5/dgl5XHfC1
 pJ9sPLAGvNI8t8qn49FcVZByHVUqLfsMl8vsmR3qD3erIWD4Sn05nmm9Tj7DbbmxRphH
 Ews8DcCLhXXEhl7c1IYUDYjTb5Nmy6Val3mtbUU/I9NrfXffOj5BAkMuunRkVzbVMdHs
 st99EC2vZ4H6WoVfRS01V1/V9nQNnUCbCicpjBT7RtJvNy5oSWiv0vIs7wk+pdtVMoCC
 FPKg==
X-Gm-Message-State: AOJu0YyvkdcV9j5asR4YoYulGFMtVTueSmHDFB2IgtgkjJ9FyNjSb6cZ
 1JSXvAnB1mkIYe+qoFABqbFw4MkI+s0=
X-Google-Smtp-Source: AGHT+IHrYNHAqUkYfuq8qvI6a/1huYcuz4ksVoQzy40nRSwgfDnwcD+v/06JqVZO6rOpPoswZapy+A==
X-Received: by 2002:a05:600c:3ba6:b0:40b:5e1c:5c1d with SMTP id
 n38-20020a05600c3ba600b0040b5e1c5c1dmr4080014wms.50.1702479037914; 
 Wed, 13 Dec 2023 06:50:37 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 fc17-20020a05600c525100b0040c42681fcesm13909554wmb.15.2023.12.13.06.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 06:50:37 -0800 (PST)
Message-ID: <16cef96f-b5b8-4b27-ab01-05d89b120d9f@gmail.com>
Date: Wed, 13 Dec 2023 15:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/ttm: return ENOSPC from ttm_bo_mem_space
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20231213144222.1871-1-christian.koenig@amd.com>
In-Reply-To: <20231213144222.1871-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Before anybody wonders why no additional people are on CC: I just send 
that out to get feedback from the CI systems.

Regards,
Christian.

Am 13.12.23 um 15:42 schrieb Christian König:
> Only convert it to ENOMEM in ttm_bo_validate.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index edf10618fe2b..8c1eaa74fa21 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -830,7 +830,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   			goto error;
>   	}
>   
> -	ret = -ENOMEM;
> +	ret = -ENOSPC;
>   	if (!type_found) {
>   		pr_err(TTM_PFX "No compatible memory type found\n");
>   		ret = -EINVAL;
> @@ -916,6 +916,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   		return -EINVAL;
>   
>   	ret = ttm_bo_move_buffer(bo, placement, ctx);
> +	/* For backward compatibility with userspace */
> +	if (ret == -ENOSPC)
> +		return -ENOMEM;
>   	if (ret)
>   		return ret;
>   

