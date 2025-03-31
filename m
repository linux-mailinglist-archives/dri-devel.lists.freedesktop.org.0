Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF1A762E8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2E810E3A1;
	Mon, 31 Mar 2025 09:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD110E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:03:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBE871F37;
 Mon, 31 Mar 2025 02:03:02 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756663F694;
 Mon, 31 Mar 2025 02:02:57 -0700 (PDT)
Message-ID: <44d56604-df87-414e-a720-f129f753230f@arm.com>
Date: Mon, 31 Mar 2025 10:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] drm/panthor: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-10-tzimmermann@suse.de>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250317131923.238374-10-tzimmermann@suse.de>
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

On 17/03/2025 13:06, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 8244a4e6c2a2..fd014ccc3bfc 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -155,7 +155,7 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>  	enum drm_gem_object_status res = 0;
>  
> -	if (bo->base.base.import_attach || bo->base.pages)
> +	if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
>  		res |= DRM_GEM_OBJECT_RESIDENT;
>  
>  	return res;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 12a02e28f50f..3e123159ac10 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1103,7 +1103,7 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
>  	/* If the vm_bo object was destroyed, release the pin reference that
>  	 * was hold by this object.
>  	 */
> -	if (unpin && !bo->base.base.import_attach)
> +	if (unpin && !drm_gem_is_imported(&bo->base.base))
>  		drm_gem_shmem_unpin(&bo->base);
>  
>  	drm_gpuvm_put(vm);
> @@ -1234,7 +1234,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	if (ret)
>  		goto err_cleanup;
>  
> -	if (!bo->base.base.import_attach) {
> +	if (!drm_gem_is_imported(&bo->base.base)) {
>  		/* Pre-reserve the BO pages, so the map operation doesn't have to
>  		 * allocate.
>  		 */
> @@ -1245,7 +1245,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  
>  	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>  	if (IS_ERR(sgt)) {
> -		if (!bo->base.base.import_attach)
> +		if (!drm_gem_is_imported(&bo->base.base))
>  			drm_gem_shmem_unpin(&bo->base);
>  
>  		ret = PTR_ERR(sgt);
> @@ -1256,7 +1256,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  
>  	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
>  	if (!preallocated_vm_bo) {
> -		if (!bo->base.base.import_attach)
> +		if (!drm_gem_is_imported(&bo->base.base))
>  			drm_gem_shmem_unpin(&bo->base);
>  
>  		ret = -ENOMEM;
> @@ -1282,7 +1282,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	 * which will be released in panthor_vm_bo_put().
>  	 */
>  	if (preallocated_vm_bo != op_ctx->map.vm_bo &&
> -	    !bo->base.base.import_attach)
> +	    !drm_gem_is_imported(&bo->base.base))
>  		drm_gem_shmem_unpin(&bo->base);
>  
>  	op_ctx->map.bo_offset = offset;

