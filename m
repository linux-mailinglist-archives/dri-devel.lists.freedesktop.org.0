Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD203E9721
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 19:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5054898AA;
	Wed, 11 Aug 2021 17:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE8A89264;
 Wed, 11 Aug 2021 17:55:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="195454680"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="195454680"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 10:55:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="672997553"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 10:55:15 -0700
Date: Wed, 11 Aug 2021 17:55:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/46] drm/i915: Expose logical engine instance to user
Message-ID: <20210811175514.GA297147@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-15-matthew.brost@intel.com>
 <YRE77nFgpGQUX/Sc@phenom.ffwll.local>
 <20210809183701.GA123627@DUT151-ICLU.fm.intel.com>
 <YRIiXL1sToOPMveN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRIiXL1sToOPMveN@phenom.ffwll.local>
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

On Tue, Aug 10, 2021 at 08:53:16AM +0200, Daniel Vetter wrote:
> On Mon, Aug 09, 2021 at 06:37:01PM +0000, Matthew Brost wrote:
> > On Mon, Aug 09, 2021 at 04:30:06PM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 03, 2021 at 03:29:11PM -0700, Matthew Brost wrote:
> > > > Expose logical engine instance to user via query engine info IOCTL. This
> > > > is required for split-frame workloads as these needs to be placed on
> > > > engines in a logically contiguous order. The logical mapping can change
> > > > based on fusing. Rather than having user have knowledge of the fusing we
> > > > simply just expose the logical mapping with the existing query engine
> > > > info IOCTL.
> > > > 
> > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Uapi must have a link to the userspace MR/patch set using this, and to the
> > > igt patch set validating it.
> > > 
> > 
> > Have an IGT:
> > https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1
> > 
> > Not sure when the media UMD is going to be updated upstream to use this.
> > Does that mean I can't merge this until the media UMD is ready? Seems
> > like it but isn't that a circular dependency? How can the media team
> > develop for a new uAPI that isn't in the kernel yet?
> 
> Yes and no. Full explainer here:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> In the drm subsystem this is pretty much the only rule where if you break
> it the book will be thrown at you with extreme prejudice.
>

Well I don't want a book thrown at, new here and trying to play by the
rules.

> Also wrt circular: If the umd aren't set up to test their branches against
> kernel branches they need to fix their stuff. I know that internally
> that's not been done, and its a disaster, but in upstream there's no room
> for excuses. Both kernel and userspace needs to be in branches until it's
> ready for merging.
> 

Ok, looks like a have a few things to learn. I'll coordinate with the
media team on this. Likely won't have links to the UMD in the next spin
but I'll have a branch for them to prep their patches on.

Matt

> > For what it is worth the downstream release is already using this.
> 
> Yeah which is another problem, shipping new uapi in downstream before it's
> in upstream is decidedly not great.
> -Daniel
> 
> > 
> > Matt
> > 
> > > Ideally in each patch, since it's way too hard to unfortunately find the
> > > cover letter late on.
> > > 
> > > Jason even went as far as making this a hard requirement because he wasted
> > > a bit too much time trying to find the userspace for new uapi:
> > > 
> > > https://lore.kernel.org/dri-devel/20210804185704.624883-1-jason@jlekstrand.net/
> > > 
> > > Cheers, Daniel
> > > 
> > > >---
> > > >  drivers/gpu/drm/i915/i915_query.c | 2 ++
> > > >  include/uapi/drm/i915_drm.h       | 8 +++++++-
> > > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > > > index e49da36c62fb..8a72923fbdba 100644
> > > > --- a/drivers/gpu/drm/i915/i915_query.c
> > > > +++ b/drivers/gpu/drm/i915/i915_query.c
> > > > @@ -124,7 +124,9 @@ query_engine_info(struct drm_i915_private *i915,
> > > >  	for_each_uabi_engine(engine, i915) {
> > > >  		info.engine.engine_class = engine->uabi_class;
> > > >  		info.engine.engine_instance = engine->uabi_instance;
> > > > +		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
> > > >  		info.capabilities = engine->uabi_capabilities;
> > > > +		info.logical_instance = ilog2(engine->logical_mask);
> > > >  
> > > >  		if (copy_to_user(info_ptr, &info, sizeof(info)))
> > > >  			return -EFAULT;
> > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > index 7f13d241417f..ef72e07fe08c 100644
> > > > --- a/include/uapi/drm/i915_drm.h
> > > > +++ b/include/uapi/drm/i915_drm.h
> > > > @@ -2706,14 +2706,20 @@ struct drm_i915_engine_info {
> > > >  
> > > >  	/** @flags: Engine flags. */
> > > >  	__u64 flags;
> > > > +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
> > > >  
> > > >  	/** @capabilities: Capabilities of this engine. */
> > > >  	__u64 capabilities;
> > > >  #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
> > > >  #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
> > > >  
> > > > +	/** @logical_instance: Logical instance of engine */
> > > > +	__u16 logical_instance;
> > > > +
> > > >  	/** @rsvd1: Reserved fields. */
> > > > -	__u64 rsvd1[4];
> > > > +	__u16 rsvd1[3];
> > > > +	/** @rsvd2: Reserved fields. */
> > > > +	__u64 rsvd2[3];
> > > >  };
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.28.0
> > > > 
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
