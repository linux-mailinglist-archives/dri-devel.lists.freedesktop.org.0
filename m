Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E0B3F5F2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1508E10E5BE;
	Tue,  2 Sep 2025 06:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IZLXKAwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABDA10E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756796013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZyI6w/6fqRYy/xrobheYyAgcn9JhSaHUxE0k6ucra8=;
 b=IZLXKAweS3LWJVlZSFyDwOKHzlYXFLU//GbrmdV/VHTA6J4j56iUCpB80/dC84FVcJoBrD
 Xg9F1NJjjBSbfCfJ04K+NrcJ+Dw/ArgTk4sxZx/hhA1aysLI+a7Li4QA23ViQRyHApsqqq
 4CRH/wOTKGV61+SShUhNNmPZrvpGbOM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-sM-eCmq-P1SVw7f8iGgcxw-1; Tue, 02 Sep 2025 02:53:31 -0400
X-MC-Unique: sM-eCmq-P1SVw7f8iGgcxw-1
X-Mimecast-MFC-AGG-ID: sM-eCmq-P1SVw7f8iGgcxw_1756796010
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3ce059e3b83so1950548f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756796010; x=1757400810;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NZyI6w/6fqRYy/xrobheYyAgcn9JhSaHUxE0k6ucra8=;
 b=Shrbcqwp8ATU0cl6BFkc5xJ1sX7gz7g6aOEcGKEyNPZgfUvWgendT5kRKvczb+PmQk
 Qy2CunGQc6KDQw6CYtQuTPeQZNRyi6JYurYPqIdujb2nGs1XwlfDMqEXHIayjzEewewV
 R4D7XBqZp3tKyTGF1VH/G/q9SvG0qas31OptnVeDfY1Da5T67wmM+yS5Ew6lJAOVzaPb
 8xPseoQhAyNjkIH0JF07Gz/5DCoGnNlwzcmtmyANj2/0zjWWxcG743K72QSonklvF5wR
 h3BQD/6YLo9jT8A7ZEGss5vvR4z7TmBsA8bJO96e03HP9nB9Oh16RRfUP0VCdlquGbKh
 GBRA==
X-Gm-Message-State: AOJu0YyOqsBAxzhXic8L9dpxRtvCZelaHsbzuhH8CgPFU33f0qUSK0YE
 kT18R+sxWxVG5HcEenOmw5jHPE1Mp8PCX4gloecprZdT5m1/z6pg145vT0fCuJgWOpS9Z+5weFQ
 hVIbWOR9elxLapOCCx8G/V+OjyUaczd9NkyIicjJmdTSKZlC42af/wdGspFwjZ1ydwy8TzQ==
X-Gm-Gg: ASbGnctFzK2KwrkWssafv4Eq/yCpJZ9fwYeNFAU1111UnKZbfMg2wdcr2T2k125pJcS
 fxRjeL+VGRfnVNDLSJf94d+25GLoSeVBVympZBMtFXqLvnkcyMIKpdxEkpWrm/xPS4iMVbkkMnD
 W5Oo93Lis+Wadt17OZzHIUEzd1vAGxWCQJAePivc1Z1IgeqnQExIMs2Zzy8rQThIkelKOEhvGxp
 9T5ZqQZucSCFvMPvE0L6ZH/2qWnOkJnZvM9ds2ZXQPpz43AW+PG/n3w6ltPIo0wInR9/wpsS3RT
 teauLygrAd/SB3Q7Xqj0YAXr9xpxlrhgH1PruYnM4dvXqjp7ys8se9tPCI3asy1tjfTuo9ix4gu
 //8M=
X-Received: by 2002:a05:6000:1889:b0:3c6:aa87:d959 with SMTP id
 ffacd0b85a97d-3d1de6aa0damr7976263f8f.26.1756796010439; 
 Mon, 01 Sep 2025 23:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfIFJ4xO9xyC7EkyaD/i6Y+E9EgKBI7JF9YhkvT5gR1Uh3Y3zb9Z4sLJWZjgT2nKD+pemo0Q==
X-Received: by 2002:a05:6000:1889:b0:3c6:aa87:d959 with SMTP id
 ffacd0b85a97d-3d1de6aa0damr7976237f8f.26.1756796010021; 
 Mon, 01 Sep 2025 23:53:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a7691340sm17366990f8f.39.2025.09.01.23.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:53:29 -0700 (PDT)
