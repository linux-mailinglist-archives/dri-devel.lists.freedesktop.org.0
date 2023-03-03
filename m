Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54B6A96B7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 12:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0C810E5B4;
	Fri,  3 Mar 2023 11:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC32A10E5B4;
 Fri,  3 Mar 2023 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677844245; x=1709380245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CrJjcmhCn/ozrp0NoWBDZFvbV+gZWUQZ0pQSw+FqfJ0=;
 b=TALY6Apdpf1Nj5eZIyJKdgYjQG6hwfsMLY2SzDmom6TIf4grSnbvbgt8
 kmCoPphXFbiqNERIvrUlisbekQ1Gkm/c4kiCwp31wG5gDVHYONZukFdYF
 NW0DEnokAFm5Fj8J1Hp6mlmS7r3W2zipvX6Ne3l6RD65Zl6JwfOUZI9h1
 qk5eoiSFnS8/HKK5rHxKrcjZvEv8hGINqUzAW3Lk2endocmaERvdCet+u
 vsrP42879AE6R32IsELXf8kfFqMZ1GXvaPdrBkk5n33b3dOUQ4YGFm4Gp
 1KUi+tf/a2wATwLK+YyBBpggr04xGgsf8B+Zw77WNoS4iY5mdtEfxKaIj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399832150"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="399832150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 03:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="707800197"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="707800197"
Received: from mavainol-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.100])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 03:50:43 -0800
Date: Fri, 3 Mar 2023 12:50:40 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/active: Fix misuse of non-idle barriers as
 fence trackers
Message-ID: <ZAHfEGFojPh1mg4D@ashyti-mobl2.lan>
References: <20230302120820.48740-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302120820.48740-1-janusz.krzysztofik@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

Pushed to drm-intel-gt-next.

Thanks,
Andi

On Thu, Mar 02, 2023 at 01:08:20PM +0100, Janusz Krzysztofik wrote:
> Users reported oopses on list corruptions when using i915 perf with a
> number of concurrently running graphics applications.  Root cause analysis
> pointed at an issue in barrier processing code -- a race among perf open /
> close replacing active barriers with perf requests on kernel context and
> concurrent barrier preallocate / acquire operations performed during user
> context first pin / last unpin.
> 
> When adding a request to a composite tracker, we try to reuse an existing
> fence tracker, already allocated and registered with that composite.  The
> tracker we obtain may already track another fence, may be an idle barrier,
> or an active barrier.
> 
> If the tracker we get occurs a non-idle barrier then we try to delete that
> barrier from a list of barrier tasks it belongs to.  However, while doing
> that we don't respect return value from a function that performs the
> barrier deletion.  Should the deletion ever fail, we would end up reusing
> the tracker still registered as a barrier task.  Since the same structure
> field is reused with both fence callback lists and barrier tasks list,
> list corruptions would likely occur.
> 
> Barriers are now deleted from a barrier tasks list by temporarily removing
> the list content, traversing that content with skip over the node to be
> deleted, then populating the list back with the modified content.  Should
> that intentionally racy concurrent deletion attempts be not serialized,
> one or more of those may fail because of the list being temporary empty.
> 
> Related code that ignores the results of barrier deletion was initially
> introduced in v5.4 by commit d8af05ff38ae ("drm/i915: Allow sharing the
> idle-barrier from other kernel requests").  However, all users of the
> barrier deletion routine were apparently serialized at that time, then the
> issue didn't exhibit itself.  Results of git bisect with help of a newly
> developed igt@gem_barrier_race@remote-request IGT test indicate that list
> corruptions might start to appear after commit 311770173fac ("drm/i915/gt:
> Schedule request retirement when timeline idles"), introduced in v5.5.
> 
> Respect results of barrier deletion attempts -- mark the barrier as idle
> only if successfully deleted from the list.  Then, before proceeding with
> setting our fence as the one currently tracked, make sure that the tracker
> we've got is not a non-idle barrier.  If that check fails then don't use
> that tracker but go back and try to acquire a new, usable one.
> 
> v3: use unlikely() to document what outcome we expect (Andi),
>   - fix bad grammar in commit description.
> v2: no code changes,
>   - blame commit 311770173fac ("drm/i915/gt: Schedule request retirement
>     when timeline idles"), v5.5, not commit d8af05ff38ae ("drm/i915: Allow
>     sharing the idle-barrier from other kernel requests"), v5.4,
>   - reword commit description.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
> Fixes: 311770173fac ("drm/i915/gt: Schedule request retirement when timeline idles")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: stable@vger.kernel.org # v5.5
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_active.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index 7412abf166a8c..a9fea115f2d26 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -422,12 +422,12 @@ replace_barrier(struct i915_active *ref, struct i915_active_fence *active)
>  	 * we can use it to substitute for the pending idle-barrer
>  	 * request that we want to emit on the kernel_context.
>  	 */
> -	__active_del_barrier(ref, node_from_active(active));
> -	return true;
> +	return __active_del_barrier(ref, node_from_active(active));
>  }
>  
>  int i915_active_add_request(struct i915_active *ref, struct i915_request *rq)
>  {
> +	u64 idx = i915_request_timeline(rq)->fence_context;
>  	struct dma_fence *fence = &rq->fence;
>  	struct i915_active_fence *active;
>  	int err;
> @@ -437,16 +437,19 @@ int i915_active_add_request(struct i915_active *ref, struct i915_request *rq)
>  	if (err)
>  		return err;
>  
> -	active = active_instance(ref, i915_request_timeline(rq)->fence_context);
> -	if (!active) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> +	do {
> +		active = active_instance(ref, idx);
> +		if (!active) {
> +			err = -ENOMEM;
> +			goto out;
> +		}
> +
> +		if (replace_barrier(ref, active)) {
> +			RCU_INIT_POINTER(active->fence, NULL);
> +			atomic_dec(&ref->count);
> +		}
> +	} while (unlikely(is_barrier(active)));
>  
> -	if (replace_barrier(ref, active)) {
> -		RCU_INIT_POINTER(active->fence, NULL);
> -		atomic_dec(&ref->count);
> -	}
>  	if (!__i915_active_fence_set(active, fence))
>  		__i915_active_acquire(ref);
>  
> -- 
> 2.25.1
