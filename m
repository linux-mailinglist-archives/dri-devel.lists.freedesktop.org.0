Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B92E637588
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A2210E6BA;
	Thu, 24 Nov 2022 09:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57510E6BF;
 Thu, 24 Nov 2022 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669283345; x=1700819345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5nqwP74Xj8YI6Z6aeEp89v3bOKulSwTBcOFdpyY6vQk=;
 b=KLiGoNu7uFZ6xXzfU6yhq9ZWUZUCUqU5ITSD63gUE3jTAYJEsGjpS6Ji
 PIVhhDWKs0J74ukFDcYUqT4TBO1HtNNJWdJ+cevnOzOTJU97HcUk66DD8
 M9PyscHYknJ4AEz7AieVhmLq4mXUfvNcHzFPU5GLneYz2CNp1q580BVRC
 ccl79bx0AdLAm/eQ3PC+3WmpnyUY67aw/VpSjlJ2IDST2el38p8tXkEA8
 jIPakOcy1XA4/QTWoiuK+DXQahw/48mAVIzeh0MrOKptkQFWt0e+jfYvp
 ID9gWLnUhazV/WSBNn7Rot0AFkD+OpChzFwcVOVQOXkqr9SvQtEj4LMp7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="301827531"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="301827531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 01:49:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="748174836"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; d="scan'208";a="748174836"
Received: from psidor-mobl.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.ger.corp.intel.com) ([10.213.2.209])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 01:49:02 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 2/2] drm/i915: Never return 0 if not all requests
 retired
Date: Wed, 23 Nov 2022 17:21:08 +0100
Message-ID: <1880834.taCxCBeP46@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b1f9851e-b8c9-6b53-2d21-a5a5eb37749c@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <9026056.CDJkKcVGEf@jkrzyszt-mobl1.ger.corp.intel.com>
 <b1f9851e-b8c9-6b53-2d21-a5a5eb37749c@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 23 November 2022 13:57:26 CET Tvrtko Ursulin wrote:
> 
> On 23/11/2022 09:28, Janusz Krzysztofik wrote:
> > Hi Tvrtko,
> > 
> > Thanks for your comments.
> > 
> > On Tuesday, 22 November 2022 11:50:38 CET Tvrtko Ursulin wrote:
> >>
> >> On 21/11/2022 14:56, Janusz Krzysztofik wrote:
> >>> Users of intel_gt_retire_requests_timeout() expect 0 return value on
> >>> success.  However, we have no protection from passing back 0 potentially
> >>> returned by a call to dma_fence_wait_timeout() when it succedes right
> >>> after its timeout has expired.
> >>
> >> Is this talking about a potential weakness, or ambiguous kerneldoc, of
> >> dma_fence_wait_timeout, dma_fence_default_wait and
> >> i915_request_wait_timeout? They appear to say 0 return means timeout,
> >> implying unsignaled fence. In other words signaled must return positive
> >> remaining timeout. Implementations seems to allow a race which indeed
> >> appears that return 0 and signaled fence is possible.
> > 
> > While my initial analysis was indeed focused on inconsistent semantics of 0
> > return values from different dma_fence_default_wait() backends, I should have
> > also mentioned in this commit description that users may perfectly
> > call intel_gt_retire_requests_timeout() with 0 timeout, in which case the
> > false positive 0 value can be returned regardless of dma_fence_wait_timeout()
> > potential issues.  Would you like me to reword and resubmit?
> 
> Not sure yet.
> 
> So the only caller which passes in zero to 
> intel_gt_retire_requests_timeout appears to be intel_gt_retire_requests 
> and it eats the return value anyway so this patch is immaterial for that 
> one.

Right.

> I guess it can change how intel_gt_wait_for_idle behaves with short-ish 
> timeouts. In case this race is hit. But then wouldn't it make sense to 
> follow up with a patch which addresses this race by re-checking the "is 
> signaled" when timeout expires, 

But inside intel_gt_retire_requests_timeout() we generally don't care if 
fences have been signaled.  As long as user requested timeout hasn't expired, 
we use dma_fence_wait_timeout() as an aid, otherwise we keep trying to retire 
requests without waiting on fences. If the retirement succeeds then we return 
0 (success) regardless of what the return value from the last called 
dma_fence_wait_timeout() was.  If it was 0 then the only useful information is 
that no more time has been left, and no matter if that 0 meant signaled or not 
signaled, we must return an error if there are still some requests not 
retired, I believe.

> either in dma_fence_wait_timeout, or to 
> intel_gt_retire_requests_timeout. Or if not that at least better 
> document the dma_fence_wait_timeout and/or 
> intel_gt_retire_requests_timeout. Makes sense?

Documenting -- yes, as soon as we get into an agreement on what's the core of 
this issue -- whether that potential weakness, or ambiguous kerneldoc, of 
dma_fence_wait_timeout, dma_fence_default_wait and i915_request_wait_timeout, 
as you've stated, that we have to address somehow, or potentially incorrect 
direct use of the timeout variable, intended for storing time left to spend on 
fence waits, as our return value when timeout has expired.  And if the former 
then maybe we should also try to finally resolve that over a year old conflict 
(whether 0 means signaled on not signaled) inside our implementation of 
dma_fence_ops.wait, and simply use a wrapper around it for either our internal 
use if we decide to follow the reference implementation, or for dma_fence_ops 
use otherwise.  Or maybe the reference implementation should be fixed if 
problematic.  I don't feel competent enough to decide.

Thanks,
Janusz
 
> 
> Regards,
> 
> Tvrtko
> 
> > 
> >> If dma_fence_wait can indeed return 0 even when a request is signaled,
> >> then how is timeout ?: -ETIME below correct? It isn't a chance for false
> >> negative in its' callers?
> > 
> > The goal of intel_gt_retire_requests_timeout() is to retire requests.  When
> > that goal has been reached, i.e., all requests have been retired, active count
> > is 0, and 0 is correctly returned, regardless of timeout value.
> > 
> > The value of timeout is used only when there are still pending requests, which
> > means that the goal hasn't been reached and the function hasn't succeeded.
> > Then, no false negative is possible, unlike the false positive that we now
> > have when we return 0  while some requests are still pending.
> > 
> > Thanks,
> > Janusz
> > 
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>> Replace 0 with -ETIME before potentially using the timeout value as return
> >>> code, so -ETIME is returned if there are still some requests not retired
> >>> after timeout, 0 otherwise.
> >>>
> >>> v3: Use conditional expression, more compact but also better reflecting
> >>>       intention standing behind the change.
> >>>
> >>> v2: Move the added lines down so flush_submission() is not affected.
> >>>
> >>> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
> >>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> >>> Cc: stable@vger.kernel.org # v5.5+
> >>> ---
> >>>    drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >>> index edb881d756309..1dfd01668c79c 100644
> >>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> >>> @@ -199,7 +199,7 @@ out_active:	spin_lock(&timelines->lock);
> >>>    	if (remaining_timeout)
> >>>    		*remaining_timeout = timeout;
> >>>    
> >>> -	return active_count ? timeout : 0;
> >>> +	return active_count ? timeout ?: -ETIME : 0;
> >>>    }
> >>>    
> >>>    static void retire_work_handler(struct work_struct *work)
> >>
> > 
> > 
> > 
> > 
> 




