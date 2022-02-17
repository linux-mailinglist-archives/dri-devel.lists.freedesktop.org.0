Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7C4B9BE1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D6910E8D8;
	Thu, 17 Feb 2022 09:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DB410E8D8;
 Thu, 17 Feb 2022 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645089561; x=1676625561;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aIfR9JI6zSHXzLVapgpswiwVbhnP1U1dUZR1mODsnSU=;
 b=S3qdElL+zGGSJw9PEj7ZpjgpHBersTtT88qhcSbtwkaKIdH+Z48oc5mI
 XkjkIXlbTURQFm+dXiz3/kPCIZtW1CoXs1e1BLFLucXBhBupnFzGvp64y
 teFbmpz4SOSbPXJbj1aQJq6JsIGoBI+5Z3DeswnfwWsh3xa5EYrQn26Nj
 6bz1Mpt/jIwznftrCX8DEnKbrTz11gkOYMO2HiJgLxHyjXG2Nrl/rsarz
 pXbxED9MTfgwV4EX9wb5KGq49rc/hVv+XJpHBQP6hQoc7WuUvI52gXQxL
 /uAZWxtxQ3Ydut03W3pYlhbTr3nnltziSJuh9ja+XlUcnUlxbvCSTC57Z g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="251032161"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="251032161"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:19:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="530067348"
Received: from markorti-mobl.ger.corp.intel.com (HELO [10.213.216.21])
 ([10.213.216.21])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:19:18 -0800
Message-ID: <c702451d-7c7a-0f48-56b4-8c3f3b637a8c@linux.intel.com>
Date: Thu, 17 Feb 2022 09:19:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] drm/i915/gem: Don't try to map and fence large
 scanout buffers (v8)
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
 <20220217075014.922605-4-vivek.kasireddy@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220217075014.922605-4-vivek.kasireddy@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/02/2022 07:50, Vivek Kasireddy wrote:
