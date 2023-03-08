Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C166B0227
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7681F10E5B7;
	Wed,  8 Mar 2023 08:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2008010E5B7;
 Wed,  8 Mar 2023 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678265904; x=1709801904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HRyzlSmBYK/udT5C1HrII5pojG0BOEHOJS8vcuRwQC4=;
 b=C0IJfr12iSOhErF5JnGPt9hgg+yfLInCxpwgm5TaWmiDTjlMPU/eayid
 MtMxCLnZ4kYrhbbNN+19FZKu9OL42NtcFBlQdzoVeDjfQBLCvjy8N0+iu
 trf30MMzclhqHyqieaN4aqRgS6WKHLYP3ujEYLKIvtPAUfbFU11H2iCm6
 eu8cwrAlkyDzrIiEoPwijXWu1Hun7gFp8B3H5+KUXBIcH/sSxon4Fvdt+
 j3HVtGHTNQURenrNdyYb7KLQYmLGCfUlnJ5BgTA/mbtQ/fHz+mg1SXZJq
 MpQTLr5lRxr5b9CX4McR2iewl9zrtS3MjUbHEiHZjG9uMi44pHlgXUY7X g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400930999"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="400930999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 00:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006251089"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="1006251089"
Received: from qingruih-mobl.ccr.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 00:58:13 -0800
Message-ID: <679bfb0d-d886-ec42-ae3f-1c5def21b0cb@linux.intel.com>
Date: Wed, 8 Mar 2023 09:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/7] drm/ttm/pool: Fix ttm_pool_alloc error path
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-3-thomas.hellstrom@linux.intel.com>
 <49aa2475-cce5-d6ec-8ad8-4744542c56df@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <49aa2475-cce5-d6ec-8ad8-4744542c56df@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/23 09:48, Christian König wrote:
> Am 07.03.23 um 15:46 schrieb Thomas Hellström:
>> When hitting an error, the error path forgot to unmap dma mappings and
>> could call set_pages_wb() on already uncached pages.
>>
>> Fix this by introducing a common __ttm_pool_free() function that
>> does the right thing.
>>
>> v2:
>> - Simplify __ttm_pool_free() (Christian König)
>>
>> Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 68 +++++++++++++++++++---------------
>>   1 file changed, 38 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index aa116a7bbae3..0b6e20613d19 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -367,6 +367,30 @@ static int ttm_pool_page_allocated(struct 
>> ttm_pool *pool, unsigned int order,
>>       return 0;
>>   }
>>   +static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt,
>
> Maybe name that ttm_pool_free_range() and add a comment why we need 
> it. Something like "/* Cleanup all pages in the tt between start_page 
> till end_page */".

Sure, will do.

/Thomas

