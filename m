Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B344E905F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 10:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25FB10E5FC;
	Mon, 28 Mar 2022 08:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D9310E5E5;
 Mon, 28 Mar 2022 08:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648457082; x=1679993082;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cNoVVLeVCm+x4v3Nn0cJ3s8BZImyqSBriz5efXbgucs=;
 b=ZxdHbS94Lb48IVeEsv7fog3SyHFY+y+zJX/nmF2LaHA4i6+gtrvSJyl3
 4v2Hx5XfQoWZ4Cwgz4Rppv+EkiUfO9vcb4cb+znphwc5LHk3KVkZi1r8l
 jh0CJq/tfCIE4pVGibNNDzHB63xizctm4Gku004Ica/xk5UbSOZLilsRz
 YRjm+Jc/EN8wA8PjccypiHU3tUM0jCubjI0Y3PSxtGFD+m/1hCjSmDkga
 WcjaqiNQ7zcfIzDHg1NqzwuRe7rYt4KMH3o+K810GAqF8DKUMWqTSVZQo
 l+LMv/JlsMDxTHpUIgMxAqOy+z3nRUS5MvWbuI8UZXwnUVSi9jY3jgkgH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258663589"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="258663589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 01:44:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="545879520"
Received: from mphancoc-mobl.ger.corp.intel.com (HELO [10.213.232.242])
 ([10.213.232.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 01:44:40 -0700
Message-ID: <31ed28e2-9b98-19b0-5d59-d4aa562542bd@linux.intel.com>
Date: Mon, 28 Mar 2022 09:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
Content-Language: en-US
To: Francisco Jerez <currojerez@riseup.net>,
 Matt Atwood <matthew.s.atwood@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220316224943.27679-1-matthew.s.atwood@intel.com>
 <87r16pfxdo.fsf@riseup.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87r16pfxdo.fsf@riseup.net>
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


+ Joonas

On 25/03/2022 23:03, Francisco Jerez wrote:
> Matt Atwood <matthew.s.atwood@intel.com> writes:
> 
>> Newer platforms have DSS that aren't necessarily available for both
>> geometry and compute, two queries will need to exist. This introduces
>> the first, when passing a valid engine class and engine instance in the
>> flags returns a topology describing geometry.
>>
>> v2: fix white space errors
>> v3: change flags from hosting 2 8 bit numbers to holding a
>> i915_engine_class_instance struct
>>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_query.c | 68 ++++++++++++++++++++++---------
>>   include/uapi/drm/i915_drm.h       | 24 +++++++----
>>   2 files changed, 65 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 2dfbc22857a3..fcb374201edb 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -9,6 +9,7 @@
>>   #include "i915_drv.h"
>>   #include "i915_perf.h"
>>   #include "i915_query.h"
>> +#include "gt/intel_engine_user.h"
>>   #include <uapi/drm/i915_drm.h>
>>   
>>   static int copy_query_item(void *query_hdr, size_t query_sz,
>> @@ -28,36 +29,30 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
>>   	return 0;
>>   }
>>   
>> -static int query_topology_info(struct drm_i915_private *dev_priv,
>> -			       struct drm_i915_query_item *query_item)
>> +static int fill_topology_info(const struct sseu_dev_info *sseu,
>> +			      struct drm_i915_query_item *query_item,
>> +			      const u8 *subslice_mask)
>>   {
>> -	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
>>   	struct drm_i915_query_topology_info topo;
>>   	u32 slice_length, subslice_length, eu_length, total_length;
>>   	int ret;
>>   
>> -	if (query_item->flags != 0)
>> -		return -EINVAL;
>> +	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
>>   
>>   	if (sseu->max_slices == 0)
>>   		return -ENODEV;
>>   
>> -	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
>> -
>>   	slice_length = sizeof(sseu->slice_mask);
>>   	subslice_length = sseu->max_slices * sseu->ss_stride;
>>   	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
>>   	total_length = sizeof(topo) + slice_length + subslice_length +
>>   		       eu_length;
>>   
>> -	ret = copy_query_item(&topo, sizeof(topo), total_length,
>> -			      query_item);
>> +	ret = copy_query_item(&topo, sizeof(topo), total_length, query_item);
>> +
>>   	if (ret != 0)
>>   		return ret;
>>   
>> -	if (topo.flags != 0)
>> -		return -EINVAL;
>> -
>>   	memset(&topo, 0, sizeof(topo));
>>   	topo.max_slices = sseu->max_slices;
>>   	topo.max_subslices = sseu->max_subslices;
>> @@ -69,27 +64,61 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
>>   	topo.eu_stride = sseu->eu_stride;
>>   
>>   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
>> -			   &topo, sizeof(topo)))
>> +			 &topo, sizeof(topo)))
>>   		return -EFAULT;
>>   
>>   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr + sizeof(topo)),
>> -			   &sseu->slice_mask, slice_length))
>> +			 &sseu->slice_mask, slice_length))
>>   		return -EFAULT;
>>   
>>   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
>> -					   sizeof(topo) + slice_length),
>> -			   sseu->subslice_mask, subslice_length))
>> +					 sizeof(topo) + slice_length),
>> +			 subslice_mask, subslice_length))
>>   		return -EFAULT;
>>   
>>   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
>> -					   sizeof(topo) +
>> -					   slice_length + subslice_length),
>> -			   sseu->eu_mask, eu_length))
>> +					 sizeof(topo) +
>> +					 slice_length + subslice_length),
>> +			 sseu->eu_mask, eu_length))
>>   		return -EFAULT;
>>   
>>   	return total_length;
>>   }
>>   
>> +static int query_topology_info(struct drm_i915_private *dev_priv,
>> +			       struct drm_i915_query_item *query_item)
>> +{
>> +	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
>> +
>> +	if (query_item->flags != 0)
>> +		return -EINVAL;
>> +
>> +	return fill_topology_info(sseu, query_item, sseu->subslice_mask);
>> +}
>> +
>> +static int query_geometry_subslices(struct drm_i915_private *i915,
>> +				    struct drm_i915_query_item *query_item)
>> +{
>> +	const struct sseu_dev_info *sseu;
>> +	struct intel_engine_cs *engine;
>> +	struct i915_engine_class_instance classinstance;
>> +
>> +	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
>> +		return -ENODEV;
>> +
>> +	classinstance = *((struct i915_engine_class_instance *)&query_item->flags);
>> +
>> +	engine = intel_engine_lookup_user(i915, (u8) classinstance.engine_class,
>> +					  (u8) classinstance.engine_instance);
>> +
>> +	if (!engine)
>> +		return -EINVAL;
>> +
>> +	sseu = &engine->gt->info.sseu;
>> +
>> +	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>> +}
>> +
>>   static int
>>   query_engine_info(struct drm_i915_private *i915,
>>   		  struct drm_i915_query_item *query_item)
>> @@ -485,6 +514,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>   	query_engine_info,
>>   	query_perf_config,
>>   	query_memregion_info,
>> +	query_geometry_subslices,
>>   };
>>   
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 05c3642aaece..b539c83a4034 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2687,10 +2687,11 @@ struct drm_i915_perf_oa_config {
>>   struct drm_i915_query_item {
>>   	/** @query_id: The id for this query */
>>   	__u64 query_id;
>> -#define DRM_I915_QUERY_TOPOLOGY_INFO    1
>> -#define DRM_I915_QUERY_ENGINE_INFO	2
>> -#define DRM_I915_QUERY_PERF_CONFIG      3
>> -#define DRM_I915_QUERY_MEMORY_REGIONS   4
>> +#define DRM_I915_QUERY_TOPOLOGY_INFO		1
>> +#define DRM_I915_QUERY_ENGINE_INFO		2
>> +#define DRM_I915_QUERY_PERF_CONFIG		3
>> +#define DRM_I915_QUERY_MEMORY_REGIONS		4
>> +#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	5
>>   /* Must be kept compact -- no holes and well documented */
>>   
>>   	/**
>> @@ -2714,6 +2715,9 @@ struct drm_i915_query_item {
>>   	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
>>   	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
>>   	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
>> +	 *
>> +	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have a valid
>> +	 * i915_engine_class_instance struct.
> 
> To get back to our previous discussion off-list, I find this interface
> kind of confusing, since it's expecting an engine ID as argument, but it
> returns the set of subslices available to the *render* engine regardless
> of the engine class specified.  I think it would make sense to rename
> this to DRM_I915_QUERY_ENGINE_SUBSLICES or similar and have the mask
> returned be the set of subslices actually available to the engine that
> was specified (e.g. the compute subslice mask if a compute engine is
> specified, or an error if the engine specified doesn't have any
> connection to subslices).  Alternatively, if this is really only meant
> to work for the render engine, maybe the engine class should be dropped
> from "flags", only the engine instance is necessary -- I think that
> would prevent programming errors and would leave additional room in
> "flags" for future expansion.

I have asked a similar question and AFAIR Matt explained it was an arch 
level direction to have it like it is. Not sure of the reasoning.

I wouldn't take the option of implying render and only having instance 
in flags, but returning error for engines not applicable sounds good to 
me. If there isn't a good reason not to do it.

Regards,

Tvrtko
