Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEAD58151C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 16:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F05B8B1E4;
	Tue, 26 Jul 2022 14:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C338B90F;
 Tue, 26 Jul 2022 14:24:32 +0000 (UTC)
Received: from [192.168.178.53] (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 420BC66017E7;
 Tue, 26 Jul 2022 15:24:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658845470;
 bh=Mbn47rKnNfkH+c60C+HFUgYgKSFolTgkzigRer7mVvU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VulPfO7Y4IamyaXQXQW6QN7oKHqh1tU+MFOMZMFMTqnfCmewUJSi+ZWGKv6kxAJS0
 6WIamCRfh+jxIKzDwOyTY6MENJBKnA8IfpgJK5UuTpsp1mmXidfvboYFiHnVZSsBjt
 GcqXzWuR4Uf80c3eYXt/xYOMhI70irWLERZRbLsNg1Fk7TaI0iPB6ur4G0ZJnpLjcI
 ak2wtJN8fGWYtrrMu3ZIKeWEq8zfCHN2u3NlyL8xfcfgsEGZdg+htAYfT5Xgy8WNQb
 Fxoutn8r+LYi88mbigDbO32Iv5iJgUseIhG050J9gj61bmWt6W5mkds5BLQQABSZco
 znz/gHIDBkvGQ==
Message-ID: <be75778d-c6a1-08bc-6714-9aea0c0e5e12@collabora.com>
Date: Tue, 26 Jul 2022 15:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] drm/i915: stop using swiotlb
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220725141833.1970029-1-bob.beckett@collabora.com>
 <4f670d9f-c8e6-6c1d-34a8-3f3ef6f35beb@linux.intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <4f670d9f-c8e6-6c1d-34a8-3f3ef6f35beb@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, kernel@collabora.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/07/2022 14:12, Tvrtko Ursulin wrote:
