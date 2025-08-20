Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2A5B2DBDB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5851E10E711;
	Wed, 20 Aug 2025 11:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Bo+qIWue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CE610E710;
 Wed, 20 Aug 2025 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755691022;
 bh=yNVd850lMTYa7ad0xsSbTY95vTbe9rpc2wJbzcKpeqE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bo+qIWueznitha+TxlwkgAoGUEhCMPnIOxMLUDiOcVdGsx/2SejtmFEVgrKOitXYI
 XpLzMk2sQDIuFtVnoV54Mf1CGr4PfvyVUFpDtA1BITfODH5QphgH5dboAl3DWMLjI0
 JDx3g1WhVeHj41Ac8Vp1Lbt8E6+QcCOF0xXmSlTtr7/Ed/nr5hApN7T94VRKTicjtd
 kMsqf3GbCqQQmukJ96ITZF+sSvQ4LCihIluOZWP1LQS34G7NmfpRvw4j39/LKncOxj
 2Fa5HvxGSaJAerJ1438aXQFxOt9mMOjAzG1wO7F6p+3xZYXA8fDNmPicLfAF44mNSJ
 kN8dgli87q6kg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 57F8E17E0C21;
 Wed, 20 Aug 2025 13:57:02 +0200 (CEST)
Date: Wed, 20 Aug 2025 13:56:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Danilo
 Krummrich <dakr@kernel.org>, Brendan King <Brendan.King@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
Message-ID: <20250820135657.19a6bcbc@fedora>
In-Reply-To: <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
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

