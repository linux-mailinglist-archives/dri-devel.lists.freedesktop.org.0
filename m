Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE77803C4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 04:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87C810E044;
	Fri, 18 Aug 2023 02:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB68610E044
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:21:27 +0000 (UTC)
Received: from [192.168.2.146] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 158046607193;
 Fri, 18 Aug 2023 03:21:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692325286;
 bh=H1c8MQ0091rK/piNqTTWX71/U6A+nKLnMMEQnsjEuLs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W8f1S1ZVpci+AoMBN1S97NYrIpTaWR/tVSKu/2N0pOvvIC8s4VPBH6c9jMgK4sQSM
 SgHW+6Qz3VilAbSC+F5vxMEAIJ1nk2ePK/4W0p3hK9nIhOv0yTZdvF+mp+9r8mXRSE
 mlo9PtmFn5lsbdFKA4BHd6YAU8t2wdrp9+yrKotLViKch4Q7zDOymHAiPUPW/8LaMz
 XbL+ccyZC7xwfhK7QiCCDddPf11S7OoHXXkw2yXr4tPIHltgb+T4cFJ0pr1A5gEkU2
 gPbMFigrYih2R4e57xL/5+AJLnxNs3ZLpKJy5o3PF8kDa1VDhMHk0Xv1IYDUnJrCv6
 QtIUd9y46oaFQ==
Message-ID: <e21c96f5-1f82-5afb-c117-e5ae48164073@collabora.com>
Date: Fri, 18 Aug 2023 05:21:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/3] drm/virtio: new fence for every plane update
Content-Language: en-US
To: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230712224424.30158-3-dongwon.kim@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

...
> +static struct
> +drm_plane_state *virtio_gpu_plane_duplicate_state(struct drm_plane *plane)
> +{
> +	struct virtio_gpu_plane_state *new;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;

When plane->state can be NULL?

> +	new = kzalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &new->base);
> +
> +	return &new->base;
> +}
> +
> +static void virtio_gpu_plane_destroy_state(struct drm_plane *plane,
> +					   struct drm_plane_state *state)
> +{
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(to_virtio_gpu_plane_state(state));
> +}
> +
>  static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
>  	.reset			= drm_atomic_helper_plane_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> -	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +	.atomic_duplicate_state = virtio_gpu_plane_duplicate_state,
> +	.atomic_destroy_state	= virtio_gpu_plane_destroy_state,

Similar to the other email, please see how container_of() works. There
is no need change .atomic_destroy_state

...
> @@ -237,41 +262,29 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>  	struct drm_device *dev = plane->dev;
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_plane_state *vgplane_st;
>  	struct virtio_gpu_object *bo;
>  
>  	if (!new_state->fb)
>  		return 0;
>  
>  	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
> +	vgplane_st = to_virtio_gpu_plane_state(new_state);
>  	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>  	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
>  		return 0;
>  
> -	if (bo->dumb && (plane->state->fb != new_state->fb)) {
> -		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
> +	if (bo->dumb) {

Why "&& (plane->state->fb != new_state->fb)" disappeared?

> +		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
> +						     vgdev->fence_drv.context,
>  						     0);
> -		if (!vgfb->fence)
> +		if (!vgplane_st->fence)
>  			return -ENOMEM;
>  	}
>  
>  	return 0;
>  }
>  
> -static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
> -					struct drm_plane_state *state)
> -{
> -	struct virtio_gpu_framebuffer *vgfb;
> -
> -	if (!state->fb)
> -		return;
> -
> -	vgfb = to_virtio_gpu_framebuffer(state->fb);
> -	if (vgfb->fence) {
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence = NULL;
> -	}
> -}
How come that virtio_gpu_plane_cleanup_fb() isn't needed anymore? You
created fence in prepare_fb(), you must release it in cleanup_fb() if
fence still presents.

-- 
Best regards,
Dmitry

