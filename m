Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44AD4EFCBC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 00:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11C010E102;
	Fri,  1 Apr 2022 22:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F0810E102;
 Fri,  1 Apr 2022 22:20:44 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4KVZPS1YMxzDsSG;
 Fri,  1 Apr 2022 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1648851644; bh=NJKfly3mTb0uO1EBNtX2kPcQp1PRa3QPBMj5s3L/C/Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=T07NhPkw3/PLIhteRoupt2iggia8dvuvzUMSAJ+IgXsqaOS5SE2wJy+DG/Xlm6tQ/
 jX324aliR5dwlxcPWB1LJIS+PFwdeoMzi8A1OTHXau2d6JuBqpwzoZ8eCH7X2HYgC5
 ge1B6E8rKOs9VvJUJRnHM0cCGF1Pp8UaWdluJmWA=
X-Riseup-User-ID: 2BA4F5DA7CB4A4E801D8CCD2BCC4BB7FCA7BB6BD28DEA8A21978F9938C4B0DBF
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4KVZPR374lz1yQc;
 Fri,  1 Apr 2022 15:20:43 -0700 (PDT)
From: Francisco Jerez <currojerez@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v4 RFC] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
In-Reply-To: <YkX7hTrEZN53MN+z@phenom.ffwll.local>
References: <20220330215311.21849-1-matthew.s.atwood@intel.com>
 <YkX7hTrEZN53MN+z@phenom.ffwll.local>
