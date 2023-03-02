Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F72B6A814F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 12:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E42010E11F;
	Thu,  2 Mar 2023 11:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DA210E111;
 Thu,  2 Mar 2023 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677757084; x=1709293084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Awp1RaRtdeBZetWNq0LOyFMzCvS4VCcLxIz3PkIbqig=;
 b=c0Ac5/rRHFEOJk9A9L9gTmX4b2KZEwppk0LvQ3mFuotNuaBhcGb69hyV
 BuLRYhQtKotKBKEvKCX2l575WMFjNaE2GaiISLL1N457M2vzRJ+6deEQn
 cMSWZ7tngdhTieNIxVROdtEPgXicCRK+ae3vgadkuoU0CD57kSP9+DLXD
 2sAJVQR0en9aqudxwyrdC14HyMiLkDxVf8npRvEbOCEIKs77U6vH73Dfn
 zMEO6iUI3czQPpoeTrXtk//GBrdgqrhxOHt3TTskFP/7s7OQuc1EmQY6X
 tbAi/Hf9Z9LQBtTpLxV4sIex+Cvu1R4kiHHHorsVBOZ7sXzyPPSx0/Ajc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="334723478"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="334723478"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 03:33:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707380140"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="707380140"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.30.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 03:33:18 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/active: Fix misuse of non-idle barriers as
 fence trackers
Date: Thu, 02 Mar 2023 12:33:16 +0100
Message-ID: <45361712.fMDQidcC6G@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Y//w3T2BTr8rQt6z@ashyti-mobl2.lan>
References: <20230225221218.134254-1-janusz.krzysztofik@linux.intel.com>
 <Y//w3T2BTr8rQt6z@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for review.

On Thursday, 2 March 2023 01:42:05 CET Andi Shyti wrote:
> Hi Janusz,
> 
> On Sat, Feb 25, 2023 at 11:12:18PM +0100, Janusz Krzysztofik wrote:
> > Users reported oopses on list corruptions when using i915 perf with a
> > number of concurrently running graphics applications.  Root cause analysis
> > pointed at an issue in barrier processing code -- a race among perf open /
> > close replacing active barriers with perf requests on kernel context and
> > concurrent barrier preallocate / acquire operations performed during user
> > context first pin / last unpin.
> > 
> > When adding a request to a composite tracker, we try to reuse an existing
> > fence tracker, already allocated and registered with that composite.  The
> > tracker we obtain may already track another fence, may be an idle barrier,
> > or an active barrier.
> > 
> > If the tracker we get occurs a non-idle barrier then we try to delete that
> > barrier from a list of barrier tasks it belongs to.  However, while doing
> > that we don't respect return value from a function that performs the
> > barrier deletion.  Should the deletion ever failed, we would end up
> > reusing the tracker still registered as a barrier task.  Since the same
> > structure field is reused with both fence callback lists and barrier
> > tasks list, list corruptions would likely occur.
> > 
> > Barriers are now deleted from a barrier tasks list by temporarily removing
> > the list content, traversing that content with skip over the node to be
> > deleted, then populating the list back with the modified content.  Should
> > that intentionally racy concurrent deletion attempts be not serialized,
> > one or more of those may fail because of the list being temporary empty.
> > 
> > Related code that ignores the results of barrier deletion was initially
> > introduced in v5.4 by commit d8af05ff38ae ("drm/i915: Allow sharing the
> > idle-barrier from other kernel requests").  However, all users of the
> > barrier deletion routine were apparently serialized at that time, then the
> > issue didn't exhibit itself.  Results of git bisect with help of a newly
> > developed igt@gem_barrier_race@remote-request IGT test indicate that list
> > corruptions might start to appear after commit 311770173fac ("drm/i915/gt:
> > Schedule request retirement when timeline idles"), introduced in v5.5.
> > 
> > Respect results of barrier deletion attempts -- mark the barrier as idle
> > only if successfully deleted from the list.  Then, before proceeding with
> > setting our fence as the one currently tracked, make sure that the tracker
> > we've got is not a non-idle barrier.  If that check fails then don't use
> > that tracker but go back and try to acquire a new, usable one.
> > 
> > v2: no code changes,
> >   - blame commit 311770173fac ("drm/i915/gt: Schedule request retirement
> >     when timeline idles"), v5.5, not commit d8af05ff38ae ("drm/i915: Allow
> >     sharing the idle-barrier from other kernel requests"), v5.4,
> >   - reword commit description.
> 
> That's a very good explanation and very much needed for such a
> catch. Thanks!
> 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
> > Fixes: 311770173fac ("drm/i915/gt: Schedule request retirement when 
timeline idles")
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: stable@vger.kernel.org # v5.5
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_active.c | 25 ++++++++++++++-----------
> >  1 file changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/
i915_active.c
> > index 7412abf166a8c..f9282b8c87c1c 100644
> > --- a/drivers/gpu/drm/i915/i915_active.c
> > +++ b/drivers/gpu/drm/i915/i915_active.c
> > @@ -422,12 +422,12 @@ replace_barrier(struct i915_active *ref, struct 
i915_active_fence *active)
> >  	 * we can use it to substitute for the pending idle-barrer
> >  	 * request that we want to emit on the kernel_context.
> >  	 */
> > -	__active_del_barrier(ref, node_from_active(active));
> > -	return true;
> > +	return __active_del_barrier(ref, node_from_active(active));
> 
> In general, I support the idea of always checking the return
> value, even if we expect a certain outcome. In these cases, the
> likely/unlikely macros can be helpful. 

OK.

> Given this change, I
> believe the patch deserves an ack.
> 
> That being said, I was curious whether using an explicit lock
> and a normal list of active barriers, rather than a lockless
> list, could have solved the problem.  It seems like using a
> lockless list and iterating over it could be overkill, unless
> there are specific scenarios where the lockless properties are
> necessary.
> 
> Of course, this may be something to consider in a future cleanup,
> as it may be outside the scope of this particular patch.

Yes, I think so.

> 
> >  }
> >  
> >  int i915_active_add_request(struct i915_active *ref, struct i915_request 
*rq)
> >  {
> > +	u64 idx = i915_request_timeline(rq)->fence_context;
> >  	struct dma_fence *fence = &rq->fence;
> >  	struct i915_active_fence *active;
> >  	int err;
> > @@ -437,16 +437,19 @@ int i915_active_add_request(struct i915_active *ref, 
struct i915_request *rq)
> >  	if (err)
> >  		return err;
> >  
> > -	active = active_instance(ref, i915_request_timeline(rq)-
>fence_context);
> > -	if (!active) {
> > -		err = -ENOMEM;
> > -		goto out;
> > -	}
> > +	do {
> > +		active = active_instance(ref, idx);
> > +		if (!active) {
> > +			err = -ENOMEM;
> > +			goto out;
> > +		}
> > +
> > +		if (replace_barrier(ref, active)) {
> > +			RCU_INIT_POINTER(active->fence, NULL);
> > +			atomic_dec(&ref->count);
> > +		}
> > +	} while (is_barrier(active));
> 
> unlikely()?

OK, please expect v3 with this added.

Thanks,
Janusz

> 
> It's worth noting that for each iteration, we are rebuilding the
> list of barriers.  Therefore, I believe it may be necessary to
> perform a cleanup within the replace_barrier() function.
> 
> Thanks,
> Andi
> 
> >  
> > -	if (replace_barrier(ref, active)) {
> > -		RCU_INIT_POINTER(active->fence, NULL);
> > -		atomic_dec(&ref->count);
> > -	}
> >  	if (!__i915_active_fence_set(active, fence))
> >  		__i915_active_acquire(ref);
> >  
> 




