Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A906AC330
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F2510E1F0;
	Mon,  6 Mar 2023 14:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB1B10E1F0;
 Mon,  6 Mar 2023 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678112816; x=1709648816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K1suZY9ywmMDBq1E0+GwSZsAraus6W+uVK228G2pXYA=;
 b=eguVo9nbT4SWfoc6LsqUC0ipI9tF/HZ7IHNAeZRyvyCD3myqRnZlkhz7
 1kGM8nNz+5Aqm83jrOLMZDzs7Qwlv0Z+cCv3aYxTAl9DElnTElIbtg688
 Zl+wQir0Ee3F4399j4Oz0o1cOqPkNzq9KaHn85Gl9KAhokgjzF0+h71Om
 buy0OkXaQcLzRapEATOuMrOr6zXL/siKeaKR1AM0mI67SMsCWnyLI6LgO
 l+Almmlfj4uQzLC8hvYF16LKSpCug2XTbw5LiFFUbyyLyHgUC5Ogq3S/s
 KG19Cde41vkNH7dBRvdQwnEoDRL5FM8A5f4NsOLyiLjn6170+1JU9jkO1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="421837704"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="421837704"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 06:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676182864"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="676182864"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 06 Mar 2023 06:26:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 16:26:52 +0200
Date: Mon, 6 Mar 2023 16:26:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Add a helper func for gem obj mmap
Message-ID: <ZAX4LLcCWOe0UZOA@intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <20230306102850.18299-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306102850.18299-2-nirmoy.das@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 11:28:49AM +0100, Nirmoy Das wrote:
> Move gem obj mmap code to i915_gem_object_mmap() so that
> this can be used by others.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 20 ++---------------
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 25 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_mman.h   |  1 +
>  3 files changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index fd556a076d05..831dd8ebf819 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -12,6 +12,7 @@
>  #include <asm/smp.h>
>  
>  #include "gem/i915_gem_dmabuf.h"
> +#include "gem/i915_gem_mman.h"
>  #include "i915_drv.h"
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
> @@ -94,27 +95,10 @@ static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf,
>  static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>  {
>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
> -	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> -	int ret;
>  
>  	dma_resv_assert_held(dma_buf->resv);
>  
> -	if (obj->base.size < vma->vm_end - vma->vm_start)
> -		return -EINVAL;
> -
> -	if (HAS_LMEM(i915))
> -		return drm_gem_prime_mmap(&obj->base, vma);
> -
> -	if (!obj->base.filp)
> -		return -ENODEV;
> -
> -	ret = call_mmap(obj->base.filp, vma);
> -	if (ret)
> -		return ret;
> -
> -	vma_set_file(vma, obj->base.filp);
> -
> -	return 0;
> +	return i915_gem_object_mmap(obj, vma);
>  }
>  
>  static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_direction direction)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 2aac6bf78740..d378720ca626 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -11,6 +11,8 @@
>  
>  #include <drm/drm_cache.h>
>  
> +#include "gem/i915_gem_lmem.h"
> +
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_requests.h"
>  
> @@ -1043,6 +1045,29 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return 0;
>  }
>  
> +int i915_gem_object_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	int ret;
> +
> +	if (obj->base.size < vma->vm_end - vma->vm_start)
> +		return -EINVAL;
> +
> +	if (HAS_LMEM(i915))
> +		return drm_gem_prime_mmap(&obj->base, vma);

Calling some prime stuff here doesn't smell right.

> +
> +	if (obj->base.filp) {
> +		ret = call_mmap(obj->base.filp, vma);
> +		if (ret)
> +			return ret;
> +
> +		vma_set_file(vma, obj->base.filp);
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  #include "selftests/i915_gem_mman.c"
>  #endif
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> index 1fa91b3033b3..303e81ddc5ba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> @@ -30,4 +30,5 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
>  void i915_gem_object_runtime_pm_release_mmap_offset(struct drm_i915_gem_object *obj);
>  void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
>  
> +int i915_gem_object_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma);
>  #endif
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
