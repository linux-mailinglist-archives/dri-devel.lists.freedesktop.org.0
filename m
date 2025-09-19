Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA44B891CE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 12:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2C910E984;
	Fri, 19 Sep 2025 10:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PAxiWOHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105D010E984;
 Fri, 19 Sep 2025 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f3gOPAwGgGhAbnRGGA18QXMsBVGPkgYJQJvoSsF9M24=; b=PAxiWOHlWteIQUR2H3W7VLqN7o
 fgi088OnL7a5ZY1vAtaEnlT+T93hZbQKcL4kB+oi1wjApfxQ2mD8SDsdYkoXEgHzL8e7cOToE7gI5
 YBUAn3pE5UWP17mWgTa8VFHeZuUrl9k1hbgV2SulZhIWKX0VREJujJehR6lx/K1n2EXvm4qKNULmG
 CuBH8ayyJsp1zMqkYS0aJc6MfOVbk0rW0WTIOM3QbvHt5K54l68Cy6aZy0MeS/fYKHF4v+58uvxQo
 eVHZ8y/zstjmiXVXW7dfDbDBp0du0eIcknKz2oPwlSkJ1Rn/L7TerPwkpZOQF0s1YsLF8HG6DbU6p
 HuaaLGeQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uzYZE-00E3Jx-33; Fri, 19 Sep 2025 12:42:16 +0200
Message-ID: <2063040f-f434-4569-bd7c-61f24ee1ef50@igalia.com>
Date: Fri, 19 Sep 2025 11:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
 <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
 <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
 <96c117bc-389f-42d9-952e-894768aad780@amd.com>
 <76861e33-8d07-4b97-9f91-4c5651732e91@igalia.com>
 <cfb34506-30d5-4b73-8bac-cf3c1a018901@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <cfb34506-30d5-4b73-8bac-cf3c1a018901@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/09/2025 11:17, Christian König wrote:
> On 19.09.25 10:46, Tvrtko Ursulin wrote:
>>
>> On 19/09/2025 09:01, Christian König wrote:
>>> On 19.09.25 09:43, Tvrtko Ursulin wrote:
>>>> On 19/09/2025 07:46, Christian König wrote:
>>>>> On 18.09.25 22:09, Thadeu Lima de Souza Cascardo wrote:
>>>>>> On certain workloads, like on ChromeOS when opening multiple tabs and
>>>>>> windows, and switching desktops, memory pressure can build up and latency
>>>>>> is observed as high order allocations result in memory reclaim. This was
>>>>>> observed when running on an amdgpu.
>>>>>>
>>>>>> This is caused by TTM pool allocations and turning off direct reclaim when
>>>>>> doing those higher order allocations leads to lower memory pressure.
>>>>>>
>>>>>> Since turning direct reclaim off might also lead to lower throughput,
>>>>>> make it tunable, both as a module parameter that can be changed in sysfs
>>>>>> and as a flag when allocating a GEM object.
>>>>>>
>>>>>> A latency option will avoid direct reclaim for higher order allocations.
>>>>>>
>>>>>> The throughput option could be later used to more agressively compact pages
>>>>>> or reclaim, by not using __GFP_NORETRY.
>>>>>
>>>>> Well I can only repeat it, at least for amdgpu that is a clear NAK from my side to this.
>>>>>
>>>>> The behavior to allocate huge pages is a must have for the driver.
>>>>
>>>> Disclaimer that I wouldn't go system-wide but per device - so somewhere in sysfs rather than a modparam. That kind of a toggle would not sound problematic to me since it leaves the policy outside the kernel and allows people to tune to their liking.
>>>
>>> Yeah I've also wrote before when that is somehow beneficial for nouveau (for example) then I don't have any problem with making the policy device dependent.
>>>
>>> But for amdgpu we have so many so bad experiences with this approach that I absolutely can't accept that.
>>>
>>>> One side question thought - does AMD benefit from larger than 2MiB contiguous blocks? IIUC the maximum PTE is 2MiB so maybe not? In which case it may make sense to add some TTM API letting drivers tell the pool allocator what is the maximum order to bother with. Larger than that may have diminishing benefit for the disproportionate pressure on the memory allocator and reclaim.
>>>
>>> Using 1GiB allocations would allow for the page tables to skip another layer on AMD GPUs, but the most benefit is between 4kiB and 2MiB since that can be handled more efficiently by the L1. Having 2MiB allocations then also has an additional benefit for L2.
>>>
>>> Apart from performance for AMD GPUs there are also some HW features which only work with huge pages, e.g. on some laptops you can get for example flickering on the display if the scanout buffer is back by to many small pages.
>>>
>>> NVidia used to work on 1GiB allocations which as far as I know was the kickoff for the whole ongoing switch to using folios instead of pages. And from reading public available documentation I have the impression that NVidia GPUs works more or less the same as AMD GPUs regarding the TLB.
>>
>> 1GiB is beyond the TTM pool allocator scope, right?
> 
> Yes, on x86 64bit the pool allocator can allocate at maximum 2MiB by default IIRC.

I think 10 is the max order so 4MiB. So it wouldn't be much relief to 
the allocator but better than nothing(tm)?

>>  From what you wrote it sounds like my idea would actually be okay. A very gentle approach (minimal change in behaviour) to only disable direct reclaim above the threshold set by the driver.
> 
> Well the problem is that the threshold set by amdgpu would be 2MiB and by default there isn't anything above it on x86. So that would be a no-op. On ARM64 that idea could potentially help maybe.

Some architectures appear to default to more than 10, and some offer 
Kconfig to change the default.

