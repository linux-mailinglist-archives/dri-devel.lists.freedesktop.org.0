Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D912A654F82
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83DA10E633;
	Fri, 23 Dec 2022 11:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BD110E187;
 Fri, 23 Dec 2022 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671794023; x=1703330023;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fS49hjvhPQi7qWmi9Wx+A23qmh6Nn21iu5yxOlK5qGI=;
 b=RybA7W+oBX2Mrs+Vz2F/a9VD1RWPEgiYZXnfHhMVmS8U59gu52BpkT1v
 gz8f8Rl+l6oEFxpew+dlYlYVDnuIRJYsjEzCVE+i40Ee5F2lwx6db5EIn
 YZnkbjdRJmALvVZRf4Z9MUpvY4ORR9ANwWPBGFWdckcioADUoJMGXmcdj
 v+GbsHhalF19t41Xmo4wjfOmRyxOAi8ofVKySfESuqjaUDQYgj4CmfV+u
 kBHpvjFlUBc9/YJhxCJxn9mIpLYZxWBRvFMSCB/mN0LVQaPZnTFlqkhWZ
 Td9zWqyjtXitRpmuLs5hnGlgyZ61Thff0Y2UpIIZMG43AEfAGa38DgSEh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="317961412"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="317961412"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 03:13:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="684510035"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="684510035"
Received: from mirabhat-mobl1.amr.corp.intel.com (HELO [10.213.188.137])
 ([10.213.188.137])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 03:13:33 -0800
Message-ID: <a08b8c97-a972-ad5f-d5d2-0f172fc7b15e@linux.intel.com>
Date: Fri, 23 Dec 2022 11:13:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Intel-gfx] [RFC PATCH 11/20] drm/i915: Remove gem and overlay
 frontbuffer tracking
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-12-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221222222127.34560-12-matthew.brost@intel.com>
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


On 22/12/2022 22:21, Matthew Brost wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Frontbuffer update handling should be done explicitly by using dirtyfb
> calls only.

A bit terse - questions around if this breaks something, and if it does 
what and why it is okay, were left hanging in the air in the previous 
thread (a6cdde0b-47a1-967d-f2c4-9299618cb1fb@linux.intel.com). Can that 
be discussed please?

Plus, this does not appear to be either DRM core or Xe work so maybe 
doesn't need to be in this series to start with?!

Regards,

