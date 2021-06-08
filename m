Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1939F2EB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695A46EB90;
	Tue,  8 Jun 2021 09:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017A06EB90;
 Tue,  8 Jun 2021 09:53:18 +0000 (UTC)
IronPort-SDR: 28ZGHvOZQQqqiXlEvIhUhcSOdh3VoQWlwKgVlQzzSCvU273wmSagOu1ZhXswBg4AwI6ix6UJRx
 j1DXPzePtidQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="201792172"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="201792172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:53:18 -0700
IronPort-SDR: Ynh8ox5Gxes+DfPgXyNZhTpjjOy6Q/Orrw7g+Z7QUIbjcY/x2/LOsPM7Jgujhazz4vcHztA0p9
 spgrJQQRp3Gg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="447837975"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.115])
 ([10.249.254.115])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:53:16 -0700
Subject: Re: [PATCH v2 5/6] drm/i915/ttm: switch over to ttm_buddy_man
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210608084428.142676-1-matthew.auld@intel.com>
 <20210608084428.142676-6-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <8e8a5115-730e-c892-a241-c69a5662b2c7@linux.intel.com>
Date: Tue, 8 Jun 2021 11:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608084428.142676-6-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/8/21 10:44 AM, Matthew Auld wrote:
> Move back to the buddy allocator for managing device local memory, and
> restore the lost mock selftests. Keep around the range manager related
> bits, since we likely need this for managing stolen at some point. For
> stolen we also don't need to reserve anything so no need to support a
> generic reserve interface.
>
> v2(Thomas):
>      - bo->page_alignment is in page units, not bytes
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  26 +--
>   drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-----
>   drivers/gpu/drm/i915/intel_memory_region.h    |  17 --
>   drivers/gpu/drm/i915/intel_region_ttm.c       | 100 +++--------
>   .../drm/i915/selftests/intel_memory_region.c  | 170 ++++++++++++------
>   drivers/gpu/drm/i915/selftests/mock_region.c  |  15 +-
>   6 files changed, 168 insertions(+), 215 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index c612275c36c9..5bf1d1945dd6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -181,11 +181,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   
>   	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
> -	if (!i915_gem_object_evictable(obj))
> -		return false;
> -
> -	/* This isn't valid with a buddy allocator */
> -	return ttm_bo_eviction_valuable(bo, place);
> +	return i915_gem_object_evictable(obj);
>   }
>   
>   static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
> @@ -328,11 +324,15 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>   	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>   	struct ttm_resource_manager *man =
>   		ttm_manager_type(bo->bdev, res->mem_type);
> +	struct intel_memory_region *mr = obj->mm.region;
>   
>   	if (man->use_tt)
>   		return i915_ttm_tt_get_st(bo->ttm);
>   
> -	return intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
> +	if (mr->is_range_manager)

Did you look at moving this test into intel_region_ttm_node_to_st())

> +		return intel_region_ttm_node_to_st(mr, res);
> +	else
> +		return i915_sg_from_buddy_resource(res, mr->region.start);
>   }

Thanks,

Thomas