I think this means in the patch I proposed I am missing a 
min(MAX_PAGE_ORDER, max_beneficial_order) when setting the pool property.

> I could look into the HW documentation again what we would need as minimum for functional correctness, but there are quite a number of use cases and lowering from 2MiB to something like 256KiB or 512KiB potentially won't really help and still cause a number of performance issues in the L2.

It would be very good if you could check for requirements regarding 
functional correctness. Could that also differ per generation/part, and 
if so, maybe it should be made configurable in the ttm_pool API as well 
as an order below it is better to fail instead of moving to a lower order?

Regards,

Tvrtko

>> Along the lines of:
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 428265046815..06b243f05edd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1824,7 +1824,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>>       for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>>           ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>>                     adev->gmc.mem_partitions[i].numa.node,
>> -                  false, false);
>> +                  false, false, get_order(2 * SZ_1M));
>>       }
>>       return 0;
>>   }
>> @@ -1865,7 +1865,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>>                      adev_to_drm(adev)->anon_inode->i_mapping,
>>                      adev_to_drm(adev)->vma_offset_manager,
>>                      adev->need_swiotlb,
>> -                   dma_addressing_limited(adev->dev));
>> +                   dma_addressing_limited(adev->dev),
>> +                   get_order(2 * SZ_1M));
>>       if (r) {
>>           dev_err(adev->dev,
>>               "failed initializing buffer object driver(%d).\n", r);
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index baf27c70a419..5d54e8373230 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -726,8 +726,12 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>
>>       page_caching = tt->caching;
>>       allow_pools = true;
>> -    for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>> -         alloc->remaining_pages;
>> +
>> +    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>> +    if (order > pool->max_beneficial_order)
>> +        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>> +
>> +    for (; alloc->remaining_pages;
>>            order = ttm_pool_alloc_find_order(order, alloc)) {
>>           struct ttm_pool_type *pt;
>>
>> @@ -745,6 +749,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>           if (!p) {
>>               page_caching = ttm_cached;
>>               allow_pools = false;
>> +            if (order <= pool->max_beneficial_order)
>> +                gfp_flags |= __GFP_DIRECT_RECLAIM;
>>               p = ttm_pool_alloc_page(pool, gfp_flags, order);
>>           }
>>           /* If that fails, lower the order if possible and retry. */
>> @@ -1064,7 +1070,8 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>>    * Initialize the pool and its pool types.
>>    */
>>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> -           int nid, bool use_dma_alloc, bool use_dma32)
>> +           int nid, bool use_dma_alloc, bool use_dma32,
>> +           unsigned int max_beneficial_order)
>>   {
>>       unsigned int i, j;
>>
>> @@ -1074,6 +1081,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>       pool->nid = nid;
>>       pool->use_dma_alloc = use_dma_alloc;
>>       pool->use_dma32 = use_dma32;
>> +    pool->max_beneficial_order = max_beneficial_order;
>>
>>       for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>           for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>
>>
>> That should have the page allocator working less hard and lower the latency with large buffers.
>>
>> Then a more aggressive change on top could be:
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 5d54e8373230..152164f79927 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -726,12 +726,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>
>>       page_caching = tt->caching;
>>       allow_pools = true;
>> -
>> -    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>> -    if (order > pool->max_beneficial_order)
>> -        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>> -
>> -    for (; alloc->remaining_pages;
>> +    for (order = ttm_pool_alloc_find_order(pool->max_beneficial_order, alloc);
>> +         alloc->remaining_pages;
>>            order = ttm_pool_alloc_find_order(order, alloc)) {
>>           struct ttm_pool_type *pt;
>>
>> @@ -749,8 +745,6 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>           if (!p) {
>>               page_caching = ttm_cached;
>>               allow_pools = false;
>> -            if (order <= pool->max_beneficial_order)
>> -                gfp_flags |= __GFP_DIRECT_RECLAIM;
>>               p = ttm_pool_alloc_page(pool, gfp_flags, order);
>>           }
>>           /* If that fails, lower the order if possible and retry. */
>>
>> Ie. don't even bother trying to allocate orders above what the driver says is useful. Could be made a drivers choice as well.
>>
>> And all could be combined with some sort of a sysfs control, as Cascardo was suggesting, to disable direct reclaim completely if someone wants that.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Another alternative would be that we add a WARN_ONCE() when we have to fallback to lower order pages, but that wouldn't help the end user either. It just makes it more obvious that you need more memory for a specific use case without triggering the OOM killer.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Other drivers can later opt to use this mechanism too.
>>>>>>
>>>>>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - Make disabling direct reclaim an option.
>>>>>> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
>>>>>>
>>>>>> ---
>>>>>> Thadeu Lima de Souza Cascardo (3):
>>>>>>          ttm: pool: allow requests to prefer latency over throughput
>>>>>>          ttm: pool: add a module parameter to set latency preference
>>>>>>          drm/amdgpu: allow allocation preferences when creating GEM object
>>>>>>
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
>>>>>>     drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
>>>>>>     drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
>>>>>>     include/drm/ttm/ttm_bo.h                   |  5 +++++
>>>>>>     include/drm/ttm/ttm_pool.h                 |  2 +-
>>>>>>     include/drm/ttm/ttm_tt.h                   |  2 +-
>>>>>>     include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
>>>>>>     8 files changed, 38 insertions(+), 11 deletions(-)
>>>>>> ---
>>>>>> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
>>>>>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
>>>>>>
>>>>>> Best regards,
>>>>>
>>>>
>>>
>>
> 

