Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB38A5C1C7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276E810E5A1;
	Tue, 11 Mar 2025 13:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UNPLwLvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB7110E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TX/1eX9/b/uWBrJsCSUpipv9pfiTp3CkP5rDsh4+8Yo=;
 b=UNPLwLvBC5gYzTF03qyQU9sNKTKJ8HD1F6ULmSab8DKAx2qGDq+SePPRyH7IIU6bS9Zclv
 u6pvgWOKY/GqtqKjFNWM1Axeb7jXA+8v22J5iPDisoA03PU6GnpnwKWvp1roTP+wVzAcG5
 EKe7/p+2JjFVwXS5jZK+R+MqDC66chg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-kKTjfBKKNnmyPkn9MQzC0g-1; Tue, 11 Mar 2025 09:01:32 -0400
X-MC-Unique: kKTjfBKKNnmyPkn9MQzC0g-1
X-Mimecast-MFC-AGG-ID: kKTjfBKKNnmyPkn9MQzC0g_1741698091
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912a0439afso2111250f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698091; x=1742302891;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TX/1eX9/b/uWBrJsCSUpipv9pfiTp3CkP5rDsh4+8Yo=;
 b=OIX5ScgigVdHhGSPxU/I8FZovP2tn8S++USsH2zwfRaoPKx85OkG5jIRrTUAHoZhUX
 rzFGTroz9QQC7AOZQpH8obdGVtJLiIkV6p99WkqpUcBx83F3M45PE8G/gyT07D4K9npD
 D6TyLxXJCP1tFND7Jpv5qA89EWly//bKThqrMVgjyRI06WvjBsyKZYuxqBGtKUNnIsZY
 HXMka6VHSYme8dhEzJrtlAaqfxDwzzar1A3xeUSNjCLdLOr/zcJKBulLU4QGHL4zpxrt
 Kza6lwJJ7QOGw5nik7qneN0jgxdQIX5zdNHyBBLZAIkS5kUUBF7ZC00BHdDi2CkCxqdm
 MFeA==
X-Gm-Message-State: AOJu0YzDkd8lK/cqItbjpr5eYMhQt7/zFMt8ygEoBFIHlK0YFmV0CVeS
 qQJBE56HQdYsC8LgON1/VPTIiJkg47DsxZEl4iXvEERX2nzwSqDHw3Pzjttg5BDKy9NuISh+D7W
 pi70NCe9fMSCiS1Frrd4k8Ef3ndb1c8fbK/UaSAEeXJ9uxAEbQ6HWN7fY+SjRH/wvSw==
X-Gm-Gg: ASbGncsteZAAzEUXs5Z5y3lCvR8mhC707vVLg5lN8eubPEcmNDkywAeG+ApnaIlmadi
 k5eEM1whDjgHPeqabYn+AKVomwlNb3inIdh8BHEu3txRTgLgIE7fIV4g0GiTB5tW4/v42ywykzH
 S8MeH45SkDC3qiQsOgNBwDTFqyZx56Pgq2LhTeDVQgs1fbugQnD4R+baKRpR6V9U6klJ+pB/v/F
 P7BXE6OSP1Oh2sM+v1/vjiWxvYCLSd4kzePeJxekfCyb4A6+0veFMDYfNOU0lCVqTGvz2ukgzW4
 ZUDQCPtLgyB/TkdqA72E1tIQHchXmKJKc9p1BG0ydOiSKadxXGSlhLo=
X-Received: by 2002:a05:6000:1f82:b0:391:3fde:1da with SMTP id
 ffacd0b85a97d-3913fde033cmr13224327f8f.16.1741698090812; 
 Tue, 11 Mar 2025 06:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH31/s6zKJH0t9QeV9uoV+8bzGFsYNuwWaeZSg4smtf8wt+raz5mMNz/GAaezip2SXWRoL3VQ==
X-Received: by 2002:a05:6000:1f82:b0:391:3fde:1da with SMTP id
 ffacd0b85a97d-3913fde033cmr13224235f8f.16.1741698090085; 
 Tue, 11 Mar 2025 06:01:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1027d3sm17810161f8f.83.2025.03.11.06.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:01:29 -0700 (PDT)
Message-ID: <52e3c9ee-e21f-4f7d-9cab-be471da84bf6@redhat.com>
Date: Tue, 11 Mar 2025 14:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_
 constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305134401.60609-1-tzimmermann@suse.de>
 <20250305134401.60609-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305134401.60609-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iTV6ooEdSKh2P2gsdTIHlTJo8YfAxgUnTcgp9esBqDU_1741698091
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

On 05/03/2025 14:35, Thomas Zimmermann wrote:
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

