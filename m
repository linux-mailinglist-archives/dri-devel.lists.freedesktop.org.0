Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438B77DD24
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AD610E22D;
	Wed, 16 Aug 2023 09:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41410E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:20:45 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-760dff4b701so74072739f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692177644; x=1692782444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TlNpMQycLKXmojtrojHNMUrVrub9kauxQ1pbCjOut9s=;
 b=VNXSeICdJxnay4PsGgOiLN++yIhFxxLuLHu0q+42622TWavZod6E8qedqi3F5lkaok
 QQl+Ba+d5ToSjggzLp5uhu9bF83vlsVOc8ZdfnRPrVtpgjycvhO3f9cwHa0XcX0bS475
 STe7wEwNsA2V8kRa640PlOtaRzUwHEfGl3Snvh1ppLDc8ZjqeTZVuF3niDaHbkpQMyC/
 DsWptFq3lwN34gJ/o5wNa9wjabdU+bFVC1od2A1AhpJLeZUbIztDXxE8mEXBZCHfgttu
 YuSqUBddCXNtau4INR3Ak0z1mSX+8RThGC0a9bli+uH8gafP5BHSWV79QolHwtqZj8zN
 6a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692177644; x=1692782444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TlNpMQycLKXmojtrojHNMUrVrub9kauxQ1pbCjOut9s=;
 b=R/2qPjPf27IVMiJrQ/YIh0qwOU6ypHyVqEwUFqC6qAPyaNq6Ig63RYDo69XYdJ5Zp6
 EfdQXLl0rBUrgrFeuy6/lioX/HFKUAN3FTKoiKFPkuRxwjyZsUF4Fd1FWlyxndRdMLzh
 Ju91cyPNM/Czl6//bvBms7VCEA8KtLpsrHpSUadTyMueOkz4Npp/6A5MrwJWDOYJ7tQi
 Wf5ShzvXqvs3BPCCNMIl6qfw0S0VG/t29bbHFIkhA8Escpd38wRZ46mroN/SyFOOgrDh
 8cgBurYQjh7NJLj0chlylFIvhc4bZR0bjUYfo7dMDz+iCRgAGE6sC2BUxymiKeX9yd4m
 KuBA==
X-Gm-Message-State: AOJu0Yyr298QExdHmgtze4Z8s/fpS1o6axQAnfLcpAKabT5FXI86jpRg
 wENHgXAUNMoXBj9jyPQvzx1djNWwhE/B/cyuMM0=
X-Google-Smtp-Source: AGHT+IEgSkg0l4PkdpjEk3Z1pS47eJ+NP+gSmJGZ36H0C+AfOh96Ce1k2peW55SRVGXQZ+z1B6xQig==
X-Received: by 2002:a92:dc92:0:b0:345:bdc2:eb42 with SMTP id
 c18-20020a92dc92000000b00345bdc2eb42mr1672561iln.3.1692177644351; 
 Wed, 16 Aug 2023 02:20:44 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 oj3-20020a17090b4d8300b002694fee879csm12639094pjb.36.2023.08.16.02.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 02:20:43 -0700 (PDT)
Message-ID: <a0238a1b-8be8-85c7-5839-d0a9e36206b2@bytedance.com>
Date: Wed, 16 Aug 2023 17:20:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 4/5] drm/ttm: introduce pool_shrink_rwsem
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
 <20230816083419.41088-5-zhengqi.arch@bytedance.com>
 <01213258-6e27-f304-b420-f3d915e54ed1@amd.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <01213258-6e27-f304-b420-f3d915e54ed1@amd.com>
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
Cc: joel@joelfernandes.org, brauner@kernel.org, muchun.song@linux.dev,
 tytso@mit.edu, paulmck@kernel.org, senozhatsky@chromium.org, djwong@kernel.org,
 roman.gushchin@linux.dev, david@fromorbit.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, linux-mm@kvack.org,
 gregkh@linuxfoundation.org, cel@kernel.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 yujie.liu@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 2023/8/16 17:14, Christian König wrote:
> Am 16.08.23 um 10:34 schrieb Qi Zheng:
>> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
>> requires that no shrinkers run in parallel.
>>
>> After we use RCU+refcount method to implement the lockless slab shrink,
>> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
>> shrinker invocations have seen an update before freeing memory.
>>
>> So we introduce a new pool_shrink_rwsem to implement a private
>> synchronize_shrinkers(), so as to achieve the same purpose.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>>   include/linux/shrinker.h       |  1 -
>>   mm/shrinker.c                  | 15 ---------------
>>   3 files changed, 15 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index cddb9151d20f..713b1c0a70e1 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -74,6 +74,7 @@ static struct ttm_pool_type 
>> global_dma32_uncached[MAX_ORDER + 1];
>>   static spinlock_t shrinker_lock;
>>   static struct list_head shrinker_list;
>>   static struct shrinker mm_shrinker;
>> +static DECLARE_RWSEM(pool_shrink_rwsem);
>>   /* Allocate pages of size 1 << order with the given gfp_flags */
>>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t 
>> gfp_flags,
>> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>>       unsigned int num_pages;
>>       struct page *p;
>> +    down_read(&pool_shrink_rwsem);
>>       spin_lock(&shrinker_lock);
>>       pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>>       list_move_tail(&pt->shrinker_list, &shrinker_list);
>> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>>       } else {
>>           num_pages = 0;
>>       }
>> +    up_read(&pool_shrink_rwsem);
>>       return num_pages;
>>   }
>> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct 
>> device *dev,
>>   }
>>   EXPORT_SYMBOL(ttm_pool_init);
>> +/**
>> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
>> + *
>> + * This is useful to guarantee that all shrinker invocations have 
>> seen an
>> + * update, before freeing memory, similar to rcu.
>> + */
>> +static void synchronize_shrinkers(void)
> 
> Please rename that function to ttm_pool_synchronize_shrinkers().

OK, will do.

> 
> With that done feel free to add Reviewed-by: Christian König 
> <christian.koenig@amd.com>
> 

Thanks,
Qi

> Regards,
> Christian.
> 
>> +{
>> +    down_write(&pool_shrink_rwsem);
>> +    up_write(&pool_shrink_rwsem);
>> +}
>> +
>>   /**
>>    * ttm_pool_fini - Cleanup a pool
>>    *
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 8dc15aa37410..6b5843c3b827 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -103,7 +103,6 @@ extern int __printf(2, 3) register_shrinker(struct 
>> shrinker *shrinker,
>>                           const char *fmt, ...);
>>   extern void unregister_shrinker(struct shrinker *shrinker);
>>   extern void free_prealloced_shrinker(struct shrinker *shrinker);
>> -extern void synchronize_shrinkers(void);
>>   #ifdef CONFIG_SHRINKER_DEBUG
>>   extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker 
>> *shrinker,
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index 043c87ccfab4..a16cd448b924 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -692,18 +692,3 @@ void unregister_shrinker(struct shrinker *shrinker)
>>       shrinker->nr_deferred = NULL;
>>   }
>>   EXPORT_SYMBOL(unregister_shrinker);
>> -
>> -/**
>> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
>> - *
>> - * This is equivalent to calling unregister_shrink() and 
>> register_shrinker(),
>> - * but atomically and with less overhead. This is useful to guarantee 
>> that all
>> - * shrinker invocations have seen an update, before freeing memory, 
>> similar to
>> - * rcu.
>> - */
>> -void synchronize_shrinkers(void)
>> -{
>> -    down_write(&shrinker_rwsem);
>> -    up_write(&shrinker_rwsem);
>> -}
>> -EXPORT_SYMBOL(synchronize_shrinkers);
> 
