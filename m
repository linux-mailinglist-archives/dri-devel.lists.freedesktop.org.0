Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3E6D681E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15D210E531;
	Tue,  4 Apr 2023 16:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713D410E6ED;
 Tue,  4 Apr 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680624043; x=1712160043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B2VCrvRDMzzWoBj/sY/dOe8TgaAA+UY1ACaoJ3AXUvM=;
 b=WKme7KfHWIOu53o5G0bABfJPvJAcIqIeVzMgrj3+o8B8v7ZA4gPLk78f
 1/IfPLDhxvU48A1cexf+bdPPHkatDYESkKt6unnJvHyAiOcAY2SFQdi91
 wYAZHtciQGqScMZtesV3ZTC5DxpqOJ/mUtAc/2zrk1ngMynadHb+VxdV/
 yw6fQ2pEhYOaTz6fL2ddg8awr3OdWk6u7a0pl9u4jaDo5dkOI0Md9RBDT
 jnNSuhaP3enNBOCEasoRiU/PTONhWWZadaAiZF20MFSGAMGs7DaGlYcu/
 CYK2DKGQQIWbyg+aK127FN1Y/fjdSONx+E4fm8eiXmwaNI8Mqs40PX0Zz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339716602"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="339716602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="755693328"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="755693328"
Received: from vferra-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:00:37 -0700
Date: Tue, 4 Apr 2023 18:00:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Hold a wakeref for the active VM
Message-ID: <ZCxJitP+XtC2/run@ashyti-mobl2.lan>
References: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
 <ZCxEoelnOSpRiy6A@ashyti-mobl2.lan>
 <f193eb7f-19f9-b9a8-7edf-438dafb74da4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f193eb7f-19f9-b9a8-7edf-438dafb74da4@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > > index 0a8d553da3f439..48f888c3da083b 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > > @@ -14,6 +14,7 @@
> > >   #include "i915_drv.h"
> > >   #include "intel_context_types.h"
> > >   #include "intel_engine_types.h"
> > > +#include "intel_gt_pm.h"
> > >   #include "intel_ring_types.h"
> > >   #include "intel_timeline_types.h"
> > >   #include "i915_trace.h"
> > > @@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
> > >   static inline void intel_context_enter(struct intel_context *ce)
> > >   {
> > >   	lockdep_assert_held(&ce->timeline->mutex);
> > > -	if (!ce->active_count++)
> > > -		ce->ops->enter(ce);
> > > +	if (ce->active_count++)
> > > +		return;
> > > +
> > > +	ce->ops->enter(ce);
> > > +	intel_gt_pm_get(ce->vm->gt);
> > >   }
> > >   static inline void intel_context_mark_active(struct intel_context *ce)
> > > @@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
> > >   {
> > >   	lockdep_assert_held(&ce->timeline->mutex);
> > >   	GEM_BUG_ON(!ce->active_count);
> > > -	if (!--ce->active_count)
> > > -		ce->ops->exit(ce);
> > > +	if (--ce->active_count)
> > > +		return;
> > > +
> > > +	intel_gt_pm_put_async(ce->vm->gt);
> > > +	ce->ops->exit(ce);
> > 
> > shouldn't these two be swapped?

maybe I wasn't clear here... shouldn't it be

	ce->ops->exit(ce);
	intel_gt_pm_put_async(ce->vm->gt);

Don't we need to hold the pm until exiting?

> > >   }
> > >   static inline struct intel_context *intel_context_get(struct intel_context *ce)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > index e971b153fda976..ee531a5c142c77 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > @@ -114,6 +114,15 @@ __queue_and_release_pm(struct i915_request *rq,
> > >   	ENGINE_TRACE(engine, "parking\n");
> > > +	/*
> > > +	 * Open coded one half of intel_context_enter, which we have to omit
> > > +	 * here (see the large comment below) and because the other part must
> > > +	 * not be called due constructing directly with __i915_request_create
> > > +	 * which increments active count via intel_context_mark_active.
> > > +	 */
> > > +	GEM_BUG_ON(rq->context->active_count != 1);
> > > +	__intel_gt_pm_get(engine->gt);
> > 
> > where is it's brother "put"?
> 
> It's in request retire via intel_context_exit. Ie. request construction is
> special here, while retirement is standard.

Thank you!
Andi
