Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD264A6CC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7A210E24E;
	Mon, 12 Dec 2022 18:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB510E24D;
 Mon, 12 Dec 2022 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670869112; x=1702405112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1D+HOr4rmrRRyA3BFyVInB8UXk6+qFHyJgalozc0imM=;
 b=gJKMWTRAZf2VlNz8u1EHOxvAHJcGgXQOulVxmq6U71xLfgGmBltOL0mx
 e0M1bDRFK6Ehxz3/fbgUk4RM2FpHG5ZUOYjR9l0REvgqdGIcFq3Apv5Fq
 sBCf9n5MFm0Y3X1S4pFtclev5kbcUrtrNFl2hoc30OBDL5tMujj2dzwDe
 RAN7+j/rbZJxlpymq1/j1MBKyjM3495emzH8M7rQLznqNsy3e/MCzxu6d
 +3Nsswtr8ZWze78qYZRN+ZKSLO6Q2M+xfKZgkB48lsmhGkB84KaKLOyUU
 zzR8h3jivCcSeHQAiwO+3RFc6T1Hsjtm0fdKE/CEnPKz/sp1+MR3wNKT3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315562309"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="315562309"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 10:17:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="737065250"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="737065250"
Received: from jzywicka-mobl.ger.corp.intel.com (HELO [10.252.5.179])
 ([10.252.5.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 10:17:03 -0800
Message-ID: <b6f14794-caa4-d19e-e61a-2778dad3f57b@intel.com>
Date: Mon, 12 Dec 2022 18:17:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v8 21/22] drm/i915/vm_bind: Properly build persistent map
 sg table
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
 <20221129072635.847-22-niranjana.vishwanathapura@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221129072635.847-22-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 07:26, Niranjana Vishwanathapura wrote:
> Properly build the sg table for persistent mapping which can
> be partial map of the underlying object. Ensure the sg pages
> are properly set for page backed regions. The dump capture
> support requires this for page backed regions.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 120 +++++++++++++++++++++++++++++++-
>   1 file changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 1b9033865768..68a9ac77b4f2 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1298,6 +1298,120 @@ intel_partial_pages(const struct i915_gtt_view *view,
>   	return ERR_PTR(ret);
>   }
>   
> +static unsigned int
> +intel_copy_dma_sg(struct sg_table *src_st, struct sg_table *dst_st,
> +		  u64 offset, u64 length, bool dry_run)
> +{
> +	struct scatterlist *dst_sg, *src_sg;
> +	unsigned int i, len, nents = 0;
> +
> +	dst_sg = dst_st->sgl;
> +	for_each_sgtable_dma_sg(src_st, src_sg, i) {
> +		if (sg_dma_len(src_sg) <= offset) {
> +			offset -= sg_dma_len(src_sg);
> +			continue;
> +		}
> +
> +		nents++;
> +		len = min(sg_dma_len(src_sg) - offset, length);
> +		if (!dry_run) {
> +			sg_dma_address(dst_sg) = sg_dma_address(src_sg) + offset;
> +			sg_dma_len(dst_sg) = len;
> +			dst_sg = sg_next(dst_sg);
> +		}
> +
> +		length -= len;
> +		offset = 0;
> +		if (!length)
> +			break;
> +	}
> +	WARN_ON_ONCE(length);
> +
> +	return nents;
> +}
> +
> +static unsigned int
> +intel_copy_sg(struct sg_table *src_st, struct sg_table *dst_st,
> +	      u64 offset, u64 length, bool dry_run)
> +{
> +	struct scatterlist *dst_sg, *src_sg;
> +	unsigned int i, len, nents = 0;
> +
> +	dst_sg = dst_st->sgl;
> +	for_each_sgtable_sg(src_st, src_sg, i) {
> +		if (src_sg->length <= offset) {
> +			offset -= src_sg->length;
> +			continue;
> +		}
> +
> +		nents++;
> +		len = min(src_sg->length - offset, length);
> +		if (!dry_run) {
> +			unsigned long pfn;
> +
> +			pfn = page_to_pfn(sg_page(src_sg)) + offset / PAGE_SIZE;
> +			sg_set_page(dst_sg, pfn_to_page(pfn), len, 0);
> +			dst_sg = sg_next(dst_sg);
> +		}
> +
> +		length -= len;
> +		offset = 0;
> +		if (!length)
> +			break;
> +	}
> +	WARN_ON_ONCE(length);
> +
> +	return nents;
> +}
> +
> +static noinline struct sg_table *
> +intel_persistent_partial_pages(const struct i915_gtt_view *view,
> +			       struct drm_i915_gem_object *obj)
> +{
> +	u64 offset = view->partial.offset << PAGE_SHIFT;
> +	struct sg_table *st, *obj_st = obj->mm.pages;
> +	u64 length = view->partial.size << PAGE_SHIFT;
> +	struct scatterlist *sg;
> +	unsigned int nents;
> +	int ret = -ENOMEM;
> +
> +	st = kmalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		goto err_st_alloc;
> +
> +	/* Get required sg_table size */
> +	nents = intel_copy_dma_sg(obj_st, st, offset, length, true);
> +	if (i915_gem_object_has_struct_page(obj)) {
> +		unsigned int pg_nents;
> +
> +		pg_nents = intel_copy_sg(obj_st, st, offset, length, true);
> +		if (nents < pg_nents)
> +			nents = pg_nents;
> +	}
> +
> +	ret = sg_alloc_table(st, nents, GFP_KERNEL);
> +	if (ret)
> +		goto err_sg_alloc;
> +
> +	/* Build sg_table for specified <offset, length> section */
> +	intel_copy_dma_sg(obj_st, st, offset, length, false);
> +	if (i915_gem_object_has_struct_page(obj))
> +		intel_copy_sg(obj_st, st, offset, length, false);
> +
> +	/* Mark last sg */
> +	sg = st->sgl;
> +	while (sg_next(sg))
> +		sg = sg_next(sg);
> +	sg_mark_end(sg);

Do we need this bit? The nents is exactly orig_nents, and sg_alloc_table 
will already mark the end for you.

Is it not possible to re-use remap_contiguous_pages() somehow? Also do 
we need the dry_run bit if we use sg_trim()? Maybe something like:

dst = sg_alloc_table(partial.size);

remap_contigious_pages_sg(dst, src);
i915_sg_trim(dst);

dst->nents = 0;
sg = remap_contigious_pages_dma_sg(dst, src);

> +
> +	return st;
> +
> +err_sg_alloc:
> +	kfree(st);
> +err_st_alloc:
> +	return ERR_PTR(ret);
> +}
> +
>   static int
>   __i915_vma_get_pages(struct i915_vma *vma)
>   {
> @@ -1330,7 +1444,11 @@ __i915_vma_get_pages(struct i915_vma *vma)
>   		break;
>   
>   	case I915_GTT_VIEW_PARTIAL:
> -		pages = intel_partial_pages(&vma->gtt_view, vma->obj);
> +		if (i915_vma_is_persistent(vma))
> +			pages = intel_persistent_partial_pages(&vma->gtt_view,
> +							       vma->obj);
> +		else
> +			pages = intel_partial_pages(&vma->gtt_view, vma->obj);
>   		break;
>   	}
>   
