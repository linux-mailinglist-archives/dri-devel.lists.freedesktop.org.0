Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBBC8DA7B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2E210E7FB;
	Thu, 27 Nov 2025 09:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S7EFE9KA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A41C10E7FB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764237377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8HGVPN1pq9pHqURQZmQmG9pKGPUF323uaGwzDIf1x8=;
 b=S7EFE9KA0On8l1pnGJHbIYZ9ZH4TaofprLgIKPIx0d9VAA61xj7R6b9R59VEfB2AR0C4rE
 U/h1eweXQscBDdyYKDwJs3LVbsy90dBx+zDWKOXKc1KOkv9aOnmVRRzH+FsoZQrxovJ22z
 0DfYT53aZe7aRfIAErvsNWICyUVKtO4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-D13e1SjrPcKKmfiJOelagA-1; Thu, 27 Nov 2025 04:56:16 -0500
X-MC-Unique: D13e1SjrPcKKmfiJOelagA-1
X-Mimecast-MFC-AGG-ID: D13e1SjrPcKKmfiJOelagA_1764237375
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b3086a055so540958f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764237375; x=1764842175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+8HGVPN1pq9pHqURQZmQmG9pKGPUF323uaGwzDIf1x8=;
 b=vRy6zPD0qdVbCJrm5OFYM3BzS0lnEPnj8NSaCq5IhUCwGPNN25fLboWAYtXnyR0LZU
 8V40SZIBYB4HN4GSKyFvE9ITHtoTCTnpXwqn+tt56y/o+NXvNoSqBaj8tjWa1RVNO8Kj
 dgy09RNxVU4+jgboDgtJc7yuEYnp34cFYTfqfieg9MSDAfV1pNLFMUzhbAeRFuCGRBiy
 ps7RGa3SDgXwnUCqtvaLKjJwb5mZoCAZG6qUavcGhoFgxfmTHJSAC0tLB8yGhRBZaKNT
 fEJ14OlCXc0VMsYFBI4trXzNJ1l7oEoRZtkWZ9M426a0664PHFDcYUdRTvTOh+xYiHYY
 k5eg==
X-Gm-Message-State: AOJu0YyD0c6RwhC40mCOwGUWRBfcm6fht/oVoTZGSzGY2fMIRVGv/Cdu
 +3UXBE/hi7UmW4V29dUayifNHCNiukuI1OzjcuV6D+2PWSylZelfxj9BpZYhPOLU0xo6Kg3feEH
 k5NBeCkHHEPzn5fIFv98o5B2kEs75Hjo6ROatXb8WgNV0ZE3HU4ZspN+g1PoHDrdZNxh86g==
X-Gm-Gg: ASbGncsVx9tPeUrWvGfFRl8a74ntm/KXipOhHBFR67MZB1JNhsqUh6MtEWMc5ni4ozB
 SGy3M0JQelFBCHcRwiuZL1Gksx4vo3xUBo+VX/KxaT4FTL3atP3tv0143JIlZORX7bfOvsPWMeE
 xkhHbO9dSVerZtcfSOaMU1pCGWxN/mSScREzFyvyjLjx4PlyPqYc7FxTsJpoU5XhgauwkJbzwTq
 zLOAj026TRsNz/5YwH8wqvt0p7trG3sa3Irec4eUcrleFBanwboUFsex+AmJHTuFmm36jOwKJHc
 YsTq15yQqcDK8jXg5tAFNX0rxrYyuYTeC7zMPg000oOSMnmEhGFTASwSMFjch46D8Boj4z8fzOc
 J7WuC8vAA6UoJDe10kgb5nAaIWKnbh1oDCCWSESvQ12CU77LqLg==
X-Received: by 2002:a05:6000:2088:b0:42b:4951:8af3 with SMTP id
 ffacd0b85a97d-42e0f35679fmr10012401f8f.43.1764237374664; 
 Thu, 27 Nov 2025 01:56:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8J2NVQOvkfUQCPkHbleKr3PybuOjoyRCK9AosKdlJvBR3cNeTHk40yFgAAqWFc1Sj6Cls4Q==
X-Received: by 2002:a05:6000:2088:b0:42b:4951:8af3 with SMTP id
 ffacd0b85a97d-42e0f35679fmr10012373f8f.43.1764237374289; 
 Thu, 27 Nov 2025 01:56:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3c81sm2589387f8f.3.2025.11.27.01.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:56:13 -0800 (PST)
Message-ID: <273fb37d-7b83-4b09-938c-d961efd2c42b@redhat.com>
Date: Thu, 27 Nov 2025 10:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/ast: Move cursor format conversion into helper
 function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251126094626.41985-1-tzimmermann@suse.de>
 <20251126094626.41985-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251126094626.41985-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q65EaKugBZfs0t_A9mAr0gxWU4dE6H__SZIcbWsDqMc_1764237375
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
> Move the format conversion of the cursor framebuffer into the new
> helper ast_cursor_plane_get_argb4444(). It returns a buffer in system
> memory, which the atomic_update handler copies to video memory.
> 
> The returned buffer is either the GEM buffer itself, or a temporary
> copy within the plane in ARGB4444 format.
> 
> As a small change, list supported formats explicitly in the switch
> statement. Do not assume ARGB8888 input by default. The cursor
> framebuffer knows its format, so should we.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 62 ++++++++++++++++++++------------
>   1 file changed, 39 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 2d3ad7610c2e..24d696df8fcd 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -181,6 +181,38 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +static const u8 *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_cursor_plane,
> +					       struct drm_shadow_plane_state *shadow_plane_state,
> +					       const struct drm_rect *clip)
> +{
> +	struct drm_plane_state *plane_state = &shadow_plane_state->base;
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	u8 *argb4444 = NULL;
> +
> +	switch (fb->format->format) {
> +	case DRM_FORMAT_ARGB4444:
> +		argb4444 = shadow_plane_state->data[0].vaddr;
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +		{
> +			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
> +			};
> +			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +				AST_HWC_PITCH,
> +			};
> +
> +			drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> +						    shadow_plane_state->data, fb, clip,
> +						    &shadow_plane_state->fmtcnv_state);
> +			argb4444 = argb4444_dst[0].vaddr;
> +		}
> +		break;
> +	}
> +
> +	return argb4444;
> +}
> +
>   static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   						  struct drm_atomic_state *state)
>   {
> @@ -205,29 +237,13 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   	 */
>   
>   	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
> -		u8 *argb4444;
> -
> -		switch (fb->format->format) {
> -		case DRM_FORMAT_ARGB4444:
> -			argb4444 = shadow_plane_state->data[0].vaddr;
> -			break;
> -		default:
> -			argb4444 = ast_cursor_plane->argb4444;
> -			{
> -				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> -					IOSYS_MAP_INIT_VADDR(argb4444),
> -				};
> -				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -					AST_HWC_PITCH,
> -				};
> -
> -				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> -							    shadow_plane_state->data, fb, &damage,
> -							    &shadow_plane_state->fmtcnv_state);
> -			}
> -			break;
> -		}
> -		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
> +		const u8 *argb4444 = ast_cursor_plane_get_argb4444(ast_cursor_plane,
> +								   shadow_plane_state,
> +								   &damage);
> +
> +		if (argb4444)
> +			ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
> +
>   		ast_set_cursor_base(ast, dst_off);
>   	}
>   

