Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA1989CB76
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 20:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3ED10FD8B;
	Mon,  8 Apr 2024 18:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jx9A4F50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EAE10FD3A;
 Mon,  8 Apr 2024 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712599613; x=1744135613;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o7PRP4CSBoHLJcwklDmSp0l5qaAgKxnPAFK7SlWjBCQ=;
 b=jx9A4F50ZirGtHtZPjRxR5eQ13LstEnvZPNmfVLG+kPhOAyOsvcQNU2I
 NSf57hbd24JFjkidZItrC1K/SYqGU7QvDpMR1c1ACRVuNAF7tuhqE7+U/
 0WwURxIbHdwd5Usb6ejGoutTfDvV0LlMwc0fCEIOgiNg9MTflHVl93qS+
 WLjYdEgu5QlYIgN6LgIFthLNy6WXRcU1XaqagnpuEv062IkL9oBuDurkI
 F3yYf1u6SXLOXJPxatHcQSkLMvC+evo7plPrQmEW2U30UHxLZh1r+sA10
 fmFor4McWyzKxIkfjSzc5bSwl1kGtUm4Mpmnh6XLOucF/1Ut7FzppNFZO g==;
X-CSE-ConnectionGUID: jBAuBmEuS7+hi8aDQ892kg==
X-CSE-MsgGUID: pFD00f+gQJSgv/OrrXyF2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19038292"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19038292"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:06:52 -0700
X-CSE-ConnectionGUID: sCV1sE+uSkCE0KGtmN9uEQ==
X-CSE-MsgGUID: 7y0P/VQhTyWNTKt2PoTdhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="43144113"
Received: from unknown (HELO [10.245.245.223]) ([10.245.245.223])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:06:50 -0700
Message-ID: <025f993b-0ce8-4977-b43a-454563509034@intel.com>
Date: Mon, 8 Apr 2024 19:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] drm/tests: Add a test case for drm buddy clear
 allocation
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
 <20240408151620.528163-3-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240408151620.528163-3-Arunpravin.PaneerSelvam@amd.com>
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

On 08/04/2024 16:16, Arunpravin Paneer Selvam wrote:
> Add a new test case for the drm buddy clear and dirty
> allocation.
> 
> v2:(Matthew)
>    - make size as u32
>    - rename PAGE_SIZE with SZ_4K
>    - dont fragment the address space for all the order allocation
>      iterations. we can do it once and just increment and allocate
>      the size.
>    - create new mm with non power-of-two size to ensure the multi-root
>      force_merge during fini.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 141 +++++++++++++++++++++++++
>   1 file changed, 141 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 4621a860cb05..b07f132f2835 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -224,6 +224,146 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   	drm_buddy_fini(&mm);
>   }
>   
> +static void drm_test_buddy_alloc_clear(struct kunit *test)
> +{
> +	unsigned long n_pages, total, i = 0;
> +	const unsigned long ps = SZ_4K;
> +	struct drm_buddy_block *block;
> +	const int max_order = 12;
> +	LIST_HEAD(allocated);
> +	struct drm_buddy mm;
> +	unsigned int order;
> +	u32 mm_size, size;
> +	LIST_HEAD(dirty);
> +	LIST_HEAD(clean);
> +
> +	mm_size = SZ_4K << max_order;
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
> +
> +	/*
> +	 * Idea is to allocate and free some random portion of the address space,
> +	 * returning those pages as non-dirty and randomly alternate between
> +	 * requesting dirty and non-dirty pages (not going over the limit
> +	 * we freed as non-dirty), putting that into two separate lists.
> +	 * Loop over both lists at the end checking that the dirty list
> +	 * is indeed all dirty pages and vice versa. Free it all again,
> +	 * keeping the dirty/clear status.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    5 * ps, ps, &allocated,
> +							    DRM_BUDDY_TOPDOWN_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 5 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +
> +	n_pages = 10;
> +	do {
> +		unsigned long flags;
> +		struct list_head *list;
> +		int slot = i % 2;
> +
> +		if (slot == 0) {
> +			list = &dirty;
> +			flags = 0;
> +		} else {
> +			list = &clean;
> +			flags = DRM_BUDDY_CLEAR_ALLOCATION;
> +		}
> +
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +								    ps, ps, list,
> +								    flags),
> +					"buddy_alloc hit an error size=%lu\n", ps);
> +	} while (++i < n_pages);
> +
> +	list_for_each_entry(block, &clean, link)
> +		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), true);
> +
> +	list_for_each_entry(block, &dirty, link)
> +		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
> +
> +	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
> +
> +	/*
> +	 * Trying to go over the clear limit for some allocation.
> +	 * The allocation should never fail with reasonable page-size.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    10 * ps, ps, &clean,
> +							    DRM_BUDDY_CLEAR_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 10 * ps);
> +
> +	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
> +	drm_buddy_free_list(&mm, &dirty, 0);
> +	drm_buddy_fini(&mm);
> +
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	/*
> +	 * Create a new mm. Intentionally fragment the address space by creating
> +	 * two alternating lists. Free both lists, one as dirty the other as clean.
> +	 * Try to allocate double the previous size with matching min_page_size. The
> +	 * allocation should never fail as it calls the force_merge. Also check that
> +	 * the page is always dirty after force_merge. Free the page as dirty, then
> +	 * repeat the whole thing, increment the order until we hit the max_order.
> +	 */
> +
> +	i = 0;
> +	n_pages = mm_size / ps;
> +	do {
> +		struct list_head *list;
> +		int slot = i % 2;
> +
> +		if (slot == 0)
> +			list = &dirty;
> +		else
> +			list = &clean;
> +
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +								    ps, ps, list, 0),
> +					"buddy_alloc hit an error size=%lu\n", ps);
> +	} while (++i < n_pages);
> +
> +	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
> +	drm_buddy_free_list(&mm, &dirty, 0);
> +
> +	order = 1;
> +	do {
> +		size = SZ_4K << order;
> +
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +								    size, size, &allocated,
> +								    DRM_BUDDY_CLEAR_ALLOCATION),
> +					"buddy_alloc hit an error size=%u\n", size);
> +		total = 0;
> +		list_for_each_entry(block, &allocated, link) {
> +			if (size != mm_size)
> +				KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
> +			total += drm_buddy_block_size(&mm, block);
> +		}
> +		KUNIT_EXPECT_EQ(test, total, size);
> +
> +		drm_buddy_free_list(&mm, &allocated, 0);
> +	} while (++order <= max_order);
> +
> +	drm_buddy_fini(&mm);
> +
> +	/*
> +	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
> +	 * cleared and then call fini. This will ensure the multi-root force merge during
> +	 * fini.
> +	 */
> +	mm_size = 12 * SZ_4K;

I don't see any randomness? Maybe something like:

size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    4 * ps, ps, &allocated,
> +							    DRM_BUDDY_TOPDOWN_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 4 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   {
>   	const unsigned long ps = SZ_4K, mm_size = 16 * 3 * SZ_4K;
> @@ -584,6 +724,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
> +	KUNIT_CASE(drm_test_buddy_alloc_clear),
>   	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
>   	{}
>   };
