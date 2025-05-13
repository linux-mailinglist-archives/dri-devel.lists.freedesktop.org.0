Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0229AB54BE
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 14:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2043910E59D;
	Tue, 13 May 2025 12:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KV1IbcjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E748910E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747139205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNARTtobgW/nKcSBtWFhlRPb5k6mR6RG9+xLQ3z/lAw=;
 b=KV1IbcjLXZ2l6WWPeWjcsoOjtO2NLP92/qdHiUydzKBr6yANxUTeDKAeA94tA3AXlOmqI1
 enQnjza+i3qVk4N89aH8VeoZsgAmUvWAayu+7U6O8HAlDHEU11k+Vm2AP1MJWge84caMBT
 hpg/Opq/nLUPfb+hw+7qOsQfkgk2CI4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-6-wfYoLtMGm2VhSjR4yh4A-1; Tue, 13 May 2025 08:26:41 -0400
X-MC-Unique: 6-wfYoLtMGm2VhSjR4yh4A-1
X-Mimecast-MFC-AGG-ID: 6-wfYoLtMGm2VhSjR4yh4A_1747139201
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so34325175e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 05:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747139201; x=1747744001;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rNARTtobgW/nKcSBtWFhlRPb5k6mR6RG9+xLQ3z/lAw=;
 b=MESzMQ4qxQTw0sRoKBB6Ogof3KIDkZ3PHucH6MHZlK0uDKA87rdUgTDNa6aCRRze8C
 LoE5oDAXBceX8U8nsLP29jRkP7CtldKJ3bwsMu6o6JTBznMAtQuR4VpRJGsHTU2/BbtO
 7WlErj68mqtroAbhg5pPzRIldfcgBaZFNyuIq1nomJNPvteJG+mjNki5QGCr6PaoW+aZ
 YOwJdInxJK3FmeZ3hul4JNQp0tQLbSM7vPld4Ah8UZEXuGJzU5mcNpuyXbhbz7Mf+xzZ
 GxlvoplYp9qaXzjzJQwJkpd5zgyhIgLXAAGcF/Q1S6LoRfBC3NvDHrtkO6DZe/6cy5U0
 houQ==
X-Gm-Message-State: AOJu0Yy3seSEaMEeuczYETIBY09MyqEq/E7Wf7rSY7z1JzRfH4JMvX0K
 3iNrZuzfRRMQXgK5RmPfqEXgRlwTAcoXCjv3l6KKYcBbsPT7VY18xWcgr2xgZhM9bxiowa01JG1
 OTv7ommChhIlr+upT2+MUGxTKLyVqFJH4F8XjhqgE7pHpmKtZs4nfAYpYx3WyAh1iIg==
X-Gm-Gg: ASbGnctZQs+ZgLEwkxsn6Rj0LKUVyl+Mrlu4rCocB5e8UxX/aSk3dkb3Ly9bEvBJt0A
 A7Dyc0GfvUSdIU9IjEfud/6niQjvr4ZM2wr7zQfkyKAL+f78zu4KQK9M3NkWDTuOveFlkETQDZ+
 vU94CHQfp2X5apF5b6S3994VBe0ChqoOlfnLIgkb0fen9hmP0PzndPfBmSXLeFBJsow5BJqe18y
 rhMyzy6Te3pI1KHjb02+wMnHX6kFvMLQBxNYISGGv7g7l47s0l96qbnBqVFxbMWgqw9NBWYHBvr
 pqLlvwRIEkExABvIdAG8rvFRajz/QA4CoUBvrTFzU0xUQpgZMFI=
X-Received: by 2002:a05:600c:3482:b0:43d:7588:6688 with SMTP id
 5b1f17b1804b1-442d6d1fb46mr166145455e9.12.1747139200626; 
 Tue, 13 May 2025 05:26:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgkNMIO7u9L7xoeyiNlBwRR8BhpV+5WwNROWNgnaeJpT7h51HR8iDwJNyWDafIBqPZPWmDTA==
X-Received: by 2002:a05:600c:3482:b0:43d:7588:6688 with SMTP id
 5b1f17b1804b1-442d6d1fb46mr166145155e9.12.1747139200195; 
 Tue, 13 May 2025 05:26:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7c89sm206151735e9.38.2025.05.13.05.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 05:26:39 -0700 (PDT)
Message-ID: <a65716c5-e200-4fa4-a9f9-c1f8efadf291@redhat.com>
Date: Tue, 13 May 2025 14:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/ast: Use helpers for programming gamma ramps and
 palettes
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250509083911.39018-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YvLplXISIoZP3PFX4R-Ymn8X1Q5RadO3awtzBsr3m3I_1747139201
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

