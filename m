Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074DBA36B6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA3210EA17;
	Fri, 26 Sep 2025 11:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HE34Pci/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F8410E06B;
 Fri, 26 Sep 2025 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758884417; x=1790420417;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qPv7pLn66jjgNcE5yxtfFa8C67tW3b4mYAWwp0265+4=;
 b=HE34Pci/I74to7gZBsPAWzlcXBRcyRad796rtGj0WP0y5LWZJ1LTCw+P
 ucZypEBMuZ3/Z+zn8FJMfniOWpT+6/f7ZdC/Oqtj06LMDmk1tNPAlhFer
 FNiwT48MuIjvXWnmtp7T85XXvoBYpus8ITe/oPr0huXX10SRlkPVphoBx
 75q/BB/cuIV4/yuFUk1yVYkeAFgjS+g+oX75gWXfy6LyuMao+LUgyrgBc
 E4STUqIIjj+HeNumurEXML70Q6douDEj8TLn6N1rHdCcwP5PBk7U4n4Dz
 s/ydTBYsc23JTQaE4RHecDDreQDj89DoXfhfmXc9lWQmxPz5GGG/XT0S5 g==;
X-CSE-ConnectionGUID: wZ97gly0Q32OxuOAfdeNRw==
X-CSE-MsgGUID: nIKPp8FJTfqlH7Sz7w3JRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71464009"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="71464009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:00:16 -0700
X-CSE-ConnectionGUID: WxKW6SqmS1WobwQFHjY41g==
X-CSE-MsgGUID: r30AttQMTlGmjiklfEP8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="201279241"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:00:14 -0700
Message-ID: <f2db7484-efd4-459a-93b2-b6097d7e86f5@intel.com>
Date: Fri, 26 Sep 2025 12:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/buddy: Add KUnit tests for allocator
 performance under fragmentation
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, jani.nikula@linux.intel.com,
 peterz@infradead.org, samuel.pitoiset@gmail.com
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
 <20250923090242.60649-3-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250923090242.60649-3-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/09/2025 10:02, Arunpravin Paneer Selvam wrote:
