Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F296D2F9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 11:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99FE10E7C2;
	Thu,  5 Sep 2024 09:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BtPqaXuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FF510E7C2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725527956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eugKNdOFNkO2OAnYT13ZBZDyFfQ8zZMQyH3iguVmMQQ=;
 b=BtPqaXuC3Gpgq+Gzvpsu2YIF/poeNTatJtnUZ/dEsDKs1drkWLK7A4jCnDA1cBvzLdmvz+
 2bGEeaB7rXdrmXN0B33QvHnlUzHhdP3D55pz4Mk2PYcMiulAwOdB7I0aadH6vYcNWTtxkz
 efyAq7jRloxFZ6fWPlWYD7+VJJZ6iaM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-FJDPhFgxPTCffOg0eRI-eA-1; Thu, 05 Sep 2024 05:19:15 -0400
X-MC-Unique: FJDPhFgxPTCffOg0eRI-eA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c35b8e38so284761f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 02:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725527954; x=1726132754;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eugKNdOFNkO2OAnYT13ZBZDyFfQ8zZMQyH3iguVmMQQ=;
 b=iaYw1SYVp33bBZQfjTivZDNY4fAGTvJ/3+m66C9I/Vki9kG+SR3Z6PkqUyUUTIotal
 zanue+SEcCxvG2jbcrkfp1YwTMV6R3nwxK4/Ghh5uoYSxVovpobDbF+R3eog3aBLYJBy
 ahfYYGJO89aqgxEAzbwrSEk8Tz3i/OB+mEOpClt5WEOaf/n9LV/D8w967dT/55Jx7OSj
 7YU6dXPl12m2VHtWcNgQX2bxtMZhaURTKJFwPvX4mhUEwiSeflG37rdrZnFalFQ55+aC
 /uC6Scmt8O4QNctQhA/8bR7K6cHX4zhnj36OoMqi5LIMvZ2l97cZ5bUn9SwxHIwPrn90
 yVuA==
X-Gm-Message-State: AOJu0YzxtaBEkbexaswp5c0F5GNJFqHlrUnhcevhcNwkggoWnB+f7EUV
 70p7Ct3urnCXB9iiIMGDJMU08CKstAZARrb7av+LfSHmrvfZhQjS57qmp8K/TPPr5lLlwNrxDTl
 UsEwQJdWNIck2BRgH2eTBp3DkrQV0zsbk2l+qDO2lKe0pwkgcx4U7cihx55PX+CAVzw==
X-Received: by 2002:a5d:6345:0:b0:371:c518:6f54 with SMTP id
 ffacd0b85a97d-374bf169505mr11280121f8f.29.1725527954200; 
 Thu, 05 Sep 2024 02:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5IEvQLFMF1LqwYRfhuC6tqLgnSEIWB4TbImKa8Q4qq8v9Y7r81oHLOlv5gOzhB2kUdhAKvQ==
X-Received: by 2002:a5d:6345:0:b0:371:c518:6f54 with SMTP id
 ffacd0b85a97d-374bf169505mr11280100f8f.29.1725527953567; 
 Thu, 05 Sep 2024 02:19:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c44aabd8sm12610415f8f.77.2024.09.05.02.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 02:19:12 -0700 (PDT)
Message-ID: <d2731fc1-0409-41b2-9d47-34a9db5ccc9d@redhat.com>
Date: Thu, 5 Sep 2024 11:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Remove TX-chip bitmask
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240903132601.91618-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240903132601.91618-1-tzimmermann@suse.de>
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

On 03/09/2024 15:25, Thomas Zimmermann wrote:
> The CRTC has only one output attached to it. Store the output's type
> of TX chip in a single field and remove the related bitmask.
> 
> Turn the type-less output field in struct ast_device into a union, as
> only one of its fields will be used at a time.

