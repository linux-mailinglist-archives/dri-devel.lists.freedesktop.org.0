Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D77842B0D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BF11133EA;
	Tue, 30 Jan 2024 17:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A6011332F;
 Tue, 30 Jan 2024 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706636005; x=1738172005;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XD9IqWzm5oFGyRCEVAHPcbBHSjTstyBuV0UUysWpTqk=;
 b=DMsktYndaiKlk1ljPj8JIVU7QOp2BazKY7V7EG78lsQxQLA6wDUvqhYd
 DjPETM6Gjg2sYJO3XvQ51ocOG4cJbFlcJwpPCZ9e9kQ43Rtf0k+XRJXcI
 JD4CI0DAlHnTOyqeRTIHP2Qk6dqR4PfCl8GJtJtiMEYm81WcaohKLfkME
 o2njl6coO/ZA7wufzQa7CgRVD0srXY1DuwPyq48yTLHpgtyBohQf7Tvhl
 4/JS+87lAm+LN2g2fTy6CqnD3nYqEF2i8B6+sN1rNGIghndDGREQPy1UN
 QYdgOXnof7Ie0b5gkEIVpoi/WFcJRJWEWAfqQuo2GBVo3sRSIlGaQ9G6f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402953048"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="402953048"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119316557"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="1119316557"
Received: from nkumi-mobl3.ger.corp.intel.com (HELO [10.213.210.105])
 ([10.213.210.105])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:26:12 -0800
Message-ID: <8ea359bb-b794-4585-9d91-fdb866e1d01e@linux.intel.com>
Date: Tue, 30 Jan 2024 16:26:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/i915: Update shared stats to use the new gem
 helper
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, daniel@ffwll.ch
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
 <20240130161235.3237122-6-alexander.deucher@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240130161235.3237122-6-alexander.deucher@amd.com>
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
> Switch to using the new gem shared memory stats helper
> rather than hand rolling it.
> 
> Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/i915/i915_drm_client.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index fa6852713bee..f58682505491 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -53,7 +53,7 @@ obj_meminfo(struct drm_i915_gem_object *obj,
>   					obj->mm.region->id : INTEL_REGION_SMEM;
>   	const u64 sz = obj->base.size;
>   
> -	if (obj->base.handle_count > 1)
> +	if (drm_gem_object_is_shared_for_memory_stats(&obj->base))
>   		stats[id].shared += sz;
>   	else
>   		stats[id].private += sz;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Good that you remembered this story, I completely forgot!

Regards,

Tvrtko
