Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7BA6EC0D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8E10E1AF;
	Tue, 25 Mar 2025 09:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UpgnszG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ADA10E1AF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742893285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApFY8c5IhD+7QWcKt0k903fptFlXJy9h67sL6f5ciRw=;
 b=UpgnszG4tTfeXtPRZgVCJmOH/piAlGYiGZtqE674C/EJt6veAeBYM+FMNEiogYyprYYZjh
 jwKnTT7PBBw5Oryh3V/WwNOQdwY18uvqSL/Fu2oNZN19/qRKckyZ0WqF1GD5TyYVQ//dHm
 j1hw+xS8nbbaztpCMG9E7I8sgnLm+OA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-TA_fKOuqPVmiCTQna8cEow-1; Tue, 25 Mar 2025 05:01:23 -0400
X-MC-Unique: TA_fKOuqPVmiCTQna8cEow-1
X-Mimecast-MFC-AGG-ID: TA_fKOuqPVmiCTQna8cEow_1742893282
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-391345e3aa3so2871524f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742893282; x=1743498082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApFY8c5IhD+7QWcKt0k903fptFlXJy9h67sL6f5ciRw=;
 b=cwKynwNHfkhfXa3ma2Mgxk+mUQMMOb17rTrORTts3B/jhXMPG8UwnY6Usb4j7Jgw5r
 kX3tLU38UU37ZSScZtMLttci/8+O8R3suIEryn4WC+Sr59vdEric1n2AJxeYPO3fUxfh
 JfgHeWq/X9p/sqAQNO/oK/ykqrKvuNmSnbLgnhsGoBP6rLz8VRgfcY8ABL0UCNadi7oF
 fRj7A1/684wI/wtJFOn7RpvPS3XUOHSBvLc298aSXmVKk2Cafa1wfmC1jjzkqZ/0Yhpb
 m67OfILiQ+AOOQVARA+yym3d5OkBN9Dt8DzOrrJYgnYGqHUSm1wklGqIgy+mycbv7fGt
 V4ug==
X-Gm-Message-State: AOJu0Yxkww71JhAO+H3yNRhx2wVBBrRkxkwHNkywJGfzUfeIpkZy2u7n
 vlgTkVgQGOMvyfYtpldEGre6qxL9yVrlezdduFdfEPehBsI76WGEc4OMtpHpMx2sslVyARnLizt
 pLYM0C/kJivS4pQjJQ5HY4Fim9cZbGWlMCatbR5NLvPstGqyMeJHFuZlNpDuoz332k7hAleG1aA
 ==
X-Gm-Gg: ASbGncu98J81savlhULg1dEdcYKPYXGCxXWirjif1VE5UNPHUlJjGy7Ga9rl8tgVZjX
 fW2kJgbqmfxjyLLjd3PedQGbR25kQpM3axmIA67oD7N2I7EROJIGF+GcdHMLtMC7bIHcJz43k1J
 anA7H8EJIrGj4g5+mUf9Tu44qF42fy0xIrDtSJ6e2atLyAY3bJsUd9nlzg5sRXHJWfWYQFYQJ+5
 eDCsMWh/bniIR527VjzXGwxS19u7hIrAk5kXIwHeH+1apFTVcWZoscA8ijFuqfeEgcxxISx5Kob
 Jk225A7bQnURxlHvsTvEoMB38vwGv/WWrNuFwe6Ld68xSbnv0nYWPwo=
X-Received: by 2002:a05:6000:21c2:b0:399:6d53:68d9 with SMTP id
 ffacd0b85a97d-3997f939949mr10022245f8f.38.1742893281729; 
 Tue, 25 Mar 2025 02:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMDN8WbxEsoukQHCju+wamOZQANvt8o6jIpNFzvLVuoxbX/cPdVT9V0enIdkt6TYijE1E5+w==
X-Received: by 2002:a05:6000:21c2:b0:399:6d53:68d9 with SMTP id
 ffacd0b85a97d-3997f939949mr10022204f8f.38.1742893281209; 
 Tue, 25 Mar 2025 02:01:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef23esm13060007f8f.81.2025.03.25.02.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:01:20 -0700 (PDT)
Message-ID: <20e5842a-68ce-418d-b0af-76226805c519@redhat.com>
Date: Tue, 25 Mar 2025 10:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ast: Remove vaddr field from struct ast_plane
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250324094520.192974-1-tzimmermann@suse.de>
 <20250324094520.192974-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250324094520.192974-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _hzROLOGcf6xnLQcF7UVErV74lbEAyrvwzBE1qSUmw8_1742893282
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

