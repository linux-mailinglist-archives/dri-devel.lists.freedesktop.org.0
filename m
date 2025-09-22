Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28DB91351
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26A110E467;
	Mon, 22 Sep 2025 12:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PMTATTUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D5410E2AA;
 Mon, 22 Sep 2025 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FcDga14y/uDqUI2qhBeS4O67gmBFK77txxUz5SJ1jqs=; b=PMTATTUUoa6dxdiMTkXjF1256N
 e1MfHMT67U3KIDKfv5zotgPlwB32Gg8kk7Gk8g/Ie5sWCPJ+OCBLalFOQYqMOMsy8S2TRgK0j4x83
 i5jvDtOcya9mN+c8+NUcN3weAkPYkWMSAGyvBMCxA6GubnMtBQ2AnAT5WJeZJlG+ajhYsxFg0zGTQ
 RYAVqFT5YnktLZMe1PtDebjbRmHk+NBfVV8Diz2eK1A7xDSLfsOgVRAh2Ao80/MmrvhHro1l1+jv0
 f0ckmUb+y2NRWMGk3Ke36Ph/C7ns0SU4BI+y4iFLduTt3jJhHLaBPH+xwicmoflejD8O4TrV46Xfh
 lADguFVQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v0fzG-00FkKu-HB; Mon, 22 Sep 2025 14:49:46 +0200
Message-ID: <90e2941b-9efe-4d55-9d94-f4d111ca4679@igalia.com>
Date: Mon, 22 Sep 2025 13:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
 <20250919131127.90932-2-tvrtko.ursulin@igalia.com>
 <febddc1a-afed-4c32-912a-38f465d11ce0@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <febddc1a-afed-4c32-912a-38f465d11ce0@amd.com>
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


On 22/09/2025 10:31, Christian König wrote:
> On 19.09.25 15:11, Tvrtko Ursulin wrote:
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
>>   drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++--
>>   include/drm/ttm/ttm_pool.h     | 10 ++++++++++
>>   2 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index c5eb2e28ca9d..3bf7b6bd96a3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -726,8 +726,16 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>   
>>   	page_caching = tt->caching;
>>   	allow_pools = true;
>> -	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>> -	     alloc->remaining_pages;
>> +
>> +	order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>> +	/*
>> +	 * Do not add latency to the allocation path for allocations orders
>> +	 * device tolds us do not bring additional performance gains.
>> +	 */
>> +	if (order > pool->max_beneficial_order)
>> +		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>> +
>> +	for (; alloc->remaining_pages;
> 
> Move that into ttm_pool_alloc_page(), the other code to adjust the gfp_flags based on the order is there as well.

I can do that, no problem.

> 
>>   	     order = ttm_pool_alloc_find_order(order, alloc)) {
>>   		struct ttm_pool_type *pt;
>>   
>> @@ -745,6 +753,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>   		if (!p) {
>>   			page_caching = ttm_cached;
>>   			allow_pools = false;
>> +			if (order <= pool->max_beneficial_order)
>> +				gfp_flags |= __GFP_DIRECT_RECLAIM;
> 
> That makes this superfluous as well.
> 
>>   			p = ttm_pool_alloc_page(pool, gfp_flags, order);
>>   		}
>>   		/* If that fails, lower the order if possible and retry. */
>> @@ -1076,6 +1086,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>   	pool->nid = nid;
>>   	pool->use_dma_alloc = use_dma_alloc;
>>   	pool->use_dma32 = use_dma32;
>> +	pool->max_beneficial_order = MAX_PAGE_ORDER;
>>   
>>   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>   		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>> index 54cd34a6e4c0..24d3285c9aad 100644
>> --- a/include/drm/ttm/ttm_pool.h
>> +++ b/include/drm/ttm/ttm_pool.h
>> @@ -66,6 +66,7 @@ struct ttm_pool_type {
>>    * @nid: which numa node to use
>>    * @use_dma_alloc: if coherent DMA allocations should be used
>>    * @use_dma32: if GFP_DMA32 should be used
>> + * @max_beneficial_order: allocations above this order do not bring performance gains
>>    * @caching: pools for each caching/order
>>    */
>>   struct ttm_pool {
>> @@ -74,6 +75,7 @@ struct ttm_pool {
>>   
>>   	bool use_dma_alloc;
>>   	bool use_dma32;
>> +	unsigned int max_beneficial_order;
>>   
>>   	struct {
>>   		struct ttm_pool_type orders[NR_PAGE_ORDERS];
>> @@ -88,6 +90,14 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>   		   int nid, bool use_dma_alloc, bool use_dma32);
>>   void ttm_pool_fini(struct ttm_pool *pool);
>>   
>> +static inline unsigned int
>> +ttm_pool_set_max_beneficial_order(struct ttm_pool *pool, unsigned int order)
>> +{
>> +	pool->max_beneficial_order = min(MAX_PAGE_ORDER, order);
>> +
>> +	return pool->max_beneficial_order;
>> +}
>> +
> 
> Just make that a parameter to ttm_pool_init(), it should be static for all devices I know about anyway.

I wanted to avoid changing signature of ttm_device_init().

But if will be are churning those, should I replace the two bool 
arguments in ttm_pool_init() and ttm_device_init() with a pool init 
parameters structure so two nameless booleans in a row are avoided? I do 
not feel strongly about it either way though since there is not a huge 
number of callers.

Regards,

Tvrtko

> 
> Apart from that looks good to me,
> Christian.
> 
>>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>>   
>>   void ttm_pool_drop_backed_up(struct ttm_tt *tt);
> 

