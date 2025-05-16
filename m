Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB8AB9EFA
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40E10EAF4;
	Fri, 16 May 2025 14:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FbQw8mvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950DA10EAF4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ka8Us6VJKFxV5bg6pcisDmYeEKSlI4rfq1X+t0hKOpQ=; b=FbQw8mvS3W7qSDpdhm/MVTjoyb
 fSu8y6v4YQ8ZnSqus+5pM3pi8XcP2JR1w0f1G12gdsyzOflhQp6F1kde/vwNb+7cF3GYcQkWZeWlb
 ItMRkgMhnz4sLRFHkMYjpXIr9oqWHBpy80eDvIY5p5JL/DXnHWnt4HfLdfwrkx9SyG9Y802w1Po3M
 Yv1tYj0WaoQM8XUbQlT5rpy72Eb+l7tNQ5D7UxAehGf/4d3ZQqE5fpNCNu8vw73wGQoxNc5/PEiS/
 gJSmoykw9q1qSaeuRqz4xHlNHMHufZA2krjCp2Qon8hwMC/5uKXQ5TRfwUog/mRPEoyIrK3thggZj
 Np05rFlA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFwL0-00988o-Nc; Fri, 16 May 2025 16:53:01 +0200
Message-ID: <6afd840d-904f-481a-b3af-d2429f721f57@igalia.com>
Date: Fri, 16 May 2025 15:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Make pool shrinker more responsive
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250515205751.37268-1-tvrtko.ursulin@igalia.com>
 <d4892d91-7562-4391-93fe-4b2ec159bb69@amd.com>
 <b453ccd4-b783-4314-8cc0-ed372d833ff1@igalia.com>
 <d3afe944-9a5d-4cf2-83ab-f32da4d59464@amd.com>
 <991d0b4c-dc74-4864-9560-f2b04f551550@igalia.com>
 <31ee0be4-d6e5-49a7-8db2-bbcc895db575@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <31ee0be4-d6e5-49a7-8db2-bbcc895db575@amd.com>
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


On 16/05/2025 15:03, Christian König wrote:
> On 5/16/25 15:41, Tvrtko Ursulin wrote:
>>>> But because TTM shrinker does not currently update shrinkerctl->nr_scanned, shrinker core assumes TTM looked at full SHRINK_BATCH pages with every call, and adds and decrements that value to the counters it uses to determine when to stop trying the TTM shrinker and move to the next one.
>>>
>>> Yeah that was intentional as well.
>>
>> What was the reason do you remember?
> 
> Uff I think it hat something to do with fairness between the different pool types.
> 
>>
>>>> Therefore the exit condition can trigger too early in relation to the number of shrinkable pages in TTM pools. Or it can require too many calls to ttm_pool_shrinker_scan.
>>>
>>> Oh, that is indeed problematic.
>>>
>>>> Depending on the distribution of freeable pages per pools.
>>>
>>> No, that should be completely unrelated.
>>>
>>>> This patch:
>>>>
>>>> 1. Fixes the TTM shrinker to correctly report shrinkctl->nr_scanned.
>>>
>>> No it doesn't. The nr_scanned for the TTM pool is not related to the number of pool types scanned.
>>
>> Not sure what you mean here.
>>
>> Ttm_pool_shrinker_count() reports in number of pages which shrinker core then uses to set nr_to_scan. But as ttm_pool_shrinker_scan() does not update nr_scanned the core shrinker logic is foiled. If that is by design I would like to understand why.
>>
>> But as nr_scanned is currently not updated at all, it is obviously not related to pools, or anything really.
>>
>> And in my patch it is still not related to the pools. I made it report the number of _pages_ scanned to align with ttm_pool_shrinker_count() and what the shrinker core expects.
> 
> Exactly that's the point, you are not using the number of pages scanned, but rather the order of the pool type. And that is clearly incorrect.

Ugh, you are absolutely correct.

I don't know what happened here.. well I know to an extent. I was 
working on some other bug and saw some weird shrinker behaviour. 
Misunderstood how it worked, "fixed it", saw the trace points showing a 
lot less activity which made me think "yeah this is better" and moved 
on. Until I remembered this patch and sent it out.

I think there is a little bit that could be improved, but this version 
clearly goes into the trash.

Sorry for the trouble and thanks a lot for persisting with explanations!

Regards,

Tvrtko

