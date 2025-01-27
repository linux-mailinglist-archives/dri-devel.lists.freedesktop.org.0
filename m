Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64438A1D8A3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA4A10E285;
	Mon, 27 Jan 2025 14:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P89SZRHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7DC10E285
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737989145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcI4kGQP1ARmgWMF6qZ9b6An+Fyykm9y3ZKBVIks+n0=;
 b=P89SZRHFI0j8i3VJdBult3YGGr2qiRvknCUwkR9H0fp+XJh70hTPFj7allvjwcGyI7c3N6
 l3TZpyAt2M13mE3blPe7X9O232MPxpbqOJxuwFpuUt9XHS7rJNdkcUIyxyscmLCNe8pkmM
 +KuGA79+KCqR3VIOti86ewthr47cQI8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-q5d8JebAPqOtVajTMvOEKA-1; Mon, 27 Jan 2025 09:45:44 -0500
X-MC-Unique: q5d8JebAPqOtVajTMvOEKA-1
X-Mimecast-MFC-AGG-ID: q5d8JebAPqOtVajTMvOEKA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38a35a65575so3005767f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989143; x=1738593943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mcI4kGQP1ARmgWMF6qZ9b6An+Fyykm9y3ZKBVIks+n0=;
 b=n0OrpdRCbUGaX6lAVffHJRs6WDMOKF4ypNl3RVGx8wH4zVHxaDKmU3Hpk2NzKY6QPa
 XDi59uPUbqqcnXrRy79UvNANc2Jw4Z1Kz0lO7dU1VTf7NbGBTr5b5ZVxXPlxZuxLZSEy
 L4A5qzQV82Myr36bF0pOjaGSD3IpmYJ+3ypYZbUGG6b77c/j1t/PD7Phikly++//y7Fk
 oDAJloy2keqLuXqRswy+mK9wvYh+DJxfEVOQaKyA2LMGoqHkiHBsIZGD4/Zm6Zkgefwc
 ecdxMVfz8X5OtS6/DNu/xG3RNlEu6fM5BrWViTItLAnvbivTXglveLzMRvMMx302n9G+
 X7gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3FkgoGY0R/GktJVeZQJxjbg6uHNEBBUhcvDew3eOInv4Hn3ZUj6ZAsHBYxJILrRHNljr/AF643OE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8d/WfDAVZ4Ne1TgVt9fTWpZ6UYGT1ZJXwDJ+ebcYD0Vi+RdqZ
 BiXwgBtqaBK0v8NsjdQmHiCb3LnWrBlohHolv8Q5dg0TiZB433FrOqhyP3OnfiXuImSsVEEV22M
 A1mc7KnDgKxtzm+cWyTyJw8QAshSssHr4uCyHkAVZ3/q2T7/tsCjjCyl4utlOl7YROQ==
X-Gm-Gg: ASbGncsFxpL5tQO5c9pwF0XZZI+6TST07cUpk0zVfO0n9S+futUN1P4UrJRdOR1K91c
 tLMTvfBvNBe6A1SP6MUvk0ypm45Ts2k5mMeH+rfVIsNosNnP01YbbtQ4S/vquNwnAxf+WH4Uw2H
 qX9jmO//QGPobGMQJwveaWVX0NcFzdfjQfk6rvY9tBfjMGLvgMwDDjdpUtF4naIlYhGtdPsTJL7
 BweGMqAQnH1Ip/7yl4PGK4rJQh3+MfF/QUbdFra7s1B+13lbhlRRB2cBoHbmv8yeUtKftNfEgsP
 ggqmGlvreondLa05KgP9125m/CfEecUa9Bt009mTHHBb
X-Received: by 2002:a5d:5ccc:0:b0:385:e1e8:40db with SMTP id
 ffacd0b85a97d-38bf566f70bmr27415817f8f.24.1737989143196; 
 Mon, 27 Jan 2025 06:45:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDMa2NtCKtYPAGgjaaXqJLXgDlTl64/Pv/i3RU/zAIGDt28Aod9kKZ5yZ3B2WEreZEjK2Dhg==
X-Received: by 2002:a5d:5ccc:0:b0:385:e1e8:40db with SMTP id
 ffacd0b85a97d-38bf566f70bmr27415800f8f.24.1737989142648; 
 Mon, 27 Jan 2025 06:45:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6b2sm11553818f8f.34.2025.01.27.06.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:45:42 -0800 (PST)
