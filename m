Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D6A96327
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74C210E546;
	Tue, 22 Apr 2025 08:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ngHFDEOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156E610E548
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745312217;
 bh=G5QxZEzo3Loq4GDUV+9fEZwbrcj0xfHiQQgBZmqxNak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ngHFDEOwF3phvoHV5v4Y3M0KC1l3hMPtq4rHJ2CShCDN2XfDKf9gr8IFTH72yKttk
 EZDQOEw+2d0zZtjH3oOC8Ch2c2Xn94r0yvZIYA7f3iuUHYLapi8cic9Xi0Gt6+sRZb
 bU1T8kDArj4OR+JWys8oDvCFEPigU62TYHhjd5JiNgZLoE6flq26alwB+BoZ+tFPFk
 3JU+g967oho03nJytVT/zRuTqgqUX21Wyd9j/0zqvj9Hwk7lfuBqRkF7RQKMoSRXIb
 2cmRGrGFPvmS0xRYqNMNtlxBqxfga+w444vlV1F6PeXvaHLpCbAobLljvN8V8LT+9F
 +WOtRmRO6dd/g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 42EE417E0B9D;
 Tue, 22 Apr 2025 10:56:57 +0200 (CEST)
Date: Tue, 22 Apr 2025 10:56:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3] drm/panthor: Don't create a file offset for NO_MMAP BOs
Message-ID: <20250422105654.3f79bc64@collabora.com>
In-Reply-To: <20250417121942.3574111-1-boris.brezillon@collabora.com>
References: <20250417121942.3574111-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 17 Apr 2025 14:19:42 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

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
> Changes in v3:
> - Don't leak the BO ref
> - Add R-bs
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c |  7 +++++++
>  drivers/gpu/drm/panthor/panthor_gem.c | 13 +------------
>  2 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e32073..4d4a52a033f6 100644
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
> @@ -950,6 +951,12 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  	if (!obj)
>  		return -ENOENT;
>  
> +	bo = to_panthor_bo(obj);
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP) {
> +		ret = -EPERM;
> +		goto out;
> +	}
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

