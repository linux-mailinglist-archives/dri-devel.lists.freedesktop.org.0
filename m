Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46C3F61F8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 17:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172DF89A8B;
	Tue, 24 Aug 2021 15:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF9A89A88;
 Tue, 24 Aug 2021 15:47:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217343213"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="217343213"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 08:47:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="425509683"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 08:47:52 -0700
Date: Tue, 24 Aug 2021 08:42:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 13/27] drm/i915/guc: Take context ref when cancelling
 request
Message-ID: <20210824154241.GA9672@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-14-matthew.brost@intel.com>
 <d25c1702-f529-8601-dd1c-ca0ac59d5f5b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25c1702-f529-8601-dd1c-ca0ac59d5f5b@intel.com>
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

On Fri, Aug 20, 2021 at 05:07:27PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > A context can get destroyed after cancelling a request so take a
> > reference to context when cancelling a request.
> 
> What's the exact race? AFAICS __i915_request_skip does not have a
> context_put().

This commit message isn't quite right, it is really a context reset or a
GT reset which could result in the context getting destroyed. I haven't
actually seen this happen but this just being paranoid about ref
counting. Can fix up the commit message.

Matt

> 
> Daniele
> 
> > 
> > Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index e0e85e4ad512..85f96d325048 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1620,8 +1620,10 @@ static void guc_context_cancel_request(struct intel_context *ce,
> >   				       struct i915_request *rq)
> >   {
> >   	if (i915_sw_fence_signaled(&rq->submit)) {
> > -		struct i915_sw_fence *fence = guc_context_block(ce);
> > +		struct i915_sw_fence *fence;
> > +		intel_context_get(ce);
> > +		fence = guc_context_block(ce);
> >   		i915_sw_fence_wait(fence);
> >   		if (!i915_request_completed(rq)) {
> >   			__i915_request_skip(rq);
> > @@ -1636,6 +1638,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
> >   		flush_work(&ce_to_guc(ce)->ct.requests.worker);
> >   		guc_context_unblock(ce);
> > +		intel_context_put(ce);
> >   	}
> >   }
> 
