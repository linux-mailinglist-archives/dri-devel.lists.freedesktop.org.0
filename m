Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEAB3F5EC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E8E10E199;
	Tue,  2 Sep 2025 06:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IZ0TQ2wL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE08E10E5B6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756795957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E661k6HBoADq/DAhw/qUbzRHt1Szc73tA9AXdoU+kRw=;
 b=IZ0TQ2wLASJWwALWM8pRJeuae4/fGAmJK6d3K5UepO6HAL1btTs58M6H8WmD6A5FYQOpnz
 dvNlut1978kT/aedquL9L+0Zy6cnBHvqMbN7sxlqOjgLpiWUVXCnxagBbeRCmV7sFRWXF/
 zE2gpGLiEoNW70d9lR+uwMqemWMRrb4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-SgCW-EJbPfKwtCCbWyflTQ-1; Tue, 02 Sep 2025 02:52:35 -0400
X-MC-Unique: SgCW-EJbPfKwtCCbWyflTQ-1
X-Mimecast-MFC-AGG-ID: SgCW-EJbPfKwtCCbWyflTQ_1756795955
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b990eb77cso2225325e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756795955; x=1757400755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E661k6HBoADq/DAhw/qUbzRHt1Szc73tA9AXdoU+kRw=;
 b=HyiJeZlhleFMsh2mDWFQ2HJYuMFc7/tZETgYtDvEqjfJAH0b/AaEct8wbIc50OGTEw
 HH/UxD6JrnNgnMGWfoatAhuCQ9Wf+7ek+Qk1mY2L50VqqAs3/57sQ/8t4aMZg694ArSa
 88bc9qUo15g8KYc8OPqjfOc2sn/SRlBGAVKDx349ksCJ9ckxN9UTDsUg/HAUfJWAX6n2
 yBH+wHGphQDBljkjujBAEdkR7dOqm6TYSaKNSudCDN6FbGc19tjqaR2hD7XmLOJ/HqW7
 3kz7oq62ZgA4yoIU3FxSE1KvGbkRK7pezcTgeckB7je+xAKsJT5xdRfP0o+5APvUR6gI
 +vhg==
X-Gm-Message-State: AOJu0YxTT9+kN0NELLqLYt7CoX2fXon/gAm5qTqPOk5Bfu+Jh3wUtYGQ
 sK8rPyCAuVgNxikhYNMPx/d2onJvoggYbbZF9aRn0+mOlAWuKz4hyunYEyAHE4VlX2dxZUcFhdK
 oKMB+hGLgV9frqlYpleNpZYUrarpBk7n7/axFvHB1jAbtPwzCS0pXOwag62RVWKHPeo9tAw==
X-Gm-Gg: ASbGncsnFq5NfHHeQmxu2eEdSyooNirBsfH7K9XDWM54dw8ajR8al4fRtv8w5eJKWj/
 kDMa4ccABov+3ljApgXilLoOdsuXD4JTzQIemmfTw1vwEBjX+Ap85NnuSWrj+uwpSCgUivrsQ5J
 NNomu3hS/7W0UStwN8g016wJHynQEGEDPfm18tujDT4B8RE/uSo48AlRvECEKS3tLPDW+3+nect
 6/Pk/k71rYwTCA+f0Ijb3FGkfLgp07CECUYjjcSQRDEX+WCRhfOjWmxU8aDDgSELOROdWdOFIh6
 tKK3tO0M92QjZ4iRv7+7CW4ZBHIh+SY+bLYUnYXIwNWN4dPe0nZLbtnjYau7V8q+IRTYRkHe4aK
 ypy8=
X-Received: by 2002:a05:600c:810c:b0:45b:92a6:63e3 with SMTP id
 5b1f17b1804b1-45b92a665f4mr19626615e9.9.1756795954715; 
 Mon, 01 Sep 2025 23:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYW/UgEsW9UeiLaMyGHWY9fWVzjWD9MAiZf3cVDjiLqJm8142ESrmfyKdYMqBTRZHB3B5V+A==
X-Received: by 2002:a05:600c:810c:b0:45b:92a6:63e3 with SMTP id
 5b1f17b1804b1-45b92a665f4mr19626505e9.9.1756795954293; 
 Mon, 01 Sep 2025 23:52:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b87b3900dsm71423835e9.0.2025.09.01.23.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:52:33 -0700 (PDT)
Message-ID: <48e02aea-e8f7-4452-ae0a-aefac1225971@redhat.com>
Date: Tue, 2 Sep 2025 08:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ast: Remove unused dram_bus_width field
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826065032.344412-1-tzimmermann@suse.de>
 <20250826065032.344412-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250826065032.344412-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: De7lF96T8nif1KUk3jUfRfjVTWytU1a5lXNewTBu_VY_1756795955
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
> The DRAM bus width is not necessary for the driver. Remove it.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  | 1 -
>   drivers/gpu/drm/ast/ast_main.c | 6 ------
>   2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index e37a55295ed7..403b86f00a54 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -172,7 +172,6 @@ struct ast_device {
>   	enum ast_config_mode config_mode;
>   	enum ast_chip chip;
>   
> -	uint32_t dram_bus_width;
>   	uint32_t dram_type;
>   	uint32_t mclk;
>   
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 830f1c5fe893..0b3fb6856db7 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -242,7 +242,6 @@ static int ast_get_dram_info(struct ast_device *ast)
>   		break;
>   	case ast_use_defaults:
>   	default:
> -		ast->dram_bus_width = 16;
>   		ast->dram_type = AST_DRAM_1Gx16;
>   		if (IS_AST_GEN6(ast))
>   			ast->mclk = 800;
> @@ -251,11 +250,6 @@ static int ast_get_dram_info(struct ast_device *ast)
>   		return 0;
>   	}
>   
> -	if (mcr_cfg & 0x40)
> -		ast->dram_bus_width = 16;
> -	else
> -		ast->dram_bus_width = 32;
> -
>   	if (IS_AST_GEN6(ast)) {
>   		switch (mcr_cfg & 0x03) {
>   		case 0:

