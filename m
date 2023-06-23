Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CA73C8D9
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A6010E0DD;
	Sat, 24 Jun 2023 08:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103410E632
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:11:08 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-25edb2433b8so123014a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687525868; x=1690117868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/7x6DiXSOkypZgSRa+BISNq5WosZP8Hu0i35XNPtJQQ=;
 b=c4Lc90e3q/J/WKx3HQ+z7NN2l1qZRKlelFYboQ0nNA7dtkVHpa39U+pQO2zrVLopHR
 tQb8FdbybA7ZY5EJuz7Bj8lc58TkEH/aUZXL9aZwXUN962/6l/NewngXKCisO7gAhI9A
 6y1k+r3pXZ/9NOPCcEIwbQmxJcwu17xkFr7LC37JSENPSJtDN4GEFRuoB+dm8iAKWIp9
 DFutxWv0gIG1WvIBQtrHwdJ+U3wemUIH6AIx7XIJDjUmh1K9SXXWWzWNhP9Z793nQfgc
 /81DZq+4PM5+K/vGcsN5FzVIevuwRHMFrPp0/v2gAPq8CuK9bUHMh/q7eJ4T5hUbjVvx
 g0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687525868; x=1690117868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/7x6DiXSOkypZgSRa+BISNq5WosZP8Hu0i35XNPtJQQ=;
 b=JjMlvT/+OuSDj1HyKxz444BKeYYj0bvbrXFDL6v/rRyGrfjZ4DtJ4yffHbrlhuzYK2
 TXLVLIyxwUFDBs3wFhxO6Y2P3lXWAJRVx9KV8ryD9OfMuVi0mHp+Ag0vOSMLN6P8YJjW
 R6tuhdLc5dcjP7bbKBMB90CTkIgKIFfhYSWpcQ+Xx0necgriHKOIJj7984j3t4iy65yn
 MLVqSD/iFlfGWxdtoCiGKJobmdPuY+EwI70Kv2KnDSJVHPYttvuNfT5UWQNGsNTPVJ4w
 QIe0JGm8bN53DE/hf8vyTSTWE8vBHkUO6N9TXivb20ZjPI/744sUEKufLIitmWJBB074
 AP/w==
X-Gm-Message-State: AC+VfDwAGP8AiW1gA/koJ71uvCSKegzIOemDjWmO0zGTWwGNcskh04Qi
 0mSpaqzbOWigJl5/2fVh8CnRAQ==
X-Google-Smtp-Source: ACHHUZ64Jh43TfSAOTNgwrqo87qYAZfwOnz5bgoh5xCGMYf1cG7+iQJqF84ndnWAmMn6TwTiYqZEBw==
X-Received: by 2002:a17:90b:1bc2:b0:258:9621:913f with SMTP id
 oa2-20020a17090b1bc200b002589621913fmr25470832pjb.3.1687525867887; 
 Fri, 23 Jun 2023 06:11:07 -0700 (PDT)
Received: from [10.4.168.167] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 1-20020a17090a198100b0024e49b53c24sm1568646pji.10.2023.06.23.06.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 06:11:07 -0700 (PDT)
Message-ID: <a21047bb-3b87-a50a-94a7-f3fa4847bc08@bytedance.com>
Date: Fri, 23 Jun 2023 21:10:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 24/29] mm: vmscan: make global slab shrink lockless
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>, Vlastimil Babka <vbabka@suse.cz>,
 paulmck@kernel.org
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-25-zhengqi.arch@bytedance.com>
 <cf0d9b12-6491-bf23-b464-9d01e5781203@suse.cz>
 <ZJU708VIyJ/3StAX@dread.disaster.area>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZJU708VIyJ/3StAX@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org, brauner@kernel.org,
 tytso@mit.edu, djwong@kernel.org, intel-gfx@lists.freedesktop.org,
 roman.gushchin@linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-arm-msm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/6/23 14:29, Dave Chinner wrote:
> On Thu, Jun 22, 2023 at 05:12:02PM +0200, Vlastimil Babka wrote:
>> On 6/22/23 10:53, Qi Zheng wrote:
>>> @@ -1067,33 +1068,27 @@ static unsigned long shrink_slab(gfp_t gfp_mask, int nid,
>>>   	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>>>   		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>>>   
>>> -	if (!down_read_trylock(&shrinker_rwsem))
>>> -		goto out;
>>> -
>>> -	list_for_each_entry(shrinker, &shrinker_list, list) {
>>> +	rcu_read_lock();
>>> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>>>   		struct shrink_control sc = {
>>>   			.gfp_mask = gfp_mask,
>>>   			.nid = nid,
>>>   			.memcg = memcg,
>>>   		};
>>>   
>>> +		if (!shrinker_try_get(shrinker))
>>> +			continue;
>>> +		rcu_read_unlock();
>>
>> I don't think you can do this unlock?
>>
>>> +
>>>   		ret = do_shrink_slab(&sc, shrinker, priority);
>>>   		if (ret == SHRINK_EMPTY)
>>>   			ret = 0;
>>>   		freed += ret;
>>> -		/*
>>> -		 * Bail out if someone want to register a new shrinker to
>>> -		 * prevent the registration from being stalled for long periods
>>> -		 * by parallel ongoing shrinking.
>>> -		 */
>>> -		if (rwsem_is_contended(&shrinker_rwsem)) {
>>> -			freed = freed ? : 1;
>>> -			break;
>>> -		}
>>> -	}
>>>   
>>> -	up_read(&shrinker_rwsem);
>>> -out:
>>> +		rcu_read_lock();
>>
>> That new rcu_read_lock() won't help AFAIK, the whole
>> list_for_each_entry_rcu() needs to be under the single rcu_read_lock() to be
>> safe.
> 
> Yeah, that's the pattern we've been taught and the one we can look
> at and immediately say "this is safe".
> 
> This is a different pattern, as has been explained bi Qi, and I
> think it *might* be safe.
> 
> *However.*
> 
> Right now I don't have time to go through a novel RCU list iteration
> pattern it one step at to determine the correctness of the
> algorithm. I'm mostly worried about list manipulations that can
> occur outside rcu_read_lock() section bleeding into the RCU
> critical section because rcu_read_lock() by itself is not a memory
> barrier.
> 
> Maybe Paul has seen this pattern often enough he could simply tell
> us what conditions it is safe in. But for me to work that out from
> first principles? I just don't have the time to do that right now.

Hi Paul, can you help to confirm this?

> 
>> IIUC this is why Dave in [4] suggests unifying shrink_slab() with
>> shrink_slab_memcg(), as the latter doesn't iterate the list but uses IDR.
> 
> Yes, I suggested the IDR route because radix tree lookups under RCU
> with reference counted objects are a known safe pattern that we can
> easily confirm is correct or not.  Hence I suggested the unification
> + IDR route because it makes the life of reviewers so, so much
> easier...

In fact, I originally planned to try the unification + IDR method you
suggested at the beginning. But in the case of CONFIG_MEMCG disabled,
the struct mem_cgroup is not even defined, and root_mem_cgroup and
shrinker_info will not be allocated. This required more code changes, so
I ended up keeping the shrinker_list and implementing the above pattern.

If the above pattern is not safe, I will go back to the unification +
IDR method.

Thanks,
Qi

> 
> Cheers,
> 
> Dave.
