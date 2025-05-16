Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74904AB9ADB
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 13:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8904010EA53;
	Fri, 16 May 2025 11:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="V8/Knxue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962F010EA66
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0sD8sk4Dwsqf00ZY+InOQ9GjIXmuIfKUUv8j5wVhSc=; b=V8/KnxueR0rPutEFU8oc/EOMQv
 rnMhmbcthNJ1t2FOSHPJE211NQVkuMbuLNFchFuPu/+/B/KwKLcHMGrH8HTA+A8RGeRNqhUcw8rWV
 tS7op8MotQcHyPPR/JNflL4NPybmxWxPHa0nLovTA43f29E9VC++cddz3dGUnNDsWoBq4nZY1u44j
 wlRup0a41lKOv5///hsVoqDwgY9ovyLl9CVPiHUCvaZCgOQJN1X4bhcO9g/JBZW2c2ydgJGmEIEK3
 /98NXgjKjucstjkd4RIXc2rqgUuF0IvMIUZe2f9GOHsallhjP2mvxKhQdAgpFzyjE5+PIaSvIxVJh
 V6IEeqsA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFt2h-0093nt-Kl; Fri, 16 May 2025 13:21:54 +0200
Message-ID: <b453ccd4-b783-4314-8cc0-ed372d833ff1@igalia.com>
Date: Fri, 16 May 2025 12:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Make pool shrinker more responsive
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250515205751.37268-1-tvrtko.ursulin@igalia.com>
 <d4892d91-7562-4391-93fe-4b2ec159bb69@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d4892d91-7562-4391-93fe-4b2ec159bb69@amd.com>
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


On 16/05/2025 09:23, Christian König wrote:
> On 5/15/25 22:57, Tvrtko Ursulin wrote:
>> Currently the TTM pool shrinker ensures it frees at least something every
>> time it is invoked, but it also lies to the core a bit on how hard it
>> tried.
>>
>> For example core will ask it to free SHRINK_BATCH pages but the shrinker
>> can, due how it walks the LRU list of pools, free just a single page and
>> still leave the core thinking it expended the full SHRINK_BATCH effort.
>>
>> Apart from being inefficient in terms of number of calls to the TTM pool
>> shrinker required, another consquence of this is that the core can abandon
>> the shrinking attempt too early due thinking that the whole set of
>> freeable pages has been scanned.
>>
>> We fix this last part by correctly reporting how many out of potentially
>> freeable pages have been scanned.
>>
>> We also do the freeing in an aggressive manner, considering the scan
>> target as a free target, to ensure walks over pools with unfreeable pages
>> do not cause no-op calls into our callback.
>>
>> And finally we customise the shrinker batch size based on the median pool
>> order and the total number of pools, with the aim of searching more
>> possible pools on an average invocation.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 39 +++++++++++++++++++++-------------
>>   1 file changed, 24 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index c2ea865be657..a76fe5f95781 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -368,7 +368,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>   }
>>   
>>   /* Free pages using the global shrinker list */
>> -static unsigned int ttm_pool_shrink(void)
>> +static unsigned int ttm_pool_shrink(unsigned long *nr_scanned)
>>   {
>>   	struct ttm_pool_type *pt;
>>   	unsigned int num_pages;
>> @@ -380,16 +380,15 @@ static unsigned int ttm_pool_shrink(void)
>>   	list_move_tail(&pt->shrinker_list, &shrinker_list);
>>   	spin_unlock(&shrinker_lock);
>>   
>> +	num_pages = 1 << pt->order;
>> +	(*nr_scanned) += num_pages;
>> +
>>   	p = ttm_pool_type_take(pt);
>> -	if (p) {
>> +	if (p)
>>   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>> -		num_pages = 1 << pt->order;
>> -	} else {
>> -		num_pages = 0;
>> -	}
>>   	up_read(&pool_shrink_rwsem);
>>   
>> -	return num_pages;
>> +	return p ? num_pages : 0;
>>   }
> 
> That change here doesn't make any sense.
> 
> Scanning a pool type for pages and not finding anything doesn't mean we have scanned for freeable pages and then not freed them.

I couldn't quite understand this sentence but let me try and explain.

I have empirically observed when looking at a different bug that the TTM 
shrinking does not work as efficiently as it could, and as efficiently 
as the shrinker core expects it to work.

Currently shrinker asks TTM to shrink SHRINK_BATCH pages.

