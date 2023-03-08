Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321D6B02BB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5F510E0FB;
	Wed,  8 Mar 2023 09:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC6210E0FB;
 Wed,  8 Mar 2023 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678267354; x=1709803354;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9izBVTVBjpPieuMOYSLXXB/j5rqpaahDJT/7Blx9C4M=;
 b=aGCNflKgtZDg3PmgPRdx+Gi+0p3EfSDHj2wh/HwpNdBOqbSFnT5Go3rn
 1Yyv6VSFwnoc2cmG1tr03QfIB1zyAWNng1SJliCPtsD+EBGeuFaUrixKj
 DHQYIConxrxM/nZiJ8K4ItYt3oKlW89Lxed3haYRJgvLXh9F658KVIvBP
 LT2z8/kJ2JiC/FMnvDyyGdQTvtivhwWI3zWbH/KnqJ/JEKCB/TaYlO+SW
 cJ0vFqSIJ2HcnvZj1cPz98eKtRDE/ML/nXCc3UaCg8+/Dq2Rzyso2PCWe
 SddCnBM4y6w7cBviOG6/vM4p3BedVwz5LEWRlLrF7LYVQF4lSnEZETtYH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="316507911"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="316507911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654283802"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="654283802"
Received: from qingruih-mobl.ccr.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:22:32 -0800
Message-ID: <e9406a98-7bc1-790f-8aeb-4a0f70e701cc@linux.intel.com>
Date: Wed, 8 Mar 2023 10:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/7] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-7-thomas.hellstrom@linux.intel.com>
 <151b48d3-3ca4-292a-547b-628eb362c2ae@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <151b48d3-3ca4-292a-547b-628eb362c2ae@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/23 10:15, Christian König wrote:
> Am 07.03.23 um 15:46 schrieb Thomas Hellström:
>> When swapping out, we will split multi-order pages both in order to
>> move them to the swap-cache and to be able to return memory to the
>> swap cache as soon as possible on a page-by-page basis.
>> Reduce the page max order to the system PMD size, as we can then be 
>> nicer
>> to the system and avoid splitting gigantic pages.
>
> Mhm, we actually have a todo to start supporting giant pages at some 
> time.
>
> Using the folio directly just saves tons of overhead when you don't 
> need to allocate 2MiG page array any more for each 1GiB you allocate.
>
> But that probably needs tons of work anyway, so feel free to add my rb 
> for now.

Thanks, I need to fix this anyway for powerpc where it seems PMD_ORDER > 
MAX_ORDER :/

It might be we'd want to replace the ttm page arrays with scatter-gather 
tables at some point?
I think at least vmwgfx, i915 and xe would benefit from that...

/Thomas

>
> Regards,
> Christian.
>
>>
>> Looking forward to when we might be able to swap out PMD size folios
>> without splitting, this will also be a benefit.
>>
>> v2:
>> - Include all orders up to the PMD size (Christian König)
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 27 ++++++++++++++++-----------
>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 0b6e20613d19..939845d853af 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -47,6 +47,9 @@
>>     #include "ttm_module.h"
>>   +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>> +#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>> +
>>   /**
>>    * struct ttm_pool_dma - Helper object for coherent DMA mappings
>>    *
>> @@ -65,11 +68,11 @@ module_param(page_pool_size, ulong, 0644);
>>     static atomic_long_t allocated_pages;
>>   -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>   -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>>     static spinlock_t shrinker_lock;
>>   static struct list_head shrinker_list;
>> @@ -431,7 +434,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct 
>> ttm_tt *tt,
>>       else
>>           gfp_flags |= GFP_HIGHUSER;
>>   -    for (order = min_t(unsigned int, MAX_ORDER - 1, 
>> __fls(num_pages));
>> +    for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
>>            num_pages;
>>            order = min_t(unsigned int, order, __fls(num_pages))) {
>>           struct ttm_pool_type *pt;
>> @@ -550,7 +553,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct 
>> device *dev,
>>         if (use_dma_alloc) {
>>           for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> -            for (j = 0; j < MAX_ORDER; ++j)
>> +            for (j = 0; j < TTM_DIM_ORDER; ++j)
>> ttm_pool_type_init(&pool->caching[i].orders[j],
>>                              pool, i, j);
>>       }
>> @@ -570,7 +573,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>         if (pool->use_dma_alloc) {
>>           for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> -            for (j = 0; j < MAX_ORDER; ++j)
>> +            for (j = 0; j < TTM_DIM_ORDER; ++j)
>> ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>       }
>>   @@ -624,7 +627,7 @@ static void ttm_pool_debugfs_header(struct 
>> seq_file *m)
>>       unsigned int i;
>>         seq_puts(m, "\t ");
>> -    for (i = 0; i < MAX_ORDER; ++i)
>> +    for (i = 0; i < TTM_DIM_ORDER; ++i)
>>           seq_printf(m, " ---%2u---", i);
>>       seq_puts(m, "\n");
>>   }
>> @@ -635,7 +638,7 @@ static void ttm_pool_debugfs_orders(struct 
>> ttm_pool_type *pt,
>>   {
>>       unsigned int i;
>>   -    for (i = 0; i < MAX_ORDER; ++i)
>> +    for (i = 0; i < TTM_DIM_ORDER; ++i)
>>           seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>>       seq_puts(m, "\n");
>>   }
>> @@ -738,13 +741,15 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>   {
>>       unsigned int i;
>>   +    BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
>> +
>>       if (!page_pool_size)
>>           page_pool_size = num_pages;
>>         spin_lock_init(&shrinker_lock);
>>       INIT_LIST_HEAD(&shrinker_list);
>>   -    for (i = 0; i < MAX_ORDER; ++i) {
>> +    for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>           ttm_pool_type_init(&global_write_combined[i], NULL,
>>                      ttm_write_combined, i);
>>           ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, 
>> i);
>> @@ -777,7 +782,7 @@ void ttm_pool_mgr_fini(void)
>>   {
>>       unsigned int i;
>>   -    for (i = 0; i < MAX_ORDER; ++i) {
>> +    for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>           ttm_pool_type_fini(&global_write_combined[i]);
>>           ttm_pool_type_fini(&global_uncached[i]);
>
