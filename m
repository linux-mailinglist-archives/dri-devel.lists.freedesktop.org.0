Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E992366E32
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 16:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D2F6E9AF;
	Wed, 21 Apr 2021 14:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0A06E9BB;
 Wed, 21 Apr 2021 14:28:18 +0000 (UTC)
IronPort-SDR: JdxSMe3ff6iaCmdh1+HVUAFSeFBhDS7IQqGgAV1gjXL8nIjCT7YSIu1Sga9darjw+zmNsT1d68
 Z21mh3SzpO1g==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="216347199"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="216347199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 07:28:18 -0700
IronPort-SDR: DruoMJQepfznXBuM/W5ZgC0T73CuGZYGRTe3f11syn+SdivVq0jvTVvPs5p0wLBgteqkkRhNHy
 dL6+C2BTfVoQ==
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="524311940"
Received: from crodgers-mobl2.ger.corp.intel.com (HELO [10.213.224.141])
 ([10.213.224.141])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 07:28:17 -0700
Subject: Re: [PATCH v2 4/4] drm/i915/stolen: actually mark as contiguous
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210421104658.304142-1-matthew.auld@intel.com>
 <20210421104658.304142-4-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d4993c34-18c7-83f7-f0b5-a34d94af5ea3@linux.intel.com>
Date: Wed, 21 Apr 2021 15:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421104658.304142-4-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/04/2021 11:46, Matthew Auld wrote:
> Stolen memory is always allocated as physically contiguous pages, so
> mark the object flags as such. It looks like the flags were previously
> just ignored so this had no effect. In the future we might to add the
> proper plumbing for passing the flags all over the way down from the
> caller, but for now we don't have a use for that.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index b43929da8de8..c5b64b2400e8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -637,10 +637,17 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
>   {
>   	static struct lock_class_key lock_class;
>   	unsigned int cache_level;
> +	unsigned int flags;
>   	int err;
>   
> +	/*
> +	 * Stolen objects are always physically contiguous since we just
> +	 * allocate one big block underneath using the drm_mm range allocator.
> +	 */
> +	flags = I915_BO_ALLOC_CONTIGUOUS;
> +
>   	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
> -	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
>   
>   	obj->stolen = stolen;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
> @@ -699,8 +706,7 @@ struct drm_i915_gem_object *
>   i915_gem_object_create_stolen(struct drm_i915_private *i915,
>   			      resource_size_t size)
>   {
> -	return i915_gem_object_create_region(i915->mm.stolen_region,
> -					     size, I915_BO_ALLOC_CONTIGUOUS);
> +	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0);
>   }
>   
>   static int init_stolen_smem(struct intel_memory_region *mem)
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
