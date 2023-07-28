Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CC766E70
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91E910E160;
	Fri, 28 Jul 2023 13:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2426210E160;
 Fri, 28 Jul 2023 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690551010; x=1722087010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DHKl+8XeoqWJOK/F6KzbFpY2fubaofH6zYa935DKfgs=;
 b=FzdsXr4m2YxNsz2ZV03kIV34U/PTpB4YvCnqQh7s+YdKyDJSJ0jUoN9D
 7etR5YN2x2al8UvXYXn/qTJGqqLIF8wCKbYG51QGYjfJktbL4NRG00p22
 l2JzbZ6pJPnLfg1bwHyfBBs8aLIMoTbGMjfQydLYRMkbuSptnKwgLK2V3
 bo7d8UHzSlQVXmPVbpoul+DccjERRk68p/ZNDOeTZMLBJQ8HeSBg3rb35
 ngtD1Z9GCbeu+ehIYJyUyD14BtAqT2Jf7rMgW/LockE+RaK6JSz6TGZxl
 i+64pwP/+O9HJY7A407/CtpX32TDg83HlF3prp5y7ZWAk6lujJORL35IV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368605884"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="368605884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 06:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901284000"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="901284000"
Received: from eshiryae-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.60.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 06:30:05 -0700
Date: Fri, 28 Jul 2023 15:30:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915: Fix premature release of request's reusable
 memory
Message-ID: <ZMPC22KH2Nb7CWuo@ashyti-mobl2.lan>
References: <20230720093543.832147-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720093543.832147-2-janusz.krzysztofik@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Thu, Jul 20, 2023 at 11:35:44AM +0200, Janusz Krzysztofik wrote:
> Infinite waits for completion of GPU activity have been observed in CI,
> mostly inside __i915_active_wait(), triggered by igt@gem_barrier_race or
> igt@perf@stress-open-close.  Root cause analysis, based of ftrace dumps
> generated with a lot of extra trace_printk() calls added to the code,
> revealed loops of request dependencies being accidentally built,
> preventing the requests from being processed, each waiting for completion
> of another one's activity.
> 
> After we substitute a new request for a last active one tracked on a
> timeline, we set up a dependency of our new request to wait on completion
> of current activity of that previous one.  While doing that, we must take
> care of keeping the old request still in memory until we use its
> attributes for setting up that await dependency, or we can happen to set
> up the await dependency on an unrelated request that already reuses the
> memory previously allocated to the old one, already released.  Combined
> with perf adding consecutive kernel context remote requests to different
> user context timelines, unresolvable loops of await dependencies can be
> built, leading do infinite waits.
> 
> We obtain a pointer to the previous request to wait upon when we
> substitute it with a pointer to our new request in an active tracker,
> e.g. in intel_timeline.last_request.  In some processing paths we protect
> that old request from being freed before we use it by getting a reference
> to it under RCU protection, but in others, e.g.  __i915_request_commit()
> -> __i915_request_add_to_timeline() -> __i915_request_ensure_ordering(),
> we don't.  But anyway, since the requests' memory is SLAB_FAILSAFE_BY_RCU,
> that RCU protection is not sufficient against reuse of memory.
> 
> We could protect i915_request's memory from being prematurely reused by
> calling its release function via call_rcu() and using rcu_read_lock()
> consequently, as proposed in v1.  However, that approach leads to
> significant (up to 10 times) increase of SLAB utilization by i915_request
> SLAB cache.  Another potential approach is to take a reference to the
> previous active fence.
> 
> When updating an active fence tracker, we first lock the new fence,
> substitute a pointer of the current active fence with the new one, then we
> lock the substituted fence.  With this approach, there is a time window
> after the substitution and before the lock when the request can be
> concurrently released by an interrupt handler and its memory reused, then
> we may happen to lock and return a new, unrelated request.
> 
> Always get a reference to the current active fence first, before
> replacing it with a new one.  Having it protected from premature release
> and reuse, lock it and then replace with the new one but only if not
> yet signalled via a potential concurrent interrupt nor replaced with
> another one by a potential concurrent thread, otherwise retry, starting
> from getting a reference to the new current one.  Adjust users to not
> get a reference to the previous active fence themselves and always put the
> reference got by __i915_active_fence_set() when no longer needed.
> 
> v3: Fix lockdep splat reports and other issues caused by incorrect use of
>     try_cmpxchg() (use (cmpxchg() != prev) instead)
> v2: Protect request's memory by getting a reference to it in favor of
>     delegating its release to call_rcu() (Chris)
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8211
> Fixes: df9f85d8582e ("drm/i915: Serialise i915_active_fence_set() with itself")
> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.6+

thanks for the offline clarification on this! It's another good
catch of yours :)

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thank you!
Andi
