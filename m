Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84923A65213
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34E310E2CF;
	Mon, 17 Mar 2025 14:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED75710E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:00:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DECE13D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:00:15 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F30E53F63F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:00:05 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:59:59 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 09/15] drm/panthor: Test for imported buffers with
 drm_gem_is_imported()
Message-ID: <Z9gq39C1huw4Tlww@e110455-lin.cambridge.arm.com>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317131923.238374-10-tzimmermann@suse.de>
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

On Mon, Mar 17, 2025 at 02:06:47PM +0100, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
> -- 
> 2.48.1
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
