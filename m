Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0093C8DA84
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05C10E800;
	Thu, 27 Nov 2025 09:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G6vmevAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9137F10E800
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764237414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRo3s0DbnlaPLrjEqeOfw+V0UJq9zaAxJWQAlQ41rmM=;
 b=G6vmevAtZFa65TgclKJkLOin0Rf7VVuDHhC1KiMElvqxFNC4yY4Y9xZnwoayDp4AK6inyg
 vn46spfr/jwNfdtipgc1vQeolhmGyKaKOEV0D7RAaQ/53SWPx7lQKMOyNt08kuezxeFkU8
 wNyBBlsaKg2jRiSkstv9oVo6baLeNx4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-5t4ReJ2_OimAr0jZAhaeIw-1; Thu, 27 Nov 2025 04:56:52 -0500
X-MC-Unique: 5t4ReJ2_OimAr0jZAhaeIw-1
X-Mimecast-MFC-AGG-ID: 5t4ReJ2_OimAr0jZAhaeIw_1764237411
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b3b5ed793so433754f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764237411; x=1764842211;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dRo3s0DbnlaPLrjEqeOfw+V0UJq9zaAxJWQAlQ41rmM=;
 b=NKuLk1FjYA67+/f+BaUnMbYhSA8r980XfH/qPRMLVuO3up+h3tYvsbPYeoObOhGQmW
 i379J/++bmjxaVclcZtrDGMKc5+2oetNLbSsTa/eIRUI29yvRr+OwK5li7V++2faSrbB
 9fSVNKWmTyvqy/vVaz24WnDmxPufBcX3b69yDIduzFdgiy31sia39G2bxrJyMXMLHI4e
 YoB+mnNKnF/6OvHeltYiXlBKmb4s3pJS1iyZ5LzFLLonZ7CGkEwH4StSrxF1rpSCRlpL
 KTQMPYifnBG6Be5mhIQxOWD3d/RgQUcyjV7jW31GW0lVRDOlLkdwTo7JWyjKdhXKKMw3
 5TtQ==
X-Gm-Message-State: AOJu0Yy5tI5FOM9KmM+C+RwfDS3mijJWSffjtFIR4PVC6c35rF/UMEhX
 iQZpAsDKVb41XbpSoR2hV5jbtQPjGrwSBvFnvpwmFuyLB7moywLaU5PN7FbLGs9FvPFpSrVuW0t
 tOg6lbrScLvl7CC5tFdXY5foqIyupwi+2FtzYZWvqTYei1mq8m3ghu2tBC5LaGPmWja1mew==
X-Gm-Gg: ASbGncuW3NbnElQXvy8OsU8K554SIZJNY0C8xXhvlLAdT+tgYpaMoCb1iFTftCZGzou
 rbdiW52yBO1xWRZHW2EB6tcVe06x+A38Kq5066DpQXzKKwe+0/2d0Zjg4yxZASCkVYDJ8vWbKae
 BoVRU+mxbv0FuhVYVdQUzMz3tpNSij62r7hLJbVz+TZUpslChASVIHkferse5fza2/1iYU2bzpJ
 /0mZyl0q0bvhGqIGZfU6is5vaAyMdVVdiIjE47vWAsDTfOgN8XkcwwYnHU514Die2suIsz146pV
 Mgod6SQ6joDNxA8mcWYfKTfa61igevg4R6AWVFFltTxRSKQHdp0jRC3PrZbsXIfeASE6oISjxlQ
 ATj/D2qg5UBEy+/NacJXaU33TR7Oj6pv4iwdKQXiUPP6geWBelw==
X-Received: by 2002:a5d:64c3:0:b0:42b:3d9d:c605 with SMTP id
 ffacd0b85a97d-42cc1d22933mr25094109f8f.49.1764237410989; 
 Thu, 27 Nov 2025 01:56:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoBIJ/Tw4sXmPi/x788jTi/VpYzuMlws5/kRz4aqsXrinwBaZAsLIyozmNPA5Yy1s3oBwaZg==
