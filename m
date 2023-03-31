Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A16D1958
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1380C10F115;
	Fri, 31 Mar 2023 08:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BE910F115;
 Fri, 31 Mar 2023 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680249953; x=1711785953;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tCEPtMFHwMiPnIQhrk5UuQkBneCkpsHzNe9u71qZH+U=;
 b=PiqiVlgTzquxPQokzhAdntNyqSfvXMJ65p/bqCyzkFysYqFZiU8IfNU2
 mV6tbhwr0vFon3sUZ7FSTHaxgGwMHgRu20lDEnwl1YMzJJ4oszw86bwet
 QF0KWS01krHBLK8MkXvPXkmy0HgCeoEQJdHiGN2zOf1QRYvfnihGExs8h
 PwilR8CdD9nBYWr87yqhgmyYtk2uohAOe/rL291mUUzouPP7rS83k2c/I
 6oofCtlmSaX3lCe2wHRV8rJVMaiPEZtxQh6Jp9fKF/ckd9USZgZacOoCD
 MILDH60hl4lp+ZYhC+Ce/4zLOVVDp3U1u1XFrDvMfQhnxj4w9yk1bqEIv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343047704"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="343047704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662339930"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="662339930"
Received: from bpower-mobl3.ger.corp.intel.com (HELO [10.213.225.27])
 ([10.213.225.27])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:05:26 -0700
Message-ID: <78821fe7-a22d-d731-0f5c-b9bcace06e1f@linux.intel.com>
Date: Fri, 31 Mar 2023 09:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/9] drm/i915: Use kmap_local_page() in
 gem/selftests/i915_gem_context.c
Content-Language: en-US
To: Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-7-zhao1.liu@linux.intel.com>
 <642654876a503_375f7e294e@iweiny-mobl.notmuch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <642654876a503_375f7e294e@iweiny-mobl.notmuch>
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
Cc: Dave Hansen <dave.hansen@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31/03/2023 04:33, Ira Weiny wrote:
> Zhao Liu wrote:
>> From: Zhao Liu <zhao1.liu@intel.com>
>>
>> The use of kmap_atomic() is being deprecated in favor of
>> kmap_local_page()[1], and this patch converts the call from
>> kmap_atomic() to kmap_local_page().
>>
>> The main difference between atomic and local mappings is that local
>> mappings doesn't disable page faults or preemption.
>>
>> With kmap_local_page(), we can avoid the often unwanted side effect of
>> unnecessary page faults or preemption disables.
>>
>> In drm/i915/gem/selftests/i915_gem_context.c, functions cpu_fill() and
>> cpu_check() mainly uses mapping to flush cache and check/assign the
>> value.
>>
>> There're 2 reasons why cpu_fill() and cpu_check() don't need to disable
>> pagefaults and preemption for mapping:
>>
>> 1. The flush operation is safe. cpu_fill() and cpu_check() call
>> drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush. Since
>> CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
>> drm_clflush_virt_range(), the flush operation is global.
>>
>> 2. Any context switch caused by preemption or page faults (page fault
>> may cause sleep) doesn't affect the validity of local mapping.
>>
>> Therefore, cpu_fill() and cpu_check() are functions where the use of
>> kmap_local_page() in place of kmap_atomic() is correctly suited.
>>
>> Convert the calls of kmap_atomic() / kunmap_atomic() to
>> kmap_local_page() / kunmap_local().
>>
>> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
>>
>> v2:
>> * Dropped hot plug related description since it has nothing to do with
>>    kmap_local_page().
>> * No code change since v1, and added description of the motivation of
>>    using kmap_local_page().
>>
>> Suggested-by: Dave Hansen <dave.hansen@intel.com>
>> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> 
> First off I think this is fine.
> 
> But as I looked at this final selftests patch I began to wonder how the
> memory being mapped here and in the previous selftests patches are
> allocated.  Does highmem need to be considered at all?  Unfortunately, I
> could not determine where the memory in the SG list of this test gem
> object was allocated.
> 
> AFAICS cpu_fill() is only called in create_test_object().  Digging into
> huge_gem_object() did not reveal where these pages were allocated from.
> 
> I wonder if these kmap_local_page() calls could be removed entirely based
> on knowing that the pages were allocated from low mem?  Removing yet
> another user of highmem altogether would be best if possible.
> 
> Do you know how these test objects are created?  Do the pages come from
> user space somehow?

FWIW

create_test_object
  -> huge_gem_object
      -> i915_gem_object_init(obj, &huge_ops, &lock_class, 0);

Which is:

static const struct drm_i915_gem_object_ops huge_ops = {
	.name = "huge-gem",
	.get_pages = huge_get_pages,
	.put_pages = huge_put_pages,
};

And:

huge_get_pages()
...
#define GFP (GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAIL)
...
		page = alloc_page(GFP | __GFP_HIGHMEM);

> 
> Regardless this is still a step in the right direction so:
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Yeah LGTM.

FYI I am yet to read through the rest of the series, but I don't think 
there will be anything problematic and it passed our CI so likely is 
good to pull in.

Regards,

Tvrtko

> 
>> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>> Suggested by credits:
>>    Dave: Referred to his explanation about cache flush.
>>    Ira: Referred to his task document, review comments and explanation
>>         about cache flush.
>>    Fabio: Referred to his boiler plate commit message and his description
>>           about why kmap_local_page() should be preferred.
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> index a81fa6a20f5a..dcbc0b8e3323 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> @@ -481,12 +481,12 @@ static int cpu_fill(struct drm_i915_gem_object *obj, u32 value)
>>   	for (n = 0; n < real_page_count(obj); n++) {
>>   		u32 *map;
>>   
>> -		map = kmap_atomic(i915_gem_object_get_page(obj, n));
>> +		map = kmap_local_page(i915_gem_object_get_page(obj, n));
>>   		for (m = 0; m < DW_PER_PAGE; m++)
>>   			map[m] = value;
>>   		if (!has_llc)
>>   			drm_clflush_virt_range(map, PAGE_SIZE);
>> -		kunmap_atomic(map);
>> +		kunmap_local(map);
>>   	}
>>   
>>   	i915_gem_object_finish_access(obj);
>> @@ -512,7 +512,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>>   	for (n = 0; n < real_page_count(obj); n++) {
>>   		u32 *map, m;
>>   
>> -		map = kmap_atomic(i915_gem_object_get_page(obj, n));
>> +		map = kmap_local_page(i915_gem_object_get_page(obj, n));
>>   		if (needs_flush & CLFLUSH_BEFORE)
>>   			drm_clflush_virt_range(map, PAGE_SIZE);
>>   
>> @@ -538,7 +538,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
>>   		}
>>   
>>   out_unmap:
>> -		kunmap_atomic(map);
>> +		kunmap_local(map);
>>   		if (err)
>>   			break;
>>   	}
>> -- 
>> 2.34.1
>>
> 
> 
