Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528564A80EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECE210E9EF;
	Thu,  3 Feb 2022 09:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884DF10E9E8;
 Thu,  3 Feb 2022 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879119; x=1675415119;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CnpyK7sdS5zTOCJ8EtJBPJdJHzcOEwA+dmsF2LSDseA=;
 b=R/XpVEqTNXpjHE+MfXYeaiI350UcUCSfbiqywWcw431947WmKGCJXZRq
 SXg66jRVrGsJ+Tr9vYPOkUKfA8vrVqVF8/BD7kZ/3JpG8txXvLzxW63zP
 OzQG+b7OBdaRhoRXBzgGZyU4yWnSyu3WeY7ZNse/qULIzIFJCUy+FMUUp
 6bYJhf37fLmwEmayR63ZbG74QeVA4y5sNju10AvH21N19ElBBn3D7Du2f
 1ZE4TXlMsHB3xwukWoX6vs+KUFyRRAdZHBWiNET3OGwMj5XEFymMtFoAc
 tXA8am8M+6okia1k/j9gOHpQs4q8GkXZGvSaGoyb6rjev4Nbvp1uWQ+Q1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308832244"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="308832244"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:05:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="620437149"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:05:17 -0800
Message-ID: <c699d513-d05f-9ea8-7df6-16e10c6c9729@linux.intel.com>
Date: Thu, 3 Feb 2022 10:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/20] drm/i915/selftests: handle allocation failures
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-16-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-16-matthew.auld@intel.com>
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
> If we have to contend with non-mappable LMEM, then we need to ensure the
> object fits within the mappable portion, like in the selftests, where we
> later try to CPU access the pages. However if it can't then we need to
> gracefully handle this, without throwing an error.
>
> Also it looks like TTM will return -ENOMEM if the object can't be
> placed.

We should probably have a look at why that happens. I thought ttm would 
return -ENOSPC, which we then converted to -ENXIO in i915_ttm_err_to_gem().

/Thomas



> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c      | 2 +-
>   drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 +++++++-
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index 42db9cd30978..3caa178bbd07 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1344,7 +1344,7 @@ static int igt_ppgtt_smoke_huge(void *arg)
>   
>   		err = i915_gem_object_pin_pages_unlocked(obj);
>   		if (err) {
> -			if (err == -ENXIO || err == -E2BIG) {
> +			if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
>   				i915_gem_object_put(obj);
>   				size >>= 1;
>   				goto try_again;
> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> index 04ae29779206..87bff7f83554 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> @@ -822,8 +822,14 @@ static int igt_lmem_create_with_ps(void *arg)
>   
>   		i915_gem_object_lock(obj, NULL);
>   		err = i915_gem_object_pin_pages(obj);
> -		if (err)
> +		if (err) {
> +			if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
> +				pr_info("%s not enough lmem for ps(%u) err=%d\n",
> +					__func__, ps, err);
> +				err = 0;
> +			}
>   			goto out_put;
> +		}
>   
>   		daddr = i915_gem_object_get_dma_address(obj, 0);
>   		if (!IS_ALIGNED(daddr, ps)) {
