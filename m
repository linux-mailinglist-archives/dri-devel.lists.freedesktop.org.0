Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4864AD574
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6897510E619;
	Tue,  8 Feb 2022 10:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D8310E5EC;
 Tue,  8 Feb 2022 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644315775; x=1675851775;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JCXABi+tpibiwShYKgzJVnhKmDF39ceB4X9aawwqezE=;
 b=j2I5bMvKWs8UOzsvW5CXSQAc+a8m9R3z/R9rq77YhhV6W0jVcHaM0mdf
 BIZjNFXGQvZaDxIi4A84hzMetMo/wNGTyXGVxcjRuPC1g1sVBzlMgQ5bq
 LOorLQK9rYGcnQZW2Wz8j0jwunRQiEWULwUX5NffoO5UHQZevV8wUBotU
 cP1+q+Ugm9kw8GUBkl3H0Hy1fp+R03pucb3xKkW7DbRRFVi9ZGiZbRRDt
 xm8faObZo1sluyldVnubZygz2a1L2AYaosKDb61O6xYg97B97z96MY1HQ
 St8WXENxggyyfMe8zNB/oN7BQe6EV38rk3UPuL9KhE/mAq8sjC1uFwjtd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248868134"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="248868134"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:22:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="585145777"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO [10.252.10.21])
 ([10.252.10.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:22:52 -0800
Message-ID: <5cf820ed-1a15-15bc-f4b1-6635773d2264@intel.com>
Date: Tue, 8 Feb 2022 10:22:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/7] drm/selftests: add drm buddy smoke testcase
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
 <20220203133234.3350-6-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220203133234.3350-6-Arunpravin.PaneerSelvam@amd.com>
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
> - add a test to ascertain that the critical functionalities
>    of the program is working fine
> - add a timeout helper function
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   .../gpu/drm/selftests/drm_buddy_selftests.h   |   1 +
>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 143 ++++++++++++++++++
>   2 files changed, 144 insertions(+)
> 
> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> index b14f04a1de19..411d072cbfc5 100644
> --- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
> @@ -11,3 +11,4 @@ selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
>   selftest(buddy_alloc_range, igt_buddy_alloc_range)
>   selftest(buddy_alloc_optimistic, igt_buddy_alloc_optimistic)
>   selftest(buddy_alloc_pessimistic, igt_buddy_alloc_pessimistic)
> +selftest(buddy_alloc_smoke, igt_buddy_alloc_smoke)
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> index e97f583ed0cd..2074e8c050a4 100644
> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/module.h>
>   #include <linux/prime_numbers.h>
> +#include <linux/sched/signal.h>
>   
>   #include <drm/drm_buddy.h>
>   
> @@ -15,6 +16,9 @@
>   #define TESTS "drm_buddy_selftests.h"
>   #include "drm_selftest.h"
>   
> +#define IGT_TIMEOUT(name__) \
> +	unsigned long name__ = jiffies + MAX_SCHEDULE_TIMEOUT
> +
>   static unsigned int random_seed;
>   
>   static inline u64 get_size(int order, u64 chunk_size)
> @@ -22,6 +26,26 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +__printf(2, 3)
> +static bool __igt_timeout(unsigned long timeout, const char *fmt, ...)
> +{
> +	va_list va;
> +
> +	if (!signal_pending(current)) {
> +		cond_resched();
> +		if (time_before(jiffies, timeout))
> +			return false;
> +	}
> +
> +	if (fmt) {
> +		va_start(va, fmt);
> +		vprintk(fmt, va);
> +		va_end(va);
> +	}
> +
> +	return true;
> +}
> +
>   static inline const char *yesno(bool v)
>   {
>   	return v ? "yes" : "no";
> @@ -314,6 +338,125 @@ static void igt_mm_config(u64 *size, u64 *chunk_size)
>   	*size = (u64)s << 12;
>   }
>   
> +static int igt_buddy_alloc_smoke(void *arg)
> +{
> +	u64 mm_size, min_page_size, chunk_size, start = 0;
> +	unsigned long flags = 0;
> +	struct drm_buddy mm;
> +	int *order;
> +	int err, i;
> +
> +	DRM_RND_STATE(prng, random_seed);
> +	IGT_TIMEOUT(end_time);
> +
> +	igt_mm_config(&mm_size, &chunk_size);
> +
> +	err = drm_buddy_init(&mm, mm_size, chunk_size);
> +	if (err) {
> +		pr_err("buddy_init failed(%d)\n", err);
> +		return err;
> +	}
> +
> +	order = drm_random_order(mm.max_order + 1, &prng);
> +	if (!order)
> +		goto out_fini;
> +
> +	for (i = 0; i <= mm.max_order; ++i) {
> +		struct drm_buddy_block *block;
> +		int max_order = order[i];
> +		bool timeout = false;
> +		LIST_HEAD(blocks);
> +		u64 total, size;
> +		LIST_HEAD(tmp);
> +		int order;
> +
> +		err = igt_check_mm(&mm);
> +		if (err) {
> +			pr_err("pre-mm check failed, abort\n");
> +			break;
> +		}
> +
> +		order = max_order;
> +		total = 0;
> +
> +		do {
> +retry:
> +			size = min_page_size = get_size(order, chunk_size);
> +			err = drm_buddy_alloc_blocks(&mm, start, mm_size, size,
> +						     min_page_size, &tmp, flags);
> +			if (err) {
> +				if (err == -ENOMEM) {
> +					pr_info("buddy_alloc hit -ENOMEM with order=%d\n",
> +						order);
> +				} else {
> +					if (order--) {
> +						err = 0;
> +						goto retry;
> +					}
> +
> +					pr_err("buddy_alloc with order=%d failed(%d)\n",
> +					       order, err);
> +				}
> +
> +				break;
> +			}
> +
> +			block = list_first_entry_or_null(&tmp,
> +							 struct drm_buddy_block,
> +							 link);
> +			if (!block) {
> +				pr_err("alloc_blocks has no blocks\n");
> +				err = -EINVAL;
> +				break;
> +			}
> +
> +			list_del(&block->link);
> +			list_add_tail(&block->link, &blocks);

Could just make this list_move_tail()? Elsewhere also.

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
> +			if (drm_buddy_block_order(block) != order) {
> +				pr_err("buddy_alloc order mismatch\n");
> +				err = -EINVAL;
> +				break;
> +			}
> +
> +			total += drm_buddy_block_size(&mm, block);
> +
> +			if (__igt_timeout(end_time, NULL)) {
> +				timeout = true;
> +				break;
> +			}
> +		} while (total < mm.size);
> +
> +		if (!err)
> +			err = igt_check_blocks(&mm, &blocks, total, false);
> +
> +		drm_buddy_free_list(&mm, &blocks);
> +
> +		if (!err) {
> +			err = igt_check_mm(&mm);
> +			if (err)
> +				pr_err("post-mm check failed\n");
> +		}
> +
> +		if (err || timeout)
> +			break;
> +
> +		cond_resched();
> +	}
> +
> +	if (err == -ENOMEM)
> +		err = 0;
> +
> +	if (!err)
> +		pr_info("%s - succeeded\n", __func__);
> +
> +	kfree(order);
> +out_fini:
> +	drm_buddy_fini(&mm);
> +
> +	return err;
> +}
> +
>   static int igt_buddy_alloc_pessimistic(void *arg)
>   {
>   	u64 mm_size, size, min_page_size, start = 0;
