Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496E278904
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 15:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E46F6E372;
	Fri, 25 Sep 2020 13:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E10D6E372;
 Fri, 25 Sep 2020 13:06:04 +0000 (UTC)
IronPort-SDR: 3+YTvPDrdj9y/wvAWz+9hKzyGBc7Wb3rfvfm41wE9qRAAtGL7yoI6KPP08uUI38yz/oJCsywR7
 YC4YL/A2tfrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="223112495"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="223112495"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:05:41 -0700
IronPort-SDR: 5Dwboiqhy5yHPzqfhh5/S6fzq83iIqIUdZO8emD2bnlcA/WE0SaYoeYBpYxDMx5CtVPALBxtts
 ZUeFrbRupJww==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455824158"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:05:34 -0700
Subject: Re: [PATCH 06/11] drm/i915: use vmap in shmem_pin_map
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-7-hch@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9459e195-a412-3357-c53d-4349e600896d@linux.intel.com>
Date: Fri, 25 Sep 2020 14:05:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-7-hch@lst.de>
Content-Language: en-US
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/09/2020 14:58, Christoph Hellwig wrote:
> shmem_pin_map somewhat awkwardly reimplements vmap using
> alloc_vm_area and manual pte setup.  The only practical difference
> is that alloc_vm_area prefeaults the vmalloc area PTEs, which doesn't
> seem to be required here (and could be added to vmap using a flag if
> actually required).  Switch to use vmap, and use vfree to free both the
> vmalloc mapping and the page array, as well as dropping the references
> to each page.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/gt/shmem_utils.c | 76 +++++++--------------------
>   1 file changed, 18 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index 43c7acbdc79dea..f011ea42487e11 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -49,80 +49,40 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
>   	return file;
>   }
>   
> -static size_t shmem_npte(struct file *file)
> -{
> -	return file->f_mapping->host->i_size >> PAGE_SHIFT;
> -}
> -
> -static void __shmem_unpin_map(struct file *file, void *ptr, size_t n_pte)
> -{
> -	unsigned long pfn;
> -
> -	vunmap(ptr);
> -
> -	for (pfn = 0; pfn < n_pte; pfn++) {
> -		struct page *page;
> -
> -		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
> -						   GFP_KERNEL);
> -		if (!WARN_ON(IS_ERR(page))) {
> -			put_page(page);
> -			put_page(page);
> -		}
> -	}
> -}
> -
>   void *shmem_pin_map(struct file *file)
>   {
> -	const size_t n_pte = shmem_npte(file);
> -	pte_t *stack[32], **ptes, **mem;
> -	struct vm_struct *area;
> -	unsigned long pfn;
> -
> -	mem = stack;
> -	if (n_pte > ARRAY_SIZE(stack)) {
> -		mem = kvmalloc_array(n_pte, sizeof(*mem), GFP_KERNEL);
> -		if (!mem)
> -			return NULL;
> -	}
> +	struct page **pages;
> +	size_t n_pages, i;
> +	void *vaddr;
>   
> -	area = alloc_vm_area(n_pte << PAGE_SHIFT, mem);
> -	if (!area) {
> -		if (mem != stack)
> -			kvfree(mem);
> +	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
> +	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
>   		return NULL;
> -	}
>   
> -	ptes = mem;
> -	for (pfn = 0; pfn < n_pte; pfn++) {
> -		struct page *page;
> -
> -		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
> -						   GFP_KERNEL);
> -		if (IS_ERR(page))
> +	for (i = 0; i < n_pages; i++) {
> +		pages[i] = shmem_read_mapping_page_gfp(file->f_mapping, i,
> +						       GFP_KERNEL);
> +		if (IS_ERR(pages[i]))
>   			goto err_page;
> -
> -		**ptes++ = mk_pte(page,  PAGE_KERNEL);
>   	}
>   
> -	if (mem != stack)
> -		kvfree(mem);
> -
> +	vaddr = vmap(pages, n_pages, VM_MAP_PUT_PAGES, PAGE_KERNEL);
> +	if (!vaddr)
> +		goto err_page;
>   	mapping_set_unevictable(file->f_mapping);
> -	return area->addr;
> -
> +	return vaddr;
>   err_page:
> -	if (mem != stack)
> -		kvfree(mem);
> -
> -	__shmem_unpin_map(file, area->addr, pfn);
> +	while (--i >= 0)
> +		put_page(pages[i]);
> +	kvfree(pages);
>   	return NULL;
>   }
>   
>   void shmem_unpin_map(struct file *file, void *ptr)
>   {
>   	mapping_clear_unevictable(file->f_mapping);
> -	__shmem_unpin_map(file, ptr, shmem_npte(file));
> +	vfree(ptr);
>   }
>   
>   static int __shmem_rw(struct file *file, loff_t off,
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
