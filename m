Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C46390720
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3BA6E413;
	Tue, 25 May 2021 17:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624D6E413;
 Tue, 25 May 2021 17:08:42 +0000 (UTC)
IronPort-SDR: ZiYffaRI3RNfyD7k5Y2hQo5RTW7MpyLUvJVfUGkn9jlIS31J3Woo2X4Ws/lVz8O9xNNn7pfJVf
 DbwSf/cr5DTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="200349456"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="200349456"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:08:42 -0700
IronPort-SDR: 7HkNseDcC/rjKX9hIUMA5Tp6Iu6EytjCS8FCOoPSLu9t44ynSTfWMo0Ayt1U/NIkTm1zF5RS+0
 x67vlLbYhlMg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="476508979"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:08:38 -0700
Date: Tue, 25 May 2021 10:01:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 53/97] drm/i915/guc: Disable semaphores
 when using GuC scheduling
Message-ID: <20210525170131.GA14724@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-54-matthew.brost@intel.com>
 <295c0e48-5091-504a-5a81-10a60fa900f4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <295c0e48-5091-504a-5a81-10a60fa900f4@linux.intel.com>
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

On Tue, May 25, 2021 at 10:52:01AM +0100, Tvrtko Ursulin wrote:
> 
> On 06/05/2021 20:14, Matthew Brost wrote:
> > Disable semaphores when using GuC scheduling as semaphores are broken in
> > the current GuC firmware.
> 
> What is "current"? Given that the patch itself is like year and a half old.
> 

Stale comment. Semaphore work with the firmware we just haven't enabled
them in the i915 with GuC submission as this an optimization and not
required for functionality.

Matt

> Regards,
> 
> Tvrtko
> 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 993faa213b41..d30260ffe2a7 100644
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
> > @@ -1939,7 +1940,8 @@ static int __apply_priority(struct intel_context *ce, void *arg)
> >   	if (!intel_engine_has_timeslices(ce->engine))
> >   		return 0;
> > -	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
> > +	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> > +	    intel_engine_has_semaphores(ce->engine))
> >   		intel_context_set_use_semaphores(ce);
> >   	else
> >   		intel_context_clear_use_semaphores(ce);
> > 
