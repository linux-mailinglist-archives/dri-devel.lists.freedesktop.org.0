Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHHqFa7gnWnpSQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:32:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79E18A902
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C275B10E5FC;
	Tue, 24 Feb 2026 17:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9pDmA1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0419610E05E;
 Tue, 24 Feb 2026 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771954343; x=1803490343;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uy9//N147ieOd/72rkd0ZKm1hPjw2dzP5gkxrOrFrCE=;
 b=h9pDmA1KD1xv9n2ErCxLgRReZtFeJt0D3GpQHGGTdTYS44H0R4kWjDm7
 /dCL520OI6EsGfPveXows2t0utw+FmVgr+OW2sbE/5uVBG+hIAfadSEvI
 L7jrtHx2FnznZH6GmN4dhpIbwt1pPXD58D1JZ3sKH9A92FMCsWwWGmCLh
 gCflyCplZ7iDYay0+ScB7lWtwxRUx7aVKZ9U/vSTiUHovAixrIZVBj66q
 +cK1k2ENJGXmYJi2YnBoxLFJZWI6i22iwBeBZ3rEmCHkNTfLqNqDRfXev
 xRDVENzPf2JhQcnOrtbIJ9fAOk9Ru+KRwxX5unrXmSXvIYjCmZo+nORFG g==;
X-CSE-ConnectionGUID: 1iXvU/84SkWhF1G+KJ3HnQ==
X-CSE-MsgGUID: TNRr2E9NRC6NB2zFCKCRYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83690747"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83690747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:32:22 -0800
X-CSE-ConnectionGUID: ClDuoCgeQlKpulIe05bcPQ==
X-CSE-MsgGUID: E8V9LKURRqyS2GKPsZ4djw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="214181580"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.173])
 ([10.245.244.173])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:32:20 -0800
Message-ID: <f529e955-2db2-4fab-ad46-5345febf270f@intel.com>
Date: Tue, 24 Feb 2026 17:32:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
 <20260217113900.10675-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260217113900.10675-2-Arunpravin.PaneerSelvam@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: ED79E18A902
X-Rspamd-Action: no action

On 17/02/2026 11:39, Arunpravin Paneer Selvam wrote:
> Add KUnit test to validate offset-aligned allocations in the DRM buddy
> allocator.
> 
> Validate offset-aligned allocation:
> The test covers allocations with sizes smaller than the alignment constraint
> and verifies correct size preservation, offset alignment, and behavior across
> multiple allocation sizes. It also exercises fragmentation by freeing
> alternating blocks and confirms that allocation fails once all aligned offsets
> are consumed.
> 
> Stress subtree_max_alignment propagation:
> Exercise subtree_max_alignment tracking by allocating blocks with descending
> alignment constraints and freeing them in reverse order. This verifies that
> free-tree augmentation correctly propagates the maximum offset alignment
> present in each subtree at every stage.
> 
> v2:
>    - Move the patch to gpu/tests/gpu_buddy_test.c file.
> 
> v3:
>    - Fixed build warnings reported by kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/tests/gpu_buddy_test.c | 167 +++++++++++++++++++++++++++++
>   1 file changed, 167 insertions(+)
> 
> diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
> index 450e71deed90..2901d43f4bae 100644
> --- a/drivers/gpu/tests/gpu_buddy_test.c
> +++ b/drivers/gpu/tests/gpu_buddy_test.c
> @@ -21,6 +21,171 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void gpu_test_buddy_subtree_offset_alignment_stress(struct kunit *test)
> +{
> +	struct gpu_buddy_block *block;
> +	struct rb_node *node = NULL;
> +	const u64 mm_size = SZ_2M;
> +	const u64 alignments[] = {
> +		SZ_1M,
> +		SZ_512K,
> +		SZ_256K,
> +		SZ_128K,
> +		SZ_64K,
> +		SZ_32K,
> +		SZ_16K,
> +		SZ_8K,
> +	};
> +

Nit: extra newline

> +	struct list_head allocated[ARRAY_SIZE(alignments)];
> +	unsigned int i, order, max_subtree_align = 0;
> +	struct gpu_buddy mm;
> +	int ret, tree;
> +
> +	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
> +			       "buddy_init failed\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(allocated); i++)
> +		INIT_LIST_HEAD(&allocated[i]);
> +
> +	/*
> +	 * Exercise subtree_max_alignment tracking by allocating blocks with descending
> +	 * alignment constraints and freeing them in reverse order. This verifies that
> +	 * free-tree augmentation correctly propagates the maximum offset alignment
> +	 * present in each subtree at every stage.
> +	 */
> +
> +	for (i = 0; i < ARRAY_SIZE(alignments); i++) {
> +		struct gpu_buddy_block *root = NULL;
> +		unsigned int expected;
> +		u64 align;
> +
> +		align = alignments[i];
> +		expected = ilog2(align) - 1;
> +
> +		for (;;) {
> +			ret = gpu_buddy_alloc_blocks(&mm,
> +						     0, mm_size,
> +						     SZ_4K, align,
> +						     &allocated[i],
> +						     0);
> +			if (ret)
> +				break;
> +
> +			block = list_last_entry(&allocated[i],
> +						struct gpu_buddy_block,
> +						link);
> +			KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (align - 1), 0ULL);

Perhaps simpler to use:

IS_ALIGNED(offset, align)

?

> +		}
> +
> +		for (order = mm.max_order + 1; order-- > 0 && !root; ) {

This is maybe a bit hard to read?

for (order = mm.max_order; order >= 0 && !root; order--)

And make order an int?

> +			for (tree = 0; tree < 2; tree++) {
> +				node = mm.free_trees[tree][order].rb_node;
> +				if (node) {
> +					root = container_of(node,
> +							    struct gpu_buddy_block,
> +							    rb);
> +					break;
> +				}
> +			}
> +		}
> +
> +		KUNIT_ASSERT_NOT_NULL(test, root);
> +		KUNIT_EXPECT_EQ(test, root->subtree_max_alignment, expected);
> +	}
> +
> +	for (i = ARRAY_SIZE(alignments); i-- > 0; ) {
> +		gpu_buddy_free_list(&mm, &allocated[i], 0);
> +
> +		for (order = 0; order <= mm.max_order; order++) {
> +			for (tree = 0; tree < 2; tree++) {
> +				node = mm.free_trees[tree][order].rb_node;
> +				if (!node)
> +					continue;
> +
> +				block = container_of(node, struct gpu_buddy_block, rb);
> +				max_subtree_align = max(max_subtree_align,
> +							block->subtree_max_alignment);
> +			}
> +		}
> +
> +		KUNIT_EXPECT_GE(test, max_subtree_align, ilog2(alignments[i]));
> +	}
> +
> +	gpu_buddy_fini(&mm);
> +}
> +
> +static void gpu_test_buddy_offset_aligned_allocation(struct kunit *test)
> +{
> +	struct gpu_buddy_block *block, *tmp;
> +	int num_blocks, i, count = 0;
> +	LIST_HEAD(allocated);
> +	struct gpu_buddy mm;
> +	u64 mm_size = SZ_4M;
> +	LIST_HEAD(freed);
> +
> +	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
> +			       "buddy_init failed\n");
> +
> +	num_blocks = mm_size / SZ_256K;
> +	/*
> +	 * Allocate multiple sizes under a fixed offset alignment.
> +	 * Ensures alignment handling is independent of allocation size and
> +	 * exercises subtree max-alignment pruning for small requests.
> +	 */
> +	for (i = 0; i < num_blocks; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_256K,
> +								    &allocated, 0),
> +					"buddy_alloc hit an error size=%u\n", SZ_8K);
> +
> +	list_for_each_entry(block, &allocated, link) {
> +		/* Ensure the allocated block uses the expected 8 KB size */
> +		KUNIT_EXPECT_EQ(test, gpu_buddy_block_size(&mm, block), SZ_8K);
> +		/* Ensure the block starts at a 256 KB-aligned offset for proper alignment */
> +		KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (SZ_256K - 1), 0ULL);

