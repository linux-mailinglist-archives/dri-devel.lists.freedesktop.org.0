Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E659FCC94AC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 19:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A8310E5E6;
	Wed, 17 Dec 2025 18:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FxX7NqjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942210E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765996080; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cfzrKRSn+SJ9Cy8gSJ0ML1TToMldAL3WNtG/5vbehUaasZnHViyYRvmhsvHD8xHWpnAIRHcbm8huXibmGRA0KKnWS+agX9fq3J6e9k15JrcgicFxmyKBcWGlS1TBNA4/okt7LJuf7SbzLPJLQathoN4liocrP9835myu9h2pHOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765996080;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nZahHpWnmgVYjp2zcFUWE5ZSp/2cms4ZlTg3nK8d8hM=; 
 b=mVEg9ZmYBSNFAY3/1Ed7sCXenNFeM4aKBFU0lrAN0sGzmSoQcmJCH62kMPPREp7D6kP8uBrwu8U27QAZqolYzYmIRtKmtbN+2zMtonEFEZHpcQ8VGbd8cuhEIR142eWKv66MYX8XoDYX0IigWgujCBrXn1RgykxwvdK1QQrNF5w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765996080; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=nZahHpWnmgVYjp2zcFUWE5ZSp/2cms4ZlTg3nK8d8hM=;
 b=FxX7NqjUh78EXGlWvphrnqOjpO1ZmbKiLoO77b5imQwyHj2teko5Hq9/fqAWjKyr
 nzBnGSJ/JbV/XBLVTRfc94ovwvGsVlOGlMsa8gSXYnPBvFB1h4dHc+4Q6CNQ6OXjQtM
 viHNPGfjXj8/qAVQYosQIwMCHTtTioI++dwlzJko=
Received: by mx.zohomail.com with SMTPS id 1765996078717246.23602182304217;
 Wed, 17 Dec 2025 10:27:58 -0800 (PST)
Date: Wed, 17 Dec 2025 18:27:54 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 1/1] drm/panthor: Support partial unmaps of huge pages
Message-ID: <tjwdmbdwwubqivdin7mygxadb7catmvebod2plmizuairdjm6s@zdnm66zfb242>
References: <20251214202426.3186811-1-adrian.larumbe@collabora.com>
 <20251214202426.3186811-2-adrian.larumbe@collabora.com>
 <496443c7-b9f6-4ebb-b409-785236c03780@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <496443c7-b9f6-4ebb-b409-785236c03780@arm.com>
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

Hi Steven,

