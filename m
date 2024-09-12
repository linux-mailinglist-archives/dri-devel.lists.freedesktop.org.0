Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E662F976B0F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94B10EB92;
	Thu, 12 Sep 2024 13:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SwxDtWoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A262210EB92
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78LxwfWGHXBSnluhDfLnN2ocHmUZwGROl48HNDSU/PQ=;
 b=SwxDtWozwM7t0Tki1SHDKEINjrF/aZ0mikrV2nsecd6SIs2e/We2VSOAKBLaMQKTL0Q37s
 +4tVfQvcN6Ih4ngztySDhL6LOeuDPCDwQGY9MWzVxBAQCFbgQdGjT+IL7TRzqdh6tpsewX
 7htlB9uRfuKNYtjJTvZitfgV5hUjw7w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-IkUs7qqOO0SK4Q-zyg97aw-1; Thu, 12 Sep 2024 09:48:20 -0400
X-MC-Unique: IkUs7qqOO0SK4Q-zyg97aw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso7522045e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148899; x=1726753699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78LxwfWGHXBSnluhDfLnN2ocHmUZwGROl48HNDSU/PQ=;
 b=l6DV9gW/pgeCGhrOy9IQZPVJ3aSrMuBHW2nhTZKfz9aOrr3XfHILArdmzpeTdsdvuX
 Tir7kRIejKvUFV8qeET8gaxkzn2N/+UqZdgpyYSuLXtkGrXAeLjH/MdcD3Gg1byutI2s
 bBf+wLQHCJpaIzwubdWy02M9asd2Hcmle8DMxjbj+Wcg4vRtpLN5V7ALmSv0TgQLh4vX
 7k8/69rS81U4RNCxaYVehVkte82G/Ds1ROyXha1ViAFNUmHAyiRNpFGDH/UaVpJxqGPg
 yNgyLWwJbPN7vcxaXp34fvnLZdoHKGNsi/xpu8E+4SunyZetQGMjhFagaRAVDbTNgzVW
 qp1A==
X-Gm-Message-State: AOJu0Yy+1HYz6W0n7y6s9fDMJhuBa7irmFNNbTWw7KYzQRG7dCim28Or
 UwXD7B6x/xshW+IxxEdfFSYvR15nziCNFN5EY0luFTdP/P42XOavWdrVxx5BClJablwaom3faRQ
 ae5CmqKrn6rx6uHgom9vmdK8hKh+Iqi/AHMU9kWJ+cSxgKrWQWtJBK969kxBRBKD9QA==
X-Received: by 2002:a05:600c:3581:b0:42c:b995:20b6 with SMTP id
 5b1f17b1804b1-42cdb5385b2mr24321725e9.2.1726148899056; 
 Thu, 12 Sep 2024 06:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX08c1r/KjQy/kuDsCzDhgkM4PkzEXDVsqIZ4RoIQiQe4suwA/Z/6hrImJ5/DnVIHbgNV/UQ==
X-Received: by 2002:a05:600c:3581:b0:42c:b995:20b6 with SMTP id
 5b1f17b1804b1-42cdb5385b2mr24321495e9.2.1726148898501; 
 Thu, 12 Sep 2024 06:48:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8afd4sm173411175e9.46.2024.09.12.06.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:48:17 -0700 (PDT)
