Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE603FC7AE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4E896A5;
	Tue, 31 Aug 2021 12:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A1896A5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:57:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so2478790wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=W8rndnjSShIHnb9dOQh9Iuc319AK6ZOXUUhl63lhKp0=;
 b=cEB4iqdB0vrd71y7jc6v+xVzOtjSdrXKsIUfuqJQMxhjNsJGWsShvE9CezZfro9XQr
 JoyEhkk7wzjdmR6K5FcT7Ok1FADkmKumhjbhwuWblaoUWePvZeIacGbknNhHFFtFg6jZ
 XOaLBVabK/cit7Y9b+0ckvHkSJ4E6vYTBIKuMkBz9knm/1ed+uG9MNkGwswqhteDSxUB
 fg2j2llArpvPRIMWg4qNWH+V6DNYdY21ulCKQ7aMEoG1dgS6TGoeWU24EtqJTRLCZ/e1
 pq016BijSWIKYlxUXbzaVVUr6iWOWVcCMko3vnjXj9iEwPyyBiRPXIePDNXPmNxSNWrN
 I6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W8rndnjSShIHnb9dOQh9Iuc319AK6ZOXUUhl63lhKp0=;
 b=jzIJagJ+8Pl+c6tcuyw+hQXtNljkuUNbCp9lDf/AjeURsXstwSvkhaimMVfr2REuM7
 /pBvwcqDDNegeA0iommpH2y1T2tna8GqjupRiVvCmam3l1qv3LreWHTejLedYHk/ciUk
 /tthadPSldGezvsGiK2YJd75cA02/yNiqk9t7vwlFAxA4jpuc3Jh3gLpYLR+q06bzjCo
 ouT+pXn96NowJy2vs6pyNohsHB5yE+Uof65mkghULl9KM95baOfMRZwiZ+kYuQ1Rcuno
 w2vCriEdL0+0IPCi05PlHELQ+Jvhxl0AtNNh/LinVhpQtiSr9CoWftOIj+RAPOBDtQAv
 KZdg==
X-Gm-Message-State: AOAM53276HAytWc8XPVfH2M1IKg9hCplQOAZeP/dsCBRvxc32n4XcO6Q
 T4J3oO+pO1NXY7LG2cJ+vsU4lQkOgnPakLgO
X-Google-Smtp-Source: ABdhPJwr2Rxp6REx7pP6t+baqT5c+w5HU+Zc7Pn92CZGAP7SuU/Tt5iOEeDUM3DjrA5OSddqFWAtxA==
X-Received: by 2002:a1c:1b53:: with SMTP id b80mr4171362wmb.133.1630414627408; 
 Tue, 31 Aug 2021 05:57:07 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id r26sm2522630wmh.27.2021.08.31.05.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 05:57:06 -0700 (PDT)
Subject: Re: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
To: Daniel Vetter <daniel@ffwll.ch>
Cc: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
References: <20210830085707.209508-1-christian.koenig@amd.com>
 <20210830085707.209508-4-christian.koenig@amd.com>
 <YS4mCPDUQSE1PK0t@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <116910d5-7238-316d-bb5a-c28337201449@gmail.com>
Date: Tue, 31 Aug 2021 14:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS4mCPDUQSE1PK0t@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.21 um 14:52 schrieb Daniel Vetter:
> On Mon, Aug 30, 2021 at 10:56:59AM +0200, Christian König wrote:
>> It makes sense to have this in the common manager for debugging and
>> accounting of how much resources are used.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
>>   include/drm/ttm/ttm_resource.h     | 18 ++++++++++++++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index a4c495da0040..426e6841fc89 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -33,6 +33,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res)
>>   {
>> +	struct ttm_resource_manager *man;
>> +
>>   	res->start = 0;
>>   	res->num_pages = PFN_UP(bo->base.size);
>>   	res->mem_type = place->mem_type;
>> @@ -42,12 +44,16 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>   	res->bus.is_iomem = false;
>>   	res->bus.caching = ttm_cached;
>>   	res->bo = bo;
>> +
>> +	man = ttm_manager_type(bo->bdev, place->mem_type);
>> +	atomic64_add(bo->base.size, &man->usage);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_init);
>>   
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>   		       struct ttm_resource *res)
>>   {
>> +	atomic64_sub(res->bo->base.size, &man->usage);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_fini);
>>   
>> @@ -100,6 +106,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>   	spin_lock_init(&man->move_lock);
>>   	man->bdev = bdev;
>>   	man->size = p_size;
>> +	atomic64_set(&man->usage, 0);
>>   
>>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>   		INIT_LIST_HEAD(&man->lru[i]);
>> @@ -172,6 +179,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>>   	drm_printf(p, "  use_type: %d\n", man->use_type);
>>   	drm_printf(p, "  use_tt: %d\n", man->use_tt);
>>   	drm_printf(p, "  size: %llu\n", man->size);
>> +	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
>>   	if (man->func->debug)
>>   		man->func->debug(man, p);
>>   }
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index e8080192cae4..526fe359c603 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -27,6 +27,7 @@
>>   
>>   #include <linux/types.h>
>>   #include <linux/mutex.h>
>> +#include <linux/atomic.h>
>>   #include <linux/dma-buf-map.h>
>>   #include <linux/dma-fence.h>
>>   #include <drm/drm_print.h>
>> @@ -110,6 +111,7 @@ struct ttm_resource_manager_func {
>>    * static information. bdev::driver::io_mem_free is never used.
>>    * @lru: The lru list for this memory type.
>>    * @move: The fence of the last pipelined move operation.
>> + * @usage: How much of the region is used.
>>    *
>>    * This structure is used to identify and manage memory types for a device.
>>    */
>> @@ -134,6 +136,9 @@ struct ttm_resource_manager {
>>   	 * Protected by @move_lock.
>>   	 */
>>   	struct dma_fence *move;
>> +
>> +	/* Own protection */
>> +	atomic64_t usage;
> Shouldn't we keep track of this together with the lru updates, under the
> same spinlock?

Mhm, what should that be good for? As far as I know we use it for two 
use cases:
1. Early abort when size-usage < requested.
2. Statistics for debugging.

Especially the first use case is rather important under memory pressure 
to avoid costly acquiring of a contended lock.

> Otherwise this usage here just becomes kinda meaningless I think, and just
> for some debugging. I really don't like sprinkling random atomic_t around
> (mostly because i915-gem code has gone totally overboard with them, with
> complete disregard to complexity of the result).

Well this here just replaces what drivers did anyway and the cost of 
inc/dec an atomic is pretty much negligible.

Christian.

> -Daniel
>
>>   };
>>   
>>   /**
>> @@ -260,6 +265,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>>   	man->move = NULL;
>>   }
>>   
>> +/**
>> + * ttm_resource_manager_usage
>> + *
>> + * @man: A memory manager object.
>> + *
>> + * Return how many resources are currently used.
>> + */
>> +static inline uint64_t
>> +ttm_resource_manager_usage(struct ttm_resource_manager *man)
>> +{
>> +	return atomic64_read(&man->usage);
>> +}
>> +
>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res);
>> -- 
>> 2.25.1
>>

