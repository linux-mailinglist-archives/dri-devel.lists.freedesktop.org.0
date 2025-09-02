Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA190B3F5EE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3D10E5BA;
	Tue,  2 Sep 2025 06:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cAywLg4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F4B10E5BA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756795989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+K8NuGq4C9QdLZ+9B/ZeN6vB6jZQ2wCK4Lufhm2yvDs=;
 b=cAywLg4rFUiVgvzPWKQD2d/YhJJyX/i8/HmdQC8KYHs/u+SkPH9Sh7/IbG2BMcMRZnm8cS
 uKcylf58Q0TMXdIlcA86etcPMp99w91WOnImoIc75/XMW0eZ67i6YhheoJ83h/TOpy97Eh
 Juc7/MgsK9NK81ojB74PyZ2OwXiizEE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-WJSJnkSlMWSBgDlP4zJOzA-1; Tue, 02 Sep 2025 02:53:08 -0400
X-MC-Unique: WJSJnkSlMWSBgDlP4zJOzA-1
X-Mimecast-MFC-AGG-ID: WJSJnkSlMWSBgDlP4zJOzA_1756795987
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b920e0c25so6378715e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756795987; x=1757400787;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+K8NuGq4C9QdLZ+9B/ZeN6vB6jZQ2wCK4Lufhm2yvDs=;
 b=wOmavJN8Yblsq3QxnN8NVJYsdhIxlzJ4qqJGKcqc5AYcM+L3DqghErA2I0egqoctCp
 mO9JjsBMjdNgXS1vC+V+dObMHx1ZU1PM5FF0/MRKaPtSZEQHjhlkGZEbZLoJ5UloX966
 +Q5xBrJBYUFyPHjHQKqkr+PP1d5rs905JmSJSx5oUuANK8ZRpWAjKz8dDzJHzOQK2aNP
 5BcUEZnOrAS8SPJRkF9WXQUkhs0D40AFb42TMftAbcK8yAshLaNYDk6tx/F9Jv/OS0dF
 obrBcUXIk2/d7fgd4B0ogWroYQvagAMY3+bM8v1efDCovWHFLWkRhpWUMMBX5TivYvt4
 RI9g==
X-Gm-Message-State: AOJu0YxVGCnMPSLqUUzZ3CrG5RkgSqWM4XN7v9AFZq/CLYmXynGgEd8c
 CeabORGsWDDTyLL422OdLCvJPmFksmkyeWi2peLG7iWbXUzYc1rcn6oTZyvVuT9MZ2w2VsMb1Dv
 l0//1OMoCBlhAJE4HzoLpKxu4uO5VZBDpxBjB2nll17KEzOCqJXE3mfPkt0vmQ1gJb45Mis/isv
 8Dxw==
X-Gm-Gg: ASbGncuircUCoAG+P4Z1BY5TGf7vI4QgaSNJtrFhVSqX/ChBt5A7lBzts7chwu+CUPg
 zedcLpRCJHAT92JsWhGhh2JKaldpLbGgDpx0WgcTLvdYHMpp0hH/e/DUqNkq7bS/ULT7ez8aMV5
 t8+ith/NxZDoBo1gMIydCDgbyEnyOHt3XFdVrQq6kIdQAfCZKlkrqTvzs1FRovYotgvQZSdXnTy
 8/7nVs+2gU0Wdjr9vHw5V1VPY4voH31WFon42jkOAa1k8pb4bNKv2fZ99UZCG78xH9ApGIkrb04
 mL8oLdGVcxFlPUmtauqIEUF5N3Y4BQPWr/jxU7kdzvwl8ab1vLUMJ5OmQrkaTOTTEzc9qeRwYsd
 dZs0=
X-Received: by 2002:a05:600c:4fcd:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b85533712mr90988715e9.10.1756795987026; 
 Mon, 01 Sep 2025 23:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz51Ie3z2lpuE4iSzLr6zBvItZujQkwWhY7FbZx0aSwkGmip7kmBwGt8RCR8Vk/qRL8ULlTA==
X-Received: by 2002:a05:600c:4fcd:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b85533712mr90988395e9.10.1756795986618; 
 Mon, 01 Sep 2025 23:53:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7d23b7sm183922365e9.1.2025.09.01.23.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:53:06 -0700 (PDT)
Message-ID: <80ba860e-c282-4ae4-a91d-09986197c609@redhat.com>
Date: Tue, 2 Sep 2025 08:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/ast: Remove unused SCU-MPLL and SCU-STRAP
 values
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826065032.344412-1-tzimmermann@suse.de>
 <20250826065032.344412-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250826065032.344412-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iqVRDJjJaPkY8oTbKJSQ0OHB0uv91LVuorBogYA9-AE_1756795987
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
> The ast driver used SCU-MPLL and SCU-STRAP to compute the memory
> clock. Remove the now unused values.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 492cc8461eb0..41ff880cfdec 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -214,7 +214,7 @@ static int ast_get_dram_info(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
>   	struct device_node *np = dev->dev->of_node;
> -	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
> +	uint32_t mcr_cfg;
>   
>   	switch (ast->config_mode) {
>   	case ast_use_dt:
> @@ -222,22 +222,13 @@ static int ast_get_dram_info(struct ast_device *ast)
>   		 * If some properties are missing, use reasonable
>   		 * defaults for GEN5
>   		 */
> -		if (of_property_read_u32(np, "aspeed,mcr-configuration",
> -					 &mcr_cfg))
> +		if (of_property_read_u32(np, "aspeed,mcr-configuration", &mcr_cfg))
>   			mcr_cfg = 0x00000577;
> -		if (of_property_read_u32(np, "aspeed,mcr-scu-mpll",
> -					 &mcr_scu_mpll))
> -			mcr_scu_mpll = 0x000050C0;
> -		if (of_property_read_u32(np, "aspeed,mcr-scu-strap",
> -					 &mcr_scu_strap))
> -			mcr_scu_strap = 0;
>   		break;
>   	case ast_use_p2a:
>   		ast_write32(ast, 0xf004, 0x1e6e0000);
>   		ast_write32(ast, 0xf000, 0x1);
>   		mcr_cfg = ast_read32(ast, 0x10004);
> -		mcr_scu_mpll = ast_read32(ast, 0x10120);
> -		mcr_scu_strap = ast_read32(ast, 0x10170);
>   		break;
>   	case ast_use_defaults:
>   	default:

