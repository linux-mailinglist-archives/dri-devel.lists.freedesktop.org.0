Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49535F700
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BD86E927;
	Wed, 14 Apr 2021 15:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5AF6E925;
 Wed, 14 Apr 2021 15:10:33 +0000 (UTC)
IronPort-SDR: T25qJzay+E1YqpadyFYrYJ8vhW/SoTyey2pJprBUuAtpIE+IhHfeB50eoOswtu2Ys1t/byXs04
 9rr8e8/E6RVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="215151346"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="215151346"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:09:47 -0700
IronPort-SDR: ICEozp+HYSUpesAmwQ7+d037iS50v918dGde8DGfzmlOo2Kf9Nxh5KEg8/u1A/gmuGzAeDbOmp
 4UCmuJwVE+DA==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="418357211"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO [10.213.205.119])
 ([10.213.205.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:09:45 -0700
Subject: Re: [Intel-gfx] [PATCH 06/19] drm/i915/stolen: pass the allocation
 flags
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-7-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4dc60bcc-ffb8-db6a-dc0d-4a3700661258@linux.intel.com>
Date: Wed, 14 Apr 2021 16:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412090526.30547-7-matthew.auld@intel.com>
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


On 12/04/2021 10:05, Matthew Auld wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> Stolen memory is always allocated as physically contiguous pages, mark
> the object flags as such.
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index f713eabb7671..49a2dfcc8ba7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -633,14 +633,15 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
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
>   	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
> -	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
>   
>   	obj->stolen = stolen;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
> @@ -682,7 +683,7 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
>   	if (ret)
>   		goto err_free;
>   
> -	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
> +	ret = __i915_gem_object_create_stolen(mem, obj, stolen, flags);
>   	if (ret)
>   		goto err_remove;
>   
> @@ -840,7 +841,8 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
>   		goto err_stolen;
>   	}
>   
> -	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
> +	ret = __i915_gem_object_create_stolen(mem, obj, stolen,
> +					      I915_BO_ALLOC_CONTIGUOUS);
>   	if (ret)
>   		goto err_object_free;
>   
> 

Are all stolen objects always contiguous or only ones allocated by 
i915_gem_object_create_stolen_for_preallocated? If former should 
__i915_gem_object_create_stolen just set the flag without the need to 
pass it in?

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
