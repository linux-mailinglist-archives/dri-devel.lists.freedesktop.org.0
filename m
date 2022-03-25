Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368AB4E7B1E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 00:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86E10E089;
	Fri, 25 Mar 2022 23:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Fri, 25 Mar 2022 23:11:48 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5FD10E089;
 Fri, 25 Mar 2022 23:11:48 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4KQHjR4pWBzDrBf;
 Fri, 25 Mar 2022 16:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1648249483; bh=1ADmDFdbPsdYVW6qYOfhtQrEb1D9HfJfsAArL10rTVw=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=oj6xvUDPcNiwexfhGJMbdbL4upyWkdG9rGW74fziW0dX7HK+J1H/1nqR59zSC9fCH
 +RhjHhIV/ykQIY+tgBxO+uFEsviRajGbeSlmg7tbP3GOAayT6cmx0lmVnpwbtpxkf8
 mLOzWwd5sg6kBgV8OeJWtYZJi+raOvnV52+Kl5DU=
X-Riseup-User-ID: BF08C3E441DAAB60383D983C8E986ABF9B29D9375AD2F70AE271A83C87C62E0C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KQHjR32NHz5vLn;
 Fri, 25 Mar 2022 16:04:43 -0700 (PDT)
From: Francisco Jerez <currojerez@riseup.net>
To: Matt Atwood <matthew.s.atwood@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
In-Reply-To: <20220316224943.27679-1-matthew.s.atwood@intel.com>
References: <20220316224943.27679-1-matthew.s.atwood@intel.com>
Date: Fri, 25 Mar 2022 16:03:31 -0700
Message-ID: <87r16pfxdo.fsf@riseup.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Matt Atwood <matthew.s.atwood@intel.com> writes:

