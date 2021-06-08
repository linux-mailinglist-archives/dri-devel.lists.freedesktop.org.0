Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C739F346
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 12:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAFE6EBA3;
	Tue,  8 Jun 2021 10:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B6E6EBA3;
 Tue,  8 Jun 2021 10:14:28 +0000 (UTC)
IronPort-SDR: IA3p/xn+7u+u85zKGDUOfAhG+QiWGO2pSAX2x8ma7wTSt3eDnAbylq1pbHzwWHKkKQZLL74NAT
 Z5opBW79MBhg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191923706"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="191923706"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 03:14:14 -0700
IronPort-SDR: MumC4M/Rq+BplrmJKAM9a1WWQMvndxpmWwbeVdIye9oYv5/R8hFscKI+xrZJDJOs44SFd8kfEl
 o0yIz9T8dckA==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="418848559"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.115])
 ([10.249.254.115])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 03:14:13 -0700
Message-ID: <5ff9b7296d0c98149b4c265f9b2549eea9bec345.camel@linux.intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915/ttm: switch over to ttm_buddy_man
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 12:14:11 +0200
In-Reply-To: <cf0408ac-75ed-f00a-369b-db6cb2000587@intel.com>
References: <20210608084428.142676-1-matthew.auld@intel.com>
 <20210608084428.142676-6-matthew.auld@intel.com>
 <8e8a5115-730e-c892-a241-c69a5662b2c7@linux.intel.com>
 <cf0408ac-75ed-f00a-369b-db6cb2000587@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
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

On Tue, 2021-06-08 at 11:08 +0100, Matthew Auld wrote:
> On 08/06/2021 10:53, Thomas Hellström wrote:
> > 
> > On 6/8/21 10:44 AM, Matthew Auld wrote:
> > > Move back to the buddy allocator for managing device local
> > > memory, and
> > > restore the lost mock selftests. Keep around the range manager
> > > related
> > > bits, since we likely need this for managing stolen at some
> > > point. For
> > > stolen we also don't need to reserve anything so no need to
> > > support a
> > > generic reserve interface.
> > > 
> > > v2(Thomas):
> > >      - bo->page_alignment is in page units, not bytes
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  26 +--
> > >   drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-----
> > >   drivers/gpu/drm/i915/intel_memory_region.h    |  17 --
> > >   drivers/gpu/drm/i915/intel_region_ttm.c       | 100 +++--------
> > >   .../drm/i915/selftests/intel_memory_region.c  | 170
> > > ++++++++++++------
> > >   drivers/gpu/drm/i915/selftests/mock_region.c  |  15 +-
> > >   6 files changed, 168 insertions(+), 215 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
> > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > index c612275c36c9..5bf1d1945dd6 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > @@ -181,11 +181,7 @@ static bool
> > > i915_ttm_eviction_valuable(struct 
> > > ttm_buffer_object *bo,
> > >       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> > >       /* Will do for now. Our pinned objects are still on TTM's
> > > LRU 
> > > lists */
> > > -    if (!i915_gem_object_evictable(obj))
> > > -        return false;
> > > -
> > > -    /* This isn't valid with a buddy allocator */
> > > -    return ttm_bo_eviction_valuable(bo, place);
> > > +    return i915_gem_object_evictable(obj);
> > >   }
> > >   static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
> > > @@ -328,11 +324,15 @@ i915_ttm_resource_get_st(struct 
> > > drm_i915_gem_object *obj,
> > >       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> > >       struct ttm_resource_manager *man =
> > >           ttm_manager_type(bo->bdev, res->mem_type);
> > > +    struct intel_memory_region *mr = obj->mm.region;
> > >       if (man->use_tt)
> > >           return i915_ttm_tt_get_st(bo->ttm);
> > > -    return intel_region_ttm_node_to_st(obj->mm.region, res-
> > > >mm_node);
> > > +    if (mr->is_range_manager)
> > 
> > Did you look at moving this test into
> > intel_region_ttm_node_to_st())
> 
> I guess I didn't like the _node since that seems to suggest
> drm_mm_node 
> to me.
> 
> What about something like:
> i915_ttm_resource_to_st(res, mr)
> intel_region_ttm_resource_to_st(mr, res)

intel_region_ttm_resource_to_st() would be nice I think. I think it
would be nice if the region ttm code could hide the manager selection.

/Thomas


