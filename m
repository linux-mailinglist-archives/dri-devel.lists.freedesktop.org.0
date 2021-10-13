Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94542C824
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BD26E0A5;
	Wed, 13 Oct 2021 17:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E486A6E0A5;
 Wed, 13 Oct 2021 17:56:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214435428"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214435428"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 10:56:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="480905360"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 10:56:17 -0700
Date: Wed, 13 Oct 2021 10:51:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH 23/26] drm/i915: Make request conflict tracking
 understand parallel submits
Message-ID: <20211013175133.GA34759@jons-linux-dev-box>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-24-matthew.brost@intel.com>
 <03661707-0416-93cd-94b5-1624f1a5e073@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03661707-0416-93cd-94b5-1624f1a5e073@intel.com>
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

On Tue, Oct 12, 2021 at 03:08:05PM -0700, John Harrison wrote:
> On 10/4/2021 15:06, Matthew Brost wrote:
> > If an object in the excl or shared slot is a composite fence from a
> > parallel submit and the current request in the conflict tracking is from
> > the same parallel context there is no need to enforce ordering as the
> > ordering already implicit. Make the request conflict tracking understand
> ordering already -> ordering is already
> 
> > this by comparing the parents parallel fence values and skipping the
> parents -> parent's
> 
> > conflict insertion if the values match.
> Presumably, this is to cope with the fact that the parallel submit fences do
> not look like regular submission fences. And hence the existing code that
> says 'new fence belongs to same context as old fence, so safe to ignore'
> does not work with parallel submission. However, this change does not appear
> to be adding parallel submit support to an existing 'same context' check. It
> seems to be a brand new check that does not exist for single submission.
> What makes parallel submit different? If we aren't skipping same context
> fences for single submits, why do we need it for parallel? Conversely, if we
> need it for parallel then why don't we need it for single?
> 
> And if the single submission version is simply somewhere else in the code,
> why do the parallel version here instead of at the same place?
> 
> John.
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
> >   1 file changed, 29 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index e9bfa32f9270..cf89624020ad 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -1325,6 +1325,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
> >   	return err;
> >   }
> > +static inline bool is_parallel_rq(struct i915_request *rq)
> > +{
> > +	return intel_context_is_parallel(rq->context);
> > +}
> > +
> > +static inline struct intel_context *request_to_parent(struct i915_request *rq)
> > +{
> > +	return intel_context_to_parent(rq->context);
> > +}
> > +
> > +static bool is_same_parallel_context(struct i915_request *to,
> > +				     struct i915_request *from)
> > +{
> > +	if (is_parallel_rq(to))
> Should this not say '&& is_parallel_rq(from)'?
> 

Missed this one. That isn't necessary as if from is not a parallel
submit the following compare of parents will always return false. I
could add if you insist as either way works.

Matt 

> > +		return request_to_parent(to) == request_to_parent(from);
> > +
> > +	return false;
> > +}
> > +
> >   int
> >   i915_request_await_execution(struct i915_request *rq,
> >   			     struct dma_fence *fence)
> > @@ -1356,11 +1375,14 @@ i915_request_await_execution(struct i915_request *rq,
> >   		 * want to run our callback in all cases.
> >   		 */
> > -		if (dma_fence_is_i915(fence))
> > +		if (dma_fence_is_i915(fence)) {
> > +			if (is_same_parallel_context(rq, to_request(fence)))
> > +				continue;
> >   			ret = __i915_request_await_execution(rq,
> >   							     to_request(fence));
> > -		else
> > +		} else {
> >   			ret = i915_request_await_external(rq, fence);
> > +		}
> >   		if (ret < 0)
> >   			return ret;
> >   	} while (--nchild);
> > @@ -1461,10 +1483,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
> >   						 fence))
> >   			continue;
> > -		if (dma_fence_is_i915(fence))
> > +		if (dma_fence_is_i915(fence)) {
> > +			if (is_same_parallel_context(rq, to_request(fence)))
> > +				continue;
> >   			ret = i915_request_await_request(rq, to_request(fence));
> > -		else
> > +		} else {
> >   			ret = i915_request_await_external(rq, fence);
> > +		}
> >   		if (ret < 0)
> >   			return ret;
> > @@ -1539,16 +1564,6 @@ i915_request_await_object(struct i915_request *to,
> >   	return ret;
> >   }
> > -static inline bool is_parallel_rq(struct i915_request *rq)
> > -{
> > -	return intel_context_is_parallel(rq->context);
> > -}
> > -
> > -static inline struct intel_context *request_to_parent(struct i915_request *rq)
> > -{
> > -	return intel_context_to_parent(rq->context);
> > -}
> > -
> >   static struct i915_request *
> >   __i915_request_ensure_parallel_ordering(struct i915_request *rq,
> >   					struct intel_timeline *timeline)
> 