> 
> On 25/07/2022 15:18, Robert Beckett wrote:
>> Calling swiotlb functions directly is nowadays considered harmful. See
>> https://lore.kernel.org/intel-gfx/20220711082614.GA29487@lst.de/
>>
>> Replace swiotlb_max_segment() calls with dma_max_mapping_size().
>> In i915_gem_object_get_pages_internal() no longer consider max_segment
>> only if CONFIG_SWIOTLB is enabled. There can be other (iommu related)
>> causes of specific max segment sizes.
>>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>>
>> v2: - restore UINT_MAX clamp in i915_sg_segment_size()
>>      - drop PAGE_SIZE check as it will always be >= PAGE_SIZE
>> v3: - actually clamp to UINT_MAX in i915_sg_segment_size()
>> v4: - round down max segment size to PAGE_SIZE
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_internal.c | 19 ++++---------------
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c    |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  4 ++--
>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  2 +-
>>   drivers/gpu/drm/i915/i915_scatterlist.h      | 17 ++++-------------
>>   5 files changed, 12 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
>> index c698f95af15f..24f37658f1bb 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
>> @@ -6,7 +6,6 @@
>>   #include <linux/scatterlist.h>
>>   #include <linux/slab.h>
>> -#include <linux/swiotlb.h>
>>   #include "i915_drv.h"
>>   #include "i915_gem.h"
>> @@ -38,22 +37,12 @@ static int 
>> i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
>>       struct scatterlist *sg;
>>       unsigned int sg_page_sizes;
>>       unsigned int npages;
>> -    int max_order;
>> +    int max_order = MAX_ORDER;
>> +    unsigned int max_segment;
>>       gfp_t gfp;
>> -    max_order = MAX_ORDER;
>> -#ifdef CONFIG_SWIOTLB
>> -    if (is_swiotlb_active(obj->base.dev->dev)) {
>> -        unsigned int max_segment;
>> -
>> -        max_segment = swiotlb_max_segment();
>> -        if (max_segment) {
>> -            max_segment = max_t(unsigned int, max_segment,
>> -                        PAGE_SIZE) >> PAGE_SHIFT;
>> -            max_order = min(max_order, ilog2(max_segment));
>> -        }
>> -    }
>> -#endif
>> +    max_segment = i915_sg_segment_size(i915->drm.dev) >> PAGE_SHIFT;
>> +    max_order = min(max_order, ilog2(max_segment));
>>       gfp = GFP_KERNEL | __GFP_HIGHMEM | __GFP_RECLAIMABLE;
>>       if (IS_I965GM(i915) || IS_I965G(i915)) {
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 4eed3dd90ba8..34b9c76cd8e6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -194,7 +194,7 @@ static int shmem_get_pages(struct 
>> drm_i915_gem_object *obj)
>>       struct intel_memory_region *mem = obj->mm.region;
>>       struct address_space *mapping = obj->base.filp->f_mapping;
>>       const unsigned long page_count = obj->base.size / PAGE_SIZE;
>> -    unsigned int max_segment = i915_sg_segment_size();
>> +    unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
>>       struct sg_table *st;
>>       struct sgt_iter sgt_iter;
>>       struct page *page;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 5a5cf332d8a5..7a828c9c0f6d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -189,7 +189,7 @@ static int i915_ttm_tt_shmem_populate(struct 
>> ttm_device *bdev,
>>       struct drm_i915_private *i915 = container_of(bdev, 
>> typeof(*i915), bdev);
>>       struct intel_memory_region *mr = 
>> i915->mm.regions[INTEL_MEMORY_SYSTEM];
>>       struct i915_ttm_tt *i915_tt = container_of(ttm, 
>> typeof(*i915_tt), ttm);
>> -    const unsigned int max_segment = i915_sg_segment_size();
>> +    const unsigned int max_segment = 
>> i915_sg_segment_size(i915->drm.dev);
>>       const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
>>       struct file *filp = i915_tt->filp;
>>       struct sgt_iter sgt_iter;
>> @@ -568,7 +568,7 @@ static struct i915_refct_sgt 
>> *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>>       ret = sg_alloc_table_from_pages_segment(st,
>>               ttm->pages, ttm->num_pages,
>>               0, (unsigned long)ttm->num_pages << PAGE_SHIFT,
>> -            i915_sg_segment_size(), GFP_KERNEL);
>> +            i915_sg_segment_size(i915_tt->dev), GFP_KERNEL);
>>       if (ret) {
>>           st->sgl = NULL;
>>           return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> index 094f06b4ce33..dfc35905dba2 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> @@ -129,7 +129,7 @@ static void 
>> i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
>>   static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
>>   {
>>       const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
>> -    unsigned int max_segment = i915_sg_segment_size();
>> +    unsigned int max_segment = i915_sg_segment_size(obj->base.dev->dev);
>>       struct sg_table *st;
>>       unsigned int sg_page_sizes;
>>       struct page **pvec;
>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h 
>> b/drivers/gpu/drm/i915/i915_scatterlist.h
>> index 9ddb3e743a3e..1377a97a20cf 100644
>> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
>> @@ -9,7 +9,7 @@
>>   #include <linux/pfn.h>
>>   #include <linux/scatterlist.h>
>> -#include <linux/swiotlb.h>
>> +#include <linux/dma-mapping.h>
>>   #include "i915_gem.h"
>> @@ -127,19 +127,10 @@ static inline unsigned int 
>> i915_sg_dma_sizes(struct scatterlist *sg)
>>       return page_sizes;
>>   }
>> -static inline unsigned int i915_sg_segment_size(void)
>> +static inline unsigned int i915_sg_segment_size(struct device *dev)
>>   {
>> -    unsigned int size = swiotlb_max_segment();
>> -
>> -    if (size == 0)
>> -        size = UINT_MAX;
>> -
>> -    size = rounddown(size, PAGE_SIZE);
>> -    /* swiotlb_max_segment_size can return 1 byte when it means one 
>> page. */
>> -    if (size < PAGE_SIZE)
>> -        size = PAGE_SIZE;
>> -
>> -    return size;
>> +    size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
> 
> Hope your patience is not growing thin but blank line here as per 
> checkpatch. I could fudge when applying though.

no worries, I'll issue a new version shortly.
I only recently guided a mentee to "always do your checkpatch, even if 
only doing a quick 1 character change, you never know if it you make a 
small mistake"
I guess do as I say, not as I do applies here :)

> 
> Otherwise it finally passed CI, yay! Now do we dig deeper to a) 
> understand how/where it failed and b) check what are the possible return 
> values from dma_max_mapping_size(), or call it done?

I will have to call it done myself as I am unable to repo it locally.
I could spend a lot of time debugging it via trybot, but I expect it 
will be easier, quicker and cheaper to get someone with local hw with a 
repro case to debug it if you want to root cause it.

> 
> Regards,
> 
> Tvrtko
> 
>> +    return round_down(max, PAGE_SIZE);
>>   }
>>   bool i915_sg_trim(struct sg_table *orig_st);