On 09/05/2025 10:23, Thomas Zimmermann wrote:
> Replace ast's code for programming the hardware gamma/palette LUT
> with DRM helpers. Either load provided data or program a default.
> Set the individual entries with a callback.
> 
> Each gamma/palette value is given as 3 individual 16-bit values
> for red, green and blue. The driver reduces them to 8 bit to make
> them fit into hardware registers.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 69 +++++++++++++++++++++-------------
>   1 file changed, 42 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 1de832964e92..7908087bcb5a 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -34,6 +34,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_color_mgmt.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_format_helper.h>
> @@ -71,31 +72,44 @@ static unsigned long ast_fb_vram_size(struct ast_device *ast)
>   	return cursor_offset - offset;
>   }
>   
> -static inline void ast_load_palette_index(struct ast_device *ast,
> -				     u8 index, u8 red, u8 green,
> -				     u8 blue)
> +static void ast_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
> +			      u16 red, u16 green, u16 blue)
>   {
> -	ast_io_write8(ast, AST_IO_VGADWR, index);
> +	struct drm_device *dev = crtc->dev;
> +	struct ast_device *ast = to_ast_device(dev);
> +	u8 i8 = index & 0xff;
> +	u8 r8 = red >> 8;
> +	u8 g8 = green >> 8;
> +	u8 b8 = blue >> 8;
> +
> +	if (drm_WARN_ON_ONCE(dev, index != i8))
> +		return; /* driver bug */
> +
> +	ast_io_write8(ast, AST_IO_VGADWR, i8);
>   	ast_io_read8(ast, AST_IO_VGASRI);
> -	ast_io_write8(ast, AST_IO_VGAPDR, red);
> +	ast_io_write8(ast, AST_IO_VGAPDR, r8);
>   	ast_io_read8(ast, AST_IO_VGASRI);
> -	ast_io_write8(ast, AST_IO_VGAPDR, green);
> +	ast_io_write8(ast, AST_IO_VGAPDR, g8);
>   	ast_io_read8(ast, AST_IO_VGASRI);
> -	ast_io_write8(ast, AST_IO_VGAPDR, blue);
> +	ast_io_write8(ast, AST_IO_VGAPDR, b8);
>   	ast_io_read8(ast, AST_IO_VGASRI);
>   }
>   
> -static void ast_crtc_set_gamma_linear(struct ast_device *ast,
> -				      const struct drm_format_info *format)
> +static void ast_crtc_fill_gamma(struct ast_device *ast,
> +				const struct drm_format_info *format)
>   {
> -	int i;
> +	struct drm_crtc *crtc = &ast->crtc;
>   
>   	switch (format->format) {
> -	case DRM_FORMAT_C8: /* In this case, gamma table is used as color palette */
> +	case DRM_FORMAT_C8:
> +		/* gamma table is used as color palette */
> +		drm_crtc_fill_palette_8(crtc, ast_set_gamma_lut);
> +		break;
>   	case DRM_FORMAT_RGB565:
> +		/* also uses 8-bit gamma ramp on low-color modes */
> +		fallthrough;
>   	case DRM_FORMAT_XRGB8888:
> -		for (i = 0; i < AST_LUT_SIZE; i++)
> -			ast_load_palette_index(ast, i, i, i, i);
> +		drm_crtc_fill_gamma_888(crtc, ast_set_gamma_lut);
>   		break;
>   	default:
>   		drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma correction\n",
> @@ -104,21 +118,22 @@ static void ast_crtc_set_gamma_linear(struct ast_device *ast,
>   	}
>   }
>   
> -static void ast_crtc_set_gamma(struct ast_device *ast,
> -			       const struct drm_format_info *format,
> -			       struct drm_color_lut *lut)
> +static void ast_crtc_load_gamma(struct ast_device *ast,
> +				const struct drm_format_info *format,
> +				struct drm_color_lut *lut)
>   {
> -	int i;
> +	struct drm_crtc *crtc = &ast->crtc;
>   
>   	switch (format->format) {
> -	case DRM_FORMAT_C8: /* In this case, gamma table is used as color palette */
> +	case DRM_FORMAT_C8:
> +		/* gamma table is used as color palette */
> +		drm_crtc_load_palette_8(crtc, lut, ast_set_gamma_lut);
> +		break;
>   	case DRM_FORMAT_RGB565:
> +		/* also uses 8-bit gamma ramp on low-color modes */
> +		fallthrough;
>   	case DRM_FORMAT_XRGB8888:
> -		for (i = 0; i < AST_LUT_SIZE; i++)
> -			ast_load_palette_index(ast, i,
> -					       lut[i].red >> 8,
> -					       lut[i].green >> 8,
> -					       lut[i].blue >> 8);
> +		drm_crtc_load_gamma_888(crtc, lut, ast_set_gamma_lut);
>   		break;
>   	default:
>   		drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma correction\n",
> @@ -811,11 +826,11 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   	 */
>   	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
>   		if (crtc_state->gamma_lut)
> -			ast_crtc_set_gamma(ast,
> -					   ast_crtc_state->format,
> -					   crtc_state->gamma_lut->data);
> +			ast_crtc_load_gamma(ast,
> +					    ast_crtc_state->format,
> +					    crtc_state->gamma_lut->data);
>   		else
> -			ast_crtc_set_gamma_linear(ast, ast_crtc_state->format);
> +			ast_crtc_fill_gamma(ast, ast_crtc_state->format);
>   	}
>   }
>   

