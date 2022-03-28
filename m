Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257D4E9BC7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AAD10EE05;
	Mon, 28 Mar 2022 16:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8922C10EE07;
 Mon, 28 Mar 2022 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648483300; x=1680019300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TtP3CnYnvu4W65hm5kauA5TWszA/v5dbMrfBYEDlfNM=;
 b=FKsv91nhicr1ydPXtoX/PixUc7QLkfW4IatmX2y1WaNzMvU5AFalbyyh
 b0I3zO5wSOxQYExxz1H37ptJLdl5N2upjiWnd7XB+LKvaEbh+gUI06am+
 kepiPsDyGRFDIJL7KArePkaj0o3qrfU15XstbqZTuVx9r8P8y7WZriIxv
 kDm+CMLSf/+dviGHe3i9ezfnAhpJtoC+mKEWIQCf99XHCljfzYIsj3y3d
 GD2grUizRutAsOJOIazhnNMoycNBZyEdCMOTl2aXFjBnVkA1/eouDkasc
 sBn+su4QdozpUK7QZCunBLHsUtMglyJR5/LQFgCb+x3iES+JjWMno2DAh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="258753579"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="258753579"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 09:01:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649113325"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 09:01:31 -0700
Date: Mon, 28 Mar 2022 09:01:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
Message-ID: <YkHb2UNB9DogQCrt@mdroper-desk1.amr.corp.intel.com>
References: <20220316224943.27679-1-matthew.s.atwood@intel.com>
 <87r16pfxdo.fsf@riseup.net>
 <31ed28e2-9b98-19b0-5d59-d4aa562542bd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31ed28e2-9b98-19b0-5d59-d4aa562542bd@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matt Atwood <matthew.s.atwood@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 09:44:36AM +0100, Tvrtko Ursulin wrote:
