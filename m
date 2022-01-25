Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02649B8F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEE110E182;
	Tue, 25 Jan 2022 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8894A10E182;
 Tue, 25 Jan 2022 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643129095; x=1674665095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z/iaEkmhpSWAkU78SvIXgSc3HqJPuegQjaQLktjuSeQ=;
 b=Rp735gPIudn7X+5JnjBcvu6sG3nAOtNs3tks4p4KBt3S6XPGK369v++K
 5PCOk76oo5rqXK8JnfLlWd8A8ZqKG8VZbmbM4MWKlYvLEdsimS9FB6pPe
 2dN6Ckb1zMXUfGalf5YtBAoitiZOXqGwPnhcKN3j1mIUbg4V1lfeye2Nd
 UFoUZJUPO9szVtjl5ErytCh1XmoeKvgvMd6IeKFzZkbfVLP72JNIipssG
 rS4wlb2T4qWS51m3E2YNPn0TISUxXrpP6PBhgpnQ7141vbkvMQETJgAuL
 BKVYFeJZxU4yjZYT3JuCS7FTTmBs8y6WjczcsEPODHoJ53IAtDhPzPvzh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="229923182"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="229923182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 08:44:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="495053425"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 08:44:54 -0800
Date: Tue, 25 Jan 2022 08:39:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add request cancel low level
 trace point
Message-ID: <20220125163911.GA20056@jons-linux-dev-box>
References: <20220124150157.15758-1-matthew.brost@intel.com>
 <20220124150157.15758-2-matthew.brost@intel.com>
 <fec72cb6-a008-103e-0f7b-5d6fec548618@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec72cb6-a008-103e-0f7b-5d6fec548618@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 12:27:43PM +0000, Tvrtko Ursulin wrote:
> 
> On 24/01/2022 15:01, Matthew Brost wrote:
> > Add request cancel trace point guarded by
> > CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINT.
> 
> Okay-ish I guess (There is pr_notice with the only real caller, but I
> suppose you want it for selftests? Oh yes, why is missing from the commit
> message.), but I'd emit it from i915_request_cancel since that's what the
> tracepoint is called so it fits.
> 

I had this tracepoint at one point but somehow during the upstreaming it
got lost. Noticed when debugging the below issue this tracepoint wasn't
present, so I brought it back in.

I generally use low level tracepoints for debug, so a pr_notice doesn't
really help there.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/4960

Matt

> Regards,
> 
> Tvrtko
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.h |  1 +
> >   drivers/gpu/drm/i915/i915_trace.h       | 10 ++++++++++
> >   2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index d8c74bbf9aae2..3aed4d77f116c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -124,6 +124,7 @@ intel_context_is_pinned(struct intel_context *ce)
> >   static inline void intel_context_cancel_request(struct intel_context *ce,
> >   						struct i915_request *rq)
> >   {
> > +	trace_i915_request_cancel(rq);
> >   	GEM_BUG_ON(!ce->ops->cancel_request);
> >   	return ce->ops->cancel_request(ce, rq);
> >   }
> > diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> > index 37b5c9e9d260e..d0a11a8bb0ca3 100644
> > --- a/drivers/gpu/drm/i915/i915_trace.h
> > +++ b/drivers/gpu/drm/i915/i915_trace.h
> > @@ -324,6 +324,11 @@ DEFINE_EVENT(i915_request, i915_request_add,
> >   );
> >   #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
> > +DEFINE_EVENT(i915_request, i915_request_cancel,
> > +	     TP_PROTO(struct i915_request *rq),
> > +	     TP_ARGS(rq)
> > +);
> > +
> >   DEFINE_EVENT(i915_request, i915_request_guc_submit,
> >   	     TP_PROTO(struct i915_request *rq),
> >   	     TP_ARGS(rq)
> > @@ -497,6 +502,11 @@ DEFINE_EVENT(intel_context, intel_context_do_unpin,
> >   #else
> >   #if !defined(TRACE_HEADER_MULTI_READ)
> > +static inline void
> > +trace_i915_request_cancel(struct i915_request *rq)
> > +{
> > +}
> > +
> >   static inline void
> >   trace_i915_request_guc_submit(struct i915_request *rq)
> >   {
> > 
