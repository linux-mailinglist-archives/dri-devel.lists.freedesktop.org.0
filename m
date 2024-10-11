Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B158A99AAC3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 19:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F01610E181;
	Fri, 11 Oct 2024 17:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dOHr02ky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896FA10E181
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 17:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728669530; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PQV+/lXbjRRkjaQjQIvGxLcSNDkn8VSb3ZPHme0YOZJrsEV8gBGcxvnzRTyyCGtRreWAO8ViL5klv8gASk/6wyIzEzHUZm46sr98nPX7ccs1JzaQ16D3AjeZptD/kEpqS5hVIZ2Lf9ZT0Yrzmzt2DPkq7Ld3adVwt/p1vXxpSXE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728669530;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sD7De1ag4jQ5xRmbHNnz5zSRc/MOWpd1Ytl9oEs21GQ=; 
 b=dbaXGATxSr1x7ZSCtExpenpmR08WrCRXVP1ilkl6UidzLOtZ4lMH7xP95Ejt0i0ciEE8wJX62PWTO9sNzHEEEWpLd/clUHZUulFatrR8dI/e6GEYoD/Ojj39NQrzAZ/jaEoav8owK2Pt9DR7kfduoTRKJI59r/kxv3jcSXHDVdY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728669530; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=sD7De1ag4jQ5xRmbHNnz5zSRc/MOWpd1Ytl9oEs21GQ=;
 b=dOHr02kyw4c8wftQwSM6sA/9go49908PJBmhpDAAaUjQJsZhrOrFAMBkzOesyUeq
 +VmfE7gthCzLFGa4aqBRZ/K3jNguK1wQWw37EB6qfWycoCRvUIqQWFywoU/9zffHjrx
 YP4AGVTUs1AwtULT0ZyAxWQ96wWj8lNJsP9IeZjU=
Received: by mx.zohomail.com with SMTPS id 1728669528862833.5786878111434;
 Fri, 11 Oct 2024 10:58:48 -0700 (PDT)
Date: Fri, 11 Oct 2024 18:58:45 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix firmware initialization on systems with
 a page size > 4k
Message-ID: <ynenorrf3kf3a5hmxfocjge3ytbydx42dmat53ywqaphjuc56k@lcgbdggi63ve>
References: <20241008084744.82688-1-boris.brezillon@collabora.com>
 <ff6196b6-f385-4d54-b34b-ce8f6d8d0f0a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff6196b6-f385-4d54-b34b-ce8f6d8d0f0a@arm.com>
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

Hi Boris,

On 09.10.2024 09:10, Steven Price wrote:
> On 08/10/2024 09:47, Boris Brezillon wrote:
> > The system and GPU MMU page size might differ, which becomes a
> > problem for FW sections that need to be mapped at explicit address
> > since our PAGE_SIZE alignment might cover a VA range that's
> > expected to be used for another section.
> > 
> > Make sure we never map more than we need.
> > 
> > Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c  |  3 +--
> >  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
> >  drivers/gpu/drm/panthor/panthor_mmu.c |  6 +++---
> >  3 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index ef232c0c2049..293846400296 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -515,8 +515,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> > -	    (hdr.va.end & ~PAGE_MASK) != 0) {
> > +	if (!IS_ALIGNED(hdr.va.start, SZ_4K) || !IS_ALIGNED(hdr.va.end, SZ_4K)) {
> >  		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
> >  			hdr.va.start, hdr.va.end);
> >  		return -EINVAL;
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index c60b599665d8..2c8d6e2c7232 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -44,8 +44,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
> >  			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
> >  		goto out_free_bo;
> >  
> > -	ret = panthor_vm_unmap_range(vm, bo->va_node.start,
> > -				     panthor_kernel_bo_size(bo));
> > +	ret = panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
> >  	if (ret)
> >  		goto out_free_bo;
> >  
> > @@ -95,10 +94,16 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> >  	}
> >  	bo = to_panthor_bo(&obj->base);
> > -	size = obj->base.size;
> >  	kbo->obj = &obj->base;
> >  	bo->flags = bo_flags;
> >  
> > +	/* The system and GPU MMU page size might differ, which becomes a
> > +	 * problem for FW sections that need to be mapped at explicit address
> > +	 * since our PAGE_SIZE alignment might cover a VA range that's
> > +	 * expected to be used for another section.
> > +	 * Make sure we never map more than we need.
> > +	 */

I was wondering, this must be a relatively common situation for other DRM
drivers, so maybe the DRM shmem core should have a BO creation function that
lets you specify an exact page alignment?

> > +	size = ALIGN(size, SZ_4K);

I was thinking, if we know that the FW's page size is always 4KiB, maybe we could do

#define CSF_FW_PAGESIZE SZ_4K

somewhere in panthor_fw.h to make things clearer?

Cheers,
Adrian

Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>

> >  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
> >  	if (ret)
> >  		goto err_put_obj;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 3cd2bce59edc..e53d131c53cc 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1027,10 +1027,10 @@ panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
> >  {
> >  	int ret;
> >  
> > -	if (!size || (size & ~PAGE_MASK))
> > +	if (!size || !IS_ALIGNED(size, SZ_4K))
> >  		return -EINVAL;
> >  
> > -	if (va != PANTHOR_VM_KERNEL_AUTO_VA && (va & ~PAGE_MASK))
> > +	if (va != PANTHOR_VM_KERNEL_AUTO_VA && !IS_ALIGNED(va, SZ_4K))
> >  		return -EINVAL;
> >  
> >  	mutex_lock(&vm->mm_lock);
> > @@ -2370,7 +2370,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
> >  	int ret;
> >  
> >  	/* Aligned on page size. */
> > -	if ((op->va | op->size) & ~PAGE_MASK)
> > +	if (!IS_ALIGNED(op->va | op->size, SZ_4K))
> >  		return -EINVAL;
> >  
> >  	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {

