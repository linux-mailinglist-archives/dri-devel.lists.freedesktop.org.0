Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B6B3F5ED
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050510E5B6;
	Tue,  2 Sep 2025 06:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BbJyudGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63D410E5B6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756795971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aagU472yzSNbhqsZfq7Z/HRmOFq5cxSmKAzL2h0CUc=;
 b=BbJyudGJ0BBp2cVPQvoE5s3IyAe4IbFJpDEJm+SDVVMyU9mDpT/Fpy8facZ4Euf+OxP2oF
 TmQrZ+/AoWSJexubNcLK2v47+dh8XDoTLWctiWpT1fpNRZWZNratrYXkxcDGQYlRSOi/Gt
 65a8MO1wQYam8poEebORFbxxsWBfaK8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-4T8WcyFxPTyk8lbTmMLzdQ-1; Tue, 02 Sep 2025 02:52:50 -0400
X-MC-Unique: 4T8WcyFxPTyk8lbTmMLzdQ-1
X-Mimecast-MFC-AGG-ID: 4T8WcyFxPTyk8lbTmMLzdQ_1756795969
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b8a307c12so9816605e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756795969; x=1757400769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0aagU472yzSNbhqsZfq7Z/HRmOFq5cxSmKAzL2h0CUc=;
 b=QkQLeNW6ggCRllh+6x+/M3HvA2eWYgqwD2IbwvZfSVeX77jBXid/PB5kGRT2m3PAPi
 0L4SDIGzstHf8p8KL/FOnkZi6t2UHmn7pdzAgN92G0DfkzRixZ92HhZYIqsrJXR2qgw0
 NdlHvwbSc6rH8NEwFR27dHzdOxNgAepNImX+nSLln1v8xyqoDajOQIo1KHGEIsvhafdi
 jzLbbTMVS+561j8MUZggwd5AXmucsheOgWMDWtpXisVgkgjmdk4ZBZ8HVXgewaezl2Dh
 gJBb/ATMb8TDQ5TpauRUnh7t9Hoywg3YjlxEq611DUNy1yVqGdpKqW2iC5F8tq5hDCOH
 JoZw==
X-Gm-Message-State: AOJu0YyraHymuphnLHXnghU+khdQ8Sw1F5LX6HzjlFRRQyZjTOObwR/0
 w/X7R+hTaKVwJKxQRzbnHwKw5DMj/CkzikgEncDQfg2/uvDn+3Zlo42uIqfVqrAU8kpGwT7dItQ
 sH/AGmCqvlnl6MRXaV3IZy/jpYEY5LWlV0WGgbjtyMisCXGMuG+mIktwhl3KBFofh18rSHQ==
X-Gm-Gg: ASbGncu23LEMoWN1HyeK0pvXPC19MUUrWguTtER29CSHs0J5z/sFbZFAicemFWk5ysr
 sjWTii7dGcgD4r8wu0erVrIweH0IH9N0vHjV5lRNRimwbwbpBrAPqZ0mNt8YnzSx6MAyWsbZEeZ
 edurQBkjWjoXGZokl9EVooPvSwqj67TCPaAj091e7YfoGSqxLBnS53IM7mfm+YUhIfqwbEp86xi
 KzqzwtHtu+viKJFiX0Awm3mLx33gOQfaU2lLnGigohpmwm2MAYp2cSYjdtFFHyiP4JJgZ9DzPHQ
 DHUiS4KbvK8f0VmR2yqaZR8MR2/5Si6xXV1pIIwOCru1vYtvx2cZyW+h9ww+iQoZMysP/oimNSP
 Pt0w=
X-Received: by 2002:a05:600c:1f08:b0:45b:7bba:c7b5 with SMTP id
 5b1f17b1804b1-45b8557c880mr77260005e9.28.1756795968794; 
 Mon, 01 Sep 2025 23:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1d5tk3RDPmkswuur7dnBqQIF5kg1rZcQs2yjfC97vfcYzSiqLzBNtyOhirDnLxHEGtmtICg==
X-Received: by 2002:a05:600c:1f08:b0:45b:7bba:c7b5 with SMTP id
 5b1f17b1804b1-45b8557c880mr77259725e9.28.1756795968343; 
 Mon, 01 Sep 2025 23:52:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f30fe02sm260158565e9.18.2025.09.01.23.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:52:47 -0700 (PDT)
Message-ID: <7eb489cc-2092-4c8b-9c13-ecc1cb93c9a4@redhat.com>
Date: Tue, 2 Sep 2025 08:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/ast: Remove unused mclk field
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826065032.344412-1-tzimmermann@suse.de>
 <20250826065032.344412-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250826065032.344412-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PnltT5JRdwifJYo--2CXdoW929ttNPdCSoKOgz-POGY_1756795969
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

On 26/08/2025 08:49, Thomas Zimmermann wrote:
> The memory clock is not necessary for the driver. In default for
> AST2600 is event incorrect; should be 800 MHz. Remove it.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 -
>   drivers/gpu/drm/ast/ast_main.c | 26 --------------------------
>   2 files changed, 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 403b86f00a54..c9c933b5a70d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -173,7 +173,6 @@ struct ast_device {
>   	enum ast_chip chip;
>   
>   	uint32_t dram_type;
> -	uint32_t mclk;
>   
>   	void __iomem	*vram;
>   	unsigned long	vram_base;
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 0b3fb6856db7..492cc8461eb0 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -215,7 +215,6 @@ static int ast_get_dram_info(struct ast_device *ast)
>   	struct drm_device *dev = &ast->base;
>   	struct device_node *np = dev->dev->of_node;
>   	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
> -	uint32_t denum, num, div, ref_pll, dsel;
>   
>   	switch (ast->config_mode) {
>   	case ast_use_dt:
> @@ -243,10 +242,6 @@ static int ast_get_dram_info(struct ast_device *ast)
>   	case ast_use_defaults:
>   	default:
>   		ast->dram_type = AST_DRAM_1Gx16;
> -		if (IS_AST_GEN6(ast))
> -			ast->mclk = 800;
> -		else
> -			ast->mclk = 396;
>   		return 0;
>   	}
>   
> @@ -300,27 +295,6 @@ static int ast_get_dram_info(struct ast_device *ast)
>   		}
>   	}
>   
> -	if (mcr_scu_strap & 0x2000)
> -		ref_pll = 14318;
> -	else
> -		ref_pll = 12000;
> -
> -	denum = mcr_scu_mpll & 0x1f;
> -	num = (mcr_scu_mpll & 0x3fe0) >> 5;
> -	dsel = (mcr_scu_mpll & 0xc000) >> 14;
> -	switch (dsel) {
> -	case 3:
> -		div = 0x4;
> -		break;
> -	case 2:
> -	case 1:
> -		div = 0x2;
> -		break;
> -	default:
> -		div = 0x1;
> -		break;
> -	}
> -	ast->mclk = ref_pll * (num + 2) / ((denum + 2) * (div * 1000));
>   	return 0;
>   }
>   

