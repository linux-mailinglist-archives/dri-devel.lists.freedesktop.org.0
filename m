Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDF409A34
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7B6E20F;
	Mon, 13 Sep 2021 16:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082556E1F4;
 Mon, 13 Sep 2021 16:59:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="201242482"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="201242482"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:59:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="515517327"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:59:30 -0700
Date: Mon, 13 Sep 2021 09:54:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 07/27] drm/i915/guc: Don't call
 switch_to_kernel_context with GuC submission
Message-ID: <20210913165430.GA8862@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-8-matthew.brost@intel.com>
 <7b0f2535-a0f7-e423-d929-63f31febee14@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b0f2535-a0f7-e423-d929-63f31febee14@intel.com>
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

On Thu, Sep 09, 2021 at 03:51:27PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Calling switch_to_kernel_context isn't needed if the engine PM reference
> > is taken while all contexts are pinned. By not calling
> > switch_to_kernel_context we save on issuing a request to the engine.
> I thought the intention of the switch_to_kernel was to ensure that the GPU
> is not touching any user context and is basically idle. That is not a valid
> assumption with an external scheduler such as GuC. So why is the description
> above only mentioning PM references? What is the connection between the PM
> ref and the switch_to_kernel?
> 
> Also, the comment in the code does not mention anything about PM references,
> it just says 'not necessary with GuC' but no explanation at all.
> 

Yea, this need to be explained better. How about this?

Calling switch_to_kernel_context isn't needed if the engine PM reference
is take while all user contexts have scheduling enabled. Once scheduling
is disabled on all user contexts the GuC is guaranteed to not touch any
user context state which is effectively the same pointing to a kernel
context.

Matt

> 
> > v2:
> >   (Daniel Vetter)
> >    - Add FIXME comment about pushing switch_to_kernel_context to backend
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > index 1f07ac4e0672..11fee66daf60 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > @@ -162,6 +162,15 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
> >   	unsigned long flags;
> >   	bool result = true;
> > +	/*
> > +	 * No need to switch_to_kernel_context if GuC submission
> > +	 *
> > +	 * FIXME: This execlists specific backend behavior in generic code, this
> "This execlists" -> "This is execlist"
> 
> "this should be" -> "it should be"
> 
> John.
> 
> > +	 * should be pushed to the backend.
> > +	 */
> > +	if (intel_engine_uses_guc(engine))
> > +		return true;
> > +
> >   	/* GPU is pointing to the void, as good as in the kernel context. */
> >   	if (intel_gt_is_wedged(engine->gt))
> >   		return true;
> 
