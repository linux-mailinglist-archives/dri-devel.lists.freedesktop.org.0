Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A3976B20
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB6C10EB9C;
	Thu, 12 Sep 2024 13:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C8y823xM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ACF10EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INZMsw1dUjsBe72YMNDLdMpKQG9flIqxd6g6eIL2VdU=;
 b=C8y823xMg7ks6PAqBohUWOtaByOZB9ywFDPbkrT3dAGHThEMxdyAJNA3YmyOnaB02Z8ouP
 Cg2JSfEViVzCnNVplCgQxUXhC0teOsB63scnbZWQtHWmiJ41CJym/ToeUNZI99eNQX+xq9
 ax7XHFfuqyBXYvyBDPe0jRVF0OH6B5Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-VKU5aiDXNGG3lqy0aL-Oig-1; Thu, 12 Sep 2024 09:49:25 -0400
X-MC-Unique: VKU5aiDXNGG3lqy0aL-Oig-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374cbbaf315so543968f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148964; x=1726753764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INZMsw1dUjsBe72YMNDLdMpKQG9flIqxd6g6eIL2VdU=;
 b=CfRqWOT8uoB5H9+XHZ9VgC77JHhtskp3BP09qct4XK/H0DaFjMOO5kFaR2idkLT5rT
 yZONtYLP8ptQWvGmKF6Xz5U5HZIWNKkj9u0K984loaC5/2ZAZVrSq7IMvB0h53HwNvoh
 P6gpctwLTxnSywCqCFtPW0d0rOIDQJmQt+Bs1gC3mzoejBplgQ2qGDvSaBNGENYVOLqc
 c5HhWJH7yj+ILMvM/GhS2sIrSPB1bAmagWsy+Sl3yLhz1esv6iZ5NnETRECH0qr8x1/k
 oWhw3+skmlVQwrEWZrABUu/0USLXZwtH3i+Pu7CSAkYjACRAjfBX1+cGEZd+pVShuQgO
 H79w==
X-Gm-Message-State: AOJu0YwGUmGiHHRgl965aL7kbVv6PmziijXAlcUMlAVGR++kIikOz1Ah
 P666yb5mwQEvE3TMHAja/JJgy4QRRycLktOvoI5M8eRa1cWJfOk/heB4+w/f9tlaUgW+z6wgnm+
 CRdJXdF/49Qu3go5X0WN/qUqzRtiKr7U1d72O3bJ9EITrdgLyd+MqYCFQnFqi2wGrTA==
X-Received: by 2002:a5d:46cc:0:b0:374:c2bb:8387 with SMTP id
 ffacd0b85a97d-378c280490fmr1488874f8f.30.1726148963697; 
 Thu, 12 Sep 2024 06:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdoDYSh4GIV2Yd1emM9X+nYzb5MqJBqj1RvNjNUfHt8lAmlzLD6OEvuK8WgDlHZjYbvWlHTQ==
X-Received: by 2002:a5d:46cc:0:b0:374:c2bb:8387 with SMTP id
 ffacd0b85a97d-378c280490fmr1488847f8f.30.1726148962989; 
 Thu, 12 Sep 2024 06:49:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564af1asm14447176f8f.18.2024.09.12.06.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:49:22 -0700 (PDT)
