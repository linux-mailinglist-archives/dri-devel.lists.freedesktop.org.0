Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F70391EEE
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 20:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7EB6EDC7;
	Wed, 26 May 2021 18:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2900C6EDB7;
 Wed, 26 May 2021 18:22:09 +0000 (UTC)
IronPort-SDR: qNJW6m2MfP+BOl3rVkUjdiKbG548P/JBOcOZBzs5ewyv4zV8AE/uxebGlm1q8a0bNyNMHBWaPO
 5hfAlrF/xi3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202572032"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="202572032"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:22:08 -0700
IronPort-SDR: eVDAuN1nWSuwRlABENuHcoI7iOUmlULz3Vp5SU5G3oB0KUA0P3VuUOf254lLc5x9BAWd1AeLeS
 seIN9m2FN6fw==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="477066657"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:22:07 -0700
Date: Wed, 26 May 2021 11:15:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 53/97] drm/i915/guc: Disable semaphores
 when using GuC scheduling
Message-ID: <20210526181501.GA4268@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-54-matthew.brost@intel.com>
 <295c0e48-5091-504a-5a81-10a60fa900f4@linux.intel.com>
 <20210525170131.GA14724@sdutt-i7>
 <cff93d4a-e852-0a33-9235-b019fd828a0a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cff93d4a-e852-0a33-9235-b019fd828a0a@linux.intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 10:25:13AM +0100, Tvrtko Ursulin wrote:
> 
> On 25/05/2021 18:01, Matthew Brost wrote:
> > On Tue, May 25, 2021 at 10:52:01AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 06/05/2021 20:14, Matthew Brost wrote:
> > > > Disable semaphores when using GuC scheduling as semaphores are broken in
> > > > the current GuC firmware.
> > > 
> > > What is "current"? Given that the patch itself is like year and a half old.
> > > 
> > 
> > Stale comment. Semaphore work with the firmware we just haven't enabled
> > them in the i915 with GuC submission as this an optimization and not
> > required for functionality.
> 
> How will the updated commit message look in terms of remaining reasons why
> semaphores won't/can't be enabled?
> 

Semaphores are an optimization and not required for basic GuC submission
to work properly. Disable until we have time to do the implementation to
enable semaphores and tune them for performance.

> They were a nice performance win on some media workloads although granted a
> lot of tweaking was required to find a good balance on when to use them and
> when not to.
>

The same tweaking would have to be done for with GuC submission. Let's
get basic submission then tweak for performance.

Matt 
 
> Regards,
> 
> Tvrtko
> 
> > Matt
> > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > Cc: John Harrison <john.c.harrison@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
> > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > index 993faa213b41..d30260ffe2a7 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > @@ -230,7 +230,8 @@ static void intel_context_set_gem(struct intel_context *ce,
> > > >    		ce->timeline = intel_timeline_get(ctx->timeline);
> > > >    	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > > > -	    intel_engine_has_timeslices(ce->engine))
> > > > +	    intel_engine_has_timeslices(ce->engine) &&
> > > > +	    intel_engine_has_semaphores(ce->engine))
> > > >    		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> > > >    	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> > > > @@ -1939,7 +1940,8 @@ static int __apply_priority(struct intel_context *ce, void *arg)
> > > >    	if (!intel_engine_has_timeslices(ce->engine))
> > > >    		return 0;
> > > > -	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
> > > > +	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > > > +	    intel_engine_has_semaphores(ce->engine))
> > > >    		intel_context_set_use_semaphores(ce);
> > > >    	else
> > > >    		intel_context_clear_use_semaphores(ce);
> > > > 
