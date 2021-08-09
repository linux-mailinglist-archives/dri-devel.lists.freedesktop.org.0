Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484773E4C3C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076F89CB5;
	Mon,  9 Aug 2021 18:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFCB89CAF;
 Mon,  9 Aug 2021 18:37:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="300341013"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="300341013"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 11:37:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="570542246"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 11:37:03 -0700
Date: Mon, 9 Aug 2021 18:37:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/46] drm/i915: Expose logical engine instance to user
Message-ID: <20210809183701.GA123627@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-15-matthew.brost@intel.com>
 <YRE77nFgpGQUX/Sc@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRE77nFgpGQUX/Sc@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 04:30:06PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:11PM -0700, Matthew Brost wrote:
> > Expose logical engine instance to user via query engine info IOCTL. This
> > is required for split-frame workloads as these needs to be placed on
> > engines in a logically contiguous order. The logical mapping can change
> > based on fusing. Rather than having user have knowledge of the fusing we
> > simply just expose the logical mapping with the existing query engine
> > info IOCTL.
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Uapi must have a link to the userspace MR/patch set using this, and to the
> igt patch set validating it.
> 

Have an IGT:
https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1

Not sure when the media UMD is going to be updated upstream to use this.
Does that mean I can't merge this until the media UMD is ready? Seems
like it but isn't that a circular dependency? How can the media team
develop for a new uAPI that isn't in the kernel yet?

For what it is worth the downstream release is already using this.

Matt

> Ideally in each patch, since it's way too hard to unfortunately find the
> cover letter late on.
> 
> Jason even went as far as making this a hard requirement because he wasted
> a bit too much time trying to find the userspace for new uapi:
> 
> https://lore.kernel.org/dri-devel/20210804185704.624883-1-jason@jlekstrand.net/
> 
> Cheers, Daniel
> 
> >---
> >  drivers/gpu/drm/i915/i915_query.c | 2 ++
> >  include/uapi/drm/i915_drm.h       | 8 +++++++-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index e49da36c62fb..8a72923fbdba 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -124,7 +124,9 @@ query_engine_info(struct drm_i915_private *i915,
> >  	for_each_uabi_engine(engine, i915) {
> >  		info.engine.engine_class = engine->uabi_class;
> >  		info.engine.engine_instance = engine->uabi_instance;
> > +		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
> >  		info.capabilities = engine->uabi_capabilities;
> > +		info.logical_instance = ilog2(engine->logical_mask);
> >  
> >  		if (copy_to_user(info_ptr, &info, sizeof(info)))
> >  			return -EFAULT;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 7f13d241417f..ef72e07fe08c 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -2706,14 +2706,20 @@ struct drm_i915_engine_info {
> >  
> >  	/** @flags: Engine flags. */
> >  	__u64 flags;
> > +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
> >  
> >  	/** @capabilities: Capabilities of this engine. */
> >  	__u64 capabilities;
> >  #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
> >  #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
> >  
> > +	/** @logical_instance: Logical instance of engine */
> > +	__u16 logical_instance;
> > +
> >  	/** @rsvd1: Reserved fields. */
> > -	__u64 rsvd1[4];
> > +	__u16 rsvd1[3];
> > +	/** @rsvd2: Reserved fields. */
> > +	__u64 rsvd2[3];
> >  };
> >  
> >  /**
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