On Tue, 19 Aug 2025 03:27:30 +0530
Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Brendan King <Brendan.King@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 74 +++++++++++---------------
>  drivers/gpu/drm/imagination/pvr_vm.c   | 15 ++++--
>  drivers/gpu/drm/msm/msm_gem_vma.c      | 27 +++++++---
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 11 ++--
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 13 +++--
>  drivers/gpu/drm/xe/xe_vm.c             | 13 +++--
>  include/drm/drm_gpuvm.h                | 20 ++++---
>  7 files changed, 102 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 74d949995a72..c0e6f9310514 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -486,13 +486,18 @@
>   *				  u64 addr, u64 range,
>   *				  struct drm_gem_object *obj, u64 offset)
>   *	{
> + *		struct drm_gpuvm_map_req map_req = {
> + *		        .map.va.addr = addr,
> + *	                .map.va.range = range,
> + *	                .map.gem.obj = obj,
> + *	                .map.gem.offset = offset,
> + *	           };

Nit: indentation is messed up here.

>   *		struct drm_gpuva_ops *ops;
>   *		struct drm_gpuva_op *op
>   *		struct drm_gpuvm_bo *vm_bo;
>   *
>   *		driver_lock_va_space();
> - *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
> - *						  obj, offset);
> + *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &map_req);
>   *		if (IS_ERR(ops))
>   *			return PTR_ERR(ops);
>   *
> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>  
>  static int
>  op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> -	  u64 addr, u64 range,
> -	  struct drm_gem_object *obj, u64 offset)
> +	  const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva_op op = {};
>  
>  	op.op = DRM_GPUVA_OP_MAP;
> -	op.map.va.addr = addr;
> -	op.map.va.range = range;
> -	op.map.gem.obj = obj;
> -	op.map.gem.offset = offset;
> +	op.map.va.addr = req->map.va.addr;
> +	op.map.va.range = req->map.va.range;
> +	op.map.gem.obj = req->map.gem.obj;
> +	op.map.gem.offset = req->map.gem.offset;
>  
>  	return fn->sm_step_map(&op, priv);
>  }
> @@ -2102,10 +2106,14 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
> -		   u64 req_addr, u64 req_range,
> -		   struct drm_gem_object *req_obj, u64 req_offset)
> +		   const struct drm_gpuvm_map_req *req)
>  {
> +	struct drm_gem_object *req_obj = req->map.gem.obj;
>  	struct drm_gpuva *va, *next;
> +
> +	u64 req_offset = req->map.gem.offset;
> +	u64 req_range = req->map.va.range;
> +	u64 req_addr = req->map.va.addr;
>  	u64 req_end = req_addr + req_range;
>  	int ret;
>  
> @@ -2236,9 +2244,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		}
>  	}
>  
> -	return op_map_cb(ops, priv,
> -			 req_addr, req_range,
> -			 req_obj, req_offset);
> +	return op_map_cb(ops, priv, req);
>  }
>  
>  static int
> @@ -2303,10 +2309,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to struct drm_gpuvm_map_req
>   *
>   * This function iterates the given range of the GPU VA space. It utilizes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and merge
> @@ -2333,8 +2336,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   */
>  int
>  drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		 u64 req_addr, u64 req_range,
> -		 struct drm_gem_object *req_obj, u64 req_offset)
> +		 const struct drm_gpuvm_map_req *req)
>  {
>  	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>  
> @@ -2343,9 +2345,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  		       ops->sm_step_unmap)))
>  		return -EINVAL;
>  
> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
> @@ -2421,10 +2421,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @exec: the &drm_exec locking context
>   * @num_fences: for newly mapped objects, the # of fences to reserve
> - * @req_addr: the start address of the range to unmap
> - * @req_range: the range of the mappings to unmap
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to drm_gpuvm_map_req struct
>   *
>   * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
>   * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> @@ -2447,9 +2444,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>   *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
>   *                    break;
>   *                case DRIVER_OP_MAP:
> - *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
> - *                                                     op->addr, op->range,
> - *                                                     obj, op->obj_offset);
> + *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, &req);
>   *                    break;
>   *                }
>   *
> @@ -2480,18 +2475,17 @@ static const struct drm_gpuvm_ops lock_ops = {
>  int
>  drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			   struct drm_exec *exec, unsigned int num_fences,
> -			   u64 req_addr, u64 req_range,
> -			   struct drm_gem_object *req_obj, u64 req_offset)
> +			   struct drm_gpuvm_map_req *req)
>  {
> +	struct drm_gem_object *req_obj = req->map.gem.obj;
> +
>  	if (req_obj) {
>  		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
>  
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
> @@ -2613,10 +2607,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>  /**
>   * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: map request arguments
>   *
>   * This function creates a list of operations to perform splitting and merging
>   * of existent mapping(s) with the newly requested one.
> @@ -2644,8 +2635,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>   */
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 req_addr, u64 req_range,
> -			    struct drm_gem_object *req_obj, u64 req_offset)
> +			    const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva_ops *ops;
>  	struct {
> @@ -2663,9 +2653,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>  	args.vm = gpuvm;
>  	args.ops = ops;
>  
> -	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> -				 req_addr, req_range,
> -				 req_obj, req_offset);
> +	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>  	if (ret)
>  		goto err_free_ops;
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
> index 2896fa7501b1..3d97990170bf 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>  static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>  {
>  	switch (bind_op->type) {
> -	case PVR_VM_BIND_TYPE_MAP:
> +	case PVR_VM_BIND_TYPE_MAP: {
> +		const struct drm_gpuvm_map_req map_req = {
> +			.map.va.addr = bind_op->device_addr,
> +			.map.va.range = bind_op->size,
> +			.map.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
> +			.map.gem.offset = bind_op->offset,
> +		};
> +
>  		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> -					bind_op, bind_op->device_addr,
> -					bind_op->size,
> -					gem_from_pvr_gem(bind_op->pvr_obj),
> -					bind_op->offset);
> +					bind_op, &map_req);
> +	}
>  
>  	case PVR_VM_BIND_TYPE_UNMAP:
>  		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 3cd8562a5109..792b35433666 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1171,11 +1171,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
>  							      op->obj_offset);
>  				break;
>  			case MSM_VM_BIND_OP_MAP:
> -			case MSM_VM_BIND_OP_MAP_NULL:
> -				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
> -							    op->iova, op->range,
> -							    op->obj, op->obj_offset);
> +			case MSM_VM_BIND_OP_MAP_NULL: {
> +				struct drm_gpuvm_map_req map_req = {
> +					.map.va.addr = op->iova,
> +					.map.va.range = op->range,
> +					.map.gem.obj = op->obj,
> +					.map.gem.offset = op->obj_offset,
> +				};
> +
> +				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
>  				break;
> +			}
>  			default:
>  				/*
>  				 * lookup_op() should have already thrown an error for
> @@ -1282,10 +1288,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>  			if (op->flags & MSM_VM_BIND_OP_DUMP)
>  				arg.flags |= MSM_VMA_DUMP;
>  			fallthrough;
> -		case MSM_VM_BIND_OP_MAP_NULL:
> -			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
> -					       op->range, op->obj, op->obj_offset);
> +		case MSM_VM_BIND_OP_MAP_NULL: {
> +			struct drm_gpuvm_map_req map_req = {
> +				.map.va.addr = op->iova,
> +				.map.va.range = op->range,
> +				.map.gem.obj = op->obj,
> +				.map.gem.offset = op->obj_offset,
> +			};
> +
> +			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
>  			break;
> +		}
>  		default:
>  			/*
>  			 * lookup_op() should have already thrown an error for
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index ddfc46bc1b3e..d94a85509176 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			break;
>  		case OP_MAP: {
>  			struct nouveau_uvma_region *reg;
> +			struct drm_gpuvm_map_req map_req = {
> +				.map.va.addr = op->va.addr,
> +				.map.va.range = op->va.range,
> +				.map.gem.obj = op->gem.obj,
> +				.map.gem.offset = op->gem.offset,
> +			};
>  
>  			reg = nouveau_uvma_region_find_first(uvmm,
>  							     op->va.addr,
> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			}
>  
>  			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
> -							      op->va.addr,
> -							      op->va.range,
> -							      op->gem.obj,
> -							      op->gem.offset);
> +							      &map_req);
>  			if (IS_ERR(op->ops)) {
>  				ret = PTR_ERR(op->ops);
>  				goto unwind_continue;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 367c89aca558..2003b91a8409 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2202,15 +2202,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx = op;
>  	switch (op_type) {
> -	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> +	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> +		const struct drm_gpuvm_map_req map_req = {
> +			.map.va.addr = op->va.addr,
> +			.map.va.range = op->va.range,
> +			.map.gem.obj = op->map.vm_bo->obj,
> +			.map.gem.offset = op->map.bo_offset,
> +		};
> +
>  		if (vm->unusable) {
>  			ret = -EINVAL;
>  			break;
>  		}
>  
> -		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
> -				       op->map.vm_bo->obj, op->map.bo_offset);
> +		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>  		break;
> +	}
>  
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>  		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c86337e08a55..f35d69c0b4c6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2337,10 +2337,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> -	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> -		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
> -						  obj, bo_offset_or_userptr);
> +	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> +		struct drm_gpuvm_map_req map_req = {
> +			.map.va.addr = addr,
> +			.map.va.range = range,
> +			.map.gem.obj = obj,
> +			.map.gem.offset = bo_offset_or_userptr,
> +		};
> +
> +		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>  		break;
> +	}
>  	case DRM_XE_VM_BIND_OP_UNMAP:
>  		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>  		break;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 274532facfd6..a9fa44148e0c 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1058,10 +1058,20 @@ struct drm_gpuva_ops {
>   */
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>  
> +/**
> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
> + */
> +struct drm_gpuvm_map_req {
> +	/**
> +	 * @op_map: struct drm_gpuva_op_map

Doc name doesn't match the field name.

> +	 */
> +	struct drm_gpuva_op_map map;

Nit: not convinced map is a good name for that field, given this is a
map_req, so we now those are map-related arguments. I would probably
go for 'op'.

> +};
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 addr, u64 range,
> -			    struct drm_gem_object *obj, u64 offset);
> +			    const struct drm_gpuvm_map_req *req);
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>  			      u64 addr, u64 range);
> @@ -1205,16 +1215,14 @@ struct drm_gpuvm_ops {
>  };
>  
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     const struct drm_gpuvm_map_req *req);
>  
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  		       u64 addr, u64 range);
>  
>  int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			  struct drm_exec *exec, unsigned int num_fences,
> -			  u64 req_addr, u64 req_range,
> -			  struct drm_gem_object *obj, u64 offset);
> +			  struct drm_gpuvm_map_req *req);
>  
>  int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>  				 u64 req_addr, u64 req_range);