IS_ALIGNED() ?

> +	}
> +	gpu_buddy_free_list(&mm, &allocated, 0);
> +
> +	for (i = 0; i < num_blocks; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
> +								    &allocated, 0),
> +					"buddy_alloc hit an error size=%u\n", SZ_16K);
> +
> +	list_for_each_entry(block, &allocated, link) {
> +		/* Ensure the allocated block uses the expected 16 KB size */
> +		KUNIT_EXPECT_EQ(test, gpu_buddy_block_size(&mm, block), SZ_16K);
> +		/* Ensure the block starts at a 256 KB-aligned offset for proper alignment */
> +		KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (SZ_256K - 1), 0ULL);

IS_ALIGNED() ?

Anyway:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	}
> +
> +	/*
> +	 * Free alternating aligned blocks to introduce fragmentation.
> +	 * Ensures offset-aligned allocations remain valid after frees and
> +	 * verifies subtree max-alignment metadata is correctly maintained.
> +	 */
> +	list_for_each_entry_safe(block, tmp, &allocated, link) {
> +		if (count % 2 == 0)
> +			list_move_tail(&block->link, &freed);
> +		count++;
> +	}
> +	gpu_buddy_free_list(&mm, &freed, 0);
> +
> +	for (i = 0; i < num_blocks / 2; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
> +								    &allocated, 0),
> +					"buddy_alloc hit an error size=%u\n", SZ_16K);
> +
> +	/*
> +	 * Allocate with offset alignment after all slots are used; must fail.
> +	 * Confirms that no aligned offsets remain.
> +	 */
> +	KUNIT_ASSERT_TRUE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
> +							   &allocated, 0),
> +			       "buddy_alloc hit an error size=%u\n", SZ_16K);
> +	gpu_buddy_free_list(&mm, &allocated, 0);
> +	gpu_buddy_fini(&mm);
> +}
> +
>   static void gpu_test_buddy_fragmentation_performance(struct kunit *test)
>   {
>   	struct gpu_buddy_block *block, *tmp;
> @@ -912,6 +1077,8 @@ static struct kunit_case gpu_buddy_tests[] = {
>   	KUNIT_CASE(gpu_test_buddy_alloc_range_bias),
>   	KUNIT_CASE(gpu_test_buddy_fragmentation_performance),
>   	KUNIT_CASE(gpu_test_buddy_alloc_exceeds_max_order),
> +	KUNIT_CASE(gpu_test_buddy_offset_aligned_allocation),
> +	KUNIT_CASE(gpu_test_buddy_subtree_offset_alignment_stress),
>   	{}
>   };
>   

