Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11701965344
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 01:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67E310E7A9;
	Thu, 29 Aug 2024 23:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Qw0IKr7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2854D10E7A9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 23:08:46 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7cd8d2731d1so796130a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 16:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724972925; x=1725577725;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HgVDj+jfQTykac+tyDyMarRYMWlwS6Q2qsgwnJuZfh0=;
 b=Qw0IKr7Bhab8DCyI4HPutCtnWB8zHLMw1WUdf0OVvnjQxKbjk9VAzNrc6Z3B651fR3
 k77FwKhw8fHyn4k75lzEbC9jp79ZNQEKzmV7PJvpg4XSFP9bJD7vlukh28+2UTaEvdDP
 PSpNfz6CJZOr3gLIvSa7XnfJ8CwJBvcr1qWzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724972925; x=1725577725;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HgVDj+jfQTykac+tyDyMarRYMWlwS6Q2qsgwnJuZfh0=;
 b=XNnd6r3DLPT8zFTrUksZcAj6D9u1ueyp0q8fpUpx30W0vLSCkG0RVNdLIdaWKE/8gg
 9p5pw1c3vGGRfB5lEiiwhzm+jh9QIJ1A5oPog0sZj3/kC/tj2Xa28qeLlCOG7J8Nk7Ft
 LNQrKJgxMh27QWSsegvm+yJExTMzfX6UFKW5Yb99F9RSm5n/zY2wdLZUtM1NH1j/Y00Y
 repNaeJSCaCTZ3LD1BatONv4xbD6Bj2Z7gj5G1IUcY8Ml46hD5sZmxDScayCK2Buigf2
 EB/td861sNRmATI4xD+bONG37JHloS7jhXO00qNOkoIGPkBBUGDYV6ugzL02K154v+4q
 FcuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjEqDxioNQc8Z6XocIYXtRnl0jlhGLBsHC91d7WK5wFXnMepvehlhz6QtU75IVfdqoXHYRKWsSNu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz70vZ81UZR5nVrQA9CAgrbTX3i/FRXJP5AEDWNmQ2Dh8lruGVA
 Pag05vsbLSn2R4BVp9sWKHMPQwxWDIqZrkQBz+zNhp7kSoVN7KMaZWoS/t0QiQ==
X-Google-Smtp-Source: AGHT+IHx0S+q6RNjDk9ZvBL2wqUSFukR2NjucZxBJM3TzlabNfu6Puq9dgskFALAl15H42KIm5Whaw==
X-Received: by 2002:a17:90b:1a8a:b0:2c3:2557:3de8 with SMTP id
 98e67ed59e1d1-2d8564a29d3mr4791127a91.33.1724972925314; 
 Thu, 29 Aug 2024 16:08:45 -0700 (PDT)
Received: from [10.211.103.201] ([216.221.25.35])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d85b39d90csm2275967a91.38.2024.08.29.16.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 16:08:44 -0700 (PDT)
Message-ID: <1ab03e92-9b3d-45a8-8561-d0b527d6d4a7@broadcom.com>
Date: Thu, 29 Aug 2024 16:08:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vmwgfx: Cleanup kms setup without 3d
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, stable@vger.kernel.org
References: <20240827043905.472825-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240827043905.472825-1-zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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

On 8/26/24 21:39, Zack Rusin wrote:
> Do not validate format equality for the non 3d cases to allow xrgb to
> argb copies and make sure the dx binding flags are only used
> on dx compatible surfaces.
> 
> Fixes basic 2d kms setup on configurations without 3d. There's little
> practical benefit to it because kms framebuffer coherence is disabled
> on configurations without 3d but with those changes the code actually
> makes sense.
> 
> v2: Remove the now unused format variable
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.9+
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 29 -------------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  9 +++++---
>  2 files changed, 6 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 288ed0bb75cb..282b6153bcdd 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1283,7 +1283,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
>  {
>  	struct drm_device *dev = &dev_priv->drm;
>  	struct vmw_framebuffer_surface *vfbs;
> -	enum SVGA3dSurfaceFormat format;
>  	struct vmw_surface *surface;
>  	int ret;
>  
> @@ -1320,34 +1319,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
>  		return -EINVAL;
>  	}
>  
> -	switch (mode_cmd->pixel_format) {
> -	case DRM_FORMAT_ARGB8888:
> -		format = SVGA3D_A8R8G8B8;
> -		break;
> -	case DRM_FORMAT_XRGB8888:
> -		format = SVGA3D_X8R8G8B8;
> -		break;
> -	case DRM_FORMAT_RGB565:
> -		format = SVGA3D_R5G6B5;
> -		break;
> -	case DRM_FORMAT_XRGB1555:
> -		format = SVGA3D_A1R5G5B5;
> -		break;
> -	default:
> -		DRM_ERROR("Invalid pixel format: %p4cc\n",
> -			  &mode_cmd->pixel_format);
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * For DX, surface format validation is done when surface->scanout
> -	 * is set.
> -	 */
> -	if (!has_sm4_context(dev_priv) && format != surface->metadata.format) {
> -		DRM_ERROR("Invalid surface format for requested mode.\n");
> -		return -EINVAL;
> -	}
> -
>  	vfbs = kzalloc(sizeof(*vfbs), GFP_KERNEL);
>  	if (!vfbs) {
>  		ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 1625b30d9970..5721c74da3e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -2276,9 +2276,12 @@ int vmw_dumb_create(struct drm_file *file_priv,
>  	const struct SVGA3dSurfaceDesc *desc = vmw_surface_get_desc(format);
>  	SVGA3dSurfaceAllFlags flags = SVGA3D_SURFACE_HINT_TEXTURE |
>  				      SVGA3D_SURFACE_HINT_RENDERTARGET |
> -				      SVGA3D_SURFACE_SCREENTARGET |
> -				      SVGA3D_SURFACE_BIND_SHADER_RESOURCE |
> -				      SVGA3D_SURFACE_BIND_RENDER_TARGET;
> +				      SVGA3D_SURFACE_SCREENTARGET;
> +
> +	if (vmw_surface_is_dx_screen_target_format(format)) {
> +		flags |= SVGA3D_SURFACE_BIND_SHADER_RESOURCE |
> +			 SVGA3D_SURFACE_BIND_RENDER_TARGET;
> +	}
>  
>  	/*
>  	 * Without mob support we're just going to use raw memory buffer

LGTM

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