>
> Apart from that looks good to me.
>
> Regards,
> Christian.
>
>> +                enum ttm_caching caching,
>> +                pgoff_t start_page, pgoff_t end_page)
>> +{
>> +    struct page **pages = tt->pages;
>> +    unsigned int order;
>> +    pgoff_t i, nr;
>> +
>> +    for (i = start_page; i < end_page; i += nr, pages += nr) {
>> +        struct ttm_pool_type *pt = NULL;
>> +
>> +        order = ttm_pool_page_order(pool, *pages);
>> +        nr = (1UL << order);
>> +        if (tt->dma_address)
>> +            ttm_pool_unmap(pool, tt->dma_address[i], nr);
>> +
>> +        pt = ttm_pool_select_type(pool, caching, order);
>> +        if (pt)
>> +            ttm_pool_type_give(pt, *pages);
>> +        else
>> +            ttm_pool_free_page(pool, caching, order, *pages);
>> +    }
>> +}
>> +
>>   /**
>>    * ttm_pool_alloc - Fill a ttm_tt object
>>    *
>> @@ -382,12 +406,14 @@ static int ttm_pool_page_allocated(struct 
>> ttm_pool *pool, unsigned int order,
>>   int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>              struct ttm_operation_ctx *ctx)
>>   {
>> -    unsigned long num_pages = tt->num_pages;
>> +    pgoff_t num_pages = tt->num_pages;
>>       dma_addr_t *dma_addr = tt->dma_address;
>>       struct page **caching = tt->pages;
>>       struct page **pages = tt->pages;
>> +    enum ttm_caching page_caching;
>>       gfp_t gfp_flags = GFP_USER;
>> -    unsigned int i, order;
>> +    pgoff_t caching_divide;
>> +    unsigned int order;
>>       struct page *p;
>>       int r;
>>   @@ -410,6 +436,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>> struct ttm_tt *tt,
>>            order = min_t(unsigned int, order, __fls(num_pages))) {
>>           struct ttm_pool_type *pt;
>>   +        page_caching = tt->caching;
>>           pt = ttm_pool_select_type(pool, tt->caching, order);
>>           p = pt ? ttm_pool_type_take(pt) : NULL;
>>           if (p) {
>> @@ -418,6 +445,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct 
>> ttm_tt *tt,
>>               if (r)
>>                   goto error_free_page;
>>   +            caching = pages;
>>               do {
>>                   r = ttm_pool_page_allocated(pool, order, p,
>>                                   &dma_addr,
>> @@ -426,14 +454,15 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>> struct ttm_tt *tt,
>>                   if (r)
>>                       goto error_free_page;
>>   +                caching = pages;
>>                   if (num_pages < (1 << order))
>>                       break;
>>                     p = ttm_pool_type_take(pt);
>>               } while (p);
>> -            caching = pages;
>>           }
>>   +        page_caching = ttm_cached;
>>           while (num_pages >= (1 << order) &&
>>                  (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
>>   @@ -442,6 +471,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>> struct ttm_tt *tt,
>>                                  tt->caching);
>>                   if (r)
>>                       goto error_free_page;
>> +                caching = pages;
>>               }
>>               r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
>>                               &num_pages, &pages);
>> @@ -468,15 +498,13 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>> struct ttm_tt *tt,
>>       return 0;
>>     error_free_page:
>> -    ttm_pool_free_page(pool, tt->caching, order, p);
>> +    ttm_pool_free_page(pool, page_caching, order, p);
>>     error_free_all:
>>       num_pages = tt->num_pages - num_pages;
>> -    for (i = 0; i < num_pages; ) {
>> -        order = ttm_pool_page_order(pool, tt->pages[i]);
>> -        ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
>> -        i += 1 << order;
>> -    }
>> +    caching_divide = caching - tt->pages;
>> +    __ttm_pool_free(pool, tt, tt->caching, 0, caching_divide);
>> +    __ttm_pool_free(pool, tt, ttm_cached, caching_divide, num_pages);
>>         return r;
>>   }
>> @@ -492,27 +520,7 @@ EXPORT_SYMBOL(ttm_pool_alloc);
>>    */
>>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>>   {
>> -    unsigned int i;
>> -
>> -    for (i = 0; i < tt->num_pages; ) {
>> -        struct page *p = tt->pages[i];
>> -        unsigned int order, num_pages;
>> -        struct ttm_pool_type *pt;
>> -
>> -        order = ttm_pool_page_order(pool, p);
>> -        num_pages = 1ULL << order;
>> -        if (tt->dma_address)
>> -            ttm_pool_unmap(pool, tt->dma_address[i], num_pages);
>> -
>> -        pt = ttm_pool_select_type(pool, tt->caching, order);
>> -        if (pt)
>> -            ttm_pool_type_give(pt, tt->pages[i]);
>> -        else
>> -            ttm_pool_free_page(pool, tt->caching, order,
>> -                       tt->pages[i]);
>> -
>> -        i += num_pages;
>> -    }
>> +    __ttm_pool_free(pool, tt, tt->caching, 0, tt->num_pages);
>>         while (atomic_long_read(&allocated_pages) > page_pool_size)
>>           ttm_pool_shrink();
>
