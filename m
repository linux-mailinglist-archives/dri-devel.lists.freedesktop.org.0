Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F24505F8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3676E6E0BE;
	Mon, 15 Nov 2021 13:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA776E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:51:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD7D693;
 Mon, 15 Nov 2021 14:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636984267;
 bh=V5u5JQGkGk10qLkx22oWmpShhhMfc1fW9Ebhy0ybUBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UEdKiBXGljxTN1RPBdVZ7ulNPXj9ikhJJpkP/5mbysnkvgqEJXaQjSbQDKwmUDxZx
 slJGAmfSZPBHUtmp9tvQaFYbqsmYnu4WXtwgG2OFhnneg0ii7+3qeeL182UsfuVWkM
 8GU8BBGTTXJjSF1TDCOsNi07a4gIH7GFmQoYjzdM=
Date: Mon, 15 Nov 2021 15:50:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/cma-helper: Pass GEM CMA object in public
 interfaces
Message-ID: <YZJltbbFp4Gr201g@pendragon.ideasonboard.com>
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211115120148.21766-4-tzimmermann@suse.de>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Mon, Nov 15, 2021 at 01:01:48PM +0100, Thomas Zimmermann wrote:
> Change all GEM CMA object functions that receive a GEM object
> of type struct drm_gem_object to expect an object of type
> struct drm_gem_cma_object instead.
> 
> This change reduces the number of upcasts from struct drm_gem_object
> by moving them into callers. The C compiler can now verify that the
> GEM CMA functions are called with the correct type.
> 
> For consistency, the patch also renames drm_gem_cma_free_object to
> drm_gem_cma_free. It further updates documentation for a number of
> functions.

