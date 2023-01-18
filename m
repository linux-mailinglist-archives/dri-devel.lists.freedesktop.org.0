Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D49671C87
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D909A10E737;
	Wed, 18 Jan 2023 12:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C394F10E737;
 Wed, 18 Jan 2023 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674046170; x=1705582170;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Btca3fQ+3ZmMGqobEchBMJlpQn+wtcp6q2a0XkBUPQk=;
 b=mpusqfDld7pJb02dAAGMJQ0L8da/+R/RbRF+x/WHqmNVNrn1dcLaebfR
 ftWCW36AIQ1jALAcR/M0FRVoSgeb8DosARaOmqmnQ6km/WhAOxVwqRDd6
 RtywbgnqkDMvlYZ4tToX0777226X698kGlVBzEcyBzDj0FjnMEkGiUUxL
 2ed/5msO8N4f2uC4rXGAsBavSiG5RuxDiHbr4L5DNevs1Ku/vecappdHC
 ix5T0QuRSRlmsLofUS9Z6+043Z+Y8jLZrSoBrmR6xQnqw0AIgdf1+fEOG
 046Hzppgo/GcepHjYJx/XR0icT+CIUtCY8av1T0xE8FPCwYnjtXtGXDl/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="327048971"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327048971"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 04:49:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="802183909"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="802183909"
Received: from tjlynch-mobl.ger.corp.intel.com (HELO [10.252.26.179])
 ([10.252.26.179])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 04:49:27 -0800
Message-ID: <c5584e3e-69ac-baed-4764-90af1fea9e95@intel.com>
Date: Wed, 18 Jan 2023 12:49:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v10 22/23] drm/i915/vm_bind: Properly build persistent map
 sg table
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-23-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230118071609.17572-23-niranjana.vishwanathapura@intel.com>
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

On 18/01/2023 07:16, Niranjana Vishwanathapura wrote:
> Properly build the sg table for persistent mapping which can
> be partial map of the underlying object. Ensure the sg pages
> are properly set for page backed regions. The dump capture
> support requires this for page backed regions.
> 
> v2: Remove redundant sg_mark_end() call
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 113 +++++++++++++++++++++++++++++++-
>   1 file changed, 112 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 5b9ae5ebf55c..2f0994f0ed42 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1328,6 +1328,113 @@ intel_partial_pages(const struct i915_gtt_view *view,
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

Not sure why this noinline is needed here?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +intel_persistent_partial_pages(const struct i915_gtt_view *view,
> +			       struct drm_i915_gem_object *obj)
> +{
> +	u64 offset = view->partial.offset << PAGE_SHIFT;
> +	struct sg_table *st, *obj_st = obj->mm.pages;
> +	u64 length = view->partial.size << PAGE_SHIFT;
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
> @@ -1360,7 +1467,11 @@ __i915_vma_get_pages(struct i915_vma *vma)
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
