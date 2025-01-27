Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A7A1D877
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE49210E552;
	Mon, 27 Jan 2025 14:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J/339IEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D610E552
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737988330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DK9KZdzgQZO7HzLQT4OkoDwoKH4z86rEvjnm5CZL5Y=;
 b=J/339IEQw7Qq7KMyHnIw0ySwWmQePu1FFeOKWiAbAr5FKxBQc9CLfmuqoPMSJjydzrOVpb
 pDzUTtykOAvtmQC8sRXdRx5/SCpGWKs2anEQiVb1JkwOfSTQKAJCDazL8PCl8nzpOHSYM0
 rPZ49iRjTJB0TEIg0YspN/Glo5Mh9NQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-KBhUtPhXM2WSQNZLignPug-1; Mon, 27 Jan 2025 09:32:08 -0500
X-MC-Unique: KBhUtPhXM2WSQNZLignPug-1
X-Mimecast-MFC-AGG-ID: KBhUtPhXM2WSQNZLignPug
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38a684a096eso1932628f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737988327; x=1738593127;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DK9KZdzgQZO7HzLQT4OkoDwoKH4z86rEvjnm5CZL5Y=;
 b=ghQmLOfgtPVVmBY/ez6DDfBT/CipmA0fwD87DNWjlNeGw1lWqcl/VO9ZOMKgi+Nokj
 Mh5xVbOOeIuEeFgYsgh4NfRvp5DTswTogsLCYfwCrUJLO1fUukOhMziXykwW8qk1gdJe
 gGtPLyVxtj1Mhqy0MW7VSfwFiI2hu4GuiVSJmsPZnKnVmKplGJxAPxJcgsDDLKNZK8yC
 ILtSPkiiVezZeTWkGIIjnqm7oYr+c8kRkb9o6OJa8HapSQuhIy6bww8A+KglJE5Dywdh
 BcBlmcPV4oPk8QOaOl/WUuwbBncCOgBIhbItk2nYM74rSFgAbQeTen8/PZrFO7u36tQR
 vOHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPBGVsRhOi8M75g1kVnLvYig2LGIPErWOPKfDR9E2FOwXrlRQ7HPOtQEKVAE8yJwuCwAP9zV7rFAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKaWvDgAcSv4sXCxMx9fYMjoDsPHsZf3QdbviijckimRbA6GzP
 xqgQisWKGaEoG0ux64ZaXHR3FKMoNhV+KSunnHTBWTxrNO99pDtCsgq8bskVOdGHJ2GvIFnMCOY
 qhfOGi/r3qyPeDqNqY8MISxoKoMT6llQ8/wuHK+WhRIIOEU/+U1k8yorU+r1k/ix9Tg==
X-Gm-Gg: ASbGnctMKklWBxpcOXVii73P2bQ6z4NbR0S4E1Gr06B1qeR0oFxr1sel20oBQOyrs9m
 IFlmI+8Yxx6H3cy2y7S4pJfe1coYBv6ZpR2Fq0gHoELcQMSTGwdbPss+wtnbZLDbMDeYw5KRDYz
 hkCiueU/RWk4Lp/xh7DCfvJTH8DhjlRLmiJ/tQnR2bEzDvWOIwZBU00b+BQMyIg/w/cIVmp+ekR
 FKtldNmQVzdbtVQZpI9PEs244uyAPg97XPmObfqLRDKH2HBjdZuTnnNVENbaXhVo/MU3Vt7rqMn
 D8/GU6tr1M0fI98+eXRudVVpTuqVPcG/SnK5Sw+cMKSy
X-Received: by 2002:adf:a28a:0:b0:385:dc45:ea06 with SMTP id
 ffacd0b85a97d-38bf5684d6bmr29960717f8f.13.1737988326642; 
 Mon, 27 Jan 2025 06:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVA28ULn0ogtNq3zdy/KIQZXG9thxCjZUnGloss2DShNzK2Z/csil+/wE9wwMhvLzsQ8B2EA==
X-Received: by 2002:adf:a28a:0:b0:385:dc45:ea06 with SMTP id
 ffacd0b85a97d-38bf5684d6bmr29960685f8f.13.1737988326264; 
 Mon, 27 Jan 2025 06:32:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188bf5sm11428756f8f.50.2025.01.27.06.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:32:05 -0800 (PST)
