Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E03F144D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889056E943;
	Thu, 19 Aug 2021 07:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122036E80B;
 Thu, 19 Aug 2021 07:25:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="196760489"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="196760489"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 00:25:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="442157270"
Received: from mdziuba-mobl.ger.corp.intel.com (HELO [10.249.254.196])
 ([10.249.254.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 00:25:28 -0700
Message-ID: <532a00f09d17f2e95ef970a9f5b9d273c0384d39.camel@linux.intel.com>
Subject: Re: [PATCH] drm/i915/ttm: ensure we release the intel_memory_region
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 19 Aug 2021 09:25:26 +0200
In-Reply-To: <20210818171203.237687-1-matthew.auld@intel.com>
References: <20210818171203.237687-1-matthew.auld@intel.com>
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

On Wed, 2021-08-18 at 18:12 +0100, Matthew Auld wrote:
> If the ttm_bo_init_reserved() call fails ensure we also release the
> region, otherwise we leak the reference, or worse hit some uaf, when
> we
> start using the objects.list. Also remove the make_unshrinkable call
> here, which doesn't do anything.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 771eb2963123..2e8cdcd5e4f7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -909,7 +909,6 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>         drm_gem_private_object_init(&i915->drm, &obj->base, size);
>         i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class,
> flags);
>         i915_gem_object_init_memory_region(obj, mem);
> -       i915_gem_object_make_unshrinkable(obj);
>         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL |
> __GFP_NOWARN);
>         mutex_init(&obj->ttm.get_io_page.lock);
>         bo_type = (obj->flags & I915_BO_ALLOC_USER) ?
> ttm_bo_type_device :
> @@ -932,7 +931,7 @@ int __i915_gem_ttm_object_init(struct
> intel_memory_region *mem,
>                                    page_size >> PAGE_SHIFT,
>                                    &ctx, NULL, NULL,
> i915_ttm_bo_destroy);
>         if (ret)
> -               return i915_ttm_err_to_gem(ret);
> +               goto err_release_mr;

IIRC when ttm_object_init_reserved fails, it will call ttm_bo_put()
which will eventually end up in i915_ttm_bo_destroy() which will do the
right thing?

/Thomas


