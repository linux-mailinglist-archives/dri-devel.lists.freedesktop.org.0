Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12D782D9D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 17:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ABE10E286;
	Mon, 21 Aug 2023 15:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B97C10E281
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 15:56:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4F16143D;
 Mon, 21 Aug 2023 08:57:07 -0700 (PDT)
Received: from [10.57.34.4] (unknown [10.57.34.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B13053F64C;
 Mon, 21 Aug 2023 08:56:25 -0700 (PDT)
Message-ID: <10cf2a19-01b9-c742-088f-4f63a0ca0a48@arm.com>
Date: Mon, 21 Aug 2023 16:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] drm/panfrost: Add drm memory stats display through
 fdinfo
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 robh@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20230808222240.1016623-1-adrian.larumbe@collabora.com>
 <20230808222240.1016623-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230808222240.1016623-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/08/2023 23:22, Adrián Larumbe wrote:
> For drm_show_memory_stats to produce a more accurate report, provide a new
> Panfrost DRM object callback that decides whether an object is resident in
> memory or eligible for purging.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  8 ++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 16 ++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  1 +
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 65fdc0e4c7cb..46e8e69479c0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -441,11 +441,14 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
>  
>  	if (args->retained) {
> -		if (args->madv == PANFROST_MADV_DONTNEED)
> +		if (args->madv == PANFROST_MADV_DONTNEED) {
>  			list_move_tail(&bo->base.madv_list,
>  				       &pfdev->shrinker_list);
> -		else if (args->madv == PANFROST_MADV_WILLNEED)
> +			bo->is_purgable = true;
> +		} else if (args->madv == PANFROST_MADV_WILLNEED) {
>  			list_del_init(&bo->base.madv_list);
> +			bo->is_purgable = false;
> +		}
>  	}
>  
>  out_unlock_mappings:
> @@ -546,6 +549,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  
>  	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
>  
> +	drm_show_memory_stats(p, file);
>  }
>  
>  static const struct file_operations panfrost_drm_driver_fops = {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 3c812fbd126f..80ab1521a14e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -195,6 +195,21 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
>  	return drm_gem_shmem_pin(&bo->base);
>  }
>  
> +static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +	struct panfrost_device *pfdev = obj->dev->dev_private;
> +	unsigned int res = 0;
> +
> +	mutex_lock(&pfdev->shrinker_lock);

This function is called by drm_show_memory_stats() while holding a
spin_lock, so we can't take the mutex here.

However, given this is racy anyway (the status could change before the
data is returned to user space), I don't think we need to have the mutex
held anyway.

Otherwise this looks good.

Steve

> +	res |= (bo->is_purgable) ? DRM_GEM_OBJECT_PURGEABLE : 0;
> +	mutex_unlock(&pfdev->shrinker_lock);
> +
> +	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
> +
> +	return res;
> +}
> +
>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.free = panfrost_gem_free_object,
>  	.open = panfrost_gem_open,
> @@ -206,6 +221,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
> +	.status = panfrost_gem_status,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index ad2877eeeccd..e06f7ceb8f73 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -38,6 +38,7 @@ struct panfrost_gem_object {
>  
>  	bool noexec		:1;
>  	bool is_heap		:1;
> +	bool is_purgable	:1;
>  };
>  
>  struct panfrost_gem_mapping {