Message-ID: <c673e697-c20c-492f-8a58-fac01a5ec896@redhat.com>
Date: Thu, 12 Sep 2024 15:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/ast: dp501: Avoid upcasting to struct ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-7-tzimmermann@suse.de>
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
> 
Thanks, it looks good to me. One small comment below

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 53 ++++++++++++++-------------------
>   drivers/gpu/drm/ast/ast_drv.h   |  4 +--
>   drivers/gpu/drm/ast/ast_main.c  |  2 +-
>   drivers/gpu/drm/ast/ast_post.c  |  2 +-
>   4 files changed, 27 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index abb03d14c338..e5553334bfde 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -21,9 +21,9 @@ static void ast_release_firmware(void *data)
>   	ast->dp501_fw = NULL;
>   }
>   
> -static int ast_load_dp501_microcode(struct drm_device *dev)
> +static int ast_load_dp501_microcode(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
>   	int ret;
>   
>   	ret = request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
> @@ -109,10 +109,10 @@ static bool wait_fw_ready(struct ast_device *ast)
>   }
>   #endif
>   
> -static bool ast_write_cmd(struct drm_device *dev, u8 data)
> +static bool ast_write_cmd(struct ast_device *ast, u8 data)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	int retry = 0;
> +
>   	if (wait_nack(ast)) {
>   		send_nack(ast);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x9a, 0x00, data);
> @@ -131,10 +131,8 @@ static bool ast_write_cmd(struct drm_device *dev, u8 data)
>   	return false;
>   }
>   
> -static bool ast_write_data(struct drm_device *dev, u8 data)
> +static bool ast_write_data(struct ast_device *ast, u8 data)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> -
>   	if (wait_nack(ast)) {
>   		send_nack(ast);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x9a, 0x00, data);
> @@ -175,10 +173,10 @@ static void clear_cmd(struct ast_device *ast)
>   }
>   #endif
>   
> -static void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)
> +static void ast_set_dp501_video_output(struct ast_device *ast, u8 mode)
>   {
> -	ast_write_cmd(dev, 0x40);
> -	ast_write_data(dev, mode);
> +	ast_write_cmd(ast, 0x40);
> +	ast_write_data(ast, mode);
>   
>   	msleep(10);
>   }
> @@ -188,9 +186,8 @@ static u32 get_fw_base(struct ast_device *ast)
>   	return ast_mindwm(ast, 0x1e6e2104) & 0x7fffffff;
>   }
>   
> -bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
> +bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u32 i, data;
>   	u32 boot_address;
>   
> @@ -207,9 +204,8 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
>   	return false;
>   }
>   
> -static bool ast_launch_m68k(struct drm_device *dev)
> +static bool ast_launch_m68k(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u32 i, data, len = 0;
>   	u32 boot_address;
>   	u8 *fw_addr = NULL;
> @@ -226,7 +222,7 @@ static bool ast_launch_m68k(struct drm_device *dev)
>   			len = 32*1024;
>   		} else {
>   			if (!ast->dp501_fw &&
> -			    ast_load_dp501_microcode(dev) < 0)
> +			    ast_load_dp501_microcode(ast) < 0)
>   				return false;
>   
>   			fw_addr = (u8 *)ast->dp501_fw->data;
> @@ -348,9 +344,8 @@ static int ast_dp512_read_edid_block(void *data, u8 *buf, unsigned int block, si
>   	return true;
>   }
>   
> -static bool ast_init_dvo(struct drm_device *dev)
> +static bool ast_init_dvo(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u8 jreg;
>   	u32 data;
>   	ast_write32(ast, 0xf004, 0x1e6e0000);
> @@ -421,9 +416,8 @@ static bool ast_init_dvo(struct drm_device *dev)
>   }
>   
>   
> -static void ast_init_analog(struct drm_device *dev)
> +static void ast_init_analog(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u32 data;
>   
>   	/*
> @@ -448,28 +442,27 @@ static void ast_init_analog(struct drm_device *dev)
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x00);
>   }
>   
> -void ast_init_3rdtx(struct drm_device *dev)
> +void ast_init_3rdtx(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u8 jreg;
>   
>   	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
>   		switch (jreg & 0x0e) {
>   		case 0x04:
> -			ast_init_dvo(dev);
> +			ast_init_dvo(ast);
>   			break;
>   		case 0x08:
> -			ast_launch_m68k(dev);
> +			ast_launch_m68k(ast);
>   			break;
>   		case 0x0c:
> -			ast_init_dvo(dev);
> +			ast_init_dvo(ast);
>   			break;
>   		default:
>   			if (ast->tx_chip == AST_TX_SIL164)
> -				ast_init_dvo(dev);
> +				ast_init_dvo(ast);
>   			else
> -				ast_init_analog(dev);
> +				ast_init_analog(ast);
>   		}
>   	}
>   }
> @@ -485,17 +478,17 @@ static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
>   static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>   						   struct drm_atomic_state *state)
>   {
> -	struct drm_device *dev = encoder->dev;
> +	struct ast_device *ast = to_ast_device(encoder->dev);
>   
> -	ast_set_dp501_video_output(dev, 1);
> +	ast_set_dp501_video_output(ast, 1);
>   }
>   
>   static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
>   						    struct drm_atomic_state *state)
>   {
> -	struct drm_device *dev = encoder->dev;
> +	struct ast_device *ast = to_ast_device(encoder->dev);
>   
> -	ast_set_dp501_video_output(dev, 0);
> +	ast_set_dp501_video_output(ast, 0);
>   }
>   
>   static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index cafc4234e839..e29db59bb7d8 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -455,8 +455,8 @@ int ast_vga_output_init(struct ast_device *ast);
>   int ast_sil164_output_init(struct ast_device *ast);
>   
>   /* ast dp501 */
> -bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> -void ast_init_3rdtx(struct drm_device *dev);
> +bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size);
> +void ast_init_3rdtx(struct ast_device *ast);
>   int ast_dp501_output_init(struct ast_device *ast);
>   
>   /* aspeed DP */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index d7d503e78e25..3aeb0f4b19d5 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -110,7 +110,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
>   			if (ast->dp501_fw_addr) {
>   				/* backup firmware */
> -				if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024)) {
> +				if (ast_backup_fw(ast, ast->dp501_fw_addr, 32*1024)) {

Maybe we can remove the fw_addr parameter of ast_backup_fw(), it's the 
only call to this function.

>   					drmm_kfree(dev, ast->dp501_fw_addr);
>   					ast->dp501_fw_addr = NULL;
>   				}
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 902bf8114b6e..324778c72d23 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -360,7 +360,7 @@ void ast_post_gpu(struct drm_device *dev)
>   		else
>   			ast_init_dram_reg(dev);
>   
> -		ast_init_3rdtx(dev);
> +		ast_init_3rdtx(ast);
>   	} else {
>   		if (ast->tx_chip == AST_TX_SIL164)
>   			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */

