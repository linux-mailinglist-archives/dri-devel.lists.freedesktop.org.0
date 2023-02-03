Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A98689855
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F9810E77A;
	Fri,  3 Feb 2023 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490A810E778;
 Fri,  3 Feb 2023 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675426324; x=1706962324;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BuNTMXq49Ts05uKtiarewvgptgqGYVSEr9ukTFIRkrg=;
 b=eKd9TPVR3jUmy8vMGQC5uwSnFVF6YWDKfkWejOojL+fGZWtYXKmK2qbD
 Lw56A6DVv9jUXtopEoZkZahCFgFCNnPEps9613tl/kf5uq+urSioswt4Y
 AO2sgNg7au1E6HI3ckQxfrvwfEhE0z/P5yiXzbSpfAnCIyimlY4cujDxY
 4oZVHQlgvv1THMM06C56RYRtv8lb55u2Q90xgTgZ38jV1Ic9eyEgJvAm5
 KvcrWcPGPhIriwOb5RuHA8iZfiuuS+wArtdI931d398GDiyvbRMS44b+z
 qpEqrXYx5jJUR1fh5wtFzl4sRoHdHXcJ/6+4q4w6b+9sGnu3jDtG9wfNX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="309067917"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="309067917"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:12:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754473186"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="754473186"
Received: from oowomilo-mobl2.ger.corp.intel.com (HELO [10.252.3.13])
 ([10.252.3.13])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:12:02 -0800
Message-ID: <f0dc490d-756a-d0fe-a519-3730be0707d2@intel.com>
Date: Fri, 3 Feb 2023 12:12:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] Initialize the obj flags for shmem objects
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2023 11:57, Aravind Iddamsetty wrote:
> Obj flags for shmem objects is not being set correctly.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Subject should have "drm/i915:" prefix.

This is also a bug fix due to not setting BO_ALLOC_USER (the other flags 
don't seem to matter for shmem), which is quite important, so we need to 
figure out the "Fixes" tag. Maybe mention in the commit message that 
this fixes setting ALLOC_USER which is needed even for shmem.

Looking at the git history, ALLOC_USER looks to be first introduced in 
213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend"), 
but the users of ALLOC_USER at this stage are only interesting for the 
ttm backend, and that already passes the flags due to using its own 
object_init() vfunc for all normal object types.

So the first real user impacted by this bug appears to be in: 
13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on acquire").

So I think needs:

Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on 
acquire")
Cc: <stable@vger.kernel.org> # v5.15+

With that,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 114443096841..37d1efcd3ca6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -596,7 +596,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
>   	mapping_set_gfp_mask(mapping, mask);
>   	GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>   
> -	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
>   	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>   	obj->write_domain = I915_GEM_DOMAIN_CPU;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU;
