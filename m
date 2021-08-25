Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B613F796E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 17:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BCA6E372;
	Wed, 25 Aug 2021 15:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEC76E329;
 Wed, 25 Aug 2021 15:49:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B57F6108F;
 Wed, 25 Aug 2021 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629906564;
 bh=FVD2vqdsUZTR9hZG05ACoaP6ReYdgDUa885m2ElXSE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAiwhNJ1ACq2z2H2TMp9dVF76jCCuZqsMCCYfkazWMyoAgJqTgQzIbM/bwgH2Ci8T
 9rnvGNiiu2J1lVNdcQUIhbB8jv0+IcWrnzLrr1K2B8jSpZ5TjYoqEAgzEwG5cjyE+X
 vHLFfu4r70i7cCH1w8cKQUTcURZmxFpzcqxbt0cZ6UFMXB54n50Uw8HuN3C6Ow12Q7
 EPNBfCXZY5gvFPoWY8Ja1kzrkP8EPpMQo7srRrOUNGU+1AO7uMPiKitzJurcKStCgb
 hmEpCrWdwrfqQImLQA+tojsCLnsnCHPdvs440xdif865dG9JR5HZzIqBLBmM85Nfw1
 FHvU8nF1D6lSw==
Date: Wed, 25 Aug 2021 08:49:23 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com,
 jglisse@redhat.com
Subject: Re: [PATCH v1 01/14] ext4/xfs: add page refcount helper
Message-ID: <20210825154923.GF12640@magnolia>
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825034828.12927-2-alex.sierra@amd.com>
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

On Tue, Aug 24, 2021 at 10:48:15PM -0500, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> There are several places where ZONE_DEVICE struct pages assume a reference
> count == 1 means the page is idle and free. Instead of open coding this,
> add a helper function to hide this detail.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks fine to me,
Acked-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
> v3:
> [AS]: rename dax_layout_is_idle_page func to dax_page_unused
> 
> v4:
> [AS]: This ref count functionality was missing on fuse/dax.c.
> ---
>  fs/dax.c            |  4 ++--
>  fs/ext4/inode.c     |  5 +----
>  fs/fuse/dax.c       |  4 +---
>  fs/xfs/xfs_file.c   |  4 +---
>  include/linux/dax.h | 10 ++++++++++
>  5 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 62352cbcf0f4..c387d09e3e5a 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -369,7 +369,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
>  	for_each_mapped_pfn(entry, pfn) {
>  		struct page *page = pfn_to_page(pfn);
>  
> -		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
> +		WARN_ON_ONCE(trunc && !dax_page_unused(page));
>  		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
>  		page->mapping = NULL;
>  		page->index = 0;
> @@ -383,7 +383,7 @@ static struct page *dax_busy_page(void *entry)
>  	for_each_mapped_pfn(entry, pfn) {
>  		struct page *page = pfn_to_page(pfn);
>  
> -		if (page_ref_count(page) > 1)
> +		if (!dax_page_unused(page))
>  			return page;
>  	}
>  	return NULL;
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index fe6045a46599..05ffe6875cb1 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3971,10 +3971,7 @@ int ext4_break_layouts(struct inode *inode)
>  		if (!page)
>  			return 0;
>  
> -		error = ___wait_var_event(&page->_refcount,
> -				atomic_read(&page->_refcount) == 1,
> -				TASK_INTERRUPTIBLE, 0, 0,
> -				ext4_wait_dax_page(ei));
> +		error = dax_wait_page(ei, page, ext4_wait_dax_page);
>  	} while (error == 0);
>  
>  	return error;
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index ff99ab2a3c43..2b1f190ba78a 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -677,9 +677,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
>  		return 0;
>  
>  	*retry = true;
> -	return ___wait_var_event(&page->_refcount,
> -			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
> -			0, 0, fuse_wait_dax_page(inode));
> +	return dax_wait_page(inode, page, fuse_wait_dax_page);
>  }
>  
>  /* dmap_end == 0 leads to unmapping of whole file */
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 396ef36dcd0a..182057281086 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -840,9 +840,7 @@ xfs_break_dax_layouts(
>  		return 0;
>  
>  	*retry = true;
> -	return ___wait_var_event(&page->_refcount,
> -			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
> -			0, 0, xfs_wait_dax_page(inode));
> +	return dax_wait_page(inode, page, xfs_wait_dax_page);
>  }
>  
>  int
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index b52f084aa643..8b5da1d60dbc 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
>  	return mapping->host && IS_DAX(mapping->host);
>  }
>  
> +static inline bool dax_page_unused(struct page *page)
> +{
> +	return page_ref_count(page) == 1;
> +}
> +
> +#define dax_wait_page(_inode, _page, _wait_cb)				\
> +	___wait_var_event(&(_page)->_refcount,				\
> +		dax_page_unused(_page),				\
> +		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
> +
>  #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
>  void hmem_register_device(int target_nid, struct resource *r);
>  #else
> -- 
> 2.32.0
> 