Message-ID: <9f703b53-79f3-4f58-a2bc-ba947a3dd0df@redhat.com>
Date: Thu, 12 Sep 2024 15:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/ast: Avoid upcasting to struct ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-11-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-11-tzimmermann@suse.de>
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
> Several functions receive an instance of struct drm_device only to
> upcast it to struct ast_device. Improve type safety by passing the
> AST device directly.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  2 +-
>   drivers/gpu/drm/ast/ast_drv.h  |  2 +-
>   drivers/gpu/drm/ast/ast_main.c |  8 ++++----
>   drivers/gpu/drm/ast/ast_mode.c |  6 +++---
>   drivers/gpu/drm/ast/ast_post.c | 30 ++++++++++++------------------
>   5 files changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 225817087b4d..63b7ef02513d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -396,7 +396,7 @@ static int ast_drm_thaw(struct drm_device *dev)
>   	ast_enable_vga(ast->ioregs);
>   	ast_open_key(ast->ioregs);
>   	ast_enable_mmio(dev->dev, ast->ioregs);
> -	ast_post_gpu(dev);
> +	ast_post_gpu(ast);
>   
>   	return drm_mode_config_helper_resume(dev);
>   }
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index e29db59bb7d8..21ce3769bf0d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -446,7 +446,7 @@ int ast_mode_config_init(struct ast_device *ast);
>   int ast_mm_init(struct ast_device *ast);
>   
>   /* ast post */
> -void ast_post_gpu(struct drm_device *dev);
> +void ast_post_gpu(struct ast_device *ast);
>   u32 ast_mindwm(struct ast_device *ast, u32 r);
>   void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
>   void ast_patch_ahb_2500(void __iomem *regs);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 3aeb0f4b19d5..3d92d9e5208f 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -132,10 +132,10 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
>   }
>   
> -static int ast_get_dram_info(struct drm_device *dev)
> +static int ast_get_dram_info(struct ast_device *ast)
>   {
> +	struct drm_device *dev = &ast->base;
>   	struct device_node *np = dev->dev->of_node;
> -	struct ast_device *ast = to_ast_device(dev);
>   	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
>   	uint32_t denum, num, div, ref_pll, dsel;
>   
> @@ -277,7 +277,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   	ast_detect_widescreen(ast);
>   	ast_detect_tx_chip(ast, need_post);
>   
> -	ret = ast_get_dram_info(dev);
> +	ret = ast_get_dram_info(ast);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> @@ -285,7 +285,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   		 ast->mclk, ast->dram_type, ast->dram_bus_width);
>   
>   	if (need_post)
> -		ast_post_gpu(dev);
> +		ast_post_gpu(ast);
>   
>   	ret = ast_mm_init(ast);
>   	if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index f90fade5d681..9d5321c81e68 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1287,9 +1287,9 @@ static const struct drm_crtc_funcs ast_crtc_funcs = {
>   	.atomic_destroy_state = ast_crtc_atomic_destroy_state,
>   };
>   
> -static int ast_crtc_init(struct drm_device *dev)
> +static int ast_crtc_init(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
>   	int ret;
>   
> @@ -1396,7 +1396,7 @@ int ast_mode_config_init(struct ast_device *ast)
>   	if (ret)
>   		return ret;
>   
> -	ret = ast_crtc_init(dev);
> +	ret = ast_crtc_init(ast);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 324778c72d23..364030f97571 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -34,16 +34,14 @@
>   #include "ast_dram_tables.h"
>   #include "ast_drv.h"
>   
> -static void ast_post_chip_2300(struct drm_device *dev);
> -static void ast_post_chip_2500(struct drm_device *dev);
> +static void ast_post_chip_2300(struct ast_device *ast);
> +static void ast_post_chip_2500(struct ast_device *ast);
>   
>   static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
>   static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
>   
> -static void
> -ast_set_def_ext_reg(struct drm_device *dev)
> +static void ast_set_def_ext_reg(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u8 i, index, reg;
>   	const u8 *ext_reg_info;
>   
> @@ -252,9 +250,8 @@ static void cbrdlli_ast2150(struct ast_device *ast, int busw)
>   
>   
>   
> -static void ast_init_dram_reg(struct drm_device *dev)
> +static void ast_init_dram_reg(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u8 j;
>   	u32 data, temp, i;
>   	const struct ast_dramstruct *dram_reg_info;
> @@ -343,22 +340,20 @@ static void ast_init_dram_reg(struct drm_device *dev)
>   	} while ((j & 0x40) == 0);
>   }
>   
> -void ast_post_gpu(struct drm_device *dev)
> +void ast_post_gpu(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> -
> -	ast_set_def_ext_reg(dev);
> +	ast_set_def_ext_reg(ast);
>   
>   	if (IS_AST_GEN7(ast)) {
>   		if (ast->tx_chip == AST_TX_ASTDP)
>   			ast_dp_launch(ast);
>   	} else if (ast->config_mode == ast_use_p2a) {
>   		if (IS_AST_GEN6(ast))
> -			ast_post_chip_2500(dev);
> +			ast_post_chip_2500(ast);
>   		else if (IS_AST_GEN5(ast) || IS_AST_GEN4(ast))
> -			ast_post_chip_2300(dev);
> +			ast_post_chip_2300(ast);
>   		else
> -			ast_init_dram_reg(dev);
> +			ast_init_dram_reg(ast);
>   
>   		ast_init_3rdtx(ast);
>   	} else {
> @@ -1569,9 +1564,8 @@ static void ddr2_init(struct ast_device *ast, struct ast2300_dram_param *param)
>   
>   }
>   
> -static void ast_post_chip_2300(struct drm_device *dev)
> +static void ast_post_chip_2300(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	struct ast2300_dram_param param;
>   	u32 temp;
>   	u8 reg;
> @@ -2038,9 +2032,9 @@ void ast_patch_ahb_2500(void __iomem *regs)
>   	__ast_moutdwm(regs, 0x1e6e207c, 0x08000000); /* clear fast reset */
>   }
>   
> -void ast_post_chip_2500(struct drm_device *dev)
> +void ast_post_chip_2500(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
>   	u32 temp;
>   	u8 reg;
>   

