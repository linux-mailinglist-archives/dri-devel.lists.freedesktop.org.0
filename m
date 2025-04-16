Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30886A9064E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027D10E951;
	Wed, 16 Apr 2025 14:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 521E010E951
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:26:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D377F1595;
 Wed, 16 Apr 2025 07:26:43 -0700 (PDT)
Received: from [10.57.90.52] (unknown [10.57.90.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B289E3F66E;
 Wed, 16 Apr 2025 07:26:44 -0700 (PDT)
Message-ID: <2f27c97e-514f-4074-9fb4-3ca46f53220f@arm.com>
Date: Wed, 16 Apr 2025 15:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Enforce DRM_PANTHOR_BO_NO_MMAP
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250415105710.1490623-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250415105710.1490623-1-boris.brezillon@collabora.com>
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

On 15/04/2025 11:57, Boris Brezillon wrote:
> Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> still be mmap-ed.
> 
> Fortunately, this bug only impacts user BOs, because kernel BOs are not
> exposed to userspace (they don't have a BO handle), so they can't
> be mmap-ed anyway. Given all user BOs setting this flag are private
> anyway (not shareable), there's no potential data leak.

Maybe I'm missing something, but I think the below check in
panthor_gem_mmap() should also prevent this:

> static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> {
> 	struct panthor_gem_object *bo = to_panthor_bo(obj);
> 
> 	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
> 	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> 		return -EINVAL;
> 
> 	return drm_gem_shmem_object_mmap(obj, vma);
> }

That said, it doesn't make sense to be able to get an offset if you
can't mmap() so this seems like a good change. Indeed potentially with
this we no longer need panthor_gem_mmap() - although I haven't
completely convinced myself of that yet.

> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 15d8e2bcf6ad..1499df07f512 100644
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
> +		return -EINVAL;
> +
>  	ret = drm_gem_create_mmap_offset(obj);
>  	if (ret)
>  		goto out;