> Newer platforms have DSS that aren't necessarily available for both
> geometry and compute, two queries will need to exist. This introduces
> the first, when passing a valid engine class and engine instance in the
> flags returns a topology describing geometry.
>
> v2: fix white space errors
> v3: change flags from hosting 2 8 bit numbers to holding a
> i915_engine_class_instance struct
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c | 68 ++++++++++++++++++++++---------
>  include/uapi/drm/i915_drm.h       | 24 +++++++----
>  2 files changed, 65 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 2dfbc22857a3..fcb374201edb 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -9,6 +9,7 @@
>  #include "i915_drv.h"
>  #include "i915_perf.h"
>  #include "i915_query.h"
> +#include "gt/intel_engine_user.h"
>  #include <uapi/drm/i915_drm.h>
>  
>  static int copy_query_item(void *query_hdr, size_t query_sz,
> @@ -28,36 +29,30 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
>  	return 0;
>  }
>  
> -static int query_topology_info(struct drm_i915_private *dev_priv,
> -			       struct drm_i915_query_item *query_item)
> +static int fill_topology_info(const struct sseu_dev_info *sseu,
> +			      struct drm_i915_query_item *query_item,
> +			      const u8 *subslice_mask)
>  {
> -	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
>  	struct drm_i915_query_topology_info topo;
>  	u32 slice_length, subslice_length, eu_length, total_length;
>  	int ret;
>  
> -	if (query_item->flags != 0)
> -		return -EINVAL;
> +	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
>  
>  	if (sseu->max_slices == 0)
>  		return -ENODEV;
>  
> -	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
> -
>  	slice_length = sizeof(sseu->slice_mask);
>  	subslice_length = sseu->max_slices * sseu->ss_stride;
>  	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
>  	total_length = sizeof(topo) + slice_length + subslice_length +
>  		       eu_length;
>  
> -	ret = copy_query_item(&topo, sizeof(topo), total_length,
> -			      query_item);
> +	ret = copy_query_item(&topo, sizeof(topo), total_length, query_item);
> +
>  	if (ret != 0)
>  		return ret;
>  
> -	if (topo.flags != 0)
> -		return -EINVAL;
> -
>  	memset(&topo, 0, sizeof(topo));
>  	topo.max_slices = sseu->max_slices;
>  	topo.max_subslices = sseu->max_subslices;
> @@ -69,27 +64,61 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
>  	topo.eu_stride = sseu->eu_stride;
>  
>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> -			   &topo, sizeof(topo)))
> +			 &topo, sizeof(topo)))
>  		return -EFAULT;
>  
>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr + sizeof(topo)),
> -			   &sseu->slice_mask, slice_length))
> +			 &sseu->slice_mask, slice_length))
>  		return -EFAULT;
>  
>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> -					   sizeof(topo) + slice_length),
> -			   sseu->subslice_mask, subslice_length))
> +					 sizeof(topo) + slice_length),
> +			 subslice_mask, subslice_length))
>  		return -EFAULT;
>  
>  	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> -					   sizeof(topo) +
> -					   slice_length + subslice_length),
> -			   sseu->eu_mask, eu_length))
> +					 sizeof(topo) +
> +					 slice_length + subslice_length),
> +			 sseu->eu_mask, eu_length))
>  		return -EFAULT;
>  
>  	return total_length;
>  }
>  
> +static int query_topology_info(struct drm_i915_private *dev_priv,
> +			       struct drm_i915_query_item *query_item)
> +{
> +	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
> +
> +	if (query_item->flags != 0)
> +		return -EINVAL;
> +
> +	return fill_topology_info(sseu, query_item, sseu->subslice_mask);
> +}
> +
> +static int query_geometry_subslices(struct drm_i915_private *i915,
> +				    struct drm_i915_query_item *query_item)
> +{
> +	const struct sseu_dev_info *sseu;
> +	struct intel_engine_cs *engine;
> +	struct i915_engine_class_instance classinstance;
> +
> +	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> +		return -ENODEV;
> +
> +	classinstance = *((struct i915_engine_class_instance *)&query_item->flags);
> +
> +	engine = intel_engine_lookup_user(i915, (u8) classinstance.engine_class,
> +					  (u8) classinstance.engine_instance);
> +
> +	if (!engine)
> +		return -EINVAL;
> +
> +	sseu = &engine->gt->info.sseu;
> +
> +	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
> +}
> +
>  static int
>  query_engine_info(struct drm_i915_private *i915,
>  		  struct drm_i915_query_item *query_item)
> @@ -485,6 +514,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>  	query_engine_info,
>  	query_perf_config,
>  	query_memregion_info,
> +	query_geometry_subslices,
>  };
>  
>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 05c3642aaece..b539c83a4034 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2687,10 +2687,11 @@ struct drm_i915_perf_oa_config {
>  struct drm_i915_query_item {
>  	/** @query_id: The id for this query */
>  	__u64 query_id;
> -#define DRM_I915_QUERY_TOPOLOGY_INFO    1
> -#define DRM_I915_QUERY_ENGINE_INFO	2
> -#define DRM_I915_QUERY_PERF_CONFIG      3
> -#define DRM_I915_QUERY_MEMORY_REGIONS   4
> +#define DRM_I915_QUERY_TOPOLOGY_INFO		1
> +#define DRM_I915_QUERY_ENGINE_INFO		2
> +#define DRM_I915_QUERY_PERF_CONFIG		3
> +#define DRM_I915_QUERY_MEMORY_REGIONS		4
> +#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	5
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> @@ -2714,6 +2715,9 @@ struct drm_i915_query_item {
>  	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
>  	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
>  	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> +	 *
> +	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have a valid
> +	 * i915_engine_class_instance struct.

To get back to our previous discussion off-list, I find this interface
kind of confusing, since it's expecting an engine ID as argument, but it
returns the set of subslices available to the *render* engine regardless
of the engine class specified.  I think it would make sense to rename
this to DRM_I915_QUERY_ENGINE_SUBSLICES or similar and have the mask
returned be the set of subslices actually available to the engine that
was specified (e.g. the compute subslice mask if a compute engine is
specified, or an error if the engine specified doesn't have any
connection to subslices).  Alternatively, if this is really only meant
to work for the render engine, maybe the engine class should be dropped
from "flags", only the engine instance is necessary -- I think that
would prevent programming errors and would leave additional room in
"flags" for future expansion.

>  	 */
>  	__u32 flags;
>  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
> @@ -2772,16 +2776,20 @@ struct drm_i915_query {
>  };
>  
>  /*
> - * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO :
> + * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO,
> + * DRM_I915_QUERY_GEOMETRY_SUBSLICE:
>   *
>   * data: contains the 3 pieces of information :
>   *
> - * - the slice mask with one bit per slice telling whether a slice is
> - *   available. The availability of slice X can be queried with the following
> - *   formula :
> + * - For DRM_I915_QUERY_TOPOLOGY_INFO the slice mask with one bit per slice
> + *   telling whether a slice is available. The availability of slice X can be
> + *   queried with the following formula :
>   *
>   *           (data[X / 8] >> (X % 8)) & 1
>   *
> + * - For DRM_I915_QUERY_GEOMETRY_SUBSLICES Slices are equal to 1 and this field
> + *   is not used.
> + *
>   * - the subslice mask for each slice with one bit per subslice telling
>   *   whether a subslice is available. Gen12 has dual-subslices, which are
>   *   similar to two gen11 subslices. For gen12, this array represents dual-
> -- 
> 2.21.3
