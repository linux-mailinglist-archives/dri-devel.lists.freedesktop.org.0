Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14FA5C1E0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFC310E5A7;
	Tue, 11 Mar 2025 13:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iDCsRBX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBD110E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jKR8veX8ueeWlw97ru3ELQ8uFmLDh0OQMKIg+XP3ng=;
 b=iDCsRBX9OwViMeyIVJ8vFjTQPccsIH60ucoonSqSKcTE816D6yv/wpyULvACRSuS2+JEjH
 k6LfpdTLGsCutDgiYCWJpa5uv7gb47bvNI4TwzMtRGsQLM/lSgt7lt5gerrHUN1LA/fgKW
 Qwh4Fq74Nuzkcdk/jFoxyNCu4mf20PY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-PYSOhzWiOOGUEIz8K2RpPg-1; Tue, 11 Mar 2025 09:07:01 -0400
X-MC-Unique: PYSOhzWiOOGUEIz8K2RpPg-1
X-Mimecast-MFC-AGG-ID: PYSOhzWiOOGUEIz8K2RpPg_1741698420
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3913aea90b4so1379009f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698420; x=1742303220;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jKR8veX8ueeWlw97ru3ELQ8uFmLDh0OQMKIg+XP3ng=;
 b=U2vFtoGVWnw7ac2lvvTEsfyfUousIIhIsGyRGNwPEJxnOiI0fhAVlg1QwiRayM5qls
 qgpGNBiWbkJizNGDpH6n262bIVownBS6BdoauYRpwCZlSHegL/Xy2HWkDZPxj9NNCVBZ
 pHlVZQL3IK+PEmZVdalT8p+zF0A5vOBo9sfDVJz/4tOazaOQg3wIJXoa6+K4ocK2PbKE
 NQUBo/9lcu0rcR11zbotHl40MtS4E65PjXqwuypKksxt/d28ch+9A0A3VJJXHNq1IUs4
 nVvk3uLVwZzAWhEUcq/bfBaW+Q88rgQiPGCfzrhaWtCEtY6Cyn3ccXZY8bKPwJxdfG7E
 1VXQ==
X-Gm-Message-State: AOJu0Yy5SZnhq8LHy4/Uqqkh+UY/GKBo/3gWzplaE7vlzUU5Rx3v3XfK
 QvTIfMUEuXOyi9pkZE0HTikEP//uE0fyx+waD8qK4y/ZB3sb3hcpbOJeb5P8+57NP7Y9dIuAB7C
 16rtqyUbkkGnRGI3g513Xm7ObqKjSgIXXSFcF5Wvgb6twkfI51WKEjTPxKJ+NoBo+nA==
X-Gm-Gg: ASbGnctDlGS9auOWai40VYXlJDm7ZKzLLuyDPe2lr1bLjMVJRb9pGGZgtkGZoxNRB+5
 4MVawlXOv3ebKGn5xaEdmA9iEIRTVeHl8o9Y7cuElZG1WRCKaSeBuB85inmalip/5PfiVAQQmAP
 CmsoSowKeuNpi8UJ6fo01b5hP/tEzKmvbKGy2/g8m4FgifMGhgiK/nS3/zT5zZCVdeowj3BTkDJ
 D0yG+JnTj9dpN4lq2EHuFK/eYs68Ivb8ZJJsI7bIT6ngvYCDL1lLKjS21XV1x2dEeTAL+OzdtTF
 THGMi9RqFPH3YDZhKGqW5GMEH8s9xbCeMwAgIM95IFGWJvhXC9OcLR4=
X-Received: by 2002:a05:6000:1842:b0:391:2e97:577a with SMTP id
 ffacd0b85a97d-39132de2e83mr11867096f8f.55.1741698419917; 
 Tue, 11 Mar 2025 06:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLWyXQJc1HnNgCUICw9F9X7xg5ms/JXcc2PHwgNlF5z5w+gUZ9uz2cj9Z3shr7GLC7YH69Dw==
X-Received: by 2002:a05:6000:1842:b0:391:2e97:577a with SMTP id
 ffacd0b85a97d-39132de2e83mr11867043f8f.55.1741698419317; 
 Tue, 11 Mar 2025 06:06:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2e89sm18188705f8f.71.2025.03.11.06.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:06:58 -0700 (PDT)
Message-ID: <b7ed98f2-11ff-4709-a551-6f8859ad6c15@redhat.com>
Date: Tue, 11 Mar 2025 14:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_
 constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rou1qFVezvquz2Dz4lkb2qbwZcQdEVMOiB4KZ0-1cmc_1741698420
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

