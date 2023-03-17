Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF46BE633
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 11:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437910EEC2;
	Fri, 17 Mar 2023 10:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E9010EEBC;
 Fri, 17 Mar 2023 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679047707; x=1710583707;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uRruDUpMUloHNAKErPk3HzphVHfNxocBv0GwXzAt47s=;
 b=G/5dXcO1eOUKY0o29MB5rJA+lSQgHVECKiU/1PUt8ss7YiS+F1uzvb7I
 dO99ub8iTotlY4JvNzl7k2++X1GWE6DOxxakm5FHzVehyWJ9BV/at096t
 a25GnQq/CQNC0rykW/+Vr3UoyDQ4YRZEKtxfPzBChI9zEYnq++m+8GeSU
 4WJo/tO9MW1u+RwFk08sZnHBZuqc8B0aB/rTtgr7GdQ3gWyE4OxbWoDDV
 mn2qdMWjcSy+q/jZMVfj1OxIhzYttmOCkUOYnt3fIacVLAMtaUVZ/xyYJ
 X/cR3IRYGCP5SqsDPxdJC8p8ag3nRTngzM1Oh7o9vxWD05TKJxiMbHQ2g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335724140"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="335724140"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 03:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710449749"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="710449749"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.63.160])
 ([10.252.63.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 03:08:25 -0700
Message-ID: <1ccd9a02-3d1c-d964-a03a-1e22439ae123@linux.intel.com>
Date: Fri, 17 Mar 2023 11:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 2/2] drm/i915/display: Implement fb_mmap callback
 function
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230316172220.16068-1-nirmoy.das@intel.com>
 <20230316172220.16068-2-nirmoy.das@intel.com> <87sfe3af83.fsf@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <87sfe3af83.fsf@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On 3/17/2023 10:39 AM, Jani Nikula wrote:
> On Thu, 16 Mar 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> If stolen memory allocation fails for fbdev, the driver will
>> fallback to system memory. Calculation of smem_start is wrong
>> for such framebuffer objs if the platform comes with no gmadr or
>> no aperture. Solve this by adding fb_mmap callback which will
>> use GTT if aperture is available otherwise will use cpu to access
>> the framebuffer.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index 673bcdfb7ff6..51d6fa034b00 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -40,8 +40,10 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>   
>>   #include "gem/i915_gem_lmem.h"
>> +#include "gem/i915_gem_mman.h"
>>   
>>   #include "i915_drv.h"
>>   #include "intel_display_types.h"
>> @@ -120,6 +122,16 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>>   	return ret;
>>   }
>>   
>> +#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
> I'd add that as a function (rather than a macro) in a separate patch,
> converting the existing users while at it.


Now I do see there are 5 instance of  this conversion. I will convert 
that into a function in a separate patch.


Thanks,

Nirmoy

>
> BR,
> Jani.
>
>
>> +static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>> +{
>> +	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
>> +	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
>> +	struct drm_i915_gem_object *obj = to_intel_bo(bo);
>> +
>> +	return i915_gem_fb_mmap(obj, vma);
>> +}
>> +
>>   static const struct fb_ops intelfb_ops = {
>>   	.owner = THIS_MODULE,
>>   	DRM_FB_HELPER_DEFAULT_OPS,
>> @@ -131,6 +143,7 @@ static const struct fb_ops intelfb_ops = {
>>   	.fb_imageblit = drm_fb_helper_cfb_imageblit,
>>   	.fb_pan_display = intel_fbdev_pan_display,
>>   	.fb_blank = intel_fbdev_blank,
>> +	.fb_mmap = intel_fbdev_mmap,
>>   };
>>   
>>   static int intelfb_alloc(struct drm_fb_helper *helper,
