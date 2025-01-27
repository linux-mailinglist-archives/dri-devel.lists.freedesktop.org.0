Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4687A1D847
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE0410E546;
	Mon, 27 Jan 2025 14:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WH/pOGMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A57210E542
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737987995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX6GcjHaaWjYu4dcH3Gn3G50yBe/UpB1qoj8K1+bDgQ=;
 b=WH/pOGMPXJOHlrWkFZ2vkWM7Z+od8iZFlYTRNFc4HXGvkLxmNQWC4aWW14QpjBsygx1Zf4
 Mm2Tb26U5RavnCsb05w4W2G1YY971YH54CkRr3zyi2+06NOutGPovCZyxQb6Utfp1GdIqN
 OeXsN2t64MzJOdJKtUZAdwIRRkRfkng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-vPPXcViVPIWzptV43NjazQ-1; Mon, 27 Jan 2025 09:26:34 -0500
X-MC-Unique: vPPXcViVPIWzptV43NjazQ-1
X-Mimecast-MFC-AGG-ID: vPPXcViVPIWzptV43NjazQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43621907030so33966055e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737987992; x=1738592792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GX6GcjHaaWjYu4dcH3Gn3G50yBe/UpB1qoj8K1+bDgQ=;
 b=vCIuC/snqFWmi7lwzenGpadzBceLxIxmfwA0Tb4bZHbFt6xr0TA9l7q0SZYR14aOn7
 UEA1/dR0d8RERq/60uRRLsj09ud1nYcEYsPQGZyMVaJooek5oXgXvb56RH/bK2yGWxxa
 9csW0q1CPdMhm22UIBf4owXK3o+dy2Gz6VDhQGG1d0CeoMZe59cFKI7gS1MulUwogKRh
 SNiicmdLg5SeOYbaOPWgURFCkqw4f6+/LhBwwnPNobl/q9WpKhrRxLjLHwODrhDtfD+R
 OdTt91FGk4gLi4UQ4AKznXXv7Bk4phFcqNTA/eYqVe4i89073pMltw/OgVef2XudlgHZ
 9WiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUaKELOAMRT8ehuEfhHrfzH4e5tlQ+nAIQZGhFRpL/m73A1vkK0Z4wWeuSRT7+INov/0bCxiPiVcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKyevn8hnULFnAEXbYunLuqBxY6qCCLWlWMXpBRReUdL8edvOb
 apbT+KBZyT6xoWxS96bFjut3uBj7WzYKmNVVUmUQuH50XYf3wmDeRrWAIZz8OBmQUvliTudGAgD
 5Fr2hN2o1hS5dpuBdrtHGE4EMHL35dO54PD2qiRQbGT7Id5TRqWEVoNlVq5UWdf12pg==
X-Gm-Gg: ASbGncsIbvlHshEw27RMwX5qYZGQ/AwJn6VWTjUWT2ktPVMbmGKavS1OZ+eLdGuP5jJ
 3nKHe//GaNmOY/xbLqX8N51qTYJkUJvIz6pMDfkgaEWJq7L1xNyvBhAXv+Rl+zMk4wiwBWAZAfU
 yfyQhz4VMNn16Jq8U46/h7yhphKTboOek80EVZcc7zs5k148vSbRirHGFysjZo4e0DaUkVt8Jhe
 smoHYamkwdi9Ed3fZPqQMHX2Rj9ZlnJpc2NkmQQ12K/wWfqC9v7jrmDd8lqXYaY69Rm7j/szgBM
 6Y75gRNavzDUvukiudHBham3vag0kPFnHwHDlP8mIy8Q
X-Received: by 2002:a05:600c:348c:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-438912d7c1bmr412764055e9.0.1737987992491; 
 Mon, 27 Jan 2025 06:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWm67YCiRc8mZA3PRzd4vrfLw1RSrJxxJhvoAlAv6X+0NOqtjzPIz1k9vibz4v1+he46mVYg==
X-Received: by 2002:a05:600c:348c:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-438912d7c1bmr412763825e9.0.1737987992140; 
 Mon, 27 Jan 2025 06:26:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa3e3sm135575555e9.3.2025.01.27.06.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:26:31 -0800 (PST)
Message-ID: <3c0e9066-b76e-4251-9ef3-3f88ff758027@redhat.com>
Date: Mon, 27 Jan 2025 15:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] drm/ast: Reorganize widescreen test around hardware
 Gens
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VtIN4qR8hc-RvP5HE1nKp0C55CW75_wFBLPWOUPHxBQ_1737987993
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
> Testing for support of widescreen modes mixes up various hardware
> Gens. First branch by hardware Gen, then do specific tests for each
> Gen. By default, widesscreen support is disabled.
> 
> Later patches will add more specific tests for each Gen.

I think it introduces a bit too much repeated code.

Maybe adding a small helper like this would help?

static bool ast_vgacrd0_support_wuxga(struct ast_device *ast) {
	u8 vgacrd0;
	vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
	return !(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC) ||
		(vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN));
}

-- 

Jocelyn

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 47 +++++++++++++++++++++-------------
>   1 file changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 2a813f0128eb8..4f402e0b9b5c1 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -40,29 +40,40 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   {
>   	u8 vgacrd0;
>   
> -	/* Check if we support wide screen */
> -	switch (AST_GEN(ast)) {
> -	case 1:
> -		ast->support_wide_screen = false;
> -		break;
> -	default:
> +	ast->support_wide_screen = false;
> +
> +	if (AST_GEN(ast) >= 7) {
> +		ast->support_wide_screen = true;
> +	} else if (AST_GEN(ast) >= 6) {
> +		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +			ast->support_wide_screen = true;
> +		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +			ast->support_wide_screen = true;
> +		else if (ast->chip == AST2510)
> +			ast->support_wide_screen = true;
> +	} else if (AST_GEN(ast) >= 5) {
> +		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +			ast->support_wide_screen = true;
> +		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +			ast->support_wide_screen = true;
> +		else if (ast->chip == AST1400)
> +			ast->support_wide_screen = true;
> +	} else if (AST_GEN(ast) >= 4) {
> +		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> +			ast->support_wide_screen = true;
> +		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> +			ast->support_wide_screen = true;
> +		else if (ast->chip == AST1300)
> +			ast->support_wide_screen = true;
> +	} else if (AST_GEN(ast) >= 2) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
>   			ast->support_wide_screen = true;
>   		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
>   			ast->support_wide_screen = true;
> -		else {
> -			ast->support_wide_screen = false;
> -			if (ast->chip == AST1300)
> -				ast->support_wide_screen = true;
> -			if (ast->chip == AST1400)
> -				ast->support_wide_screen = true;
> -			if (ast->chip == AST2510)
> -				ast->support_wide_screen = true;
> -			if (IS_AST_GEN7(ast))
> -				ast->support_wide_screen = true;
> -		}
> -		break;
>   	}
>   }
>   

