Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAEF84225E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 12:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D82010F8A1;
	Tue, 30 Jan 2024 11:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA1510F8A1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 11:11:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-55f4b824c92so90246a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 03:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706613034; x=1707217834; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7bGttRPgttjMO74kPRnHYy9jYBfJV/qrJlhkxWu5S4=;
 b=V/YEQC3O9Bd3gVLg2z9nWNbneJ7he7JV0Wj3WBsghGMHjCBICEfoyRT+mBklzsh/0Z
 Rp1lhEaMmWg3YuZbqdUJCPbdZ/4i0N3ICpX0u/uy0c3apVw10P/CyWXV2vIyAxlr1IsD
 tuEJ5+WHxl3ypwymGn/ynowsFGlKsj6ukFkCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706613034; x=1707217834;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7bGttRPgttjMO74kPRnHYy9jYBfJV/qrJlhkxWu5S4=;
 b=C1z3xT+zZZtd2S58Yb0mfFdXYEJabkt2YuoNeNWpKF9b32iQ9k6mZONXRbftJaXNOy
 VP1pSMkgXxAm0PhkGLIeSnjHFi68gGbGK8oqQAdgQgapxwiSmR/h1nfbOQO8yWlZIOK5
 Ub9DQkHrHOus6V96tBJ0ZQHhT5pEwn4vRTM8/u2GgcgRG1nVX9grpWcr8YPOZAul4W16
 B8MQncqEVi0QNP9ja+z8C4eKsRmtEzR2QDBDscox6J28sRZ7I3fH+0gblu/3eRcXdTdV
 iUF8YsVjtnN6AEVmhSgNvQuTiOevsAZEhQDKnv87/YRIkN3AQx/AYuU+BkmUt44LfWQP
 m5Hw==
X-Gm-Message-State: AOJu0YzkssGkxAhAZuVsx5s1YxrErXH8canJRvpyrk+vL5+ulQ0zumD3
 W+e3wDqLBbLD41fdIJZbCIkEv3RxuQ2FoiY6CEHFK0p/UbGPV1b56vTGTR7qSsU=
X-Google-Smtp-Source: AGHT+IHoMmTcemQDlc/kUpp8/xk6ukVSnUize3vRgDvU1QC1Uw3N+FYTz16SdFAkr796/zLLxsXvOQ==
X-Received: by 2002:a17:906:6d01:b0:a35:561d:cf5a with SMTP id
 m1-20020a1709066d0100b00a35561dcf5amr5957342ejr.6.1706613034072; 
 Tue, 30 Jan 2024 03:10:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a170906064d00b00a316d360ac3sm4977863ejb.8.2024.01.30.03.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 03:10:33 -0800 (PST)
Date: Tue, 30 Jan 2024 12:10:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Zhang <julia.zhang@amd.com>
Subject: Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
Message-ID: <ZbjZJ3qQzdOksnb2@phenom.ffwll.local>
Mail-Followup-To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20240129103118.3258781-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129103118.3258781-1-julia.zhang@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org, Chen Jiqian <Jiqian.Chen@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 06:31:19PM +0800, Julia Zhang wrote:
> As vram objects don't have backing pages and thus can't implement
> drm_gem_object_funcs.get_sg_table callback. This removes drm dma-buf
> callbacks in virtgpu_gem_map_dma_buf()/virtgpu_gem_unmap_dma_buf()
> and implement virtgpu specific map/unmap/attach callbacks to support
> both of shmem objects and vram objects.
> 
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 40 +++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 44425f20d91a..b490a5343b06 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -49,11 +49,26 @@ virtgpu_gem_map_dma_buf(struct dma_buf_attachment *attach,
>  {
>  	struct drm_gem_object *obj = attach->dmabuf->priv;
>  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct sg_table *sgt;
> +	int ret;
>  
>  	if (virtio_gpu_is_vram(bo))
>  		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
>  
> -	return drm_gem_map_dma_buf(attach, dir);
> +	sgt = drm_prime_pages_to_sg(obj->dev,
> +				    to_drm_gem_shmem_obj(obj)->pages,
> +				    obj->size >> PAGE_SHIFT);
> +	if (IS_ERR(sgt))
> +		return sgt;
> +
> +	ret = dma_map_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	if (ret) {
> +		sg_free_table(sgt);
> +		kfree(sgt);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return sgt;
>  }
>  
>  static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
> @@ -63,12 +78,29 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  	struct drm_gem_object *obj = attach->dmabuf->priv;
>  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>  
> +	if (!sgt)
> +		return;
> +
>  	if (virtio_gpu_is_vram(bo)) {
>  		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
> -		return;
> +	} else {
> +		dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		sg_free_table(sgt);
> +		kfree(sgt);
>  	}
> +}
> +
> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
> +				     struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	int ret = 0;
> +
> +	if (!virtio_gpu_is_vram(bo) && obj->funcs->pin)
> +		ret = obj->funcs->pin(obj);
>  
> -	drm_gem_unmap_dma_buf(attach, sgt, dir);
> +	return ret;

This doesn't look like what I've expected. There should be no need to
change the map/unmap functions, especially not for the usual gem bo case.
We should definitely keep using the exact same code for that. Instead all
I expected is roughly

virtgpu_gem_device_attach()
{
	if (virtio_gpu_is_vram(bo)) {
		if (can_access_virtio_vram_directly(attach->dev)
			return 0;
		else
			return -EBUSY;
	} else {
		return drm_gem_map_attach();
	}
}

Note that I think can_access_virtio_vram_directly() needs to be
implemented first. I'm not even sure it's possible, might be that all the
importers need to set the attachment->peer2peer flag. Which is why this
thing exists really. But that's a pile more work to do.

Frankly the more I look at the original patch that added vram export
support the more this just looks like a "pls revert, this is just too
broken".

We should definitely not open-code any functions for the gem_bo export
case, which your patch seems to do? Or maybe I'm just extremely confused.
-Sima

>  
>  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
> @@ -83,7 +115,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>  		.vmap = drm_gem_dmabuf_vmap,
>  		.vunmap = drm_gem_dmabuf_vunmap,
>  	},
> -	.device_attach = drm_gem_map_attach,
> +	.device_attach = virtgpu_gem_device_attach,
>  	.get_uuid = virtgpu_virtio_get_uuid,
>  };
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
