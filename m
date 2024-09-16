Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA4697A2CD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88E910E0B7;
	Mon, 16 Sep 2024 13:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JLIec4sX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896CA10E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726492726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXB+fBHoj7ANRsYLBtYiYBwGS5y1APp1NRPiNn2YDUg=;
 b=JLIec4sXXLNgzucb2znR+w52pkWgnLotFbzNnjqTPf7w4BL/SsE7FNYL8eGA7uMSidk2Yi
 wNr+r9kqIcb4BXJ/2gKCnPg4p07mmx72hWPzvn61bW6kugwHcnL0uXs3/ks7MoZI6ANFre
 VzzabJXx7Tc0SBgyYWYLVRYJbcN/87Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-7gvnPtdtO5minHoVVEGhHw-1; Mon, 16 Sep 2024 09:18:45 -0400
X-MC-Unique: 7gvnPtdtO5minHoVVEGhHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb0ed9072so31082865e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 06:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726492724; x=1727097524;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXB+fBHoj7ANRsYLBtYiYBwGS5y1APp1NRPiNn2YDUg=;
 b=aDcjh5keivlUX9m19u2zYl1v7JlTu7yMDcLm/ZeXeuJBsaSzDANstK9EIRspx3sqId
 KlfamNivGShq/ICnj+Xg0srRHa1YXPmoTscU0BTEq0g4CYqN+77l4YnBGZGoFhQcJxmm
 RKarc6IaOYhk3WPENSPh/BOML5V3axGxA88rogguPVHa1hmuB+R0+N9WO/TIIAaO9YaQ
 mDjRAB9DlTCYX1DyuF9+iZ8rQzmDwPE9mrXgOgK4ex3Zj4g3KxCIWmD94BWpwvIL8/3Y
 GXIaNaR3DKcYPXZBrAWbetkawrBWqhIOJrEDuDowoxkABymgoYOiTo35yKlF8kh7JQ+U
 fT7g==
X-Gm-Message-State: AOJu0Yzz3ZawNjz+3AHwZYX6mxL2h/nKz4Y9ct4R+vOiDcwbgZNsPoi9
 XYXInUzSZNHwdWVwyoLbbIV2g1IVz6Qsij/63AoWzSeGazrSiflcIZjpucSIRde0dPMBIyGNVI1
 YH90yp+aL2NxCpadDpZGNaMO4NCxwdOceXkWoSICNbHFb+J/h1MZa8oW0V86sAm4k8g==
X-Received: by 2002:a05:600c:1c1b:b0:426:6e9a:7a1e with SMTP id
 5b1f17b1804b1-42d964e1069mr98288435e9.35.1726492724273; 
 Mon, 16 Sep 2024 06:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHYNyIFs9vMpEn5I0olJ1/+yjhqBQBJongkWPD9EPSo/b0mf3leHcfAQ+34Pxr0FUqQAxWg==
X-Received: by 2002:a05:600c:1c1b:b0:426:6e9a:7a1e with SMTP id
 5b1f17b1804b1-42d964e1069mr98288175e9.35.1726492723742; 
 Mon, 16 Sep 2024 06:18:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78054b6sm7178061f8f.107.2024.09.16.06.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 06:18:43 -0700 (PDT)
Message-ID: <beb92328-a2a4-4505-bd92-6df5cc96a7b6@redhat.com>
Date: Mon, 16 Sep 2024 15:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/ast: Rename register constants for TX-chip types
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240916082920.56234-1-tzimmermann@suse.de>
 <20240916082920.56234-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240916082920.56234-2-tzimmermann@suse.de>
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

On 16/09/2024 10:25, Thomas Zimmermann wrote:
> The type of the TX chip is provided in VGACRD1. Rename the constants
> accordingly.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c |  4 ++--
>   drivers/gpu/drm/ast/ast_reg.h  | 26 ++++++++++++--------------
>   2 files changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 3d92d9e5208f..d0e4f0dc9234 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -120,8 +120,8 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			ast->tx_chip = AST_TX_DP501;
>   		}
>   	} else if (IS_AST_GEN7(ast)) {
> -		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
> -		    ASTDP_DPMCU_TX) {
> +		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK) ==
> +		    AST_IO_VGACRD1_TX_ASTDP) {
>   			int ret = ast_dp_launch(ast);
>   
>   			if (!ret)
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 6a1f756650ab..daa5d3a9e6a1 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -37,7 +37,18 @@
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
> -#define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
> +#define AST_IO_VGACRD1_MCU_FW_EXECUTING		BIT(5)
> +/* Display Transmitter Type */
> +#define AST_IO_VGACRD1_TX_TYPE_MASK		GENMASK(3, 1)
> +#define AST_IO_VGACRD1_NO_TX			0x00
> +#define AST_IO_VGACRD1_TX_ITE66121_VBIOS	0x02
> +#define AST_IO_VGACRD1_TX_SIL164_VBIOS		0x04
> +#define AST_IO_VGACRD1_TX_CH7003_VBIOS		0x06
> +#define AST_IO_VGACRD1_TX_DP501_VBIOS		0x08
> +#define AST_IO_VGACRD1_TX_ANX9807_VBIOS		0x0a
> +#define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c
> +#define AST_IO_VGACRD1_TX_ASTDP			0x0e
> +
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
>   #define AST_IO_VGACRDF_HPD		BIT(0)
> @@ -49,19 +60,6 @@
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
>   
> -/*
> - * Display Transmitter Type
> - */
> -
> -#define TX_TYPE_MASK			GENMASK(3, 1)
> -#define NO_TX				(0 << 1)
> -#define ITE66121_VBIOS_TX		(1 << 1)
> -#define SI164_VBIOS_TX			(2 << 1)
> -#define CH7003_VBIOS_TX			(3 << 1)
> -#define DP501_VBIOS_TX			(4 << 1)
> -#define ANX9807_VBIOS_TX		(5 << 1)
> -#define TX_FW_EMBEDDED_FW_TX		(6 << 1)
> -#define ASTDP_DPMCU_TX			(7 << 1)
>   
>   #define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
>   //#define AST_VRAM_INIT_BY_BMC		BIT(7)

