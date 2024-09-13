Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D61497826A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C67882AF;
	Fri, 13 Sep 2024 14:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A9882AF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:18:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91D2813D5;
 Fri, 13 Sep 2024 07:19:23 -0700 (PDT)
Received: from [10.1.34.27] (e122027.cambridge.arm.com [10.1.34.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB123F73B;
 Fri, 13 Sep 2024 07:18:53 -0700 (PDT)
Message-ID: <e7d3ebf4-b9cf-47df-91ee-da5cb3fb979f@arm.com>
Date: Fri, 13 Sep 2024 15:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Lock the VM resv before calling
 drm_gpuvm_bo_obtain_prealloc()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240913112722.492144-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240913112722.492144-1-boris.brezillon@collabora.com>
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

On 13/09/2024 12:27, Boris Brezillon wrote:
> drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
> pre-allocated BO if the <BO,VM> association exists. Given we
> only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
> be called immediately, and we have to hold the VM resv lock when
> calling this function.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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

