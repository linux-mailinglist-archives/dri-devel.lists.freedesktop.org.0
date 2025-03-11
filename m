Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B5A5C1E7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33B710E5AC;
	Tue, 11 Mar 2025 13:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IXWcbgEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E1F10E5AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGAb8tLBGAAD3ldkqr4DdMOGR6awHtYPthniynSmrVw=;
 b=IXWcbgEGKVLXKkyR8A3cCd6CnkDJhhkvjEYf4kEawPXk+V6EwtSY11Hk7+mKatKT0OOhKP
 FynpyG4Wod4V/ml6j8uKuZM7GvBo9g6luQAbvrqTMzy2t7UIGDQy5bEqOSG2TBfmG4W3nn
 RzcHsbCNj/+S2g/abixRLUWxbXC/1l0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-537KNFcMNySDnY_1d3-KpA-1; Tue, 11 Mar 2025 09:07:29 -0400
X-MC-Unique: 537KNFcMNySDnY_1d3-KpA-1
X-Mimecast-MFC-AGG-ID: 537KNFcMNySDnY_1d3-KpA_1741698448
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3912fe32a30so2171130f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698448; x=1742303248;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yGAb8tLBGAAD3ldkqr4DdMOGR6awHtYPthniynSmrVw=;
 b=PX3qu1+/XA3P9QATCjBigNIhyCkPSoBdns+D+sNah2/gZEtGZXzGI46tGX+89nXLah
 W/6SmpNfZWVjLa4FP30K+XGt05PO9SdT9sJ48FQUBf/RsyU2WjbnukmRWAV5CU/rf0M2
 EsVvwstH6LNyfz8fIFc4RoqFX/kiyJTvn0rS8L/WS1TNWtTe5ehvZuWt/WLg3Sa+k37k
 KOVd/kwXQL346+XtKoP4bzJGveTJ++63W0f9kdnG4cnz/rnPzgNbYXd/rrhlZMiW2ljn
 iVMecVAfN8Wt/smeF0BDuVhPL6ZR2YqNqW5bQm3oE80uNUmIK3jadDGlCCuMB7Dnk1/6
 Antw==
X-Gm-Message-State: AOJu0YxEgSreThnKFuoK3DJ/ca/mOz5HKsg3CTVi9Y/dzOmet3qCD/gQ
 kjc+YpUD+p4itpjB+xdiLs7zhaYzzFMLenqUGfyTB7RZw80WC8bU4OVKRqqohLpA753fjsmxwqY
 hwEHO5zmuzNePvIsgX1LqVNVrGzziF3Oi04Kfri/zN7O7CzHP+k+IRHurN2OFtBL6FA==
X-Gm-Gg: ASbGncsswF7CtMwS+x34F76wWhCIpu7LIgdlaSanFmXkspnn0x0eBDh4HI9sfzEwVgj
 /9ayDxqP5daXxycpmSozy44XhShDs9e+L8R/+ONmZLvZlcyk9JgTFQEl8b9ZIbXs2E64Ebqu7I3
 NGaKv7RZtR1kr4atMarZn6uZOZs6kr1ppH9BjkKnrOmJ56RHBv254U2FLVjJmCJ0JjCWNdPnNGR
 1WU/zMgIfincH9lbD/a3dCqsflF3oLYf8ZoPoYVW0LkK7VLODn/CyV3WxXHmiT07UQ8oqjaOY+Z
 SL1jmNB/VzR62k/p2lOafKyYbMwiJ7P6R65MmbKD6ZdpELywLzDeCFI=
X-Received: by 2002:a05:6000:1faa:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-392641bd0f0mr5560839f8f.16.1741698447977; 
 Tue, 11 Mar 2025 06:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmum8LCi6Okg352ru4Tpe4ynPfNeuJesK9CiOBv4Lg14nVVJB9j3H6C/yJq5SVvn7LGlo5w==
X-Received: by 2002:a05:6000:1faa:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-392641bd0f0mr5560783f8f.16.1741698447535; 
 Tue, 11 Mar 2025 06:07:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0194f2sm18384176f8f.54.2025.03.11.06.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:07:26 -0700 (PDT)
Message-ID: <78498943-cb4a-4423-a2fd-15f98d2d5eb8@redhat.com>
Date: Tue, 11 Mar 2025 14:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/ast: Add VGACR99 register constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hTKeenfhmKf_VeF-5jF4i37eb8C9EQEHGecxA5xLFLU_1741698448
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

On 05/03/2025 17:30, Thomas Zimmermann wrote:
> Add register constants for VGACR99 and use them when detecting the
> size of the VGA memory. Aligns the code with the programming manual.
> Also replace literal size values with Linux' SZ_ size constants.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mm.c  | 13 ++++++-------
>   drivers/gpu/drm/ast/ast_reg.h |  1 +
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 8d8aac8c0814..3d03ef556d0a 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -35,9 +35,8 @@
>   
>   static u32 ast_get_vram_size(struct ast_device *ast)
>   {
> -	u8 jreg;
>   	u32 vram_size;
> -	u8 vgacraa;
> +	u8 vgacr99, vgacraa;
>   
>   	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
>   	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
> @@ -55,16 +54,16 @@ static u32 ast_get_vram_size(struct ast_device *ast)
>   		break;
>   	}
>   
> -	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0x99, 0xff);
> -	switch (jreg & 0x03) {
> +	vgacr99 = ast_get_index_reg(ast, AST_IO_VGACRI, 0x99);
> +	switch (vgacr99 & AST_IO_VGACR99_VGAMEM_RSRV_MASK) {
>   	case 1:
> -		vram_size -= 0x100000;
> +		vram_size -= SZ_1M;
>   		break;
>   	case 2:
> -		vram_size -= 0x200000;
> +		vram_size -= SZ_2M;
>   		break;
>   	case 3:
> -		vram_size -= 0x400000;
> +		vram_size -= SZ_4M;
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 039b93bed19e..e15adaf3a80e 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -30,6 +30,7 @@
>   
>   #define AST_IO_VGACRI			(0x54)
>   #define AST_IO_VGACR80_PASSWORD		(0xa8)
> +#define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
>   #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)

