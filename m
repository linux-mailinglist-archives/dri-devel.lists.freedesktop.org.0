Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E4446D1BB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 12:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329686E0CD;
	Wed,  8 Dec 2021 11:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06E56E8F2;
 Wed,  8 Dec 2021 11:12:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="298602951"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="298602951"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="516167164"
Received: from awrynn-mobl.ger.corp.intel.com (HELO [10.252.4.118])
 ([10.252.4.118])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:10 -0800
Message-ID: <f0680136-d0f9-1909-2f0b-3ef608e792b8@intel.com>
Date: Wed, 8 Dec 2021 11:12:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] drm/i915: Sanitycheck device iomem on probe
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20211208102031.4397-1-ramalingam.c@intel.com>
 <20211208102031.4397-2-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211208102031.4397-2-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Andi <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2021 10:20, Ramalingam C wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> As we setup the memory regions for the device, give each a quick test to
> verify that we can read and write to the full iomem range. This ensures
> that our physical addressing for the device's memory is correct, and
> some reassurance that the memory is functional.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

For the series, assuming CI is happy now,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Also patch 3 should be moved to the start of the series.

> ---
>   drivers/gpu/drm/i915/intel_memory_region.c | 104 +++++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index b43121609e25..c53e07f1d0c0 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2019 Intel Corporation
>    */
>   
> +#include <linux/prandom.h>
> +
>   #include "intel_memory_region.h"
>   #include "i915_drv.h"
>   #include "i915_ttm_buddy_manager.h"
> @@ -29,6 +31,99 @@ static const struct {
>   	},
>   };
>   
> +static int __iopagetest(struct intel_memory_region *mem,
> +			u8 __iomem *va, int pagesize,
> +			u8 value, resource_size_t offset,
> +			const void *caller)
> +{
> +	int byte = prandom_u32_max(pagesize);
> +	u8 result[3];
> +
> +	memset_io(va, value, pagesize); /* or GPF! */
> +	wmb();
> +
> +	result[0] = ioread8(va);
> +	result[1] = ioread8(va + byte);
> +	result[2] = ioread8(va + pagesize - 1);
> +	if (memchr_inv(result, value, sizeof(result))) {
> +		dev_err(mem->i915->drm.dev,
> +			"Failed to read back from memory region:%pR at [%pa + %pa] for %ps; wrote %x, read (%x, %x, %x)\n",
> +			&mem->region, &mem->io_start, &offset, caller,
> +			value, result[0], result[1], result[2]);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int iopagetest(struct intel_memory_region *mem,
> +		      resource_size_t offset,
> +		      const void *caller)
> +{
> +	const u8 val[] = { 0x0, 0xa5, 0xc3, 0xf0 };
> +	void __iomem *va;
> +	int err;
> +	int i;
> +
> +	va = ioremap_wc(mem->io_start + offset, PAGE_SIZE);
> +	if (!va) {
> +		dev_err(mem->i915->drm.dev,
> +			"Failed to ioremap memory region [%pa + %px] for %ps\n",
> +			&mem->io_start, &offset, caller);
> +		return -EFAULT;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(val); i++) {
> +		err = __iopagetest(mem, va, PAGE_SIZE, val[i], offset, caller);
> +		if (err)
> +			break;
> +
> +		err = __iopagetest(mem, va, PAGE_SIZE, ~val[i], offset, caller);
> +		if (err)
> +			break;
> +	}
> +
> +	iounmap(va);
> +	return err;
> +}
> +
> +static resource_size_t random_page(resource_size_t last)
> +{
> +	/* Limited to low 44b (16TiB), but should suffice for a spot check */
> +	return prandom_u32_max(last >> PAGE_SHIFT) << PAGE_SHIFT;
> +}
> +
> +static int iomemtest(struct intel_memory_region *mem, const void *caller)
> +{
> +	resource_size_t last = resource_size(&mem->region) - PAGE_SIZE;
> +	int err;
> +
> +	/*
> +	 * Quick test to check read/write access to the iomap (backing store).
> +	 *
> +	 * Write a byte, read it back. If the iomapping fails, we expect
> +	 * a GPF preventing further execution. If the backing store does not
> +	 * exist, the read back will return garbage. We check a couple of pages,
> +	 * the first and last of the specified region to confirm the backing
> +	 * store + iomap does cover the entire memory region; and we check
> +	 * a random offset within as a quick spot check for bad memory.
> +	 */
> +
> +	err = iopagetest(mem, 0, caller);
> +	if (err)
> +		return err;
> +
> +	err = iopagetest(mem, last, caller);
> +	if (err)
> +		return err;
> +
> +	err = iopagetest(mem, random_page(last), caller);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>   struct intel_memory_region *
>   intel_memory_region_lookup(struct drm_i915_private *i915,
>   			   u16 class, u16 instance)
> @@ -126,8 +221,17 @@ intel_memory_region_create(struct drm_i915_private *i915,
>   			goto err_free;
>   	}
>   
> +	if (io_start && IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
> +		err = iomemtest(mem, (void *)_RET_IP_);
> +		if (err)
> +			goto err_release;
> +	}
> +
>   	return mem;
>   
> +err_release:
> +	if (mem->ops->release)
> +		mem->ops->release(mem);
>   err_free:
>   	kfree(mem);
>   	return ERR_PTR(err);
> 
