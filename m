Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365EA4AD568
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1816C10E56F;
	Tue,  8 Feb 2022 10:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF33410E53E;
 Tue,  8 Feb 2022 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644315442; x=1675851442;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j9UFpiUGF83y12TxvdSa/flOAudt3+Yqiepae5utlss=;
 b=YcndQx2aJw3Qq/4iLm6WVzg2tVTwR4XMjup9IzPjo7z+7QkGX1KAUgrD
 WWNL2Z0bNMvIXZqENPOR0IDbyQBCxWPfBckfKihmUaQf66jbyQdXsK9Vv
 wWkO10Yef6IMRbjhVI2FFVYIqo7Av1pFl2SNSU1I95V+k0k/OqN7BQ3dW
 qaxeWKwAEQ88ITw4NXCeLcFdGD6x31PRLgw5Rmh2UPxpUgy8vxgF+JESK
 EtoExQvFbUXF9s4KxbZe9aQRMqBLZqaGasltmp8SPrMEri144NtFV25yR
 1YyVG1HSNRQ7Gs5nebrvjuS1Wgrse09GmcUTohRmJlQhuXpuxM+ltVBMy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248682574"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="248682574"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:17:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="585144601"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO [10.252.10.21])
 ([10.252.10.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:17:19 -0800
Message-ID: <1f9eff31-8c79-599b-d4dc-f36f47639dd5@intel.com>
Date: Tue, 8 Feb 2022 10:17:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/7] drm/selftests: add drm buddy pessimistic testcase
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
 <20220203133234.3350-5-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220203133234.3350-5-Arunpravin.PaneerSelvam@amd.com>
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
> page left.
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 153 ++++++++++++++++++
>   2 files changed, 154 insertions(+)
> 
> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> index 21a6bd38864f..b14f04a1de19 100644
> --- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> @@ -10,3 +10,4 @@ selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
>   selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
>   selftest(buddy_alloc_range, igt_buddy_alloc_range)
>   selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
> +selftest(buddy_alloc_pessimistic, igt_buddy_alloc_pessimistic)
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> index b193d9556fb4..e97f583ed0cd 100644
> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -314,6 +314,159 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
>   	*size = (u64)s << 12;
>   }
>   
> +static int igt_buddy_alloc_pessimistic(void *arg)
> +{
> +	u64 mm_size, size, min_page_size, start = 0;
> +	struct drm_buddy_block *block, *bn;
> +	const unsigned int max_order = 16;
> +	unsigned long flags = 0;
> +	struct drm_buddy mm;
> +	unsigned int order;
> +	LIST_HEAD(blocks);
> +	LIST_HEAD(tmp);
> +	int err;
> +
> +	/*
> +	 * Create a pot-sized mm, then allocate one of each possible
> +	 * order within. This should leave the mm with exactly one
> +	 * page left.
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
> +	for (order = 0; order < max_order; order++) {
> +		size = min_page_size = get_size(order, PAGE_SIZE);
> +		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +		if (err) {
> +			pr_info("buddy_alloc hit -ENOMEM with order=%d\n",
> +				order);
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
> +		list_add_tail(&block->link, &blocks);
> +	}
> +
> +	/* And now the last remaining block available */
> +	size = min_page_size = get_size(0, PAGE_SIZE);
> +	err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +	if (err) {
> +		pr_info("buddy_alloc hit -ENOMEM on final alloc\n");
> +		goto err;
> +	}
> +
> +	block = list_first_entry_or_null(&tmp,
> +					 struct drm_buddy_block,
> +					 link);
> +	if (!block) {
> +		pr_err("alloc_blocks has no blocks\n");
> +		err = -EINVAL;
> +		goto err;
> +	}
> +
> +	list_del(&block->link);
> +	list_add_tail(&block->link, &blocks);
> +
> +	/* Should be completely full! */
> +	for (order = max_order; order--; ) {
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
> +	block = list_last_entry(&blocks, typeof(*block), link);
> +	list_del(&block->link);
> +	drm_buddy_free_block(&mm, block);
> +
> +	/* As we free in increasing size, we make available larger blocks */
> +	order = 1;
> +	list_for_each_entry_safe(block, bn, &blocks, link) {
> +		list_del(&block->link);
> +		drm_buddy_free_block(&mm, block);
> +
> +		size = min_page_size = get_size(order, PAGE_SIZE);
> +		err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +		if (err) {
> +			pr_info("buddy_alloc (realloc) hit -ENOMEM with order=%d\n",
> +				order);
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
> +		drm_buddy_free_block(&mm, block);
> +		order++;
> +	}
> +
> +	/* To confirm, now the whole mm should be available */
> +	size = min_page_size = get_size(max_order, PAGE_SIZE);
> +	err = drm_buddy_alloc_blocks(&mm, start, mm_size, size, min_page_size, &tmp, flags);
> +	if (err) {
> +		pr_info("buddy_alloc (realloc) hit -ENOMEM with order=%d\n",
> +			max_order);
> +		goto err;
> +	}
> +
> +	block = list_first_entry_or_null(&tmp,
> +					 struct drm_buddy_block,
> +					 link);
> +	if (!block) {
> +		pr_err("alloc_blocks has no blocks\n");
> +		err = -EINVAL;
> +		goto err;
> +	}
> +
> +	list_del(&block->link);
> +	drm_buddy_free_block(&mm, block);
> +
> +	if (!err)

Always true?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +		pr_info("%s - succeeded\n", __func__);
> +
> +err:
> +	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_fini(&mm);
> +	return err;
> +}
> +
>   static int igt_buddy_alloc_optimistic(void *arg)
>   {
>   	u64 mm_size, size, min_page_size, start = 0;
