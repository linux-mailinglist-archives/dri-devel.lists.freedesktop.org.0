Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D23B2F67A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169F10E2E4;
	Thu, 21 Aug 2025 11:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fDMCa3KA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D31D10E2E4;
 Thu, 21 Aug 2025 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755775542;
 bh=6dK7tCkTVPzM1HQA++ZW+Z+SHNSf+tUFa1E5TFZeJ40=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fDMCa3KAhUqWoqSn4YyL7vGj+/ZGNuIRIlekxoY3Rlhe54uXRNFLKMbraParVMtaG
 jM//J1TQoNCALU0GF6l7KGPTihU08XnQ0WoQH/kTil9UY5UPImnLkYAU99Tkji0qIN
 q/grzaarsMonkMsCNIXAnt7Fm/vwqVSQa7LLYT/EnJirOKO/37mqA1nK9vZEGywBB7
 zGaanJCOrGuFWm/Y0QQohn7Alhtqq4vJxYi6OhA7wYfWVlBKaVUDGtjVAwNS00OvTB
 uF7aESA7JnQ+ORag5Xiy/a7TTPTc2KJSZLuhUP7BfecDdGpz1uXNwhob1nbwKLDn9J
 JrMvehkTfEKKg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BF73617E127B;
 Thu, 21 Aug 2025 13:25:41 +0200 (CEST)
Date: Thu, 21 Aug 2025 13:25:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Message-ID: <20250821132535.0424d0b4@fedora>
In-Reply-To: <20250821130146.471cd653@fedora>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
 <20250820180742.20623521@fedora> <20250821130146.471cd653@fedora>
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

