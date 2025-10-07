Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E6BBFE36
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 03:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F2610E0F6;
	Tue,  7 Oct 2025 01:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="knMMRUYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDF610E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 01:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759799046; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IcTXBPvBCrNaidElgqGBbgPhOO5AchTraz34AvPFU08SLvZ6MsYEHph36RgQfX43ZYI1NzLb+mC6AJj28ksTZ4jG0YXgiwRYKmvAm17MsXd/L7hdHb2kdcamJmHsk+FJK3820tTg2MKXlWoo0hSnkQs3Cr9k6u0w7Vc24zldQro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759799046;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PPooEoCfXN3rHkZVa/iA09WWaPbuKols5jtsIKC340s=; 
 b=bZNkyExisfmVaMPTph9HhS4+kHcscUS6NuGb1M6a2OqhmEK3QcuOu9smiylktG/tQww/6rwhiKK2dlVsipCIPuriCUWfKZuGu+fPImYu0E0AC0GllASuNz+Upc7bXC2TbIlC7zpcisLbBOL0G8Y2ajd0ka24u4kDhGlcoO40g0M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759799046; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=PPooEoCfXN3rHkZVa/iA09WWaPbuKols5jtsIKC340s=;
 b=knMMRUYCLIwlj3Q5aFtkRRNW7+vz9a4c1E6XHfuPbNeQYknf2SQIaAw1/1y/9yfR
 CYbhqmEfs8xu2pCfMb1wntlF7ax4SV4lOdqRsAYlI6Hea9/e9alpyZKheKgqFkN/3aT
 7LkL71gDgQwSUv7YyB/V8UH291t+0VfmMP6/6BW4=
Received: by mx.zohomail.com with SMTPS id 175979904468472.88644899195572;
 Mon, 6 Oct 2025 18:04:04 -0700 (PDT)
Date: Tue, 7 Oct 2025 02:04:00 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 05/10] drm/panfrost: Handle page mapping failure
Message-ID: <42bsn4ngim6aucg5pzcs4knpvwn6bbvud7lf22tr7kmrdrgphm@vncex4yi2oc6>
References: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
 <20251001022039.1215976-6-adrian.larumbe@collabora.com>
 <20251001125838.10200ff2@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001125838.10200ff2@fedora>
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

On 01.10.2025 12:58, Boris Brezillon wrote:
> On Wed,  1 Oct 2025 03:20:26 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > When mapping the pages of a BO, either a heap type at page fault time or
> > else a non-heap BO at object creation time, if the ARM page table mapping
> > function fails, we unmap what had been mapped so far and bail out.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c | 49 ++++++++++++++++++++++---
> >  1 file changed, 44 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > index cf272b167feb..fb17c32855a5 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > @@ -393,13 +393,32 @@ static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
> >  	pm_runtime_put_autosuspend(pfdev->base.dev);
> >  }
> >
> > +static void mmu_unmap_range(struct panfrost_mmu *mmu, u64 iova, size_t len)
> > +{
> > +	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
> > +	size_t pgsize, unmapped_len = 0;
> > +	size_t unmapped_page, pgcount;
> > +
> > +	while (unmapped_len < len) {
> > +		pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
> > +
> > +		unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
> > +		WARN_ON(unmapped_page != pgsize * pgcount);
> > +
> > +		iova += pgsize * pgcount;
> > +		unmapped_len += pgsize * pgcount;
> > +	}
> > +}
> > +
> >  static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
> >  		      u64 iova, int prot, struct sg_table *sgt)
> >  {
> >  	unsigned int count;
> >  	struct scatterlist *sgl;
> >  	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
> > +	size_t total_mapped = 0;
> >  	u64 start_iova = iova;
> > +	int ret;
> >
> >  	for_each_sgtable_dma_sg(sgt, sgl, count) {
> >  		unsigned long paddr = sg_dma_address(sgl);
> > @@ -413,10 +432,14 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
> >  			size_t pgcount, mapped = 0;
> >  			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
> >
> > -			ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
> > +			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
> >  				       GFP_KERNEL, &mapped);
> > +			if (ret)
> > +				goto err_unmap_pages;
> > +
> >  			/* Don't get stuck if things have gone wrong */
> >  			mapped = max(mapped, pgsize);
> > +			total_mapped += mapped;
> >  			iova += mapped;
> >  			paddr += mapped;
> >  			len -= mapped;
> > @@ -426,6 +449,10 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
> >  	panfrost_mmu_flush_range(pfdev, mmu, start_iova, iova - start_iova);
> >
> >  	return 0;
> > +
> > +err_unmap_pages:
> > +	mmu_unmap_range(mmu, start_iova, total_mapped);
> > +	return ret;
> >  }
> >
> >  int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
> > @@ -436,6 +463,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
> >  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
> >  	struct sg_table *sgt;
> >  	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
> > +	int ret;
> >
> >  	if (WARN_ON(mapping->active))
> >  		return 0;
> > @@ -447,11 +475,18 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
> >  	if (WARN_ON(IS_ERR(sgt)))
> >  		return PTR_ERR(sgt);
> >
> > -	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
> > -		   prot, sgt);
> > +	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
> > +			 prot, sgt);
> > +	if (ret)
> > +		goto err_put_pages;
> > +
> >  	mapping->active = true;
> >
> >  	return 0;
> > +
> > +err_put_pages:
> > +	drm_gem_shmem_put_pages_locked(shmem);
> > +	return ret;
> >  }
> >
> >  void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
> > @@ -635,8 +670,10 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
> >  	if (ret)
> >  		goto err_map;
> >
> > -	mmu_map_sg(pfdev, bomapping->mmu, addr,
> > -		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
> > +	ret = mmu_map_sg(pfdev, bomapping->mmu, addr,
> > +			 IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
> > +	if (ret)
> > +		goto err_mmu_map_sg;
> >
> >  	bomapping->active = true;
> >  	bo->heap_rss_size += SZ_2M;
> > @@ -650,6 +687,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
> >
> >  	return 0;
> >
> > +err_mmu_map_sg:
> > +	dma_unmap_sgtable(pfdev->base.dev, sgt, DMA_BIDIRECTIONAL, 0);
>
> You also need to clear the sgts[]/pages[] entries you added earlier,
> otherwise the next time you have a fault it will bail-out before
> attempting an mmu_map_sg().
>
> IIRC, Dmitry had a similar fix in his shmem-shrinker series.

Went over the mailing list and I think the commit you had in mind was 1fc9af813b25 ("drm/panfrost: Fix the error path in panfrost_mmu_map_fault_addr()")

I suspect there's a problem with the present code. If shmem_read_mapping_page() fails for let's say, page_offset+5, then when the interrupt is triggered
again, because the page array had already been allocated and pages[page_offset] populated in the first try, then it would bail out immediately even though
most pages haven't been retrieved yet.

On the other hand, depopulating the array for the IRQ to be triggered again seems wasteful. Because for any virtual address, a fault will map all the
pages within its 2MiB boundaries, maybe we could change

if (pages[page_offset]) {
	/* Pages are already mapped, bail out. */
	goto out;
}

to 'pages[page_offset+NUM_FAULT_PAGES-1]'

And then, in the event that mmu_map_sg() fails:

err_mmu_map_sg:
	pages[page_offset+NUM_FAULT_PAGES-1] = NULL;
	dma_unmap_sgtable(pfdev->base.dev, sgt, DMA_BIDIRECTIONAL, 0);

So that it'll only fetch the very last page instead of all of them in case of a page fault reattempt.

> >  err_map:
> >  	sg_free_table(sgt);
> >  err_unlock:


Adrian Larumbe