On 24/03/2025 10:44, Thomas Zimmermann wrote:
> The vaddr field in struct ast_plane serves no purpose. Its value
> can be calculated easily from the VRAM base plus the plane offset.
> Do so and remove the field.
> 
> In ast_primary_plane_helper_get_scanout_buffer(), remove the test
> for vaddr being NULL. This cannot legally happen.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c |  8 +++-----
>   drivers/gpu/drm/ast/ast_drv.h    |  4 ++--
>   drivers/gpu/drm/ast/ast_mode.c   | 19 ++++++++++++-------
>   3 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 5ee724bfd682..2d3ad7610c2e 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -91,7 +91,7 @@ static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, un
>   static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
>   				 unsigned int width, unsigned int height)
>   {
> -	u8 __iomem *dst = ast->cursor_plane.base.vaddr;
> +	u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
>   	u32 csum;
>   
>   	csum = ast_cursor_calculate_checksum(src, width, height);
> @@ -193,7 +193,7 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   	struct ast_device *ast = to_ast_device(plane->dev);
>   	struct drm_rect damage;
>   	u64 dst_off = ast_plane->offset;
> -	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
> +	u8 __iomem *dst = ast_plane_vaddr(ast_plane); /* TODO: Use mapping abstraction properly */
>   	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
>   	unsigned int offset_x, offset_y;
>   	u16 x, y;
> @@ -291,7 +291,6 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	struct ast_plane *ast_plane = &ast_cursor_plane->base;
>   	struct drm_plane *cursor_plane = &ast_plane->base;
>   	unsigned long size;
> -	void __iomem *vaddr;
>   	long offset;
>   	int ret;
>   
> @@ -299,9 +298,8 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	offset = ast_cursor_vram_offset(ast);
>   	if (offset < 0)
>   		return offset;
> -	vaddr = ast->vram + offset;
>   
> -	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
> +	ret = ast_plane_init(dev, ast_plane, offset, size,
>   			     0x01, &ast_cursor_plane_funcs,
>   			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
>   			     NULL, DRM_PLANE_TYPE_CURSOR);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index d9da2328d46b..2ee402096cd9 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -122,7 +122,6 @@ enum ast_config_mode {
>   struct ast_plane {
>   	struct drm_plane base;
>   
> -	void __iomem *vaddr;
>   	u64 offset;
>   	unsigned long size;
>   };
> @@ -443,11 +442,12 @@ int ast_astdp_output_init(struct ast_device *ast);
>   /* ast_mode.c */
>   int ast_mode_config_init(struct ast_device *ast);
>   int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
> -		   void __iomem *vaddr, u64 offset, unsigned long size,
> +		   u64 offset, unsigned long size,
>   		   uint32_t possible_crtcs,
>   		   const struct drm_plane_funcs *funcs,
>   		   const uint32_t *formats, unsigned int format_count,
>   		   const uint64_t *format_modifiers,
>   		   enum drm_plane_type type);
> +void __iomem *ast_plane_vaddr(struct ast_plane *ast);
>   
>   #endif
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 20fbea11b710..d3ed27faefd1 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -457,7 +457,7 @@ static void ast_wait_for_vretrace(struct ast_device *ast)
>    */
>   
>   int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
> -		   void __iomem *vaddr, u64 offset, unsigned long size,
> +		   u64 offset, unsigned long size,
>   		   uint32_t possible_crtcs,
>   		   const struct drm_plane_funcs *funcs,
>   		   const uint32_t *formats, unsigned int format_count,
> @@ -466,7 +466,6 @@ int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
>   {
>   	struct drm_plane *plane = &ast_plane->base;
>   
> -	ast_plane->vaddr = vaddr;
>   	ast_plane->offset = offset;
>   	ast_plane->size = size;
>   
> @@ -475,6 +474,13 @@ int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
>   					type, NULL);
>   }
>   
> +void __iomem *ast_plane_vaddr(struct ast_plane *ast_plane)
> +{
> +	struct ast_device *ast = to_ast_device(ast_plane->base.dev);
> +
> +	return ast->vram + ast_plane->offset;
> +}
> +
>   /*
>    * Primary plane
>    */
> @@ -521,7 +527,7 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
>   			      struct drm_framebuffer *fb,
>   			      const struct drm_rect *clip)
>   {
> -	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->vaddr);
> +	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
>   	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> @@ -594,12 +600,12 @@ static int ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
>   {
>   	struct ast_plane *ast_plane = to_ast_plane(plane);
>   
> -	if (plane->state && plane->state->fb && ast_plane->vaddr) {
> +	if (plane->state && plane->state->fb) {
>   		sb->format = plane->state->fb->format;
>   		sb->width = plane->state->fb->width;
>   		sb->height = plane->state->fb->height;
>   		sb->pitch[0] = plane->state->fb->pitches[0];
> -		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->vaddr);
> +		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane_vaddr(ast_plane));
>   		return 0;
>   	}
>   	return -ENODEV;
> @@ -626,12 +632,11 @@ static int ast_primary_plane_init(struct ast_device *ast)
>   	struct drm_device *dev = &ast->base;
>   	struct ast_plane *ast_primary_plane = &ast->primary_plane;
>   	struct drm_plane *primary_plane = &ast_primary_plane->base;
> -	void __iomem *vaddr = ast->vram;
>   	u64 offset = ast_fb_vram_offset();
>   	unsigned long size = ast_fb_vram_size(ast);
>   	int ret;
>   
> -	ret = ast_plane_init(dev, ast_primary_plane, vaddr, offset, size,
> +	ret = ast_plane_init(dev, ast_primary_plane, offset, size,
>   			     0x01, &ast_primary_plane_funcs,
>   			     ast_primary_plane_formats, ARRAY_SIZE(ast_primary_plane_formats),
>   			     NULL, DRM_PLANE_TYPE_PRIMARY);

