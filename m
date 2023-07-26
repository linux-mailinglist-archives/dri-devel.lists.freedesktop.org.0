Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8D7631F2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4A10E440;
	Wed, 26 Jul 2023 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6B110E440
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:28:01 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6864c144897so1488710b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363681; x=1690968481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
 b=VrX61tolI6lx5cf13TzjBUi7Jr7lyRI0PErux25Ugwzya6Gr7la8Z5mF2+cskv3TWz
 UBVd0Z5Poj3PRTux8odPv45l8gQzAXnTFOr3Tf8UDx7d9uUEKzN37AEVIKYy6agrhmgA
 YruSiWL83SB/lZ95d/ocS5Ez1ClN1w8sLcjpu26a2KNj8aWhEC89NaIXAD4IQeJcJzfH
 uYL7oLGt6F17I0XKTtTRSbeLX7ktBDSzYJstMwVG/599hz7kBf24kzbOMqBXrGbap2ZR
 iYE22Dihl4RYEd6b6MxzHd9sXrRhtrB75dhklT8m88pkRrstmkcW4eCpJX3cURQ8vJOi
 rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363681; x=1690968481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
 b=T0VmQadusw+ZTsE+WHvpTcZEGsQCctyAXOA5cwSlxizGvpAE3J8efkXVxAYpFn4IVi
 eoPsDxIqkM4lmxFyBkdkevQhBlB3ALvP9WUE30Bqi3dRgti+uat/gBTg/jfWH5k9xbM9
 W7haV3WDmFwgCr04TsTFF45VOVx+L9PLaz3zwk6I58gmQFnvjNygY78JCERt+FJzRUyC
 t+9lNrP7i1Uyt/Pe5mK6xj9SvV5NpUi7B6/aTu6L/NDL3XhdZtTdW9f9m2yw7cXMn8m3
 KqlcuCq7nPVQFNGT/CVeNeXcKZzh3oi7plUbCo9P65PXvywllz4jE9IfGHL7fXOA2bzk
 sJKw==
X-Gm-Message-State: ABy/qLYAtS8t4cYePx1Dver/wfrO6Qa4ArrRJmTVWkMT4IM4ZJLOFQ29
 Ms4RBJAsRmWFpv77H4sjtxyLMg==
X-Google-Smtp-Source: APBJJlFbGXVT1jvZWB8OqMMjwV1wWa8tPHrXXzsgQ/SF73jQ8jhDFJz/C4eSTJgkpJW81UF91auuJQ==
X-Received: by 2002:a05:6a20:3c90:b0:134:d4d3:f0a5 with SMTP id
 b16-20020a056a203c9000b00134d4d3f0a5mr1941746pzj.2.1690363681365; 
 Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 l73-20020a633e4c000000b00563da87a52dsm1901427pga.40.2023.07.26.02.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Message-ID: <665ccd89-8434-fc45-4813-c6412ef80c10@bytedance.com>
Date: Wed, 26 Jul 2023 17:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/47] mm: thp: dynamically allocate the thp-related
 shrinkers
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-20-zhengqi.arch@bytedance.com>
 <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/26 15:10, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