I'm not convinced to be honest. I won't block this series, but I don't
really see what it brings us.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 52 +++++++++++++---------------
>  drivers/gpu/drm/vc4/vc4_bo.c         |  4 +--
>  include/drm/drm_gem_cma_helper.h     | 39 ++++++++++++---------
>  3 files changed, 48 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 27ccb71e3d66..7d4895de9e0d 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -32,6 +32,10 @@
>   * The DRM GEM/CMA helpers use this allocator as a means to provide buffer
>   * objects that are physically contiguous in memory. This is useful for
>   * display drivers that are unable to map scattered buffers via an IOMMU.
> + *
> + * For GEM callback helpers in struct &drm_gem_object functions, see likewise
> + * named functions with an _object_ infix (e.g., drm_gem_cma_object_vmap() wraps
> + * drm_gem_cma_vmap()). These helpers perform the necessary type conversion.
>   */
>  
>  static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
> @@ -192,16 +196,16 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
>  }
>  
>  /**
> - * drm_gem_cma_free_object - free resources associated with a CMA GEM object
> - * @gem_obj: GEM object to free
> + * drm_gem_cma_free - free resources associated with a CMA GEM object
> + * @cma_obj: CMA GEM object to free
>   *
>   * This function frees the backing memory of the CMA GEM object, cleans up the
>   * GEM object state and frees the memory used to store the object itself.
>   * If the buffer is imported and the virtual address is set, it is released.
>   */
> -void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
> +void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem_obj);
> +	struct drm_gem_object *gem_obj = &cma_obj->base;
>  	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(cma_obj->vaddr);
>  
>  	if (gem_obj->import_attach) {
> @@ -222,7 +226,7 @@ void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
>  
>  	kfree(cma_obj);
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_free_object);
> +EXPORT_SYMBOL_GPL(drm_gem_cma_free);
>  
>  /**
>   * drm_gem_cma_dumb_create_internal - create a dumb buffer object
> @@ -369,18 +373,15 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_get_unmapped_area);
>  
>  /**
>   * drm_gem_cma_print_info() - Print &drm_gem_cma_object info for debugfs
> + * @cma_obj: CMA GEM object
>   * @p: DRM printer
>   * @indent: Tab indentation level
> - * @obj: GEM object
>   *
> - * This function can be used as the &drm_driver->gem_print_info callback.
> - * It prints paddr and vaddr for use in e.g. debugfs output.
> + * This function prints paddr and vaddr for use in e.g. debugfs output.
>   */
> -void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
> -			    const struct drm_gem_object *obj)
> +void drm_gem_cma_print_info(const struct drm_gem_cma_object *cma_obj,
> +			    struct drm_printer *p, unsigned int indent)
>  {
> -	const struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> -
>  	drm_printf_indent(p, indent, "paddr=%pad\n", &cma_obj->paddr);
>  	drm_printf_indent(p, indent, "vaddr=%p\n", cma_obj->vaddr);
>  }
> @@ -389,7 +390,7 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
>  /**
>   * drm_gem_cma_get_sg_table - provide a scatter/gather table of pinned
>   *     pages for a CMA GEM object
> - * @obj: GEM object
> + * @cma_obj: CMA GEM object
>   *
>   * This function exports a scatter/gather table by calling the standard
>   * DMA mapping API.
> @@ -397,9 +398,9 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
>   * Returns:
>   * A pointer to the scatter/gather table of pinned pages or NULL on failure.
>   */
> -struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj)
> +struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	struct drm_gem_object *obj = &cma_obj->base;
>  	struct sg_table *sgt;
>  	int ret;
>  
> @@ -465,22 +466,19 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
>  /**
>   * drm_gem_cma_vmap - map a CMA GEM object into the kernel's virtual
>   *     address space
> - * @obj: GEM object
> + * @cma_obj: CMA GEM object
>   * @map: Returns the kernel virtual address of the CMA GEM object's backing
>   *       store.
>   *
> - * This function maps a buffer into the kernel's
> - * virtual address space. Since the CMA buffers are already mapped into the
> - * kernel virtual address space this simply returns the cached virtual
> - * address.
> + * This function maps a buffer into the kernel's virtual address space.
> + * Since the CMA buffers are already mapped into the kernel virtual address
> + * space this simply returns the cached virtual address.
>   *
>   * Returns:
>   * 0 on success, or a negative error code otherwise.
>   */
> -int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
> +int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj, struct dma_buf_map *map)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> -
>  	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
>  
>  	return 0;
> @@ -489,7 +487,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
>  
>  /**
>   * drm_gem_cma_mmap - memory-map an exported CMA GEM object
> - * @obj: GEM object
> + * @cma_obj: CMA GEM object
>   * @vma: VMA for the area to be mapped
>   *
>   * This function maps a buffer into a userspace process's address space.
> @@ -499,9 +497,9 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct vm_area_struct *vma)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_object *obj = &cma_obj->base;
>  	int ret;
>  
>  	/*
> @@ -512,8 +510,6 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>  	vma->vm_flags &= ~VM_PFNMAP;
>  
> -	cma_obj = to_drm_gem_cma_obj(obj);
> -
>  	if (cma_obj->map_noncoherent) {
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 830756b3159e..6d1281a343e9 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -177,7 +177,7 @@ static void vc4_bo_destroy(struct vc4_bo *bo)
>  		bo->validated_shader = NULL;
>  	}
>  
> -	drm_gem_cma_free_object(obj);
> +	drm_gem_cma_free(&bo->base);
>  }
>  
>  static void vc4_bo_remove_from_cache(struct vc4_bo *bo)
> @@ -720,7 +720,7 @@ static int vc4_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
>  		return -EINVAL;
>  	}
>  
> -	return drm_gem_cma_mmap(obj, vma);
> +	return drm_gem_cma_mmap(&bo->base, vma);
>  }
>  
>  static const struct vm_operations_struct vc4_vm_ops = {
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index 56d2f9fdf9ac..adb507a9dbf0 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -32,28 +32,23 @@ struct drm_gem_cma_object {
>  #define to_drm_gem_cma_obj(gem_obj) \
>  	container_of(gem_obj, struct drm_gem_cma_object, base)
>  
> -/* free GEM object */
> -void drm_gem_cma_free_object(struct drm_gem_object *gem_obj);
> -
> -/* allocate physical memory */
>  struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  					      size_t size);
> +void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj);
> +void drm_gem_cma_print_info(const struct drm_gem_cma_object *cma_obj,
> +			    struct drm_printer *p, unsigned int indent);
> +struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj);
> +int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj, struct dma_buf_map *map);
> +int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct vm_area_struct *vma);
>  
>  extern const struct vm_operations_struct drm_gem_cma_vm_ops;
>  
> -void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
> -			    const struct drm_gem_object *obj);
> -
> -struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj);
> -int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> -int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> -
>  /*
>   * GEM object functions
>   */
>  
>  /**
> - * drm_gem_cma_object_free - GEM object function for drm_gem_cma_free_object()
> + * drm_gem_cma_object_free - GEM object function for drm_gem_cma_free()
>   * @obj: GEM object to free
>   *
>   * This function wraps drm_gem_cma_free_object(). Drivers that employ the CMA helpers
> @@ -61,7 +56,9 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>   */
>  static inline void drm_gem_cma_object_free(struct drm_gem_object *obj)
>  {
> -	drm_gem_cma_free_object(obj);
> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +
> +	drm_gem_cma_free(cma_obj);
>  }
>  
>  /**
> @@ -76,7 +73,9 @@ static inline void drm_gem_cma_object_free(struct drm_gem_object *obj)
>  static inline void drm_gem_cma_object_print_info(struct drm_printer *p, unsigned int indent,
>  						 const struct drm_gem_object *obj)
>  {
> -	drm_gem_cma_print_info(p, indent, obj);
> +	const struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +
> +	drm_gem_cma_print_info(cma_obj, p, indent);
>  }
>  
>  /**
> @@ -91,7 +90,9 @@ static inline void drm_gem_cma_object_print_info(struct drm_printer *p, unsigned
>   */
>  static inline struct sg_table *drm_gem_cma_object_get_sg_table(struct drm_gem_object *obj)
>  {
> -	return drm_gem_cma_get_sg_table(obj);
> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +
> +	return drm_gem_cma_get_sg_table(cma_obj);
>  }
>  
>  /*
> @@ -107,7 +108,9 @@ static inline struct sg_table *drm_gem_cma_object_get_sg_table(struct drm_gem_ob
>   */
>  static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>  {
> -	return drm_gem_cma_vmap(obj, map);
> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +
> +	return drm_gem_cma_vmap(cma_obj, map);
>  }
>  
>  /**
> @@ -123,7 +126,9 @@ static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj, struct dma
>   */
>  static inline int drm_gem_cma_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
> -	return drm_gem_cma_mmap(obj, vma);
> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +
> +	return drm_gem_cma_mmap(cma_obj, vma);
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart
