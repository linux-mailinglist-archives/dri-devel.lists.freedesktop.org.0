Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3CA5C1F1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EC310E5AF;
	Tue, 11 Mar 2025 13:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fJdKSwFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DDB10E5AF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXsTgS6zX+uZQVBZBFLiO+Sc88bVCv1bB6fJXHrGhsM=;
 b=fJdKSwFzxE76+mXTkCemLyEvQac9ECPFXfhwtB2YaG4PFrufKnMkSEwiEq3Xj3K6RbvqHX
 HKJR/9gjVeIdGnkAVFsa4CbvZCiLIYAP2Zg3sf+S25ie02hDL/NA++T2e+gSylSVNh+5U4
 U8CI761XDmn3WYOT3ldsOFV+33x9yHA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-5fmU9g8kM6GY7zcnxgksag-1; Tue, 11 Mar 2025 09:08:32 -0400
X-MC-Unique: 5fmU9g8kM6GY7zcnxgksag-1
X-Mimecast-MFC-AGG-ID: 5fmU9g8kM6GY7zcnxgksag_1741698511
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-391459c0395so1043395f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698511; x=1742303311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DXsTgS6zX+uZQVBZBFLiO+Sc88bVCv1bB6fJXHrGhsM=;
 b=h3AluDApT3LpsQ0WLzXRsnRK2B8TrrcZ6PN3l+hFT+CeiB9rXsDAPL0iX2mKBzuGCs
 ZbWNKZOaoH49dJ2b6cR7/rujqeRSmmy8XxI+4WsVKaYxxGUZDpThlAwP+wVg/xM4UN/5
 i1kasf7n4zKyWJnlp8h0eL2hjl9VmHTZh9xQrmWmAMy1COWi5HK8odPEu0b2gVA/ET7+
 HkGVNgHeIJPUms9npXdYlV+azyeztaAy9Jy9SycsTtAY55A4Gh41TxpxFRq8W4lGNPL9
 23jG8cDw9vJ/RctDLYDFgqBKqct6OU6IRKv09fD884SyI07zi3/0YXEsoICBVjfycFxC
 oV5A==
X-Gm-Message-State: AOJu0Yxpj1T2WCUMo8BbFUV5RiCb4iXk3hiTdTglgTglt+AUXHF31FLF
 ZiqZfI2HdfpcJmh8SrjY/3g7UOvvs8c4uJaFOTxwRnpFLznjlc2aQMTQyFCeXEHqOm3QyAxiAlU
 Q+XLXBE8bLCmTSs1/WaOKGO6Bwlg+fiuUa7LjtajUUEjt8tehDi3wKqgLeQKQqwlG/A==
X-Gm-Gg: ASbGncuzYJL8iTLnXh9DO1Qt9TF/SC9s7Wez0b8j6bVGRdyv3A3qKBXQUXWbhHq8eWS
 m1xK8dUsgWTmZNyuKAppzMxUzrUZzXP0FJI4BFLuyTlsGB+gBujfGdN6wbLkzypH3RdxjwTMrcz
 IB5OP/tM1lwkwP4Uf7L5pVJRdIbuHcASU5S5/dBidkVCsoicCNpvkodRx/V/49+dr3Q+BdlR8aI
 C1AEfuWOx5OuQGiUqCRk4z86TxYnY7CzGddTPOO2gjCT4hESS//2v6y1Plbh30l1fz+0eq5leD9
 v60ozYfmQNVI7G9FokbW6h77VlQPdhIEiWb/DYlfKKvpAZ7ucudzkYM=
X-Received: by 2002:a5d:5848:0:b0:391:49f6:dad4 with SMTP id
 ffacd0b85a97d-39149f6dc65mr7483400f8f.41.1741698511335; 
 Tue, 11 Mar 2025 06:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJUWELXjGJRdPx15Enww8m1fPezTtU1texGxFcbUlmRdorieShJTUZvFsRrJ9v+7M3MEkP8g==
