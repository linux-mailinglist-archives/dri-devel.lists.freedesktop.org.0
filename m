Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A366423E3E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2194C6E52F;
	Wed,  6 Oct 2021 12:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4130D6E52F;
 Wed,  6 Oct 2021 12:54:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225875761"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="225875761"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 05:54:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="589742927"
Received: from ccronin-mobl.ger.corp.intel.com (HELO [10.213.247.242])
 ([10.213.247.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 05:54:26 -0700
Subject: Re: [PATCH 2/2] dma-buf: add dma_resv selftest v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
References: <20211006123609.2026-1-christian.koenig@amd.com>
 <20211006123609.2026-2-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <79a184a2-051c-580d-c444-13cbd894c7d9@linux.intel.com>
Date: Wed, 6 Oct 2021 13:54:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006123609.2026-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 06/10/2021 13:36, Christian König wrote:
> Just exercising a very minor subset of the functionality, but already
> proven useful.
> 
> v2: add missing locking
> v3: some more cleanup and consolidation, add unlocked test as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/Makefile      |   3 +-
>   drivers/dma-buf/selftests.h   |   1 +
>   drivers/dma-buf/st-dma-resv.c | 282 ++++++++++++++++++++++++++++++++++
>   3 files changed, 285 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/dma-buf/st-dma-resv.c
> 
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 1ef021273a06..511805dbeb75 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
>   dmabuf_selftests-y := \
>   	selftest.o \
>   	st-dma-fence.o \
> -	st-dma-fence-chain.o
> +	st-dma-fence-chain.o \
> +	st-dma-resv.o
>   
>   obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
> diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
> index bc8cea67bf1e..97d73aaa31da 100644
> --- a/drivers/dma-buf/selftests.h
> +++ b/drivers/dma-buf/selftests.h
> @@ -12,3 +12,4 @@
>   selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
>   selftest(dma_fence, dma_fence)
>   selftest(dma_fence_chain, dma_fence_chain)
> +selftest(dma_resv, dma_resv)
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> new file mode 100644
> index 000000000000..50d3791ccb8c
> --- /dev/null
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> +* Copyright © 2019 Intel Corporation
> +* Copyright © 2021 Advanced Micro Devices, Inc.
> +*/
> +
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/dma-resv.h>
> +
> +#include "selftest.h"
> +
> +static struct spinlock fence_lock;
> +
> +static const char *fence_name(struct dma_fence *f)
> +{
> +	return "selftest";
> +}
> +
> +static const struct dma_fence_ops fence_ops = {
> +	.get_driver_name = fence_name,
> +	.get_timeline_name = fence_name,
> +};
> +
> +static struct dma_fence *alloc_fence(void)
> +{
> +	struct dma_fence *f;
> +
> +	f = kmalloc(sizeof(*f), GFP_KERNEL);
> +	if (!f)
> +		return NULL;
> +
> +	dma_fence_init(f, &fence_ops, &fence_lock, 0, 0);
> +	return f;
> +}
> +
> +static int sanitycheck(void *arg)
> +{
> +	struct dma_resv resv;
> +	struct dma_fence *f;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_fence_signal(f);
> +	dma_fence_put(f);
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r)
> +		pr_err("Resv locking failed\n");
> +	else
> +		dma_resv_unlock(&resv);
> +	dma_resv_fini(&resv);
> +	return r;
> +}
> +
> +static int test_signaling(void *arg, bool shared)
> +{
> +	struct dma_resv resv;
> +	struct dma_fence *f;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r) {
> +		pr_err("Resv locking failed\n");
> +		goto err_free;
> +	}
> +
> +	if (shared) {
> +		r = dma_resv_reserve_shared(&resv, 1);
> +		if (r) {
> +			pr_err("Resv shared slot allocation failed\n");
> +			goto err_unlock;
> +		}
> +
> +		dma_resv_add_shared_fence(&resv, f);
> +	} else {
> +		dma_resv_add_excl_fence(&resv, f);
> +	}
> +
> +	if (dma_resv_test_signaled(&resv, shared)) {
> +		pr_err("Resv unexpectedly signaled\n");
> +		r = -EINVAL;
> +		goto err_unlock;
> +	}
> +	dma_fence_signal(f);
> +	if (!dma_resv_test_signaled(&resv, shared)) {
> +		pr_err("Resv not reporting signaled\n");
> +		r = -EINVAL;
> +		goto err_unlock;
> +	}
> +err_unlock:
> +	dma_resv_unlock(&resv);
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return r;
> +}
> +
> +static int test_excl_signaling(void *arg)
> +{
> +	return test_signaling(arg, false);
> +}
> +
> +static int test_shared_signaling(void *arg)
> +{
> +	return test_signaling(arg, true);
> +}
> +
> +static int test_for_each(void *arg, bool shared)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *f, *fence;
> +	struct dma_resv resv;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r) {
> +		pr_err("Resv locking failed\n");
> +		goto err_free;
> +	}
> +
> +	if (shared) {
> +		r = dma_resv_reserve_shared(&resv, 1);
> +		if (r) {
> +			pr_err("Resv shared slot allocation failed\n");
> +			goto err_unlock;
> +		}
> +
> +		dma_resv_add_shared_fence(&resv, f);
> +	} else {
> +		dma_resv_add_excl_fence(&resv, f);
> +	}