Lets say ttm_pool_shrinks happens to try order 0 pool first so frees one 
page. It returns 1 to the shrinker core.

But because TTM shrinker does not currently update 
shrinkerctl->nr_scanned, shrinker core assumes TTM looked at full 
SHRINK_BATCH pages with every call, and adds and decrements that value 
to the counters it uses to determine when to stop trying the TTM 
shrinker and move to the next one.

Therefore the exit condition can trigger too early in relation to the 
number of shrinkable pages in TTM pools. Or it can require too many 
calls to ttm_pool_shrinker_scan. Depending on the distribution of 
freeable pages per pools.

This patch:

1. Fixes the TTM shrinker to correctly report shrinkctl->nr_scanned.

This way the break condition in shrinker core works correctly.

2. Makes TTM shrinker actually scan as much as the core requested from 
it (respecting shrinkerctl->nr_to_scan).

This avoids only scanning say one page when shrinker core asked to scan 
128. This reduces the number of calls into the TTM shrinker from the 
core to free same amount of pages.

3. Tunes the batch size away from the default 128 (SHRINK_BATCH) into a 
value based on the median size of the TTM pools.

This ensures that on average TTM shrinker tries to actually free 
_something_ more often than it does now. Otherwise it can happen to try 
a few pools (depending LRU order) and give up, while the freeable pages 
are actually in the pools not yet looked at. By tuning the batch size it 
ensures that on average more pools are looked at.

Now mind you I looked at this two months ago, which is when I first sent 
this patch out, but haven't went through this today again, it still 
makes sense to me. So I am curious why you think it totally does not. It 
looks obvious to me it is not respecting the contract with the core so I 
would be surprised if I was missing some obvious gotcha.

Regards,

Tvrtko

> 
>>   
>>   /* Return the allocation order based for a page */
>> @@ -881,10 +880,12 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>    */
>>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>>   {
>> +	unsigned long nr_scanned = 0;
>> +
>>   	ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
>>   
>>   	while (atomic_long_read(&allocated_pages) > page_pool_size)
>> -		ttm_pool_shrink();
>> +		ttm_pool_shrink(&nr_scanned);
>>   }
>>   EXPORT_SYMBOL(ttm_pool_free);
>>   
>> @@ -1132,17 +1133,21 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>   }
>>   EXPORT_SYMBOL(ttm_pool_fini);
>>   
>> -/* As long as pages are available make sure to release at least one */
>>   static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>>   					    struct shrink_control *sc)
>>   {
>> -	unsigned long num_freed = 0;
>> +	unsigned long to_scan, freed = 0;
>>   
>> -	do
>> -		num_freed += ttm_pool_shrink();
>> -	while (!num_freed && atomic_long_read(&allocated_pages));
>> +	sc->nr_scanned = 0;
>> +	to_scan = min_t(unsigned long,
>> +			sc->nr_to_scan, atomic_long_read(&allocated_pages));
>> +	while (freed < to_scan) {
>> +		freed += ttm_pool_shrink(&sc->nr_scanned);
>> +		to_scan = min_t(unsigned long,
>> +				to_scan, atomic_long_read(&allocated_pages));
>> +	}
>>   
>> -	return num_freed;
>> +	return sc->nr_scanned ? freed : SHRINK_STOP;
> 
> That again doesn't make sense. That we only find pool types which don't have pages doesn't mean we have scanned them.
> 
> As far as I can see the existing code was correct after all.
> 
>>   }
>>   
>>   /* Return the number of pages available or SHRINK_EMPTY if we have none */
>> @@ -1266,7 +1271,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>>   /* Test the shrinker functions and dump the result */
>>   static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>>   {
>> -	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
>> +	struct shrink_control sc = {
>> +		.gfp_mask = GFP_NOFS,
>> +		.nr_to_scan = 1,
>> +	};
>>   
>>   	fs_reclaim_acquire(GFP_KERNEL);
>>   	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
>> @@ -1324,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>   
>>   	mm_shrinker->count_objects = ttm_pool_shrinker_count;
>>   	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
>> +	mm_shrinker->batch = (1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS;
> 
> Since we install only one global shrinker for all pool types, which might contain everything from 1 page till 512 pages, this seems to not make sense at all either.
> 
> What exactly are you trying to do here?
> 
> Regards,
> Christian.
> 
>>   	mm_shrinker->seeks = 1;
>>   
>>   	shrinker_register(mm_shrinker);
> 

