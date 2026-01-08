Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55048D035D8
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0112A10E74F;
	Thu,  8 Jan 2026 14:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9440510E74F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:33:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29FED497;
 Thu,  8 Jan 2026 06:33:11 -0800 (PST)
Received: from [10.1.33.26] (e122027.cambridge.arm.com [10.1.33.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E063B3F5A1;
 Thu,  8 Jan 2026 06:33:16 -0800 (PST)
Message-ID: <a4a4da6c-889c-4429-812e-b89c95f081ca@arm.com>
Date: Thu, 8 Jan 2026 14:33:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
References: <20260108123325.1088195-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260108123325.1088195-1-boris.brezillon@collabora.com>
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

On 08/01/2026 12:33, Boris Brezillon wrote:
> drm_gem_put_pages(), which we rely on for returning BO pages to shmem,
> assume per-folio refcounting and not per-page. If we call
> shmem_read_mapping_page() per-page, we break this assumption and leak
> pages every time we get a huge page allocated.
> 
> v2:
> - Rework the logic for() loop to better match the folio-granular
>   allocation scheme
> 
> Cc: Loïc Molinari <loic.molinari@collabora.com>
> Fixes: c12e9fcb5a5a ("drm/panfrost: Introduce huge tmpfs mountpoint option")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks good to me!

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 40 +++++++++++++++----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 02ccc05e23bb..3f8e7eced1c0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -586,12 +586,12 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
>  static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  				       u64 addr)
>  {
> -	int ret, i;
> +	int ret;
>  	struct panfrost_gem_mapping *bomapping;
>  	struct panfrost_gem_object *bo;
>  	struct address_space *mapping;
>  	struct drm_gem_object *obj;
> -	pgoff_t page_offset;
> +	pgoff_t page_offset, nr_pages;
>  	struct sg_table *sgt;
>  	struct page **pages;
>  
> @@ -612,6 +612,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	addr &= ~((u64)SZ_2M - 1);
>  	page_offset = addr >> PAGE_SHIFT;
>  	page_offset -= bomapping->mmnode.start;
> +	nr_pages = bo->base.base.size >> PAGE_SHIFT;
>  
>  	obj = &bo->base.base;
>  
> @@ -625,8 +626,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  			goto err_unlock;
>  		}
>  
> -		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
> -				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
> +		pages = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
>  		if (!pages) {
>  			kvfree(bo->sgts);
>  			bo->sgts = NULL;
> @@ -648,20 +648,30 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	mapping = bo->base.base.filp->f_mapping;
>  	mapping_set_unevictable(mapping);
>  
> -	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> -		/* Can happen if the last fault only partially filled this
> -		 * section of the pages array before failing. In that case
> -		 * we skip already filled pages.
> -		 */
> -		if (pages[i])
> -			continue;
> +	for (pgoff_t pg = page_offset; pg < page_offset + NUM_FAULT_PAGES;) {
> +		bool already_owned = false;
> +		struct folio *folio;
>  
> -		pages[i] = shmem_read_mapping_page(mapping, i);
> -		if (IS_ERR(pages[i])) {
> -			ret = PTR_ERR(pages[i]);
> -			pages[i] = NULL;
> +		folio = shmem_read_folio(mapping, pg);
> +		if (IS_ERR(folio)) {
> +			ret = PTR_ERR(folio);
>  			goto err_unlock;
>  		}
> +
> +		pg &= ~(folio_nr_pages(folio) - 1);
> +		for (u32 i = 0; i < folio_nr_pages(folio) && pg < nr_pages; i++) {
> +			if (pages[pg])
> +				already_owned = true;
> +
> +			pages[pg++] = folio_page(folio, i);
> +		}
> +
> +		/* We always fill the page array at a folio granularity so
> +		 * there's no valid reason for a folio range to be partially
> +		 * populated.
> +		 */
> +		if (drm_WARN_ON(&pfdev->base, already_owned))
> +			folio_put(folio);
>  	}
>  
>  	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,

