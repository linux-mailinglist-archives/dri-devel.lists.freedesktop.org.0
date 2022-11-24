Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E58F637FCB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 20:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15D810E24B;
	Thu, 24 Nov 2022 19:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85310E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 19:50:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5AC7FA;
 Thu, 24 Nov 2022 20:50:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669319450;
 bh=zk8K1zRc/i3yDBOcEGw+V0PYmiFnDOIN6RwXQD5VgIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DGjS2nQdGwcSb27NM28rC5PUEM5ZUkdlvEkluNz28sxzxtepPCJGPRScvFjJY9JRS
 fStQ2iSxKrCSRqK9aUcXjp+T8CLilwcg8I7QA9i2nc0MUAHQ+3OExVfkRDTBOknSyf
 qevKb5yVS2620DH4k+wLDTbzeWSMA/3ft6Z0HfQk=
Date: Thu, 24 Nov 2022 21:50:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/dma-helpers: Don't change vma flags
Message-ID: <Y3/LCdkL16u3oubS@pendragon.ideasonboard.com>
References: <20221123172802.1049424-1-daniel.vetter@ffwll.ch>
 <49605c31-be89-d0f9-b4e1-577aaaaf259a@arm.com>
 <Y3+o5GCM+9GeKx64@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3+o5GCM+9GeKx64@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 06:24:52PM +0100, Daniel Vetter wrote:
> On Thu, Nov 24, 2022 at 11:11:21AM +0000, Robin Murphy wrote:
> > On 2022-11-23 17:28, Daniel Vetter wrote:
> > > This code was added in b65e64f7ccd4 ("drm/cma: Use
> > > dma_mmap_writecombine() to mmap buffer"), but does not explain why
> > > it's needed.
> > > 
> > > It should be entirely unnecessary, because remap_pfn_range(), which is
> > > what the various dma_mmap functiosn are built on top of, does already
> > > unconditionally adjust the vma flags:
> > 
> > Not all dma_mmap_*() implementations use remap_pfn_range() though. For
> > instance on ARM where one set of DMA ops uses vm_map_pages(), but AFAICS not
> > all the relevant drivers would set VM_MIXEDMAP to prevent reaching the
> > BUG_ON(vma->vm_flags & VM_PFNMAP) in there.
> 
> Uh a dma_mmap which does not use VM_PFNMAP has pretty good chances of
> being busted, since that allows get_user_pages on these memory
> allocations. And I'm really not sure that's a bright idea ...
> 
> Can you please point me at these dma-ops so that I can try and understand
> what they're trying to do?

I've taken a trip back in time to v3.14, when b65e64f7ccd4 was merged,
and checked the x86, arm and arm64 dma mapping implementations. They all
call remap_pfn_range() except for arm_iommu_mmap_attrs(), which uses
vm_insert_page(). It was implemented as

int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
			struct page *page)
{
	if (addr < vma->vm_start || addr >= vma->vm_end)
		return -EFAULT;
	if (!page_count(page))
		return -EINVAL;
	if (!(vma->vm_flags & VM_MIXEDMAP)) {
		BUG_ON(down_read_trylock(&vma->vm_mm->mmap_sem));
		BUG_ON(vma->vm_flags & VM_PFNMAP);
		vma->vm_flags |= VM_MIXEDMAP;
	}
	return insert_page(vma, addr, page, vma->vm_page_prot);
}

I don't recall if I just hit that BUG_ON() back then, or if I actually
understood what I was doing :-)

Today in mainline arm_iommu_mmap_attrs() uses vm_map_pages(), which
calls vm_insert_page(), and the BUG_ON() is still there.

> > > https://elixir.bootlin.com/linux/v6.1-rc6/source/mm/memory.c#L2518
> > > 
> > > More importantly, it does uncondtionally set VM_PFNMAP, so clearing
> > > that does not make much sense.
> > > 
> > > Patch motived by discussions around enforcing VM_PFNMAP semantics for
> > > all dma-buf users, where Thomas asked why dma helpers will work with
> > > that dma_buf_mmap() contract.
> > > 
> > > References: https://lore.kernel.org/dri-devel/5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de/
> > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >   drivers/gpu/drm/drm_gem_dma_helper.c | 7 ++-----
> > >   1 file changed, 2 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> > > index 1e658c448366..637a5cc62457 100644
> > > --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> > > @@ -525,13 +525,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
> > >   	int ret;
> > >   	/*
> > > -	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
> > > -	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
> > > -	 * the whole buffer.
> > > +	 * Set the vm_pgoff (used as a fake buffer offset by DRM) to 0 as we
> > > +	 * want to map the whole buffer.
> > >   	 */
> > >   	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> > > -	vma->vm_flags &= ~VM_PFNMAP;
> > > -	vma->vm_flags |= VM_DONTEXPAND;
> > >   	if (dma_obj->map_noncoherent) {
> > >   		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);

-- 
Regards,

Laurent Pinchart