Message-ID: <acd3bd3e-00cb-4528-8a6c-f9e331e62b82@redhat.com>
Date: Mon, 27 Jan 2025 15:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] drm/ast: Add support_wuxga flag to struct ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SJhnii7gaQ05yCpn7XcHmoBv_X_1V0-oCP2I-LDRmNo_1737988327
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> Detect support for 1920x1200 (WUXGA) in ast_detect_widescreen(). The
> flag is cleared by default. The test logic has been taken from existing
> code in ast_crtc_helper_mode_valid(). The code in that function is being
> replaced by the new flag.

I think adding a small helper would help here too:


static bool ast_vgacrd1_support_wuxga(struct ast_device *ast) {
     u8 vgacrd1;
     vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
     return !(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA);
}

Best regards,

-- 

Jocelyn


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c | 31 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/ast/ast_mode.c |  8 +++-----
>   drivers/gpu/drm/ast/ast_reg.h  |  1 +
>   4 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 01ef0c0d5db7d..4e3a88f8a85ca 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -207,6 +207,7 @@ struct ast_device {
>   
>   	bool support_wsxga_p; /* 1680x1050 */
>   	bool support_fullhd; /* 1920x1080 */
> +	bool support_wuxga; /* 1920x1200 */
>   
>   	u8 *dp501_fw_addr;
>   	const struct firmware *dp501_fw;	/* dp501 fw */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index e6237ba92cce3..1de6f1129e165 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -38,14 +38,18 @@
>   
>   static void ast_detect_widescreen(struct ast_device *ast)
>   {
> -	u8 vgacrd0;
> +	u8 vgacrd0, vgacrd1;
>   
>   	ast->support_wsxga_p = false;
>   	ast->support_fullhd = false;
> +	ast->support_wuxga = false;
>   
>   	if (AST_GEN(ast) >= 7) {
>   		ast->support_wsxga_p = true;
>   		ast->support_fullhd = true;
> +		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +			ast->support_wuxga = true;
>   	} else if (AST_GEN(ast) >= 6) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -56,6 +60,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		if (ast->support_wsxga_p)
>   			ast->support_fullhd = true;
> +		if (ast->support_fullhd) {
> +			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +				ast->support_wuxga = true;
> +		}
>   	} else if (AST_GEN(ast) >= 5) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -66,6 +75,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		if (ast->support_wsxga_p)
>   			ast->support_fullhd = true;
> +		if (ast->support_fullhd) {
> +			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +				ast->support_wuxga = true;
> +		}
>   	} else if (AST_GEN(ast) >= 4) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -76,6 +90,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			ast->support_wsxga_p = true;
>   		if (ast->support_wsxga_p)
>   			ast->support_fullhd = true;
> +		if (ast->support_fullhd) {
> +			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +				ast->support_wuxga = true;
> +		}
>   	} else if (AST_GEN(ast) >= 3) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -86,6 +105,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			if (ast->chip == AST2200)
>   				ast->support_fullhd = true;
>   		}
> +		if (ast->support_fullhd) {
> +			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +				ast->support_wuxga = true;
> +		}
>   	} else if (AST_GEN(ast) >= 2) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> @@ -96,6 +120,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   			if (ast->chip == AST2100)
>   				ast->support_fullhd = true;
>   		}
> +		if (ast->support_fullhd) {
> +			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
> +			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
> +				ast->support_wuxga = true;
> +		}
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 594a58401cf66..fca625518a873 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1022,7 +1022,6 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
>   	enum drm_mode_status status;
> -	uint32_t jtemp;
>   
>   	if (ast->support_wsxga_p) {
>   		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
> @@ -1041,11 +1040,10 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   				return MODE_OK;
>   
>   			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
> -				jtemp = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
> -				if (jtemp & 0x01)
> -					return MODE_NOMODE;
> -				else
> +				if (ast->support_wuxga)
>   					return MODE_OK;
> +				else
> +					return MODE_NOMODE;
>   			}
>   		}
>   	}
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index b4ff38949a565..9db0d584652a4 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -55,6 +55,7 @@
>   #define AST_IO_VGACRD1_TX_ANX9807_VBIOS		0x0a
>   #define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c /* special case of DP501 */
>   #define AST_IO_VGACRD1_TX_ASTDP			0x0e
> +#define AST_IO_VGACRD1_SUPPORTS_WUXGA		BIT(0)
>   
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)

