Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A284A6EA6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF8A10E496;
	Wed,  2 Feb 2022 10:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AA010E492;
 Wed,  2 Feb 2022 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643797508; x=1675333508;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gavjHAthwOTuBGyUGUwSCdP6+AgNSxhgi2C3gzYq5Ys=;
 b=NsHOyt5RvmvHBKjthmT0hPVP210bT+QdB9q/kZm9rtmiUWk07BNTnPXK
 BAxu924zSh1plan7eizBh1vQxCiErf06tjEX0xIPKCNZL46zUjs6Yjlrn
 dopm87Z+SB6auj5+OPTiyVYYPv0+ON7301nZRKCrC61zt4TaomSTyX3B3
 LmoooKkoKT72TnzuboOmSz0zx8jmQvhFWJ6yyTGKen8ENKkM4KmXIIbf0
 BWmHoB/HH5mTFCjFEJepdMzFg8RiCSN1qbc83sB2AZEQKUL0UWLpU4EGU
 RXrnVNKnVQJv048uVJpFH27IFX8LXSKzbM6yTdzWmtCZ695Dz9DphaPDX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="272370582"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="272370582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:25:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="630875338"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:25:02 -0800
Message-ID: <febe0111-073b-000a-e8b6-3e02cae840ae@linux.intel.com>
Date: Wed, 2 Feb 2022 11:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 10/20] drm/i915/selftests: mock test io_size
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-11-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-11-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/22 16:21, Matthew Auld wrote:
> Check that mappable vs non-mappable matches our expectations.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   .../drm/i915/selftests/intel_memory_region.c  | 143 ++++++++++++++++++
>   1 file changed, 143 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> index 247f65f02bbf..04ae29779206 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> @@ -17,6 +17,7 @@
>   #include "gem/i915_gem_context.h"
>   #include "gem/i915_gem_lmem.h"
>   #include "gem/i915_gem_region.h"
> +#include "gem/i915_gem_ttm.h"
>   #include "gem/selftests/igt_gem_utils.h"
>   #include "gem/selftests/mock_context.h"
>   #include "gt/intel_engine_pm.h"
> @@ -512,6 +513,147 @@ static int igt_mock_max_segment(void *arg)
>   	return err;
>   }
>   
> +static u64 igt_object_mappable_total(struct drm_i915_gem_object *obj)
> +{
> +	struct intel_memory_region *mr = obj->mm.region;
> +	struct i915_ttm_buddy_resource *bman_res =
> +		to_ttm_buddy_resource(obj->mm.res);
> +	struct drm_buddy *mm = bman_res->mm;
> +	struct drm_buddy_block *block;
> +	u64 total;
> +
> +	total = 0;
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		u64 start = drm_buddy_block_offset(block);
> +		u64 end = start + drm_buddy_block_size(mm, block);
> +
> +		if (start < mr->io_size)
> +			total += min_t(u64, end, mr->io_size) - start;
> +	}
> +
> +	return total;
> +}
> +
> +static int igt_mock_io_size(void *arg)
> +{
> +	struct intel_memory_region *mr = arg;
> +	struct drm_i915_private *i915 = mr->i915;
> +	struct drm_i915_gem_object *obj;
> +	u64 mappable_theft_total;
> +	u64 io_size;
> +	u64 total;
> +	u64 ps;
> +	u64 rem;
> +	u64 size;
> +	I915_RND_STATE(prng);
> +	LIST_HEAD(objects);
> +	int err = 0;
> +
> +	ps = SZ_4K;
> +	if (i915_prandom_u64_state(&prng) & 1)
> +		ps = SZ_64K; /* For something like DG2 */
> +
> +	div64_u64_rem(i915_prandom_u64_state(&prng), SZ_8G, &total);
> +	total = round_down(total, ps);
> +	total = max_t(u64, total, SZ_1G);
> +
> +	div64_u64_rem(i915_prandom_u64_state(&prng), total - ps, &io_size);
> +	io_size = round_down(io_size, ps);
> +	io_size = max_t(u64, io_size, SZ_256M); /* 256M seems to be the common lower limit */
> +
> +	pr_info("%s with ps=%llx, io_size=%llx, total=%llx\n",
> +		__func__, ps, io_size, total);
> +
> +	mr = mock_region_create(i915, 0, total, ps, 0, io_size);
> +	if (IS_ERR(mr)) {
> +		err = PTR_ERR(mr);
> +		goto out_err;
> +	}
> +
> +	mappable_theft_total = 0;
> +	rem = total - io_size;
> +	do {
> +		div64_u64_rem(i915_prandom_u64_state(&prng), rem, &size);
> +		size = round_down(size, ps);
> +		size = max(size, ps);
> +
> +		obj = igt_object_create(mr, &objects, size,
> +					I915_BO_ALLOC_TOPDOWN);
> +		if (IS_ERR(obj)) {
> +			pr_err("%s TOPDOWN failed with rem=%llx, size=%llx\n",
> +			       __func__, rem, size);
> +			err = PTR_ERR(obj);
> +			goto out_close;
> +		}
> +
> +		mappable_theft_total += igt_object_mappable_total(obj);
> +		rem -= size;
> +	} while (rem);
> +
> +	pr_info("%s mappable theft=(%lluMiB/%lluMiB), total=%lluMiB\n",
> +		__func__,
> +		(u64)mappable_theft_total >> 20,
> +		(u64)io_size >> 20,
> +		(u64)total >> 20);
> +
> +	/*
> +	 * Even if we allocate all of the non-mappable portion, we should still
> +	 * be able to dip into the mappable portion.
> +	 */
> +	obj = igt_object_create(mr, &objects, io_size,
> +				I915_BO_ALLOC_TOPDOWN);
> +	if (IS_ERR(obj)) {
> +		pr_err("%s allocation unexpectedly failed\n", __func__);
> +		err = PTR_ERR(obj);
> +		goto out_close;
> +	}
> +
> +	close_objects(mr, &objects);
> +
> +	rem = io_size;
> +	do {
> +		div64_u64_rem(i915_prandom_u64_state(&prng), rem, &size);
> +		size = round_down(size, ps);
> +		size = max(size, ps);
> +
> +		obj = igt_object_create(mr, &objects, size, 0);
> +		if (IS_ERR(obj)) {
> +			pr_err("%s MAPPABLE failed with rem=%llx, size=%llx\n",
> +			       __func__, rem, size);
> +			err = PTR_ERR(obj);
> +			goto out_close;
> +		}
> +
> +		if (igt_object_mappable_total(obj) != size) {
> +			pr_err("%s allocation is not mappable(size=%llx)\n",
> +			       __func__, size);
> +			err = -EINVAL;
> +			goto out_close;
> +		}
> +		rem -= size;
> +	} while (rem);
> +
> +	/*
> +	 * We assume CPU access is required by default, which should result in a
> +	 * failure here, even though the non-mappable portion is free.
> +	 */
> +	obj = igt_object_create(mr, &objects, ps, 0);
> +	if (!IS_ERR(obj)) {
> +		pr_err("%s allocation unexpectedly succeeded\n", __func__);
> +		err = -EINVAL;
> +		goto out_close;
> +	}
> +
> +out_close:
> +	close_objects(mr, &objects);
> +	intel_memory_region_destroy(mr);
> +out_err:
> +	if (err == -ENOMEM)
> +		err = 0;
> +
> +	return err;
> +}
> +
>   static int igt_gpu_write_dw(struct intel_context *ce,
>   			    struct i915_vma *vma,
>   			    u32 dword,
> @@ -1179,6 +1321,7 @@ int intel_memory_region_mock_selftests(void)
>   		SUBTEST(igt_mock_contiguous),
>   		SUBTEST(igt_mock_splintered_region),
>   		SUBTEST(igt_mock_max_segment),
> +		SUBTEST(igt_mock_io_size),
>   	};
>   	struct intel_memory_region *mem;
>   	struct drm_i915_private *i915;
