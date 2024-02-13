Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD88534C1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A96D10E81A;
	Tue, 13 Feb 2024 15:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QldjDpf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034810E7EB;
 Tue, 13 Feb 2024 15:35:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d109e7bed2so8175111fa.2; 
 Tue, 13 Feb 2024 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707838524; x=1708443324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O1kz5DGbqTH9A2IWxqH4E6eYG72D3hybYjxCB2L0PdQ=;
 b=QldjDpf7D6tXL9bn2qGHGfNFV6iRbypRtLKOJ+CAVBwqY9BDcPnqMQt/G6P+hj2LjR
 oD2BwtWjKM0f96ajjn22AQAU4B6IOFrmZd4AI/tqrdKug+9dRCbfIM8ccOuPGhhq6Ify
 ZNzp4tKPnB1xHpObRfuan6ELT+c0sKmh+Vi+ukfdgM1ampw4wLflZtz4RT+9GZSf/wEZ
 E0XzGBt3UhoauetrbvkC/bjaY/rMwhBQoaMFHpM8S48gfD+3HMvMeR5Aeh7z0cBITrkC
 oR+6CtJtgmMmXTppV7/fADyzNlOpBfC3Q6NrPhbOU7v+pzeGFUmW1Ygi3CPORKlDvwuV
 ME8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707838524; x=1708443324;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O1kz5DGbqTH9A2IWxqH4E6eYG72D3hybYjxCB2L0PdQ=;
 b=dT8F0LmNbEgy5+5dEa2kxCKSgW1A8/LsDfrrFl/6ASw6iVJdRh2g3n7JfgvsksvQeu
 E1s/YE226rX1LjhHIRFWDv1YlOWMWhrKzwv//J5PlecodMpGjhLbo2Uxuumv1OXNJCw2
 WSQc92yqWsrj6RSpTKkqStTrL3NkX0qjh6kSSZIpKJBtqFTYDlIb9XEIiRD9jRll+wQG
 PPGkbd2W8BPjTGuIHjvrKAoSUO2tzbxVdTwyadt/r8ml80EMfrPV3t2KFYftyezM8l1d
 p4zl24CcPnhA6xDoh94xFS+nGf6lhGvnuZxuHE89AZdiqD6p9kFt2XhPtmOkd1gEFwMM
 AWdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYlxowDZj/EtK22Vaigh60J3AjOCxpp+T5NIH839346E8ZhCSwIc7AK6AM/vdXHpIxFsBAPSQX4H8kMqEtJCABU5NHnPvXGh2P6tsE2UcpWRG4/VaBZKXjjXr0/sw7XuO+fgpmLJBtP9KCSezDgRPv0w0dKBf+d3gKZMwlDNJ3mxrVO83dYoBPv8C0WtUU6g==
X-Gm-Message-State: AOJu0YwaC9cxWti9keH8XpHlJiV/wW3e87csggLwVZeoQ/Rk7zEFTG7q
 y4U0pGEbdJjigYGEI89+th2t1mQpmFakhsNl4KFrK5JK03Kh2+H0
X-Google-Smtp-Source: AGHT+IGNC7c9/Wu1re9bj1WFf5X30bsZO+zO1PhgKBDQ2sorZHveh2COOoOtJOp856+gBubUwexT2A==
X-Received: by 2002:a2e:9250:0:b0:2d0:dfa5:666e with SMTP id
 v16-20020a2e9250000000b002d0dfa5666emr14517ljg.16.1707838523777; 
 Tue, 13 Feb 2024 07:35:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMqA/cpzXZhrnlE9iivUjztgbjI+3+/mDBGtdKb4b3t0UJ8bQWLxgeEK5M7IPeUhS+PP67P+nLHnSHfQp6S+TXwtKuecH91W+ZzJPdA7YADsnPK3imqbk7GDfU9UaZC4B3Ts1RoC+QFDdm1j1a6Mv7IUUCOJEMA4kqIFsKZBrGTTfoOkaYYlugvCqqMrvUM4oA/stU+1mTSCTkZu9km/R+PMbDVCB4ETPllBl7mR6hMN9yYJgmBsVoOw+5x5pYwowdREOdEkxL006DoobcUkI+gAY2aYPJAqLR+kK8adSE7+W2OOshTyjrrwrlTIO9FXB6ViYG+yCm
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b00411d640085csm263375wmb.43.2024.02.13.07.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:35:23 -0800 (PST)
Message-ID: <551f7d74-4f57-4b83-a680-a40637593454@gmail.com>
Date: Tue, 13 Feb 2024 16:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tests/drm_buddy: add alloc_contiguous test
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, daniel@ffwll.ch
References: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
 <20240213135203.348050-2-Arunpravin.PaneerSelvam@amd.com>
 <3c648d2f-07d3-4b4d-bf7b-c4c91b5163a3@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <3c648d2f-07d3-4b4d-bf7b-c4c91b5163a3@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.02.24 um 15:28 schrieb Matthew Auld:
> On 13/02/2024 13:52, Arunpravin Paneer Selvam wrote:
>> Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.
>>
>> References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>
> It looks like you changed the patch authorship here.

Going to fix this if I get tasked with pushing this to drm-misc-fixes.

But I still have hope that Arun will figure out how to do this himself.

Christian.

>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Cc: Limonciello <mario.limonciello@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index ea2af6bd9abe..fee6bec757d1 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -8,6 +8,7 @@
>>     #include <linux/prime_numbers.h>
>>   #include <linux/sched/signal.h>
>> +#include <linux/sizes.h>
>>     #include <drm/drm_buddy.h>
>>   @@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 
>> chunk_size)
>>       return (1 << order) * chunk_size;
>>   }
>>   +static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>> +{
>> +    u64 mm_size, ps = SZ_4K, i, n_pages, total;
>> +    struct drm_buddy_block *block;
>> +    struct drm_buddy mm;
>> +    LIST_HEAD(left);
>> +    LIST_HEAD(middle);
>> +    LIST_HEAD(right);
>> +    LIST_HEAD(allocated);
>> +
>> +    mm_size = 16 * 3 * SZ_4K;
>> +
>> +    KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>> +
>> +    /*
>> +     * Idea is to fragment the address space by alternating block
>> +     * allocations between three different lists; one for left, 
>> middle and
>> +     * right. We can then free a list to simulate fragmentation. In
>> +     * particular we want to exercise the 
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION,
>> +     * including the try_harder path.
>> +     */
>> +
>> +    i = 0;
>> +    n_pages = mm_size / ps;
>> +    do {
>> +        struct list_head *list;
>> +        int slot = i % 3;
>> +
>> +        if (slot == 0)
>> +            list = &left;
>> +        else if (slot == 1)
>> +            list = &middle;
>> +        else
>> +            list = &right;
>> +        KUNIT_ASSERT_FALSE_MSG(test,
>> +                       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                                  ps, ps, list, 0),
>> +                       "buddy_alloc hit an error size=%d\n",
>> +                       ps);
>> +    } while (++i < n_pages);
>> +
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> + DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%d\n", 3 * ps);
>> +
>> +    drm_buddy_free_list(&mm, &middle);
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> + DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               2 * ps, ps, &allocated,
>> + DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%llu\n", 2 * ps);
>> +
>> +    drm_buddy_free_list(&mm, &right);
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> + DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>> +    /*
>> +     * At this point we should have enough contiguous space for 2 
>> blocks,
>> +     * however they are never buddies (since we freed middle and 
>> right) so
>> +     * will require the try_harder logic to find them.
>> +     */
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>> +                                2 * ps, ps, &allocated,
>> + DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc hit an error size=%d\n", 2 * ps);
>> +
>> +    drm_buddy_free_list(&mm, &left);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>> +                                3 * ps, ps, &allocated,
>> + DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc hit an error size=%d\n", 3 * ps);
>> +
>> +    total = 0;
>> +    list_for_each_entry(block, &allocated, link)
>> +        total += drm_buddy_block_size(&mm, block);
>> +
>> +    KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
>> +
>> +    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_fini(&mm);
>> +}
>> +
>>   static void drm_test_buddy_alloc_pathological(struct kunit *test)
>>   {
>>       u64 mm_size, size, start = 0;
>> @@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
>>       KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>>       KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>>       KUNIT_CASE(drm_test_buddy_alloc_pathological),
>> +    KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>>       {}
>>   };

