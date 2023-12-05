Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE48058B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E2110E04A;
	Tue,  5 Dec 2023 15:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1A910E04A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701790189; x=1733326189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZKX3Od/fhQGJTarA8+AlIzHygtGvQkHr2mLCXSakjrk=;
 b=W7dN7GqtRhKqoWlcXU9qu53a3GrwbzUQk1EVFgFfRYscYE+pn8ANGiDW
 xhl1a1bSE/Liu9w1ryPfBDtON+4UXFTyXWpQUVthKSfLyqS4dIBTQWpE9
 nCiPUE8fqvQnsYTQaXX2gbSEruD88aN2Vi7i1KHxpdf4OocrORjXIW1/n
 j8sYBkAKg/0wX0PfbLykRSQf5vj/MrXsJaz6QyaA0PR9jvOfBzvaQYOlw
 YIIVM2SpJu/a3+ZOOMxiDKKafKtPCeD9pc6rjdiyOcxjJZ8E0YAxX6ku8
 w9BRsaL7rBLtfve+SpPHGGN8SYTb3WgdqgT6wfEuFyFRsUJTw447xzeI6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460395369"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="460395369"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774663755"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="774663755"
Received: from ckochhof-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.179])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:29:46 -0800
Date: Tue, 5 Dec 2023 16:29:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: Re: [PATCH v8 8/8] drm/ttm/tests: Add test cases dependent on fence
 signaling
Message-ID: <ZW9B1TGuvynBfKOA@ashyti-mobl2.lan>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
 <e0fcb8fb08cc8ed7ce0a7f9b8a3a82741cb3cf90.1701257386.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0fcb8fb08cc8ed7ce0a7f9b8a3a82741cb3cf90.1701257386.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

...

> +static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_tt *old_tt;
> +	struct ttm_placement *placement;
> +	struct ttm_resource_manager *man;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	uint32_t flags;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	man = ttm_manager_type(priv->ttm_dev, mem_type);

For next time, I find it difficult to follow all these variables,
it's easier to read

	man = ttm_manager_type(priv->ttm_dev, TTM_PL_SYSTEM);

than

	mem_type = TTM_PL_SYSTEM;
	...
	...
	...
	man = ttm_manager_type(priv->ttm_dev, mem_type);


> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;

same here... the bo_type variable is not giving any value.

	bo->type = ttm_bo_type_device;

is way more readable. You keep doing this all the way and I need
to check everytime what's the value in the declaration :-)

I'm not going to comment on this anymore.

> +	if (params->with_ttm) {
> +		old_tt = priv->ttm_dev->funcs->ttm_tt_create(bo, 0);
> +		ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, &ctx);
> +		bo->ttm = old_tt;
> +	}
> +
> +	err = ttm_resource_alloc(bo, place, &bo->resource);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, man->usage, size);
> +
> +	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, placement);
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);

why don't you use here ttm_bo_unreserve()?

> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, bo->ttm);
> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, 0);
> +
> +	if (params->with_ttm) {
> +		flags = bo->ttm->page_flags;
> +
> +		KUNIT_ASSERT_PTR_EQ(test, bo->ttm, old_tt);
> +		KUNIT_ASSERT_FALSE(test, flags & TTM_TT_FLAG_PRIV_POPULATED);
> +		KUNIT_ASSERT_TRUE(test, flags & TTM_TT_FLAG_ZERO_ALLOC);
> +	}
> +
> +	ttm_bo_put(bo);
> +}

...

> +static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
> +{
> +	struct ttm_test_devices *priv = test->priv;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_placement *placement;
> +	struct ttm_resource_manager *man;
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	int err;
> +
> +	man = ttm_manager_type(priv->ttm_dev, mem_type);
> +	spin_lock_init(&fence_lock);

where are we using the fence_lock here?

> +	man->move = dma_fence_get_stub();
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);

Do we want to check also bo->ttm here?

> +	ttm_bo_put(bo);
> +	dma_fence_put(man->move);
> +}
> +
> +static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
> +	{
> +		.description = "Waits for GPU",
> +		.no_gpu_wait = false,
> +	},
> +	{
> +		.description = "Tries to lock straight away",
> +		.no_gpu_wait = true,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(ttm_bo_validate_wait, ttm_bo_validate_wait_cases,
> +		  ttm_bo_validate_case_desc);
> +
> +static int threaded_fence_signal(void *arg)
> +{
> +	struct dma_fence *fence = arg;
> +	int err;
> +
> +	msleep(20);
> +	err = dma_fence_signal(fence);
> +
> +	return err;

if you do here "return dma_fence_signal(fence);" you don't need
for err.

Not a binding review, though, your choice.

Andi

...
