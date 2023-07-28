Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E39766D3A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFF310E202;
	Fri, 28 Jul 2023 12:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8A410E1FD;
 Fri, 28 Jul 2023 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690547325; x=1722083325;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sTuKzolUQR86A0ZMGhgwdxxQRFfl8BF4cVC+ru5ACZI=;
 b=e3qEzLD7T8R6b41e/V0ejhEzgn56eBonIiFykgFNo9utNj+ZfuEkU6id
 rctkPqCGkVTDGLR9pBKPm90gSSpDGCnGN+EE0boz4ed1Yxwn+48Yp8n9I
 DhVLUyUDSMn66m/9rDYXjtGH7mZiHs1hH3OKJz/SI63iFHmwNhWUiNu+C
 DIk82rfnVxrEB2enXdrzQVUHwcdbAvldnLt1apyl5d5y9bYlB19c934Hm
 eL1MWjUDoAvYqUqD3hSVf68xknLdiiH+iHisGKzBzfOO658tFJJnpihtv
 HhL2LB9rGCZD03Z8YpZq6bN2S+QG7i/hMCTi5rVZEM/NQxYcmP11RFzOd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="367457800"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="367457800"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 05:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730730072"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="730730072"
Received: from atoomey-mobl.amr.corp.intel.com (HELO [10.213.197.30])
 ([10.213.197.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 05:28:43 -0700
Message-ID: <712d6084-f5ae-14c9-b9cc-c29389e93447@linux.intel.com>
Date: Fri, 28 Jul 2023 13:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 5/8] drm/i915: Improve the vm_fault_gtt user PAT index
 restriction
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-6-tvrtko.ursulin@linux.intel.com>
 <20230728000415.GE138014@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230728000415.GE138014@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/07/2023 01:04, Matt Roper wrote:
> On Thu, Jul 27, 2023 at 03:55:01PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Now that i915 understands the caching modes behind PAT indices, we can
>> refine the check in vm_fault_gtt() to not reject the uncached PAT if it
>> was set by userspace on a snoopable platform.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 14 +++-----------
>>   1 file changed, 3 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index cd7f8ded0d6f..9aa6ecf68432 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -382,17 +382,9 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>>   		goto err_reset;
>>   	}
>>   
>> -	/*
>> -	 * For objects created by userspace through GEM_CREATE with pat_index
>> -	 * set by set_pat extension, coherency is managed by userspace, make
>> -	 * sure we don't fail handling the vm fault by calling
>> -	 * i915_gem_object_has_cache_level() which always return true for such
>> -	 * objects. Otherwise this helper function would fall back to checking
>> -	 * whether the object is un-cached.
>> -	 */
>> -	if (!((obj->pat_set_by_user ||
>> -	       i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)) ||
>> -	      HAS_LLC(i915))) {
>> +	/* Access to snoopable pages through the GTT is incoherent. */
> 
> This comment was removed in the previous patch, but now it came back
> here.  Should we have just left it be in the previous patch?

Oops yes, fumble when splitting the single patch into this series.

> I'm not really clear on what it means either.  Are we using "GTT" as
> shorthand to refer to the aperture here?

It is about CPU mmap access so I think so.

Original code was:

         /* Access to snoopable pages through the GTT is incoherent. */
         if (obj->cache_level != I915_CACHE_NONE && !HAS_LLC(i915)) {
                 ret = -EFAULT;
                 goto err_unpin;
         }

Which was disallowing anything not uncached on snoopable platforms. So I 
made it equivalent to that:

	/* Access to snoopable pages through the GTT is incoherent. */
	if (!i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) &&
	    !HAS_LLC(i915)) {
		ret = -EFAULT;
		goto err_unpin;
	}

Should be like-for-like assuming PAT-to-cache-mode tables are all good.

On Meteorlake it is no change in behaviour either way due !HAS_LLC.

Regards,

Tvrtko


> 
> Matt
> 
>> +	if (!i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) &&
>> +	    !HAS_LLC(i915)) {
>>   		ret = -EFAULT;
>>   		goto err_unpin;
>>   	}
>> -- 
>> 2.39.2
>>
> 
