Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBE6C143B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C4E10E19E;
	Mon, 20 Mar 2023 14:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666D710E19E;
 Mon, 20 Mar 2023 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679320833; x=1710856833;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+b4iRW1v8mboFW787glniqcN1c2jdG7YMQg1dz2xOGk=;
 b=OCWAM78ddJtAwNQN3Z2fvp76Xxx6aJXUMIEVvLbyhrenwzPE1gLS6ryU
 JHPgdbnujFuuUfJhI9UW9hAul+rJfHc7DjRI5/WSm32Ti5baEKOGv5Vv6
 RAgxtwzJQAcjz8LjpBYylujw+18oRoBUE/U77C3+GAy67DNep/w4ZXwdS
 qN+R6RBVrmnZbTCQkoWvEs7pz4U/SBaR4TfK3EV8Zjt3E87KTg9qekuOn
 71Vd7DeCYD1Qb/LdQplDIVuGMOUZuQe8NkcUYNCz6V1c0LhV++vBOcObJ
 jDHOWGIrgjiL5QC6rlrVk6q7i0lbn1u87coTWY8CoKKyLPOuEkouqis4c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336173740"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="336173740"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674393122"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="674393122"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.65])
 ([10.213.6.65])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:00:30 -0700
Message-ID: <8be083bb-413b-419e-5132-9035bf095618@intel.com>
Date: Mon, 20 Mar 2023 15:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap
 callback function
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230320100903.23588-1-nirmoy.das@intel.com>
 <20230320100903.23588-3-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230320100903.23588-3-nirmoy.das@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.03.2023 11:09, Nirmoy Das wrote:
> If stolen memory allocation fails for fbdev, the driver will
> fallback to system memory. Calculation of smem_start is wrong
> for such framebuffer objs if the platform comes with no gmadr or
> no aperture. Solve this by adding fb_mmap callback which will
> use GTT if aperture is available otherwise will use cpu to access
> the framebuffer.
> 
> v2: Use to_intel_fbdev() function(Jani)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/display/intel_fbdev.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 8c3b3c3fd0e0..5e52bef868a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -40,8 +40,10 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>   
>   #include "gem/i915_gem_lmem.h"
> +#include "gem/i915_gem_mman.h"
>   
>   #include "i915_drv.h"
>   #include "intel_display_types.h"
> @@ -119,6 +121,15 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>   	return ret;
>   }
>   
> +static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
> +	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
> +	struct drm_i915_gem_object *obj = to_intel_bo(bo);
> +
> +	return i915_gem_fb_mmap(obj, vma);
> +}
> +
>   static const struct fb_ops intelfb_ops = {
>   	.owner = THIS_MODULE,
>   	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -130,6 +141,7 @@ static const struct fb_ops intelfb_ops = {
>   	.fb_imageblit = drm_fb_helper_cfb_imageblit,
>   	.fb_pan_display = intel_fbdev_pan_display,
>   	.fb_blank = intel_fbdev_blank,
> +	.fb_mmap = intel_fbdev_mmap,
>   };
>   
>   static int intelfb_alloc(struct drm_fb_helper *helper,

