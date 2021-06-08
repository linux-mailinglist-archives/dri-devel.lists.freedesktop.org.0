Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A439EF41
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245C6E51A;
	Tue,  8 Jun 2021 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963A6E51A;
 Tue,  8 Jun 2021 07:11:42 +0000 (UTC)
IronPort-SDR: ynPu9Lk16PO8vMeuKxiU3fAVCcVy9fmHC5THRfDNwiOm3JiFcgl+iuRH7FRdtIgDiZ0Ql0eD2m
 +6gJRkMzlJfg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204752383"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204752383"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:11:40 -0700
IronPort-SDR: GA5PGUH9UGdAnt45nDHbcTm0DLQtpl+dI71qSS9JDb6Gm5vsY3588Wbpv5LFfGB6ZDr7DYj1gi
 Mx8SjbAEp3pg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="634979884"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:11:39 -0700
Message-ID: <eaad0953f7699a906cc590023aab9d11a93df005.camel@linux.intel.com>
Subject: Re: [PATCH 1/6] drm/i915/ttm: add ttm_buddy_man
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 09:11:37 +0200
In-Reply-To: <20210607182210.99036-2-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
> Add back our standalone i915_buddy allocator and integrate it into a
> ttm_resource_manager. This will plug into our ttm backend for
> managing
> device local-memory in the next couple of patches.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> 

Since the buddy + selftests have been part of the driver before, I
didn't review them separately, but for the TTM interface, some minor
comments below. With those fixed,

Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> new file mode 100644
> index 000000000000..d7bf37be1932
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <linux/slab.h>
> +
> +#include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "i915_ttm_buddy_manager.h"
> +
> +#include "i915_buddy.h"
> +#include "i915_gem.h"
> +
> +struct i915_ttm_buddy_manager {
> +       struct ttm_resource_manager manager;
> +       struct i915_buddy_mm mm;
> +       struct list_head reserved;
> +       struct mutex lock;
> +};
> +
> +static inline struct i915_ttm_buddy_manager *

"inline" shouldn't be needed here.

> +to_buddy_manager(struct ttm_resource_manager *man)
> +{
> +       return container_of(man, struct i915_ttm_buddy_manager,
> manager);
> +}
> +
> +static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager
> *man,
> +                                   struct ttm_buffer_object *bo,
> +                                   const struct ttm_place *place,
> +                                   struct ttm_resource **res)
> +{
> +       struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
> +       struct i915_ttm_buddy_resource *bman_res;
> +       struct i915_buddy_mm *mm = &bman->mm;
> +       unsigned long n_pages;
> +       unsigned int min_order;
> +       u64 size;
> +       int err;
> +
> +       GEM_BUG_ON(place->fpfn || place->lpfn);
> +       GEM_BUG_ON(bo->page_alignment < mm->chunk_size);
> +
> +       bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
> +       if (!bman_res)
> +               return -ENOMEM;
> +
> +       ttm_resource_init(bo, place, &bman_res->base);
> +       INIT_LIST_HEAD(&bman_res->blocks);
> +       bman_res->mm = mm;
> +
> +       GEM_BUG_ON(!bman_res->base.num_pages);
> +       size = bman_res->base.num_pages << PAGE_SHIFT;
> +
> +       min_order = ilog2(bo->page_alignment) - ilog2(mm-
> >chunk_size);
> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +               size = roundup_pow_of_two(size);
> +               min_order = ilog2(size) - ilog2(mm->chunk_size);
> +       }
> +
> +       if (size > mm->size) {
> +               err = -E2BIG;
> +               goto err_free_res;
> +       }
> +
> +       n_pages = size >> ilog2(mm->chunk_size);
> +
> +       do {
> +               struct i915_buddy_block *block;
> +               unsigned int order;
> +
> +               order = fls(n_pages) - 1;
> +               GEM_BUG_ON(order > mm->max_order);
> +               GEM_BUG_ON(order < min_order);
> +
> +               do {
> +                       mutex_lock(&bman->lock);
> +                       block = i915_buddy_alloc(mm, order);
> +                       mutex_unlock(&bman->lock);
> +                       if (!IS_ERR(block))
> +                               break;
> +
> +                       if (order-- == min_order) {
> +                               err = -ENXIO;

IIRC, TTM relies on -ENOSPC to retry with evictions.

> +                               goto err_free_blocks;
> +                       }
> +               } while (1);
> +
> +               n_pages -= BIT(order);
> +
> +               list_add_tail(&block->link, &bman_res->blocks);
> +
> +               if (!n_pages)
> +                       break;
> +       } while (1);
> +
> +       *res = &bman_res->base;
> +       return 0;
> +
> +err_free_blocks:
> +       mutex_lock(&bman->lock);
> +       i915_buddy_free_list(mm, &bman_res->blocks);
> +       mutex_unlock(&bman->lock);
> +err_free_res:
> +       kfree(bman_res);
> +       return err;
> +}
> +

/Thomas


