Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56093A35B98
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2412210E299;
	Fri, 14 Feb 2025 10:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iVBgf8lN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC3E10E299
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739528957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33pL7gvdHeim6dYrr6Zhol9GrkA+AS01dFAeHOSTurs=;
 b=iVBgf8lND7PsZlJO0l3uDVPNY+BerljMbyyMUN3IFQXxiKSL7z3moTd3bVhTzCrqkEE/ck
 JHvjJ9KkvAYC0Ya26Qg/Gl5hrq5sfJSjF+7mbwl1q5L4ZDHc7dPcEOQlQFEvM5PWD/xCaP
 ZuMKSjFBJ92tbfzCu5paR3ewKWqmYQ4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-kbVy61AwNESA8fx45QZ74Q-1; Fri, 14 Feb 2025 05:29:16 -0500
X-MC-Unique: kbVy61AwNESA8fx45QZ74Q-1
X-Mimecast-MFC-AGG-ID: kbVy61AwNESA8fx45QZ74Q_1739528955
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43941ad86d4so13050855e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739528955; x=1740133755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33pL7gvdHeim6dYrr6Zhol9GrkA+AS01dFAeHOSTurs=;
 b=cGXZptgih6uhA75TImLa9GaS5km5BzRptclVgWqvmuI2WymyWuEP4gTA277dgGXOgt
 wvtI7abohXHtE/sijXtey+dfMqFq8glRtsQV7eK2Ftd4cLKGU91+ekgSFvmSZ4UY+Mh1
 nrbNYfBNCWdfi4nInJPfjiAvsQniuf2SPA/FgRZ0o+Xp4GmIu3FH8x3Xd3kIYi7lWPg/
 N88wePuLwGxJpiLAG15LYm/s5TU3OFzR/rp6zCjPcWWgDKY5hmV3n4ej98e3ZIG1c9Qo
 uMJe8M4zxTgUKr8dAVT6Uem3fJUxj8G0pT9Vfw7DcBkyAhBhr0eZv9E5ZQa2q0MCsxpt
 oe3w==
X-Gm-Message-State: AOJu0YyE+UVxvfC/LfaRSLR94O6c39pHFlYhBYTH2Ozi7ZP/OwX7YxJu
 qrn2XEmquLOS7WX4FtZej9a/Z31RxA5mKZlDc8MfoO9WFFKcJb+L9VMlb3KbkbnSYxB9EyUKXts
 eqCChIm9aA7Krj0d09yuOAjWDmczCi6IFImTISXqP8B7PCYSNoteL67GeOcn2AVgU1w==
X-Gm-Gg: ASbGncuJPAa7cQDnbVmkGSgFdKKqDLPhqjXSM+4FdCEV4E2NzRpe8fxS+1vnY/Po3do
 7QX466peWDLlb/NTcdjEX2XVTVq6z1FH1YelbVmY/WeDALnTvZsz/FWS3yA+jsUmlr88XdbrMPF
 SCnoxu2KHZDntiAkFrjNBvWPNhwT8yRMxRA/D35t2XqoFNMDw+lk2jpUj0uD88af8mLw5OC8K+8
 iKRLJVLAsiTruJPxsh4dKTXEnNJvepml0cThev22hWEhjLgpIH07PTXOI02upjxvbEMqf8SLCYw
 u7bGXjrxveaop0bzDWn1kjt7vews+9ILv24ogkYhTPmk
X-Received: by 2002:a05:600c:1d19:b0:439:6741:ed98 with SMTP id
 5b1f17b1804b1-4396741f0a0mr38289005e9.0.1739528954988; 
 Fri, 14 Feb 2025 02:29:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxnKoLKFnTphhwynpOS41MLWn/WoRAv8e1uW6v7afTpkMvxICTPYPrcc+bER21D+bUQVLiBQ==
X-Received: by 2002:a05:600c:1d19:b0:439:6741:ed98 with SMTP id
 5b1f17b1804b1-4396741f0a0mr38288565e9.0.1739528954464; 
 Fri, 14 Feb 2025 02:29:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439618a98cesm40235745e9.37.2025.02.14.02.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 02:29:13 -0800 (PST)
Message-ID: <bf766c76-4cf9-4ea8-8795-15b7065a1871@redhat.com>
Date: Fri, 14 Feb 2025 11:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/ast: cursor: Calculate checksum in helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250213163845.118207-1-tzimmermann@suse.de>
 <20250213163845.118207-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250213163845.118207-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hGPTTsnbSkmaJio5Q3dD7Zi0PLtStmJ18jUyWkx5GDs_1739528955
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

On 13/02/2025 17:25, Thomas Zimmermann wrote:
> Setting the cursor image requires a 32-bit checksum of the cursor
> image data. The current cursor code converts the image to ARGB4444
> format and computes the checksum in a single step. Moving the
> checksum calculation into a separate helepr will allow to move the
typo: helper
> format conversion into a shared helper.


