Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D48C3D08
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D6410E4FB;
	Mon, 13 May 2024 08:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZdazUu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2707910E4F2;
 Mon, 13 May 2024 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715588356; x=1747124356;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iEjFEKy/r+mb2kIZ1nH89s31JObSty0A4MqlFev1/Rc=;
 b=QZdazUu+wPlLLe0J2TXHrzA6VWlX9aRtpkWQ+VjxLwuSNuba1ybYkPrh
 43fHVDW4yf+QR1YipmTaHCyZT93bsKdz7JgI3SJCrRondRczBY0ePnjay
 ZTWSlxhOMf/JkJ4/PmagjcudukfC4Q3B+PrB3vlCnTRlfp4C15tXQcqM3
 Ufr8dzVfTBqQLt0dKIolBb2HUpgVYD3vAqtJW1Bgg6VFyG73GoxQ9Yj/H
 cz0g2CzoNO8uUxYKrBMAv1KheHNELTLvVcNGALwWP+uPeeWrDlHgMbvPR
 quTkRbiPKgvP/hAMmRRKWRs4Q4QPurRLrP7+B9/QxoD7e1u8+0QSPNC5z g==;
X-CSE-ConnectionGUID: z0fwcqPDRVeo+Za3qA3KjA==
X-CSE-MsgGUID: I5IsH/8+T9qQyqg5v/wrnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34020528"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34020528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:19:15 -0700
X-CSE-ConnectionGUID: PdlW7UMeT4Sz7lAMTJozLw==
X-CSE-MsgGUID: 4sQYF96tSBu4xdSPMI6iWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30222450"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.243])
 ([10.245.244.243])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:19:13 -0700
Message-ID: <81aa9ca4-dfbf-4e2f-b931-87c3a91cbe0a@intel.com>
Date: Mon, 13 May 2024 09:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/tests: Add a unit test for range bias
 allocation
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, daniel@ffwll.ch
References: <20240512075909.2688-1-Arunpravin.PaneerSelvam@amd.com>
 <20240512075909.2688-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240512075909.2688-2-Arunpravin.PaneerSelvam@amd.com>
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

On 12/05/2024 08:59, Arunpravin Paneer Selvam wrote:
> Allocate cleared blocks in the bias range when the DRM
> buddy's clear avail is zero. This will validate the bias
> range allocation in scenarios like system boot when no
> cleared blocks are available and exercise the fallback
> path too. The resulting blocks should always be dirty.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index e3b50e240d36..a194f271bc55 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -26,6 +26,8 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
>   	DRM_RND_STATE(prng, random_seed);
>   	unsigned int i, count, *order;
> +	struct drm_buddy_block *block;
> +	unsigned long flags;
>   	struct drm_buddy mm;
>   	LIST_HEAD(allocated);
>   
> @@ -222,6 +224,39 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   
>   	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
> +
> +	/*
> +	 * Allocate cleared blocks in the bias range when the DRM buddy's clear avail is
> +	 * zero. This will validate the bias range allocation in scenarios like system boot
> +	 * when no cleared blocks are available and exercise the fallback path too. The resulting
> +	 * blocks should always be dirty.
> +	 */
> +
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
> +			       "buddy_init failed\n");
> +	mm.clear_avail = 0;

Should already be zero, right? Maybe make this an assert instead?

> +
> +	bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), ps);
> +	bias_end = round_up(bias_start + prandom_u32_state(&prng) % (mm_size - bias_start), ps);
> +	bias_end = max(bias_end, bias_start + ps);
> +	bias_rem = bias_end - bias_start;
> +
> +	flags = DRM_BUDDY_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
> +	u32 size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);

u32 declaration should be moved to above?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
> +	KUNIT_ASSERT_FALSE_MSG(test,
> +			       drm_buddy_alloc_blocks(&mm, bias_start,
> +						      bias_end, size, ps,
> +						      &allocated,
> +						      flags),
> +			       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +			       bias_start, bias_end, size, ps);
> +
> +	list_for_each_entry(block, &allocated, link)
> +		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
> +
> +	drm_buddy_free_list(&mm, &allocated, 0);
> +	drm_buddy_fini(&mm);
>   }
>   
>   static void drm_test_buddy_alloc_clear(struct kunit *test)
