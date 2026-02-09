Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPUKBAg1iml5IQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:27:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A150D11412D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EB610E46B;
	Mon,  9 Feb 2026 19:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4KFy3R+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA9010E466;
 Mon,  9 Feb 2026 19:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770665219; x=1802201219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u487StG2GkN0jFcCuAfnRE4AJ4Omr2RTUEADo9vRhTo=;
 b=X4KFy3R+o1fzlhe04Fn4OEBNbFoLaMpVFyakMMTy651aRjS0e0aYTv8V
 3SbQBt4j5iSYf7kuk0VnbcPlw3diyvM4ieitSuMiMUdwpkVIdkUU+K+t8
 m+UImCdpYYeau3Ienz1Ht+QpLB0mzN3rNzUsogud8+VbZGuePbau3OGUx
 /1dl6QOjC+RWqyTavVAu+YrBI5OCSR3HVP6NX1UIGncZmvD0DJctYmyUc
 OpIDrCLbV1SQWIO2oV38CQWl0KMJuLiP5TCYk+0XQF7T/c4Cnfp2OuStf
 Hxuzr5E7MtWWIJ5ToJl5NUB3WJMm1wR0eFuRFxRXzWx2Wy/Fc8qaoyKds w==;
X-CSE-ConnectionGUID: b2C2WOmlRjGv/vERMRgAZA==
X-CSE-MsgGUID: NHkB9ZuXRfiGuLKZRJVDaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74389443"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="74389443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 11:26:58 -0800
X-CSE-ConnectionGUID: yC2B4H2NQca1m6PELUSkRg==
X-CSE-MsgGUID: rtFXkfUMSm6Vr0SGhABuSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211267318"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123)
 ([10.211.93.152])
 by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 11:26:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vpWuL-000000000Lt-3rhQ;
 Mon, 09 Feb 2026 19:26:53 +0000
Date: Mon, 9 Feb 2026 20:26:10 +0100
From: kernel test robot <lkp@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [PATCH v3 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
Message-ID: <202602092035.vOm98J4x-lkp@intel.com>
References: <20260209083051.13376-2-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209083051.13376-2-Arunpravin.PaneerSelvam@amd.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: A150D11412D
X-Rspamd-Action: no action

Hi Arunpravin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9d757669b2b22cd224c334924f798393ffca537c]

url:    https://github.com/intel-lab-lkp/linux/commits/Arunpravin-Paneer-Selvam/drm-buddy-Add-KUnit-test-for-offset-aligned-allocations/20260209-163512
base:   9d757669b2b22cd224c334924f798393ffca537c
patch link:    https://lore.kernel.org/r/20260209083051.13376-2-Arunpravin.PaneerSelvam%40amd.com
patch subject: [PATCH v3 2/2] drm/buddy: Add KUnit test for offset-aligned allocations
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260209/202602092035.vOm98J4x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092035.vOm98J4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092035.vOm98J4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/tests/gpu_buddy_test.c: In function 'gpu_test_buddy_subtree_offset_alignment_stress':
>> drivers/gpu/tests/gpu_buddy_test.c:46:49: error: macro "KUNIT_ASSERT_FALSE" passed 3 arguments, but takes just 2
      46 |                            "buddy_init failed\n");
         |                                                 ^
   In file included from drivers/gpu/tests/gpu_buddy_test.c:7:
   include/kunit/test.h:1390:9: note: macro "KUNIT_ASSERT_FALSE" defined here
    1390 | #define KUNIT_ASSERT_FALSE(test, condition) \
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/tests/gpu_buddy_test.c:45:9: error: 'KUNIT_ASSERT_FALSE' undeclared (first use in this function); did you mean 'KUNIT_ASSERTION'?
      45 |         KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
         |         ^~~~~~~~~~~~~~~~~~
         |         KUNIT_ASSERTION
   drivers/gpu/tests/gpu_buddy_test.c:45:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/KUNIT_ASSERT_FALSE +46 drivers/gpu/tests/gpu_buddy_test.c

    23	
    24	static void gpu_test_buddy_subtree_offset_alignment_stress(struct kunit *test)
    25	{
    26		struct gpu_buddy_block *block;
    27		struct rb_node *node = NULL;
    28		const u64 mm_size = SZ_2M;
    29		const u64 alignments[] = {
    30			SZ_1M,
    31			SZ_512K,
    32			SZ_256K,
    33			SZ_128K,
    34			SZ_64K,
    35			SZ_32K,
    36			SZ_16K,
    37			SZ_8K,
    38		};
    39	
    40		struct list_head allocated[ARRAY_SIZE(alignments)];
    41		unsigned int i, order, max_subtree_align = 0;
    42		struct gpu_buddy mm;
    43		int ret, tree;
    44	
  > 45		KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
  > 46				   "buddy_init failed\n");
    47	
    48		for (i = 0; i < ARRAY_SIZE(allocated); i++)
    49			INIT_LIST_HEAD(&allocated[i]);
    50	
    51		/*
    52		 * Exercise subtree_max_alignment tracking by allocating blocks with descending
    53		 * alignment constraints and freeing them in reverse order. This verifies that
    54		 * free-tree augmentation correctly propagates the maximum offset alignment
    55		 * present in each subtree at every stage.
    56		 */
    57	
    58		for (i = 0; i < ARRAY_SIZE(alignments); i++) {
    59			struct gpu_buddy_block *root = NULL;
    60			unsigned int expected;
    61			u64 align;
    62	
    63			align = alignments[i];
    64			expected = ilog2(align) - 1;
    65	
    66			for (;;) {
    67				ret = gpu_buddy_alloc_blocks(&mm,
    68							     0, mm_size,
    69							     SZ_4K, align,
    70							     &allocated[i],
    71							     0);
    72				if (ret)
    73					break;
    74	
    75				block = list_last_entry(&allocated[i],
    76							struct gpu_buddy_block,
    77							link);
    78				KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (align - 1), 0ULL);
    79			}
    80	
    81			for (order = mm.max_order + 1; order-- > 0 && !root; ) {
    82				for (tree = 0; tree < 2; tree++) {
    83					node = mm.free_trees[tree][order].rb_node;
    84					if (node) {
    85						root = container_of(node,
    86								    struct gpu_buddy_block,
    87								    rb);
    88						break;
    89					}
    90				}
    91			}
    92	
    93			KUNIT_ASSERT_NOT_NULL(test, root);
    94			KUNIT_EXPECT_EQ(test, root->subtree_max_alignment, expected);
    95		}
    96	
    97		for (i = ARRAY_SIZE(alignments); i-- > 0; ) {
    98			gpu_buddy_free_list(&mm, &allocated[i], 0);
    99	
   100			for (order = 0; order <= mm.max_order; order++) {
   101				for (tree = 0; tree < 2; tree++) {
   102					node = mm.free_trees[tree][order].rb_node;
   103					if (!node)
   104						continue;
   105	
   106					block = container_of(node, struct gpu_buddy_block, rb);
   107					max_subtree_align = max(max_subtree_align, block->subtree_max_alignment);
   108				}
   109			}
   110	
   111			KUNIT_EXPECT_GE(test, max_subtree_align, ilog2(alignments[i]));
   112		}
   113	
   114		gpu_buddy_fini(&mm);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