Tvrtko

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/i9xx_plane.c     |  1 +
>   drivers/gpu/drm/i915/display/intel_drrs.c     |  1 +
>   drivers/gpu/drm/i915/display/intel_fb.c       |  1 +
>   drivers/gpu/drm/i915/display/intel_overlay.c  | 14 -----------
>   .../drm/i915/display/intel_plane_initial.c    |  1 +
>   drivers/gpu/drm/i915/display/intel_psr.c      |  1 +
>   .../drm/i915/display/skl_universal_plane.c    |  1 +
>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  4 ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  7 ------
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 --
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 25 -------------------
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 22 ----------------
>   drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  4 ---
>   drivers/gpu/drm/i915/i915_driver.c            |  1 +
>   drivers/gpu/drm/i915/i915_gem.c               |  8 ------
>   drivers/gpu/drm/i915/i915_gem_gtt.c           |  1 -
>   drivers/gpu/drm/i915/i915_vma.c               | 12 ---------
>   17 files changed, 7 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index ecaeb7dc196b..633e462d96a0 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -17,6 +17,7 @@
>   #include "intel_display_types.h"
>   #include "intel_fb.h"
>   #include "intel_fbc.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_sprite.h"
>   
>   /* Primary plane formats for gen <= 3 */
> diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
> index 5b9e44443814..3503d112387d 100644
> --- a/drivers/gpu/drm/i915/display/intel_drrs.c
> +++ b/drivers/gpu/drm/i915/display/intel_drrs.c
> @@ -9,6 +9,7 @@
>   #include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_drrs.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_panel.h"
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 63137ae5ab21..7cf31c87884c 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -12,6 +12,7 @@
>   #include "intel_display_types.h"
>   #include "intel_dpt.h"
>   #include "intel_fb.h"
> +#include "intel_frontbuffer.h"
>   
>   #define check_array_bounds(i915, a, i) drm_WARN_ON(&(i915)->drm, (i) >= ARRAY_SIZE(a))
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index c12bdca8da9b..5b86563ce577 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -186,7 +186,6 @@ struct intel_overlay {
>   	struct intel_crtc *crtc;
>   	struct i915_vma *vma;
>   	struct i915_vma *old_vma;
> -	struct intel_frontbuffer *frontbuffer;
>   	bool active;
>   	bool pfit_active;
>   	u32 pfit_vscale_ratio; /* shifted-point number, (1<<12) == 1.0 */
> @@ -287,20 +286,9 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
>   				       struct i915_vma *vma)
>   {
>   	enum pipe pipe = overlay->crtc->pipe;
> -	struct intel_frontbuffer *frontbuffer = NULL;
>   
>   	drm_WARN_ON(&overlay->i915->drm, overlay->old_vma);
>   
> -	if (vma)
> -		frontbuffer = intel_frontbuffer_get(vma->obj);
> -
> -	intel_frontbuffer_track(overlay->frontbuffer, frontbuffer,
> -				INTEL_FRONTBUFFER_OVERLAY(pipe));
> -
> -	if (overlay->frontbuffer)
> -		intel_frontbuffer_put(overlay->frontbuffer);
> -	overlay->frontbuffer = frontbuffer;
> -
>   	intel_frontbuffer_flip_prepare(overlay->i915,
>   				       INTEL_FRONTBUFFER_OVERLAY(pipe));
>   
> @@ -810,8 +798,6 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
>   		goto out_pin_section;
>   	}
>   
> -	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
> -
>   	if (!overlay->active) {
>   		const struct intel_crtc_state *crtc_state =
>   			overlay->crtc->config;
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 76be796df255..cad9c8884af3 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -9,6 +9,7 @@
>   #include "intel_display.h"
>   #include "intel_display_types.h"
>   #include "intel_fb.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_plane_initial.h"
>   
>   static bool
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 9820e5fdd087..bc998b526d88 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -33,6 +33,7 @@
>   #include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_dp_aux.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_hdmi.h"
>   #include "intel_psr.h"
>   #include "intel_snps_phy.h"
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 4b79c2d2d617..2f5524f380b0 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -16,6 +16,7 @@
>   #include "intel_display_types.h"
>   #include "intel_fb.h"
>   #include "intel_fbc.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_psr.h"
>   #include "intel_sprite.h"
>   #include "skl_scaler.h"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index b3b398fe689c..df2db78b10ca 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -6,8 +6,6 @@
>   
>   #include <drm/drm_cache.h>
>   
> -#include "display/intel_frontbuffer.h"
> -
>   #include "i915_drv.h"
>   #include "i915_gem_clflush.h"
>   #include "i915_sw_fence_work.h"
> @@ -22,8 +20,6 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
>   {
>   	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
>   	drm_clflush_sg(obj->mm.pages);
> -
> -	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>   }
>   
>   static void clflush_work(struct dma_fence_work *base)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 9969e687ad85..cd5505da4884 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -4,7 +4,6 @@
>    * Copyright © 2014-2016 Intel Corporation
>    */
>   
> -#include "display/intel_frontbuffer.h"
>   #include "gt/intel_gt.h"
>   
>   #include "i915_drv.h"
> @@ -65,8 +64,6 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
>   				intel_gt_flush_ggtt_writes(vma->vm->gt);
>   		}
>   		spin_unlock(&obj->vma.lock);
> -
> -		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>   		break;
>   
>   	case I915_GEM_DOMAIN_WC:
> @@ -629,9 +626,6 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   out_unlock:
>   	i915_gem_object_unlock(obj);
>   
> -	if (!err && write_domain)
> -		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
> -
>   out:
>   	i915_gem_object_put(obj);
>   	return err;
> @@ -742,7 +736,6 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
>   	}
>   
>   out:
> -	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
>   	obj->mm.dirty = true;
>   	/* return with the pages pinned */
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index f98600ca7557..08f84d4f4f92 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -11,8 +11,6 @@
>   
>   #include <drm/drm_syncobj.h>
>   
> -#include "display/intel_frontbuffer.h"
> -
>   #include "gem/i915_gem_ioctls.h"
>   #include "gt/intel_context.h"
>   #include "gt/intel_gpu_commands.h"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 1a0886b8aaa1..d2fef38cd12e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -27,7 +27,6 @@
>   
>   #include <drm/drm_cache.h>
>   
> -#include "display/intel_frontbuffer.h"
>   #include "pxp/intel_pxp.h"
>   
>   #include "i915_drv.h"
> @@ -400,30 +399,6 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>   		queue_work(i915->wq, &i915->mm.free_work);
>   }
>   
> -void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
> -					 enum fb_op_origin origin)
> -{
> -	struct intel_frontbuffer *front;
> -
> -	front = __intel_frontbuffer_get(obj);
> -	if (front) {
> -		intel_frontbuffer_flush(front, origin);
> -		intel_frontbuffer_put(front);
> -	}
> -}
> -
> -void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
> -					      enum fb_op_origin origin)
> -{
> -	struct intel_frontbuffer *front;
> -
> -	front = __intel_frontbuffer_get(obj);
> -	if (front) {
> -		intel_frontbuffer_invalidate(front, origin);
> -		intel_frontbuffer_put(front);
> -	}
> -}
> -
>   static void
>   i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
>   {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 3db53769864c..90dba761889c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -11,7 +11,6 @@
>   #include <drm/drm_file.h>
>   #include <drm/drm_device.h>
>   
> -#include "display/intel_frontbuffer.h"
>   #include "intel_memory_region.h"
>   #include "i915_gem_object_types.h"
>   #include "i915_gem_gtt.h"
> @@ -573,27 +572,6 @@ int i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
>   				  unsigned int flags,
>   				  const struct i915_sched_attr *attr);
>   
> -void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
> -					 enum fb_op_origin origin);
> -void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
> -					      enum fb_op_origin origin);
> -
> -static inline void
> -i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
> -				  enum fb_op_origin origin)
> -{
> -	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
> -		__i915_gem_object_flush_frontbuffer(obj, origin);
> -}
> -
> -static inline void
> -i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
> -				       enum fb_op_origin origin)
> -{
> -	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
> -		__i915_gem_object_invalidate_frontbuffer(obj, origin);
> -}
> -
>   int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size);
>   
>   bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> index 68453572275b..4cf57676e180 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -156,15 +156,11 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
>   	 * We manually control the domain here and pretend that it
>   	 * remains coherent i.e. in the GTT domain, like shmem_pwrite.
>   	 */
> -	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
> -
>   	if (copy_from_user(vaddr, user_data, args->size))
>   		return -EFAULT;
>   
>   	drm_clflush_virt_range(vaddr, args->size);
>   	intel_gt_chipset_flush(to_gt(i915));
> -
> -	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c1e427ba57ae..f4201f9c5f84 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -346,6 +346,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   
>   	spin_lock_init(&dev_priv->irq_lock);
>   	spin_lock_init(&dev_priv->gpu_error.lock);
> +	spin_lock_init(&dev_priv->display.fb_tracking.lock);
>   	mutex_init(&dev_priv->display.backlight.lock);
>   
>   	mutex_init(&dev_priv->sb_lock);
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 969581e7106f..594891291735 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -40,7 +40,6 @@
>   #include <drm/drm_vma_manager.h>
>   
>   #include "display/intel_display.h"
> -#include "display/intel_frontbuffer.h"
>   
>   #include "gem/i915_gem_clflush.h"
>   #include "gem/i915_gem_context.h"
> @@ -569,8 +568,6 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
>   		goto out_rpm;
>   	}
>   
> -	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
> -
>   	user_data = u64_to_user_ptr(args->data_ptr);
>   	offset = args->offset;
>   	remain = args->size;
> @@ -613,7 +610,6 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
>   	}
>   
>   	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
> -	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>   
>   	i915_gem_gtt_cleanup(obj, &node, vma);
>   out_rpm:
> @@ -700,8 +696,6 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
>   		offset = 0;
>   	}
>   
> -	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
> -
>   	i915_gem_object_unpin_pages(obj);
>   	return ret;
>   
> @@ -1272,8 +1266,6 @@ void i915_gem_init_early(struct drm_i915_private *dev_priv)
>   {
>   	i915_gem_init__mm(dev_priv);
>   	i915_gem_init__contexts(dev_priv);
> -
> -	spin_lock_init(&dev_priv->display.fb_tracking.lock);
>   }
>   
>   void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index 7bd1861ddbdf..a9662cc6ed1e 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -15,7 +15,6 @@
>   #include <asm/set_memory.h>
>   #include <asm/smp.h>
>   
> -#include "display/intel_frontbuffer.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_requests.h"
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 7d044888ac33..e3b73175805b 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -26,7 +26,6 @@
>   #include <linux/dma-fence-array.h>
>   #include <drm/drm_gem.h>
>   
> -#include "display/intel_frontbuffer.h"
>   #include "gem/i915_gem_lmem.h"
>   #include "gem/i915_gem_tiling.h"
>   #include "gt/intel_engine.h"
> @@ -1901,17 +1900,6 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>   			return err;
>   	}
>   
> -	if (flags & EXEC_OBJECT_WRITE) {
> -		struct intel_frontbuffer *front;
> -
> -		front = __intel_frontbuffer_get(obj);
> -		if (unlikely(front)) {
> -			if (intel_frontbuffer_invalidate(front, ORIGIN_CS))
> -				i915_active_add_request(&front->write, rq);
> -			intel_frontbuffer_put(front);
> -		}
> -	}
> -
>   	if (fence) {
>   		struct dma_fence *curr;
>   		enum dma_resv_usage usage;
