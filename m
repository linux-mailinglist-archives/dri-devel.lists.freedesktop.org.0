Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFC4B5191
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 14:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D261810E569;
	Mon, 14 Feb 2022 13:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFE710E569
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:23:45 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p9so14522924ejd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UzBd4GW7cdoz4EHMHmo3vyxA7tsHlSzkvFvCgPHfjtg=;
 b=Wcr0eZJPtCAKVDu7uFM7zp0E5LtkdESvabOLviq4Mo0tNZtydy9YFEtePCxC0i90cs
 f3LRcxyyLMA90PcA9XHzv785z2mynbg6fKO2hNPjn/4bMFyHLOoxV+YFZV0iHsPZkNXq
 DkifX5wzaaepnCf86gtaW7kU+J8qazJ3lJ5YWa/1jzCuLrDA60Urblqt8RZYdP9Vz3sj
 g3LPwjZTiGnkIZt7SKKmoXT0E5TKKAY58uTjzPm/YcG8GL3XB+PkNxUK/UNd5zmI+B0J
 7tjQMWpnhtwi/B8WkoGv1ph/ddNv1SrQI5T/RNK74tmJ29QZw3sUtSbG05mMtWKacyyQ
 uXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UzBd4GW7cdoz4EHMHmo3vyxA7tsHlSzkvFvCgPHfjtg=;
 b=47mhZTqwnCdaPmpown+tumE+r7BYqEpucKFbc4uJqSd/LiYLcBUKRV6ranE6rD+lKt
 lqj2UnjFV/1ax+32U+DXKZOgPrf+HzshF8ICKTZYt2fatQrzQjaQBVrtyRRQeH9lVELp
 2U2wmFqXLG+8g3dzw4c1DtyD9x3ewJnnX3/we+Xj3sZNU6cFiXik3MowNdHjhqlmHNPI
 azpes8pOFxGnR1tPYfSIt3nLHBWWYeq12PV/Ax68649Rqhq3Q3bzYKMurhyIVWJzoa8C
 eYCiNBRpbGTxs/ujpvVoadacWk5ZRSnQ2aPWhnl8nXTVSHkSE2QXpuedFayRpnWeNEGf
 swxg==
X-Gm-Message-State: AOAM530xiw2aEr0bsGoUZWoePFGOvO6L1d4t/b9qsbA+36+R+FCz2j0I
 ttEGvDqeDngQJMOEs2nH3PE=
X-Google-Smtp-Source: ABdhPJx3dRGZ6tdmBkBgJgxO1P0nhradBiMuBXcsJwNOZlwnYDNJUtuGV30U4FToAPqmcpmOe9AWiw==
X-Received: by 2002:a17:906:7a5b:: with SMTP id
 i27mr4130254ejo.276.1644845024177; 
 Mon, 14 Feb 2022 05:23:44 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:2a37:737a:e023:f7be?
 ([2a02:908:1252:fb60:2a37:737a:e023:f7be])
 by smtp.gmail.com with ESMTPSA id eo7sm12470397edb.97.2022.02.14.05.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 05:23:43 -0800 (PST)
Message-ID: <331d7611-2af6-cd22-7c7e-9e7188300d78@gmail.com>
Date: Mon, 14 Feb 2022 14:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/11] drm/ttm: add common accounting to the resource mgr
 v3
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-2-christian.koenig@amd.com>
 <CAM0jSHO-h5i8yrX+eDf8P-5GL=4m-5t3ENkEb0HHjU3pU5fomw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHO-h5i8yrX+eDf8P-5GL=4m-5t3ENkEb0HHjU3pU5fomw@mail.gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.02.22 um 11:34 schrieb Matthew Auld:
