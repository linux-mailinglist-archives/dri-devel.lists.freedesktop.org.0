Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0583C94C8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9A56E4CB;
	Thu, 15 Jul 2021 00:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082406E4CB;
 Thu, 15 Jul 2021 00:07:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210261651"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="210261651"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:07:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="494695068"
Received: from dut031-tgly.fm.intel.com ([10.105.19.16])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:07:19 -0700
Date: Thu, 15 Jul 2021 00:07:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 20/47] drm/i915/guc: Disable semaphores when using GuC
 scheduling
Message-ID: <20210715000718.GA17759@DUT031-TGLY.fm.intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-21-matthew.brost@intel.com>
 <a11ab4d8-f376-a83e-bb53-4347536ce4eb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a11ab4d8-f376-a83e-bb53-4347536ce4eb@intel.com>
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

On Fri, Jul 09, 2021 at 04:53:37PM -0700, John Harrison wrote:
> On 6/24/2021 00:04, Matthew Brost wrote:
> > Semaphores are an optimization and not required for basic GuC submission
> > to work properly. Disable until we have time to do the implementation to
> > enable semaphores and tune them for performance. Also long direction is
> > just to delete semaphores from the i915 so another reason to not enable
> > these for GuC submission.
> > 
> > v2: Reword commit message
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> I think the commit description does not really match the patch content. The
> description is valid but the 'disable' is done by simply not setting the
> enable flag (done in the execlist back end and presumably not done in the
> GuC back end). However, what the patch is actually doing seems to be fixing
> bugs with the 'are semaphores enabled' mechanism. I.e. correcting pieces of
> code that used semaphores without checking if they are enabled. And
> presumably this would be broken if someone tried to disable semaphores in
> execlist mode for any reason?
> 
> So I think keeping the existing comment text is fine but something should be
> added to explain the actual changes.
> 

Yes, commit is wrong. This more or less bug fix to the existing code. Will update.


Matt

> John.
> 
> 
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 7720b8c22c81..5c07e6abf16a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -230,7 +230,8 @@ static void intel_context_set_gem(struct intel_context *ce,
> >   		ce->timeline = intel_timeline_get(ctx->timeline);
> >   	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > -	    intel_engine_has_timeslices(ce->engine))
> > +	    intel_engine_has_timeslices(ce->engine) &&
> > +	    intel_engine_has_semaphores(ce->engine))
> >   		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> >   	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> > @@ -1938,7 +1939,8 @@ static int __apply_priority(struct intel_context *ce, void *arg)
> >   	if (!intel_engine_has_timeslices(ce->engine))
> >   		return 0;
> > -	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
> > +	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > +	    intel_engine_has_semaphores(ce->engine))
> >   		intel_context_set_use_semaphores(ce);
> >   	else
> >   		intel_context_clear_use_semaphores(ce);
> 
