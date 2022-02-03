Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDD4A81BF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3D010EC64;
	Thu,  3 Feb 2022 09:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21A310EC64;
 Thu,  3 Feb 2022 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643881716; x=1675417716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C5H95a6b0gl8dehpwJCA6MdKsVyCkfI5qCFjOoKU7F8=;
 b=EVclOZH7jhOMod/izHh4Y11YBOlTcCwSsJwONNYwQPB2FB6tEgdLoa8f
 k4VUlFGwlPgZEXuZV6ayGn1dbVTECy3mA//frxMIgaJ/qq+kCW6wT9EYq
 3wMp+IFKlUSzs0vLPs6XgFEBh6HY6JKw0KHEOJpUzx80ZRRFl5nIHE/LB
 PtzfAjLdVKjOlOhI/r9RvNlsy4fE08QfPoSG0viA9BhQqOtLagzWNHDQy
 XymQKRWIAQ9ZOMNc+nlQddLRUVzkIq4OG6qLM8UlfBDdmYWsDiKwXNhi1
 T8GXxJQ1ywhWx2PWA2Y2CDqyv44/7sub32YulSLRiShoV20xYZ2BSImjY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308837940"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="308837940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:48:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="620447680"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:48:34 -0800
Message-ID: <a537f361-ae72-c62c-062f-4e96a9e48682@linux.intel.com>
Date: Thu, 3 Feb 2022 10:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 19/20] drm/i915/lmem: don't treat small BAR as an error
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-20-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-20-matthew.auld@intel.com>
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
> Just pass along the probed io_size. The backend should be able to
> utilize the entire range here, even if some of it is non-mappable.
Changes here LGTM.
>
> It does leave open with what to do with stolen local-memory.

Are objects in stolen local required to be mappable?

/Thomas


>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 2c7ec7ff79fd..b788fc2b3df8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -200,6 +200,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	struct intel_memory_region *mem;
>   	resource_size_t min_page_size;
>   	resource_size_t io_start;
> +	resource_size_t io_size;
>   	resource_size_t lmem_size;
>   	int err;
>   
> @@ -210,7 +211,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
>   
>   	io_start = pci_resource_start(pdev, 2);
> -	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
> +	io_size = min(pci_resource_len(pdev, 2), lmem_size);
> +	if (!io_size)
>   		return ERR_PTR(-ENODEV);
>   
>   	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> @@ -220,7 +222,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   					 lmem_size,
>   					 min_page_size,
>   					 io_start,
> -					 lmem_size,
> +					 io_size,
>   					 INTEL_MEMORY_LOCAL,
>   					 0,
>   					 &intel_region_lmem_ops);
