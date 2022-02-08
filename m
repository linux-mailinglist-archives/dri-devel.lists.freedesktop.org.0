Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9B4AD522
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A493C10E5B7;
	Tue,  8 Feb 2022 09:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55DD10E12F;
 Tue,  8 Feb 2022 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644313214; x=1675849214;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UBEa6bnATc1XckSSrH+Ga3bve1upbhNguIC65V8cxtY=;
 b=SHasuJMu4LaBRujQr5mno8sg6B+r6Nef137k5/EpkA7wyDdAHY3c/Lx1
 0fO4lo8qs1opYZTZR/IXytfaPa+RrvAJxXk2rpS02Z2UfYpAvxpUet3zl
 I00wGq+zMyM3sade87KlROJWNPiAffiS828kDvXSMpmMQCExEypnEJ35x
 Ex/BFT7gYy/bjOL03AE5Ov8vRYIHiIa1iCtn/ElYwZoqsJw+BuTDjBvFZ
 D954yw9Y6I8tuTdOsC0VePfSytD47ktpwJAXZsKaVWozA4smTiwI+XLTV
 X/DKlw3WqPwwj/9JgMhc6MMTSA8vEnJuq2wHWh+RIO4SnEV0mi8LdMFxQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249119116"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249119116"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:40:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="585133118"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO [10.252.10.21])
 ([10.252.10.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:40:12 -0800
Message-ID: <644ce762-cb6a-0cf1-d1e0-1e799a3405bf@intel.com>
Date: Tue, 8 Feb 2022 09:40:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/7] drm/selftests: add drm buddy alloc limit testcase
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
 <20220203133234.3350-2-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220203133234.3350-2-Arunpravin.PaneerSelvam@amd.com>
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
> add a test to check the maximum allocation limit
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   .../gpu/drm/selftests/drm_buddy_selftests.h   |  1 +
>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 60 +++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> index a4bcf3a6dfe3..ebe16162762f 100644
> --- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> @@ -7,3 +7,4 @@
>    * Tests are executed in order by igt/drm_buddy
>    */
>   selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
> +selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> index 51e4d393d22c..fd7d1a112458 100644
> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -16,6 +16,66 @@
>   
>   static unsigned int random_seed;
>   
> +static int igt_buddy_alloc_limit(void *arg)
> +{
> +	u64 end, size = U64_MAX, start = 0;
> +	struct drm_buddy_block *block;
> +	unsigned long flags = 0;
> +	LIST_HEAD(allocated);
> +	struct drm_buddy mm;
> +	int err;
> +
> +	size = end = round_down(size, 4096);
> +	err = drm_buddy_init(&mm, size, PAGE_SIZE);
> +	if (err)
> +		return err;
> +
> +	if (mm.max_order != DRM_BUDDY_MAX_ORDER) {
> +		pr_err("mm.max_order(%d) != %d\n",
> +		       mm.max_order, DRM_BUDDY_MAX_ORDER);
> +		err = -EINVAL;
> +		goto out_fini;
> +	}
> +
> +	err = drm_buddy_alloc_blocks(&mm, start, end, size,
> +				     PAGE_SIZE, &allocated, flags);
> +
> +	if (unlikely(err))
> +		goto out_free;
> +
> +	block = list_first_entry_or_null(&allocated,
> +					 struct drm_buddy_block,
> +					 link);
> +
> +	if (!block)

err = -EINVAL;

> +		goto out_fini;
> +
> +	if (drm_buddy_block_order(block) != mm.max_order) {
> +		pr_err("block order(%d) != %d\n",
> +		       drm_buddy_block_order(block), mm.max_order);
> +		err = -EINVAL;
> +		goto out_free;
> +	}
> +
> +	if (drm_buddy_block_size(&mm, block) !=
> +	    BIT_ULL(mm.max_order) * PAGE_SIZE) {
> +		pr_err("block size(%llu) != %llu\n",
> +		       drm_buddy_block_size(&mm, block),
> +		       BIT_ULL(mm.max_order) * PAGE_SIZE);
> +		err = -EINVAL;
> +		goto out_free;
> +	}
> +
> +	if (!err)

Always true AFAICT?

> +		pr_info("%s - succeeded\n", __func__);

I guess this could be made part of the run_selftests()? It looks like it 
already prints the current test, perhaps that is already enough?

With the err = -EINVAL change, feel free to add,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
> +out_free:
> +	drm_buddy_free_list(&mm, &allocated);
> +out_fini:
> +	drm_buddy_fini(&mm);
> +	return err;
> +}
> +
>   static int igt_sanitycheck(void *ignored)
>   {
>   	pr_info("%s - ok!\n", __func__);
