Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72F4AD57B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA8710E420;
	Tue,  8 Feb 2022 10:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600C110E12F;
 Tue,  8 Feb 2022 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644316020; x=1675852020;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rEASKLU2rtX4ydvat+o7X8WUxF5S7/VtABtME1yv1L4=;
 b=HESurai8bDs2SiYmZwIuun28eLeZt1Zu7kJ5p9zS5AATzc9UyRgx04mj
 IsqHbk7DGROoDIR7/s/t9VczRjWkG9dTZnQxvCnHOZaF4AwWm8NkvBXjF
 1kRZpnlN5K/b+nDwx0Jn/ByWaQCJeeFWIngZ1Sfi5qqNonEPeZMT0HtDU
 hfJsFsiCvM7KVBd768NxZfJlULnOUuBg9CK0gAnwARlmx4h6uet+FUNB8
 EPfWq1Oi9BxHYkUNCw8/0SSsUnvVlj+312jrkxiCNbnGucxQL1fiHF3bu
 S9gIkARbLF0ulod81nInMBNNhwX1uyEG1t67zGvOEheW0xUNGbE7n6Gnw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="312216878"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="312216878"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:26:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="585146748"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO [10.252.10.21])
 ([10.252.10.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:26:57 -0800
Message-ID: <38f0f5d3-2bdf-850f-90ff-688d55c29401@intel.com>
Date: Tue, 8 Feb 2022 10:26:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/7] drm/selftests: add drm buddy pathological testcase
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
 <20220203133234.3350-7-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220203133234.3350-7-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 13:32, Arunpravin wrote:
> create a pot-sized mm, then allocate one of each possible
> order within. This should leave the mm with exactly one
> page left. Free the largest block, then whittle down again.
> Eventually we will have a fully 50% fragmented mm.
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 136 ++++++++++++++++++
>   2 files changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> index 411d072cbfc5..455b756c4ae5 100644
> --- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> @@ -12,3 +12,4 @@ selftest(buddy_alloc_range, igt_buddy_alloc_range)
>   selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
>   selftest(buddy_alloc_pessimistic, igt_buddy_alloc_pessimistic)
>   selftest(buddy_alloc_smoke, igt_buddy_alloc_smoke)
> +selftest(buddy_alloc_pathological, igt_buddy_alloc_pathological)
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> index 2074e8c050a4..b2d0313a4bc5 100644
> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -338,6 +338,142 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
>   	*size = (u64)s << 12;
>   }
>   
> +static int igt_buddy_alloc_pathological(void *arg)
> +{
> +	u64 mm_size, size, min_page_size, start = 0;
> +	struct drm_buddy_block *block;
> +	const int max_order = 3;
> +	unsigned long flags = 0;
> +	int order, top, err;
> +	struct drm_buddy mm;
> +	LIST_HEAD(blocks);
> +	LIST_HEAD(holes);
> +	LIST_HEAD(tmp);
> +
> +	/*
> +	 * Create a pot-sized mm, then allocate one of each possible
> +	 * order within. This should leave the mm with exactly one
> +	 * page left. Free the largest block, then whittle down again.
> +	 * Eventually we will have a fully 50% fragmented mm.
> +	 */
> +
> +	mm_size = PAGE_SIZE << max_order;
> +	err = drm_buddy_init(&mm, mm_size, PAGE_SIZE);
> +	if (err) {
> +		pr_err("buddy_init failed(%d)\n", err);
> +		return err;
> +	}
> +	BUG_ON(mm.max_order != max_order);
> +
> +	for (top = max_order; top; top--) {
> +		/* Make room by freeing the largest allocated block */
> +		block = list_first_entry_or_null(&blocks, typeof(*block), link);
> +		if (block) {
> +			list_del(&block->link);
> +			drm_buddy_free_block(&mm, block);
> +		}
> +
> +		for (order = top; order--; ) {
> +			size = min_page_size = get_size(order, PAGE_SIZE);
> +			err = drm_buddy_alloc_blocks(&mm, start, mm_size, size,
> +						     min_page_size, &tmp, flags);
> +			if (err) {
> +				pr_info("buddy_alloc hit -ENOMEM with order=%d, top=%d\n",
> +					order, top);
> +				goto err;
> +			}
> +
> +			block = list_first_entry_or_null(&tmp,
> +							 struct drm_buddy_block,
> +							 link);
> +			if (!block) {
> +				pr_err("alloc_blocks has no blocks\n");
> +				err = -EINVAL;
> +				goto err;
> +			}
> +
> +			list_del(&block->link);
> +			list_add_tail(&block->link, &blocks);
> +		}
> +
> +		/* There should be one final page for this sub-allocation */
> +		size = min_page_size = get_size(0, PAGE_SIZE);
> +		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +		if (err) {
> +			pr_info("buddy_alloc hit -ENOME for hole\n");

ENOMEM

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +			goto err;
> +		}
> +
> +		block = list_first_entry_or_null(&tmp,
> +						 struct drm_buddy_block,
> +						 link);
> +		if (!block) {
> +			pr_err("alloc_blocks has no blocks\n");
> +			err = -EINVAL;
> +			goto err;
> +		}
> +
> +		list_del(&block->link);
> +		list_add_tail(&block->link, &holes);
> +
> +		size = min_page_size = get_size(top, PAGE_SIZE);
> +		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +		if (!err) {
> +			pr_info("buddy_alloc unexpectedly succeeded at top-order %d/%d, it should be full!",
> +				top, max_order);
> +			block = list_first_entry_or_null(&tmp,
> +							 struct drm_buddy_block,
> +							 link);
> +			if (!block) {
> +				pr_err("alloc_blocks has no blocks\n");
> +				err = -EINVAL;
> +				goto err;
> +			}
> +
> +			list_del(&block->link);
> +			list_add_tail(&block->link, &blocks);
> +			err = -EINVAL;
> +			goto err;
> +		}
> +	}
> +
> +	drm_buddy_free_list(&mm, &holes);
> +
> +	/* Nothing larger than blocks of chunk_size now available */
> +	for (order = 1; order <= max_order; order++) {
> +		size = min_page_size = get_size(order, PAGE_SIZE);
> +		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +		if (!err) {
> +			pr_info("buddy_alloc unexpectedly succeeded at order %d, it should be full!",
> +				order);
> +			block = list_first_entry_or_null(&tmp,
> +							 struct drm_buddy_block,
> +							 link);
> +			if (!block) {
> +				pr_err("alloc_blocks has no blocks\n");
> +				err = -EINVAL;
> +				goto err;
> +			}
> +
> +			list_del(&block->link);
> +			list_add_tail(&block->link, &blocks);
> +			err = -EINVAL;
> +			goto err;
> +		}
> +	}
> +
> +	if (err) {
> +		pr_info("%s - succeeded\n", __func__);
> +		err = 0;
> +	}
> +
> +err:
> +	list_splice_tail(&holes, &blocks);
> +	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_fini(&mm);
> +	return err;
> +}
> +
>   static int igt_buddy_alloc_smoke(void *arg)
>   {
>   	u64 mm_size, min_page_size, chunk_size, start = 0;
