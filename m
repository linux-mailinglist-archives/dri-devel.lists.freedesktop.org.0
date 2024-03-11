Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FF878ACF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 23:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEEB112CE4;
	Mon, 11 Mar 2024 22:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="HqhuOUUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D9E112CE4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 22:36:57 +0000 (UTC)
Message-ID: <83e2d77c-d12b-4f4f-a759-8e97fd86eff5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710196614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUQPkht64sWX7JVV8v7D7kaGK+/xr09KYmGxuaLQzAo=;
 b=HqhuOUUrijOnMo8iwXnOShESjlO2ucwqsLA1yJ3Ss3rkH6Yd1JmhQ4kEi35gjRlnEl+W5y
 WbO5+7os9DpccK6BVJft3mXh5wSgShvrwfDcOXvh0m84UdqUgJQjPU/E7xJsQIpKyNC+zm
 tIAJuScW36ApYLQ4wf4CbL+4aD0kEj4=
Date: Tue, 12 Mar 2024 06:36:31 +0800
MIME-Version: 1.0
Subject: Re: [10/13] drm/fbdev-generic: Fix locking with
 drm_client_buffer_vmap_local()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org,
 dmitry.osipenko@collabora.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-11-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240227113853.8464-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/2/27 18:14, Thomas Zimmermann wrote:
> Temporarily lock the fbdev buffer object during updates to prevent
> memory managers from evicting/moving the buffer. Moving a buffer
> object while update its content results in undefined behaviour.
>
> Fbdev-generic updates its buffer object from a shadow buffer. Gem-shmem
> and gem-dma helpers do not move buffer objects, so they are safe to be
> used with fbdev-generic. Gem-vram and qxl are based on TTM, but pin
> buffer objects are part of the vmap operation. So both are also safe
> to be used with fbdev-generic.
>
> Amdgpu and nouveau do not pin or lock the buffer object during an
> update. Their TTM-based memory management could move the buffer object
> while the update is ongoing.
>
> The new vmap_local and vunmap_local helpers hold the buffer object's
> reservation lock during the buffer update. This prevents moving the
> buffer object on all memory managers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client.c        | 68 +++++++++++++++++++++++++----
>   drivers/gpu/drm/drm_fbdev_generic.c |  4 +-
>   drivers/gpu/drm/drm_gem.c           | 12 +++++
>   include/drm/drm_client.h            | 10 +++++
>   include/drm/drm_gem.h               |  3 ++
>   5 files changed, 87 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 9403b3f576f7b..2cc81831236b5 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -304,6 +304,66 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>   	return ERR_PTR(ret);
>   }
>   
> +/**
> + * drm_client_buffer_vmap_local - Map DRM client buffer into address space
> + * @buffer: DRM client buffer
> + * @map_copy: Returns the mapped memory's address
> + *
> + * This function maps a client buffer into kernel address space. If the
> + * buffer is already mapped, it returns the existing mapping's address.
> + *
> + * Client buffer mappings are not ref'counted. Each call to
> + * drm_client_buffer_vmap_local() should be closely followed by a call to
> + * drm_client_buffer_vunmap_local(). See drm_client_buffer_vmap() for
> + * long-term mappings.
> + *
> + * The returned address is a copy of the internal value. In contrast to
> + * other vmap interfaces, you don't need it for the client's vunmap
> + * function. So you can modify it at will during blit and draw operations.
> + *
> + * Returns:
> + *	0 on success, or a negative errno code otherwise.
> + */
> +int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
> +				 struct iosys_map *map_copy)
> +{
> +	struct drm_gem_object *gem = buffer->gem;
> +	struct iosys_map *map = &buffer->map;
> +	int ret;
> +
> +	drm_gem_lock(gem);
> +
> +	ret = drm_gem_vmap(gem, map);
> +	if (ret)
> +		goto err_drm_gem_vmap_unlocked;
> +	*map_copy = *map;
> +
> +	return 0;
> +
> +err_drm_gem_vmap_unlocked:
> +	drm_gem_unlock(gem);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_client_buffer_vmap_local);
> +
> +/**
> + * drm_client_buffer_vunmap_local - Unmap DRM client buffer
> + * @buffer: DRM client buffer
> + *
> + * This function removes a client buffer's memory mapping established
> + * with drm_client_buffer_vunmap_local(). Calling this function is only
> + * required by clients that manage their buffer mappings by themselves.
> + */
> +void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
> +{
> +	struct drm_gem_object *gem = buffer->gem;
> +	struct iosys_map *map = &buffer->map;
> +
> +	drm_gem_vunmap(gem, map);
> +	drm_gem_unlock(gem);
> +}
> +EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
> +
>   /**
>    * drm_client_buffer_vmap - Map DRM client buffer into address space
>    * @buffer: DRM client buffer
> @@ -331,14 +391,6 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>   	struct iosys_map *map = &buffer->map;
>   	int ret;
>   
> -	/*
> -	 * FIXME: The dependency on GEM here isn't required, we could
> -	 * convert the driver handle to a dma-buf instead and use the
> -	 * backend-agnostic dma-buf vmap support instead. This would
> -	 * require that the handle2fd prime ioctl is reworked to pull the
> -	 * fd_install step out of the driver backend hooks, to make that
> -	 * final step optional for internal users.
> -	 */
>   	ret = drm_gem_vmap_unlocked(buffer->gem, map);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index d647d89764cb9..be357f926faec 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -197,14 +197,14 @@ static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
>   	 */
>   	mutex_lock(&fb_helper->lock);
>   
> -	ret = drm_client_buffer_vmap(buffer, &map);
> +	ret = drm_client_buffer_vmap_local(buffer, &map);
>   	if (ret)
>   		goto out;
>   
>   	dst = map;

Then, please remove the local variable 'dst' (struct iosys_map) at here.
As you said, the returned iosys_map is another copy of the original backup,
we can play with this local variable at will, there no need to duplicate
another time again.

I have modified and tested with fbdev generic, no problem. With this trivial
issue resolved. For fbdev-generic:


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


