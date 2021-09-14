Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E540A260
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 03:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719D6E303;
	Tue, 14 Sep 2021 01:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF0D6E2F2;
 Tue, 14 Sep 2021 01:13:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="307391284"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="307391284"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 18:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="551980428"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 18:13:50 -0700
Date: Mon, 13 Sep 2021 18:08:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 09/27] drm/i915: Expose logical engine
 instance to user
Message-ID: <20210914010851.GA9126@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-10-matthew.brost@intel.com>
 <7f3495e7-d66a-3254-3473-b25e4c757b5c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f3495e7-d66a-3254-3473-b25e4c757b5c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Sep 13, 2021 at 04:06:33PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Expose logical engine instance to user via query engine info IOCTL. This
> > is required for split-frame workloads as these needs to be placed on
> > engines in a logically contiguous order. The logical mapping can change
> > based on fusing. Rather than having user have knowledge of the fusing we
> > simply just expose the logical mapping with the existing query engine
> > info IOCTL.
> > 
> > IGT: https://patchwork.freedesktop.org/patch/445637/?series=92854&rev=1
> > media UMD: link coming soon
> > 
> > v2:
> >   (Daniel Vetter)
> >    - Add IGT link, placeholder for media UMD
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_query.c | 2 ++
> >   include/uapi/drm/i915_drm.h       | 8 +++++++-
> >   2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index e49da36c62fb..8a72923fbdba 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -124,7 +124,9 @@ query_engine_info(struct drm_i915_private *i915,
> >   	for_each_uabi_engine(engine, i915) {
> >   		info.engine.engine_class = engine->uabi_class;
> >   		info.engine.engine_instance = engine->uabi_instance;
> > +		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
> >   		info.capabilities = engine->uabi_capabilities;
> > +		info.logical_instance = ilog2(engine->logical_mask);
> >   		if (copy_to_user(info_ptr, &info, sizeof(info)))
> >   			return -EFAULT;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index bde5860b3686..b1248a67b4f8 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -2726,14 +2726,20 @@ struct drm_i915_engine_info {
> >   	/** @flags: Engine flags. */
> >   	__u64 flags;
> > +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
> >   	/** @capabilities: Capabilities of this engine. */
> >   	__u64 capabilities;
> >   #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
> >   #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
> > +	/** @logical_instance: Logical instance of engine */
> > +	__u16 logical_instance;
> > +
> >   	/** @rsvd1: Reserved fields. */
> > -	__u64 rsvd1[4];
> > +	__u16 rsvd1[3];
> > +	/** @rsvd2: Reserved fields. */
> > +	__u64 rsvd2[3];
> >   };
> >   /**
> Any idea why the padding? Would be useful if the comment said 'this
> structure must be at least/exactly X bytes in size / a multiple of X bytes
> in size because ...' or whatever.
> 

I think this is pretty standard in UABI interface - add a bunch of
padding bits in case you need them in the future (i.e. this patch is an
example of that).

Matt 

> However, not really anything to do with this patch as such, so either way:
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> 
