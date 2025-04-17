Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07967A9180C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB4810EA77;
	Thu, 17 Apr 2025 09:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M2UrN6B4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259A10EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744882484;
 bh=5Zn+jUoooEx4r6xPpHakTwZpYEPZFfOioz+APKdiAuM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M2UrN6B4D5E6gxC6xDEJbo1fplmtQCwxUJU1WTiXAkbGuGiLlUZNwXFtjzCKvWyBk
 CSKH6LEWLNHUDLzEogY3U3h7aFyY1ffYIxKi/m3MW6SRPTFp3nUWVNaLuMZcmlu/0H
 N9UQ6zj7XBec3xU8qevQ11xhloem5dJVrkWZkXrjzWb7V+47Gn6CSQ6tzmKMaVneox
 6Bor+tpRKVsAXbZt83WpusVOT2Yg8ww0KWfC1j0XwyzhOsw1Qmbdqp4m3Uu864AJN3
 Vuv1QujgxqFFl5Fw270l9IHFCaxtI81hy5dt+WR/HFTQIGvyp5hpOr4nxo2RMPyDwG
 QfxVqK6l0lbJw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 02DBF17E0FA7;
 Thu, 17 Apr 2025 11:34:43 +0200 (CEST)
Date: Thu, 17 Apr 2025 11:34:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2] drm/panthor: Don't create a file offset for NO_MMAP BOs
Message-ID: <20250417113439.3f6469d6@collabora.com>
In-Reply-To: <20250417093247.3455096-1-boris.brezillon@collabora.com>
References: <20250417093247.3455096-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 17 Apr 2025 11:32:47 +0200
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
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Liviu, Steve, I intentionally dropped your R-bs because this v2 gets
rid of panthor_gem_mmap(), and I want a confirmation that you're okay
with that.

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