On Thu, 21 Aug 2025 13:01:46 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Wed, 20 Aug 2025 18:07:42 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Wed, 20 Aug 2025 20:53:35 +0530
> > Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> >   
> > > Renamed 'map' to 'op' in drm_gpuvm_map_req for clarity and added
> > > corresponding documentation. No functional changes introduced.
> > > 
> > > Fixes: baf1638c0956 ("drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create")
> > > Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> > > Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
> > > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matt Coster <matt.coster@imgtec.com>
> > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>    
> > 
> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> >   
> > > ---
> > >  drivers/gpu/drm/drm_gpuvm.c            | 36 +++++++++++++-------------
> > >  drivers/gpu/drm/imagination/pvr_vm.c   |  8 +++---
> > >  drivers/gpu/drm/msm/msm_gem_vma.c      | 16 ++++++------
> > >  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  8 +++---
> > >  drivers/gpu/drm/panthor/panthor_mmu.c  |  8 +++---
> > >  drivers/gpu/drm/xe/xe_vm.c             |  8 +++---
> > >  include/drm/drm_gpuvm.h                |  4 +--
> > >  7 files changed, 44 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > > index 39f934a91a7b..e9aaf9b287e7 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -552,11 +552,11 @@
> > >   *				  struct drm_gem_object *obj, u64 offset)
> > >   *	{
> > >   *		struct drm_gpuvm_map_req map_req = {
> > > - *		        .map.va.addr = addr,
> > > - *	                .map.va.range = range,
> > > - *	                .map.gem.obj = obj,
> > > - *	                .map.gem.offset = offset,
> > > - *	           };
> > > + *		        .op.va.addr = addr,
> > > + *	                .op.va.range = range,
> > > + *	                .op.gem.obj = obj,
> > > + *	                .op.gem.offset = offset,
> > > + *	        };
> > >   *		struct drm_gpuva_ops *ops;
> > >   *		struct drm_gpuva_op *op
> > >   *		struct drm_gpuvm_bo *vm_bo;
> > > @@ -2132,10 +2132,10 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> > >  		return 0;
> > >  
> > >  	op.op = DRM_GPUVA_OP_MAP;
> > > -	op.map.va.addr = req->map.va.addr;
> > > -	op.map.va.range = req->map.va.range;
> > > -	op.map.gem.obj = req->map.gem.obj;
> > > -	op.map.gem.offset = req->map.gem.offset;
> > > +	op.map.va.addr = req->op.va.addr;
> > > +	op.map.va.range = req->op.va.range;
> > > +	op.map.gem.obj = req->op.gem.obj;
> > > +	op.map.gem.offset = req->op.gem.offset;
> > >  
> > >  	return fn->sm_step_map(&op, priv);
> > >  }
> > > @@ -2180,12 +2180,12 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> > >  		   const struct drm_gpuvm_map_req *req,
> > >  		   bool madvise)
> > >  {
> > > -	struct drm_gem_object *req_obj = req->map.gem.obj;
> > > +	struct drm_gem_object *req_obj = req->op.gem.obj;
> > >  	const struct drm_gpuvm_map_req *op_map = madvise ? NULL : req;
> > >  	struct drm_gpuva *va, *next;
> > > -	u64 req_offset = req->map.gem.offset;
> > > -	u64 req_range = req->map.va.range;
> > > -	u64 req_addr = req->map.va.addr;
> > > +	u64 req_offset = req->op.gem.offset;
> > > +	u64 req_range = req->op.va.range;
> > > +	u64 req_addr = req->op.va.addr;
> > >  	u64 req_end = req_addr + req_range;
> > >  	int ret;
> > >  
> > > @@ -2272,8 +2272,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> > >  
> > >  				if (madvise) {
> > >  					struct drm_gpuvm_map_req map_req = {
> > > -						.map.va.addr =  req_addr,
> > > -						.map.va.range = end - req_addr,
> > > +						.op.va.addr =  req_addr,
> > > +						.op.va.range = end - req_addr,
> > >  					};
> > >  
> > >  					ret = op_map_cb(ops, priv, &map_req);
> > > @@ -2340,8 +2340,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> > >  
> > >  				if (madvise) {
> > >  					struct drm_gpuvm_map_req map_req = {
> > > -						.map.va.addr =  addr,
> > > -						.map.va.range = req_end - addr,
> > > +						.op.va.addr =  addr,
> > > +						.op.va.range = req_end - addr,
> > >  					};
> > >  
> > >  					return op_map_cb(ops, priv, &map_req);
> > > @@ -2583,7 +2583,7 @@ drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
> > >  			   struct drm_exec *exec, unsigned int num_fences,
> > >  			   struct drm_gpuvm_map_req *req)
> > >  {
> > > -	struct drm_gem_object *req_obj = req->map.gem.obj;
> > > +	struct drm_gem_object *req_obj = req->op.gem.obj;
> > >  
> > >  	if (req_obj) {
> > >  		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
> > > diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
> > > index 3d97990170bf..983165eb3e6a 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_vm.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> > > @@ -187,10 +187,10 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
> > >  	switch (bind_op->type) {
> > >  	case PVR_VM_BIND_TYPE_MAP: {
> > >  		const struct drm_gpuvm_map_req map_req = {
> > > -			.map.va.addr = bind_op->device_addr,
> > > -			.map.va.range = bind_op->size,
> > > -			.map.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
> > > -			.map.gem.offset = bind_op->offset,
> > > +			.op.va.addr = bind_op->device_addr,
> > > +			.op.va.range = bind_op->size,
> > > +			.op.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
> > > +			.op.gem.offset = bind_op->offset,
> > >  		};
> > >  
> > >  		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> > > index 210604181c05..9b5d003bc5a2 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > > @@ -1179,10 +1179,10 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
> > >  			case MSM_VM_BIND_OP_MAP:
> > >  			case MSM_VM_BIND_OP_MAP_NULL: {
> > >  				struct drm_gpuvm_map_req map_req = {
> > > -					.map.va.addr = op->iova,
> > > -					.map.va.range = op->range,
> > > -					.map.gem.obj = op->obj,
> > > -					.map.gem.offset = op->obj_offset,
> > > +					.op.va.addr = op->iova,
> > > +					.op.va.range = op->range,
> > > +					.op.gem.obj = op->obj,
> > > +					.op.gem.offset = op->obj_offset,
> > >  				};
> > >  
> > >  				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
> > > @@ -1296,10 +1296,10 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
> > >  			fallthrough;
> > >  		case MSM_VM_BIND_OP_MAP_NULL: {
> > >  			struct drm_gpuvm_map_req map_req = {
> > > -				.map.va.addr = op->iova,
> > > -				.map.va.range = op->range,
> > > -				.map.gem.obj = op->obj,
> > > -				.map.gem.offset = op->obj_offset,
> > > +				.op.va.addr = op->iova,
> > > +				.op.va.range = op->range,
> > > +				.op.gem.obj = op->obj,
> > > +				.op.gem.offset = op->obj_offset,
> > >  			};
> > >  
> > >  			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > index d94a85509176..314121a857e7 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > @@ -1277,10 +1277,10 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
> > >  		case OP_MAP: {
> > >  			struct nouveau_uvma_region *reg;
> > >  			struct drm_gpuvm_map_req map_req = {
> > > -				.map.va.addr = op->va.addr,
> > > -				.map.va.range = op->va.range,
> > > -				.map.gem.obj = op->gem.obj,
> > > -				.map.gem.offset = op->gem.offset,
> > > +				.op.va.addr = op->va.addr,
> > > +				.op.va.range = op->va.range,
> > > +				.op.gem.obj = op->gem.obj,
> > > +				.op.gem.offset = op->gem.offset,
> > >  			};
> > >  
> > >  			reg = nouveau_uvma_region_find_first(uvmm,
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > index 2003b91a8409..3799e2c6ea59 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -2204,10 +2204,10 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
> > >  	switch (op_type) {
> > >  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> > >  		const struct drm_gpuvm_map_req map_req = {
> > > -			.map.va.addr = op->va.addr,
> > > -			.map.va.range = op->va.range,
> > > -			.map.gem.obj = op->map.vm_bo->obj,
> > > -			.map.gem.offset = op->map.bo_offset,
> > > +			.op.va.addr = op->va.addr,
> > > +			.op.va.range = op->va.range,
> > > +			.op.gem.obj = op->map.vm_bo->obj,
> > > +			.op.gem.offset = op->map.bo_offset,
> > >  		};
> > >  
> > >  		if (vm->unusable) {
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index f35d69c0b4c6..66b54b152446 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2339,10 +2339,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >  	case DRM_XE_VM_BIND_OP_MAP:
> > >  	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> > >  		struct drm_gpuvm_map_req map_req = {
> > > -			.map.va.addr = addr,
> > > -			.map.va.range = range,
> > > -			.map.gem.obj = obj,
> > > -			.map.gem.offset = bo_offset_or_userptr,
> > > +			.op.va.addr = addr,
> > > +			.op.va.range = range,
> > > +			.op.gem.obj = obj,
> > > +			.op.gem.offset = bo_offset_or_userptr,
> > >  		};
> > >  
> > >  		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
> > > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > > index 4a22b9d848f7..751c96a817ed 100644
> > > --- a/include/drm/drm_gpuvm.h
> > > +++ b/include/drm/drm_gpuvm.h
> > > @@ -1054,9 +1054,9 @@ struct drm_gpuva_ops {
> > >   */
> > >  struct drm_gpuvm_map_req {
> > >  	/**
> > > -	 * @op_map: struct drm_gpuva_op_map
> > > +	 * @op: struct drm_gpuva_op_map
> > >  	 */
> > > -	struct drm_gpuva_op_map map;
> > > +	struct drm_gpuva_op_map op;  
> 
> On a second thought, I'm now wondering why we need drm_gpuvm_map_req in
> the first place. It would kinda make sense if it was containing an
> 
> 	bool madvise;
> 
> field, so you don't have to pass it around, but even then, I'm
> wondering if we wouldn't be better off adding this field to
> drm_gpuva_op_map instead and passing an drm_gpuva_op_map object to
> the various map helpers (like Danilo suggested in his review of the
> REPEATED mode series Caterina sent).

More on that: the very reason I introduced drm_gpuvm_map_req in the
first place is so we have a clear differentiation between an overall
map request and the sub-operations that are created to fulfill it.
Looks like this was not a concern for Danilo and he was happy with us
using _op_map for this.

The other reason we might want to add drm_gpuvm_map_req is so that
information we only need while splitting a req don't pollute
drm_gpuva_op_map. Given I was going to pass the flags to the driver's
callback anyway (meaning it's needed at the op_map level), and given
you're passing madvise as a separate bool argument to various helpers
(_map_req just contains the op, not the madvise bool), I don't think
this aspect matters.
