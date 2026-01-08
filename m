Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D6D021CA
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8CE10E09E;
	Thu,  8 Jan 2026 10:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90DEA10E09E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:28:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4239E497;
 Thu,  8 Jan 2026 02:27:57 -0800 (PST)
Received: from [10.1.33.26] (e122027.cambridge.arm.com [10.1.33.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C04763F5A1;
 Thu,  8 Jan 2026 02:28:02 -0800 (PST)
Message-ID: <bca803d3-692c-4939-a342-e3e018b25823@arm.com>
Date: Thu, 8 Jan 2026 10:28:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
References: <20260108101025.933843-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260108101025.933843-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Happy new year!

On 08/01/2026 10:10, Boris Brezillon wrote:
> drm_gem_put_pages(), which we rely on for returning BO pages to shmem,
> assume per-folio refcounting and not per-page. If we call
> shmem_read_mapping_page() per-page, we break this assumption and leak
> pages every time we get a huge page allocated.
> 
> Cc: Loïc Molinari <loic.molinari@collabora.com>
> Fixes: c12e9fcb5a5a ("drm/panfrost: Introduce huge tmpfs mountpoint option")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 37 +++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 8f3b7a7b6ad0..9b61ad98a77e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -595,6 +595,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	pgoff_t page_offset;
>  	struct sg_table *sgt;
>  	struct page **pages;
> +	u32 nr_pages;
>  
>  	bomapping = addr_to_mapping(pfdev, as, addr);
>  	if (!bomapping)
> @@ -613,6 +614,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	addr &= ~((u64)SZ_2M - 1);
>  	page_offset = addr >> PAGE_SHIFT;
>  	page_offset -= bomapping->mmnode.start;
> +	nr_pages = bo->base.base.size >> PAGE_SHIFT;
>  
>  	obj = &bo->base.base;
>  
> @@ -626,8 +628,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  			goto err_unlock;
>  		}
>  
> -		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
> -				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
> +		pages = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
>  		if (!pages) {
>  			kvfree(bo->sgts);
>  			bo->sgts = NULL;
> @@ -650,6 +651,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	mapping_set_unevictable(mapping);
>  
>  	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> +		struct folio *folio;
> +
>  		/* Can happen if the last fault only partially filled this
>  		 * section of the pages array before failing. In that case
>  		 * we skip already filled pages.
> @@ -657,12 +660,34 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  		if (pages[i])
>  			continue;
>  
> -		pages[i] = shmem_read_mapping_page(mapping, i);
> -		if (IS_ERR(pages[i])) {
> -			ret = PTR_ERR(pages[i]);
> -			pages[i] = NULL;
> +		folio = shmem_read_folio(mapping, i);
> +		if (IS_ERR(folio)) {
> +			ret = PTR_ERR(folio);
>  			goto err_unlock;
>  		}
> +
> +		/* We always fill the page array at a folio granularity so
> +		 * there's no reason for a missing page to not be the first
> +		 * in the folio. We want to ensure that's the case to avoid
> +		 * unbalanced folio_{get,put}() leading to leaks, because
> +		 * drm_gem_put_pages() assumes per-folio refcounting not
> +		 * per-page.
> +		 */

I'm a little uneasy about this reasoning. Above we do mask the address
to be a multiple of 2MB, but the folio could (in theory at least) be
bigger than 2MB. So I don't see what stops a GPU job faulting in the
middle of a buffer and triggering this warning.

Can we not walk backwards to the beginning of the folio if the address
isn't aligned and check that?

> +		if (WARN_ON(folio_file_page(folio, i) != folio_page(folio, 0))) {
> +			folio_put(folio);
> +			ret = -EINVAL;
> +			goto err_unlock;
> +		}
> +
> +		/* Fill a folio worth of pages, even if it goes beyond
> +		 * NUM_FAULT_PAGES, otherwise we'll end up with unbalanced
> +		 * refcounting next time we hit an unmapped section crossing
> +		 * this folio.
> +		 */
> +		for (u32 j = 0; j < folio_nr_pages(folio) && i < nr_pages; j++)

This "i < nr_pages" check is wrong - presumably it should be "i + j <
nr_pages".

> +			pages[i + j] = folio_page(folio, j);
> +
> +		i += folio_nr_pages(folio) - 1;

I feel like the outer for() loop needs reworking into a different form.
It makes complete sense to walk in terms of folios, but we've got this
weird mix of pages and folios going on, leading to odd things like this
"- 1" fix up here.

Thanks,
Steve

>  	}
>  
>  	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,

