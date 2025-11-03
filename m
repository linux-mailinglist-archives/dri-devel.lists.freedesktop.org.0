Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC93C2C6BF
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004910E40F;
	Mon,  3 Nov 2025 14:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E5FC10E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:34:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436101D14
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:34:13 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE2B03F694
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:34:20 -0800 (PST)
Date: Mon, 3 Nov 2025 14:34:17 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 1/4] drm/panthor: Fix UAF on kernel BO VA nodes
Message-ID: <aQi9aUXaR_AyZnDi@e110455-lin.cambridge.arm.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031154818.821054-2-boris.brezillon@collabora.com>
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

On Fri, Oct 31, 2025 at 04:48:15PM +0100, Boris Brezillon wrote:
> If the MMU is down, panthor_vm_unmap_range() might return an error.
> We expect the page table to be updated still, and if the MMU is blocked,
> the rest of the GPU should be blocked too, so no risk of accessing
> physical memory returned to the system (which the current code doesn't
> cover for anyway).
> 
> Proceed with the rest of the cleanup instead of bailing out and leaving
> the va_node inserted in the drm_mm, which leads to UAF when other
> adjacent nodes are removed from the drm_mm tree.
> 
> Reported-by: Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/issues/57
> Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

I've pushed this patch into drm-misc-next, I'll leave the rest of the series
for review.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 7e7d2f223cfa..f369cc3e2a5f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -87,7 +87,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  {
>  	struct panthor_vm *vm;
> -	int ret;
>  
>  	if (IS_ERR_OR_NULL(bo))
>  		return;
> @@ -95,18 +94,11 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>  	vm = bo->vm;
>  	panthor_kernel_bo_vunmap(bo);
>  
> -	if (drm_WARN_ON(bo->obj->dev,
> -			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
> -		goto out_free_bo;
> -
> -	ret = panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
> -	if (ret)
> -		goto out_free_bo;
> -
> +	drm_WARN_ON(bo->obj->dev,
> +		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
> +	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
>  	panthor_vm_free_va(vm, &bo->va_node);
>  	drm_gem_object_put(bo->obj);
> -
> -out_free_bo:
>  	panthor_vm_put(vm);
>  	kfree(bo);
>  }
> -- 
> 2.51.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