On 17.12.2025 14:23, Steven Price wrote:
> On 14/12/2025 20:24, Adrián Larumbe wrote:
> > Commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
> > behavior") did away with the treatment of partial unmaps of huge IOPTEs.
> >
> > In the case of Panthor, that means an attempt to run a VM_BIND unmap
> > operation on a memory region whose start address and size aren't 2MiB
> > aligned, in the event it intersects with a huge page, would lead to ARM
> > IOMMU management code to fail and a warning being raised.
> >
> > Presently, and for lack of a better alternative, it's best to have
> > Panthor handle partial unmaps at the driver level, by unmapping entire
> > huge pages and remapping the difference between them and the requested
> > unmap region.
> >
> > This could change in the future when the VM_BIND uAPI is expanded to
> > enforce huge page alignment and map/unmap operational constraints that
> > render this code unnecessary.
> >
> > When a partial unmap for a huge PTE is attempted, we also need to expand
> > the locked region to encompass whole huge pages.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 99 ++++++++++++++++++++++++---
> >  1 file changed, 91 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index a3e5e77fc9ed..cabee92e9580 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -547,12 +547,12 @@ static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd
> >  	return status;
> >  }
> >
> > -static u64 pack_region_range(struct panthor_device *ptdev, u64 region_start, u64 size)
> > +static u64 pack_region_range(struct panthor_device *ptdev, u64 *region_start, u64 *size)
> >  {
> >  	u8 region_width;
> > -	u64 region_end = region_start + size;
> > +	u64 region_end = *region_start + *size;
> >
> > -	if (drm_WARN_ON_ONCE(&ptdev->base, !size))
> > +	if (drm_WARN_ON_ONCE(&ptdev->base, !*size))
> >  		return 0;
> >
> >  	/*
> > @@ -563,16 +563,17 @@ static u64 pack_region_range(struct panthor_device *ptdev, u64 region_start, u64
> >  	 * change, the desired region starts with this bit (and subsequent bits)
> >  	 * zeroed and ends with the bit (and subsequent bits) set to one.
> >  	 */
> > -	region_width = max(fls64(region_start ^ (region_end - 1)),
> > +	region_width = max(fls64(*region_start ^ (region_end - 1)),
> >  			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
> >
> >  	/*
> >  	 * Mask off the low bits of region_start (which would be ignored by
> >  	 * the hardware anyway)
> >  	 */
> > -	region_start &= GENMASK_ULL(63, region_width);
> > +	*region_start &= GENMASK_ULL(63, region_width);
> > +	*size = 1ull << (region_width + 1);
> >
> > -	return region_width | region_start;
> > +	return region_width | *region_start;
> >  }
> >
> >  static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
> > @@ -1691,12 +1692,19 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
> >  	struct panthor_device *ptdev = vm->ptdev;
> >  	int ret = 0;
> >
> > +	/* sm_step_remap() can call panthor_vm_lock_region() to account for
> > +	 * the wider unmap needed when doing a partial huge page unamp. We
> > +	 * need to ignore the lock if it's already part of the locked region.
> > +	 */
> > +	if (start >= vm->locked_region.start &&
> > +	    start + size <= vm->locked_region.start + vm->locked_region.size)
> > +		return 0;
> > +
> >  	mutex_lock(&ptdev->mmu->as.slots_lock);
> > -	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
> >  	if (vm->as.id >= 0 && size) {
> >  		/* Lock the region that needs to be updated */
> >  		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
> > -			    pack_region_range(ptdev, start, size));
> > +			    pack_region_range(ptdev, &start, &size));
> >
> >  		/* If the lock succeeded, update the locked_region info. */
> >  		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
> > @@ -2169,6 +2177,48 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
> >  	return 0;
> >  }
> >
> > +static bool
> > +iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
> > +{
> > +	const struct page *pg;
> > +	pgoff_t bo_offset;
> > +
> > +	bo_offset = addr - op->va.addr + op->gem.offset;
> > +	pg = to_panthor_bo(op->gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
> > +
> > +	return folio_size(page_folio(pg)) >= SZ_2M;
> > +}
> > +
> > +static void
> > +unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
> > +		     u64 *unmap_start, u64 *unmap_range)
> > +{
> > +	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
> > +
> > +	unmap_end = *unmap_start + *unmap_range;
> > +	aligned_unmap_start = ALIGN_DOWN(*unmap_start, SZ_2M);
> > +	aligned_unmap_end = ALIGN(unmap_end, SZ_2M);
> > +
> > +	/* If we're dealing with a huge page, make sure the unmap region is
> > +	 * aligned on the start of the page.
> > +	 */
> > +	if (op->prev && aligned_unmap_start < *unmap_start &&
> > +	    op->prev->va.addr <= aligned_unmap_start &&
> > +	    iova_mapped_as_huge_page(op->prev, *unmap_start)) {
> > +		*unmap_range += *unmap_start - aligned_unmap_start;
> > +		*unmap_start = aligned_unmap_start;
> > +	}
> > +
> > +	/* If we're dealing with a huge page, make sure the unmap region is
> > +	 * aligned on the end of the page.
> > +	 */
> > +	if (op->next && aligned_unmap_end > unmap_end &&
> > +	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
> > +	    iova_mapped_as_huge_page(op->next, unmap_end - 1)) {
> > +		*unmap_range += aligned_unmap_end - unmap_end;
> > +	}
> > +}
> > +
> >  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
> >  				       void *priv)
> >  {
> > @@ -2177,16 +2227,49 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
> >  	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
> >  	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
> >  	u64 unmap_start, unmap_range;
> > +	int ret;
> >
> >  	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> > +	/*
> > +	 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
> > +	 * so when a partial unmap is requested, we must first unmap the entire huge
> > +	 * page and then remap the difference between the huge page minus the requested
> > +	 * unmap region. Calculating the right start address and range for the expanded
> > +	 * unmap operation is the responsibility of the following function.
> > +	 */
> > +	unmap_hugepage_align(&op->remap, &unmap_start, &unmap_range);
> > +
> > +	/* If the range changed, we might have to lock a wider region to guarantee
> > +	 * atomicity. panthor_vm_lock_region() bails out early if the new region
> > +	 * is already part of the locked region, so no need to do this check here.
> > +	 */
> > +	panthor_vm_lock_region(vm, unmap_start, unmap_start + unmap_range);
>
> panthor_vm_lock_region() takes the start and *size*, but here you are
> passing the start and end addresses. So this is going to lock more than
> you intend.
>
> Thanks,
> Steve

Good catch, thanks a lot.

I'll be sending v5 with a fix for this and then a minor nit pointed by Boris before the end of the day.

> >  	panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
> >
> >  	if (op->remap.prev) {
> > +		struct panthor_gem_object *bo = to_panthor_bo(op->remap.prev->gem.obj);
> > +		u64 offset = op->remap.prev->gem.offset + unmap_start - op->remap.prev->va.addr;
> > +		u64 size = op->remap.prev->va.addr + op->remap.prev->va.range - unmap_start;
> > +
> > +		ret = panthor_vm_map_pages(vm, unmap_start, flags_to_prot(unmap_vma->flags),
> > +					   bo->base.sgt, offset, size);
> > +		if (ret)
> > +			return ret;
> > +
> >  		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
> >  		panthor_vma_init(prev_vma, unmap_vma->flags);
> >  	}
> >
> >  	if (op->remap.next) {
> > +		struct panthor_gem_object *bo = to_panthor_bo(op->remap.next->gem.obj);
> > +		u64 addr = op->remap.next->va.addr;
> > +		u64 size = unmap_start + unmap_range - op->remap.next->va.addr;
> > +
> > +		ret = panthor_vm_map_pages(vm, addr, flags_to_prot(unmap_vma->flags),
> > +					   bo->base.sgt, op->remap.next->gem.offset, size);
> > +		if (ret)
> > +			return ret;
> > +
> >  		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
> >  		panthor_vma_init(next_vma, unmap_vma->flags);
> >  	}
