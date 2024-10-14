Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FF399CC8E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DA410E38D;
	Mon, 14 Oct 2024 14:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hluXRe/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E5410E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728915415;
 bh=QjZvrqwnTYvHcR9NFMwSDtdJF1YBZnEwl3+0inoYmb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hluXRe/32FYS5sHqKnUaUU5Kc+PCjLaQ89VRoNtKj23HB7rVDC0DLIHXMfwo/l+O7
 nhQhIomS1qAV8ddXcO48ZK643YN1E/BgUKH2C279xkf+bKKM7z+Pqs2DJlYCEvtrhl
 RfZIFxNz51uNIuRrwKjiNBjegf+19pjl0QqGnZBfOIXuoUjW56qNh/dM4n3jQLJpB6
 nLrsUsUBdCkeMUqj0K9yWm3N9NilHig5pjT82dEDD8bzkSP4SnqWQt0OkqbmgcquRL
 tXEJMHdnsjX+N+OarMr9Uc7CS2Yqtt2NOAdaJsabpqdBIdgyBNLC65jE0ekhTzoXnX
 iRSrPHmcguf5w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2303F17E360C;
 Mon, 14 Oct 2024 16:16:55 +0200 (CEST)
Date: Mon, 14 Oct 2024 16:16:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2] drm/panthor: Fix firmware initialization on systems
 with a page size > 4k
Message-ID: <20241014161652.0acfb092@collabora.com>
In-Reply-To: <37126cf9-0468-4e0f-aefe-d4b5edd2d78a@arm.com>
References: <20241014093134.464059-1-boris.brezillon@collabora.com>
 <37126cf9-0468-4e0f-aefe-d4b5edd2d78a@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 14 Oct 2024 14:34:25 +0100
Steven Price <steven.price@arm.com> wrote:

> On 14/10/2024 10:31, Boris Brezillon wrote:
> > The system and GPU MMU page size might differ, which becomes a
> > problem for FW sections that need to be mapped at explicit address
> > since our PAGE_SIZE alignment might cover a VA range that's
> > expected to be used for another section.
> > 
> > Make sure we never map more than we need.
> > 
> > Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Steve, Liviu, Adrian, I intentionally dropped the R-b because of
> > the panthor_vm_page_size() change. Feel free to add it back if
> > you're happy with the new version.  
> 
> Personally I think the panthor_vm_page_size() function is overkill, a
> #define would seem plenty to me.

It certainly is since everything is pretty static right now, but I
think it'd be good to have an MMU page size that matches the system
page size for user contexts at some point, and only force the 4K
granularity for the MCU VM.

> 
> One other minor nit (see below), but either way:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c  |  4 ++--
> >  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
> >  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
> >  4 files changed, 24 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index ef232c0c2049..4e2d3a02ea06 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -487,6 +487,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  					 struct panthor_fw_binary_iter *iter,
> >  					 u32 ehdr)
> >  {
> > +	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
> >  	struct panthor_fw_binary_section_entry_hdr hdr;
> >  	struct panthor_fw_section *section;
> >  	u32 section_size;
> > @@ -515,8 +516,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> > -	    (hdr.va.end & ~PAGE_MASK) != 0) {
> > +	if (!IS_ALIGNED(hdr.va.start, vm_pgsz) || !IS_ALIGNED(hdr.va.end, vm_pgsz)) {
> >  		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
> >  			hdr.va.start, hdr.va.end);
> >  		return -EINVAL;
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index c60b599665d8..8244a4e6c2a2 100644
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
> >  
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
> > +	size = ALIGN(size, panthor_vm_page_size(vm));
> >  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
> >  	if (ret)
> >  		goto err_put_obj;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 3cd2bce59edc..f009501e4c68 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -826,6 +826,14 @@ void panthor_vm_idle(struct panthor_vm *vm)
> >  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> >  }
> >  
> > +u32 panthor_vm_page_size(struct panthor_vm *vm)
> > +{
> > +	const struct io_pgtable *pgt = container_of(vm->pgtbl_ops, struct io_pgtable, ops);  
> 
> NIT: io_pgtable_ops_to_pgtable() does this container_of() for you.

Oops, I was searching for such this helper but somehow missed it.