>>>> This way the break condition in shrinker core works correctly.
>>>>
>>>> 2. Makes TTM shrinker actually scan as much as the core requested from it (respecting shrinkerctl->nr_to_scan).
>>>>
>>>> This avoids only scanning say one page when shrinker core asked to scan 128. This reduces the number of calls into the TTM shrinker from the core to free same amount of pages.
>>>
>>> That should be easy, you just need to adjust the while loop in ttm_pool_shrinker_scan().
>>
>> Yes I think this part would be simple on its own.
>>
>>>> 3. Tunes the batch size away from the default 128 (SHRINK_BATCH) into a value based on the median size of the TTM pools.
>>>>
>>>> This ensures that on average TTM shrinker tries to actually free _something_ more often than it does now. Otherwise it can happen to try a few pools (depending LRU order) and give up, while the freeable pages are actually in the pools not yet looked at. By tuning the batch size it ensures that on average more pools are looked at.
>>>
>>> That doesn't make sense. The number of pools looked at is completely irrelevant for the shrinker.
>>
>> Nr_to_scan the shrinker core asks for is default at most 128 pages.
>>
>> This means TTM shrinker can look at the few small order pools, find nothing, and exit.
> 
> No, that is not what the code does. See here:
> 
>          do
>                  num_freed += ttm_pool_shrink();
>          while (!num_freed && atomic_long_read(&allocated_pages));
> 
> We scan until we find at least one page to free or the global allocated pages counter says that we don't have any pages to free.
> 
> Looking at empty pools actually doesn't make much sense, so they are just skipped until we find the one which contains the pages.
> 
>> Shrinker core may then call into it again to try again. Or maybe it can even move on the the next shrinker (away from TTM) if the distribution of free pages between pools is right.
>>
>> The exact behaviour here will depend on whether TTM shrinker starts respecting nr_to_scan and reporting nr_scanned so it is a bit premature to discuss in detail until those two are settled.
> 
> Then it is probably a good idea to separate that.
> 
>> Anyway, by tweaking the batch_size from 128 to 352 we can make the same effect in fewer iterations.
>>
>>> We should just look at all pools round robin until the number of objects/pages the shrinker wants to free has been freed.
>>
>> I thought that was what the patch does.
>>
>> Although on a second look I think am missing an exit condition for the case where requested amount cannot be freed.
>>
>>>> Now mind you I looked at this two months ago, which is when I first sent this patch out, but haven't went through this today again, it still makes sense to me. So I am curious why you think it totally does not. It looks obvious to me it is not respecting the contract with the core so I would be surprised if I was missing some obvious gotcha.
>>>
>>> It sounds like you are assuming that the pool type structure are the objects to scan and we abort when we have scanned a certain amount. But that isn't true, we abort when we can't find any page to free any more.
>>
>> Maybe I am blind but AFAICT it currently exits as soon as it frees at least one page:
>>
>> static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>>                          struct shrink_control *sc)
>> {
>>      unsigned long num_freed = 0;
>>
>>      do
>>          num_freed += ttm_pool_shrink();
>>      while (!num_freed && atomic_long_read(&allocated_pages));
>>
>>      return num_freed;
>> }
>>
>> Or you mean from the point of view of the core shrinker? Again, that one is complicated since it currently always decrements total_scan by SHRINK_BATCH. And total_scan is set to at most half of pool pages. So it can scan order0 find nothing -> total_scan -= 128, order1 find nothing -> total_scan -= 128, etc, and it soon accumulates a false positive large number of scanned pages and exits from TTM shrinker if freeable is low, but actually shrinkable pages are in the high order pool it did not even get to try.
> 
> That is not what happens. See the loop tries to free pages from all pools until it finds at least one.
> 
> After one page is freed the pool type is put at the end of the LRU, so with each new call to ttm_pool_shrink() we will keep going over different pool types.
> 
> See this here:
> 
>          pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>          list_move_tail(&pt->shrinker_list, &shrinker_list);
> 
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>>>       /* Return the allocation order based for a page */
>>>>>> @@ -881,10 +880,12 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>>>      */
>>>>>>     void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>>>>>>     {
>>>>>> +    unsigned long nr_scanned = 0;
>>>>>> +
>>>>>>         ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
>>>>>>           while (atomic_long_read(&allocated_pages) > page_pool_size)
>>>>>> -        ttm_pool_shrink();
>>>>>> +        ttm_pool_shrink(&nr_scanned);
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(ttm_pool_free);
>>>>>>     @@ -1132,17 +1133,21 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(ttm_pool_fini);
>>>>>>     -/* As long as pages are available make sure to release at least one */
>>>>>>     static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>>>>>>                             struct shrink_control *sc)
>>>>>>     {
>>>>>> -    unsigned long num_freed = 0;
>>>>>> +    unsigned long to_scan, freed = 0;
>>>>>>     -    do
>>>>>> -        num_freed += ttm_pool_shrink();
>>>>>> -    while (!num_freed && atomic_long_read(&allocated_pages));
>>>>>> +    sc->nr_scanned = 0;
>>>>>> +    to_scan = min_t(unsigned long,
>>>>>> +            sc->nr_to_scan, atomic_long_read(&allocated_pages));
>>>>>> +    while (freed < to_scan) {
>>>>>> +        freed += ttm_pool_shrink(&sc->nr_scanned);
>>>>>> +        to_scan = min_t(unsigned long,
>>>>>> +                to_scan, atomic_long_read(&allocated_pages));
>>>>>> +    }
>>>>>>     -    return num_freed;
>>>>>> +    return sc->nr_scanned ? freed : SHRINK_STOP;
>>>>>
>>>>> That again doesn't make sense. That we only find pool types which don't have pages doesn't mean we have scanned them.
>>>>>
>>>>> As far as I can see the existing code was correct after all.
>>>>>
>>>>>>     }
>>>>>>       /* Return the number of pages available or SHRINK_EMPTY if we have none */
>>>>>> @@ -1266,7 +1271,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>>>>>>     /* Test the shrinker functions and dump the result */
>>>>>>     static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>>>>>>     {
>>>>>> -    struct shrink_control sc = { .gfp_mask = GFP_NOFS };
>>>>>> +    struct shrink_control sc = {
>>>>>> +        .gfp_mask = GFP_NOFS,
>>>>>> +        .nr_to_scan = 1,
>>>>>> +    };
>>>>>>           fs_reclaim_acquire(GFP_KERNEL);
>>>>>>         seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
>>>>>> @@ -1324,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>>>>           mm_shrinker->count_objects = ttm_pool_shrinker_count;
>>>>>>         mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
>>>>>> +    mm_shrinker->batch = (1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS;
>>>>>
>>>>> Since we install only one global shrinker for all pool types, which might contain everything from 1 page till 512 pages, this seems to not make sense at all either.
>>>>>
>>>>> What exactly are you trying to do here?
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>         mm_shrinker->seeks = 1;
>>>>>>           shrinker_register(mm_shrinker);
>>>>>
>>>>
>>>
>>
> 

