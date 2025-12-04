Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D10CA4574
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 16:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D4F10E990;
	Thu,  4 Dec 2025 15:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcC7A/u7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203E10E990
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764863485; x=1796399485;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1MLJ4foFKk2YetngAtX7qrwpveVMWt0D+TCRrr6hwMM=;
 b=BcC7A/u78DexxYhK96ySPZKvBtN4HWHev19JA3LL+sv9g7IOc9jYQiGU
 /tdvYrRqB8rrA1Nvd0HOJ9bG03AQhyHRBJpvR8ZAT5nveMYQyb4gSTW3o
 5tp07jZUV1xF+lNHHEhQkm/j1aCeweqywMCosLRjSvNLTA9uN/bPSE1ZA
 OR47+51hiBnetGMfFCqoN/lVjW0DeWbTSHsN8vKlhHvfPQBhDUCDXuQOR
 5gzzVoBQOHt3N8IWa+WhoHp+2b0imIdiHjl1PN/hkDRcKZr8ZNKrDHNAs
 msAQgVBEmqo7J6aQM1oBU1ZH6UiNcGwAqSScNzpfWQdi5uwrbWEWBsXmt Q==;
X-CSE-ConnectionGUID: zEybM/xXRAenkb0JwkJpOQ==
X-CSE-MsgGUID: 7AAi+DCdQ7qLKI+ceEouOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66925417"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="66925417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:51:25 -0800
X-CSE-ConnectionGUID: Q/oXs7zARwapqU+0sa7CXA==
X-CSE-MsgGUID: 31A7ETZxQP+qUSKkZPr5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194830958"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.215])
 ([10.245.245.215])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:51:23 -0800
Message-ID: <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
Date: Thu, 4 Dec 2025 15:51:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
References: <20251204145952.7052-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251204145952.7052-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/12/2025 14:59, Christian König wrote:
> This debugging hack is important to enforce the rule that importers
> should *never* touch the underlying struct page of the exporter.
> 
> Instead of just mangling the page link create a copy of the sg_table
> but only copy over the DMA addresses and not the pages.
> 
> This will cause a NULL pointer de-reference if the importer tries to
> touch the struct page. Still quite a hack but this at least allows the
> exporter to properly keeps it's sg_table intact while allowing the
> DMA-buf maintainer to find and fix misbehaving importers and finally
> switch over to using a different data structure in the future.
> 
> v2: improve the hack further by using a wrapper structure and explaining
> the background a bit more in the commit message.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
> ---
>   drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
>   1 file changed, 58 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2305bb2cc1f1..8c4afd360b72 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,12 @@
>   
>   #include "dma-buf-sysfs-stats.h"
>   
> +/* Wrapper to hide the sg_table page link from the importer */
> +struct dma_buf_sg_table_wrapper {
> +	struct sg_table *original;
> +	struct sg_table wrapper;
> +};
> +
>   static inline int is_dma_buf_file(struct file *);
>   
>   static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>   
> -static void mangle_sg_table(struct sg_table *sg_table)
> +static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
>   {
> -#ifdef CONFIG_DMABUF_DEBUG
> -	int i;
> -	struct scatterlist *sg;
> -
> -	/* To catch abuse of the underlying struct page by importers mix
> -	 * up the bits, but take care to preserve the low SG_ bits to
> -	 * not corrupt the sgt. The mixing is undone on unmap
> -	 * before passing the sgt back to the exporter.
> +	struct scatterlist *to_sg, *from_sg;
> +	struct sg_table *from = *sg_table;
> +	struct dma_buf_sg_table_wrapper *to;
> +	int i, ret;
> +
> +	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
> +		return 0;
> +
> +	/*
> +	 * To catch abuse of the underlying struct page by importers copy the
> +	 * sg_table without copying the page_link and give only the copy back to
> +	 * the importer.
>   	 */
> -	for_each_sgtable_sg(sg_table, sg, i)
> -		sg->page_link ^= ~0xffUL;
> -#endif
> +	to = kzalloc(sizeof(*to), GFP_KERNEL);
> +	if (!to)
> +		return -ENOMEM;
> +
> +	ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
> +	if (ret)
> +		goto free_to;
> +
> +	to_sg = to->wrapper.sgl;
> +	for_each_sgtable_dma_sg(from, from_sg, i) {
> +		sg_set_page(to_sg, NULL, 0, 0);

Are we still allowed to pass NULL page here? There looks to be the 
recently added:

VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, 
PAGE_SIZE) / PAGE_SIZE));

And if page_range_contiguous() does not just return true, it potentially 
wants to dereference the page, like with page_to_pfn()?


> +                sg_dma_address(to_sg) = sg_dma_address(from_sg);
> +                sg_dma_len(to_sg) = sg_dma_len(from_sg);

Nit: formatting looks off here.

> +		to_sg = sg_next(to_sg);
> +	}
>   
> +	to->original = from;
> +	*sg_table = &to->wrapper;
> +	return 0;
> +
> +free_to:
> +	kfree(to);
> +	return ret;
> +}
> +
> +static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
> +{
> +	struct dma_buf_sg_table_wrapper *copy;
> +
> +	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
> +		return;
> +
> +	copy = container_of(*sg_table, typeof(*copy), wrapper);
> +	*sg_table = copy->original;
> +	sg_free_table(&copy->wrapper);
> +	kfree(copy);
>   }
>   
>   static inline bool
> @@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		if (ret < 0)
>   			goto error_unmap;
>   	}
> -	mangle_sg_table(sg_table);
> +	ret = dma_buf_mangle_sg_table(&sg_table);
> +	if (ret)
> +		goto error_unmap;
>   
>   	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>   		struct scatterlist *sg;
> @@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   
>   	dma_resv_assert_held(attach->dmabuf->resv);
>   
> -	mangle_sg_table(sg_table);
> +	dma_buf_demangle_sg_table(&sg_table);
>   	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>   
>   	if (dma_buf_pin_on_map(attach))

