Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3257CBB996
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 12:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80D410E44F;
	Sun, 14 Dec 2025 11:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IsxgGdqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3EF10E44F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765710322; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TV5g+rpMrS2fYZv2Bjyy41UPpplxIrJau/xmXbYhG/doPDr0cz+fVRHtTJDqn3oYBBujf/Lf+GAbxkwpGfG0Up4ROou9rxSB5Gq6lcV2EjBmI0uMloa78J6v59T8nEVsAkIqt/rdrORRlKDObR0zTpyHrBDzlJKOVMgvpGRDGF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765710322;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Bu0/hJvsYoho/6nv8txv4lEhnLJ4NJTkbYW8HNXALdY=; 
 b=Itzr/KSaAOV/5DBByw4TJEeZgB8IEl1HeejSWNereQcpJNOubBLE6bfwI9JKMA6cg0bbmXMldRrtPv1kCpFwXbfvTepBPBffxPY4lF9BPjoUXaG/VRYfTCrFobcS+9FMmwenhnHUOaMgvonPjQCN7A0JV7aHhjMxUX38jrfco08=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765710322; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=Bu0/hJvsYoho/6nv8txv4lEhnLJ4NJTkbYW8HNXALdY=;
 b=IsxgGdqFMcpn/BhgFOPRAVooVzfWy6ncPGwzysgIH7/YHSJknmEJbp2dg08Alfjm
 rEVy3rSrRZ0rAktE2Ljb+jjyLgt4sYDjyfBHK1n1q33ips6QUSQTIMwLc9eMhRUs/xm
 QT02xztkAajuQNMFDL198sRsJOlV1vJZogYc5WtI=
Received: by mx.zohomail.com with SMTPS id 1765710320948398.3543243284731;
 Sun, 14 Dec 2025 03:05:20 -0800 (PST)
Date: Sun, 14 Dec 2025 11:05:16 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 1/1] drm/panthor: Support partial unmaps of huge pages
Message-ID: <knhjb3czns4cvnooqyhk56baczezlbnckzufjqi3xqziftm574@t2de7hepic7t>
References: <20251213190835.2444075-1-adrian.larumbe@collabora.com>
 <20251213190835.2444075-2-adrian.larumbe@collabora.com>
 <20251214103928.2dc0690b@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251214103928.2dc0690b@fedora>
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

On 14.12.2025 10:39, Boris Brezillon wrote:
> On Sat, 13 Dec 2025 19:08:33 +0000
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
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
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 66 +++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 183da30fa500..f11340a7f59e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -2110,6 +2110,44 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
> >  	return 0;
> >  }
> >
> > +static bool
> > +iova_mapped_as_huge_page(const struct panthor_vma *vma, u64 addr)
> > +{
> > +	const struct page *pg;
> > +	pgoff_t bo_offset;
> > +
> > +	bo_offset = addr - vma->base.va.addr + vma->base.gem.offset;
> > +	pg = to_panthor_bo(vma->base.gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
> > +
> > +	return (folio_size(page_folio(pg)) >= SZ_2M);
>
> nit: you can drop the extra ()
>
> 	return folio_size(page_folio(pg)) >= SZ_2M;
>
> > +}
> > +
> > +static void
> > +get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
> > +			const struct panthor_vma *unmap_vma,
> > +			u64 *unmap_start, u64 *unmap_range)
> > +{
> > +	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
> > +
> > +	drm_gpuva_op_remap_to_unmap_range(op, unmap_start, unmap_range);
> > +	unmap_end = *unmap_start + *unmap_range;
> > +
> > +	aligned_unmap_start = ALIGN_DOWN(*unmap_start, SZ_2M);
> > +	if (op->prev && aligned_unmap_start < *unmap_start &&
> > +	    op->prev->va.addr <= aligned_unmap_start &&
> > +	    iova_mapped_as_huge_page(unmap_vma, *unmap_start)) {
> > +		*unmap_range += *unmap_start - aligned_unmap_start;
> > +		*unmap_start = aligned_unmap_start;
> > +	}
> > +
> > +	aligned_unmap_end = ALIGN(unmap_end, SZ_2M);
> > +	if (op->next && aligned_unmap_end > unmap_end &&
> > +	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
> > +	    iova_mapped_as_huge_page(unmap_vma, unmap_end - 1)) {
> > +		*unmap_range += aligned_unmap_end - unmap_end;
> > +	}
> > +}
> > +
> >  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
> >  				       void *priv)
> >  {
> > @@ -2121,16 +2159,44 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
> >  	int ret;
> >
> >  	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> > +
> > +	/*
> > +	 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
> > +	 * so when a partial unmap is requested, we must first unmap the entire huge
> > +	 * page and then remap the difference between the huge page minus the requested
> > +	 * unmap region. Calculating the right offsets and ranges for the different unmap
> > +	 * and map operations is the responsibility of the following function.
> > +	 */
> > +	get_map_unmap_intervals(&op->remap, unmap_vma, &unmap_start, &unmap_range);
>
> Unfortunately, after 5b8fcf4777e7 ("drm/panthor: Add support for atomic
> page table updates"), that's not enough, you also need to extend the
> locked region (see [1]).

Oh yeah, completely forgot about that. Let me handle it and will send out v4 asap.

> > +
> >  	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
> >  	if (ret)
> >  		return ret;
> >
> >  	if (op->remap.prev) {
> > +		ret = panthor_vm_map_pages(vm, unmap_start,
> > +					   flags_to_prot(unmap_vma->flags),
> > +					   to_drm_gem_shmem_obj(op->remap.prev->gem.obj)->sgt,
> > +					   op->remap.prev->gem.offset +
> > +					   (unmap_start - op->remap.prev->va.addr),
> > +					   op->remap.prev->va.addr + op->remap.prev->va.range -
> > +					   unmap_start);
> > +		if (ret)
> > +			return ret;
> > +
> >  		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
> >  		panthor_vma_init(prev_vma, unmap_vma->flags);
> >  	}
> >
> >  	if (op->remap.next) {
> > +		ret = panthor_vm_map_pages(vm, op->remap.next->va.addr,
> > +					   flags_to_prot(unmap_vma->flags),
> > +					   to_drm_gem_shmem_obj(op->remap.next->gem.obj)->sgt,
> > +					   op->remap.next->gem.offset,
> > +					   unmap_start + unmap_range - op->remap.next->va.addr);
> > +		if (ret)
> > +			return ret;
> > +
> >  		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
> >  		panthor_vma_init(next_vma, unmap_vma->flags);
> >  	}
>
> [1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/b4b677796c8c33b5be60184bca099ef8fd8c5548

Adrian Larumbe
