Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022A3B5B99
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD986E3F5;
	Mon, 28 Jun 2021 09:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3C16E3F2;
 Mon, 28 Jun 2021 09:48:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="293558331"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="293558331"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:48:00 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="454452410"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 02:47:58 -0700
Subject: Re: [PATCH v2 1/5] drm/i915/gem: Implement object migration
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210628090943.45690-1-thomas.hellstrom@linux.intel.com>
 <20210628090943.45690-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <bc70ed00-e5a9-e892-c8b2-3c01bd562017@linux.intel.com>
Date: Mon, 28 Jun 2021 11:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628090943.45690-2-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/28/21 11:09 AM, Thomas Hellström wrote:
> Introduce an interface to migrate objects between regions.
> This is primarily intended to migrate objects to LMEM for display and
> to SYSTEM for dma-buf, but might be reused in one form or another for
> performande-based migration.
>
> v2:
> - Verify that the memory region given as an id really exists.
>    (Reported by Matthew Auld)
> - Call i915_gem_object_{init,release}_memory_region() when switching region
>    to handle also switching region lists. (Reported by Matthew Auld)
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 96 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 +++
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  9 ++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 69 +++++++++----
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c      | 19 ++++
>   5 files changed, 188 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 07e8ff9a8aae..52a37619054d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -513,6 +513,102 @@ bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
>   	return obj->mem_flags & I915_BO_FLAG_IOMEM;
>   }
>   
> +/**
> + * i915_gem_object_can_migrate - Whether an object likely can be migrated
> + *
> + * @obj: The object to migrate
> + * @id: The region intended to migrate to
> + *
> + * Check whether the object backend supports migration to the
> + * given region. Note that pinning may affect the ability to migrate.
> + *
> + * Return: true if migration is possible, false otherwise.
> + */
> +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
> +				 enum intel_region_id id)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	unsigned int num_allowed = obj->mm.n_placements;
> +	struct intel_memory_region *mr;
> +	unsigned int i;
> +
> +	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
> +	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
> +
> +	if (!obj->ops->migrate)
> +		return false;
> +
> +	mr = i915->mm.regions[id];
> +	if (!mr)
> +		return false;


Hmm. Should probably switch order between these two, otherwise 
can_migrate will always return false on !TTM

/Thomas