Thanks, I've only one remark below, but you can keep it as-is if you prefer.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  | 13 +++++++-
>   drivers/gpu/drm/ast/ast_mode.c | 57 +++++++++++++++++++++++++---------
>   2 files changed, 55 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 022a8c070c1b..d3115b31b032 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -142,6 +142,17 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
>   	return container_of(plane, struct ast_plane, base);
>   }
>   
> +struct ast_cursor_plane {
> +	struct ast_plane base;
> +
> +	u8 argb4444[AST_HWC_SIZE];
> +};
> +
> +static inline struct ast_cursor_plane *to_ast_cursor_plane(struct drm_plane *plane)
> +{
> +	return container_of(to_ast_plane(plane), struct ast_cursor_plane, base);
> +}
> +
>   /*
>    * Connector
>    */
> @@ -186,7 +197,7 @@ struct ast_device {
>   	enum ast_tx_chip tx_chip;
>   
>   	struct ast_plane primary_plane;
> -	struct ast_plane cursor_plane;
> +	struct ast_cursor_plane cursor_plane;
>   	struct drm_crtc crtc;
>   	union {
>   		struct {
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index bd781293b6d9..974f4eb46bc3 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -632,7 +632,32 @@ static int ast_primary_plane_init(struct ast_device *ast)
>    * Cursor plane
>    */
>   
> -static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int height)
> +static u32 ast_cursor_calculate_checksum(const u8 *src, unsigned int width, unsigned int height)
> +{
> +	u32 csum = 0;
> +	unsigned int i, j;
> +	unsigned int one_pixel_copy = width & BIT(0);
> +	unsigned int two_pixel_copy = width - one_pixel_copy;
> +	unsigned int trailing_bytes = (AST_MAX_HWC_WIDTH - width) * sizeof(u16);
> +
> +	for (j = 0; j < height; j++) {
> +		for (i = 0; i < two_pixel_copy; i += 2, src += SZ_4) {
> +			const u32 *src32 = (const u32 *)src;
> +
> +			csum += *src32;
> +		}
> +		for (i = 0; i < one_pixel_copy; i++, src += SZ_2) {
This for loop can run only 0 or 1 time, so I would prefer an "if" instead.

> +			const u16 *src16 = (const u16 *)src;
> +
> +			csum += *src16;
> +		}
> +		src += trailing_bytes;
> +	}
> +
> +	return csum;
> +}
> +
> +static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, u8 *tmp, int width, int height)
>   {
>   	union {
>   		u32 ul;
> @@ -644,7 +669,7 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
>   	} data16;
>   	u32 csum = 0;
>   	s32 alpha_dst_delta, last_alpha_dst_delta;
> -	u8 __iomem *dstxor;
> +	u8 *dstxor;
>   	const u8 *srcxor;
>   	int i, j;
>   	u32 per_pixel_copy, two_pixel_copy;
> @@ -653,7 +678,7 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
>   	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
>   
>   	srcxor = src;
> -	dstxor = (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
> +	dstxor = tmp + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
>   	per_pixel_copy = width & 1;
>   	two_pixel_copy = width >> 1;
>   
> @@ -665,21 +690,17 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
>   			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>   			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
>   			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
> -
> -			writel(data32.ul, dstxor);
> -			csum += data32.ul;
> +			memcpy(dstxor, &data32, 4);
>   
>   			dstxor += 4;
>   			srcxor += 8;
> -
>   		}
>   
>   		for (i = 0; i < per_pixel_copy; i++) {
>   			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
>   			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>   			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
> -			writew(data16.us, dstxor);
> -			csum += (u32)data16.us;
> +			memcpy(dstxor, &data16, 2);
>   
>   			dstxor += 2;
>   			srcxor += 4;
> @@ -687,6 +708,11 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
>   		dstxor += last_alpha_dst_delta;
>   	}
>   
> +	csum = ast_cursor_calculate_checksum(tmp, width, height);
> +
> +	/* write pixel data */
> +	memcpy_toio(dst, tmp, AST_HWC_SIZE);
> +
>   	/* write checksum + signature */
>   	dst += AST_HWC_SIZE;
>   	writel(csum, dst);
> @@ -767,6 +793,7 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
>   static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   						  struct drm_atomic_state *state)
>   {
> +	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
>   	struct ast_plane *ast_plane = to_ast_plane(plane);
>   	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> @@ -789,7 +816,8 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   	 */
>   
>   	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
> -		ast_update_cursor_image(dst, src, fb->width, fb->height);
> +		ast_update_cursor_image(dst, src, ast_cursor_plane->argb4444,
> +					fb->width, fb->height);
>   		ast_set_cursor_base(ast, dst_off);
>   	}
>   
> @@ -849,8 +877,9 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
>   static int ast_cursor_plane_init(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
> -	struct ast_plane *ast_cursor_plane = &ast->cursor_plane;
> -	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
> +	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
> +	struct ast_plane *ast_plane = &ast_cursor_plane->base;
> +	struct drm_plane *cursor_plane = &ast_plane->base;
>   	size_t size;
>   	void __iomem *vaddr;
>   	u64 offset;
> @@ -869,7 +898,7 @@ static int ast_cursor_plane_init(struct ast_device *ast)
>   	vaddr = ast->vram + ast->vram_fb_available - size;
>   	offset = ast->vram_fb_available - size;
>   
> -	ret = ast_plane_init(dev, ast_cursor_plane, vaddr, offset, size,
> +	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
>   			     0x01, &ast_cursor_plane_funcs,
>   			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
>   			     NULL, DRM_PLANE_TYPE_CURSOR);
> @@ -1156,7 +1185,7 @@ static int ast_crtc_init(struct ast_device *ast)
>   	int ret;
>   
>   	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane.base,
> -					&ast->cursor_plane.base, &ast_crtc_funcs,
> +					&ast->cursor_plane.base.base, &ast_crtc_funcs,
>   					NULL);
>   	if (ret)
>   		return ret;

