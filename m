Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ACA365CFC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32A36E84D;
	Tue, 20 Apr 2021 16:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB16E848;
 Tue, 20 Apr 2021 16:14:52 +0000 (UTC)
IronPort-SDR: s5ikmti5b2FWooZcr1RtGPRpuTad6KGskbQs5rQxBM+7HiMyS8ippDQmO0DVKg9bY5L60Vd950
 Aa2HqUCU6Hug==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175022506"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="175022506"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:14:51 -0700
IronPort-SDR: CKVpKWM9mCUJwUNP1Zsot4EFuRdMHf+o5Zrx+kHHu9v13dZvd6r+n64DdloTVVLS6TuLzkd4HO
 6gM7QP8aTt2g==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="385396661"
Received: from nmuniand-mobl1.gar.corp.intel.com (HELO [10.213.128.245])
 ([10.213.128.245])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:14:48 -0700
Subject: Re: [PATCH 4/5] drm/i915/stolen: pass the allocation flags
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210420131842.164163-1-matthew.auld@intel.com>
 <20210420131842.164163-4-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8559c955-3882-aec4-f87c-afbe82052e5b@linux.intel.com>
Date: Tue, 20 Apr 2021 17:14:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420131842.164163-4-matthew.auld@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/04/2021 14:18, Matthew Auld wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> Stolen memory is always allocated as physically contiguous pages, mark
> the object flags as such.
> 
> v2: move setting I915_BO_ALLOC_CONTIGUOUS into create_stolen
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 4f9fe5aca37e..46f79b240df7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -633,14 +633,21 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
>   
>   static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
>   					   struct drm_i915_gem_object *obj,
> -					   struct drm_mm_node *stolen)
> +					   struct drm_mm_node *stolen,
> +					   unsigned int flags)
>   {
>   	static struct lock_class_key lock_class;
>   	unsigned int cache_level;
>   	int err;
>   
> +	/*
> +	 * Stolen objects are always physically contiguous since we just
> +	 * allocate one big block underneath using the drm_mm range allocator.
> +	 */
> +	flags |= I915_BO_ALLOC_CONTIGUOUS;
> +
>   	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
> -	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
>   
>   	obj->stolen = stolen;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
> @@ -682,7 +689,7 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
>   	if (ret)
>   		goto err_free;
>   
> -	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
> +	ret = __i915_gem_object_create_stolen(mem, obj, stolen, flags);

Hm odd that previously the flags were ignored in here. I guess no 
callers were passing any when creating stolen objects. If none are 
supported should we add a GEM_BUG_ON to check for that?

Regards,

Tvrtko

>   	if (ret)
>   		goto err_remove;
>   
> @@ -700,7 +707,7 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
>   			      resource_size_t size)
>   {
>   	return i915_gem_object_create_region(i915->mm.stolen_region,
> -					     size, I915_BO_ALLOC_CONTIGUOUS);
> +					     size, 0);
>   }
>   
>   static int init_stolen_smem(struct intel_memory_region *mem)
> @@ -866,7 +873,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
>   		goto err_stolen;
>   	}
>   
> -	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
> +	ret = __i915_gem_object_create_stolen(mem, obj, stolen, 0);
>   	if (ret)
>   		goto err_object_free;
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
