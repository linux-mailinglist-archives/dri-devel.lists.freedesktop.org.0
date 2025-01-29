Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F7A21BD9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD8F10E7BB;
	Wed, 29 Jan 2025 11:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GuSBwN86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04C310E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738148904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rch3ZVvU6p6+wmma8HHWa3s9xvNxAHQFI7fzpaZ1Fj0=;
 b=GuSBwN86XphTOkNIw5Q9p5gwKxWdpSf9LnUX7dS197xXkhE0VOZzDrLRqQNtcrUyaSgRhc
 xChRU7JrndGmDQ3nbUj2ytB1BPz/09aHgKSYmCgYZIvnVvvTTvxLwvk7c1plfjRwOBZBRP
 yQWF6uPveIqdHGXZwTNmarEpeDJ71m0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-GDpnNMjaMYuqRo29M-TYfg-1; Wed, 29 Jan 2025 06:08:23 -0500
X-MC-Unique: GDpnNMjaMYuqRo29M-TYfg-1
X-Mimecast-MFC-AGG-ID: GDpnNMjaMYuqRo29M-TYfg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38c24ac3415so5455918f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148902; x=1738753702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rch3ZVvU6p6+wmma8HHWa3s9xvNxAHQFI7fzpaZ1Fj0=;
 b=Qfa8zTrLlNT2FVMIfvbNiWqbrhsSTdE9LXNpZA876Lyr+S6T9HsI1tJCHSGKBz1fhC
 +gGTBy6uVgdUQxYN3i6HYmNhyKsvOAgxKkf35liz4HO21vfLTkOGbVsRCKBQor4cZ/fs
 uwXFR4s0U1LMpWIj0w+EDSWJHNVxJq1xGnIKfiPDkUpLO3CBWktIKBh0HJhfvtRpH7b7
 vagvCL0P7E5WESdNh6VpQAxvPcXiK82n3/NbBfGuDmUznGITfr/Qm4g3w6BoZ2iG02EL
 rrpNG50awkhxjSntGj0bXWg9efTn1LWk8tqEhWXP9UV5TqdiDM+0ANR5sg8VoAp4ahzj
 WMWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfqyO8Xz90v/96jHVSEIjPb++yVkXLQeRI2sCX/V7VQtssojijCirbUleF0NYhKLmPY0w2hRKXN5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvfJhOUTadvPZ+1bPFW2syf7IkBKIJT94NWm+CFr+VsnFfm+JY
 jALKwQqEWswa36fitOiExSVuIuaREubRy/a1HceA+PrckgBIoqSKTAYbw0doGx4SQy1sm4HYhyB
 P9AhBnbObgCODvk25jROOl1OjZ8IHdQrMpcIJI3vVoo0zCpprHVcjwQBNrLbRfqMyaQ==
X-Gm-Gg: ASbGncvCHKxSUnvpwoylNHjLnhjshX3SHTioxKeG6No6mXiqpkld//OSpX/i+r2WK+P
 Irf6TClU0i4lK2vA/H7J6c5NEh4nXwDBOQjfXLqc8iskCdkOrxxuPGIqkofHoX55SeanlfamLBo
 HNcd/KzQHOQ9uYCkIZS17HxwDqs7nQZWev0V1CQGuAodZ2CWxjVZn4WGC8LtjHsYjDjQvmMf61o
 4zZ46SfWljc7AcuaeqfNlekt6SUwK+e7HP/sc6/E4UnUhB8xo6VAYuKp2bj1+dF8SgBl0SOy0Gt
 VfHd+Apu8I8iWKRRPuVlhXpU1PGTsqP3fSbE7tZ6+E8Y
X-Received: by 2002:a5d:5847:0:b0:38c:3fab:3def with SMTP id
 ffacd0b85a97d-38c5193810emr2582185f8f.10.1738148902366; 
 Wed, 29 Jan 2025 03:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ08/dpMIUK/H20gk8JWeg2j5Zhl+0pytjYFGC+QM5D8eEqGSzWjE72fIy+9j4+UWt1Y5KpA==
X-Received: by 2002:a5d:5847:0:b0:38c:3fab:3def with SMTP id
 ffacd0b85a97d-38c5193810emr2582143f8f.10.1738148901919; 
 Wed, 29 Jan 2025 03:08:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a18931esm17024259f8f.60.2025.01.29.03.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:08:21 -0800 (PST)
Message-ID: <7036ad41-6acc-4269-9c7f-b23c23c2c95f@redhat.com>
Date: Wed, 29 Jan 2025 12:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] drm/ast: Reorganize widescreen test around
 hardware Gens
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250129095840.20629-1-tzimmermann@suse.de>
 <20250129095840.20629-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250129095840.20629-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: svDOKiRXuVvq2gzv0WggnOaZF9_ohghyf0J5-qYrOZk_1738148902
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

On 29/01/2025 10:54, Thomas Zimmermann wrote:
> Testing for support of widescreen modes mixes up various hardware
> Gens. First branch by hardware Gen, then do specific tests for each
> Gen. By default, widesscreen support is disabled.
> 
> Later patches will add more specific tests for each Gen.
> 
> v2:
> - move shared detection code into helper (Jocelyn)

Thank for the v2, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 54 ++++++++++++++++++++--------------
>   1 file changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 1cfbe404e5a0a..93ae9a275c960 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -36,33 +36,43 @@
>   
>   #include "ast_drv.h"
>   
> +/* Try to detect WSXGA+ on Gen2+ */
> +static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
> +{
> +	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +
> +	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +		return true;
> +	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +		return true;
> +
> +	return false;
> +}
> +
>   static void ast_detect_widescreen(struct ast_device *ast)
>   {
> -	u8 vgacrd0;
> +	ast->support_wsxga_p = false;
>   
> -	/* Check if we support wide screen */
> -	switch (AST_GEN(ast)) {
> -	case 1:
> -		ast->support_wsxga_p = false;
> -		break;
> -	default:
> -		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> -		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +	if (AST_GEN(ast) >= 7) {
> +		ast->support_wsxga_p = true;
> +	} else if (AST_GEN(ast) >= 6) {
> +		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> -		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +		else if (ast->chip == AST2510)
> +			ast->support_wsxga_p = true;
> +	} else if (AST_GEN(ast) >= 5) {
> +		if (__ast_2100_detect_wsxga_p(ast))
> +			ast->support_wsxga_p = true;
> +		else if (ast->chip == AST1400)
> +			ast->support_wsxga_p = true;
> +	} else if (AST_GEN(ast) >= 4) {
> +		if (__ast_2100_detect_wsxga_p(ast))
> +			ast->support_wsxga_p = true;
> +		else if (ast->chip == AST1300)
> +			ast->support_wsxga_p = true;
> +	} else if (AST_GEN(ast) >= 2) {
> +		if (__ast_2100_detect_wsxga_p(ast))
>   			ast->support_wsxga_p = true;
> -		else {
> -			ast->support_wsxga_p = false;
> -			if (ast->chip == AST1300)
> -				ast->support_wsxga_p = true;
> -			if (ast->chip == AST1400)
> -				ast->support_wsxga_p = true;
> -			if (ast->chip == AST2510)
> -				ast->support_wsxga_p = true;
> -			if (IS_AST_GEN7(ast))
> -				ast->support_wsxga_p = true;
> -		}
> -		break;
>   	}
>   }
>   