> Add KUnit test cases that create severe memory fragmentation and
> measure allocation/free performance.
> 
> The tests simulate two scenarios -
> 
> 1. Allocation under severe fragmentation
>     - Allocate the entire 4 GiB space as 8 KiB blocks with 64 KiB alignment,
>       split them into two groups and free with mixed flags to block coalescing.
>     - Repeatedly allocate and free 64 KiB blocks while timing the loop.
>     - Freelist runtime: 76475 ms(76.5 seconds), soft-lockup triggered.
>       RB-tree runtime: 186 ms.
> 
> 2. Reverse free order under fragmentation
>     - Create a similarly fragmented space, free half the blocks, reverse
>       the order of the remainder, and release them with the cleared flag.
>     - Freelist runtime: 85620 ms(85.6 seconds).
>       RB-tree runtime: 114 ms.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 110 +++++++++++++++++++++++++
>   1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 7a0e523651f0..19b49fb6ec19 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -21,6 +21,115 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void drm_test_buddy_fragmentation_performance(struct kunit *test)
> +{
> +	const unsigned long max_acceptable_time_ms = 1000;
> +	struct drm_buddy_block *block, *tmp;
> +	int num_blocks, i, ret, count = 0;
> +	LIST_HEAD(allocated_blocks);
> +	unsigned long elapsed_ms;
> +	LIST_HEAD(reverse_list);
> +	LIST_HEAD(test_blocks);
> +	LIST_HEAD(clear_list);
> +	LIST_HEAD(dirty_list);
> +	LIST_HEAD(free_list);
> +	struct drm_buddy mm;
> +	u64 mm_size = SZ_4G;
> +	ktime_t start, end;
> +
> +	/*
> +	 * Allocation under severe fragmentation
> +	 *
> +	 * Create severe fragmentation by allocating the entire 4 GiB address space
> +	 * as tiny 8 KiB blocks but forcing a 64 KiB alignment. The resulting pattern
> +	 * leaves many scattered holes. Split the allocations into two groups and
> +	 * return them with different flags to block coalescing, then repeatedly
> +	 * allocate and free 64 KiB blocks while timing the loop. This stresses how
> +	 * quickly the allocator can satisfy larger, aligned requests from a pool of
> +	 * highly fragmented space.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
> +			       "buddy_init failed\n");
> +
> +	num_blocks = mm_size / SZ_64K;
> +
> +	start = ktime_get();
> +	/* Allocate with maximum fragmentation - 8K blocks with 64K alignment */
> +	for (i = 0; i < num_blocks; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_64K,
> +								    &allocated_blocks, 0),
> +					"buddy_alloc hit an error size=%u\n", SZ_8K);
> +
> +	list_for_each_entry_safe(block, tmp, &allocated_blocks, link) {
> +		if (count % 4 == 0 || count % 4 == 3)
> +			list_move_tail(&block->link, &clear_list);
> +		else
> +			list_move_tail(&block->link, &dirty_list);
> +		count++;
> +	}
> +
> +	/* Free with different flags to ensure no coalescing */
> +	drm_buddy_free_list(&mm, &clear_list, DRM_BUDDY_CLEARED);
> +	drm_buddy_free_list(&mm, &dirty_list, 0);
> +
> +	for (i = 0; i < num_blocks; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_64K, SZ_64K,
> +								    &test_blocks, 0),
> +					"buddy_alloc hit an error size=%u\n", SZ_64K);
> +	drm_buddy_free_list(&mm, &test_blocks, 0);
> +
> +	end = ktime_get();
> +	elapsed_ms = ktime_to_ms(ktime_sub(end, start));
> +	/* Performance validation */
> +	KUNIT_EXPECT_LT_MSG(test, elapsed_ms, max_acceptable_time_ms,
> +			    "Fragmented allocation took %lu ms (max acceptable: %lu ms)",
> +			    elapsed_ms, max_acceptable_time_ms);
> +	drm_buddy_fini(&mm);
> +
> +	/*
> +	 * Reverse free order under fragmentation
> +	 *
> +	 * Construct a fragmented 4 GiB space by allocating every 8 KiB block with
> +	 * 64 KiB alignment, creating a dense scatter of small regions. Half of the
> +	 * blocks are selectively freed to form sparse gaps, while the remaining
> +	 * allocations are preserved, reordered in reverse, and released back with
> +	 * the cleared flag. This models a pathological reverse-ordered free pattern
> +	 * and measures how quickly the allocator can merge and reclaim space when
> +	 * deallocation occurs in the opposite order of allocation, exposing the
> +	 * cost difference between a linear freelist scan and an ordered tree lookup.
> +	 */
> +	ret = drm_buddy_init(&mm, mm_size, SZ_4K);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	start = ktime_get();
> +	/* Allocate maximum fragmentation */
> +	for (i = 0; i < num_blocks; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_64K,
> +								    &allocated_blocks, 0),
> +					"buddy_alloc hit an error size=%u\n", SZ_8K);
> +
> +	list_for_each_entry_safe(block, tmp, &allocated_blocks, link) {
> +		if (count % 2 == 0)
> +			list_move_tail(&block->link, &free_list);
> +		count++;
> +	}
> +	drm_buddy_free_list(&mm, &free_list, DRM_BUDDY_CLEARED);
> +
> +	list_for_each_entry_safe_reverse(block, tmp, &allocated_blocks, link)
> +		list_move(&block->link, &reverse_list);
> +	drm_buddy_free_list(&mm, &reverse_list, DRM_BUDDY_CLEARED);
> +
> +	end = ktime_get();
> +	elapsed_ms = ktime_to_ms(ktime_sub(end, start));
> +
> +	/* Performance validation */
> +	KUNIT_EXPECT_LT_MSG(test, elapsed_ms, max_acceptable_time_ms,
> +			    "Reverse-ordered free took %lu ms (max acceptable: %lu ms)",
> +			    elapsed_ms, max_acceptable_time_ms);

Sorry for the delay. We are pretty sure these time asserts are not going 
to be flaky over many thousands of runs across different types of 
machines (maybe some underpowered atom)?

Assuming not a concern,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   {
>   	u32 mm_size, size, ps, bias_size, bias_start, bias_end, bias_rem;
> @@ -772,6 +881,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	KUNIT_CASE(drm_test_buddy_alloc_clear),
>   	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
> +	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
>   	{}
>   };
>   

