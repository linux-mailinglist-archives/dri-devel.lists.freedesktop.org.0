Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F01F842B08
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A590C11332F;
	Tue, 30 Jan 2024 17:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336F511332F;
 Tue, 30 Jan 2024 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706636005; x=1738172005;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=snCyDiwAr4Ld/B2J49FUCNA5VZIMbM67o4QiNHMJ7JU=;
 b=g7n2H3wzaItEcofQIsXfCIkDw5PgHDaYJW6z6cF5feBUWvdghKefnU92
 u/v3LMk+42w7RZS3Sl1MRgq0/iOBolNeFP3ImxK2+vVvJeWtdLCJ7kodx
 mCwUO7BsBqU0/1jtZGDiTyDQJlXysB+mzwLQEphjx7nR3YQe8aIUTrfB/
 FncmujeCBvPOFYETsGH/fFfnfuJqWwBmtrdtU+8HmYCI2dEKSK8JJOpCG
 ZK/HElu6XDtlHpcVMmUVd6+YwVvaGCH/sRhVdU+D4d5YxTFdvzAElGjtc
 iIyv2nKwf8N4wKgTUgZTcfPDTwRo6XyAzD8fn357bZUiUhNsvcRB5CnJT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402952721"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="402952721"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119316351"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="1119316351"
Received: from nkumi-mobl3.ger.corp.intel.com (HELO [10.213.210.105])
 ([10.213.210.105])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:25:07 -0800
Message-ID: <cc82911b-7caf-4f7a-8ce9-8b716fed8782@linux.intel.com>
Date: Tue, 30 Jan 2024 16:25:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm: add drm_gem_object_is_shared_for_memory_stats()
 helper
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, daniel@ffwll.ch
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
 <20240130161235.3237122-3-alexander.deucher@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240130161235.3237122-3-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 30/01/2024 16:12, Alex Deucher wrote:
> Add a helper so that drm drivers can consistently report
> shared status via the fdinfo shared memory stats interface.
> 
> In addition to handle count, show buffers as shared if they
> are shared via dma-buf as well (e.g., shared with v4l or some
> other subsystem).
> 
> Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 16 ++++++++++++++++
>   include/drm/drm_gem.h     |  1 +
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 44a948b80ee1..71b5f628d828 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1506,3 +1506,19 @@ int drm_gem_evict(struct drm_gem_object *obj)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_gem_evict);
> +
> +/**
> + * drm_gem_object_is_shared_for_memory_stats - helper for shared memory stats
> + *
> + * This helper should only be used for fdinfo shared memory stats to determine
> + * if a GEM object is shared.
> + *
> + * @obj: obj in question
> + */
> +bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj)
> +{
> +	if ((obj->handle_count > 1) || obj->dma_buf)
> +		return true;
> +	return false;
> +}
> +EXPORT_SYMBOL(drm_gem_object_is_shared_for_memory_stats);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 369505447acd..86a9c696f038 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -552,6 +552,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
>   			       bool (*shrink)(struct drm_gem_object *obj));
>   
>   int drm_gem_evict(struct drm_gem_object *obj);
> +bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj);
>   
>   #ifdef CONFIG_LOCKDEP
>   /**

Not sure what the local view on static inlines, but fine nevertheless.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