> 
> + Joonas
> 
> On 25/03/2022 23:03, Francisco Jerez wrote:
> > Matt Atwood <matthew.s.atwood@intel.com> writes:
> > 
> > > Newer platforms have DSS that aren't necessarily available for both
> > > geometry and compute, two queries will need to exist. This introduces
> > > the first, when passing a valid engine class and engine instance in the
> > > flags returns a topology describing geometry.
> > > 
> > > v2: fix white space errors
> > > v3: change flags from hosting 2 8 bit numbers to holding a
> > > i915_engine_class_instance struct
> > > 
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14143
> > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/i915_query.c | 68 ++++++++++++++++++++++---------
> > >   include/uapi/drm/i915_drm.h       | 24 +++++++----
> > >   2 files changed, 65 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > > index 2dfbc22857a3..fcb374201edb 100644
> > > --- a/drivers/gpu/drm/i915/i915_query.c
> > > +++ b/drivers/gpu/drm/i915/i915_query.c
> > > @@ -9,6 +9,7 @@
> > >   #include "i915_drv.h"
> > >   #include "i915_perf.h"
> > >   #include "i915_query.h"
> > > +#include "gt/intel_engine_user.h"
> > >   #include <uapi/drm/i915_drm.h>
> > >   static int copy_query_item(void *query_hdr, size_t query_sz,
> > > @@ -28,36 +29,30 @@ static int copy_query_item(void *query_hdr, size_t query_sz,
> > >   	return 0;
> > >   }
> > > -static int query_topology_info(struct drm_i915_private *dev_priv,
> > > -			       struct drm_i915_query_item *query_item)
> > > +static int fill_topology_info(const struct sseu_dev_info *sseu,
> > > +			      struct drm_i915_query_item *query_item,
> > > +			      const u8 *subslice_mask)
> > >   {
> > > -	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
> > >   	struct drm_i915_query_topology_info topo;
> > >   	u32 slice_length, subslice_length, eu_length, total_length;
> > >   	int ret;
> > > -	if (query_item->flags != 0)
> > > -		return -EINVAL;
> > > +	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
> > >   	if (sseu->max_slices == 0)
> > >   		return -ENODEV;
> > > -	BUILD_BUG_ON(sizeof(u8) != sizeof(sseu->slice_mask));
> > > -
> > >   	slice_length = sizeof(sseu->slice_mask);
> > >   	subslice_length = sseu->max_slices * sseu->ss_stride;
> > >   	eu_length = sseu->max_slices * sseu->max_subslices * sseu->eu_stride;
> > >   	total_length = sizeof(topo) + slice_length + subslice_length +
> > >   		       eu_length;
> > > -	ret = copy_query_item(&topo, sizeof(topo), total_length,
> > > -			      query_item);
> > > +	ret = copy_query_item(&topo, sizeof(topo), total_length, query_item);
> > > +
> > >   	if (ret != 0)
> > >   		return ret;
> > > -	if (topo.flags != 0)
> > > -		return -EINVAL;
> > > -
> > >   	memset(&topo, 0, sizeof(topo));
> > >   	topo.max_slices = sseu->max_slices;
> > >   	topo.max_subslices = sseu->max_subslices;
> > > @@ -69,27 +64,61 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
> > >   	topo.eu_stride = sseu->eu_stride;
> > >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> > > -			   &topo, sizeof(topo)))
> > > +			 &topo, sizeof(topo)))
> > >   		return -EFAULT;
> > >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr + sizeof(topo)),
> > > -			   &sseu->slice_mask, slice_length))
> > > +			 &sseu->slice_mask, slice_length))
> > >   		return -EFAULT;
> > >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> > > -					   sizeof(topo) + slice_length),
> > > -			   sseu->subslice_mask, subslice_length))
> > > +					 sizeof(topo) + slice_length),
> > > +			 subslice_mask, subslice_length))
> > >   		return -EFAULT;
> > >   	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr +
> > > -					   sizeof(topo) +
> > > -					   slice_length + subslice_length),
> > > -			   sseu->eu_mask, eu_length))
> > > +					 sizeof(topo) +
> > > +					 slice_length + subslice_length),
> > > +			 sseu->eu_mask, eu_length))
> > >   		return -EFAULT;
> > >   	return total_length;
> > >   }
> > > +static int query_topology_info(struct drm_i915_private *dev_priv,
> > > +			       struct drm_i915_query_item *query_item)
> > > +{
> > > +	const struct sseu_dev_info *sseu = &to_gt(dev_priv)->info.sseu;
> > > +
> > > +	if (query_item->flags != 0)
> > > +		return -EINVAL;
> > > +
> > > +	return fill_topology_info(sseu, query_item, sseu->subslice_mask);
> > > +}
> > > +
> > > +static int query_geometry_subslices(struct drm_i915_private *i915,
> > > +				    struct drm_i915_query_item *query_item)
> > > +{
> > > +	const struct sseu_dev_info *sseu;
> > > +	struct intel_engine_cs *engine;
> > > +	struct i915_engine_class_instance classinstance;
> > > +
> > > +	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> > > +		return -ENODEV;
> > > +
> > > +	classinstance = *((struct i915_engine_class_instance *)&query_item->flags);
> > > +
> > > +	engine = intel_engine_lookup_user(i915, (u8) classinstance.engine_class,
> > > +					  (u8) classinstance.engine_instance);
> > > +
> > > +	if (!engine)
> > > +		return -EINVAL;
> > > +
> > > +	sseu = &engine->gt->info.sseu;
> > > +
> > > +	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
> > > +}
> > > +
> > >   static int
> > >   query_engine_info(struct drm_i915_private *i915,
> > >   		  struct drm_i915_query_item *query_item)
> > > @@ -485,6 +514,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
> > >   	query_engine_info,
> > >   	query_perf_config,
> > >   	query_memregion_info,
> > > +	query_geometry_subslices,
> > >   };
> > >   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > index 05c3642aaece..b539c83a4034 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -2687,10 +2687,11 @@ struct drm_i915_perf_oa_config {
> > >   struct drm_i915_query_item {
> > >   	/** @query_id: The id for this query */
> > >   	__u64 query_id;
> > > -#define DRM_I915_QUERY_TOPOLOGY_INFO    1
> > > -#define DRM_I915_QUERY_ENGINE_INFO	2
> > > -#define DRM_I915_QUERY_PERF_CONFIG      3
> > > -#define DRM_I915_QUERY_MEMORY_REGIONS   4
> > > +#define DRM_I915_QUERY_TOPOLOGY_INFO		1
> > > +#define DRM_I915_QUERY_ENGINE_INFO		2
> > > +#define DRM_I915_QUERY_PERF_CONFIG		3
> > > +#define DRM_I915_QUERY_MEMORY_REGIONS		4
> > > +#define DRM_I915_QUERY_GEOMETRY_SUBSLICES	5
> > >   /* Must be kept compact -- no holes and well documented */
> > >   	/**
> > > @@ -2714,6 +2715,9 @@ struct drm_i915_query_item {
> > >   	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
> > >   	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> > >   	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> > > +	 *
> > > +	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have a valid
> > > +	 * i915_engine_class_instance struct.
> > 
> > To get back to our previous discussion off-list, I find this interface
> > kind of confusing, since it's expecting an engine ID as argument, but it
> > returns the set of subslices available to the *render* engine regardless
> > of the engine class specified.  I think it would make sense to rename
> > this to DRM_I915_QUERY_ENGINE_SUBSLICES or similar and have the mask
> > returned be the set of subslices actually available to the engine that
> > was specified (e.g. the compute subslice mask if a compute engine is
> > specified, or an error if the engine specified doesn't have any
> > connection to subslices).  Alternatively, if this is really only meant
> > to work for the render engine, maybe the engine class should be dropped
> > from "flags", only the engine instance is necessary -- I think that
> > would prevent programming errors and would leave additional room in
> > "flags" for future expansion.
> 
> I have asked a similar question and AFAIR Matt explained it was an arch
> level direction to have it like it is. Not sure of the reasoning.
> 
> I wouldn't take the option of implying render and only having instance in
> flags, but returning error for engines not applicable sounds good to me. If
> there isn't a good reason not to do it.

GEOMETRY_SUBSLICES doesn't really have any meaning for non-RCS engines,
so returning an error if the query is performed against a media,
blitter, or compute engine is probably fine.

MattA also has a COMPUTE_SUBSLICES query coming as well, and I believe
the compute subslices query would be relevant to both render and compute
engines since gpgpu workloads can be submitted to either.  So keeping
the engine type (and maintaining a consistent signature for the two
queries) is probably the way to go.


Matt

> 
> Regards,
> 
> Tvrtko

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