On 05/03/2025 17:30, Thomas Zimmermann wrote:
> Ast's AST_VIDMEM_SIZE_ constants enumerate supported video-memory
> sizes from 8 MiB to 128 MiB. Replace them with Linux' SZ_ constants
> of the same value. When expanded, the literal values remain the same.
> 
> The size constant for 128 MiB is unused and the default size is not
> necessary. Remove both of them.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  8 --------
>   drivers/gpu/drm/ast/ast_mm.c   |  9 ++++-----
>   drivers/gpu/drm/ast/ast_post.c | 24 ++++++++++++------------
>   3 files changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index d2c2605d2728..2c7861835cfb 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -340,14 +340,6 @@ static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 i
>   	__ast_write8_i_masked(ast->ioregs, base, index, preserve_mask, val);
>   }
>   
> -#define AST_VIDMEM_SIZE_8M    0x00800000
> -#define AST_VIDMEM_SIZE_16M   0x01000000
> -#define AST_VIDMEM_SIZE_32M   0x02000000
> -#define AST_VIDMEM_SIZE_64M   0x04000000
> -#define AST_VIDMEM_SIZE_128M  0x08000000
> -
> -#define AST_VIDMEM_DEFAULT_SIZE AST_VIDMEM_SIZE_8M
> -
>   struct ast_vbios_stdtable {
>   	u8 misc;
>   	u8 seq[4];
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 6dfe6d9777d4..20d833632a01 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -38,20 +38,19 @@ static u32 ast_get_vram_size(struct ast_device *ast)
>   	u8 jreg;
>   	u32 vram_size;
>   
> -	vram_size = AST_VIDMEM_DEFAULT_SIZE;
>   	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xaa, 0xff);
>   	switch (jreg & 3) {
>   	case 0:
> -		vram_size = AST_VIDMEM_SIZE_8M;
> +		vram_size = SZ_8M;
>   		break;
>   	case 1:
> -		vram_size = AST_VIDMEM_SIZE_16M;
> +		vram_size = SZ_16M;
>   		break;
>   	case 2:
> -		vram_size = AST_VIDMEM_SIZE_32M;
> +		vram_size = SZ_32M;
>   		break;
>   	case 3:
> -		vram_size = AST_VIDMEM_SIZE_64M;
> +		vram_size = SZ_64M;
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 91e85e457bdf..37568cf3822c 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -1075,16 +1075,16 @@ static void get_ddr3_info(struct ast_device *ast, struct ast2300_dram_param *par
>   
>   	switch (param->vram_size) {
>   	default:
> -	case AST_VIDMEM_SIZE_8M:
> +	case SZ_8M:
>   		param->dram_config |= 0x00;
>   		break;
> -	case AST_VIDMEM_SIZE_16M:
> +	case SZ_16M:
>   		param->dram_config |= 0x04;
>   		break;
> -	case AST_VIDMEM_SIZE_32M:
> +	case SZ_32M:
>   		param->dram_config |= 0x08;
>   		break;
> -	case AST_VIDMEM_SIZE_64M:
> +	case SZ_64M:
>   		param->dram_config |= 0x0c;
>   		break;
>   	}
> @@ -1446,16 +1446,16 @@ static void get_ddr2_info(struct ast_device *ast, struct ast2300_dram_param *par
>   
>   	switch (param->vram_size) {
>   	default:
> -	case AST_VIDMEM_SIZE_8M:
> +	case SZ_8M:
>   		param->dram_config |= 0x00;
>   		break;
> -	case AST_VIDMEM_SIZE_16M:
> +	case SZ_16M:
>   		param->dram_config |= 0x04;
>   		break;
> -	case AST_VIDMEM_SIZE_32M:
> +	case SZ_32M:
>   		param->dram_config |= 0x08;
>   		break;
> -	case AST_VIDMEM_SIZE_64M:
> +	case SZ_64M:
>   		param->dram_config |= 0x0c;
>   		break;
>   	}
> @@ -1635,19 +1635,19 @@ static void ast_post_chip_2300(struct ast_device *ast)
>                   switch (temp & 0x0c) {
>                   default:
>   		case 0x00:
> -			param.vram_size = AST_VIDMEM_SIZE_8M;
> +			param.vram_size = SZ_8M;
>   			break;
>   
>   		case 0x04:
> -			param.vram_size = AST_VIDMEM_SIZE_16M;
> +			param.vram_size = SZ_16M;
>   			break;
>   
>   		case 0x08:
> -			param.vram_size = AST_VIDMEM_SIZE_32M;
> +			param.vram_size = SZ_32M;
>   			break;
>   
>   		case 0x0c:
> -			param.vram_size = AST_VIDMEM_SIZE_64M;
> +			param.vram_size = SZ_64M;
>   			break;
>   		}
>   

