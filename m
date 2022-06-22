Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9C5545E3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E66112B97;
	Wed, 22 Jun 2022 11:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1B112B8F;
 Wed, 22 Jun 2022 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655898971; x=1687434971;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1jiO41cw5EB9KwYflgSuTIcwKXiyLAI7JCG04Edl/BM=;
 b=QB1JZ7yyrKR86c6Vd2wG0lO15Nv8KQgk52gwk7bPLUY2PUMlBJw5SCD/
 jzP+bIUiqniCC8tb0XctKX6+SoC2PuZFxQ0fIorI/IvCExu7g5MWZ6rDS
 w0Nvi0oFMhoiIL0uylr27dq7MJvMCWIL/wAL7y2boZMGedeW0gq0hOf1x
 cNcJ6Ucn9lMpkPN39yBGo1xv3NMrKmwag3GToYZtelfg73rnTGoNMpwgo
 bRY2DH1UAmIdeqpeDlB6BvQw9X1RhMjvci1+PuzUaUjxBaxUpyUy4uZrp
 JZnlURXOk2ODeVJSDXuEXNCYLjbvcG9ag00Xwa2rhZ6s3tw48mQo/cosk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="269116412"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="269116412"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:56:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="690464617"
Received: from wterliko-mobl.ger.corp.intel.com (HELO [10.249.254.201])
 ([10.249.254.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:56:00 -0700
Message-ID: <a2a439f677254260c3c4dd6369b8b478d3581889.camel@linux.intel.com>
Subject: Re: [PATCH v8 08/10] drm/i915: allow memory region creators to
 alloc and free the region
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jun 2022 13:55:58 +0200
In-Reply-To: <20220621200058.3536182-9-bob.beckett@collabora.com>
References: <20220621200058.3536182-1-bob.beckett@collabora.com>
 <20220621200058.3536182-9-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
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
Cc: kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bob,

On Tue, 2022-06-21 at 20:00 +0000, Robert Beckett wrote:
> add callbacks for alloc and free.
> this allows region creators to allocate any extra storage they may
> require.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

I think the correct solution here would be to, similar to ttm, export
an alloc_reserved() or alloc_locked() interface, that simply skips the
unlock at bo alloc time.

Then the stolen alloc wrapper could simply pin as/if needed under the
lock.

/Thomas



> ---
>  drivers/gpu/drm/i915/intel_memory_region.c | 16 +++++++++++++---
>  drivers/gpu/drm/i915/intel_memory_region.h |  2 ++
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c
> b/drivers/gpu/drm/i915/intel_memory_region.c
> index e38d2db1c3e3..3da07a712f90 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -231,7 +231,10 @@ intel_memory_region_create(struct
> drm_i915_private *i915,
>         struct intel_memory_region *mem;
>         int err;
>  
> -       mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> +       if (ops->alloc)
> +               mem = ops->alloc();
> +       else
> +               mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>         if (!mem)
>                 return ERR_PTR(-ENOMEM);
>  
> @@ -265,7 +268,10 @@ intel_memory_region_create(struct
> drm_i915_private *i915,
>         if (mem->ops->release)
>                 mem->ops->release(mem);
>  err_free:
> -       kfree(mem);
> +       if (mem->ops->free)
> +               mem->ops->free(mem);
> +       else
> +               kfree(mem);
>         return ERR_PTR(err);
>  }
>  
> @@ -288,7 +294,11 @@ void intel_memory_region_destroy(struct
> intel_memory_region *mem)
>  
>         GEM_WARN_ON(!list_empty_careful(&mem->objects.list));
>         mutex_destroy(&mem->objects.lock);
> -       if (!ret)
> +       if (ret)
> +               return;
> +       if (mem->ops->free)
> +               mem->ops->free(mem);
> +       else
>                 kfree(mem);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h
> b/drivers/gpu/drm/i915/intel_memory_region.h
> index 3d8378c1b447..048955b5429f 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -61,6 +61,8 @@ struct intel_memory_region_ops {
>                            resource_size_t size,
>                            resource_size_t page_size,
>                            unsigned int flags);
> +       struct intel_memory_region *(*alloc)(void);
> +       void (*free)(struct intel_memory_region *mem);
>  };
>  
>  struct intel_memory_region {