This block repeates three times so could be consolidated but it doesn't 
matter hugely.

> +
> +	r = -ENOENT;
> +	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
> +		if (!r) {
> +			pr_err("More than one fence found\n");
> +			r = -EINVAL;
> +			goto err_unlock;
> +		}
> +		if (f != fence) {
> +			pr_err("Unexpected fence\n");
> +			r = -EINVAL;
> +			goto err_unlock;
> +		}
> +		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
> +			pr_err("Unexpected fence usage\n");
> +			r = -EINVAL;
> +			goto err_unlock;
> +		}
> +		r = 0;
> +	}
> +	if (r) {
> +		pr_err("No fence found\n");
> +		goto err_unlock;
> +	}
> +	dma_fence_signal(f);

This would warn if the loop jumps to err_unlock but I guess there are 
bigger problems in that case.

> +err_unlock:
> +	dma_resv_unlock(&resv);
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return r;
> +}
> +
> +static int test_excl_for_each(void *arg)
> +{
> +	return test_for_each(arg, false);
> +}
> +
> +static int test_shared_for_each(void *arg)
> +{
> +	return test_for_each(arg, false);

true

With that:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> +}
> +
> +static int test_for_each_unlocked(void *arg, bool shared)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *f, *fence;
> +	struct dma_resv resv;
> +	int r;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	r = dma_resv_lock(&resv, NULL);
> +	if (r) {
> +		pr_err("Resv locking failed\n");
> +		goto err_free;
> +	}
> +
> +	if (shared) {
> +		r = dma_resv_reserve_shared(&resv, 1);
> +		if (r) {
> +			pr_err("Resv shared slot allocation failed\n");
> +			dma_resv_unlock(&resv);
> +			goto err_free;
> +		}
> +
> +		dma_resv_add_shared_fence(&resv, f);
> +	} else {
> +		dma_resv_add_excl_fence(&resv, f);
> +	}
> +	dma_resv_unlock(&resv);
> +
> +	r = -ENOENT;
> +	dma_resv_iter_begin(&cursor, &resv, shared);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (!r) {
> +			dma_resv_iter_end(&cursor);
> +			pr_err("More than one fence found\n");
> +			r = -EINVAL;
> +			goto err_free;
> +		}
> +		if (f != fence) {
> +			dma_resv_iter_end(&cursor);
> +			pr_err("Unexpected fence\n");
> +			r = -EINVAL;
> +			goto err_free;
> +		}
> +		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
> +			dma_resv_iter_end(&cursor);
> +			pr_err("Unexpected fence usage\n");
> +			r = -EINVAL;
> +			goto err_free;
> +		}
> +		r = 0;
> +	}
> +	dma_resv_iter_end(&cursor);
> +	if (r) {
> +		pr_err("No fence found\n");
> +		goto err_free;
> +	}
> +	dma_fence_signal(f);
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return r;
> +}
> +
> +static int test_excl_for_each_unlocked(void *arg)
> +{
> +	return test_for_each_unlocked(arg, false);
> +}
> +
> +static int test_shared_for_each_unlocked(void *arg)
> +{
> +	return test_for_each_unlocked(arg, true);
> +}
> +
> +int dma_resv(void)
> +{
> +	static const struct subtest tests[] = {
> +		SUBTEST(sanitycheck),
> +		SUBTEST(test_excl_signaling),
> +		SUBTEST(test_shared_signaling),
> +		SUBTEST(test_excl_for_each),
> +		SUBTEST(test_shared_for_each),
> +		SUBTEST(test_excl_for_each_unlocked),
> +		SUBTEST(test_shared_for_each_unlocked),
> +	};
> +
> +	spin_lock_init(&fence_lock);
> +	return subtests(tests, NULL);
> +}
> 
