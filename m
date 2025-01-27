Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D243A1D848
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B204210E548;
	Mon, 27 Jan 2025 14:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f8o0qPbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6715810E548
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737988027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJnIu8poT1R8sG+28CAaxcuAIoGoAVRIF1+AV/B9Vhc=;
 b=f8o0qPbAxUgbXiN2fU0+V/Px8nPptP+nYEwQX/dVfIPBrw1RxJksavqrSDFvTYtSDCl4vA
 QMPxK7Q5uOcTw6amTWe+LFjkKDv1QXDx11MOB2q39xEu8KnnPTdp0d1V8qnazTSuurKNcm
 xdGGMwWCHxJu3KsUH7TDOBcIuQaydfM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-ePL5Dl94Oh-GSGWO0CXaeA-1; Mon, 27 Jan 2025 09:27:05 -0500
X-MC-Unique: ePL5Dl94Oh-GSGWO0CXaeA-1
X-Mimecast-MFC-AGG-ID: ePL5Dl94Oh-GSGWO0CXaeA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e1fd40acso2661476f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737988024; x=1738592824;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJnIu8poT1R8sG+28CAaxcuAIoGoAVRIF1+AV/B9Vhc=;
 b=DGEf+7cxYsD6iI8HYzwIFRV8arJ0qg+Y0DQ9BCuzbt0JvV02A+9uVFbYEDN9vblZGr
 dYe/K0o6hLXxlvRj1khcpEJzLTIxUOc+AkoIrmf8x0NhHIvV3ofiUQNjtRJ0CQSp8Zb+
 xLeA/5EVuc9pV02tju5v3+EiiR/VNQ9OIYUYaCj9L+mPYrf9EA0M2qCnNAMrGp7rsTfx
 LrOuy/+TyblL389bLYwoLLLvV/4NFGflcgrYsFLMaYFDT7qy0Jm8qOMXQvdktXYPmfzc
 XggIuwihkguMvhBkEos/dCKuoZAHfk7uLZs2OcNjh69+7YTgm4D4HwPZfAgqV5rK30C0
 8UxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZhWzW/sG4znyOQpLb7hMn2MRZzg6Ab/GN9b6awhtXtR3uPyxKT4Vj2/Cr1HKI6NS91UbUyMmThSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXlGQCU4DbpGPlYGYKZwgshcyR+aiG8nraItrDovny/VRJXGSM
 UXdhg4sg4P+hu2QSR6eFSFspbMLQsW7xp68a6mwzKcYk+Ts31NIeToizeEILmmxT/hC1g/i8Zpq
 Y04rH4UyrtPow70K/DqJvqK0RR54TCRh2ZqId4Mmctx3eRDolKa1dLJHNt7UegVIIqMSGkBaUUw
 ==
X-Gm-Gg: ASbGncv8+MVEAQY21M8ROXapHWWxnQf0dspk2cAIERhrVi7vXLgIa1TXd0lyILLudSd
 xSzrFA9itNHvmoATlS37qmiIJaVobfdt2Ix+GYqizy49tbYdayYop01UwSOMB7oXyl7Lz6UehmF
 r1DFlGzY7MItakfHorzpePKvkgFyJ+6JQM96K++IDexhvB42/+dNRCSDl3K9gluOll/ScJYzS04
 U9evdjDW0L8kCIR/inXB5Er7kI+3APZgagX4IWpLa2lwbrCMXyyeB7KDhvQGbZ1GATK5A+OTKa3
 9ZwXZjZreBXZ0i9KlBehyC4/YmNULe+sBqoK/ASaW0hn
X-Received: by 2002:a05:6000:402a:b0:386:3327:9d07 with SMTP id
 ffacd0b85a97d-38bf59ef829mr40312681f8f.54.1737988024482; 
 Mon, 27 Jan 2025 06:27:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwavGyYiuhLQp65T5lgiG/eASC9MK4c8rBZ1/hMj+qQSg5x4oxiV/moX1bnHvksa3pICerGg==
X-Received: by 2002:a05:6000:402a:b0:386:3327:9d07 with SMTP id
 ffacd0b85a97d-38bf59ef829mr40312656f8f.54.1737988024100; 
 Mon, 27 Jan 2025 06:27:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188915sm11130374f8f.41.2025.01.27.06.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:27:03 -0800 (PST)
Message-ID: <9006b8a0-8362-4ad4-97c5-b85445e7ce01@redhat.com>
Date: Mon, 27 Jan 2025 15:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] drm/ast: Rename support_widescreen to
 support_wsxga_p
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kpl0gQpTp4iMMDGhhVn0h2pJxyXKFY_x5b7ohOVPGOU_1737988025
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
> The flag support_widescreen in struct ast_device selects devices that
> support resolutions of at least 1680x1050 (WSXGA+). Name it accordingly.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  2 +-
>   drivers/gpu/drm/ast/ast_main.c | 26 +++++++++++++-------------
>   drivers/gpu/drm/ast/ast_mode.c |  2 +-
>   3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index cf9edef8fca66..ec5b204be1dae 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -205,7 +205,7 @@ struct ast_device {
>   		} astdp;
>   	} output;
>   
> -	bool support_wide_screen;
> +	bool support_wsxga_p; /* 1680x1050 */
>   
>   	u8 *dp501_fw_addr;
>   	const struct firmware *dp501_fw;	/* dp501 fw */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 4f402e0b9b5c1..e1cfb2a1a5448 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -40,40 +40,40 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   {
>   	u8 vgacrd0;
>   
> -	ast->support_wide_screen = false;
> +	ast->support_wsxga_p = false;
>   
>   	if (AST_GEN(ast) >= 7) {
> -		ast->support_wide_screen = true;
> +		ast->support_wsxga_p = true;
>   	} else if (AST_GEN(ast) >= 6) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (ast->chip == AST2510)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   	} else if (AST_GEN(ast) >= 5) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (ast->chip == AST1400)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   	} else if (AST_GEN(ast) >= 4) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (ast->chip == AST1300)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   	} else if (AST_GEN(ast) >= 2) {
>   		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
>   		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
> -			ast->support_wide_screen = true;
> +			ast->support_wsxga_p = true;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index b533eb6e233ed..d1b3136b37693 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1024,7 +1024,7 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   	enum drm_mode_status status;
>   	uint32_t jtemp;
>   
> -	if (ast->support_wide_screen) {
> +	if (ast->support_wsxga_p) {
>   		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
>   			return MODE_OK;
>   		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))

