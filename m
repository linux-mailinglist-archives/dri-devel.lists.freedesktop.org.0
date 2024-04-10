Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579A789F924
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4556410E7B2;
	Wed, 10 Apr 2024 14:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPaZascd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D50010E243
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712757695; x=1744293695;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0gendCp40kNu3Xk9QJ0F8Ilx3GVwZ7t6OLk8Q2WaxZI=;
 b=ZPaZascdbsuElpOCaQMN2rjRhy4hYNoYW6NBpzCp4FnaQApCp9n22uVR
 gdWR5rVR3KIjeAZqtF6UEclP6VzQPXhqD58pX+KPhc3vSyYuUL1+hOzN5
 LgwMqSwLPGVdBdiJEIh/+iikCU0P/Fv+EqO7JfpzTQxvK2M/EiPJDVeg1
 A3h2318OwGCSya3g+J8FW1WDCXko4xOnY2TkzqWHOdwLY2jzkOrAhsYrM
 wdqh44z+qB5B88H01ExGppLchySSOnYSvfdbz805mMTI/QXsnFvkhVJgP
 wYhRjBc7GhfhUTCxzb0gE7Jv5We/dtdTlRRQaMQHdbwE9JXtYy7xL4OoO g==;
X-CSE-ConnectionGUID: 7ld9uJmDRp2/NuQFPXlLtg==
X-CSE-MsgGUID: Rp2E6VfETGC5QxLSe1Cucw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8030752"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8030752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:01:34 -0700
X-CSE-ConnectionGUID: DH3vfYpCSz2VTjfTh0d2xQ==
X-CSE-MsgGUID: cOQHsSbRSDyy2dkp7nfcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20454411"
Received: from unknown (HELO [10.245.245.250]) ([10.245.245.250])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:01:33 -0700
Message-ID: <3fce9308-cba6-4e9e-bcc0-a41aafb3c829@intel.com>
Date: Wed, 10 Apr 2024 15:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/9] drm/ttm/tests: Test simple BO creation and
 validation
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <7c1f626ac0423ee43e0e7602a063e7f9a4e163b9.1711117249.git.karolina.stolarek@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <7c1f626ac0423ee43e0e7602a063e7f9a4e163b9.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/03/2024 14:29, Karolina Stolarek wrote:
> Add tests for ttm_bo_init_reserved() and ttm_bo_validate() that use
> sys manager. Define a simple move function in ttm_device_funcs. Expose
> destroy callback of the buffer object to make testing of
> ttm_bo_init_reserved() behaviour easier.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 207 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  14 +-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   1 +
>   4 files changed, 222 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> 
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 468535f7eed2..2e5ed63fb414 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_resource_test.o \
>           ttm_tt_test.o \
>           ttm_bo_test.o \
> +        ttm_bo_validate_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> new file mode 100644
> index 000000000000..8229bb31d747
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define BO_SIZE		SZ_4K
> +
> +struct ttm_bo_validate_test_case {
> +	const char *description;
> +	enum ttm_bo_type bo_type;
> +	bool with_ttm;
> +};
> +
> +static struct ttm_placement *ttm_placement_kunit_init(struct kunit *test,
> +						      struct ttm_place *places,
> +						      unsigned int num_places)
> +{
> +	struct ttm_placement *placement;
> +
> +	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, placement);
> +
> +	placement->num_placement = num_places;
> +	placement->placement = places;
> +
> +	return placement;
> +}
> +
> +static void ttm_bo_validate_case_desc(const struct ttm_bo_validate_test_case *t,
> +				      char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +static const struct ttm_bo_validate_test_case ttm_bo_type_cases[] = {
> +	{
> +		.description = "Buffer object for userspace",
> +		.bo_type = ttm_bo_type_device,
> +	},
> +	{
> +		.description = "Kernel buffer object",
> +		.bo_type = ttm_bo_type_kernel,
> +	},
> +	{
> +		.description = "Shared buffer object",
> +		.bo_type = ttm_bo_type_sg,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(ttm_bo_types, ttm_bo_type_cases,
> +		  ttm_bo_validate_case_desc);
> +
> +static void ttm_bo_init_reserved_sys_man(struct kunit *test)
> +{
> +	const struct ttm_bo_validate_test_case *params = test->param_value;
> +	struct ttm_test_devices *priv = test->priv;
> +	enum ttm_bo_type bo_type = params->bo_type;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_operation_ctx ctx = { };
> +	struct ttm_placement *placement;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
> +				   PAGE_SIZE, &ctx, NULL, NULL,
> +				   &dummy_ttm_bo_destroy);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
> +	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
> +	KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->destroy, &dummy_ttm_bo_destroy);
> +	KUNIT_EXPECT_EQ(test, bo->pin_count, 0);
> +	KUNIT_EXPECT_NULL(test, bo->bulk_move);
> +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
> +	KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm));
> +	KUNIT_EXPECT_NOT_NULL(test, (void *)bo->base.resv->fences);
> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> +
> +	if (bo_type != ttm_bo_type_kernel)
> +		KUNIT_EXPECT_TRUE(test,
> +				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
> +
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_init_reserved_resv(struct kunit *test)
> +{
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	struct ttm_test_devices *priv = test->priv;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_operation_ctx ctx = { };
> +	struct ttm_placement *placement;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct dma_resv resv;
> +	int err;
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> +	dma_resv_init(&resv);
> +	dma_resv_lock(&resv, NULL);
> +
> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
> +				   PAGE_SIZE, &ctx, NULL, &resv,
> +				   &dummy_ttm_bo_destroy);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
> +
> +	ttm_resource_free(bo, &bo->resource);
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_validate_invalid_placement(struct kunit *test)
> +{
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	uint32_t unknown_mem_type = TTM_PL_PRIV + 1;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_operation_ctx ctx = { };
> +	struct ttm_placement *placement;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, unknown_mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> +
> +	ttm_bo_put(bo);
> +}
> +
> +static void ttm_bo_validate_pinned(struct kunit *test)
> +{
> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
> +	struct ttm_operation_ctx ctx = { };
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	struct ttm_placement *placement;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	int err;
> +
> +	place = ttm_place_kunit_init(test, mem_type, 0);
> +	placement = ttm_placement_kunit_init(test, place, 1);
> +
> +	bo = ttm_bo_kunit_init(test, test->priv, size);
> +	bo->type = bo_type;
> +
> +	ttm_bo_reserve(bo, false, false, NULL);
> +	ttm_bo_pin(bo);
> +	err = ttm_bo_validate(bo, placement, &ctx);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_EXPECT_EQ(test, err, -EINVAL);

ttm_bo_put(bo) ?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