X-Received: by 2002:a5d:64c3:0:b0:42b:3d9d:c605 with SMTP id
 ffacd0b85a97d-42cc1d22933mr25094078f8f.49.1764237410557; 
 Thu, 27 Nov 2025 01:56:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5168acsm2527446f8f.0.2025.11.27.01.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:56:50 -0800 (PST)
Message-ID: <1a82ef58-1a8a-498b-989f-e97e6b4335c4@redhat.com>
Date: Thu, 27 Nov 2025 10:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ast: Wrap cursor framebuffer access in
 drm_gem_fb_begin/end_cpu_access()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251126094626.41985-1-tzimmermann@suse.de>
 <20251126094626.41985-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251126094626.41985-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RbRVrCIbNyEqQJcY2-1myo2LA_B8WO6ZXxFqNfkeZAo_1764237411
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

On 26/11/2025 10:40, Thomas Zimmermann wrote:
> Call drm_gem_fb_begin_cpu_access() and drm_gem_fb_end_cpu_access()
> around cursor image updates. Imported buffers might have to be
> synchronized for CPU access before they can be used.
> 
> Ignore errors from drm_gem_fb_begin_cpu_access(). These errors can
> often be transitory. The cursor image will be updated on the next
> frame. Meanwhile display a white square where the cursor would be.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 74 +++++++++++++++++++-------------
>   1 file changed, 43 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 8d473ed2738c..30b62d3f0151 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -28,6 +28,7 @@
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_format_helper.h>
>   #include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_print.h>
>   
>   #include "ast_drv.h"
> @@ -189,38 +190,49 @@ static const u8 *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_curs
>   	struct drm_framebuffer *fb = plane_state->fb;
>   	u8 *argb4444 = NULL;
>   
> -	switch (fb->format->format) {
> -	case DRM_FORMAT_ARGB4444:
> -		if (shadow_plane_state->data[0].is_iomem) {
> -			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> -				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> -			};
> -			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -				AST_HWC_PITCH,
> -			};
> -
> -			drm_fb_memcpy(argb4444_dst, argb4444_dst_pitch,
> -				      shadow_plane_state->data, fb, clip);
> -			argb4444 = argb4444_dst[0].vaddr;
> -		} else {
> -			argb4444 = shadow_plane_state->data[0].vaddr;
> +	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
> +		switch (fb->format->format) {
> +		case DRM_FORMAT_ARGB4444:
> +			if (shadow_plane_state->data[0].is_iomem) {
> +				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +					IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> +				};
> +				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +					AST_HWC_PITCH,
> +				};
> +
> +				drm_fb_memcpy(argb4444_dst, argb4444_dst_pitch,
> +					      shadow_plane_state->data, fb, clip);
> +				argb4444 = argb4444_dst[0].vaddr;
> +			} else {
> +				argb4444 = shadow_plane_state->data[0].vaddr;
> +			}
> +			break;
> +		case DRM_FORMAT_ARGB8888:
> +			{
> +				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +					IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> +				};
> +				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +					AST_HWC_PITCH,
> +				};
> +
> +				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> +							    shadow_plane_state->data, fb, clip,
> +							    &shadow_plane_state->fmtcnv_state);
> +				argb4444 = argb4444_dst[0].vaddr;
> +			}
> +			break;
>   		}
> -		break;
> -	case DRM_FORMAT_ARGB8888:
> -		{
> -			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> -				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> -			};
> -			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -				AST_HWC_PITCH,
> -			};
> -
> -			drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> -						    shadow_plane_state->data, fb, clip,
> -						    &shadow_plane_state->fmtcnv_state);
> -			argb4444 = argb4444_dst[0].vaddr;
> -		}
> -		break;
> +
> +		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +	} else {
> +		/*
> +		 * Fall back to white square if GEM object is not ready. Gives
> +		 * the user an indication where the cursor is located.
> +		 */
> +		memset(ast_cursor_plane->argb4444, 0xff, sizeof(ast_cursor_plane->argb4444));
> +		argb4444 = ast_cursor_plane->argb4444;
>   	}
>   
>   	return argb4444;

