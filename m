Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F58C4410
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6754D10E7F2;
	Mon, 13 May 2024 15:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFTWD/vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5E610E7F2;
 Mon, 13 May 2024 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715613664; x=1747149664;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g21brdJW5sH+k2bO4RJB7T9JxYpWq01YKF4EcPjeF9E=;
 b=GFTWD/vhawBbdJPk/1S0VA7pACuQRzCZvX6lV1kBuONPORVbIaw689OP
 n9QR0L6Sex+odg0do+1IpjYZppFI0C0zJqemFDs5cO2NMfNiae3BXTncW
 b3MZOSlpyp4AMslVQTCsw01+1p0HHBT9IM9rBc1U/fQgNCRkkvlC6radb
 zBMRXlgNPJl6K52IfJFx6jxbI+fPfV9oxHyUUkN28vOZ5qQAajJ2ZFWam
 pRHouG33IT1jqDSikyROocEcp+lXZv+vPdiOUT5c1daQtJ/MeMrc0Mw3s
 IkY4GXx5yjC5kUdGOloen5BEQqmPY8us8Gd7VD9eOhWcy27yZ4yo2EKGa Q==;
X-CSE-ConnectionGUID: DaF74micQyWy7PeZcEm0QQ==
X-CSE-MsgGUID: NbG0RBTnQoO7kVQZzluq3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11409781"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11409781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:21:03 -0700
X-CSE-ConnectionGUID: 7qqFoKBgQ3iYyv3k9GQzsA==
X-CSE-MsgGUID: iH6UV01+QoKbreRkIIfBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35123948"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.243])
 ([10.245.244.243])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:21:01 -0700
Message-ID: <384af32a-f162-4b56-b05e-ad1cc9cd438b@intel.com>
Date: Mon, 13 May 2024 16:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/tests: Add a unit test for range bias
 allocation
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, daniel@ffwll.ch
References: <20240512075909.2688-1-Arunpravin.PaneerSelvam@amd.com>
 <20240512075909.2688-2-Arunpravin.PaneerSelvam@amd.com>
 <81aa9ca4-dfbf-4e2f-b931-87c3a91cbe0a@intel.com>
 <82a9c2c4-5165-413a-b3b1-c8b59ec49271@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <82a9c2c4-5165-413a-b3b1-c8b59ec49271@amd.com>
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

On 13/05/2024 16:11, Paneer Selvam, Arunpravin wrote:
> Hi Matthew,
> 
> On 5/13/2024 1:49 PM, Matthew Auld wrote:
>> On 12/05/2024 08:59, Arunpravin Paneer Selvam wrote:
>>> Allocate cleared blocks in the bias range when the DRM
>>> buddy's clear avail is zero. This will validate the bias
>>> range allocation in scenarios like system boot when no
>>> cleared blocks are available and exercise the fallback
>>> path too. The resulting blocks should always be dirty.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
>>>   1 file changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>>> index e3b50e240d36..a194f271bc55 100644
>>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>>> @@ -26,6 +26,8 @@ static void drm_test_buddy_alloc_range_bias(struct 
>>> kunit *test)
>>>       u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
>>>       DRM_RND_STATE(prng, random_seed);
>>>       unsigned int i, count, *order;
>>> +    struct drm_buddy_block *block;
>>> +    unsigned long flags;
>>>       struct drm_buddy mm;
>>>       LIST_HEAD(allocated);
>>>   @@ -222,6 +224,39 @@ static void 
>>> drm_test_buddy_alloc_range_bias(struct kunit *test)
>>>         drm_buddy_free_list(&mm, &allocated, 0);
>>>       drm_buddy_fini(&mm);
>>> +
>>> +    /*
>>> +     * Allocate cleared blocks in the bias range when the DRM 
>>> buddy's clear avail is
>>> +     * zero. This will validate the bias range allocation in 
>>> scenarios like system boot
>>> +     * when no cleared blocks are available and exercise the 
>>> fallback path too. The resulting
>>> +     * blocks should always be dirty.
>>> +     */
>>> +
>>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
>>> +                   "buddy_init failed\n");
>>> +    mm.clear_avail = 0;
>>
>> Should already be zero, right? Maybe make this an assert instead?
> No, since the mm declared as a local variable in the test case, 
> mm.clear_avail is not zero.

That sounds like a bug IMO. The init() should initialize it, like it 
does for mm.avail and everything else.

>>
>>> +
>>> +    bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), 
>>> ps);
>>> +    bias_end = round_up(bias_start + prandom_u32_state(&prng) % 
>>> (mm_size - bias_start), ps);
>>> +    bias_end = max(bias_end, bias_start + ps);
>>> +    bias_rem = bias_end - bias_start;
>>> +
>>> +    flags = DRM_BUDDY_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
>>> +    u32 size = max(round_up(prandom_u32_state(&prng) % bias_rem, 
>>> ps), ps);
>>
>> u32 declaration should be moved to above?
> Sure.
> 
> Thanks,
> Arun.
>>
>> Otherwise,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>> +
>>> +    KUNIT_ASSERT_FALSE_MSG(test,
>>> +                   drm_buddy_alloc_blocks(&mm, bias_start,
>>> +                              bias_end, size, ps,
>>> +                              &allocated,
>>> +                              flags),
>>> +                   "buddy_alloc failed with bias(%x-%x), size=%u, 
>>> ps=%u\n",
>>> +                   bias_start, bias_end, size, ps);
>>> +
>>> +    list_for_each_entry(block, &allocated, link)
>>> +        KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
>>> +
>>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>> +    drm_buddy_fini(&mm);
>>>   }
>>>     static void drm_test_buddy_alloc_clear(struct kunit *test)
> 
