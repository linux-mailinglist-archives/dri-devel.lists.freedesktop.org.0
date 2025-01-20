Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E94A16ADF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AEE10E39A;
	Mon, 20 Jan 2025 10:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dNV9L9IE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1FE10E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XxWm7bLRSIuTfLrXlJPWmrHk8yHqll90TeSyz8/+Zw=;
 b=dNV9L9IELtJjymhFlrJEmgjNR09Rc5cmlMJ8flrYaeLzSTOTy5uqa4PPo7q66xqJbWziJ+
 8qRWEyfwCihabfBQBpVw/inwfd9wQBAheq60gPhQ2Kz5wgLxyAuDmzTHUTdRec791QheLF
 vgK4A19ZljDHLe8FvVghiYUqCyEz9Nk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-ETyG83SxNg2EWatrXWvSAw-1; Mon, 20 Jan 2025 05:37:04 -0500
X-MC-Unique: ETyG83SxNg2EWatrXWvSAw-1
X-Mimecast-MFC-AGG-ID: ETyG83SxNg2EWatrXWvSAw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385fdff9db5so1648671f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369423; x=1737974223;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7XxWm7bLRSIuTfLrXlJPWmrHk8yHqll90TeSyz8/+Zw=;
 b=ZUUiwacfya/pGzf10Nz4EwpFRZLT9+8datoDclGtFz21EWoeCUyEBvuraKlBhzt1Bg
 5jsF1kQSACOFQEvzSXEIsjA468mpfha129t/IpFp2MIRSDEB97/OP7a81n+3JUS6g1Ga
 568VveXi0JKaPNFalAoSxb8lGC9+qvlQ6LAZCIWG2Z3YVrWvT4sH1UHbbSmsjXC06RoO
 3HoGKwSXfN+DmDpkcPGgDmNwC0Jssur5zvbdG3p9Y0CXwvGYKJ+bGkSeegzGcnJz1HDy
 fmSWbV3NCH0eY201USsfWSNsWf3bQuUXwkYT6VvTEVpH59ddeB1MlG2IcPfLXez333yT
 v5yg==
X-Gm-Message-State: AOJu0Yz13MTGastTBvm1SXO3Hf4rhWokSdqlHG/aSFczhFLPmSJhR5Zk
 GAqbYYkPwrKdZcNlwcBjuxt5t4T2LoJ0An+9Vg3gDRjyc5ut1bLxVv8nwbzCa9Cj9FkWVMMIBUo
 RoCqdEKlVgyp5f0Ws9sHNuIcl/qt/TsZdi1X6BCp9dT6usRZ+cVRyAlQEOfhZnrj/pxVEM+GDAw
 ==
X-Gm-Gg: ASbGncullRUY1S4i4OY+SKEFxtXzMQA1YuJ/+ftyUAwjtCkSHrFcCzzo8oDSSgXphKD
 +7cHE5Ubf7YgV31JaIbAJPkjs6vB8xW3Me79FLOKf/dUkqK4ady4uMOnkx71alTic+W1sblIFZs
 ZJ6uV3S70nLSZHk0112+m+4h9hhGx08ZKDy1KIVizaxGj2VtaHmkNX0m6XV7VoarEJ+PXcQ2ajv
 qBFkt3GT+EU7X/WAjLTKnv/HXtKVPT9LRLOMhBn+0uL0jOYnjjY/KeNOh5UeV9lmVpyqkREQPp8
 ZZRgZ9BnFsd8mlRdJHb0JjaL8qR41fSpvA==
X-Received: by 2002:a05:6000:18a8:b0:385:f69a:7e5f with SMTP id
 ffacd0b85a97d-38bf57a9a86mr13924969f8f.38.1737369423275; 
 Mon, 20 Jan 2025 02:37:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoqaALUaAuXVK5U9mQSTd7/4MAbjpkrcuHrMRtfHa5FEvJOharo+f4jV+k/k/cL0hmuH/lRQ==
X-Received: by 2002:a05:6000:18a8:b0:385:f69a:7e5f with SMTP id
 ffacd0b85a97d-38bf57a9a86mr13924931f8f.38.1737369422881; 
 Mon, 20 Jan 2025 02:37:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327df12sm10149855f8f.92.2025.01.20.02.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:37:02 -0800 (PST)