X-Received: by 2002:a5d:5848:0:b0:391:49f6:dad4 with SMTP id
 ffacd0b85a97d-39149f6dc65mr7483317f8f.41.1741698510527; 
 Tue, 11 Mar 2025 06:08:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d025869e7sm29580885e9.7.2025.03.11.06.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:08:29 -0700 (PDT)
Message-ID: <cf2d02cc-9248-4194-bcec-0f8dced54b79@redhat.com>
Date: Tue, 11 Mar 2025 14:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/ast: Remove vram_fb_available from struct
 ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iNtSo1X3bK5dSmIHlIrqgKhHGP415e78bOWXVhpDDSU_1741698511
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
> Helpers compute the offset and size of the available framebuffer
> memory. Remove the obsolete field vram_fb_available from struct
> ast_device. Also define the cursor-signature size next to its only
> user.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> v2:
> - initialize plane size
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 18 ++++--------------
>   drivers/gpu/drm/ast/ast_drv.h    |  4 ----
>   drivers/gpu/drm/ast/ast_mm.c     |  1 -
>   3 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 05e297f30b4e..cb0c48d47207 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -37,6 +37,7 @@
>    */
>   
>   /* define for signature structure */
> +#define AST_HWC_SIGNATURE_SIZE		SZ_32
>   #define AST_HWC_SIGNATURE_CHECKSUM	0x00
>   #define AST_HWC_SIGNATURE_SizeX		0x04
>   #define AST_HWC_SIGNATURE_SizeY		0x08
> @@ -289,25 +290,16 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
>   	struct ast_plane *ast_plane = &ast_cursor_plane->base;
>   	struct drm_plane *cursor_plane = &ast_plane->base;
> -	size_t size;
> +	unsigned long size;
>   	void __iomem *vaddr;
>   	long offset;
>   	int ret;
>   
> -	/*
> -	 * Allocate backing storage for cursors. The BOs are permanently
> -	 * pinned to the top end of the VRAM.
> -	 */
> -
> -	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> -
> -	if (ast->vram_fb_available < size)
> -		return -ENOMEM;
> -
> -	vaddr = ast->vram + ast->vram_fb_available - size;
> +	size = ast_cursor_vram_size();
>   	offset = ast_cursor_vram_offset(ast);
>   	if (offset < 0)
>   		return offset;
> +	vaddr = ast->vram + offset;
>   
>   	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
>   			     0x01, &ast_cursor_plane_funcs,
> @@ -320,7 +312,5 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
>   	drm_plane_enable_fb_damage_clips(cursor_plane);
>   
> -	ast->vram_fb_available -= size;
> -
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ec9ec77260e9..d9da2328d46b 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -112,12 +112,9 @@ enum ast_config_mode {
>   
>   #define AST_MAX_HWC_WIDTH	64
>   #define AST_MAX_HWC_HEIGHT	64
> -
>   #define AST_HWC_PITCH		(AST_MAX_HWC_WIDTH * SZ_2)
>   #define AST_HWC_SIZE		(AST_MAX_HWC_HEIGHT * AST_HWC_PITCH)
>   
> -#define AST_HWC_SIGNATURE_SIZE	32
> -
>   /*
>    * Planes
>    */
> @@ -183,7 +180,6 @@ struct ast_device {
>   	void __iomem	*vram;
>   	unsigned long	vram_base;
>   	unsigned long	vram_size;
> -	unsigned long	vram_fb_available;
>   
>   	struct mutex modeset_lock; /* Protects access to modeset I/O registers in ioregs */
>   
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 3d03ef556d0a..0bc140319464 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -92,7 +92,6 @@ int ast_mm_init(struct ast_device *ast)
>   
>   	ast->vram_base = base;
>   	ast->vram_size = vram_size;
> -	ast->vram_fb_available = vram_size;
>   
>   	return 0;
>   }

