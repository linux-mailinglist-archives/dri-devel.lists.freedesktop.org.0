Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877C4D6C6B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 05:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68A210ED7B;
	Sat, 12 Mar 2022 04:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1C10ED7B;
 Sat, 12 Mar 2022 04:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647058602; x=1678594602;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=VmRT/6meKGMB4Xtj5rWgDdFRg95RTnlX81g32Idrju0=;
 b=UtssILPUOj0PcQesBnksRlm4y1RIPizgi0vRRxh/evMsuHfNO7ivrnhA
 TQH+bU/C72R0STEqzMwx0/pVw8c9/pTtkK8aNdE+KwEhABT2Q3wfN9ZHK
 Hbi/3BdqV2GESHzFMPX+lup368fgJR4UZQa2TsyLQa2c5t7q2G8ruas9e
 P+pveaY/qAmj/VgsBhk9YEFz/eNOvGnQ/0ClmUm3tby9wxWDBzfqizo6D
 WAMiMwCX+OGjbCt3CtsaRjTkGtfqvnXp0KxxV1AORy6mI4sQtiT6wmkj0
 7jemnmAecHwv6zFwsVoxVRoMQ5zngnmu5+2tvSGB2tJ80aX+IAA7VYiMt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="316466455"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; d="scan'208";a="316466455"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 20:16:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; d="scan'208";a="597332223"
Received: from mjkmieci-mobl.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.209.18.90])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 20:16:41 -0800
Date: Fri, 11 Mar 2022 20:16:24 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>;,
 intel-gfx@lists.freedesktop.org;, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
Message-ID: <20220312041624.GA18367@msatwood-mobl>
References: <20220310051853.30440-1-matthew.s.atwood@intel.com>
 <16c7053b-1773-f1d8-ae7d-904d418b869b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16c7053b-1773-f1d8-ae7d-904d418b869b@linux.intel.com>
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

