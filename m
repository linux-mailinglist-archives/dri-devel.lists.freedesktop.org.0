Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D89E04A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269FB10E75C;
	Mon,  2 Dec 2024 14:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtqVFbwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27EC10E75C;
 Mon,  2 Dec 2024 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733149084; x=1764685084;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JB4mgiJsE+p6EI61rz9n/0H7J08XaThpfbIpd7k81rI=;
 b=QtqVFbwM8ExDc8A/mlS82eLPUcUMDZUVNGUKZ1a6436aAYXlzxnuxOy9
 sHSS1M70Zh3QNzW5Y4HIucdAghChX5e04chKhA8b2L/0jgvhzBtegJlYT
 ZyX/wc1Gk5D5O1kbGbwVEWwhhwta5Mjnn5lAPcJUKcVCQpoE2fsBLPYtQ
 ZD0BHl1PlaVrvVZAFa9eSqerFBcqBC33Tz6bJcr6FEkfb6pZYE1tKv8kF
 i917ETt2SGaSaBS1p1IGSOmZRcfA+r8nz0JANIAr5k80m1NJHWX9h+EAA
 IcEF3IecA61ur3MX3roKp8zoMwJyaK4boEZ1JEmDt3YvhBNlwUzuhh+oM g==;
X-CSE-ConnectionGUID: x22px8CATTaw4FBw1dBpgA==
X-CSE-MsgGUID: Bqjs4kjISxGwL5m9GTosCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33565410"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33565410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 06:18:03 -0800
X-CSE-ConnectionGUID: lt8YnKJSTW2h7arR/vPhMQ==
X-CSE-MsgGUID: ETOSaA5+TEeGXxcvFAeucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="98086044"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.79])
 ([10.245.244.79])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 06:18:02 -0800
Message-ID: <39f2bbb3-5a53-4a6b-b066-be6be1ead293@intel.com>
Date: Mon, 2 Dec 2024 14:17:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] drm/xe/display: Update intel_bo_read_from_page to
 use ttm_bo_access
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, thomas.hellstrom@linux.intel.com
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-6-matthew.brost@intel.com> <87o71u5mza.fsf@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <87o71u5mza.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/12/2024 11:43, Jani Nikula wrote:
> On Tue, 26 Nov 2024, Matthew Brost <matthew.brost@intel.com> wrote:
>> Don't open code vmap of a BO, use ttm_bo_access helper which is safe for
>> non-contiguous BOs and non-visible BOs.
>>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> I've seen a few cases of [1] lately, and Thomas tipped me off to this
> change. We get:
> 
> <4> [374.262965] xe 0000:03:00.0: [drm] drm_WARN_ON(ret)
> <4> [374.262983] WARNING: CPU: 8 PID: 5462 at drivers/gpu/drm/i915/display/intel_display.c:7637 intel_atomic_commit_tail+0x16c7/0x17f0 [xe]
> 
> and that's intel_atomic_prepare_plane_clear_colors():
> 
> 		ret = intel_bo_read_from_page(intel_fb_bo(fb),
> 					      fb->offsets[cc_plane] + 16,
> 					      &plane_state->ccval,
> 					      sizeof(plane_state->ccval));
> 		/* The above could only fail if the FB obj has an unexpected backing store type. */
> 		drm_WARN_ON(&i915->drm, ret);
> 
> 
> So I don't have any conclusive evidence, but could this be the reason?

@@ -40,8 +40,13 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, 
struct vm_area_struct *vma)
  int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, 
void *dst, int size)
  {
         struct xe_bo *bo = gem_to_xe_bo(obj);
+       int ret;

-       return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+       ret = ttm_bo_access(&bo->ttm, offset, dst, size, 0);
+       if (ret == size)
+               ret = 0;
+
+       return ret;
  }

I think we somehow missed that bo_access is returning @size on success?

> 
> BR,
> Jani.
> 
> 
> 
> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v8/shard-dg2-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc.html
> 
> 
>> ---
>>   drivers/gpu/drm/xe/display/intel_bo.c | 25 +------------------------
>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
>> index 9f54fad0f1c0..43141964f6f2 100644
>> --- a/drivers/gpu/drm/xe/display/intel_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
>> @@ -40,31 +40,8 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>>   int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
>>   {
>>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>> -	struct ttm_bo_kmap_obj map;
>> -	void *src;
>> -	bool is_iomem;
>> -	int ret;
>>   
>> -	ret = xe_bo_lock(bo, true);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = ttm_bo_kmap(&bo->ttm, offset >> PAGE_SHIFT, 1, &map);
>> -	if (ret)
>> -		goto out_unlock;
>> -
>> -	offset &= ~PAGE_MASK;
>> -	src = ttm_kmap_obj_virtual(&map, &is_iomem);
>> -	src += offset;
>> -	if (is_iomem)
>> -		memcpy_fromio(dst, (void __iomem *)src, size);
>> -	else
>> -		memcpy(dst, src, size);
>> -
>> -	ttm_bo_kunmap(&map);
>> -out_unlock:
>> -	xe_bo_unlock(bo);
>> -	return ret;
>> +	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
>>   }
>>   
>>   struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
> 

