Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273EA16AE2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0B110E39D;
	Mon, 20 Jan 2025 10:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tx5dALpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242D310E39D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EYJuk9YP5HBDj9wgMNN0IWOF0tR4XF1e9B7NzwXbg4=;
 b=Tx5dALpYR+eWSdEXI9PbRiiUXo/KorYJdFOhFGGXFJ+eRmtLUOiXYtOxD6dJ5QxCBSUyUQ
 Uuc0CkigpMc6yq3z6U/M1X/muzdj1QHNHC4SwRNt5gR2+9GvlEvCKn03wnUcHvf1/+T59S
 twn6zxGOWdvXbpsS7PSPaz73q2xXPeg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-R-5Rf-ilPMSRARuhluiKpQ-1; Mon, 20 Jan 2025 05:37:29 -0500
X-MC-Unique: R-5Rf-ilPMSRARuhluiKpQ-1
X-Mimecast-MFC-AGG-ID: R-5Rf-ilPMSRARuhluiKpQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-436379713baso20556795e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369448; x=1737974248;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1EYJuk9YP5HBDj9wgMNN0IWOF0tR4XF1e9B7NzwXbg4=;
 b=tXMJAors/Ukt7s8aJsgYL1HqXm7+f4Mtse5pZe8Rv1X3hkOD8NenCCqV9laPW7QqfZ
 EYdl8uzR8NoafxlxxEXIIf4u2sIkkujaJ8vabmua9N2WZS/JxzE2J6zNOwxBoVOw6p5J
 +AnYSMqAPg7sLAwlM8NFJq/ZcXaDOcbhcsTpcfeJtXv6GWWir1AJfV6rWCSiC9MUtNnv
 X0Ndo0X1SMdmpF+DCIHuZaTX72nLCa7NZFw83fLWFkisgkGmiOGr61/pAzXq4MO8NHN3
 63VWJ62sKOEt22fwYk5U259RlmjLKezZTdd2P2Qm4RjkH8275VHZAtvsWhJmGHiL3u9H
 iQqQ==
X-Gm-Message-State: AOJu0YzIYNUDIandybtrxWCzNjkVD31qgE3wB5tZnZyp735JyIuWFRHy
 ejX7TMH/b6IgRCjeJw27BjJgFXrJzj0KoZoQi82wMUhifJNa37DtMdn5HcxS50i+Mn85eAxRe5W
 BQ91GZZfRswBaSB7XJyLTdgeAUgadckgIyxOCbHH27t/3fhQuEtpmjee05ngrNawg+W7VvvGvLg
 ==
X-Gm-Gg: ASbGnctNyH58wZLoKiF5eMZrEhzOn9g6rGQf2YRi2wHFQ9rMz51ItFxkSACqYdgTGEi
 JQHI3e98dgKz8ldj7+GrwKZSbYKuNRnX+DS3KTZWR2xOKalJQQreSAgciyt8B2vyYot+xKEzm3J
 6/Tn8ue3u9YpxYWXQbJnPCECt82V8dcQE2zaC4I8YjLtgeoG/oF559PjX4W0ph26U/kAlpK2MvV
 qUgITzxDUlDlnWC59rYT/xN7x5v3bazMAnu+zv38PIduQU1/srkS62XLGu08X4wgxh1g19g+CYz
 fbKe2I6Hxbjn1ZnGdtHxDsA8UUIOTt+k9w==
X-Received: by 2002:a05:600c:28c:b0:436:5fc9:309d with SMTP id
 5b1f17b1804b1-4389ec8a8d0mr97657845e9.30.1737369448057; 
 Mon, 20 Jan 2025 02:37:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED0Pm59+kVbJ0aBbYm8QOXT+2OMVlnpoI5GH/pvueiI7Bg0SIu8eZBJA1CzrSx09c0Ycdu5g==
X-Received: by 2002:a05:600c:28c:b0:436:5fc9:309d with SMTP id
 5b1f17b1804b1-4389ec8a8d0mr97657535e9.30.1737369447707; 
 Mon, 20 Jan 2025 02:37:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389046c59csm135571775e9.40.2025.01.20.02.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:37:27 -0800 (PST)
Message-ID: <4648b8d1-98fb-4caa-a443-bc8bb0e9f6cc@redhat.com>
Date: Mon, 20 Jan 2025 11:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/ast: Align Gen1 DVO detection to register manual
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p1InkdbvR2XP8TQbJUvuos9Nzq9W_A8vmxkDjGP0PE8_1737369448
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
> Align variable names and register constants for TX-chip detection
> to the names in the register manual.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 6 +++---
>   drivers/gpu/drm/ast/ast_reg.h  | 1 +
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 50b57bc15d53c..40d3b7770cf18 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -76,7 +76,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	};
>   
>   	struct drm_device *dev = &ast->base;
> -	u8 jreg, vgacrd1;
> +	u8 vgacra3, vgacrd1;
>   
>   	/*
>   	 * Several of the listed TX chips are not explicitly supported
> @@ -106,8 +106,8 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   		 * SIL164 when there is none.
>   		 */
>   		if (!need_post) {
> -			jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
> -			if (jreg & 0x80)
> +			vgacra3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
> +			if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
>   				ast->tx_chip = AST_TX_SIL164;
>   		}
>   	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 2aadf07d135af..0745d58e5b450 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -32,6 +32,7 @@
>   #define AST_IO_VGACR80_PASSWORD		(0xa8)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
> +#define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
>   #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
>   #define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */

