Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F9866F86
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11510F031;
	Mon, 26 Feb 2024 09:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtVJA4IL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526C10F023;
 Mon, 26 Feb 2024 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708941509; x=1740477509;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=a+haiSE/NsA5NCgKYlZzAzIPibjM+9PtDpfVzfw+0R8=;
 b=JtVJA4ILdAtURL8tS9ygw9SaFqed7CTZ5759RGp8TgeDCkVhO+X5sMRA
 szvn9FeE39RWSW15nh0unDt7AQKD1RyOaK7Op3uYMXHmQvD2uqyO6R481
 AHX/8/L7WmyF3SOhcVdIzjB3eCvlDdOEu62XlVm9Kf5KVd/BIXvZfvLDy
 2wBtO3DtB05WbjXMJ4hw5VZzh9kQ1DP2sRZ25s0Wr+CxVnrx2X+6rd+0x
 96Vv7WuAfch3wY7xl5vwHK1yiFdSDxY2bJb54wBb5K5rR09sBEYStS3oD
 mI8pE7LoiGaNWET6ZR+R8YBtOsmtT9f3PgTJ8AQ/ct4X8Ha+/0iG18BNC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3362184"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3362184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="37405780"
Received: from gtobin-mobl.ger.corp.intel.com (HELO [10.252.23.74])
 ([10.252.23.74])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:58:26 -0800
Message-ID: <58e423e8-316e-40e0-b622-136ca6cc0189@intel.com>
Date: Mon, 26 Feb 2024 09:58:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
From: Matthew Auld <matthew.auld@intel.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Maxime Ripard <mripard@redhat.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <96bb6e97-34d9-4e4a-b618-85c17e809738@intel.com>
 <5a9e1f30-19fc-486f-b7f5-016d82580d2f@amd.com>
 <4aea62d4-8c2a-4406-b81e-240dca772da4@intel.com>
 <45059d66-6e80-406b-aae2-72f8b8d142cb@amd.com>
 <dc8c7d2b-4c2f-41dd-9812-3699444d5273@intel.com>
 <94afe80c-9e4f-47a7-a758-17ab26eb4c00@intel.com>
Content-Language: en-GB
In-Reply-To: <94afe80c-9e4f-47a7-a758-17ab26eb4c00@intel.com>
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

On 19/02/2024 12:24, Matthew Auld wrote:
> On 19/02/2024 10:48, Matthew Auld wrote:
>> On 19/02/2024 10:30, Christian König wrote:
>>> Am 19.02.24 um 11:28 schrieb Matthew Auld:
>>>> On 19/02/2024 09:53, Christian König wrote:
>>>>> Am 19.02.24 um 10:42 schrieb Matthew Auld:
>>>>>> On 15/02/2024 17:44, Matthew Auld wrote:
>>>>>>> Doesn't seem to compile on 32b, presumably due to u64 mod/division.
>>>>>>> Simplest is to just switch over to u32 here. Also make print 
>>>>>>> modifiers
>>>>>>> consistent with that.
>>>>>>>
>>>>>>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous 
>>>>>>> test")
>>>>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Cc: Maxime Ripard <mripard@redhat.com>
>>>>>>
>>>>>> Any chance someone can push just this single patch here, since it 
>>>>>> fixes 32b build? It already has an r-b from Arun.
>>>>>
>>>>> Already working on this. Just give me a few more minutes.
>>>>
>>>> Thanks.
>>>
>>> No, problem. I would have pushed this earlier, but my build server 
>>> doesn't want to work any more. Looks like the SSD has passed its 
>>> warranty :(
>>>
>>> Should I push the other three patches to drm-misc-fixes as well? I 
>>> currently can't even build test them.
>>
>> Need to send a v2 for that. One minor change in the test just to be 
>> consistent with using u32. Thanks.
> 
> Sent v2. If you could push that when you get a chance. Thanks.
> 
> https://patchwork.freedesktop.org/series/130075/

Gentle ping on merging v2.

> 
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
>>>>>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>>>>>>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>>>>> index fee6bec757d1..edacc1adb28f 100644
>>>>>>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>>>>>>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>>>>> @@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 
>>>>>>> chunk_size)
>>>>>>>     static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>>>>   {
>>>>>>> -    u64 mm_size, ps = SZ_4K, i, n_pages, total;
>>>>>>> +    u32 mm_size, ps = SZ_4K, i, n_pages, total;
>>>>>>>       struct drm_buddy_block *block;
>>>>>>>       struct drm_buddy mm;
>>>>>>>       LIST_HEAD(left);
>>>>>>> @@ -56,30 +56,30 @@ static void 
>>>>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>>>>           KUNIT_ASSERT_FALSE_MSG(test,
>>>>>>>                          drm_buddy_alloc_blocks(&mm, 0, mm_size,
>>>>>>>                                     ps, ps, list, 0),
>>>>>>> -                       "buddy_alloc hit an error size=%d\n",
>>>>>>> +                       "buddy_alloc hit an error size=%u\n",
>>>>>>>                          ps);
>>>>>>>       } while (++i < n_pages);
>>>>>>>         KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>> 0, mm_size,
>>>>>>>                                  3 * ps, ps, &allocated,
>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>> -                   "buddy_alloc didn't error size=%d\n", 3 * ps);
>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>>>>         drm_buddy_free_list(&mm, &middle);
>>>>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>>>>> mm_size,
>>>>>>>                                  3 * ps, ps, &allocated,
>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>> -                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>>>>> mm_size,
>>>>>>>                                  2 * ps, ps, &allocated,
>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>> -                   "buddy_alloc didn't error size=%llu\n", 2 * ps);
>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 2 * ps);
>>>>>>>         drm_buddy_free_list(&mm, &right);
>>>>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>>>>> mm_size,
>>>>>>>                                  3 * ps, ps, &allocated,
>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>> -                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>>>>       /*
>>>>>>>        * At this point we should have enough contiguous space for 
>>>>>>> 2 blocks,
>>>>>>>        * however they are never buddies (since we freed middle 
>>>>>>> and right) so
>>>>>>> @@ -88,13 +88,13 @@ static void 
>>>>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>>>>> mm_size,
>>>>>>>                                   2 * ps, ps, &allocated,
>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>> -                   "buddy_alloc hit an error size=%d\n", 2 * ps);
>>>>>>> +                   "buddy_alloc hit an error size=%u\n", 2 * ps);
>>>>>>>         drm_buddy_free_list(&mm, &left);
>>>>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>>>>> mm_size,
>>>>>>>                                   3 * ps, ps, &allocated,
>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>> -                   "buddy_alloc hit an error size=%d\n", 3 * ps);
>>>>>>> +                   "buddy_alloc hit an error size=%u\n", 3 * ps);
>>>>>>>         total = 0;
>>>>>>>       list_for_each_entry(block, &allocated, link)
>>>>>
>>>
