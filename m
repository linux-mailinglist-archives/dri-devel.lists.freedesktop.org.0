Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51464940A17
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE52710E4D0;
	Tue, 30 Jul 2024 07:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J4kLF2Re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47DE10E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722325253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ima1RVj0KZ95R3gAd79zvOsfFYuRc1Di9bbZ4LcveMQ=;
 b=J4kLF2Rel4GX7/ie11W1H+t6EjGB64OfV5u9mDHm7wbmukzRdyDvxH/8O4FA4+L+soKWv9
 4mPnfyw6j/2f4djHbKD4RhRNfO7AKuR3yZ8En01ULVQKZPPhCzevGUYb5AFHVl88s/jZjt
 2rqTtqyHyZcZua0airWPiDpcx6tb/Iw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-honNohoVOmGa2zO87SWi2w-1; Tue, 30 Jul 2024 03:40:51 -0400
X-MC-Unique: honNohoVOmGa2zO87SWi2w-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ef23d3650fso37468881fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722325250; x=1722930050;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ima1RVj0KZ95R3gAd79zvOsfFYuRc1Di9bbZ4LcveMQ=;
 b=aFfPJtohzFfHetnX2XhY0cHXuApJXZ5ARnTrhxuLr6GubsV4929EgvApJkmnxZqfcC
 T+A9h36S4mt2awmmO67X+WqirymVwFG21JQUeUMRNJiUke13hhcVlOujHy3LBKZWRCiq
 vxPSMEVavFlQcGVazaSilETi3GGhOdOnP/vdj3jyX9V8MZaJVk2tHiOHoJh7IJiXmIr7
 c2Dft1qXkHvoMxCffqjAJ9mQvFTmIGwD4yBzR4aprps0iYC5fi5pNifKErhk8X5Cj2Uo
 RDUHWMi3uqvKQHDx4mOWnobs3ok42eAWBNvTq5dyIaKGfwHDmt1w0OrrpgfgoN8NqTt9
 NJgA==
X-Gm-Message-State: AOJu0Yym0z7x57FD0lqqbBpV2IjUs9QI4A5hxx+XIJ6w7KOBmj0JCpjx
 MDUnSeylRZH04byr4+U/22jRI9WsWcQWaWOrELBnpGNaTFlW90H50hR7osW5jVLIFXRfePQV35O
 zqw6HxcF/cRP78wU42HNPorKJIHGtyGOI9+9OqzFf/B4LMy/evAL2PvbERwmvuCxCeQ==
X-Received: by 2002:a05:651c:2207:b0:2ef:3347:ee93 with SMTP id
 38308e7fff4ca-2f12ee6a482mr70890881fa.44.1722325249888; 
 Tue, 30 Jul 2024 00:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/hRlscvEzZ7cggBIoDMEByLHdNJaUaxANKP2G20TKRhdZKwsDuAAssFTzbUNvOC3OLR3a9A==
X-Received: by 2002:a05:651c:2207:b0:2ef:3347:ee93 with SMTP id
 38308e7fff4ca-2f12ee6a482mr70890461fa.44.1722325249113; 
 Tue, 30 Jul 2024 00:40:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367d9576sm14134452f8f.31.2024.07.30.00.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:40:48 -0700 (PDT)
Message-ID: <268e1ca5-c88e-4278-85b0-c2a6faab9ddb@redhat.com>
Date: Tue, 30 Jul 2024 09:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/ast: astdp: Test firmware status once during
 probing
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240717143319.104012-1-tzimmermann@suse.de>
 <20240717143319.104012-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240717143319.104012-3-tzimmermann@suse.de>
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



