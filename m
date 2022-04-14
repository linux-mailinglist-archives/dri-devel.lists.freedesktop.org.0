Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6236B500FD2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 16:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F093310FDDC;
	Thu, 14 Apr 2022 14:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270310FDD0;
 Thu, 14 Apr 2022 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649944813; x=1681480813;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aD5+QRaeAVBYOadKFnSr3s0EBewo7xTExRjzcuYYGVc=;
 b=c0Qt0ubluryIxFIzYeEa8e4CTMph7mHDS/4zmcurmgEEV+I1t0ea3fc4
 cjtx5xjRCHY5z/tbJgyEV2clqn7mbVZ4+SbidmeqpcMlA3EcE3KrlZ2ZR
 6SEW3rR/g1ri5vgdh4PkEQ7NG4fudEuxzVpifAedjh78G8JE0xdXuXn2p
 mkxyojlm5by+ivPVRd7BtPIK0Hn71NMAtqhpXH74uPdI/Aj7IvGYErzo3
 cGdLFVuNHorS9vmQ38RqgdNJqIFGbA1kuPE4U5VqGqeHf/6OOb/X6gPKf
 d0L5pa4Zx/ekU4crbbU47sUT27gtaycP7w9k85tKCNV1kMEwo0iZW41NC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="263111044"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="263111044"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:00:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803142043"
Received: from aviljane-mobl.ger.corp.intel.com (HELO [10.249.254.86])
 ([10.249.254.86])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 07:00:09 -0700
Message-ID: <8f25394fb9fa71eeec2f6184ea854a391b415d22.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/5] drm/i915: ttm move/clear logic fix
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 14 Apr 2022 16:00:06 +0200
In-Reply-To: <20220412151838.1298956-4-bob.beckett@collabora.com>
References: <20220412151838.1298956-1-bob.beckett@collabora.com>
 <20220412151838.1298956-4-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-12 at 15:18 +0000, Robert Beckett wrote:
> ttm managed buffers start off with system resource definitions and
> ttm_tt
> tracking structures allocated (though unpopulated).
> currently this prevents clearing of buffers on first move to desired
> placements.
> 
> The desired behaviour is to clear user allocated buffers and any
> kernel
> buffers that specifically requests it only.
> Make the logic match the desired behaviour.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 22
> +++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 9fe8132de3b2..9cf85f91edb5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2021 Intel Corporation
>   */
>  
> +#include "drm/ttm/ttm_tt.h"
>  #include <drm/ttm/ttm_bo_driver.h>
>  
>  #include "i915_deps.h"
> @@ -470,6 +471,25 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>         return fence;
>  }
>  
> +static bool
> +allow_clear(struct drm_i915_gem_object *obj, struct ttm_tt *ttm,
> struct ttm_resource *dst_mem)
> +{
> +       /* never clear stolen */
> +       if (dst_mem->mem_type == I915_PL_STOLEN)
> +               return false;
> +       /*
> +        * we want to clear user buffers and any kernel buffers
> +        * that specifically request clearing.
> +        */
> +       if (obj->flags & I915_BO_ALLOC_USER)
> +               return true;
> +
> +       if (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
> +               return true;
> +
> +       return false;
> +}
> +
>  /**
>   * i915_ttm_move - The TTM move callback used by i915.
>   * @bo: The buffer object.
> @@ -520,7 +540,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo,
> bool evict,
>                 return PTR_ERR(dst_rsgt);
>  
>         clear = !i915_ttm_cpu_maps_iomem(bo->resource) && (!ttm ||
> !ttm_tt_is_populated(ttm));
> -       if (!(clear && ttm && !(ttm->page_flags &
> TTM_TT_FLAG_ZERO_ALLOC))) {
> +       if (!clear || allow_clear(obj, ttm, dst_mem)) {
>                 struct i915_deps deps;
>  
>                 i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY |
> __GFP_NOWARN);


