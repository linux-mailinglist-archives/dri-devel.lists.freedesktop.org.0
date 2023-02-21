Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461F69E44F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EE410E868;
	Tue, 21 Feb 2023 16:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405E010E32F;
 Tue, 21 Feb 2023 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676996017; x=1708532017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9ErA5NeibbBy1VenkBrKsnlZXjRiiFRc6RowtBw6qiw=;
 b=gefWmw4W5iRxiEkUkK0YDWAky0mBz2zinKLKweLievyIG9FnWu3zN8WX
 K0F3ZQU3gDJ/+dvnjXiHwXS8mE5tA6msBqFOB1waIw6k9KzYybbVumkxd
 7EAewwP6K0Wks7XhgNDJr39jM+n3p1wJtQpZoka2b0yFkEX7MpWbUaYeN
 Hil8jexeIiU4V8NWNwxTGof5tkLYWpCqDQvz4F/TdtcQUK44g2tWLS2wB
 Bl1Yp0MLVl73GFKsC9/vK/MwMeRcjvcft813QwANG+qf8G7cuZDogYGDj
 GFpZKQ2jdrDFLL79bCat/WEwX6KWWoUUB6mt+S5saUcK4SkU/nKJr1tOb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312303466"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="312303466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:13:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="845728013"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="845728013"
Received: from tcollin2-mobl.ger.corp.intel.com (HELO [10.252.18.163])
 ([10.252.18.163])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:13:35 -0800
Message-ID: <bc166bdc-6f2f-d3a8-5496-e4af6fcc51ae@intel.com>
Date: Tue, 21 Feb 2023 16:13:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] drm/gem-vram: handle NULL bo->resource in move
 callback
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
References: <20230208145319.397235-1-matthew.auld@intel.com>
 <03b9cbee-e453-255b-923c-6b116b9e2cf1@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <03b9cbee-e453-255b-923c-6b116b9e2cf1@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 11:03, Christian König wrote:
> Am 08.02.23 um 15:53 schrieb Matthew Auld:
>> The ttm BO now initially has NULL bo->resource, and leaves the driver
>> the handle that. However it looks like we forgot to handle that for
>> ttm_bo_move_memcpy() users, like with vram-gem, since it just silently
>> returns zero. This seems to then trigger warnings like:
>>
>> WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_vram_helper.c:255 
>> drm_gem_vram_offset (??:?)
>>
>> Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
>> otherwise do the multi-hop sequence to ensure can safely call into
>> ttm_bo_move_memcpy(), since it might also need to clear the memory.
>> This should give the same behaviour as before.
>>
>> While we are here let's also treat calling ttm_bo_move_memcpy() with
>> NULL bo->resource as programmer error, where expectation is that upper
>> layers should now handle it.
>>
>> Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during 
>> BO creation")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
> 
> Oh, I wasn't aware that this broke at so many places. Especially radeon 
> was tested earlier in the development of the patch set.
> 
> Thanks for looking into that, the radeon patch has my rb and the rest of 
> the series is Acked-by: Christian König <christian.koenig@amd.com>.

Should we go ahead and land this? (minus patch 3 since that is already 
fixed by vmware folks).

> 
> Regards,
> Christian.
> 
>> ---
>>   drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++++
>>   drivers/gpu/drm/ttm/ttm_bo_util.c     |  4 ++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index d40b3edb52d0..0bea3df2a16d 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -916,6 +916,17 @@ static int bo_driver_move(struct 
>> ttm_buffer_object *bo,
>>   {
>>       struct drm_gem_vram_object *gbo;
>> +    if (!bo->resource) {
>> +        if (new_mem->mem_type != TTM_PL_SYSTEM) {
>> +            hop->mem_type = TTM_PL_SYSTEM;
>> +            hop->flags = TTM_PL_FLAG_TEMPORARY;
>> +            return -EMULTIHOP;
>> +        }
>> +
>> +        ttm_bo_move_null(bo, new_mem);
>> +        return 0;
>> +    }
>> +
>>       gbo = drm_gem_vram_of_bo(bo);
>>       return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index d9d2b0903b22..fd9fd3d15101 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -157,8 +157,8 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>>       bool clear;
>>       int ret = 0;
>> -    if (!src_mem)
>> -        return 0;
>> +    if (WARN_ON(!src_mem))
>> +        return -EINVAL;
>>       src_man = ttm_manager_type(bdev, src_mem->mem_type);
>>       if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
> 