Message-ID: <d027a419-2eff-47ca-b942-adca8b5615e9@redhat.com>
Date: Mon, 20 Jan 2025 11:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/ast: Initialize ASTDP in ast_post_gpu()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sdXVGlwLgKa8HAsXIdAYBNqR17j2CnQPb1H_NuyhD3Y_1737369424
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

On 17/01/2025 11:29, Thomas Zimmermann wrote:
> Remove the call to ast_dp_launch() from ast_detect_tx_chip() and
> perform it unconditionally in ast_post_gpu().
> 
> Also add error handling: the detection code apparently used
> ast_dp_launch() to test for a working ASTDP, falling back to VGA on
> errors. As the VBIOS reports ASTDP, silently ignoring errors is
> questionable behavior. With the refactoring, failing to initialize
> the ASTDP will also fail probing the driver.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  6 +++++-
>   drivers/gpu/drm/ast/ast_drv.h  |  2 +-
>   drivers/gpu/drm/ast/ast_main.c | 19 +++++++++++++------
>   drivers/gpu/drm/ast/ast_post.c | 13 ++++++++++---
>   4 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index ff3bcdd1cff2a..cddd69972e89d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -393,11 +393,15 @@ static int ast_drm_freeze(struct drm_device *dev)
>   static int ast_drm_thaw(struct drm_device *dev)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> +	int ret;
>   
>   	ast_enable_vga(ast->ioregs);
>   	ast_open_key(ast->ioregs);
>   	ast_enable_mmio(dev->dev, ast->ioregs);
> -	ast_post_gpu(ast);
> +
> +	ret = ast_post_gpu(ast);
> +	if (ret)
> +		return ret;
>   
>   	return drm_mode_config_helper_resume(dev);
>   }
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 6b4305ac07d4f..cf9edef8fca66 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -445,7 +445,7 @@ int ast_mode_config_init(struct ast_device *ast);
>   int ast_mm_init(struct ast_device *ast);
>   
>   /* ast post */
> -void ast_post_gpu(struct ast_device *ast);
> +int ast_post_gpu(struct ast_device *ast);
>   u32 ast_mindwm(struct ast_device *ast, u32 r);
>   void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
>   void ast_patch_ahb_2500(void __iomem *regs);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 456230bef2736..474eb255b325b 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -138,10 +138,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK) ==
>   		    AST_IO_VGACRD1_TX_ASTDP) {
> -			int ret = ast_dp_launch(ast);
> -
> -			if (!ret)
> -				ast->tx_chip = AST_TX_ASTDP;
> +			ast->tx_chip = AST_TX_ASTDP;
>   		}
>   	}
>   
> @@ -297,8 +294,18 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   		 ast->mclk, ast->dram_type, ast->dram_bus_width);
>   
>   	ast_detect_tx_chip(ast, need_post);
> -	if (need_post)
> -		ast_post_gpu(ast);
> +	switch (ast->tx_chip) {
> +	case AST_TX_ASTDP:
> +		ret = ast_post_gpu(ast);
> +		break;
> +	default:
> +		ret = 0;
> +		if (need_post)
> +			ret = ast_post_gpu(ast);
> +		break;
> +	}
> +	if (ret)
> +		return ERR_PTR(ret);
>   
>   	ret = ast_mm_init(ast);
>   	if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 49f661760f9e5..0daa8e52a092a 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -340,13 +340,18 @@ static void ast_init_dram_reg(struct ast_device *ast)
>   	} while ((j & 0x40) == 0);
>   }
>   
> -void ast_post_gpu(struct ast_device *ast)
> +int ast_post_gpu(struct ast_device *ast)
>   {
> +	int ret;
> +
>   	ast_set_def_ext_reg(ast);
>   
>   	if (AST_GEN(ast) >= 7) {
> -		if (ast->tx_chip == AST_TX_ASTDP)
> -			ast_dp_launch(ast);
> +		if (ast->tx_chip == AST_TX_ASTDP) {
> +			ret = ast_dp_launch(ast);
> +			if (ret)
> +				return ret;
> +		}
>   	} else if (AST_GEN(ast) >= 6) {
>   		if (ast->config_mode == ast_use_p2a) {
>   			ast_post_chip_2500(ast);
> @@ -376,6 +381,8 @@ void ast_post_gpu(struct ast_device *ast)
>   			}
>   		}
>   	}
> +
> +	return 0;
>   }
>   
>   /* AST 2300 DRAM settings */

