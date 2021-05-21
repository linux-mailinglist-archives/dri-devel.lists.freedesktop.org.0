Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32038C1D5
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D686F5D0;
	Fri, 21 May 2021 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798F36E492;
 Fri, 21 May 2021 08:30:48 +0000 (UTC)
IronPort-SDR: r4qusegy3q3SvuVGz61frLe/7sb4PmZ0oBMbE2ONfK1icXRo+t2kXGlNto/gJspOncRC8hYC6n
 5PYBtalvoYTA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="198354107"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="198354107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 01:30:47 -0700
IronPort-SDR: N3cTXFI+xJrHvjGaEguUr6MDfRCetyF2aQI0uZJULsR7YxJ7deXq3eOSgIMD9eBRQ2SB6k/AOW
 OVLL5KoWs5Tg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440843215"
Received: from imarinmo-mobl1.ger.corp.intel.com (HELO [10.249.254.34])
 ([10.249.254.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 01:30:45 -0700
Subject: Re: [RFC PATCH 3/5] drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
 <20210520150947.803891-4-thomas.hellstrom@linux.intel.com>
 <f917a62f-0552-e9e2-17d3-8f16c713fa8c@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <88fbf503-c8ec-455d-c3c6-ea8598bd51a5@linux.intel.com>
Date: Fri, 21 May 2021 10:30:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f917a62f-0552-e9e2-17d3-8f16c713fa8c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/21/21 10:10 AM, Christian König wrote:
> Am 20.05.21 um 17:09 schrieb Thomas Hellström:
>> Use fast wc memcpy for reading out of wc memory for TTM bo moves.
>>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Oh, yes I really wanted to have that in TTM for quite some time.
We should use it for swap copy from WC as well IMO. A todo-task for 
somebody.
>
> But I'm wondering if we shouldn't fix the memremap stuff first.

Using memremap all over is a fairly big change probably with lots of 
opinions involved all over the place.
What I can do for now is to add a dma_buf_map interface to the memcpy 
itself, to move the aliasing out of TTM to the arch specific code that 
knows what it's doing?

/Thomas


>
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index bad9b16e96ba..919ee03f7eb3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -31,6 +31,7 @@
>>     #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>> +#include <drm/drm_memcpy.h>
>>   #include <drm/drm_vma_manager.h>
>>   #include <linux/dma-buf-map.h>
>>   #include <linux/io.h>
>> @@ -185,6 +186,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>>       struct ttm_resource *old_mem = &bo->mem;
>>       struct ttm_resource_manager *old_man = ttm_manager_type(bdev, 
>> old_mem->mem_type);
>>       struct dma_buf_map old_map, new_map;
>> +    bool wc_memcpy;
>>       pgoff_t i;
>>         /* Single TTM move. NOP */
>> @@ -208,11 +210,25 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>>           return;
>>       }
>>   +    wc_memcpy = ((!old_man->use_tt || bo->ttm->caching != 
>> ttm_cached) &&
>> +             drm_has_memcpy_from_wc());
>> +
>> +    /*
>> +     * We use some nasty aliasing for drm_memcpy_from_wc, but assuming
>> +     * that we can move to memremapping in the not too distant future,
>> +     * reduce the fragility for now with a build assert.
>> +     */
>> +    BUILD_BUG_ON(offsetof(typeof(old_map), vaddr) !=
>> +             offsetof(typeof(old_map), vaddr_iomem));
>> +
>>       for (i = 0; i < new_mem->num_pages; ++i) {
>>           new_iter->ops->kmap_local(new_iter, &new_map, i);
>>           old_iter->ops->kmap_local(old_iter, &old_map, i);
>>   -        if (!old_map.is_iomem && !new_map.is_iomem) {
>> +        if (wc_memcpy) {
>> +            drm_memcpy_from_wc(new_map.vaddr, old_map.vaddr,
>> +                       PAGE_SIZE);
>> +        } else if (!old_map.is_iomem && !new_map.is_iomem) {
>>               memcpy(new_map.vaddr, old_map.vaddr, PAGE_SIZE);
>>           } else if (!old_map.is_iomem) {
>>               dma_buf_map_memcpy_to(&new_map, old_map.vaddr,
>
