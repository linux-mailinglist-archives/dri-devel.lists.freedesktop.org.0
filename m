Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86909A16AE5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA7F10E3C1;
	Mon, 20 Jan 2025 10:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="evSXXbJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F3010E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m//Tv6v3/YkbCtfv35A3Nufvn3Q8QncCJ3hJbjfH6Xk=;
 b=evSXXbJK44bsw0ljY9whDtx59hwtk65Hi/i938kzqHYsZEqO4aD1OoQn/7h6Qi1IQGJ23a
 Y5ciU9oUHx1BQI1W0F7R+z+9FLxlxpAAjgc/HS9Jp7ygYnwis2OrHyo46v3rPPCAPrmCT5
 6LhC2fcRlpbxNSwGFIvpi5z/VHCgH6g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-B1tQooLZP_-FbPfEglS6hA-1; Mon, 20 Jan 2025 05:37:54 -0500
X-MC-Unique: B1tQooLZP_-FbPfEglS6hA-1
X-Mimecast-MFC-AGG-ID: B1tQooLZP_-FbPfEglS6hA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4359eb032c9so33844295e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369472; x=1737974272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m//Tv6v3/YkbCtfv35A3Nufvn3Q8QncCJ3hJbjfH6Xk=;
 b=MDfXChMf4/IMsltR5gW6+znacNrfUxfuWRN+n3pZNj2GEOvW8msk+RMu7VicuCimec
 V6flZBVNThHH7PDZ0dcVSGKlWs3r/GkNjKwqDIUwYwrbXPgZIpe87O9Sz79fwBN7sTNM
 tDInKS6GadH6AlHGL7hJEFgFx7JyQpxxzSNFHshcvNtZQ106Rlo/UB1nCOn/HaFRDfLw
 R4cbMVCK1zamuzQlRp40yyJ3+/zn65m4pLC4ztKDmMsljihgpLe8+TC50d+iXxQLbVbo
 Eeh/N7w9XV0CvI3WnBpU3vaKm/SeZvRDmygtf4CXvE9HzHmoGvqv/4nZemG3UdxO4HFy
 U4CQ==
X-Gm-Message-State: AOJu0YxlsKVd2bwSVFbunqDBolY+RvxfUUTwhlziaRWXSm1VQANx1A3z
 K3JGJSFqwguA+TuWsk1vttSEKVXt5zxumgDb+hVnEjFXOTfmV6T6Qpc5K3SpAe37u52hydseaV7
 +ABjSODWt+04wl595RJq9Ng4jwukWW95WYEcCTR6ZXrjp6NNqjWJn2tj2eCkiZQ58tbKP3JRKYw
 ==
X-Gm-Gg: ASbGncuDj4Es9tUcLCyDkDI1Nq8ohd8huELFa8LdBJOzy2aS5a1s/XtxmAd63ecJRhR
 Ln7y+TL6BrvtqvEADPS61S6tPD51Cf9egyK0z697moqCLPzwcuu/JZBgzX2DqDKr3BJ+s76zImX
 IFcgPeXUWFUsC6rvEAqEqqfQvD0S8h0ReHb4YyNU2Fq8VMhK5DN6yFmmJYtmKKK5akqgpvNcs+R
 FzIBPb6UIT69LRakKO+H3UVM7ygoYp1nR1NwZm8YbW2ErRcxCwJuzkEhhQzZO1v/8UwhnUhv/1L
 fVrHTylQ9XaGWL4RiOL8tWhH1J8JJlbJvQ==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-438914309a8mr91901295e9.26.1737369472638; 
 Mon, 20 Jan 2025 02:37:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCPDrnpclah/PIvsTk988b86s6OepEF77bsKetSRWUdmQwCLBiVq84u7j7oFs7w41mSSp2xg==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-438914309a8mr91900075e9.26.1737369470736; 
 Mon, 20 Jan 2025 02:37:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904625e5sm134355495e9.32.2025.01.20.02.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:37:50 -0800 (PST)
Message-ID: <51d2c199-e7ea-4078-acb9-8ab3ce9bc4dc@redhat.com>
Date: Mon, 20 Jan 2025 11:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/ast: Only warn about unsupported TX chips on Gen4
 and later
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zwFTMcBNkU1keWaWxw09dqrV1_MmzufdaBhb5HbNpNs_1737369473
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
> Only Gen4 and later read the installed TX chip from the SoC. So only
> warn on those generations about unsupported chips.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 40 +++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index b0d1b99ed532b..ba69280b33e78 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -78,21 +78,6 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	struct drm_device *dev = &ast->base;
>   	u8 vgacra3, vgacrd1;
>   
> -	/*
> -	 * Several of the listed TX chips are not explicitly supported
> -	 * by the ast driver. If these exist in real-world devices, they
> -	 * are most likely reported as VGA or SIL164 outputs. We warn here
> -	 * to get bug reports for these devices. If none come in for some
> -	 * time, we can begin to fail device probing on these values.
> -	 */
> -	vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK);
> -	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ITE66121_VBIOS,
> -		 "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> -	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_CH7003_VBIOS,
> -		 "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> -	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ANX9807_VBIOS,
> -		 "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> -
>   	/* Check 3rd Tx option (digital output afaik) */
>   	ast->tx_chip = AST_TX_NONE;
>   
> @@ -116,9 +101,9 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   		 * the SOC scratch register #1 bits 11:8 (interestingly marked
>   		 * as "reserved" in the spec)
>   		 */
> -		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
> -					      AST_IO_VGACRD1_TX_TYPE_MASK);
> -		switch (jreg) {
> +		vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
> +						 AST_IO_VGACRD1_TX_TYPE_MASK);
> +		switch (vgacrd1) {
>   		/*
>   		 * GEN4 to GEN6
>   		 */
> @@ -144,6 +129,25 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   		case AST_IO_VGACRD1_TX_ASTDP:
>   			ast->tx_chip = AST_TX_ASTDP;
>   			break;
> +		/*
> +		 * Several of the listed TX chips are not explicitly supported
> +		 * by the ast driver. If these exist in real-world devices, they
> +		 * are most likely reported as VGA or SIL164 outputs. We warn here
> +		 * to get bug reports for these devices. If none come in for some
> +		 * time, we can begin to fail device probing on these values.
> +		 */
> +		case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
> +			drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n",
> +				 vgacrd1, AST_GEN(ast));
> +			break;
> +		case AST_IO_VGACRD1_TX_CH7003_VBIOS:
> +			drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n",
> +				 vgacrd1, AST_GEN(ast));
> +			break;
> +		case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
> +			drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n",
> +				 vgacrd1, AST_GEN(ast));
> +			break;
>   		}
>   	}
>   