Date: Fri, 01 Apr 2022 15:19:26 -0700
Message-ID: <87czi0fnv5.fsf@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, vrtko.ursulin@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, Mar 30, 2022 at 02:53:11PM -0700, Matt Atwood wrote:
>> Newer platforms have DSS that aren't necessarily available for both
>> geometry and compute, two queries will need to exist. This introduces
>> the first, when passing a valid engine class and engine instance in the
>> flags returns a topology describing geometry.
>> 
>> v2: fix white space errors
>> v3: change flags from hosting 2 8 bit numbers to holding a
>> i915_engine_class_instance struct
>> v4: add error if non rcs engine passed.
>> 
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
>> 
>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_query.c | 71 ++++++++++++++++++++++---------
>>  include/uapi/drm/i915_drm.h       | 26 +++++++----
>>  2 files changed, 69 insertions(+), 28 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index b5ca00cb6cf6..32be84c95956 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -9,6 +9,7 @@
>>  #include "i915_drv.h"
>>  #include "i915_perf.h"
>>  #include "i915_query.h"
>> +#include "gt/intel_engine_user.h"
>>  #include <uapi/drm/i915_drm.h>
>>  
>>  static int copy_query_item(void *query_hdr, size_t query_sz,
>> @@ -28,36 +29,30 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
>>  	return 0;
>>  }
>>  
>> -static int query_topology_info(struct drm_i915_private *dev_priv,
>> -			       struct drm_i915_query_item *query_item)
>> +static int fill_topology_info(const struct sseu_dev_info *sseu,
>> +			      struct drm_i915_query_item *query_item,
>> +			      const u8 *subslice_mask)
>>  {
>> -	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
>>  	struct drm_i915_query_topology_info topo;
>>  	u32 slice_length, subslice_length, eu_length, total_length;
>>  	int ret;
>>  
>> -	if (query_item->flags != 0)
>> -		return -EINVAL;
>> +	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
>>  
>>  	if (sseu->max_slices == 0)
>>  		return -ENODEV;
>>  
>> -	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
>> -
>>  	slice_length = sizeof(sseu->slice_mask);
>>  	subslice_length = sseu->max_slices * sseu->ss_stride;
>>  	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
>>  	total_length = sizeof(topo) + slice_length + subslice_length +
>>  		       eu_length;
>>  
>> -	ret = copy_query_item(&topo, sizeof(topo), total_length,
>> -			      query_item);
>> +	ret = copy_query_item(&topo, sizeof(topo), total_length, query_item);
>> +
>>  	if (ret != 0)
>>  		return ret;
>>  
>> -	if (topo.flags != 0)
>> -		return -EINVAL;
>> -
>>  	memset(&topo, 0, sizeof(topo));
>>  	topo.max_slices = sseu->max_slices;
>>  	topo.max_subslices = sseu->max_subslices;
>> @@ -69,27 +64,64 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
>>  	topo.eu_stride = sseu->eu_stride;
>>  
>>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
>> -			   &topo, sizeof(topo)))
>> +			 &topo, sizeof(topo)))
>>  		return -EFAULT;
>>  
>>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr + sizeof(topo)),
>> -			   &sseu->slice_mask, slice_length))
>> +			 &sseu->slice_mask, slice_length))
>>  		return -EFAULT;
>>  
>>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
>> -					   sizeof(topo) + slice_length),
>> -			   sseu->subslice_mask, subslice_length))
>> +					 sizeof(topo) + slice_length),
>> +			 subslice_mask, subslice_length))
>>  		return -EFAULT;
>>  
>>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
>> -					   sizeof(topo) +
>> -					   slice_length + subslice_length),
>> -			   sseu->eu_mask, eu_length))
>> +					 sizeof(topo) +
>> +					 slice_length + subslice_length),
>> +			 sseu->eu_mask, eu_length))
>>  		return -EFAULT;
>>  
>>  	return total_length;
>>  }
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
>> +	if (engine->class != RENDER_CLASS)
>> +		return -EINVAL;
>> +
>> +	sseu = &engine->gt->info.sseu;
>> +
>> +	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>> +}
>> +
>>  static int
>>  query_engine_info(struct drm_i915_private *i915,
>>  		  struct drm_i915_query_item *query_item)
>> @@ -508,6 +540,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>  	query_perf_config,
>>  	query_memregion_info,
>>  	query_hwconfig_blob,
>> +	query_geometry_subslices,
>>  };
>>  
>>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 9ab021c4d632..c2a18afcf791 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2690,11 +2690,12 @@ struct drm_i915_perf_oa_config {
>>  struct drm_i915_query_item {
>>  	/** @query_id: The id for this query */
>>  	__u64 query_id;
>> -#define DRM_I915_QUERY_TOPOLOGY_INFO    1
>> -#define DRM_I915_QUERY_ENGINE_INFO	2
>> -#define DRM_I915_QUERY_PERF_CONFIG      3
>> -#define DRM_I915_QUERY_MEMORY_REGIONS   4
>> -#define DRM_I915_QUERY_HWCONFIG_BLOB	5
>> +#define DRM_I915_QUERY_TOPOLOGY_INFO		1
>> +#define DRM_I915_QUERY_ENGINE_INFO		2
>> +#define DRM_I915_QUERY_PERF_CONFIG		3
>> +#define DRM_I915_QUERY_MEMORY_REGIONS		4
>> +#define DRM_I915_QUERY_HWCONFIG_BLOB		5
>> +#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
>>  /* Must be kept compact -- no holes and well documented */
>>  
>>  	/**
>> @@ -2718,6 +2719,9 @@ struct drm_i915_query_item {
>>  	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
>>  	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
>>  	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
>> +	 *
>> +	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have a valid
>> +	 * i915_engine_class_instance struct.

It would also be worth adding to the documentation that the specified engine
must be a render engine instance.

>>  	 */
>>  	__u32 flags;
>>  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
>> @@ -2776,16 +2780,20 @@ struct drm_i915_query {
>>  };
>>  
>>  /*
>
> Can we please include this in the kerneldoc, and also make sure that the
> queries are nicely all listed somewhere and link to each respective
> information structure?
>
> Most of the doc for queries is there now, but the presentation and linking
> lacks still a lot.
> -Daniel
>
>> - * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO :
>> + * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO,
>> + * DRM_I915_QUERY_GEOMETRY_SUBSLICE:
>>   *
>>   * data: contains the 3 pieces of information :
>>   *
>> - * - the slice mask with one bit per slice telling whether a slice is
>> - *   available. The availability of slice X can be queried with the following
>> - *   formula :
>> + * - For DRM_I915_QUERY_TOPOLOGY_INFO the slice mask with one bit per slice
>> + *   telling whether a slice is available. The availability of slice X can be
>> + *   queried with the following formula :
>>   *
>>   *           (data[X / 8] >> (X % 8)) & 1
>>   *
>> + * - For DRM_I915_QUERY_GEOMETRY_SUBSLICES Slices are equal to 1 and this field
>> + *   is not used.
>> + *
>>   * - the subslice mask for each slice with one bit per subslice telling
>>   *   whether a subslice is available. Gen12 has dual-subslices, which are
>>   *   similar to two gen11 subslices. For gen12, this array represents dual-
>> -- 
>> 2.21.3
>> 
>
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
