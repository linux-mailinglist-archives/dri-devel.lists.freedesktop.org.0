Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C68B3F5F6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACBA10E193;
	Tue,  2 Sep 2025 06:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pw9os50Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E722410E193
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756796028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VtYSDKliAMF4YSV3Fmg5d7NwqV2KAp+QFYRiviEsYr8=;
 b=Pw9os50YiS4QG2xT8F++xiVopvrhpSRiANGr3UEdrQAUksB3NH4s+3PHRO5nC5H6xcWlbA
 mctZT2yfffqYdy59M54ilL5+0vBGqCYF/Ui+5XAok/VX6N+Zlo2618nUhI/nssbEbZHLw2
 J/eIH76kAin447DUKIRwzOl9utUTBao=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-X-7Ybx01Mh2L7ELYELeKjQ-1; Tue, 02 Sep 2025 02:53:46 -0400
X-MC-Unique: X-7Ybx01Mh2L7ELYELeKjQ-1
X-Mimecast-MFC-AGG-ID: X-7Ybx01Mh2L7ELYELeKjQ_1756796026
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3cbe70a7861so3623429f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756796025; x=1757400825;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VtYSDKliAMF4YSV3Fmg5d7NwqV2KAp+QFYRiviEsYr8=;
 b=GSfXDpL6FUPenIOkQKQioGsInQ3FxKrk2AXCW0J7zw4FH6T2HvTkrMjkXnyj2DJLx3
 X/FIO4HSw5yguW//e+Obg2muWOPm6r3zZhbUmToUqyr7DEcU9uqA8G2TZ4vYYKneFf1l
 az0ShZ2qxr4rBMC9Fm73Jn5JV96mtEfasUjfX/rE3Thj5uhFbpZAYp4PpLo7g3yDODHP
 Lfz8vEm49K9u6EIkLCH34haClr5c4nkwNdQ+Kl6sCK6inF2Y+d4mqi3kzvG9XFfODPDE
 MNFk7ai+Izhwikpf/ehXTkZ/wJ0U0yocNyt9p3XZts5XFTc9eowAaCQrBqH6tX2NPrQh
 gUdQ==
X-Gm-Message-State: AOJu0YyFazMwfiUdYJuGCQYSyu7CTYXw7uLfNpCFpvNInD8g4cYRaXMD
 uxGzZtK77j6c82xZ5+tw2rld5SeYTizyYpa7u/NqdlEVPrYC04JIPf2yET73h4tLrPYE24cesyR
 V8l/SY435GUrbBAAnHS4jQZEmMYTNnroxQXpwbGIa5KtWUBABTQoXagbBatAhjVMVUMe++Q==
X-Gm-Gg: ASbGncsUR1w0SJsr3/k9EocWh7fE+NMPkge0d8XwxYzpIRNHVXe8stwH3UjGtWGmTWh
 /ofzwsoxk5mYdRZuSRbYibci8xiAAdPdP96hXPxiXlQ9VYOgRK9cI0tBHBuv5NKHsCpONi6W+LV
 GMuzszKEsMks/+jgo4uaQ69op3GwzcoZLl3Qtagfap+1RbdxoA977mrc7BUUOWh1JZHYIXZYGIr
 IeIVu/+6Xw/eTzgRgA3VK2ZqQF52wqHqj2hmWWMcd6eez0ZDxwCJpoYIuLPX0CG6xNLLU7oEnze
 YU4xFmex8F0YZdMZMZi9NYyuKRB5Q0Fh6OtS4rnDbvQ4cE+GdGlyGwe8RS8zU94tBFzXlfpOFXn
 V88Q=
X-Received: by 2002:a05:6000:290d:b0:3cf:3f1:acdd with SMTP id
 ffacd0b85a97d-3d1dcb781ffmr7639608f8f.17.1756796025595; 
 Mon, 01 Sep 2025 23:53:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqtotuhXqw2fXwiRGY72PxHUWWmEQgAMNZq61fSLTtblJ6VLzAKWnmsS+JTP+Flk56kOVAgQ==
X-Received: by 2002:a05:6000:290d:b0:3cf:3f1:acdd with SMTP id
 ffacd0b85a97d-3d1dcb781ffmr7639596f8f.17.1756796025209; 
 Mon, 01 Sep 2025 23:53:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e886619sm182235045e9.15.2025.09.01.23.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:53:44 -0700 (PDT)