On 17/07/2024 16:24, Thomas Zimmermann wrote:
> Test for running ASTDP firmware during probe. Do not bother testing
> this later. We cannot do much anyway if the firmware fails. Do not
> initialize the ASTDP conenctor if the test fails during device probing.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c   | 41 +++++++++++++---------------------
>   drivers/gpu/drm/ast/ast_drv.h  |  2 +-
>   drivers/gpu/drm/ast/ast_main.c |  6 +++--
>   drivers/gpu/drm/ast/ast_post.c |  2 +-
>   drivers/gpu/drm/ast/ast_reg.h  |  4 ++--
>   5 files changed, 23 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index e6c7f0d64e99..59885d10d308 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -9,8 +9,6 @@
>   
>   bool ast_astdp_is_connected(struct ast_device *ast)
>   {
> -	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING))
> -		return false;
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))
>   		return false;
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
> @@ -24,13 +22,11 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	u8 i = 0, j = 0;
>   
>   	/*
> -	 * CRD1[b5]: DP MCU FW is executing
>   	 * CRDC[b0]: DP link success
>   	 * CRDF[b0]: DP HPD
>   	 * CRE5[b0]: Host reading EDID process is done
>   	 */
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING) &&
> -		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
> +	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
>   		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD) &&
>   		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
>   								ASTDP_HOST_EDID_READ_DONE_MASK))) {
> @@ -64,9 +60,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			 */
>   			mdelay(j+1);
>   
> -			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1,
> -							ASTDP_MCU_FW_EXECUTING) &&
> -				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
> +			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
>   							ASTDP_LINK_SUCCESS) &&
>   				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))) {
>   				goto err_astdp_jump_out_loop_of_edid;
> @@ -115,8 +109,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	return (~(j+256) + 1);
>   
>   err_astdp_edid_not_ready:
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING)))
> -		return (~0xD1 + 1);
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
>   		return (~0xDC + 1);
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)))
> @@ -130,32 +122,29 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   /*
>    * Launch Aspeed DP
>    */
> -void ast_dp_launch(struct drm_device *dev)
> +int ast_dp_launch(struct ast_device *ast)
>   {
> -	u32 i = 0;
> -	u8 bDPExecute = 1;
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
> +	unsigned int i = 10;
>   
> -	// Wait one second then timeout.
> -	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING) !=
> -		ASTDP_MCU_FW_EXECUTING) {
> -		i++;
> -		// wait 100 ms
> -		msleep(100);
> +	while (i) {
> +		u8 vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
>   
> -		if (i >= 10) {
> -			// DP would not be ready.
> -			bDPExecute = 0;
> +		if (vgacrd1 & AST_IO_VGACRD1_MCU_FW_EXECUTING)
>   			break;
> -		}
> +		--i;
> +		msleep(100);
>   	}
> -
> -	if (!bDPExecute)
> +	if (!i) {
>   		drm_err(dev, "Wait DPMCU executing timeout\n");
> +		return -ENODEV;
> +	}
>   
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
>   			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
>   			       ASTDP_HOST_EDID_READ_DONE);
> +
> +	return 0;
>   }
>   
>   bool ast_dp_power_is_on(struct ast_device *ast)
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 47bab5596c16..02476eb78119 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -471,7 +471,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>   /* aspeed DP */
>   bool ast_astdp_is_connected(struct ast_device *ast);
>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
> -void ast_dp_launch(struct drm_device *dev);
> +int ast_dp_launch(struct ast_device *ast);
>   bool ast_dp_power_is_on(struct ast_device *ast);
>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>   void ast_dp_set_on_off(struct drm_device *dev, bool no);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 0637abb70361..d836f2a4f9f3 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -115,8 +115,10 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
>   		    ASTDP_DPMCU_TX) {
> -			ast->tx_chip_types = AST_TX_ASTDP_BIT;
> -			ast_dp_launch(&ast->base);
> +			int ret = ast_dp_launch(ast);
> +
> +			if (!ret)
> +				ast->tx_chip_types = AST_TX_ASTDP_BIT;
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 22f548805dfb..65755798ab94 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -351,7 +351,7 @@ void ast_post_gpu(struct drm_device *dev)
>   
>   	if (IS_AST_GEN7(ast)) {
>   		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
> -			ast_dp_launch(dev);
> +			ast_dp_launch(ast);
>   	} else if (ast->config_mode == ast_use_p2a) {
>   		if (IS_AST_GEN6(ast))
>   			ast_post_chip_2500(dev);
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 75671d345057..569de3188191 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -37,6 +37,8 @@
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
> +#define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
> +
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
>   
> @@ -67,12 +69,10 @@
>   #define AST_DP_VIDEO_ENABLE		BIT(0)
>   
>   /*
> - * CRD1[b5]: DP MCU FW is executing
>    * CRDC[b0]: DP link success
>    * CRDF[b0]: DP HPD
>    * CRE5[b0]: Host reading EDID process is done
>    */
> -#define ASTDP_MCU_FW_EXECUTING		BIT(5)
>   #define ASTDP_LINK_SUCCESS		BIT(0)
>   #define ASTDP_HPD			BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE	BIT(0)

