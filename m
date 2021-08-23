Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFE3F462F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 09:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FDE89944;
	Mon, 23 Aug 2021 07:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8F889944
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 07:56:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="204252420"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="204252420"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 00:56:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="507179946"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 00:56:28 -0700
Message-ID: <eb38fc76abf1a30d272ee76f6cb3ba2324297c25.camel@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/ttm: add a weak BO reference to the resource v2
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 23 Aug 2021 09:56:25 +0200
In-Reply-To: <20210719115145.1260-1-christian.koenig@amd.com>
References: <20210719115145.1260-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

Still working through some backlog and this series appears to have
slipped under the radar.

Still I think a cover letter would benefit reviewers... 

On Mon, 2021-07-19 at 13:51 +0200, Christian König wrote:
> Keep track for which BO a resource was allocated.
> This is necessary to move the LRU handling into the resources.

So is this needed, when looking up a resource from the LRU, to find the
bo the resource is currently attached to?

> 
> A bit problematic is i915 since it tries to use the resource
> interface without a BO which is illegal from the conceptional
s/conceptional/conceptual/ ? 
> point of view.
> 
> v2: Document that this is a weak reference and add a workaround for
> i915

Hmm. As pointed out in my previous review the weak pointer should
really be cleared under a lookup lock to avoid use-after-free bugs.
I don't see that happening here. Doesn't this series aim for a future
direction of early destruction of bos and ditching the ghost objects?
In that case IMHO you need to allow for a NULL bo pointer and any bo
information needed at resource destruction needs to be copied on the
resource... (That would also ofc help with the i915 problem).

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/i915/intel_region_ttm.c | 5 +++++
>  drivers/gpu/drm/ttm/ttm_bo_util.c       | 7 +++++--
>  drivers/gpu/drm/ttm/ttm_resource.c      | 1 +
>  include/drm/ttm/ttm_resource.h          | 2 ++
>  4 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
> b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 27fe0668d094..980b10a7debf 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -88,6 +88,7 @@ intel_region_ttm_node_reserve(struct
> intel_memory_region *mem,
>         place.fpfn = offset >> PAGE_SHIFT;
>         place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
>         mock_bo.base.size = size;
> +       mock_bo.bdev = &mem->i915->bdev;
>         ret = man->func->alloc(man, &mock_bo, &place, &res);
>         if (ret == -ENOSPC)
>                 ret = -ENXIO;
> @@ -104,7 +105,11 @@ void intel_region_ttm_node_free(struct
> intel_memory_region *mem,
>                                 struct ttm_resource *res)
>  {
>         struct ttm_resource_manager *man = mem->region_private;
> +       struct ttm_buffer_object mock_bo = {};
>  
> +       mock_bo.base.size = res->num_pages * PAGE_SIZE;
> +       mock_bo.bdev = &mem->i915->bdev;
> +       res->bo = &mock_bo;
>         man->func->free(man, res);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 2f57f824e6db..a1570aa8ff56 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -239,6 +239,11 @@ static int ttm_buffer_object_transfer(struct
> ttm_buffer_object *bo,
>         if (bo->type != ttm_bo_type_sg)
>                 fbo->base.base.resv = &fbo->base.base._resv;
>  
> +       if (fbo->base.resource) {
> +               fbo->base.resource->bo = &fbo->base;

This is scary: What if someone else (LRU lookup) just dereferenced the
previous resource->bo pointer? I think this needs proper weak reference
locking and lifetime handling, as mentioned above.


> +               bo->resource = NULL;
> +       }
> +

/Thomas


