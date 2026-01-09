Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B042AD0B520
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAA610E909;
	Fri,  9 Jan 2026 16:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YEl3xCx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECA510E917
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767976935; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=agtmgCfgpSkBJCtPp9cTO2Dt1yyWcd8bmOguw/tL56rf7viyClxbM10m6Uf+uIx7nQ8Cv+iQmP0wp0PgSJSmT05q/SRxS3wFM2D5bT8w8ZPdmaLghl/xqsNFdPmh7QzTtvPmGpTxrposqS9QdOa7eDN5onCSXdQpANdLxc7L46s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767976935;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JNTejUwMiSEdSNxf3cyXoBf3DYKoIBzToWE3YlySGNo=; 
 b=PwBrbsPgqCYiwxr+sP0nlLPDC4lwXqiQWsmTEUiP6LpUVg6sIMWx2C6NDx0oU76tVjVXQMjUXgy7N21S5WaS7oXXPcJPja8AdQG0QdocqsEF1Pvu3oGnQVfDWwYzXCpLtePhAXTFhgLS98+Iq38t5qz58HZNacxD8HxIxN9OG/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767976935; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=JNTejUwMiSEdSNxf3cyXoBf3DYKoIBzToWE3YlySGNo=;
 b=YEl3xCx8ho8xsTyJWZOznuHcY8r32ioVXOn+KHN/R+IL8K9t4L4u3pj+YeQyPb+u
 DDa4YCgqP13sYxkbQenTN8BoNZGpXHT2Mo2e7JGZiEnkX1nPq/It4Nwn3R6d4I4iJzs
 pOxJAojuyQPut6e9H8vdwOhyh6k16aGwxt0oQFPY=
Received: by mx.zohomail.com with SMTPS id 1767976933626933.7246823335041;
 Fri, 9 Jan 2026 08:42:13 -0800 (PST)
Date: Fri, 9 Jan 2026 16:42:09 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
Message-ID: <mbyabxygvpdhuab2jablztgnsnvt3czpx4yxz2fvl2knadnzda@rjah5t2ekity>
References: <20260108123325.1088195-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108123325.1088195-1-boris.brezillon@collabora.com>
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

Queued to drm-misc-next.

On 08.01.2026 13:33, Boris Brezillon wrote:
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
> --
> 2.52.0

Adrian Larumbe
