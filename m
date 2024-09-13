Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB7978200
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAAE10E1BA;
	Fri, 13 Sep 2024 14:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3D0710E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:01:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7130C13D5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:01:38 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C89253F73B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:01:08 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:01:05 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Lock the VM resv before calling
 drm_gpuvm_bo_obtain_prealloc()
Message-ID: <ZuRFoTI6qX_pGLlr@e110455-lin.cambridge.arm.com>
References: <20240913112722.492144-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913112722.492144-1-boris.brezillon@collabora.com>
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

On Fri, Sep 13, 2024 at 01:27:22PM +0200, Boris Brezillon wrote:
> drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
> pre-allocated BO if the <BO,VM> association exists. Given we
> only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
> be called immediately, and we have to hold the VM resv lock when
> calling this function.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks good to me!

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 37f1885c54c7..aa12ed2acfcf 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1251,9 +1251,17 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  		goto err_cleanup;
>  	}
>  
> +	/* drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
> +	 * pre-allocated BO if the <BO,VM> association exists. Given we
> +	 * only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
> +	 * be called immediately, and we have to hold the VM resv lock when
> +	 * calling this function.
> +	 */
> +	dma_resv_lock(panthor_vm_resv(vm), NULL);
>  	mutex_lock(&bo->gpuva_list_lock);
>  	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
>  	mutex_unlock(&bo->gpuva_list_lock);
> +	dma_resv_unlock(panthor_vm_resv(vm));
>  
>  	/* If the a vm_bo for this <VM,BO> combination exists, it already
>  	 * retains a pin ref, and we can release the one we took earlier.
> -- 
> 2.46.0
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
