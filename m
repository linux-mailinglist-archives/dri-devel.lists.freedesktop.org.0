Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B014FD12839
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5610E09B;
	Mon, 12 Jan 2026 12:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A17810E09B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:21:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B550497;
 Mon, 12 Jan 2026 04:21:27 -0800 (PST)
Received: from [10.57.11.182] (unknown [10.57.11.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35E993F59E;
 Mon, 12 Jan 2026 04:21:30 -0800 (PST)
Message-ID: <63c0a3ae-24a2-425e-a9a5-0595c90b69fe@arm.com>
Date: Mon, 12 Jan 2026 12:21:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] drm/panthor: Split panthor_vm_prepare_map_op_ctx()
 to prepare for reclaim
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-8-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260109130801.1239558-8-boris.brezillon@collabora.com>
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

On 09/01/2026 13:07, Boris Brezillon wrote:
> We're gonna need just the page table reservation logic when we restore
> evicted BO mappings, so let's prepare for that by extracting the
> op_ctx init and page table pre-allocation into separate helpers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

(A nice easy refactor after trying to get my head round mm-code - just
what I needed ;) )

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 70 ++++++++++++++++-----------
>  1 file changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index c323b7123713..3290e0b5facb 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1170,6 +1170,45 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
>  	return 0;
>  }
>  
> +static void panthor_vm_init_op_ctx(struct panthor_vm_op_ctx *op_ctx,
> +				   u64 size, u64 va, u32 flags)
> +{
> +	memset(op_ctx, 0, sizeof(*op_ctx));
> +	op_ctx->flags = flags;
> +	op_ctx->va.range = size;
> +	op_ctx->va.addr = va;
> +}
> +
> +static int panthor_vm_op_ctx_prealloc_pts(struct panthor_vm_op_ctx *op_ctx)
> +{
> +	u64 size = op_ctx->va.range;
> +	u64 va = op_ctx->va.addr;
> +	int ret;
> +
> +	/* L1, L2 and L3 page tables.
> +	 * We could optimize L3 allocation by iterating over the sgt and merging
> +	 * 2M contiguous blocks, but it's simpler to over-provision and return
> +	 * the pages if they're not used.
> +	 */
> +	u64 pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
> +		       ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
> +		       ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
> +
> +	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
> +						 sizeof(*op_ctx->rsvd_page_tables.pages),
> +						 GFP_KERNEL);
> +	if (!op_ctx->rsvd_page_tables.pages)
> +		return -ENOMEM;
> +
> +	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
> +				    op_ctx->rsvd_page_tables.pages);
> +	op_ctx->rsvd_page_tables.count = ret;
> +	if (ret != pt_count)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  #define PANTHOR_VM_BIND_OP_MAP_FLAGS \
>  	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
>  	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
> @@ -1185,7 +1224,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  {
>  	struct drm_gpuvm_bo *preallocated_vm_bo;
>  	struct sg_table *sgt = NULL;
> -	u64 pt_count;
>  	int ret;
>  
>  	if (!bo)
> @@ -1204,10 +1242,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	    bo->exclusive_vm_root_gem != panthor_vm_root_gem(vm))
>  		return -EINVAL;
>  
> -	memset(op_ctx, 0, sizeof(*op_ctx));
> -	op_ctx->flags = flags;
> -	op_ctx->va.range = size;
> -	op_ctx->va.addr = va;
> +	panthor_vm_init_op_ctx(op_ctx, size, va, flags);
>  
>  	ret = panthor_vm_op_ctx_prealloc_vmas(op_ctx);
>  	if (ret)
> @@ -1250,30 +1285,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  
>  	op_ctx->map.bo_offset = offset;
>  
> -	/* L1, L2 and L3 page tables.
> -	 * We could optimize L3 allocation by iterating over the sgt and merging
> -	 * 2M contiguous blocks, but it's simpler to over-provision and return
> -	 * the pages if they're not used.
> -	 */
> -	pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
> -		   ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
> -		   ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
> -
> -	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
> -						 sizeof(*op_ctx->rsvd_page_tables.pages),
> -						 GFP_KERNEL);
> -	if (!op_ctx->rsvd_page_tables.pages) {
> -		ret = -ENOMEM;
> +	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
> +	if (ret)
>  		goto err_cleanup;
> -	}
> -
> -	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
> -				    op_ctx->rsvd_page_tables.pages);
> -	op_ctx->rsvd_page_tables.count = ret;
> -	if (ret != pt_count) {
> -		ret = -ENOMEM;
> -		goto err_cleanup;
> -	}
>  
>  	/* Insert BO into the extobj list last, when we know nothing can fail. */
>  	dma_resv_lock(panthor_vm_resv(vm), NULL);