> On Mon, 14 Feb 2022 at 09:34, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> It makes sense to have this in the common manager for debugging and
>> accounting of how much resources are used.
>>
>> v2: cleanup kerneldoc a bit
>> v3: drop the atomic, update counter under lock instead
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Huang Rui <ray.huang@amd.com> (v1)
>> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> ---
>>   drivers/gpu/drm/ttm/ttm_resource.c | 30 ++++++++++++++++++++++++++++++
>>   include/drm/ttm/ttm_resource.h     | 11 +++++++++--
>>   2 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index ae40e144e728..bbb8a0f7aa14 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -41,6 +41,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res)
>>   {
>> +       struct ttm_resource_manager *man;
>> +
>>          res->start = 0;
>>          res->num_pages = PFN_UP(bo->base.size);
>>          res->mem_type = place->mem_type;
>> @@ -50,6 +52,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>          res->bus.is_iomem = false;
>>          res->bus.caching = ttm_cached;
>>          res->bo = bo;
>> +
>> +       man = ttm_manager_type(bo->bdev, place->mem_type);
>> +       spin_lock(&bo->bdev->lru_lock);
>> +       man->usage += bo->base.size;
>> +       spin_unlock(&bo->bdev->lru_lock);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_init);
>>
>> @@ -65,6 +72,9 @@ EXPORT_SYMBOL(ttm_resource_init);
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>                         struct ttm_resource *res)
>>   {
>> +       spin_lock(&man->bdev->lru_lock);
>> +       man->usage -= res->bo->base.size;
>> +       spin_unlock(&man->bdev->lru_lock);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_fini);
>>
>> @@ -166,6 +176,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>          spin_lock_init(&man->move_lock);
>>          man->bdev = bdev;
>>          man->size = size;
>> +       man->usage = 0;
>>
>>          for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>                  INIT_LIST_HEAD(&man->lru[i]);
>> @@ -226,6 +237,24 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>   }
>>   EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>>
>> +/**
>> + * ttm_resource_manager_usage
>> + *
>> + * @man: A memory manager object.
>> + *
>> + * Return how many resources are currently used.
> Maybe mention the units here?
>
> "Return how many resources are currently used, in bytes."

Well exactly that's not correct. The whole idea here is that these are 
driver defined units.

E.g. for the AMDGPU OA and GWS resources it's essentially a hardware block.

Regards,
Christian.

>
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> + */
>> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
>> +{
>> +       uint64_t usage;
>> +
>> +       spin_lock(&man->bdev->lru_lock);
>> +       usage = man->usage;
>> +       spin_unlock(&man->bdev->lru_lock);
>> +       return usage;
>> +}
>> +EXPORT_SYMBOL(ttm_resource_manager_usage);
>> +
>>   /**
>>    * ttm_resource_manager_debug
>>    *
>> @@ -238,6 +267,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>>          drm_printf(p, "  use_type: %d\n", man->use_type);
>>          drm_printf(p, "  use_tt: %d\n", man->use_tt);
>>          drm_printf(p, "  size: %llu\n", man->size);
>> +       drm_printf(p, "  usage: %llu\n", ttm_resource_manager_usage(man));
>>          if (man->func->debug)
>>                  man->func->debug(man, p);
>>   }
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index 555a11fb8a7f..323c14a30c6b 100644
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
>> @@ -130,10 +131,15 @@ struct ttm_resource_manager {
>>          struct dma_fence *move;
>>
>>          /*
>> -        * Protected by the global->lru_lock.
>> +        * Protected by the bdev->lru_lock.
>>           */
>> -
>>          struct list_head lru[TTM_MAX_BO_PRIORITY];
>> +
>> +       /**
>> +        * @usage: How much of the resources are used, protected by the
>> +        * bdev->lru_lock.
>> +        */
>> +       uint64_t usage;
>>   };
>>
>>   /**
>> @@ -283,6 +289,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>   int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>                                     struct ttm_resource_manager *man);
>>
>> +uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>>   void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>>                                  struct drm_printer *p);
>>
>> --
>> 2.25.1
>>