On Thu, Mar 10, 2022 at 12:26:12PM +0000, Tvrtko Ursulin wrote:
> 
> On 10/03/2022 05:18, Matt Atwood wrote:
> > Newer platforms have DSS that aren't necessarily available for both
> > geometry and compute, two queries will need to exist. This introduces
> > the first, when passing a valid engine class and engine instance in the
> > flags returns a topology describing geometry.
> > 
> > v2: fix white space errors
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_query.c | 68 ++++++++++++++++++++++---------
> >   include/uapi/drm/i915_drm.h       | 24 +++++++----
> >   2 files changed, 65 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index 2dfbc22857a3..e4f35da28642 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -9,6 +9,7 @@
> >   #include "i915_drv.h"
> >   #include "i915_perf.h"
> >   #include "i915_query.h"
> > +#include "gt/intel_engine_user.h"
> >   #include <uapi/drm/i915_drm.h>
> >   static int copy_query_item(void *query_hdr, size_t query_sz,
> > @@ -28,36 +29,30 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
> >   	return 0;
> >   }
> > -static int query_topology_info(struct drm_i915_private *dev_priv,
> > -			       struct drm_i915_query_item *query_item)
> > +static int fill_topology_info(const struct sseu_dev_info *sseu,
> > +			      struct drm_i915_query_item *query_item,
> > +			      const u8 *subslice_mask)
> >   {
> > -	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
> >   	struct drm_i915_query_topology_info topo;
> >   	u32 slice_length, subslice_length, eu_length, total_length;
> >   	int ret;
> > -	if (query_item->flags != 0)
> > -		return -EINVAL;
> > +	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
> >   	if (sseu->max_slices == 0)
> >   		return -ENODEV;
> > -	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
> > -
> >   	slice_length = sizeof(sseu->slice_mask);
> >   	subslice_length = sseu->max_slices * sseu->ss_stride;
> >   	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
> >   	total_length = sizeof(topo) + slice_length + subslice_length +
> >   		       eu_length;
> > -	ret = copy_query_item(&topo, sizeof(topo), total_length,
> > -			      query_item);
> > +	ret = copy_query_item(&topo, sizeof(topo), total_length, query_item);
> > +
> >   	if (ret != 0)
> >   		return ret;
> > -	if (topo.flags != 0)
> > -		return -EINVAL;
> > -
> >   	memset(&topo, 0, sizeof(topo));
> >   	topo.max_slices = sseu->max_slices;
> >   	topo.max_subslices = sseu->max_subslices;
> > @@ -69,27 +64,61 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
> >   	topo.eu_stride = sseu->eu_stride;
> >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> > -			   &topo, sizeof(topo)))
> > +			 &topo, sizeof(topo)))
> >   		return -EFAULT;
> >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr + sizeof(topo)),
> > -			   &sseu->slice_mask, slice_length))
> > +			 &sseu->slice_mask, slice_length))
> >   		return -EFAULT;
> >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> > -					   sizeof(topo) + slice_length),
> > -			   sseu->subslice_mask, subslice_length))
> > +					 sizeof(topo) + slice_length),
> > +			 subslice_mask, subslice_length))
> >   		return -EFAULT;
> >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> > -					   sizeof(topo) +
> > -					   slice_length + subslice_length),
> > -			   sseu->eu_mask, eu_length))
> > +					 sizeof(topo) +
> > +					 slice_length + subslice_length),
> > +			 sseu->eu_mask, eu_length))
> >   		return -EFAULT;
> >   	return total_length;
> >   }
> > +static int query_topology_info(struct drm_i915_private *dev_priv,
> > +			       struct drm_i915_query_item *query_item)
> > +{
> > +	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
> > +
> > +	if (query_item->flags != 0)
> > +		return -EINVAL;
> > +
> > +	return fill_topology_info(sseu, query_item, sseu->subslice_mask);
> > +}
> > +
> > +static int query_geometry_subslices(struct drm_i915_private *i915,
> > +				    struct drm_i915_query_item *query_item)
> > +{
> > +	const struct sseu_dev_info *sseu;
> > +	struct intel_engine_cs *engine;
> > +	u8 engine_class, engine_instance;
> > +
> > +	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> > +		return -ENODEV;
> > +
> > +	engine_class = query_item->flags & 0xFF;
> > +	engine_instance = (query_item->flags >> 8) & 0xFF;
> > +
> > +	engine = intel_engine_lookup_user(i915, engine_class, engine_instance);
> > +
> > +	if (!engine)
> > +		return -EINVAL;
> > +
> > +	sseu = &engine->gt->info.sseu;
> > +
> > +	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
> > +}
> > +
> >   static int
> >   query_engine_info(struct drm_i915_private *i915,
> >   		  struct drm_i915_query_item *query_item)
> > @@ -485,6 +514,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
> >   	query_engine_info,
> >   	query_perf_config,
> >   	query_memregion_info,
> > +	query_geometry_subslices,
> >   };
> >   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 05c3642aaece..1fa6022e1558 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -2687,10 +2687,11 @@ struct drm_i915_perf_oa_config {
> >   struct drm_i915_query_item {
> >   	/** @query_id: The id for this query */
> >   	__u64 query_id;
> > -#define DRM_I915_QUERY_TOPOLOGY_INFO    1
> > -#define DRM_I915_QUERY_ENGINE_INFO	2
> > -#define DRM_I915_QUERY_PERF_CONFIG      3
> > -#define DRM_I915_QUERY_MEMORY_REGIONS   4
> > +#define DRM_I915_QUERY_TOPOLOGY_INFO		1
> > +#define DRM_I915_QUERY_ENGINE_INFO		2
> > +#define DRM_I915_QUERY_PERF_CONFIG		3
> > +#define DRM_I915_QUERY_MEMORY_REGIONS		4
> > +#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	5
> >   /* Must be kept compact -- no holes and well documented */
> >   	/**
> > @@ -2714,6 +2715,9 @@ struct drm_i915_query_item {
> >   	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
> >   	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> >   	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> > +	 *
> > +	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have bits 0:7 set
> > +	 * as a valid engine class, and bits 8:15 must have a valid engine instance.
> 
> Alternatively, all other uapi uses struct i915_engine_class_instance to
> address engines which uses u16:u16.
> 
> How ugly it is to stuff a struct into u32 flags is the question... But you
> could at least use u16:u16 for consistency. Unless you wanted to leave some
> bits free for the future?
Originally when I wrote this I was wanting to leave space in case it was
ever needed. I'm not particularly for or against keeping the space now. 
MattA
> 
> Regards,
> 
> Tvrtko
> 
> >   	 */
> >   	__u32 flags;
> >   #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
> > @@ -2772,16 +2776,20 @@ struct drm_i915_query {
> >   };
> >   /*
> > - * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO :
> > + * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO,
> > + * DRM_I915_QUERY_GEOMETRY_SUBSLICE:
> >    *
> >    * data: contains the 3 pieces of information :
> >    *
> > - * - the slice mask with one bit per slice telling whether a slice is
> > - *   available. The availability of slice X can be queried with the following
> > - *   formula :
> > + * - For DRM_I915_QUERY_TOPOLOGY_INFO the slice mask with one bit per slice
> > + *   telling whether a slice is available. The availability of slice X can be
> > + *   queried with the following formula :
> >    *
> >    *           (data[X / 8] >> (X % 8)) & 1
> >    *
> > + * - For DRM_I915_QUERY_GEOMETRY_SUBSLICES Slices are equal to 1 and this field
> > + *   is not used.
> > + *
> >    * - the subslice mask for each slice with one bit per subslice telling
> >    *   whether a subslice is available. Gen12 has dual-subslices, which are
> >    *   similar to two gen11 subslices. For gen12, this array represents dual-
