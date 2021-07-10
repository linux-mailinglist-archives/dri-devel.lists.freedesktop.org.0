Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673D3C321D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 05:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6BB6EAC8;
	Sat, 10 Jul 2021 03:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466C6EAC6;
 Sat, 10 Jul 2021 03:00:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="231579380"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="231579380"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 20:00:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="647300311"
Received: from dut030-tgly.fm.intel.com ([10.105.19.34])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 20:00:13 -0700
Date: Sat, 10 Jul 2021 03:00:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 16/47] drm/i915/guc: Disable engine barriers with GuC
 during unpin
Message-ID: <20210710030010.GA187079@DUT030-TGLY.fm.intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-17-matthew.brost@intel.com>
 <8d056c1a-dc4a-baed-1664-0f86db9e7c5c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d056c1a-dc4a-baed-1664-0f86db9e7c5c@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 03:53:29PM -0700, John Harrison wrote:
> On 6/24/2021 00:04, Matthew Brost wrote:
> > Disable engine barriers for unpinning with GuC. This feature isn't
> > needed with the GuC as it disables context scheduling before unpinning
> > which guarantees the HW will not reference the context. Hence it is
> > not necessary to defer unpinning until a kernel context request
> > completes on each engine in the context engine mask.
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
> >   drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
> >   drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
> >   3 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 1499b8aace2a..7f97753ab164 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
> >   	__i915_active_acquire(&ce->active);
> > -	if (intel_context_is_barrier(ce))
> > +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
> >   		return 0;
> Would be better to have a scheduler flag to say whether barriers are
> required or not. That would prevent polluting front end code with back end
> details.
> 

I guess an engine flag is slightly better but I still don't love that
as we have to test if the context is a barrier (kernel context) and then
call a function that is basically backend specific after. IMO we really
need to push all of this to a vfunc. If you really want me to make this
an engine flag I can, but in the end it just seems like that will
trash the code (adding an engine flag just to remove it). I think this
is just a clean up we write down, and figure out a bit later as nothing
is functionally wrong + quite clear that it is something that should be
cleaned up.

Matt

> John.
> 
> 
> >   	/* Preallocate tracking nodes */
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index 8a7199afbe61..a592a9605dc8 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -16,6 +16,7 @@
> >   #include "intel_engine_types.h"
> >   #include "intel_ring_types.h"
> >   #include "intel_timeline_types.h"
> > +#include "uc/intel_guc_submission.h"
> >   #define CE_TRACE(ce, fmt, ...) do {					\
> >   	const struct intel_context *ce__ = (ce);			\
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
> > index 26685b927169..fa7b99a671dd 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> > @@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
> >   	 * This test makes sure that the context is kept alive until a
> >   	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
> >   	 * with no more outstanding requests).
> > +	 *
> > +	 * In GuC submission mode we don't use idle barriers and we instead
> > +	 * get a message from the GuC to signal that it is safe to unpin the
> > +	 * context from memory.
> >   	 */
> > +	if (intel_engine_uses_guc(engine))
> > +		return 0;
> >   	if (intel_engine_pm_is_awake(engine)) {
> >   		pr_err("%s is awake before starting %s!\n",
> > @@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
> >   	 * on the context image remotely (intel_context_prepare_remote_request),
> >   	 * which inserts foreign fences into intel_context.active, does not
> >   	 * clobber the idle-barrier.
> > +	 *
> > +	 * In GuC submission mode we don't use idle barriers.
> >   	 */
> > +	if (intel_engine_uses_guc(engine))
> > +		return 0;
> >   	if (intel_engine_pm_is_awake(engine)) {
> >   		pr_err("%s is awake before starting %s!\n",
> 