>> shrinkers.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 45 insertions(+), 24 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8c94b34024a2..4db5a1834d81 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags 
>> __read_mostly =
>>       (1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
>>       (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
>> -static struct shrinker deferred_split_shrinker;
>> +static struct shrinker *deferred_split_shrinker;
>> +static unsigned long deferred_split_count(struct shrinker *shrink,
>> +                      struct shrink_control *sc);
>> +static unsigned long deferred_split_scan(struct shrinker *shrink,
>> +                     struct shrink_control *sc);
>>   static atomic_t huge_zero_refcount;
>>   struct page *huge_zero_page __read_mostly;
>> @@ -229,11 +233,7 @@ static unsigned long 
>> shrink_huge_zero_page_scan(struct shrinker *shrink,
>>       return 0;
>>   }
>> -static struct shrinker huge_zero_page_shrinker = {
>> -    .count_objects = shrink_huge_zero_page_count,
>> -    .scan_objects = shrink_huge_zero_page_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -};
>> +static struct shrinker *huge_zero_page_shrinker;
> 
> Same as patch #17.

OK, will do.

> 
>>   #ifdef CONFIG_SYSFS
>>   static ssize_t enabled_show(struct kobject *kobj,
>> @@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct 
>> kobject *hugepage_kobj)
>>   }
>>   #endif /* CONFIG_SYSFS */
>> +static int thp_shrinker_init(void)
> 
> Better to declare it as __init.

Will do.

> 
>> +{
>> +    huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
>> +    if (!huge_zero_page_shrinker)
>> +        return -ENOMEM;
>> +
>> +    deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
>> +                         SHRINKER_MEMCG_AWARE |
>> +                         SHRINKER_NONSLAB,
>> +                         "thp-deferred_split");
>> +    if (!deferred_split_shrinker) {
>> +        shrinker_free_non_registered(huge_zero_page_shrinker);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    huge_zero_page_shrinker->count_objects = 
>> shrink_huge_zero_page_count;
>> +    huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
>> +    huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
>> +    shrinker_register(huge_zero_page_shrinker);
>> +
>> +    deferred_split_shrinker->count_objects = deferred_split_count;
>> +    deferred_split_shrinker->scan_objects = deferred_split_scan;
>> +    deferred_split_shrinker->seeks = DEFAULT_SEEKS;
>> +    shrinker_register(deferred_split_shrinker);
>> +
>> +    return 0;
>> +}
>> +
>> +static void thp_shrinker_exit(void)
> 
> Same as here.

Will do.

> 
>> +{
>> +    shrinker_unregister(huge_zero_page_shrinker);
>> +    shrinker_unregister(deferred_split_shrinker);
>> +}
>> +
>>   static int __init hugepage_init(void)
>>   {
>>       int err;
>> @@ -482,12 +516,9 @@ static int __init hugepage_init(void)
>>       if (err)
>>           goto err_slab;
>> -    err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
>> -    if (err)
>> -        goto err_hzp_shrinker;
>> -    err = register_shrinker(&deferred_split_shrinker, 
>> "thp-deferred_split");
>> +    err = thp_shrinker_init();
>>       if (err)
>> -        goto err_split_shrinker;
>> +        goto err_shrinker;
>>       /*
>>        * By default disable transparent hugepages on smaller systems,
>> @@ -505,10 +536,8 @@ static int __init hugepage_init(void)
>>       return 0;
>>   err_khugepaged:
>> -    unregister_shrinker(&deferred_split_shrinker);
>> -err_split_shrinker:
>> -    unregister_shrinker(&huge_zero_page_shrinker);
>> -err_hzp_shrinker:
>> +    thp_shrinker_exit();
>> +err_shrinker:
>>       khugepaged_destroy();
>>   err_slab:
>>       hugepage_exit_sysfs(hugepage_kobj);
>> @@ -2851,7 +2880,7 @@ void deferred_split_folio(struct folio *folio)
>>   #ifdef CONFIG_MEMCG
>>           if (memcg)
>>               set_shrinker_bit(memcg, folio_nid(folio),
>> -                     deferred_split_shrinker.id);
>> +                     deferred_split_shrinker->id);
>>   #endif
>>       }
>>       spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
>> @@ -2925,14 +2954,6 @@ static unsigned long deferred_split_scan(struct 
>> shrinker *shrink,
>>       return split;
>>   }
>> -static struct shrinker deferred_split_shrinker = {
>> -    .count_objects = deferred_split_count,
>> -    .scan_objects = deferred_split_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -    .flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
>> -         SHRINKER_NONSLAB,
>> -};
>> -
>>   #ifdef CONFIG_DEBUG_FS
>>   static void split_huge_pages_all(void)
>>   {
> 
