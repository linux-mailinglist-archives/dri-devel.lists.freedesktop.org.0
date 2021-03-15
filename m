Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB833C475
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 18:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2EB89BA1;
	Mon, 15 Mar 2021 17:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69C089B83;
 Mon, 15 Mar 2021 17:37:37 +0000 (UTC)
IronPort-SDR: K9UgiRdS2kII9wgRb5CHdvUZwy+fRv1p3Te6fKW9MIOKf8HD+ty5JpKBOITOLbzWr25yGNrpax
 +JCaqpWIgfLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="253145086"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="253145086"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 10:37:30 -0700
IronPort-SDR: UUKWLrxjTtPBIjOrau4PRYNquqj3qpWP3OsBwDyksrGE1d8ne2iW8D5JFnj6LpbZpixlmNaX4/
 S0PUgYlNuaXQ==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="411919802"
Received: from voelkem-mobl1.amr.corp.intel.com (HELO [10.252.51.135])
 ([10.252.51.135])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 10:37:29 -0700
Subject: Re: [Intel-gfx] [RFC 1/6] drm/i915: Individual request cancellation
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
 <20210312154622.1767865-2-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f361804a-2c51-77ee-dbb4-0caba6bfffd0@linux.intel.com>
Date: Mon, 15 Mar 2021 17:37:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312154622.1767865-2-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/03/2021 15:46, Tvrtko Ursulin wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Currently, we cancel outstanding requests within a context when the
> context is closed. We may also want to cancel individual requests using
> the same graceful preemption mechanism.
> 
> v2 (Tvrtko):
>   * Cancel waiters carefully considering no timeline lock and RCU.
>   * Fixed selftests.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

[snip]

> +void i915_request_cancel(struct i915_request *rq, int error)
> +{
> +	if (!i915_request_set_error_once(rq, error))
> +		return;
> +
> +	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
> +
> +	if (i915_sw_fence_signaled(&rq->submit)) {
> +		struct i915_dependency *p;
> +
> +restart:
> +		rcu_read_lock();
> +		for_each_waiter(p, rq) {
> +			struct i915_request *w =
> +				container_of(p->waiter, typeof(*w), sched);
> +
> +			if (__i915_request_is_complete(w) ||
> +			    fatal_error(w->fence.error))
> +				continue;
> +
> +			w = i915_request_get(w);
> +			rcu_read_unlock();
> +			/* Recursion bound by the number of engines */
> +			i915_request_cancel(w, error);
> +			i915_request_put(w);
> +
> +			/* Restart after having to drop rcu lock. */
> +			goto restart;
> +		}

So I need to fix this error propagation to waiters in order to avoid 
potential stack overflow caught in shards (gem_ctx_ringsize).

Or alternatively we decide not to propagate fence errors. Not sure that 
consequences either way are particularly better or worse. Things will 
break anyway since what userspace inspects for unexpected fence errors?!

So rendering corruption more or less. Can it cause a further stream of 
GPU hangs I am not sure. Only if there is a inter-engine data dependency 
involving data more complex than images/textures.

Regards,

Tvrtko

> +		rcu_read_unlock();
> +	}
> +
> +	__cancel_request(rq);
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
