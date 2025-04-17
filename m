Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5EEA91838
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD0010E1A3;
	Thu, 17 Apr 2025 09:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3713610E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:44:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56BE71516;
 Thu, 17 Apr 2025 02:44:23 -0700 (PDT)
Received: from [10.1.37.32] (e122027.cambridge.arm.com [10.1.37.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB9C53F59E;
 Thu, 17 Apr 2025 02:44:24 -0700 (PDT)
Message-ID: <d8f078b9-2240-46b5-9115-b0cc0223780b@arm.com>
Date: Thu, 17 Apr 2025 10:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Don't create a file offset for NO_MMAP BOs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250417093247.3455096-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250417093247.3455096-1-boris.brezillon@collabora.com>
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

On 17/04/2025 10:32, Boris Brezillon wrote:
> Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> have a file offset but can't be mapped anyway, because
> panthor_gem_mmap() will filter them out.
> 
> If we error out at mmap_offset creation time, we can get rid of
> panthor_gem_mmap() and call drm_gem_shmem_object_mmap directly, and
> we get rid of this inconsistency of having an mmap offset for a
> BO that can never be mmap-ed.
> 
> Changes in v2:
> - Get rid of panthor_gem_mmap()
> - Get rid of the Fixes tag and adjust the commit message accordingly
> - Return ENOPERM instead of EINVAL
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c |  5 +++++
>  drivers/gpu/drm/panthor/panthor_gem.c | 13 +------------
>  2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e32073..7cd131af340d 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -940,6 +940,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  					struct drm_file *file)
>  {
>  	struct drm_panthor_bo_mmap_offset *args = data;
> +	struct panthor_gem_object *bo;
>  	struct drm_gem_object *obj;
>  	int ret;
>  
> @@ -950,6 +951,10 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  	if (!obj)
>  		return -ENOENT;
>  
> +	bo = to_panthor_bo(obj);
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> +		return -EPERM;
> +
>  	ret = drm_gem_create_mmap_offset(obj);
>  	if (ret)
>  		goto out;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index fd014ccc3bfc..22d78cef9c66 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -129,17 +129,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	return ERR_PTR(ret);
>  }
>  
> -static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> -{
> -	struct panthor_gem_object *bo = to_panthor_bo(obj);
> -
> -	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
> -	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> -		return -EINVAL;
> -
> -	return drm_gem_shmem_object_mmap(obj, vma);
> -}
> -
>  static struct dma_buf *
>  panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
>  {
> @@ -169,7 +158,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
>  	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
> -	.mmap = panthor_gem_mmap,
> +	.mmap = drm_gem_shmem_object_mmap,
>  	.status = panthor_gem_status,
>  	.export = panthor_gem_prime_export,
>  	.vm_ops = &drm_gem_shmem_vm_ops,

