Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E01A35B9E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A7D10EC34;
	Fri, 14 Feb 2025 10:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GpIhi/3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F1610EC46
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739529334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5joxdYtMF7aQwCZez7Z/UXROSj8LtUogrk20vu9m44=;
 b=GpIhi/3zD16KLz7r8P9sa4OvEBQtdeVYDJs5RfMi77TD4KSg09IIkTPbf7hO4S1zxTBJWV
 hb9s3vcqw5FK/vhPemsxpMcaSROyEDBoPRlYTcbYeWRmODixEcvyFApYQZmm3Y1UQztSN3
 c6DLd3PPLlQ51/NJ3Cm8pS/IdzV2r+E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-8y2r-aSqPSCIE507P4pC2Q-1; Fri, 14 Feb 2025 05:35:33 -0500
X-MC-Unique: 8y2r-aSqPSCIE507P4pC2Q-1
X-Mimecast-MFC-AGG-ID: 8y2r-aSqPSCIE507P4pC2Q_1739529332
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38f2726c0faso1524397f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739529332; x=1740134132;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5joxdYtMF7aQwCZez7Z/UXROSj8LtUogrk20vu9m44=;
 b=kaGtQCXlQLlL3Eoo0mBgCr1QnWgLlN4AfHBM7DGsHLZM9GUtfz1AFKkD/0bMZep3Mc
 lpKsytV642AU+hDm7kCRdZThhyVoiiJSItfskhq6LQM2KamtgwzDdnwMKdyTJR2+nbFk
 D9se2egw8d8iM+mxvcLJHXi1SEohEwE8Mt0ojlqRzAwWRFnRGgzDrjwlEL8V/w1KPQlq
 P0TGzaFAW2YNRXfV76wc2Q3kJVSSsx3qmcSukydfaaTrgSLFQ5afMj/IBNeckabUNUV5
 mY22pCpt9nRwBwaFgswSt+FQDVPmMQnVtsAfopGYLb37HwGDn8c2LFkRfrvnjSvV9hix
 uajQ==
X-Gm-Message-State: AOJu0Yxc837A2CCKh9w1QAPMlTuWdIYLxvVwuJKvLVVhFrT29Y3/7Uxu
 8VOLAxGBmN1v9YmfgtdQqGo6AtSwK5Ao5KUfzaX4OcXTdDJ0u0eLOLFhQWA4tEpirRs/8j/STFy
 XdEiaYsyUp1muB85DmIjUb82ASiIVBvg8TGB1ir0jPCcbwOI+XvPdTz98WH6F53DycQ==
X-Gm-Gg: ASbGnctM/UokK/1IwpLFLGiT+24Zk48vNdk25ja1MDJSK2IklPn+kYyX+E11kOeK1+3
 kt0GvYMKJjdPxHWY2yUle6Fy+v6ev/gpW+qonZ/JLQnfPThtA3PLQzVcNOskGLywdFSLTqHueg1
 y94BOBcDUQUnzXbs04GDx6yY1w968tKMaCvUGY0f2qKs+5xSDksK+jb49gCOX9zcDdW0HPlwc3r
 aARW+iPUN357LFnlSCuMyx3PiwH2uU3YAsAxZJK5tE9/bR/YZOQAKHYm4hDwPoKpohp0jsPHD/u
 qYr+t2I2e4we+WztxCxsx+paXXqV7SjfAaaagbRUzqCt
X-Received: by 2002:a5d:6d87:0:b0:38d:af14:cb1 with SMTP id
 ffacd0b85a97d-38f24526885mr10086751f8f.54.1739529332015; 
 Fri, 14 Feb 2025 02:35:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZdQwngilqZTDGNuwx1IVqUO8HUWfybbKcZlh2SosVTXZDplik9RulR9W9DA58HT1rSFdDKg==
X-Received: by 2002:a5d:6d87:0:b0:38d:af14:cb1 with SMTP id
 ffacd0b85a97d-38f24526885mr10086721f8f.54.1739529331580; 
 Fri, 14 Feb 2025 02:35:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439617fca44sm40467895e9.13.2025.02.14.02.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 02:35:31 -0800 (PST)
Message-ID: <9c6beac8-9d2a-41cb-804b-ec21d0d12479@redhat.com>
Date: Fri, 14 Feb 2025 11:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/ast: cursor: Add support for ARGB4444
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250213163845.118207-1-tzimmermann@suse.de>
 <20250213163845.118207-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250213163845.118207-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NPUXP50U3hZ_0GDs6ajGqI7rcCjy9n8KoyqpW9aOEcQ_1739529332
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
> Add support for cursor image data in ARGB4444 format. This is the
> hardware's native format and requires no conversion.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 34 +++++++++++++++++++++++-----------
>   1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ed00275d6418..4beac9cdfe83 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -718,6 +718,7 @@ static void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
>   }
>   
>   static const uint32_t ast_cursor_plane_formats[] = {
> +	DRM_FORMAT_ARGB4444,
>   	DRM_FORMAT_ARGB8888,
>   };
>   
> @@ -769,17 +770,28 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   	 */
>   
>   	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
> -		u8 *argb4444 = ast_cursor_plane->argb4444;
> -		struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> -			IOSYS_MAP_INIT_VADDR(argb4444),
> -		};
> -		unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -			AST_HWC_PITCH,
> -		};
> -
> -		drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> -					    shadow_plane_state->data, fb, &damage,
> -					    &shadow_plane_state->fmtcnv_state);
> +		u8 *argb4444;
> +
> +		switch (fb->format->format) {
> +		case DRM_FORMAT_ARGB4444:
> +			argb4444 = shadow_plane_state->data[0].vaddr;
> +			break;
> +		default:
> +			argb4444 = ast_cursor_plane->argb4444;
> +			{
> +				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +					IOSYS_MAP_INIT_VADDR(argb4444),
> +				};
> +				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +					AST_HWC_PITCH,
> +				};
> +
> +				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> +							    shadow_plane_state->data, fb, &damage,
> +							    &shadow_plane_state->fmtcnv_state);
> +			}
> +			break;
> +		}
>   		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
>   		ast_set_cursor_base(ast, dst_off);
>   	}

