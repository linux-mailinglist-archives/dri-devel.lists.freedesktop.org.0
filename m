Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3CF4A8307
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F7110E923;
	Thu,  3 Feb 2022 11:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E11C10E6B0;
 Thu,  3 Feb 2022 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643887134; x=1675423134;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GGmTlvMHrHihcIUs6DSTTieeXtZE31QJ2yoe8YRquFQ=;
 b=X+N0be22LqiWD/C65COlclPR93aienCwxmRvHZzPVrWIKSdApoBBj9dM
 RR7ZDb96zWJjvCbTuBYnK+GFQOP82RAWwfLLVoJ2+Bx731yw9NDi1kB+R
 Kl8rtjOcIh3x89/VpqQWcRVqeEK3rLl9ZVBznWZGfXva86WDzrk6DpjfI
 kpMP8b9dyEbPRYnZff6LJVRBAUAm1a0cEYrGbbWblythZC0qf0tINYb/6
 +ufKTRKmCX8jg91qNkggAiNtC4df5SUb4k+SOWMN+M7WgQ/cWpx3LCdQJ
 APLfu3dTb+VXqwLQHVjPxdBMFfSaHXqKA10iWA0K7495DXbuhOP06FwwK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="334482827"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="334482827"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:18:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="627405068"
Received: from blovejoy-mobl.ger.corp.intel.com (HELO [10.252.16.183])
 ([10.252.16.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:18:52 -0800
Message-ID: <addd2b3d-95b1-f824-c7dc-c7b05b4497ba@intel.com>
Date: Thu, 3 Feb 2022 11:18:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 19/20] drm/i915/lmem: don't treat small BAR as an error
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-20-matthew.auld@intel.com>
 <a537f361-ae72-c62c-062f-4e96a9e48682@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <a537f361-ae72-c62c-062f-4e96a9e48682@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 09:48, Thomas Hellström wrote:
> 
> On 1/26/22 16:21, Matthew Auld wrote:
>> Just pass along the probed io_size. The backend should be able to
>> utilize the entire range here, even if some of it is non-mappable.
> Changes here LGTM.
>>
>> It does leave open with what to do with stolen local-memory.
> 
> Are objects in stolen local required to be mappable?

 From a quick look I don't really see such users on discrete, outside of 
maybe intelfb_create(), where I guess the initial fb might be located in 
stolen on DG1. But from DG2+ it looks like it will just be located in 
normal LMEM. For that I was thinking we add something like 
i915_gem_object_create_region_at(), and somehow wire that up to the 
{fpfn, lpfn}...

> 
> /Thomas
> 
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c 
>> b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>> index 2c7ec7ff79fd..b788fc2b3df8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>> @@ -200,6 +200,7 @@ static struct intel_memory_region 
>> *setup_lmem(struct intel_gt *gt)
>>       struct intel_memory_region *mem;
>>       resource_size_t min_page_size;
>>       resource_size_t io_start;
>> +    resource_size_t io_size;
>>       resource_size_t lmem_size;
>>       int err;
>> @@ -210,7 +211,8 @@ static struct intel_memory_region 
>> *setup_lmem(struct intel_gt *gt)
>>       lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
>>       io_start = pci_resource_start(pdev, 2);
>> -    if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
>> +    io_size = min(pci_resource_len(pdev, 2), lmem_size);
>> +    if (!io_size)
>>           return ERR_PTR(-ENODEV);
>>       min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>> @@ -220,7 +222,7 @@ static struct intel_memory_region 
>> *setup_lmem(struct intel_gt *gt)
>>                        lmem_size,
>>                        min_page_size,
>>                        io_start,
>> -                     lmem_size,
>> +                     io_size,
>>                        INTEL_MEMORY_LOCAL,
>>                        0,
>>                        &intel_region_lmem_ops);
