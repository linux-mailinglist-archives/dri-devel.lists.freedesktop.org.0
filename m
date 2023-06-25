Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E873CE29
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 05:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EA410E0EC;
	Sun, 25 Jun 2023 03:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E092110E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 03:15:12 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-657c4bcad0bso494633b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 20:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687662910; x=1690254910;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TKI5JnbDIC0GxIDWgHq4O/cOoJK+mFi4lHzSLMfVTqU=;
 b=ZAMx9Z9f9sidua+INHohqUOzi6qohVG8u4jVCH5kW+5KNZXm213btXme0+oY3eiFas
 kJ1eg2nzkYdYzNdOe7oa9qHmaJUnXCYxjS+yzRkh4fKBRaJsJ8sThwNTH8lHQfNkQNAM
 VzcFUF7+yXpjBTL7GbZNoITLErtoJw0Vjk1rTp/DbKRrvAbdhI1W9mMFrodUhQiTOgU4
 x87qi5B+whZkF6jL19/UUqYgrCxdv27BCv4u4d4gCY3C0TEpHKxxaHXbF0gjifwSN242
 21vqEHW8Cm8PCiF/LjQeQL8d9CMETY+gbtFossFoUbQJa5ZrwnE/J5ioBpxXDyTlqBxM
 qigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687662910; x=1690254910;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TKI5JnbDIC0GxIDWgHq4O/cOoJK+mFi4lHzSLMfVTqU=;
 b=Jo5cFYGMw+SEJj7PeHuE8tptKanvbtQXmgrp1PcU9Nhgjdpu37GuT7sTspMykf3wu2
 0AA59+p0ptSIYONW3wIjgtv/ejtPUN4HfHQBxan8coDejej944Ibt/N8YRiLtd7H5LAs
 0VjIImLSpdUUeXfHm2wQfPftgsmGcv2Xp8yzEBgN3cYgBd60rGurKkU48gnsmRLJWHSE
 htVkoPxG3paLVVLDbVNrasMOhxILgWWQpK2R2l6qyyFBCKo4uAqMXxK4kvQ31PT8xzL4
 VLnwKko6m6uWnUHDlJ0K3u5qN5cOsaR5w76l7hUeJ80lseEzbgmjOG6PryVLd05mjG2D
 ixxw==
X-Gm-Message-State: AC+VfDy+ynlOZYNaufJ4wLJBNErwS06PF+cdGuotiBBKYyQK93qSWL/Q
 kIC28r4Vv2kVBdQamgBFCjjZZA==
X-Google-Smtp-Source: ACHHUZ4cDGND46+rMO/jpoItKK6gyWoVPMpHTImOruhTgKiq3D9MdRMxw7KZsaNY9vtDgu3MtWReMw==
X-Received: by 2002:a05:6a20:8426:b0:11f:7829:6d6c with SMTP id
 c38-20020a056a20842600b0011f78296d6cmr28507253pzd.3.1687662910560; 
 Sat, 24 Jun 2023 20:15:10 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a62e409000000b0066642f95bc5sm1648412pfh.35.2023.06.24.20.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 20:15:10 -0700 (PDT)
Message-ID: <00641d5b-86a3-f5d1-02ee-13b4f815df75@bytedance.com>
Date: Sun, 25 Jun 2023 11:15:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 24/29] mm: vmscan: make global slab shrink lockless
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: Dave Chinner <david@fromorbit.com>, paulmck@kernel.org
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-25-zhengqi.arch@bytedance.com>
 <cf0d9b12-6491-bf23-b464-9d01e5781203@suse.cz>
 <ZJU708VIyJ/3StAX@dread.disaster.area>
 <a21047bb-3b87-a50a-94a7-f3fa4847bc08@bytedance.com>
 <ZJYaYv4pACmCaBoT@dread.disaster.area>
 <a7baf44a-1eb8-d4e1-d112-93cf9cdb7beb@bytedance.com>
In-Reply-To: <a7baf44a-1eb8-d4e1-d112-93cf9cdb7beb@bytedance.com>
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
Cc: djwong@kernel.org, roman.gushchin@linux.dev,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-ext4@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-nfs@vger.kernel.org, RCU <rcu@vger.kernel.org>,
 linux-bcache@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/6/24 19:08, Qi Zheng wrote:
> Hi Dave,
> 
> On 2023/6/24 06:19, Dave Chinner wrote:
>> On Fri, Jun 23, 2023 at 09:10:57PM +0800, Qi Zheng wrote:
>>> On 2023/6/23 14:29, Dave Chinner wrote:
>>>> On Thu, Jun 22, 2023 at 05:12:02PM +0200, Vlastimil Babka wrote:
>>>>> On 6/22/23 10:53, Qi Zheng wrote:
>>>> Yes, I suggested the IDR route because radix tree lookups under RCU
>>>> with reference counted objects are a known safe pattern that we can
>>>> easily confirm is correct or not.  Hence I suggested the unification
>>>> + IDR route because it makes the life of reviewers so, so much
>>>> easier...
>>>
>>> In fact, I originally planned to try the unification + IDR method you
>>> suggested at the beginning. But in the case of CONFIG_MEMCG disabled,
>>> the struct mem_cgroup is not even defined, and root_mem_cgroup and
>>> shrinker_info will not be allocated.  This required more code 
>>> changes, so
>>> I ended up keeping the shrinker_list and implementing the above pattern.
>>
>> Yes. Go back and read what I originally said needed to be done
>> first. In the case of CONFIG_MEMCG=n, a dummy root memcg still needs
>> to exist that holds all of the global shrinkers. Then shrink_slab()
>> is only ever passed a memcg that should be iterated.
>>
>> Yes, it needs changes external to the shrinker code itself to be
>> made to work. And even if memcg's are not enabled, we can still use
>> the memcg structures to ensure a common abstraction is used for the
>> shrinker tracking infrastructure....
> 
> Yeah, what I imagined before was to define a more concise struct
> mem_cgroup in the case of CONFIG_MEMCG=n, then allocate a dummy root
> memcg on system boot:
> 
> #ifdef !CONFIG_MEMCG
> 
> struct shrinker_info {
>      struct rcu_head rcu;
>      atomic_long_t *nr_deferred;
>      unsigned long *map;
>      int map_nr_max;
> };
> 
> struct mem_cgroup_per_node {
>      struct shrinker_info __rcu    *shrinker_info;
> };
> 
> struct mem_cgroup {
>      struct mem_cgroup_per_node *nodeinfo[];
> };
> 
> #endif
> 
> But I have a concern: if all global shrinkers are tracking with the
> info->map of root memcg, a shrinker->id needs to be assigned to them,
> which will cause info->map_nr_max to become larger than before, then
> making the traversal of info->map slower.

But most of the system is 'sb-xxx' shrinker instances, they all have
the SHRINKER_MEMCG_AWARE flag, so it should have little impact on the
speed of traversing info->map. ;)

> 
>>
>>> If the above pattern is not safe, I will go back to the unification +
>>> IDR method.
>>
>> And that is exactly how we got into this mess in the first place....
> 
> I only found one similar pattern in the kernel:
> 
> fs/smb/server/oplock.c:find_same_lease_key/smb_break_all_levII_oplock/lookup_lease_in_table
> 
> But IIUC, the refcount here needs to be decremented after holding
> rcu lock as I did above.
> 
> So regardless of whether we choose unification + IDR in the end, I still
> want to confirm whether the pattern I implemented above is safe. :)

Also + RCU mailing list.

> 
> Thanks,
> Qi
> 
>>
>> -Dave
