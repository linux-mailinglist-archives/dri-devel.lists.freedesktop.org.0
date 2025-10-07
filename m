Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D94BC198D
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 15:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF59010E678;
	Tue,  7 Oct 2025 13:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kXPTj4di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7483D10E686;
 Tue,  7 Oct 2025 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K7k/W/nw9BnpuYRwkpRKAp4kP4uAjGVlXbg4Wg1Zcrs=; b=kXPTj4diebF5kwA20P9EWUdA3L
 TTdKHqOUTN+bNZUDpnY5CagT2IsXLtXUr+ID3p0w02ebqCY0xW2NtH0ZyQ0st4LVNNIniWR3oQbaU
 J7jOB1Mtcdg3Kgw//S/aqvQ6NYHO+H5kfKav84KO8AZ6UxRfabjGdLxAjU3DComO6nI8vxErR8MTi
 C8PQRBPj7mcSVfPRSI3+0KOwYiuQVnyk68WnZqLOO1sjx3SByA/s7pm1TFsw5ekK0QgLLuTbFMlgq
 0nyDViioaRYeEtkOpbjewPlPNKEt5QDY1TZF4H/E2dywWXlY6Z8vHhRXemvEyYairlkCV/2DNuYVv
 L7gac6gA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v68CV-006D8j-7i; Tue, 07 Oct 2025 15:57:59 +0200
Message-ID: <cfb8ec02-4870-469a-9d23-51e3c0f1778c@igalia.com>
Date: Tue, 7 Oct 2025 14:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/5] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-5-tvrtko.ursulin@igalia.com>
 <dddd1c34-94ba-487f-ba0b-14e10410dd12@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <dddd1c34-94ba-487f-ba0b-14e10410dd12@amd.com>
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


On 06/10/2025 10:49, Christian König wrote:
> On 03.10.25 15:58, Tvrtko Ursulin wrote:
>> GPUs typically benefit from contiguous memory via reduced TLB pressure and
>> improved caching performance, where the maximum size of contiguous block
>> which adds a performance benefit is related to hardware design.
>>
>> TTM pool allocator by default tries (hard) to allocate up to the system
>> MAX_PAGE_ORDER blocks. This varies by the CPU platform and can also be
>> configured via Kconfig.
>>
>> If that limit was set to be higher than the GPU can make an extra use of,
>> lets allow the individual drivers to let TTM know over which allocation
>> order can the pool allocator afford to make a little bit less effort with.
>>
>> We implement this by disabling direct reclaim for those allocations, which
>> reduces the allocation latency and lowers the demands on the page
>> allocator, in cases where expending this effort is not critical for the
>> GPU in question.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c |  8 ++++++++
>>   include/drm/ttm/ttm_pool.h     | 10 ++++++++--
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 0323531d216a..c0bd92259394 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -135,6 +135,7 @@ static DECLARE_RWSEM(pool_shrink_rwsem);
>>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>   					unsigned int order)
>>   {
>> +	const unsigned int beneficial_order = ttm_pool_beneficial_order(pool);
>>   	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>>   	struct ttm_pool_dma *dma;
>>   	struct page *p;
>> @@ -148,6 +149,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>   		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>>   			__GFP_THISNODE;
>>   
>> +	/*
>> +	 * Do not add latency to the allocation path for allocations orders
>> +	 * device tolds us do not bring them additional performance gains.
>> +	 */
>> +	if (beneficial_order && order > beneficial_order)
>> +		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>> +
>>   	if (!ttm_pool_uses_dma_alloc(pool)) {
>>   		p = alloc_pages_node(pool->nid, gfp_flags, order);
>>   		if (p)
>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>> index d898186765f1..b2114e2d0695 100644
>> --- a/include/drm/ttm/ttm_pool.h
>> +++ b/include/drm/ttm/ttm_pool.h
>> @@ -59,8 +59,9 @@ struct ttm_pool_type {
>>   	struct list_head pages;
>>   };
>>   
>> -#define TTM_POOL_USE_DMA_ALLOC 	BIT(0) /* Use coherent DMA allocations. */
>> -#define TTM_POOL_USE_DMA32	BIT(1) /* Use GFP_DMA32 allocations. */
>> +#define TTM_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff) /* Max order which caller can benefit from */
> 
> Looks good in general, but I'm not 100% convinced that we want to mix this value into the flags.
> 
> On the one hand it makes your live easier because you don't need to change all drivers using it, on the other hand changing all drivers using it would potentially be cleaner and document the value better.

I was not 100% convinced either but it looked a reasonable compromise.

My thinking was to not simply add an int after the existing two booleans 
but to try and clean it up at the same time. Once I replaced them with 
flags then the option were to either add a new int argument or add some 
flags like TTM_POOL_BENEFICIAL_SIZE_2M, TTM_POOL_BENEFICIAL_SIZE_64K, 
with the thinking there probably isn't a full range of page sizes. But 
then I thought why not just put the order in some bits. Advantages being 
it adds names to anonymous booleans and is extensible with no further churn.

But I don't know, I am happy to change it to something else if you are 
sure this isn't the way.

If we add a new int then it has to have some "stick with default" 
semantics. Like -1 or whatnot. With is also meh. I wouldn't do a zero 
because it feels conflated.

Regards,

Tvrtko

>> +#define TTM_POOL_USE_DMA_ALLOC 		BIT(8) /* Use coherent DMA allocations. */
>> +#define TTM_POOL_USE_DMA32		BIT(9) /* Use GFP_DMA32 allocations. */
>>   
>>   /**
>>    * struct ttm_pool - Pool for all caching and orders
>> @@ -111,4 +112,9 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
>>   	return pool->flags & TTM_POOL_USE_DMA32;
>>   }
>>   
>> +static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
>> +{
>> +	return pool->flags & 0xff;
>> +}
>> +
>>   #endif
> 