Thanks for this simplification.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c |  2 +-
>   drivers/gpu/drm/ast/ast_drv.h   | 10 +++-------
>   drivers/gpu/drm/ast/ast_main.c  | 27 +++++++++++++--------------
>   drivers/gpu/drm/ast/ast_mode.c  | 26 +++++++++++---------------
>   drivers/gpu/drm/ast/ast_post.c  |  4 ++--
>   5 files changed, 30 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index e4c636f45082..99bf44eec7b3 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -466,7 +466,7 @@ void ast_init_3rdtx(struct drm_device *dev)
>   			ast_init_dvo(dev);
>   			break;
>   		default:
> -			if (ast->tx_chip_types & BIT(AST_TX_SIL164))
> +			if (ast->tx_chip == AST_TX_SIL164)
>   				ast_init_dvo(dev);
>   			else
>   				ast_init_analog(dev);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 91fe07cf7b07..b6ca14a3b967 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -91,11 +91,6 @@ enum ast_tx_chip {
>   	AST_TX_ASTDP,
>   };
>   
> -#define AST_TX_NONE_BIT		BIT(AST_TX_NONE)
> -#define AST_TX_SIL164_BIT	BIT(AST_TX_SIL164)
> -#define AST_TX_DP501_BIT	BIT(AST_TX_DP501)
> -#define AST_TX_ASTDP_BIT	BIT(AST_TX_ASTDP)
> -
>   enum ast_config_mode {
>   	ast_use_p2a,
>   	ast_use_dt,
> @@ -187,10 +182,12 @@ struct ast_device {
>   
>   	struct mutex modeset_lock; /* Protects access to modeset I/O registers in ioregs */
>   
> +	enum ast_tx_chip tx_chip;
> +
>   	struct ast_plane primary_plane;
>   	struct ast_plane cursor_plane;
>   	struct drm_crtc crtc;
> -	struct {
> +	union {
>   		struct {
>   			struct drm_encoder encoder;
>   			struct ast_connector connector;
> @@ -211,7 +208,6 @@ struct ast_device {
>   
>   	bool support_wide_screen;
>   
> -	unsigned long tx_chip_types;		/* bitfield of enum ast_chip_type */
>   	u8 *dp501_fw_addr;
>   	const struct firmware *dp501_fw;	/* dp501 fw */
>   };
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index d836f2a4f9f3..d7d503e78e25 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -68,11 +68,18 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   
>   static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   {
> +	static const char * const info_str[] = {
> +		"analog VGA",
> +		"Sil164 TMDS transmitter",
> +		"DP501 DisplayPort transmitter",
> +		"ASPEED DisplayPort transmitter",
> +	};
> +
>   	struct drm_device *dev = &ast->base;
>   	u8 jreg;
>   
>   	/* Check 3rd Tx option (digital output afaik) */
> -	ast->tx_chip_types |= AST_TX_NONE_BIT;
> +	ast->tx_chip = AST_TX_NONE;
>   
>   	/*
>   	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
> @@ -85,7 +92,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	if (!need_post) {
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
>   		if (jreg & 0x80)
> -			ast->tx_chip_types = AST_TX_SIL164_BIT;
> +			ast->tx_chip = AST_TX_SIL164;
>   	}
>   
>   	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
> @@ -97,7 +104,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
>   		switch (jreg) {
>   		case 0x04:
> -			ast->tx_chip_types = AST_TX_SIL164_BIT;
> +			ast->tx_chip = AST_TX_SIL164;
>   			break;
>   		case 0x08:
>   			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
> @@ -110,7 +117,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			}
>   			fallthrough;
>   		case 0x0c:
> -			ast->tx_chip_types = AST_TX_DP501_BIT;
> +			ast->tx_chip = AST_TX_DP501;
>   		}
>   	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
> @@ -118,19 +125,11 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			int ret = ast_dp_launch(ast);
>   
>   			if (!ret)
> -				ast->tx_chip_types = AST_TX_ASTDP_BIT;
> +				ast->tx_chip = AST_TX_ASTDP;
>   		}
>   	}
>   
> -	/* Print stuff for diagnostic purposes */
> -	if (ast->tx_chip_types & AST_TX_NONE_BIT)
> -		drm_info(dev, "Using analog VGA\n");
> -	if (ast->tx_chip_types & AST_TX_SIL164_BIT)
> -		drm_info(dev, "Using Sil164 TMDS transmitter\n");
> -	if (ast->tx_chip_types & AST_TX_DP501_BIT)
> -		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
> -	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
> -		drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
> +	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
>   }
>   
>   static int ast_get_dram_info(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ed496fb32bf3..784e8ac0e668 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1398,26 +1398,22 @@ int ast_mode_config_init(struct ast_device *ast)
>   
>   	ast_crtc_init(dev);
>   
> -	if (ast->tx_chip_types & AST_TX_NONE_BIT) {
> +	switch (ast->tx_chip) {
> +	case AST_TX_NONE:
>   		ret = ast_vga_output_init(ast);
> -		if (ret)
> -			return ret;
> -	}
> -	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
> +		break;
> +	case AST_TX_SIL164:
>   		ret = ast_sil164_output_init(ast);
> -		if (ret)
> -			return ret;
> -	}
> -	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
> +		break;
> +	case AST_TX_DP501:
>   		ret = ast_dp501_output_init(ast);
> -		if (ret)
> -			return ret;
> -	}
> -	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
> +		break;
> +	case AST_TX_ASTDP:
>   		ret = ast_astdp_output_init(ast);
> -		if (ret)
> -			return ret;
> +		break;
>   	}
> +	if (ret)
> +		return ret;
>   
>   	drm_mode_config_reset(dev);
>   
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 65755798ab94..902bf8114b6e 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -350,7 +350,7 @@ void ast_post_gpu(struct drm_device *dev)
>   	ast_set_def_ext_reg(dev);
>   
>   	if (IS_AST_GEN7(ast)) {
> -		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
> +		if (ast->tx_chip == AST_TX_ASTDP)
>   			ast_dp_launch(ast);
>   	} else if (ast->config_mode == ast_use_p2a) {
>   		if (IS_AST_GEN6(ast))
> @@ -362,7 +362,7 @@ void ast_post_gpu(struct drm_device *dev)
>   
>   		ast_init_3rdtx(dev);
>   	} else {
> -		if (ast->tx_chip_types & AST_TX_SIL164_BIT)
> +		if (ast->tx_chip == AST_TX_SIL164)
>   			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */
>   	}
>   }

