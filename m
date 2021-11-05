Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA444659B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 16:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51F6E84B;
	Fri,  5 Nov 2021 15:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB1E6E84B;
 Fri,  5 Nov 2021 15:22:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231762882"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="231762882"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 08:18:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="730554188"
Received: from ddelane1-mobl1.ger.corp.intel.com (HELO [10.213.243.169])
 ([10.213.243.169])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 08:18:57 -0700
Message-ID: <32f79f21-b9e2-6df0-63d0-0ff91fe6b31d@intel.com>
Date: Fri, 5 Nov 2021 15:18:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915/gem: Fix gem_madvise for ttm+shmem objects
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211105130333.797862-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211105130333.797862-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2021 13:03, Thomas Hellström wrote:
> Gem-TTM objects that are backed by shmem might have populated
> page-vectors without having the Gem pages set. Those objects
> aren't moved to the correct shrinker / purge list by the
> gem_madvise. Furthermore they are purged directly on
> MADV_DONTNEED rather than waiting for the shrinker to do that.
> 
> For such objects, identified by having the
> _SELF_MANAGED_SHRINK_LIST set, make sure they end up on the
> correct list and defer purging to the shrinker.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gem.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index d0e642c82064..da972c8d45b1 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1005,7 +1005,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
>   			obj->ops->adjust_lru(obj);
>   	}
>   
> -	if (i915_gem_object_has_pages(obj)) {
> +	if (i915_gem_object_has_pages(obj) ||
> +	    i915_gem_object_has_self_managed_shrink_list(obj)) {

Makes sense.

>   		unsigned long flags;
>   
>   		spin_lock_irqsave(&i915->mm.obj_lock, flags);
> @@ -1024,7 +1025,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
>   
>   	/* if the object is no longer attached, discard its backing storage */
>   	if (obj->mm.madv == I915_MADV_DONTNEED &&
> -	    !i915_gem_object_has_pages(obj))
> +	    !i915_gem_object_has_pages(obj) &&
> +	    !i915_gem_object_has_self_managed_shrink_list(obj))
>   		i915_gem_object_truncate(obj);

And it looks like this also matches the workings of lmem, where under 
memory pressure we also just purge such objects, instead of moving them, 
making sure to keep them first in the LRU?

One thing is to maybe immediately discard already swapped-out objects 
here, since the shrinker will be oblivious to them, and they sort of 
just linger in swap until the object is destroyed?

>   
>   	args->retained = obj->mm.madv != __I915_MADV_PURGED;
> 