Message-ID: <43bc6737-1349-4de1-9278-83904d03410a@redhat.com>
Date: Tue, 2 Sep 2025 08:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/ast: Move DRAM info next to its only user
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826065032.344412-1-tzimmermann@suse.de>
 <20250826065032.344412-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250826065032.344412-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cNq1jO5TaBysvKdOpj23NBNqNgOlzKdF4OyHDTUeB8A_1756796010
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
> The only place in the ast driver that uses the DRAM type is the
> P2A DRAM initialization for Gen2 and Gen3 of the chip. Condense
> the code in ast_get_dram_info() to exactly this use case and move
> it into the Gen's custom source file. Remove the field dram_type
> from struct ast_device.
> 
> The AST_DRAM_ constants are also used in Gen4 POST helpers, but
> independently from the dram_type field. No changes there.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2100.c | 47 +++++++++++++++++--
>   drivers/gpu/drm/ast/ast_drv.h  |  2 -
>   drivers/gpu/drm/ast/ast_main.c | 83 ----------------------------------
>   3 files changed, 44 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 477ee15eff5d..44c33dd050eb 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -31,6 +31,38 @@
>   #include "ast_drv.h"
>   #include "ast_post.h"
>   
> +/*
> + * DRAM type
> + */
> +
> +static int ast_2100_get_dram_type_p2a(struct ast_device *ast)
> +{
> +	u32 mcr_cfg;
> +	int dram_type;
> +
> +	ast_write32(ast, 0xf004, 0x1e6e0000);
> +	ast_write32(ast, 0xf000, 0x1);
> +	mcr_cfg = ast_read32(ast, 0x10004);
> +
> +	switch (mcr_cfg & 0x0c) {
> +	case 0:
> +	case 4:
> +		dram_type = AST_DRAM_512Mx16;
> +		break;
> +	case 8:
> +		if (mcr_cfg & 0x40)
> +			dram_type = AST_DRAM_1Gx16;
> +		else
> +			dram_type = AST_DRAM_512Mx32;
> +		break;
> +	case 0xc:
> +		dram_type = AST_DRAM_1Gx32;
> +		break;
> +	}
> +
> +	return dram_type;
> +}
> +
>   /*
>    * POST
>    */
> @@ -266,6 +298,9 @@ static void ast_post_chip_2100(struct ast_device *ast)
>   	u8 j;
>   	u32 data, temp, i;
>   	const struct ast_dramstruct *dram_reg_info;
> +	int dram_type;
> +
> +	dram_type = ast_2100_get_dram_type_p2a(ast);
>   
>   	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
>   
> @@ -292,11 +327,17 @@ static void ast_post_chip_2100(struct ast_device *ast)
>   				for (i = 0; i < 15; i++)
>   					udelay(dram_reg_info->data);
>   			} else if (AST_DRAMSTRUCT_IS(dram_reg_info, DRAM_TYPE)) {
> -				data = dram_reg_info->data;
> -				if (ast->dram_type == AST_DRAM_1Gx16)
> +				switch (dram_type) {
> +				case AST_DRAM_1Gx16:
>   					data = 0x00000d89;
> -				else if (ast->dram_type == AST_DRAM_1Gx32)
> +					break;
> +				case AST_DRAM_1Gx32:
>   					data = 0x00000c8d;
> +					break;
> +				default:
> +					data = dram_reg_info->data;
> +					break;
> +				};
>   
>   				temp = ast_read32(ast, 0x12070);
>   				temp &= 0xc;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index c9c933b5a70d..4c29ae9fb511 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -172,8 +172,6 @@ struct ast_device {
>   	enum ast_config_mode config_mode;
>   	enum ast_chip chip;
>   
> -	uint32_t dram_type;
> -
>   	void __iomem	*vram;
>   	unsigned long	vram_base;
>   	unsigned long	vram_size;
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 41ff880cfdec..3eea6a6cdacd 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -210,85 +210,6 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
>   }
>   
> -static int ast_get_dram_info(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct device_node *np = dev->dev->of_node;
> -	uint32_t mcr_cfg;
> -
> -	switch (ast->config_mode) {
> -	case ast_use_dt:
> -		/*
> -		 * If some properties are missing, use reasonable
> -		 * defaults for GEN5
> -		 */
> -		if (of_property_read_u32(np, "aspeed,mcr-configuration", &mcr_cfg))
> -			mcr_cfg = 0x00000577;
> -		break;
> -	case ast_use_p2a:
> -		ast_write32(ast, 0xf004, 0x1e6e0000);
> -		ast_write32(ast, 0xf000, 0x1);
> -		mcr_cfg = ast_read32(ast, 0x10004);
> -		break;
> -	case ast_use_defaults:
> -	default:
> -		ast->dram_type = AST_DRAM_1Gx16;
> -		return 0;
> -	}
> -
> -	if (IS_AST_GEN6(ast)) {
> -		switch (mcr_cfg & 0x03) {
> -		case 0:
> -			ast->dram_type = AST_DRAM_1Gx16;
> -			break;
> -		default:
> -		case 1:
> -			ast->dram_type = AST_DRAM_2Gx16;
> -			break;
> -		case 2:
> -			ast->dram_type = AST_DRAM_4Gx16;
> -			break;
> -		case 3:
> -			ast->dram_type = AST_DRAM_8Gx16;
> -			break;
> -		}
> -	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
> -		switch (mcr_cfg & 0x03) {
> -		case 0:
> -			ast->dram_type = AST_DRAM_512Mx16;
> -			break;
> -		default:
> -		case 1:
> -			ast->dram_type = AST_DRAM_1Gx16;
> -			break;
> -		case 2:
> -			ast->dram_type = AST_DRAM_2Gx16;
> -			break;
> -		case 3:
> -			ast->dram_type = AST_DRAM_4Gx16;
> -			break;
> -		}
> -	} else {
> -		switch (mcr_cfg & 0x0c) {
> -		case 0:
> -		case 4:
> -			ast->dram_type = AST_DRAM_512Mx16;
> -			break;
> -		case 8:
> -			if (mcr_cfg & 0x40)
> -				ast->dram_type = AST_DRAM_1Gx16;
> -			else
> -				ast->dram_type = AST_DRAM_512Mx32;
> -			break;
> -		case 0xc:
> -			ast->dram_type = AST_DRAM_1Gx32;
> -			break;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>   struct drm_device *ast_device_create(struct pci_dev *pdev,
>   				     const struct drm_driver *drv,
>   				     enum ast_chip chip,
> @@ -311,10 +232,6 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   	ast->regs = regs;
>   	ast->ioregs = ioregs;
>   
> -	ret = ast_get_dram_info(ast);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>   	ast_detect_tx_chip(ast, need_post);
>   	switch (ast->tx_chip) {
>   	case AST_TX_ASTDP:

