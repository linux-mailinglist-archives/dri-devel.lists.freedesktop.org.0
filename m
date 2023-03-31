Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC26D1F08
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888C10F1E8;
	Fri, 31 Mar 2023 11:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8C610F1E7;
 Fri, 31 Mar 2023 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680262242; x=1711798242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gy2iUMMoAkiXA84t4PlX410aMEkTzJ8H2TfoEMCYKy8=;
 b=BzlcctFugXgb7lvFEJj2X46lpCRqQPC4SdwYpSKazrQGgAzs7ntd8aE1
 VkgGOIM01ky/wITpA2ICWu0S7YwsGoeV97TDoDKEwctLdQ5cxmn9Eo8pP
 /NnLrc2EnnHhj/nOZSiaGk/46CnlEmmP0DbJhIuSJbA3b01SWeMYziADd
 N3APLgoU8VH159Q1XNN7E4z4jql1M8rhaW7mhjhoTmIXnhO/fIAUuxw5a
 dsJFrBB3XNdzsR8bSJwjPmLfmRvPDzfG45IshNejX3LOtKYIQS3zdKipU
 b+TJ8zn+3aU+TX8sh/aX3z/eIHpKUQYAmdNYzOBYnmpRuYqWEZeDZwxPE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321082197"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321082197"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687623165"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="687623165"
Received: from bpower-mobl3.ger.corp.intel.com (HELO [10.213.225.27])
 ([10.213.225.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:30:22 -0700
Message-ID: <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
Date: Fri, 31 Mar 2023 12:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
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
 <20230329073220.3982460-10-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31/03/2023 05:18, Ira Weiny wrote:
> Zhao Liu wrote:
>> From: Zhao Liu <zhao1.liu@intel.com>
>>
>> The use of kmap_atomic() is being deprecated in favor of
>> kmap_local_page()[1], and this patch converts the calls from
>> kmap_atomic() to kmap_local_page().
>>
>> The main difference between atomic and local mappings is that local
>> mappings doesn't disable page faults or preemption (the preemption is
>> disabled for !PREEMPT_RT case, otherwise it only disables migration).
>>
>> With kmap_local_page(), we can avoid the often unwanted side effect of
>> unnecessary page faults and preemption disables.
>>
>> In i915_gem_execbuffer.c, eb->reloc_cache.vaddr is mapped by
>> kmap_atomic() in eb_relocate_entry(), and is unmapped by
>> kunmap_atomic() in reloc_cache_reset().
> 
> First off thanks for the series and sticking with this.  That said this
> patch kind of threw me for a loop because tracing the map/unmap calls did
> not make sense to me.  See below.
> 
>>
>> And this mapping/unmapping occurs in two places: one is in
>> eb_relocate_vma(), and another is in eb_relocate_vma_slow().
>>
>> The function eb_relocate_vma() or eb_relocate_vma_slow() doesn't
>> need to disable pagefaults and preemption during the above mapping/
>> unmapping.
>>
>> So it can simply use kmap_local_page() / kunmap_local() that can
>> instead do the mapping / unmapping regardless of the context.
>>
>> Convert the calls of kmap_atomic() / kunmap_atomic() to
>> kmap_local_page() / kunmap_local().
>>
>> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
>>
>> v2: No code change since v1. Added description of the motivation of
>>      using kmap_local_page() and "Suggested-by" tag of Fabio.
>>
>> Suggested-by: Ira Weiny <ira.weiny@intel.com>
>> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>> Suggested by credits:
>>    Ira: Referred to his task document, review comments.
>>    Fabio: Referred to his boiler plate commit message and his description
>>           about why kmap_local_page() should be preferred.
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 9dce2957b4e5..805565edd148 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -1151,7 +1151,7 @@ static void reloc_cache_unmap(struct reloc_cache *cache)
>>   
>>   	vaddr = unmask_page(cache->vaddr);
>>   	if (cache->vaddr & KMAP)
>> -		kunmap_atomic(vaddr);
>> +		kunmap_local(vaddr);
> 
> In the cover letter you don't mention this unmap path.  Rather you mention
> only reloc_cache_reset().
> 
> After digging into this and considering these are kmap_atomic() calls I
> _think_ what you have is ok.  But I think I'd like to see the call paths
> documented a bit more clearly.  Or perhaps cleaned up a lot.
> 
> For example I see the following call possibility from a user ioctl.  In
> this trace I see 2 examples where something is unmapped first.  I don't
> understand why that is required?  I would assume reloc_cache_unmap() and
> reloc_kmap() are helpers called from somewhere else requiring a remapping
> of the cache but I don't see it.

Reloc_cache_unmap is called from eb_relocate_entry.

The confusing part unmap appears first is just because reloc_cache is a 
stateful setup. The previous mapping is kept around until reset (callers 
moves to a different parent object), and unampped/remapped once moved to 
a different page within that object.

However I am unsure if disabling pagefaulting is needed or not. Thomas, 
Matt, being the last to touch this area, perhaps you could have a look? 
Because I notice we have a fallback iomap path which still uses 
io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is 
safe, does the iomap side also needs converting to 
io_mapping_map_local_wc? Or they have separate requirements?

Regards,

Tvrtko

> 
> i915_gem_execbuffer2_ioctl()
> eb_relocate_parse()
> eb_relocate_parse_slow()
> eb_relocate_vma_slow()
> 	eb_relocate_entry()
> 		reloc_cache_unmap()
> 			kunmap_atomic()  <=== HERE!
> 		reloc_cache_remap()
> 			kmap_atomic()
> 		relocate_entry()
> 			reloc_vaddr()
> 				reloc_kmap()
> 					kunmap_atomic() <== HERE!
> 					kmap_atomic()
> 
> 	reloc_cache_reset()
> 		kunmap_atomic()
> 
> Could these mappings be cleaned up a lot more?  Perhaps by removing some
> of the helper functions which AFAICT are left over from older versions of
> the code?
> 
> Also as an aside I think it is really bad that eb_relocate_entry() returns
> negative errors in a u64.  Better to get the types right IMO.
> 
> Thanks for the series!
> Ira
> 
>>   	else
>>   		io_mapping_unmap_atomic((void __iomem *)vaddr);
>>   }
>> @@ -1167,7 +1167,7 @@ static void reloc_cache_remap(struct reloc_cache *cache,
>>   	if (cache->vaddr & KMAP) {
>>   		struct page *page = i915_gem_object_get_page(obj, cache->page);
>>   
>> -		vaddr = kmap_atomic(page);
>> +		vaddr = kmap_local_page(page);
>>   		cache->vaddr = unmask_flags(cache->vaddr) |
>>   			(unsigned long)vaddr;
>>   	} else {
>> @@ -1197,7 +1197,7 @@ static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer
>>   		if (cache->vaddr & CLFLUSH_AFTER)
>>   			mb();
>>   
>> -		kunmap_atomic(vaddr);
>> +		kunmap_local(vaddr);
>>   		i915_gem_object_finish_access(obj);
>>   	} else {
>>   		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
>> @@ -1229,7 +1229,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
>>   	struct page *page;
>>   
>>   	if (cache->vaddr) {
>> -		kunmap_atomic(unmask_page(cache->vaddr));
>> +		kunmap_local(unmask_page(cache->vaddr));
>>   	} else {
>>   		unsigned int flushes;
>>   		int err;
>> @@ -1251,7 +1251,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
>>   	if (!obj->mm.dirty)
>>   		set_page_dirty(page);
>>   
>> -	vaddr = kmap_atomic(page);
>> +	vaddr = kmap_local_page(page);
>>   	cache->vaddr = unmask_flags(cache->vaddr) | (unsigned long)vaddr;
>>   	cache->page = pageno;
>>   
>> -- 
>> 2.34.1
>>
> 
> 
