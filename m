Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1D680A73
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 11:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFFE10E0D7;
	Mon, 30 Jan 2023 10:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2210E0D7;
 Mon, 30 Jan 2023 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675073318; x=1706609318;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mo5yexCA/ZrKtoN97r7pTE+FhCESycsJPmqk4RiCrdM=;
 b=midQ0fL8uHpwAqJ5zgtsw85coE+Et7rz9nzFKhJFlTtkrS+DlzR7KRiL
 1qMcp0BgGPJJf0owW9g3HNzXnizqSYWb8kBmGhzX3mFB1Q2Oefp77INrM
 J5bN47NLncQUr9ZNWgNxWVYEFh+6SwR7ZJSupEZH4yIG6aJ5TN+QUJzQ2
 lAQG3X7UHVTyH7USExHpbgy5x4Lv2DGUwPY7SxF2vrTx2+ycO5qMpHonx
 /mOuXSRV0XCAH8dR6t6perqmCrpJngjvk4o2N8QJxIg5luOxk6T4YA5b5
 fNk+8WVmmVnvTs00xph0B7Oo0Fb6pJDU8XH3IzYYwpMtoJpBB8gLrXGIU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327538541"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="327538541"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:08:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="664037045"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="664037045"
Received: from pjoconno-mobl1.ger.corp.intel.com (HELO [10.213.216.153])
 ([10.213.216.153])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:08:22 -0800
Message-ID: <5908ac91-bb6c-7ea9-0f2a-88054fe1b24d@linux.intel.com>
Date: Mon, 30 Jan 2023 10:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915: Fix potential bit_17 double-free
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230127200550.3531984-1-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230127200550.3531984-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/01/2023 20:05, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> A userspace with multiple threads racing I915_GEM_SET_TILING to set the
> tiling to I915_TILING_NONE could trigger a double free of the bit_17
> bitmask.  (Or conversely leak memory on the transition to tiled.)  Move
> allocation/free'ing of the bitmask within the section protected by the
> obj lock.
> 
> Fixes: e9b73c67390a ("drm/i915: Reduce memory pressure during shrinker by preallocating swizzle pages")

Should be:

Fixes: 2850748ef876 ("drm/i915: Pull i915_vma_pin under the vm->mutex")

Before that commit there as a "BKL" (struct_mutex) aroung the call to 
i915_gem_object_set_tiling. Otherwise fix looks good:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I'll tweak the fixes tag and merge in a minute, thanks for the fix!

Regards,

Tvrtko

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_tiling.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> index fd42b89b7162..bc21b1c2350a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
> @@ -298,36 +298,37 @@ i915_gem_object_set_tiling(struct drm_i915_gem_object *obj,
>   		vma->fence_alignment =
>   			i915_gem_fence_alignment(i915,
>   						 vma->size, tiling, stride);
>   
>   		if (vma->fence)
>   			vma->fence->dirty = true;
>   	}
>   	spin_unlock(&obj->vma.lock);
>   
>   	obj->tiling_and_stride = tiling | stride;
> -	i915_gem_object_unlock(obj);
> -
> -	/* Force the fence to be reacquired for GTT access */
> -	i915_gem_object_release_mmap_gtt(obj);
>   
>   	/* Try to preallocate memory required to save swizzling on put-pages */
>   	if (i915_gem_object_needs_bit17_swizzle(obj)) {
>   		if (!obj->bit_17) {
>   			obj->bit_17 = bitmap_zalloc(obj->base.size >> PAGE_SHIFT,
>   						    GFP_KERNEL);
>   		}
>   	} else {
>   		bitmap_free(obj->bit_17);
>   		obj->bit_17 = NULL;
>   	}
>   
> +	i915_gem_object_unlock(obj);
> +
> +	/* Force the fence to be reacquired for GTT access */
> +	i915_gem_object_release_mmap_gtt(obj);
> +
>   	return 0;
>   }
>   
>   /**
>    * i915_gem_set_tiling_ioctl - IOCTL handler to set tiling mode
>    * @dev: DRM device
>    * @data: data pointer for the ioctl
>    * @file: DRM file for the ioctl call
>    *
>    * Sets the tiling mode of an object, returning the required swizzling of
