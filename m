Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A7420DA4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 15:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8016E593;
	Mon,  4 Oct 2021 13:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259646E593;
 Mon,  4 Oct 2021 13:15:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311621404"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="311621404"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 06:11:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="482979941"
Received: from shearne-mobl.ger.corp.intel.com (HELO [10.213.208.122])
 ([10.213.208.122])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 06:11:45 -0700
Subject: Re: [PATCH 03/28] dma-buf: add dma_resv selftest
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-4-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3922f4b4-5b77-ab9d-a398-be4c20e88f1c@linux.intel.com>
Date: Mon, 4 Oct 2021 14:11:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001100610.2899-4-christian.koenig@amd.com>
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


On 01/10/2021 11:05, Christian König wrote:
> Just exercising a very minor subset of the functionality, but already
> proven useful.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/Makefile      |   3 +-
>   drivers/dma-buf/selftests.h   |   1 +
>   drivers/dma-buf/st-dma-resv.c | 164 ++++++++++++++++++++++++++++++++++
>   3 files changed, 167 insertions(+), 1 deletion(-)
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
> index 000000000000..ea44769d058d
> --- /dev/null
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> +* Copyright © 2019 Intel Corporation
> +*/

May want to update the year.

> +
> +//#include <linux/delay.h>
> +//#include <linux/dma-fence.h>
> +//#include <linux/kernel.h>
> +//#include <linux/kthread.h>
> +//#include <linux/sched/signal.h>

And remove these?

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
> +	struct dma_fence *f;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_fence_signal(f);
> +	dma_fence_put(f);
> +	return 0;
> +}
> +
> +static int test_excl_signaling(void *arg)
> +{
> +	struct dma_resv resv;
> +	struct dma_fence *f;
> +	int err = -EINVAL;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	dma_resv_add_excl_fence(&resv, f);
> +	if (dma_resv_test_signaled(&resv, false)) {
> +		pr_err("Resv unexpectedly signaled\n");
> +		goto err_free;
> +	}
> +	dma_fence_signal(f);
> +	if (!dma_resv_test_signaled(&resv, false)) {
> +		pr_err("Resv not reporting signaled\n");
> +		goto err_free;
> +	}
> +	err = 0;
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return err;
> +}
> +
> +static int test_shared_signaling(void *arg)
> +{
> +	struct dma_resv resv;
> +	struct dma_fence *f;
> +	int err;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	err = dma_resv_reserve_shared(&resv, 1);
> +	if (err) {
> +		pr_err("Resv shared slot allocation failed\n");
> +		goto err_free;
> +	}
> +
> +	err = -EINVAL;
> +	dma_resv_add_shared_fence(&resv, f);
> +	if (dma_resv_test_signaled(&resv, true)) {
> +		pr_err("Resv unexpectedly signaled\n");
> +		goto err_free;
> +	}
> +	dma_fence_signal(f);
> +	if (!dma_resv_test_signaled(&resv, true)) {
> +		pr_err("Resv not reporting signaled\n");
> +		goto err_free;
> +	}
> +	err = 0;
> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return err;
> +}

Task for a rainy day - consolidate the above two into parameter driven 
dma_resv setup (more fences, mixed signaling status, mixed exclusive and 
shared, different signaling mode) and common verification stages.

> +
> +static int test_excl_for_each(void *arg)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *f, *fence;
> +	struct dma_resv resv;
> +	int err;
> +
> +	f = alloc_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	dma_resv_init(&resv);
> +	dma_resv_add_excl_fence(&resv, f);
> +
> +	err = -EINVAL;
> +	dma_resv_for_each_fence(&cursor, &resv, false, fence) {

What about the dma_resv_assert_held(cursor->obj) assert? I must be 
missing something..

> +		if (f != fence) {
> +			pr_err("Unexpected fence\n");

Best set err to something, unit tests should be super robust, like if 
unexpected fence follows the expected one.

> +			goto err_free;
> +		}
> +		err = 0;
> +	}
> +	if (err) {
> +		pr_err("No fence found\n");
> +		goto err_free;
> +	}
> +	dma_fence_signal(f);
> +	err = 0;

Looks like err is already zero here, courtesy of the above "if (err) goto".

> +err_free:
> +	dma_resv_fini(&resv);
> +	dma_fence_put(f);
> +	return err;
> +}

Similar coverage extensions on a rainy day for this one - I mean testing 
more than just a single excl fence.

> +
> +int dma_resv(void)
> +{
> +	static const struct subtest tests[] = {
> +		SUBTEST(sanitycheck),
> +		SUBTEST(test_excl_signaling),
> +		SUBTEST(test_shared_signaling),
> +		SUBTEST(test_excl_for_each),
> +	};
> +
> +	spin_lock_init(&fence_lock);
> +	return subtests(tests, NULL);
> +}
> 

You acknowledge in the commit message coverage is poor but I have no 
complaints since it is better than nothing. Just a question on that 
assert and maybe some tidies.

Regards,

Tvrtko
