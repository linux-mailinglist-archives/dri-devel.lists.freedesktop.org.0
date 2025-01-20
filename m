Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926BAA16ADC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098E510E399;
	Mon, 20 Jan 2025 10:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="It0f2FA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D6210E399
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RJlXFScCGhfbFHBcMqrNK/j2k5W//AZq1UFMVlICYs=;
 b=It0f2FA+nvyhll8ls44CkRCoVbOxSG7r7/3EcyaviH08ZN0Md8YMPoWompBoZKu81WvSB6
 mhwvMn69h+y4X7E3NwBTZaNPHoZtQeCVHmClWFkREvPuTCQUW5rmSYYGZIkwi5E0tLPoXT
 LAhauBDOp3BPEhsB3krosiSkXuQAQoc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-63MiWeBzOEiPxaIGKPDXVQ-1; Mon, 20 Jan 2025 05:35:37 -0500
X-MC-Unique: 63MiWeBzOEiPxaIGKPDXVQ-1
X-Mimecast-MFC-AGG-ID: 63MiWeBzOEiPxaIGKPDXVQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so33389235e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369336; x=1737974136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5RJlXFScCGhfbFHBcMqrNK/j2k5W//AZq1UFMVlICYs=;
 b=tWSL1pItHyguAEPQqJgbqPR1WgD6PDPra+TjCvaZLSGcMPQGs7McQI2Qy0Y8BPMgcB
 1+Fpu442zHg9SipxLYP1q89k2AmMjbcKAZK5iK8JAgwMOJcI9WiQf5rnjABqph07ylcY
 fOBpOshVis+WCeHgdsxslVjGANDCbxTqsGoZeX/eOpxm9SBUQU+7EeBiN6fNICObqzxT
 7oxJmkyAew+2JQI5Xm4+l0Whv3X+CDTv/wNv+9By041uNglGTITpWA8HEPMrS1zP2/mi
 Kp8ucdcwSYkVqlnAEB9aXWOBH7UgNFfbL68nTwiusvFmuSXVvMTBYonfTMWu9iQMdDpw
 /06A==
X-Gm-Message-State: AOJu0YxHyGGfG82kvMKcv/N6suWwkPwrAqw3wM8MXJbJmTk7m61RATFB
 hYCWULyyf1C9+xY0G4Hk5Ssl7Ns26ICX+aESXZLVZkO3xPkCj/fMMTSEBJwfHLQd2RaYGR80Ttx
 bBblHEU256C/C/w2DPe1CRhzbD3a7s2j3Hom2hGKtFPHG1Vuyj1Xfjiyzro0xAHa+lQ==
X-Gm-Gg: ASbGncsjLhhFCRZo2d0NR/+Ah51L366S0Bi8hyIVqb7ocvlySHu1gh7m+JL8QNr1QF/
 9xP3/okhlwleQA51i+KiqwTY13aaSHdL902YAB3YbUKXZVnaQ6MN17nWuTwVhcDU4soHKVoAx5X
 RhYYuObMibwAVqiXjymCdFOAuHTwasV8u3pDjTtkB2e/Kxk5PkSlG1pYuzHeSnh/GJ8RwX1VKJF
 4Bq0H4LtOcX/MkZuCedUCtuNi/5els+rjx0++B0VrwCQADUbHcSnrvaW8tZNPbHti56+UGXWgxB
 nWnloBDQapjbrwHAKFT6acEQh2L9ruLJaQ==
X-Received: by 2002:a05:600c:4510:b0:434:a30b:5455 with SMTP id
 5b1f17b1804b1-4389144f671mr108196735e9.27.1737369336313; 
 Mon, 20 Jan 2025 02:35:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/s7ke/yC5n44ksW+s6yDX6J+2PIt4ztlXdkhEEH5TXLLi3O2zejdD+Zqawdi9Dl8CdmTnMA==
X-Received: by 2002:a05:600c:4510:b0:434:a30b:5455 with SMTP id
 5b1f17b1804b1-4389144f671mr108196525e9.27.1737369335957; 
 Mon, 20 Jan 2025 02:35:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753bee8sm195408755e9.34.2025.01.20.02.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:35:35 -0800 (PST)
Message-ID: <e364cd9a-6c90-4096-93f3-9042adbcf8a3@redhat.com>
Date: Mon, 20 Jan 2025 11:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/ast: Refactor ast_post_gpu() by Gen
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4f5n6n_iVSxcna-cL2btyJP0lhy9Md7oRgWK9NRZEnU_1737369336
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
> Reorganize ast_post_gpu() so that it first branches by Gen and then
> by config mode and TX chip. This will later make it possible to split
> up the function by Gen.
> 
> The helper ast_init_3rdtx() only handles Gen4 and Gen5, so leave it
> out from the other Gens.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_post.c | 36 ++++++++++++++++++++++++----------
>   1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 364030f97571d..49f661760f9e5 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -344,21 +344,37 @@ void ast_post_gpu(struct ast_device *ast)
>   {
>   	ast_set_def_ext_reg(ast);
>   
> -	if (IS_AST_GEN7(ast)) {
> +	if (AST_GEN(ast) >= 7) {
>   		if (ast->tx_chip == AST_TX_ASTDP)
>   			ast_dp_launch(ast);
> -	} else if (ast->config_mode == ast_use_p2a) {
> -		if (IS_AST_GEN6(ast))
> +	} else if (AST_GEN(ast) >= 6) {
> +		if (ast->config_mode == ast_use_p2a) {
>   			ast_post_chip_2500(ast);
> -		else if (IS_AST_GEN5(ast) || IS_AST_GEN4(ast))
> +		} else {
> +			if (ast->tx_chip == AST_TX_SIL164) {
> +				/* Enable DVO */
> +				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
> +			}
> +		}
> +	} else if (AST_GEN(ast) >= 4) {
> +		if (ast->config_mode == ast_use_p2a) {
>   			ast_post_chip_2300(ast);
> -		else
> +			ast_init_3rdtx(ast);
> +		} else {
> +			if (ast->tx_chip == AST_TX_SIL164) {
> +				/* Enable DVO */
> +				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
> +			}
> +		}
> +	} else  {
> +		if (ast->config_mode == ast_use_p2a) {
>   			ast_init_dram_reg(ast);
> -
> -		ast_init_3rdtx(ast);
> -	} else {
> -		if (ast->tx_chip == AST_TX_SIL164)
> -			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */
> +		} else {
> +			if (ast->tx_chip == AST_TX_SIL164) {
> +				/* Enable DVO */
> +				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
> +			}
> +		}
>   	}
>   }
>   

