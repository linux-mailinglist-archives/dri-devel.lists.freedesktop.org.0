Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B914A71BC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61BC10E60E;
	Wed,  2 Feb 2022 13:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F7310E5E9;
 Wed,  2 Feb 2022 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643809322; x=1675345322;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2R5zdgk9owJEvrD88P/CcFW/eHcnWAuIybLSsGSXGt8=;
 b=AAotsle8PgYvjCKlF1B8G1Q5xvmLt0tXg31pW/XO86VMmplnPp+8Ig4x
 3mx4XBmVZ777kIN+lY4zXH6ilwrla0Tuca2zOjUqDuu0NKE9nqE7MQu1p
 mozNLwVW8UaNejl+25vXRInSvDnmOtSNCV0YW8WEVXBTp0wLNoxi9ueeH
 +p2pDWM34hYgb1jesxGkxs1nCL4fcXYLYlDRejG084LiQCVfj+sFLU6ln
 uQCAKg67XyCB25szADtF23NpasSF1wWoPBfPby+TPBrxozfQA4NI0Mj2d
 PncjXh7oVjEGxcEPZ81x8atDxNOZBQc71JVQ0KU4NsAbd1Ne7gMG+4TVW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228570189"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="228570189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:42:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="583435536"
Received: from xwan118-mobl1.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:42:00 -0800
Message-ID: <cb6b3aae-f6f3-855d-fcaa-35dbb2651030@linux.intel.com>
Date: Wed, 2 Feb 2022 14:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 12/20] drm/i915/ttm: make eviction mappable aware
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-13-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-13-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/22 16:21, Matthew Auld wrote:
> If we need to make room for some some mappable object, then we should
> only victimize objects that have one or pages that occupy the visible
> portion of LMEM. Let's also create a new priority hint for objects that
> are placed in mappable memory, where we know that CPU access was
> requested, that way we hopefully victimize these last.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 65 ++++++++++++++++++++++++-
>   1 file changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e4cd6ccf5ab1..8376e4c3d290 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -5,8 +5,10 @@
>   
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
> +#include <drm/drm_buddy.h>
>   
>   #include "i915_drv.h"
> +#include "i915_ttm_buddy_manager.h"
>   #include "intel_memory_region.h"
>   #include "intel_region_ttm.h"
>   
> @@ -20,6 +22,7 @@
>   #define I915_TTM_PRIO_PURGE     0
>   #define I915_TTM_PRIO_NO_PAGES  1
>   #define I915_TTM_PRIO_HAS_PAGES 2
> +#define I915_TTM_PRIO_NEEDS_CPU_ACCESS 3
>   
>   /*
>    * Size of struct ttm_place vector in on-stack struct ttm_placement allocs
> @@ -337,6 +340,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>   				       const struct ttm_place *place)
>   {
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	struct ttm_resource *res = bo->resource;
>   
>   	if (!obj)
>   		return false;
> @@ -350,7 +354,48 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>   		return false;
>   
>   	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
> -	return i915_gem_object_evictable(obj);
> +	if (!i915_gem_object_evictable(obj))
> +		return false;
> +
> +	switch (res->mem_type) {
> +	case TTM_PL_PRIV: {

We should use the I915_ placements for better readability.

Otherwise Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