Message-ID: <88d0a9d5-06e8-408b-9bd3-9daf57de0065@redhat.com>
Date: Tue, 2 Sep 2025 08:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/ast: Put AST_DRAM_ constants into enum
 ast_dram_layout
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826065032.344412-1-tzimmermann@suse.de>
 <20250826065032.344412-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250826065032.344412-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zbBD9KPnB2cdS6QyBsWnwm-99RoFZgH2U5ibV-XMhlo_1756796026
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

On 26/08/2025 08:49, Thomas Zimmermann wrote:
> The AST_DRAM_ constants belong together, so put them in an enum
> type. Rename type and variables to 'drm_layout', as there's already
> another DRAM type in the ast driver (AST_DDR2, AST_DDR3).
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> v2:
> - avoid compiler warning with switch default (Dan)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2100.c | 21 ++++++++++-----------
>   drivers/gpu/drm/ast/ast_drv.h  | 16 +++++++++-------
>   2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 44c33dd050eb..91541c8eaff7 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -35,10 +35,10 @@
>    * DRAM type
>    */
>   
> -static int ast_2100_get_dram_type_p2a(struct ast_device *ast)
> +static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
>   {
>   	u32 mcr_cfg;
> -	int dram_type;
> +	enum ast_dram_layout dram_layout;
>   
>   	ast_write32(ast, 0xf004, 0x1e6e0000);
>   	ast_write32(ast, 0xf000, 0x1);
> @@ -47,20 +47,21 @@ static int ast_2100_get_dram_type_p2a(struct ast_device *ast)
>   	switch (mcr_cfg & 0x0c) {
>   	case 0:
>   	case 4:
> -		dram_type = AST_DRAM_512Mx16;
> +	default:
> +		dram_layout = AST_DRAM_512Mx16;
>   		break;
>   	case 8:
>   		if (mcr_cfg & 0x40)
> -			dram_type = AST_DRAM_1Gx16;
> +			dram_layout = AST_DRAM_1Gx16;
>   		else
> -			dram_type = AST_DRAM_512Mx32;
> +			dram_layout = AST_DRAM_512Mx32;
>   		break;
>   	case 0xc:
> -		dram_type = AST_DRAM_1Gx32;
> +		dram_layout = AST_DRAM_1Gx32;
>   		break;
>   	}
>   
> -	return dram_type;
> +	return dram_layout;
>   }
>   
>   /*
> @@ -298,9 +299,7 @@ static void ast_post_chip_2100(struct ast_device *ast)
>   	u8 j;
>   	u32 data, temp, i;
>   	const struct ast_dramstruct *dram_reg_info;
> -	int dram_type;
> -
> -	dram_type = ast_2100_get_dram_type_p2a(ast);
> +	enum ast_dram_layout dram_layout  = ast_2100_get_dram_layout_p2a(ast);
>   
>   	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
>   
> @@ -327,7 +326,7 @@ static void ast_post_chip_2100(struct ast_device *ast)
>   				for (i = 0; i < 15; i++)
>   					udelay(dram_reg_info->data);
>   			} else if (AST_DRAMSTRUCT_IS(dram_reg_info, DRAM_TYPE)) {
> -				switch (dram_type) {
> +				switch (dram_layout) {
>   				case AST_DRAM_1Gx16:
>   					data = 0x00000d89;
>   					break;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 4c29ae9fb511..c15aef014f69 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -98,13 +98,15 @@ enum ast_config_mode {
>   	ast_use_defaults
>   };
>   
> -#define AST_DRAM_512Mx16 0
> -#define AST_DRAM_1Gx16   1
> -#define AST_DRAM_512Mx32 2
> -#define AST_DRAM_1Gx32   3
> -#define AST_DRAM_2Gx16   6
> -#define AST_DRAM_4Gx16   7
> -#define AST_DRAM_8Gx16   8
> +enum ast_dram_layout {
> +	AST_DRAM_512Mx16 = 0,
> +	AST_DRAM_1Gx16 = 1,
> +	AST_DRAM_512Mx32 = 2,
> +	AST_DRAM_1Gx32 = 3,
> +	AST_DRAM_2Gx16 = 6,
> +	AST_DRAM_4Gx16 = 7,
> +	AST_DRAM_8Gx16 = 8,
> +};
>   
>   /*
>    * Hardware cursor