> On platforms capable of allowing 8K (7680 x 4320) modes, pinning 2 or
> more framebuffers/scanout buffers results in only one that is mappable/
> fenceable. Therefore, pageflipping between these 2 FBs where only one
> is mappable/fenceable creates latencies large enough to miss alternate
> vblanks thereby producing less optimal framerate.
> 
> This mainly happens because when i915_gem_object_pin_to_display_plane()
> is called to pin one of the FB objs, the associated vma is identified
> as misplaced and therefore i915_vma_unbind() is called which unbinds and
> evicts it. This misplaced vma gets subseqently pinned only when
> i915_gem_object_ggtt_pin_ww() is called without PIN_MAPPABLE. This
> results in a latency of ~10ms and happens every other vblank/repaint cycle.
> Therefore, to fix this issue, we try to see if there is space to map
> at-least two objects of a given size and return early if there isn't. This
> would ensure that we do not try with PIN_MAPPABLE for any objects that
> are too big to map thereby preventing unncessary unbind.
> 
> Testcase:
> Running Weston and weston-simple-egl on an Alderlake_S (ADLS) platform
> with a 8K@60 mode results in only ~40 FPS. Since upstream Weston submits
> a frame ~7ms before the next vblank, the latencies seen between atomic
> commit and flip event are 7, 24 (7 + 16.66), 7, 24..... suggesting that
> it misses the vblank every other frame.
> 
> Here is the ftrace snippet that shows the source of the ~10ms latency:
>                i915_gem_object_pin_to_display_plane() {
> 0.102 us   |    i915_gem_object_set_cache_level();
>                  i915_gem_object_ggtt_pin_ww() {
> 0.390 us   |      i915_vma_instance();
> 0.178 us   |      i915_vma_misplaced();
>                    i915_vma_unbind() {
>                    __i915_active_wait() {
> 0.082 us   |        i915_active_acquire_if_busy();
> 0.475 us   |      }
>                    intel_runtime_pm_get() {
> 0.087 us   |        intel_runtime_pm_acquire();
> 0.259 us   |      }
>                    __i915_active_wait() {
> 0.085 us   |        i915_active_acquire_if_busy();
> 0.240 us   |      }
>                    __i915_vma_evict() {
>                      ggtt_unbind_vma() {
>                        gen8_ggtt_clear_range() {
> 10507.255 us |        }
> 10507.689 us |      }
> 10508.516 us |   }
> 
> v2: Instead of using bigjoiner checks, determine whether a scanout
>      buffer is too big by checking to see if it is possible to map
>      two of them into the ggtt.
> 
> v3 (Ville):
> - Count how many fb objects can be fit into the available holes
>    instead of checking for a hole twice the object size.
> - Take alignment constraints into account.
> - Limit this large scanout buffer check to >= Gen 11 platforms.
> 
> v4:
> - Remove existing heuristic that checks just for size. (Ville)
> - Return early if we find space to map at-least two objects. (Tvrtko)
> - Slightly update the commit message.
> 
> v5: (Tvrtko)
> - Rename the function to indicate that the object may be too big to
>    map into the aperture.
> - Account for guard pages while calculating the total size required
>    for the object.
> - Do not subject all objects to the heuristic check and instead
>    consider objects only of a certain size.
> - Do the hole walk using the rbtree.
> - Preserve the existing PIN_NONBLOCK logic.
> - Drop the PIN_MAPPABLE check while pinning the VMA.
> 
> v6: (Tvrtko)
> - Return 0 on success and the specific error code on failure to
>    preserve the existing behavior.
> 
> v7: (Ville)
> - Drop the HAS_GMCH(i915), DISPLAY_VER(i915) < 11 and
>    size < ggtt->mappable_end / 4 checks.
> - Drop the redundant check that is based on previous heuristic.
> 
> v8:
> - Make sure that we are holding the mutex associated with ggtt vm
>    as we traverse the hole nodes.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gem.c | 124 +++++++++++++++++++++++---------
>   1 file changed, 90 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 2e10187cd0a0..db00e71ce328 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -49,6 +49,7 @@
>   #include "gem/i915_gem_pm.h"
>   #include "gem/i915_gem_region.h"
>   #include "gem/i915_gem_userptr.h"
> +#include "gem/i915_gem_tiling.h"
>   #include "gt/intel_engine_user.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_pm.h"
> @@ -879,6 +880,92 @@ static void discard_ggtt_vma(struct i915_vma *vma)
>   	spin_unlock(&obj->vma.lock);
>   }
>   
> +static int
> +i915_gem_object_fits_in_aperture(struct drm_i915_gem_object *obj,
> +				 u64 alignment, u64 flags)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> +	struct drm_mm_node *hole;
> +	u64 hole_start, hole_end, start, end;
> +	u64 fence_size, fence_alignment;
> +	unsigned int count = 0;
> +
> +	/*
> +	 * If the required space is larger than the available
> +	 * aperture, we will not able to find a slot for the
> +	 * object and unbinding the object now will be in
> +	 * vain. Worse, doing so may cause us to ping-pong
> +	 * the object in and out of the Global GTT and
> +	 * waste a lot of cycles under the mutex.
> +	 */
> +	if (obj->base.size > ggtt->mappable_end)
> +		return -E2BIG;
> +
> +	/*
> +	 * If NONBLOCK is set the caller is optimistically
> +	 * trying to cache the full object within the mappable
> +	 * aperture, and *must* have a fallback in place for
> +	 * situations where we cannot bind the object. We
> +	 * can be a little more lax here and use the fallback
> +	 * more often to avoid costly migrations of ourselves
> +	 * and other objects within the aperture.
> +	 */
> +	if (!(flags & PIN_NONBLOCK))
> +		return 0;
> +
> +	/*
> +	 * Other objects such as batchbuffers are fairly small compared
> +	 * to FBs and are unlikely to exahust the aperture space.
> +	 * Therefore, return early if this obj is not an FB.
> +	 */
> +	if (!i915_gem_object_is_framebuffer(obj))
> +		return 0;
> +
> +	fence_size = i915_gem_fence_size(i915, obj->base.size,
> +					 i915_gem_object_get_tiling(obj),
> +					 i915_gem_object_get_stride(obj));
> +
> +	if (i915_vm_has_cache_coloring(&ggtt->vm))
> +		fence_size += 2 * I915_GTT_PAGE_SIZE;
> +
> +	fence_alignment = i915_gem_fence_alignment(i915, obj->base.size,
> +						   i915_gem_object_get_tiling(obj),
> +						   i915_gem_object_get_stride(obj));
> +	alignment = max_t(u64, alignment, fence_alignment);
> +
> +	/*
> +	 * Assuming this object is a large scanout buffer, we try to find
> +	 * out if there is room to map at-least two of them. There could
> +	 * be space available to map one but to be consistent, we try to
> +	 * avoid mapping/fencing any of them.
> +	 */
> +	mutex_lock(&ggtt->vm.mutex);

Ah.. in which case I think pattern from i915_vma_pin_ww should be 
copied, ie:

	err = mutex_lock_interruptible_nested(&ggtt->vm.mutex, 0);

Regards,

Tvrtko

> +	drm_mm_for_each_suitable_hole(hole, &ggtt->vm.mm, 0, ggtt->mappable_end,
> +				      fence_size, DRM_MM_INSERT_LOW) {
> +		hole_start = drm_mm_hole_node_start(hole);
> +		hole_end = hole_start + hole->hole_size;
> +
> +		do {
> +			start = round_up(hole_start, alignment);
> +			end = min_t(u64, hole_end, ggtt->mappable_end);
> +
> +			if (range_overflows(start, fence_size, end))
> +				break;
> +
> +			if (++count >= 2) {
> +				mutex_unlock(&ggtt->vm.mutex);
> +				return 0;
> +			}
> +
> +			hole_start = start + fence_size;
> +		} while (1);
> +	}
> +
> +	mutex_unlock(&ggtt->vm.mutex);
> +	return -ENOSPC;
> +}
> +
>   struct i915_vma *
>   i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>   			    struct i915_gem_ww_ctx *ww,
> @@ -894,36 +981,9 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>   
>   	if (flags & PIN_MAPPABLE &&
>   	    (!view || view->type == I915_GGTT_VIEW_NORMAL)) {
> -		/*
> -		 * If the required space is larger than the available
> -		 * aperture, we will not able to find a slot for the
> -		 * object and unbinding the object now will be in
> -		 * vain. Worse, doing so may cause us to ping-pong
> -		 * the object in and out of the Global GTT and
> -		 * waste a lot of cycles under the mutex.
> -		 */
> -		if (obj->base.size > ggtt->mappable_end)
> -			return ERR_PTR(-E2BIG);
> -
> -		/*
> -		 * If NONBLOCK is set the caller is optimistically
> -		 * trying to cache the full object within the mappable
> -		 * aperture, and *must* have a fallback in place for
> -		 * situations where we cannot bind the object. We
> -		 * can be a little more lax here and use the fallback
> -		 * more often to avoid costly migrations of ourselves
> -		 * and other objects within the aperture.
> -		 *
> -		 * Half-the-aperture is used as a simple heuristic.
> -		 * More interesting would to do search for a free
> -		 * block prior to making the commitment to unbind.
> -		 * That caters for the self-harm case, and with a
> -		 * little more heuristics (e.g. NOFAULT, NOEVICT)
> -		 * we could try to minimise harm to others.
> -		 */
> -		if (flags & PIN_NONBLOCK &&
> -		    obj->base.size > ggtt->mappable_end / 2)
> -			return ERR_PTR(-ENOSPC);
> +		ret = i915_gem_object_fits_in_aperture(obj, alignment, flags);
> +		if (ret)
> +			return ERR_PTR(ret);
>   	}
>   
>   new_vma:
> @@ -935,10 +995,6 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>   		if (flags & PIN_NONBLOCK) {
>   			if (i915_vma_is_pinned(vma) || i915_vma_is_active(vma))
>   				return ERR_PTR(-ENOSPC);
> -
> -			if (flags & PIN_MAPPABLE &&
> -			    vma->fence_size > ggtt->mappable_end / 2)
> -				return ERR_PTR(-ENOSPC);
>   		}
>   
>   		if (i915_vma_is_pinned(vma) || i915_vma_is_active(vma)) {