Message-ID: <7832bf2b-2d62-49b3-b12e-895a203ae72b@redhat.com>
Date: Mon, 27 Jan 2025 15:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] drm/ast: Add empty initializer for VBIOS modes
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cParoXvoHigduWU0EKLWAn4Iocvzun7pisNliyvXfb0_1737989143
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
> VBIOS mode tables are terminated by an entry with a refresh rate of
> 0xff. The code is hard to read and fragile to use. Therefore create
> an empty entry with AST_VBIOS_MODE_INVALID to terminate each mode list.
> 
> Stop at the invalid entry when searching for modes in the tables.
> Instead of testing for refresh == 0xff, test with a helper function if
> the mode's size and refresh have meaningful values.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c   |  2 +-
>   drivers/gpu/drm/ast/ast_tables.h | 52 ++++++++++++++------------------
>   2 files changed, 24 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index adb485711fed5..e91a93050212e 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -179,7 +179,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   
>   	loop = vbios_mode->enh_table;
>   
> -	while (loop->refresh_rate != 0xff) {
> +	while (ast_vbios_mode_is_valid(loop)) {
>   		if (((mode->flags & DRM_MODE_FLAG_NVSYNC) && (loop->flags & PVSync))  ||
>   		    ((mode->flags & DRM_MODE_FLAG_PVSYNC) && (loop->flags & NVSync))  ||
>   		    ((mode->flags & DRM_MODE_FLAG_NHSYNC) && (loop->flags & PHSync))  ||
> diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
> index 0378c9bc079b0..4367817b2f806 100644
> --- a/drivers/gpu/drm/ast/ast_tables.h
> +++ b/drivers/gpu/drm/ast/ast_tables.h
> @@ -24,6 +24,8 @@
>   #ifndef AST_TABLES_H
>   #define AST_TABLES_H
>   
> +#include "ast_drv.h"
> +
>   /* Std. Table Index Definition */
>   #define TextModeIndex		0
>   #define EGAModeIndex		1
> @@ -212,6 +214,14 @@ static const struct ast_vbios_stdtable vbios_stdtable[] = {
>   	},
>   };
>   
> +#define AST_VBIOS_INVALID_MODE \
> +	{0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u}
> +
> +static inline bool ast_vbios_mode_is_valid(const struct ast_vbios_enhtable *vmode)
> +{
> +	return vmode->ht && vmode->vt && vmode->refresh_rate;
> +}
> +
>   static const struct ast_vbios_enhtable res_640x480[] = {
>   	{ 800, 640, 8, 96, 525, 480, 2, 2, VCLK25_175,	/* 60Hz */
>   	  (SyncNN | HBorder | VBorder | Charx8Dot), 60, 1, 0x2E },
> @@ -221,8 +231,7 @@ static const struct ast_vbios_enhtable res_640x480[] = {
>   	  (SyncNN | Charx8Dot) , 75, 3, 0x2E },
>   	{ 832, 640, 56, 56, 509, 480, 1, 3, VCLK36,	/* 85Hz */
>   	  (SyncNN | Charx8Dot) , 85, 4, 0x2E },
> -	{ 832, 640, 56, 56, 509, 480, 1, 3, VCLK36,	/* end */
> -	  (SyncNN | Charx8Dot) , 0xFF, 4, 0x2E },
> +	AST_VBIOS_INVALID_MODE,				/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_800x600[] = {
> @@ -236,8 +245,7 @@ static const struct ast_vbios_enhtable res_800x600[] = {
>   	 (SyncPP | Charx8Dot), 75, 4, 0x30 },
>   	{1048, 800, 32, 64, 631, 600, 1, 3, VCLK56_25,	/* 85Hz */
>   	 (SyncPP | Charx8Dot), 84, 5, 0x30 },
> -	{1048, 800, 32, 64, 631, 600, 1, 3, VCLK56_25,	/* end */
> -	 (SyncPP | Charx8Dot), 0xFF, 5, 0x30 },
> +	AST_VBIOS_INVALID_MODE,				/* end */
>   };
>   
>   
> @@ -250,8 +258,7 @@ static const struct ast_vbios_enhtable res_1024x768[] = {
>   	 (SyncPP | Charx8Dot), 75, 3, 0x31 },
>   	{1376, 1024, 48, 96, 808, 768, 1, 3, VCLK94_5,	/* 85Hz */
>   	 (SyncPP | Charx8Dot), 84, 4, 0x31 },
> -	{1376, 1024, 48, 96, 808, 768, 1, 3, VCLK94_5,	/* end */
> -	 (SyncPP | Charx8Dot), 0xFF, 4, 0x31 },
> +	AST_VBIOS_INVALID_MODE,				/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1280x1024[] = {
> @@ -261,31 +268,26 @@ static const struct ast_vbios_enhtable res_1280x1024[] = {
>   	 (SyncPP | Charx8Dot), 75, 2, 0x32 },
>   	{1728, 1280, 64, 160, 1072, 1024, 1, 3, VCLK157_5,	/* 85Hz */
>   	 (SyncPP | Charx8Dot), 85, 3, 0x32 },
> -	{1728, 1280, 64, 160, 1072, 1024, 1, 3, VCLK157_5,	/* end */
> -	 (SyncPP | Charx8Dot), 0xFF, 3, 0x32 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1600x1200[] = {
>   	{2160, 1600, 64, 192, 1250, 1200, 1, 3, VCLK162,	/* 60Hz */
>   	 (SyncPP | Charx8Dot), 60, 1, 0x33 },
> -	{2160, 1600, 64, 192, 1250, 1200, 1, 3, VCLK162,	/* end */
> -	 (SyncPP | Charx8Dot), 0xFF, 1, 0x33 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1152x864[] = {
>   	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* 75Hz */
>   	 (SyncPP | Charx8Dot | NewModeInfo), 75, 1, 0x3B },
> -	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* end */
> -	 (SyncPP | Charx8Dot | NewModeInfo), 0xFF, 1, 0x3B },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   /* 16:9 */
>   static const struct ast_vbios_enhtable res_1360x768[] = {
>   	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,		/* 60Hz */
>   	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x39 },
> -	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,	         /* end */
> -	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
> -	  AST2500PreCatchCRT), 0xFF, 1, 0x39 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1600x900[] = {
> @@ -294,17 +296,14 @@ static const struct ast_vbios_enhtable res_1600x900[] = {
>   	  AST2500PreCatchCRT), 60, 1, 0x3A },
>   	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
>   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x3A },
> -	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
> -	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x3A },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1920x1080[] = {
>   	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
>   	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
>   	  AST2500PreCatchCRT), 60, 1, 0x38 },
> -	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
> -	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
> -	  AST2500PreCatchCRT), 0xFF, 1, 0x38 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   
> @@ -315,8 +314,7 @@ static const struct ast_vbios_enhtable res_1280x800[] = {
>   	  AST2500PreCatchCRT), 60, 1, 0x35 },
>   	{1680, 1280, 72,128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
>   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x35 },
> -	{1680, 1280, 72,128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
> -	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x35 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   
>   };
>   
> @@ -326,8 +324,7 @@ static const struct ast_vbios_enhtable res_1440x900[] = {
>   	  AST2500PreCatchCRT), 60, 1, 0x36 },
>   	{1904, 1440, 80,152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
>   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x36 },
> -	{1904, 1440, 80,152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
> -	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x36 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1680x1050[] = {
> @@ -336,17 +333,14 @@ static const struct ast_vbios_enhtable res_1680x1050[] = {
>   	  AST2500PreCatchCRT), 60, 1, 0x37 },
>   	{2240, 1680,104,176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
>   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x37 },
> -	{2240, 1680,104,176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
> -	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x37 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   static const struct ast_vbios_enhtable res_1920x1200[] = {
>   	{2080, 1920, 48, 32, 1235, 1200, 3, 6, VCLK154,		/* 60Hz RB*/
>   	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
>   	  AST2500PreCatchCRT), 60, 1, 0x34 },
> -	{2080, 1920, 48, 32, 1235, 1200, 3, 6, VCLK154,		/* 60Hz RB */
> -	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
> -	  AST2500PreCatchCRT), 0xFF, 1, 0x34 },
> +	AST_VBIOS_INVALID_MODE,					/* end */
>   };
>   
>   #endif

