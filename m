Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131589E00D3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B5A10E231;
	Mon,  2 Dec 2024 11:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/Kn/lYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7453010E231;
 Mon,  2 Dec 2024 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733139832; x=1764675832;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7fCge4gDuYoUZkLXyzWo2x+Zswc7dBoRRNxVj+Mzr6s=;
 b=W/Kn/lYkP7nMYqWUeK8pDtUDc5utQUMEGFTcZlAINVo0289fQmsv8eCj
 /HwZQg8oXcjX8LZqINgdwYolWFYzFbzHC9RbUbC+BOZd5jlow1Y/KpS3Z
 fmHrPpw97a3mVIYACXqImaWvtTLKSSB11aKR1SRayZqFHrxn9u47jgoE0
 F0pzAsVALh+CxocP6Sg335YigSNqEEBM+HEgfD1AHe08+B+j7L7o0B54F
 LQNwcgnnTdbEk45gzd0SE2RFnd2AGTAMBmUF+YlRuyU89nSo7Z+yWjNrN
 PyEFP0sUBRj43jJh8muVAPXwIXyjPUizs+VQK5vpi5/ZM1QtZJcZtoOnV g==;
X-CSE-ConnectionGUID: VrbvPsXLRuanihkWWn19sg==
X-CSE-MsgGUID: 354qxN5FTz2i2AYnbldVaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="55794836"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="55794836"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 03:43:52 -0800
X-CSE-ConnectionGUID: /VrlC8m0TmGrtAibmaQzGg==
X-CSE-MsgGUID: 98xuwLZRQG+iHxaCWGjf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93173275"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 03:43:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v7 5/8] drm/xe/display: Update intel_bo_read_from_page
 to use ttm_bo_access
In-Reply-To: <20241126174615.2665852-6-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-6-matthew.brost@intel.com>
Date: Mon, 02 Dec 2024 13:43:37 +0200
Message-ID: <87o71u5mza.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 26 Nov 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> Don't open code vmap of a BO, use ttm_bo_access helper which is safe for
> non-contiguous BOs and non-visible BOs.
>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

I've seen a few cases of [1] lately, and Thomas tipped me off to this
change. We get:

<4> [374.262965] xe 0000:03:00.0: [drm] drm_WARN_ON(ret)
<4> [374.262983] WARNING: CPU: 8 PID: 5462 at drivers/gpu/drm/i915/display/intel_display.c:7637 intel_atomic_commit_tail+0x16c7/0x17f0 [xe]

and that's intel_atomic_prepare_plane_clear_colors():

		ret = intel_bo_read_from_page(intel_fb_bo(fb),
					      fb->offsets[cc_plane] + 16,
					      &plane_state->ccval,
					      sizeof(plane_state->ccval));
		/* The above could only fail if the FB obj has an unexpected backing store type. */
		drm_WARN_ON(&i915->drm, ret);


So I don't have any conclusive evidence, but could this be the reason?

BR,
Jani.



[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v8/shard-dg2-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc.html


> ---
>  drivers/gpu/drm/xe/display/intel_bo.c | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> index 9f54fad0f1c0..43141964f6f2 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -40,31 +40,8 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
>  {
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> -	struct ttm_bo_kmap_obj map;
> -	void *src;
> -	bool is_iomem;
> -	int ret;
>  
> -	ret = xe_bo_lock(bo, true);
> -	if (ret)
> -		return ret;
> -
> -	ret = ttm_bo_kmap(&bo->ttm, offset >> PAGE_SHIFT, 1, &map);
> -	if (ret)
> -		goto out_unlock;
> -
> -	offset &= ~PAGE_MASK;
> -	src = ttm_kmap_obj_virtual(&map, &is_iomem);
> -	src += offset;
> -	if (is_iomem)
> -		memcpy_fromio(dst, (void __iomem *)src, size);
> -	else
> -		memcpy(dst, src, size);
> -
> -	ttm_bo_kunmap(&map);
> -out_unlock:
> -	xe_bo_unlock(bo);
> -	return ret;
> +	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
>  }
>  
>  struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)

-- 
Jani Nikula, Intel
